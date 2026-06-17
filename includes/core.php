<?php
declare(strict_types=1);

// Load configuration and unified database class
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../classes/database.php';

// ── Unified DB Singleton ─────────────────────────────────────
function db(): PDO {
    return Database::getInstance()->pdo;
}

function qAll(string $sql, array $p = []): array {
    $s = db()->prepare($sql); $s->execute($p); return $s->fetchAll();
}
function qOne(string $sql, array $p = []) {
    $s = db()->prepare($sql); $s->execute($p); return $s->fetch();
}
function qRun(string $sql, array $p = []): \PDOStatement {
    $s = db()->prepare($sql); $s->execute($p); return $s;
}
function lastId(): string { return db()->lastInsertId(); }

// ── Auto-create grade_change_requests table if missing ───────
(function() {
    try {
        db()->exec("CREATE TABLE IF NOT EXISTS `grade_change_requests` (
          `id`            int(11)                               NOT NULL AUTO_INCREMENT,
          `enrollment_id` int(11)                               NOT NULL,
          `criterion_id`  int(11)                               NOT NULL,
          `old_score`     decimal(5,2)                          NOT NULL,
          `new_score`     decimal(5,2)                          NOT NULL,
          `reason`        text                                  NOT NULL,
          `requested_by`  int(11)                               NOT NULL,
          `requested_at`  timestamp                             NOT NULL DEFAULT current_timestamp(),
          `status`        enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
          `reviewed_by`   int(11)                               DEFAULT NULL,
          `reviewed_at`   timestamp                             NULL DEFAULT NULL,
          `review_note`   text                                  DEFAULT NULL,
          PRIMARY KEY (`id`),
          KEY `enrollment_id` (`enrollment_id`),
          KEY `criterion_id`  (`criterion_id`),
          KEY `requested_by`  (`requested_by`),
          KEY `reviewed_by`   (`reviewed_by`),
          KEY `status`        (`status`),
          CONSTRAINT `gcr_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`),
          CONSTRAINT `gcr_ibfk_2` FOREIGN KEY (`criterion_id`)  REFERENCES `rubric_criteria`     (`id`),
          CONSTRAINT `gcr_ibfk_3` FOREIGN KEY (`requested_by`)  REFERENCES `users`               (`id`),
          CONSTRAINT `gcr_ibfk_4` FOREIGN KEY (`reviewed_by`)   REFERENCES `users`               (`id`) ON DELETE SET NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
    } catch (Exception $e) { /* silent — table may already exist */ }
})();

// ── Auth helpers ─────────────────────────────────────────────
function isLoggedIn(): bool  { return !empty($_SESSION['user_id']); }
function role(): ?string     { return $_SESSION['role'] ?? null; }
function uid(): int          { return (int)($_SESSION['user_id'] ?? 0); }
function fullName(): string  { return $_SESSION['full_name'] ?? ''; }
function requireLogin(): void {
    if (!isLoggedIn()) { header('Location: index.php?page=login'); exit; }
}
function requireRole(string ...$roles): void {
    requireLogin();
    if (!in_array(role(), $roles, true)) { header('Location: index.php?page=dashboard'); exit; }
}

// ── Audit log ────────────────────────────────────────────────
function auditLog(string $action, ?string $table=null, $recId=null, ?string $details=null): void {
    try {
        qRun("INSERT INTO audit_logs (user_id,action,table_name,record_id,details,ip_address) VALUES (?,?,?,?,?,?)",
            [uid(),$action,$table,$recId,$details,$_SERVER['REMOTE_ADDR']??'127.0.0.1']);
    } catch(Exception $e){}
}


function ledgerRecord(
    int $eid,
    int $cid,
    float $score,
    string $action,
    int $gradedBy,
    ?float $previousScore = null,
    ?int $approvedBy = null,
    ?int $requestId  = null
): void {
    // Acquire a named advisory lock to prevent concurrent ledger writes (race condition fix)
    $lock = qOne("SELECT GET_LOCK('score_ledger_lock', 10) as locked");
    if (!$lock || (int)$lock['locked'] !== 1) {
        throw new Exception("Unable to acquire ledger lock. Please try again.");
    }

    try {
        $last     = qOne("SELECT current_hash FROM score_ledger ORDER BY id DESC LIMIT 1");
        $prevHash = $last ? $last['current_hash'] : str_repeat('0', 64);

        $snap = json_encode([
            'enrollment_id'  => $eid,
            'criterion_id'   => $cid,
            'score'          => $score,
            'previous_score' => $previousScore,
            'action'         => $action,
            'graded_by'      => $gradedBy,
            'approved_by'    => $approvedBy,   // null = direct entry by admin/lecturer
            'change_request' => $requestId,    // null = no approval workflow used
            'timestamp'      => date('Y-m-d H:i:s'),
        ]);
        $curHash = hash('sha256', $snap . $prevHash);

        qRun(
            "INSERT INTO score_ledger
             (enrollment_id, criterion_id, score, data_snapshot, action, graded_by, previous_hash, current_hash)
             VALUES (?,?,?,?,?,?,?,?)",
            [$eid, $cid, $score, $snap, $action, $gradedBy, $prevHash, $curHash]
        );
    } finally {
        qRun("SELECT RELEASE_LOCK('score_ledger_lock')");
    }

    $detail = "enrollment=$eid criterion=$cid score=$score prev_score=" . ($previousScore === null ? 'NULL' : $previousScore);
    if ($approvedBy !== null) {
        $detail .= " approved_by=$approvedBy request_id=$requestId";
    }
    auditLog('LEDGER_' . $action, 'score_ledger', null, $detail);
}

function ledgerVerify(): array {
    $entries = qAll("SELECT * FROM score_ledger ORDER BY id ASC");
    $violations = [];
    $prev = str_repeat('0', 64);
    $expectedScores = [];

    foreach ($entries as $e) {
        // Check 1: Chain continuity
        if ($e['previous_hash'] !== $prev) {
            $violations[] = [
                'ledger_id' => $e['id'],
                'type'      => 'CHAIN_BREAK',
                'message'   => "Chain broken at Ledger #" . $e['id'] . " — previous_hash does not match previous entry",
                'expected'  => substr($prev, 0, 20) . '...',
                'found'     => substr($e['previous_hash'], 0, 20) . '...',
            ];
        }
        // Check 2: Hash integrity — recompute SHA256(snapshot + prev_hash)
        $recomp = hash('sha256', $e['data_snapshot'] . $e['previous_hash']);
        if ($recomp !== $e['current_hash']) {
            $violations[] = [
                'ledger_id' => $e['id'],
                'type'      => 'HASH_TAMPER',
                'message'   => "Hash mismatch at Ledger #" . $e['id'] . "  data_snapshot or current_hash was modified",
                'expected'  => substr($recomp, 0, 20) . '...',
                'found'     => substr($e['current_hash'], 0, 20) . '...',
            ];
        }
        // Check 3: Score column vs snapshot  catches direct phpMyAdmin edit of score column
        $snap = json_decode($e['data_snapshot'], true);
        if (is_array($snap) && isset($snap['score'])) {
            if (abs((float)$snap['score'] - (float)$e['score']) > 0.001) {
                $violations[] = [
                    'ledger_id' => $e['id'],
                    'type'      => 'SCORE_TAMPER',
                    'message'   => "Score tampered at Ledger #" . $e['id'] . "  score column changed from " . $snap['score'] . " to " . $e['score'] . " without updating hash",
                    'expected'  => (string)$snap['score'],
                    'found'     => (string)$e['score'],
                ];
            }
        }

        // Note: expectedScores accumulates state sequentially; UPDATE entries overwrite previous values, 
        // which correctly reflects the final state of student scores based on ledger validation (M2).
        $expectedScores[$e['enrollment_id']][$e['criterion_id']] = (float)$e['score'];

        $prev = $e['current_hash'];
    }

    // Check 4: Reconcile active student_scores table against the ledger journal
    $actualScores = qAll("SELECT id, enrollment_id, criterion_id, score FROM student_scores");
    $actualMapped = [];
    foreach ($actualScores as $act) {
        $eid = $act['enrollment_id'];
        $cid = $act['criterion_id'];
        $scoreVal = (float)$act['score'];
        $actualMapped[$eid][$cid] = $scoreVal;

        if (!isset($expectedScores[$eid][$cid])) {
            $violations[] = [
                'ledger_id' => null,
                'type'      => 'SCORE_TAMPER',
                'message'   => "Active score ID #{$act['id']} (Enrollment #$eid, Criterion #$cid = $scoreVal) exists in database but has no entry in the secure ledger journal.",
                'expected'  => 'No entry',
                'found'     => (string)$scoreVal,
            ];
        } else {
            $expVal = $expectedScores[$eid][$cid];
            if (abs($expVal - $scoreVal) > 0.001) {
                $violations[] = [
                    'ledger_id' => null,
                    'type'      => 'SCORE_TAMPER',
                    'message'   => "Active score ID #{$act['id']} (Enrollment #$eid, Criterion #$cid) has been modified to $scoreVal, but secure ledger expected $expVal.",
                    'expected'  => (string)$expVal,
                    'found'     => (string)$scoreVal,
                ];
            }
        }
    }

    // Check for expected scores deleted from the database
    foreach ($expectedScores as $eid => $cits) {
        foreach ($cits as $cid => $expVal) {
            if (!isset($actualMapped[$eid][$cid])) {
                $violations[] = [
                    'ledger_id' => null,
                    'type'      => 'SCORE_TAMPER',
                    'message'   => "Secure ledger expected a score of $expVal for Enrollment #$eid, Criterion #$cid, but the grade record was deleted from the active database.",
                    'expected'  => (string)$expVal,
                    'found'     => 'Record Deleted',
                ];
            }
        }
    }

    auditLog('VERIFY_LEDGER', 'score_ledger', null, 'Verified ' . count($entries) . ' entries. Violations: ' . count($violations));
    return ['valid' => empty($violations), 'total' => count($entries), 'violations' => $violations];
}

// ── Flash messages ───────────────────────────────────────────
function flash(string $key, string $msg): void { $_SESSION['flash'][$key] = $msg; }
function getFlash(string $key): string {
    $v = $_SESSION['flash'][$key] ?? ''; unset($_SESSION['flash'][$key]); return $v;
}
