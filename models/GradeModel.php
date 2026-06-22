<?php
declare(strict_types=1);

class GradeModel {
    public static function getExistingScore(int $enrollmentId, int $criterionId): ?array {
        $res = qOne("SELECT id, score FROM student_scores WHERE enrollment_id=? AND criterion_id=?", [$enrollmentId, $criterionId]);
        return $res ?: null;
    }

    public static function getEnrollmentsForSubjectAndSemester(int $subjectId, string $semester): array {
        return qAll("SELECT se.id, u.full_name fn, u.username un 
                     FROM student_enrollments se 
                     JOIN users u ON se.student_id=u.id 
                     WHERE se.subject_id=? AND se.semester=? 
                     ORDER BY u.full_name", [$subjectId, $semester]);
    }

    public static function getCriteriaAndScores(int $enrollmentId, int $rubricId): array {
        return qAll("SELECT rc.id, rc.description, rc.max_score, ss.score, ss.graded_at, 
                            u.full_name as grader_name, u.username as grader_username 
                     FROM rubric_criteria rc 
                     LEFT JOIN student_scores ss ON rc.id = ss.criterion_id AND ss.enrollment_id = ? 
                     LEFT JOIN users u ON ss.graded_by = u.id 
                     WHERE rc.rubric_id = ? 
                     ORDER BY rc.id", [$enrollmentId, $rubricId]);
    }

    public static function getCriteriaAndScoresWithClos(int $enrollmentId, int $rubricId): array {
        return qAll("SELECT rc.*, ss.score, ss.graded_at, u.full_name as grader_name, u.username as grader_username, c.code clo_code
                     FROM rubric_criteria rc
                     LEFT JOIN student_scores ss ON rc.id=ss.criterion_id AND ss.enrollment_id=?
                     LEFT JOIN users u ON ss.graded_by=u.id
                     LEFT JOIN clos c ON rc.clo_id=c.id
                     WHERE rc.rubric_id=? ORDER BY rc.id", [$enrollmentId, $rubricId]);
    }

    public static function getAllScoresForAssessment(int $assessmentId): array {
        return qAll("SELECT ss.enrollment_id, ss.criterion_id, ss.score, ss.graded_at, 
                            u.full_name as grader_name, u.username as grader_username 
                     FROM student_scores ss 
                     JOIN rubric_criteria rc ON ss.criterion_id = rc.id 
                     JOIN rubrics r ON rc.rubric_id = r.id 
                     LEFT JOIN users u ON ss.graded_by = u.id 
                     WHERE r.assessment_id = ?", [$assessmentId]);
    }

    public static function getScoresByEnrollmentAndClo(int $enrollmentId, int $cloId): array {
        return qAll("SELECT rc.max_score, ss.score 
                     FROM rubric_criteria rc 
                     LEFT JOIN student_scores ss ON rc.id=ss.criterion_id AND ss.enrollment_id=? 
                     WHERE rc.clo_id=?", [$enrollmentId, $cloId]);
    }

    public static function saveGrades(int $assessmentId, array $scores, int $graderId, string $role): int {
        $selAssess = AssessmentModel::getById($assessmentId);
        if (!$selAssess) {
            throw new Exception("Assessment not found.");
        }

        // Fetch criteria map
        $criteriaMap = [];
        $rubrics = RubricModel::getRubricsForAssessment($assessmentId);
        foreach ($rubrics as $r) {
            $criteria = RubricModel::getCriteriaForRubric($r['id']);
            foreach ($criteria as $cr) {
                $criteriaMap[$cr['id']] = $cr['max_score'];
            }
        }

        // Fetch valid enrollments
        $validEnrollments = array_column(qAll(
            "SELECT se.id FROM student_enrollments se WHERE se.subject_id=? AND se.semester=?",
            [(int)$selAssess['subject_id'], $selAssess['semester']]
        ), 'id');

        db()->beginTransaction();
        $saved = 0;
        try {
            foreach ($scores as $eid => $criteria) {
                if (!in_array((int)$eid, $validEnrollments)) {
                    continue;
                }
                foreach ($criteria as $cid => $scoreRaw) {
                    if ($scoreRaw === '' || $scoreRaw === null) {
                        continue;
                    }
                    if (!is_numeric($scoreRaw)) {
                        throw new Exception("Invalid score '{$scoreRaw}' for criterion #$cid");
                    }

                    $score = (float)$scoreRaw;
                    $max   = (float)($criteriaMap[$cid] ?? 0);
                    if ($score > $max) throw new Exception("Score $score exceeds max $max for criterion #$cid");
                    if ($score < 0)   throw new Exception("Score cannot be negative.");

                    $existing = self::getExistingScore((int)$eid, (int)$cid);
                    $previousScore = null;
                    if ($existing) {
                        if ((float)$existing['score'] === $score) {
                            continue;
                        }
                        if ($role !== 'admin') {
                            throw new Exception("Unauthorized: Direct modification of existing grades is not allowed. Please submit a grade change request.");
                        }
                        $previousScore = (float)$existing['score'];
                        qRun("UPDATE student_scores SET score=?,graded_by=?,graded_at=NOW() WHERE enrollment_id=? AND criterion_id=?",
                            [$score, $graderId, (int)$eid, (int)$cid]);
                        $action = 'UPDATE';
                    } else {
                        qRun("INSERT INTO student_scores (enrollment_id,criterion_id,score,graded_by) VALUES (?,?,?,?)",
                            [(int)$eid, (int)$cid, $score, $graderId]);
                        $action = 'INSERT';
                    }
                    ledgerRecord((int)$eid, (int)$cid, $score, $action, $graderId, $previousScore);
                    $saved++;
                }
            }
            db()->commit();
        } catch (Exception $e) {
            db()->rollBack();
            throw $e;
        }

        return $saved;
    }

    public static function getDetailedGradesForStudentExport(int $studentId, string $semester): array {
        return qAll(
            "SELECT s.code AS subject_code, s.name AS subject_name, s.credits,
                    a.type AS assessment_type, a.weight AS assessment_weight,
                    rc.description AS criterion_desc, rc.max_score, ss.score, ss.graded_at,
                    u.full_name AS grader_name
             FROM student_enrollments se
             JOIN subjects s ON se.subject_id = s.id
             JOIN assessments a ON s.id = a.subject_id AND a.semester = se.semester
             JOIN rubrics r ON a.id = r.assessment_id
             JOIN rubric_criteria rc ON r.id = rc.rubric_id
             LEFT JOIN student_scores ss ON rc.id = ss.criterion_id AND se.id = ss.enrollment_id
             LEFT JOIN users u ON ss.graded_by = u.id
             WHERE se.student_id = ? AND se.semester = ?
             ORDER BY s.code, FIELD(a.type, 'attendance', 'midterm', 'final'), rc.id",
            [$studentId, $semester]
        );
    }

    public static function getDetailedAssessmentScoresForExport(int $assessmentId): array {
        return qAll(
            "SELECT u.username AS student_username, u.full_name AS student_name,
                    s.code AS subject_code, s.name AS subject_name,
                    a.name AS assessment_name, a.type AS assessment_type,
                    rc.description AS criterion_desc, rc.max_score,
                    ss.score, ss.graded_at, gr.full_name AS grader_name
             FROM rubric_criteria rc
             JOIN rubrics r ON rc.rubric_id = r.id
             JOIN assessments a ON r.assessment_id = a.id
             JOIN subjects s ON a.subject_id = s.id
             JOIN student_enrollments se ON s.id = se.subject_id AND se.semester = a.semester
             JOIN users u ON se.student_id = u.id
             LEFT JOIN student_scores ss ON rc.id = ss.criterion_id AND se.id = ss.enrollment_id
             LEFT JOIN users gr ON ss.graded_by = gr.id
             WHERE a.id = ?
             ORDER BY u.full_name, rc.id",
            [$assessmentId]
        );
    }
}
