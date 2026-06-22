<?php
declare(strict_types=1);

class EnrollmentModel {
    public static function getAll(): array {
        return qAll("SELECT se.*, u.full_name sn, u.username un, s.name subjn, s.code subjc 
                     FROM student_enrollments se 
                     JOIN users u ON se.student_id=u.id 
                     JOIN subjects s ON se.subject_id=s.id 
                     ORDER BY se.semester DESC, u.full_name");
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM student_enrollments WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function checkDuplicate(int $studentId, int $subjectId, string $semester): ?array {
        $res = qOne("SELECT id FROM student_enrollments WHERE student_id=? AND subject_id=? AND semester=?", 
            [$studentId, $subjectId, $semester]);
        return $res ?: null;
    }

    public static function enroll(int $studentId, int $subjectId, string $semester): int {
        qRun("INSERT INTO student_enrollments (student_id,subject_id,semester) VALUES (?,?,?)", 
            [$studentId, $subjectId, $semester]);
        return (int)lastId();
    }

    public static function unenroll(int $id): void {
        qRun("DELETE FROM student_enrollments WHERE id=?", [$id]);
    }
}
