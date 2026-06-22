<?php
declare(strict_types=1);

class CloModel {
    public static function getAll(): array {
        return qAll("SELECT c.*,s.name sn,s.code sc,COUNT(DISTINCT m.id) map_count 
                     FROM clos c 
                     JOIN subjects s ON c.subject_id=s.id 
                     LEFT JOIN clo_plo_mappings m ON c.id=m.clo_id 
                     GROUP BY c.id 
                     ORDER BY s.code,c.code");
    }

    public static function getBySubject(int $subjectId): array {
        return qAll("SELECT * FROM clos WHERE subject_id=? ORDER BY code", [$subjectId]);
    }

    public static function getClosWithPloCount(int $subjectId): array {
        return qAll("SELECT c.*, COUNT(DISTINCT m.plo_id) plo_count 
                     FROM clos c 
                     LEFT JOIN clo_plo_mappings m ON c.id=m.clo_id 
                     WHERE c.subject_id=? 
                     GROUP BY c.id 
                     ORDER BY c.code", [$subjectId]);
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM clos WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function create(int $subjectId, string $code, string $description): int {
        qRun("INSERT INTO clos (subject_id,code,description) VALUES (?,?,?)",
            [$subjectId, trim($code), trim($description)]);
        return (int)lastId();
    }

    public static function update(int $id, int $subjectId, string $code, string $description): void {
        qRun("UPDATE clos SET subject_id=?,code=?,description=? WHERE id=?",
            [$subjectId, trim($code), trim($description), $id]);
    }

    public static function delete(int $id): void {
        qRun("DELETE FROM clos WHERE id=?", [$id]);
    }

    public static function getMappingsForSubject(int $subjectId): array {
        $currentMapping = [];
        $rows = qAll("SELECT clo_id, plo_id FROM clo_plo_mappings WHERE clo_id IN (SELECT id FROM clos WHERE subject_id=?)", [$subjectId]);
        foreach ($rows as $r) {
            $currentMapping[$r['clo_id']][$r['plo_id']] = true;
        }
        return $currentMapping;
    }

    public static function saveMatrix(int $subjectId, array $mappings): void {
        $clos = array_column(self::getBySubject($subjectId), 'id');
        
        db()->beginTransaction();
        try {
            // Remove existing mappings for this subject's CLOs
            if (!empty($clos)) {
                $placeholders = implode(',', array_fill(0, count($clos), '?'));
                qRun("DELETE FROM clo_plo_mappings WHERE clo_id IN ($placeholders)", $clos);
            }
            
            // Insert new mappings
            foreach ($mappings as $cloId => $plos) {
                if (!in_array((int)$cloId, $clos)) continue;
                foreach ($plos as $ploId => $val) {
                    qRun("INSERT INTO clo_plo_mappings (clo_id,plo_id) VALUES (?,?)", [(int)$cloId, (int)$ploId]);
                }
            }
            db()->commit();
        } catch (Exception $e) {
            db()->rollBack();
            throw $e;
        }
    }
}
