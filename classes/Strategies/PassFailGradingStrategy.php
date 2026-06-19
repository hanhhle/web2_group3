<?php
declare(strict_types=1);

class PassFailGradingStrategy implements GradingStrategy {
    public function calculateFinalScore(int $enrollmentId, array $assessments): ?float {
        $hasAnyGrade = false;
        
        foreach ($assessments as $a) {
            if ($a['rid']) {
                $criteria = qAll(
                    "SELECT rc.*, ss.score FROM rubric_criteria rc
                     LEFT JOIN student_scores ss ON rc.id=ss.criterion_id AND ss.enrollment_id=?
                     WHERE rc.rubric_id=?", [$enrollmentId, $a['rid']]
                );
                
                foreach ($criteria as $rc) {
                    if ($rc['score'] !== null) {
                        $hasAnyGrade = true;
                        // Một tiêu chí < 50% max_score là Tạch (0 điểm)
                        if ((float)$rc['score'] < ((float)$rc['max_score'] / 2)) {
                            return 0.0; 
                        }
                    }
                }
            }
        }
        if (!$hasAnyGrade) return null;
        return 10.0; // Đạt (Pass)
    }
}