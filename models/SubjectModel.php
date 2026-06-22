<?php
declare(strict_types=1);

class SubjectModel {
    public static function getAll(): array {
        return qAll("SELECT s.*, p.name pn, p.code pc, u.full_name as lecturer_name, COUNT(DISTINCT c.id) clo_count, COUNT(DISTINCT a.id) assess_count 
                     FROM subjects s 
                     JOIN programs p ON s.program_id=p.id 
                     LEFT JOIN users u ON s.lecturer_id=u.id
                     LEFT JOIN clos c ON s.id=c.subject_id 
                     LEFT JOIN assessments a ON s.id=a.subject_id 
                     GROUP BY s.id 
                     ORDER BY p.code, s.code");
    }

    public static function getSimpleAll(): array {
        return qAll("SELECT * FROM subjects ORDER BY code");
    }

    public static function getSimpleAllByLecturer(int $lecturerId): array {
        return qAll("SELECT * FROM subjects WHERE lecturer_id = ? ORDER BY code", [$lecturerId]);
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM subjects WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function create(int $programId, string $code, string $name, int $credits, ?int $lecturerId): int {
        qRun("INSERT INTO subjects (program_id,code,name,credits,lecturer_id) VALUES (?,?,?,?,?)",
            [$programId, trim($code), trim($name), $credits, $lecturerId]);
        return (int)lastId();
    }

    public static function update(int $id, int $programId, string $code, string $name, int $credits, ?int $lecturerId): void {
        qRun("UPDATE subjects SET program_id=?,code=?,name=?,credits=?,lecturer_id=? WHERE id=?",
            [$programId, trim($code), trim($name), $credits, $lecturerId, $id]);
    }

    public static function getByProgram(int $programId): array {
        return qAll("SELECT * FROM subjects WHERE program_id=? ORDER BY code", [$programId]);
    }

    public static function delete(int $id): void {
        qRun("DELETE FROM subjects WHERE id=?", [$id]);
    }
}
