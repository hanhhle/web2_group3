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

        // Auto-migration: Check if lecturer_id column exists in subjects table
        $columns = qAll("SHOW COLUMNS FROM `subjects` LIKE 'lecturer_id'");
        if (empty($columns)) {
            db()->exec("ALTER TABLE `subjects` ADD COLUMN `lecturer_id` INT NULL DEFAULT NULL");
            db()->exec("ALTER TABLE `subjects` ADD CONSTRAINT `fk_subjects_lecturer` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL");
        }

        db()->exec("CREATE TABLE IF NOT EXISTS `notifications` (
          `id`          int(11)      NOT NULL AUTO_INCREMENT,
          `user_id`     int(11)      DEFAULT NULL,
          `title`       varchar(255) NOT NULL,
          `message`     text         NOT NULL,
          `type`        enum('info','success','warning','danger') NOT NULL DEFAULT 'info',
          `is_read`     tinyint(1)   NOT NULL DEFAULT 0,
          `created_by`  int(11)      DEFAULT NULL,
          `created_at`  timestamp    NOT NULL DEFAULT current_timestamp(),
          `read_by`     text         DEFAULT NULL,
          `dismissed_by` text        DEFAULT NULL,
          PRIMARY KEY (`id`),
          KEY `user_id` (`user_id`),
          KEY `created_by` (`created_by`),
          CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
          CONSTRAINT `fk_notif_sender` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

        // Auto-migration: Check if read_by and dismissed_by columns exist in notifications table
        $columns = qAll("SHOW COLUMNS FROM `notifications` LIKE 'read_by'");
        if (empty($columns)) {
            db()->exec("ALTER TABLE `notifications` ADD COLUMN `read_by` text NULL DEFAULT NULL");
        }
        $columns = qAll("SHOW COLUMNS FROM `notifications` LIKE 'dismissed_by'");
        if (empty($columns)) {
            db()->exec("ALTER TABLE `notifications` ADD COLUMN `dismissed_by` text NULL DEFAULT NULL");
        }
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

function hasPermission(string $permission): bool {
    if (!isLoggedIn()) {
        return false;
    }
    $r = role();
    $rolePermissions = [
        'admin' => [
            'view_dashboard', 'manage_users', 'manage_programs', 'manage_subjects', 
            'manage_plos', 'manage_clos', 'manage_matrix', 'manage_enrollments', 
            'view_assessments', 'manage_assessments', 'manage_rubrics', 'grade_student', 
            'view_ledger', 'verify_ledger', 'view_audit_logs', 'approve_grade_change',
            'request_grade_change', 'export_grades',
            'manage_notifications', 'view_notifications', 'mark_notification_read'
        ],
        'lecturer' => [
            'view_dashboard', 'view_assessments', 'manage_assessments', 'manage_rubrics', 
            'grade_student', 'request_grade_change', 'view_ledger', 'view_audit_logs',
            'export_grades',
            'view_notifications', 'mark_notification_read'
        ],
        'student' => [
            'view_dashboard', 'view_my_grades', 'view_clo_report', 'export_my_grades',
            'view_notifications', 'mark_notification_read'
        ]
    ];
    $perms = $rolePermissions[$r] ?? [];
    return in_array($permission, $perms, true);
}

function requirePermission(string $permission): void {
    requireLogin();
    if (!hasPermission($permission)) {
        header('Location: index.php?page=dashboard');
        exit;
    }
}

// ── Audit log ────────────────────────────────────────────────
function auditLog(string $action, ?string $table=null, $recId=null, ?string $details=null): void {
    try {
        qRun("INSERT INTO audit_logs (user_id,action,table_name,record_id,details,ip_address) VALUES (?,?,?,?,?,?)",
            [uid(),$action,$table,$recId,$details,$_SERVER['REMOTE_ADDR']??'127.0.0.1']);
    } catch(Exception $e){}
}

// ── Ledger helpers ───────────────────────────────────────────
/**
 * @param int         $eid           enrollment_id
 * @param int         $cid           criterion_id
 * @param float       $score         new score being recorded
 * @param string      $action        INSERT | UPDATE
 * @param int         $gradedBy      user who originally enters/requests the grade
 * @param float|null  $previousScore previous score (for UPDATE)
 * @param int|null    $approvedBy    admin who approved a grade-change request (null for direct entry)
 * @param int|null    $requestId     grade_change_requests.id that was approved (null for direct entry)
 */
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
    $entries = qAll("SELECT sl.*, su.full_name student_name, sub.code subject_code, rc.description criterion_desc, ug.full_name grader_name, ug.username grader_username
                     FROM score_ledger sl 
                     JOIN student_enrollments se ON sl.enrollment_id = se.id 
                     JOIN users su ON se.student_id = su.id 
                     JOIN subjects sub ON se.subject_id = sub.id 
                     JOIN rubric_criteria rc ON sl.criterion_id = rc.id 
                     LEFT JOIN users ug ON sl.graded_by = ug.id
                     ORDER BY sl.id ASC");
    $violations = [];
    $prev = str_repeat('0', 64);
    $expectedScores = [];
    $studentMap = [];
    $subjectMap = [];
    $critMap = [];
    $graderMap = [];

    foreach ($entries as $e) {
        $graderStr = $e['grader_name'] 
            ? $e['grader_name'] . ' (@' . $e['grader_username'] . ')' 
            : 'System/Unknown';

        $studentMap[$e['enrollment_id']][$e['criterion_id']] = $e['student_name'];
        $subjectMap[$e['enrollment_id']][$e['criterion_id']] = $e['subject_code'];
        $critMap[$e['enrollment_id']][$e['criterion_id']] = $e['criterion_desc'];
        $graderMap[$e['enrollment_id']][$e['criterion_id']] = $graderStr;

        // Check 1: Chain continuity
        if ($e['previous_hash'] !== $prev) {
            $violations[] = [
                'ledger_id' => $e['id'],
                'type'      => 'CHAIN_BREAK',
                'message'   => "Chain broken at Ledger #" . $e['id'] . " — previous_hash does not match previous entry",
                'expected'  => $prev,
                'found'     => $e['previous_hash'],
                'student'   => $e['student_name'],
                'subject'   => $e['subject_code'],
                'criterion' => $e['criterion_desc'],
                'score'     => $e['score'],
                'action'    => $e['action'],
                'expected_grader' => $graderStr,
                'detected_grader' => $graderStr
            ];
        }
        // Check 2: Hash integrity — recompute SHA256(snapshot + prev_hash)
        $recomp = hash('sha256', $e['data_snapshot'] . $e['previous_hash']);
        if ($recomp !== $e['current_hash']) {
            $violations[] = [
                'ledger_id' => $e['id'],
                'type'      => 'HASH_TAMPER',
                'message'   => "Hash mismatch at Ledger #" . $e['id'] . "  data_snapshot or current_hash was modified",
                'expected'  => $recomp,
                'found'     => $e['current_hash'],
                'student'   => $e['student_name'],
                'subject'   => $e['subject_code'],
                'criterion' => $e['criterion_desc'],
                'score'     => $e['score'],
                'action'    => $e['action'],
                'expected_grader' => $graderStr,
                'detected_grader' => $graderStr
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
                    'student'   => $e['student_name'],
                    'subject'   => $e['subject_code'],
                    'criterion' => $e['criterion_desc'],
                    'score'     => $e['score'],
                    'action'    => $e['action'],
                    'expected_grader' => $graderStr,
                    'detected_grader' => $graderStr
                ];
            }
        }

        // Note: expectedScores accumulates state sequentially; UPDATE entries overwrite previous values, 
        // which correctly reflects the final state of student scores based on ledger validation (M2).
        $expectedScores[$e['enrollment_id']][$e['criterion_id']] = (float)$e['score'];

        $prev = $e['current_hash'];
    }

    // Check 4: Reconcile active student_scores table against the ledger journal
    $actualScores = qAll("SELECT ss.id, ss.enrollment_id, ss.criterion_id, ss.score, su.full_name student_name, sub.code subject_code, rc.description criterion_desc, ug.full_name db_grader_name, ug.username db_grader_username
                          FROM student_scores ss 
                          JOIN student_enrollments se ON ss.enrollment_id = se.id 
                          JOIN users su ON se.student_id = su.id 
                          JOIN subjects sub ON se.subject_id = sub.id 
                          JOIN rubric_criteria rc ON ss.criterion_id = rc.id
                          LEFT JOIN users ug ON ss.graded_by = ug.id");
    $actualMapped = [];
    foreach ($actualScores as $act) {
        $eid = $act['enrollment_id'];
        $cid = $act['criterion_id'];
        $scoreVal = (float)$act['score'];
        $actualMapped[$eid][$cid] = $scoreVal;

        $expectedGrader = $graderMap[$eid][$cid] ?? 'N/A';
        $actualGrader = $act['db_grader_name']
            ? $act['db_grader_name'] . ' (@' . $act['db_grader_username'] . ')'
            : 'System/Unknown';

        if (!isset($expectedScores[$eid][$cid])) {
            $violations[] = [
                'ledger_id' => null,
                'type'      => 'SCORE_TAMPER',
                'message'   => "Active score ID #{$act['id']} (Enrollment #$eid, Criterion #$cid = $scoreVal) exists in database but has no entry in the secure ledger journal.",
                'expected'  => 'No entry',
                'found'     => (string)$scoreVal,
                'student'   => $act['student_name'],
                'subject'   => $act['subject_code'],
                'criterion' => $act['criterion_desc'],
                'score'     => $scoreVal,
                'action'    => 'TAMPER',
                'expected_grader' => 'None (No ledger block)',
                'detected_grader' => $actualGrader
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
                    'student'   => $act['student_name'],
                    'subject'   => $act['subject_code'],
                    'criterion' => $act['criterion_desc'],
                    'score'     => $scoreVal,
                    'action'    => 'TAMPER',
                    'expected_grader' => $expectedGrader,
                    'detected_grader' => $actualGrader
                ];
            }
        }
    }

    // Check for expected scores deleted from the database
    foreach ($expectedScores as $eid => $cits) {
        foreach ($cits as $cid => $expVal) {
            if (!isset($actualMapped[$eid][$cid])) {
                $sName = $studentMap[$eid][$cid] ?? 'Unknown';
                $sCode = $subjectMap[$eid][$cid] ?? 'Unknown';
                $cDesc = $critMap[$eid][$cid] ?? 'Unknown';
                $expectedGrader = $graderMap[$eid][$cid] ?? 'N/A';

                $violations[] = [
                    'ledger_id' => null,
                    'type'      => 'SCORE_TAMPER',
                    'message'   => "Secure ledger expected a score of $expVal for Enrollment #$eid, Criterion #$cid, but the grade record was deleted from the active database.",
                    'expected'  => (string)$expVal,
                    'found'     => 'Record Deleted',
                    'student'   => $sName,
                    'subject'   => $sCode,
                    'criterion' => $cDesc,
                    'score'     => $expVal,
                    'action'    => 'DELETE',
                    'expected_grader' => $expectedGrader,
                    'detected_grader' => 'N/A (Deleted)'
                ];
            }
        }
    }

    auditLog('VERIFY_LEDGER', 'score_ledger', null, 'Verified ' . count($entries) . ' entries. Violations: ' . count($violations));
    return ['valid' => empty($violations), 'total' => count($entries), 'violations' => $violations];
}

function ledgerSelfHeal(): array {
    // 1. Run the verification process first to gather the expected scores state
    $entries = qAll("SELECT * FROM score_ledger ORDER BY id ASC");
    $expectedScores = [];
    $gradedByMap = [];
    foreach ($entries as $e) {
        $expectedScores[$e['enrollment_id']][$e['criterion_id']] = (float)$e['score'];
        $gradedByMap[$e['enrollment_id']][$e['criterion_id']] = (int)$e['graded_by'];
    }

    $healedUpdates = 0;
    $healedInserts = 0;
    $healedDeletes = 0;

    // 2. Fetch all current active scores
    $actualScores = qAll("SELECT id, enrollment_id, criterion_id, score FROM student_scores");
    $actualMapped = [];
    foreach ($actualScores as $act) {
        $eid = $act['enrollment_id'];
        $cid = $act['criterion_id'];
        $scoreVal = (float)$act['score'];
        $actualMapped[$eid][$cid] = $act['id'];

        if (!isset($expectedScores[$eid][$cid])) {
            // Delete unexpected active score (TAMPER case: injected score)
            qRun("DELETE FROM student_scores WHERE id = ?", [$act['id']]);
            $healedDeletes++;
        } else {
            $expVal = $expectedScores[$eid][$cid];
            if (abs($expVal - $scoreVal) > 0.001) {
                // Update modified active score (TAMPER case: modified score)
                qRun("UPDATE student_scores SET score = ?, updated_at = NOW() WHERE id = ?", [$expVal, $act['id']]);
                $healedUpdates++;
            }
        }
    }

    // 3. Insert deleted or missing active scores
    foreach ($expectedScores as $eid => $cits) {
        foreach ($cits as $cid => $expVal) {
            if (!isset($actualMapped[$eid][$cid])) {
                $gradedBy = $gradedByMap[$eid][$cid] ?? uid();
                qRun("INSERT INTO student_scores (enrollment_id, criterion_id, score, graded_by, graded_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())",
                    [$eid, $cid, $expVal, $gradedBy]);
                $healedInserts++;
            }
        }
    }

    $totalHealed = $healedUpdates + $healedInserts + $healedDeletes;
    if ($totalHealed > 0) {
        auditLog('SELF_HEAL_LEDGER', 'student_scores', null, "Self-healed database. Restored/reconciled $totalHealed score entries ($healedUpdates updates, $healedInserts inserts, $healedDeletes deletes).");
    }
    return [
        'healed' => $totalHealed,
        'updates' => $healedUpdates,
        'inserts' => $healedInserts,
        'deletes' => $healedDeletes
    ];
}

// ── Flash messages ───────────────────────────────────────────
function flash(string $key, string $msg): void { $_SESSION['flash'][$key] = $msg; }
function getFlash(string $key): string {
    $v = $_SESSION['flash'][$key] ?? ''; unset($_SESSION['flash'][$key]); return $v;
}
