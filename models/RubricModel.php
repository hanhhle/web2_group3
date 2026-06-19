<?php
declare(strict_types=1);

class RubricModel {
    public static function getRubricsForAssessment(int $assessmentId): array {
        return qAll("SELECT * FROM rubrics WHERE assessment_id=? ORDER BY id", [$assessmentId]);
    }

    public static function getCriteriaForRubric(int $rubricId): array {
        return qAll("SELECT rc.*, c.code as clo_code 
                     FROM rubric_criteria rc 
                     LEFT JOIN clos c ON rc.clo_id=c.id 
                     WHERE rc.rubric_id=? 
                     ORDER BY rc.id", [$rubricId]);
    }

    public static function getRubricById(int $id): ?array {
        $res = qOne("SELECT * FROM rubrics WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function getRubricWithAssessment(int $id): ?array {
        $res = qOne("SELECT r.assessment_id, a.lecturer_id 
                     FROM rubrics r 
                     JOIN assessments a ON r.assessment_id = a.id 
                     WHERE r.id=?", [$id]);
        return $res ?: null;
    }

    public static function getCriterionWithAssessment(int $id): ?array {
        $res = qOne("SELECT r.assessment_id, a.lecturer_id 
                     FROM rubric_criteria rc 
                     JOIN rubrics r ON rc.rubric_id = r.id 
                     JOIN assessments a ON r.assessment_id = a.id 
                     WHERE rc.id=?", [$id]);
        return $res ?: null;
    }

    public static function createRubric(int $assessmentId, string $name): int {
        qRun("INSERT INTO rubrics (assessment_id,name) VALUES (?,?)", [$assessmentId, trim($name)]);
        return (int)lastId();
    }

    public static function deleteRubric(int $id): void {
        qRun("DELETE FROM rubrics WHERE id=?", [$id]);
    }

    public static function addCriterion(int $rubricId, string $description, float $maxScore, ?int $cloId): int {
        qRun("INSERT INTO rubric_criteria (rubric_id,description,max_score,clo_id) VALUES (?,?,?,?)",
            [$rubricId, trim($description), $maxScore, $cloId]);
        return (int)lastId();
    }

    public static function deleteCriterion(int $id): void {
        qRun("DELETE FROM rubric_criteria WHERE id=?", [$id]);
    }
}
