<?php
declare(strict_types=1);

class StandardGradingStrategy implements GradingStrategy {
    public function calculateFinalScore(int $enrollmentId, array $assessments): ?float {
        $subjectWeightedSum = 0.0;
        $subjectTotalWeight = 0.0;

        foreach ($assessments as $a) {
            $criteria = [];
            if ($a['rid']) {
                $criteria = qAll(
                    "SELECT rc.*, ss.score
                     FROM rubric_criteria rc
                     LEFT JOIN student_scores ss ON rc.id=ss.criterion_id AND ss.enrollment_id=?
                     WHERE rc.rubric_id=?",
                    [$enrollmentId, $a['rid']]
                );
            }

            $twScore = 0.0; 
            $tw = 0.0; 
            $gradedCount = 0; 
            $totalCriteria = count($criteria);
            
            foreach ($criteria as $rc) {
                if ($rc['score'] !== null) {
                    $pct = ($rc['max_score'] > 0) ? ((float)$rc['score'] / (float)$rc['max_score']) * 100 : 0;
                    $twScore += $pct * ((float)$rc['weight_percent'] / 100);
                    $tw += (float)$rc['weight_percent'];
                    $gradedCount++;
                }
            }
            
            $finalPct = ($gradedCount > 0 && $tw > 0) ? round($twScore / ($tw / 100), 1) : null;
            $isPartial = ($gradedCount > 0 && $gradedCount < $totalCriteria);

            if ($finalPct !== null && !$isPartial) {
                $subjectWeightedSum += $finalPct * ((float)$a['weight'] / 100);
                $subjectTotalWeight += (float)$a['weight'];
            }
        }

        if ($subjectTotalWeight > 0) {
            $subjectFinalPct = round($subjectWeightedSum, 2);
            return round($subjectFinalPct / 10, 2); // Trả về thang điểm 10
        }
        
        return null; // Chưa chấm
    }
}