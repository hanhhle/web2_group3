<?php
declare(strict_types=1);

class RequestModel {
    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM grade_change_requests WHERE id=? AND status='pending'", [$id]);
        return $res ?: null;
    }

    public static function getPendingCount(): int {
        $res = qOne("SELECT COUNT(*) c FROM grade_change_requests WHERE status='pending'");
        return (int)$res['c'];
    }

    public static function getScoreDetailsForRequest(int $enrollmentId, int $criterionId, int $assessmentId): ?array {
        $res = qOne(
            "SELECT ss.score, a.lecturer_id, a.id as aid, rc.max_score
             FROM student_scores ss
             JOIN student_enrollments se ON ss.enrollment_id = se.id
             JOIN rubric_criteria rc ON ss.criterion_id = rc.id
             JOIN rubrics r ON rc.rubric_id = r.id
             JOIN assessments a ON r.assessment_id = a.id
             WHERE ss.enrollment_id = ? AND ss.criterion_id = ? AND a.id = ?",
            [$enrollmentId, $criterionId, $assessmentId]
        );
        return $res ?: null;
    }

    public static function getAllRequests(): array {
        return qAll(
            "SELECT gcr.*,
                    req_u.full_name  AS requester_name,
                    req_u.username   AS requester_username,
                    rev_u.full_name  AS reviewer_name,
                    rev_u.username   AS reviewer_username,
                    rc.description   AS criterion_desc,
                    rc.max_score,
                    sub.name         AS subject_name,
                    sub.code         AS subject_code,
                    se.semester,
                    stu.full_name    AS student_name,
                    stu.username     AS student_username
             FROM grade_change_requests gcr
             JOIN users         req_u ON gcr.requested_by  = req_u.id
             LEFT JOIN users    rev_u ON gcr.reviewed_by   = rev_u.id
             LEFT JOIN rubric_criteria rc  ON gcr.criterion_id  = rc.id
             JOIN student_enrollments se ON gcr.enrollment_id = se.id
             JOIN subjects sub ON se.subject_id = sub.id
             JOIN users stu    ON se.student_id = stu.id
             ORDER BY gcr.id DESC"
        );
    }

    public static function getRequestsByLecturer(int $lecturerId): array {
        return qAll(
            "SELECT gcr.*,
                    req_u.full_name  AS requester_name,
                    req_u.username   AS requester_username,
                    rev_u.full_name  AS reviewer_name,
                    rev_u.username   AS reviewer_username,
                    rc.description   AS criterion_desc,
                    rc.max_score,
                    sub.name         AS subject_name,
                    sub.code         AS subject_code,
                    se.semester,
                    stu.full_name    AS student_name,
                    stu.username     AS student_username
             FROM grade_change_requests gcr
             JOIN users         req_u ON gcr.requested_by  = req_u.id
             LEFT JOIN users    rev_u ON gcr.reviewed_by   = rev_u.id
             LEFT JOIN rubric_criteria rc  ON gcr.criterion_id  = rc.id
             JOIN student_enrollments se ON gcr.enrollment_id = se.id
             JOIN subjects sub ON se.subject_id = sub.id
             JOIN users stu    ON se.student_id = stu.id
             WHERE gcr.requested_by = ?
             ORDER BY gcr.id DESC",
            [$lecturerId]
        );
    }

    public static function createRequest(int $enrollmentId, int $criterionId, float $oldScore, float $newScore, string $reason, int $requestedBy): int {
        qRun(
            "INSERT INTO grade_change_requests (enrollment_id, criterion_id, old_score, new_score, reason, requested_by)
             VALUES (?, ?, ?, ?, ?, ?)",
            [$enrollmentId, $criterionId, $oldScore, $newScore, trim($reason), $requestedBy]
        );
        return (int)lastId();
    }

    public static function approveRequest(int $id, int $reviewerId, string $note): void {
        $req = self::getById($id);
        if (!$req) {
            throw new Exception("Request not found or already processed.");
        }

        db()->beginTransaction();
        try {
            // Update status
            qRun("UPDATE grade_change_requests SET status='approved', reviewed_by=?, reviewed_at=NOW(), review_note=? WHERE id=?",
                [$reviewerId, trim($note), $id]);
                
            // Update student_scores
            $existScore = GradeModel::getExistingScore((int)$req['enrollment_id'], (int)$req['criterion_id']);
                
            if ($existScore) {
                qRun("UPDATE student_scores SET score=?, graded_by=?, graded_at=NOW() WHERE enrollment_id=? AND criterion_id=?",
                    [(float)$req['new_score'], (int)$req['requested_by'], (int)$req['enrollment_id'], (int)$req['criterion_id']]);
            } else {
                qRun("INSERT INTO student_scores (enrollment_id,criterion_id,score,graded_by) VALUES (?,?,?,?)",
                    [(int)$req['enrollment_id'], (int)$req['criterion_id'], (float)$req['new_score'], (int)$req['requested_by']]);
            }
            
            // Record in ledger
            ledgerRecord(
                (int)$req['enrollment_id'],
                (int)$req['criterion_id'],
                (float)$req['new_score'],
                'UPDATE',
                (int)$req['requested_by'],
                $existScore ? (float)$existScore['score'] : null,
                $reviewerId,
                $id
            );
            
            db()->commit();
        } catch (Exception $e) {
            db()->rollBack();
            throw $e;
        }
    }

    public static function rejectRequest(int $id, int $reviewerId, string $note): void {
        qRun("UPDATE grade_change_requests SET status='rejected', reviewed_by=?, reviewed_at=NOW(), review_note=? WHERE id=?",
            [$reviewerId, trim($note), $id]);
    }

    public static function getPendingRequestsForSubjectAndSemester(int $subjectId, string $semester): array {
        return qAll(
            "SELECT gcr.enrollment_id, gcr.criterion_id, gcr.new_score, gcr.id as req_id
             FROM grade_change_requests gcr
             JOIN student_enrollments se ON gcr.enrollment_id = se.id
             WHERE se.subject_id = ? AND se.semester = ? AND gcr.status = 'pending'",
            [$subjectId, $semester]
        );
    }
}
