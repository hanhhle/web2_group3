<?php
declare(strict_types=1);

class PloModel {
    public static function getAll(): array {
        return qAll("SELECT pl.*,p.name pn,p.code pc,COUNT(DISTINCT m.id) map_count 
                     FROM plos pl 
                     JOIN programs p ON pl.program_id=p.id 
                     LEFT JOIN clo_plo_mappings m ON pl.id=m.plo_id 
                     GROUP BY pl.id 
                     ORDER BY p.code,pl.code");
    }

    public static function getByProgram(int $programId): array {
        return qAll("SELECT * FROM plos WHERE program_id=? ORDER BY code", [$programId]);
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM plos WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function create(int $programId, string $code, string $description): int {
        qRun("INSERT INTO plos (program_id,code,description) VALUES (?,?,?)",
            [$programId, trim($code), trim($description)]);
        return (int)lastId();
    }

    public static function update(int $id, int $programId, string $code, string $description): void {
        qRun("UPDATE plos SET program_id=?,code=?,description=? WHERE id=?",
            [$programId, trim($code), trim($description), $id]);
    }

    public static function getMappedPlosForClo(int $cloId): array {
        return qAll("SELECT p.code, p.description 
                     FROM clo_plo_mappings m 
                     JOIN plos p ON m.plo_id=p.id 
                     WHERE m.clo_id=?", [$cloId]);
    }

    public static function delete(int $id): void {
        qRun("DELETE FROM plos WHERE id=?", [$id]);
    }
}
