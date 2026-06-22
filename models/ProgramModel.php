<?php
declare(strict_types=1);

class ProgramModel {
    public static function getAll(): array {
        return qAll("SELECT p.*, COUNT(DISTINCT pl.id) plo_count, COUNT(DISTINCT s.id) subj_count 
                     FROM programs p 
                     LEFT JOIN plos pl ON p.id=pl.program_id 
                     LEFT JOIN subjects s ON p.id=s.program_id 
                     GROUP BY p.id 
                     ORDER BY p.code");
    }

    public static function getSimpleAll(): array {
        return qAll("SELECT * FROM programs ORDER BY code");
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM programs WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function create(string $code, string $name, string $description): int {
        qRun("INSERT INTO programs (code,name,description) VALUES (?,?,?)",
            [trim($code), trim($name), trim($description)]);
        return (int)lastId();
    }

    public static function update(int $id, string $code, string $name, string $description): void {
        qRun("UPDATE programs SET code=?,name=?,description=? WHERE id=?",
            [trim($code), trim($name), trim($description), $id]);
    }

    public static function delete(int $id): void {
        qRun("DELETE FROM programs WHERE id=?", [$id]);
    }
}
