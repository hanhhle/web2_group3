<?php
declare(strict_types=1);

interface GradingStrategy {
    // Tính toán điểm cuối cùng. Trả về thang điểm 10, hoặc null nếu chưa có điểm
    public function calculateFinalScore(int $enrollmentId, array $assessments): ?float;
}