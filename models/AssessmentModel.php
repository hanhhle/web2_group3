<?php
declare(strict_types=1);

class AssessmentModel {
    public static function getAll(): array {
        return qAll("SELECT a.*, s.name as subject_name, s.code as subject_code,
                            COUNT(DISTINCT r.id) as rubric_count, u.full_name as lecturer_name
                     FROM assessments a
                     JOIN subjects s ON a.subject_id = s.id
                     LEFT JOIN rubrics r ON a.id = r.assessment_id
                     LEFT JOIN users u ON a.lecturer_id = u.id
                     GROUP BY a.id ORDER BY a.created_at DESC");
    }

    public static function getByLecturer(int $lecturerId): array {
        return qAll("SELECT a.*, s.name as subject_name, s.code as subject_code,
                            COUNT(DISTINCT r.id) as rubric_count, u.full_name as lecturer_name
                     FROM assessments a
                     JOIN subjects s ON a.subject_id = s.id
                     LEFT JOIN rubrics r ON a.id = r.assessment_id
                     LEFT JOIN users u ON a.lecturer_id = u.id
                     WHERE a.lecturer_id = ?
                     GROUP BY a.id ORDER BY a.created_at DESC", [$lecturerId]);
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM assessments WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function getDetailedById(int $id): ?array {
        $res = qOne("SELECT a.*, s.code as sc, u.full_name as lecturer_name 
                     FROM assessments a 
                     JOIN subjects s ON a.subject_id=s.id 
                     LEFT JOIN users u ON a.lecturer_id=u.id 
                     WHERE a.id=?", [$id]);
        return $res ?: null;
    }

    public static function getBySubjectAndSemester(int $subjectId, string $semester): array {
        return qAll("SELECT a.*, r.id rid, r.name rn, u.full_name as lecturer_name 
                     FROM assessments a 
                     LEFT JOIN rubrics r ON a.id=r.assessment_id 
                     LEFT JOIN users u ON a.lecturer_id=u.id 
                     WHERE a.subject_id=? AND a.semester=? 
                     ORDER BY FIELD(a.type, 'attendance', 'midterm', 'final')", [$subjectId, $semester]);
    }

    public static function checkDuplicateType(int $subjectId, string $semester, string $type): bool {
        $res = qOne("SELECT COUNT(*) as cnt FROM assessments WHERE subject_id = ? AND semester = ? AND type = ?", [$subjectId, $semester, $type]);
        return ((int)$res['cnt']) > 0;
    }

    public static function getTotalWeight(int $subjectId, string $semester): float {
        $res = qOne("SELECT COALESCE(SUM(weight), 0) as t FROM assessments WHERE subject_id = ? AND semester = ?", [$subjectId, $semester]);
        return (float)$res['t'];
    }

    public static function create(int $subjectId, int $lecturerId, string $name, string $type, float $weight, float $maxScore, string $semester): int {
        qRun("INSERT INTO assessments (subject_id,lecturer_id,name,type,weight,max_score,semester) VALUES (?,?,?,?,?,?,?)",
            [$subjectId, $lecturerId, trim($name), $type, $weight, $maxScore, $semester]);
        return (int)lastId();
    }

    public static function delete(int $id): void {
        qRun("DELETE FROM assessments WHERE id=?", [$id]);
    }
}
