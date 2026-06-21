<?php
declare(strict_types=1);

class DashboardController {
    public function index(): void {
        requireLogin();
        $r = role();
        $u = uid();

        // Global stats
        $totalUsers    = (int)(qOne("SELECT COUNT(*) c FROM users")['c']);
        $totalSubjects = (int)(qOne("SELECT COUNT(*) c FROM subjects")['c']);
        $totalClos     = (int)(qOne("SELECT COUNT(*) c FROM clos")['c']);
        $totalPlos     = (int)(qOne("SELECT COUNT(*) c FROM plos")['c']);
        $totalLedger   = (int)(qOne("SELECT COUNT(*) c FROM score_ledger")['c']);
        $totalAssess   = (int)(qOne("SELECT COUNT(*) c FROM assessments")['c']);

        $data = [
            'totalUsers' => $totalUsers,
            'totalSubjects' => $totalSubjects,
            'totalClos' => $totalClos,
            'totalPlos' => $totalPlos,
            'totalLedger' => $totalLedger,
            'totalAssess' => $totalAssess,
        ];

        if ($r === 'admin') {
            $data['pendingCount'] = (int)(qOne("SELECT COUNT(*) c FROM grade_change_requests WHERE status='pending'")['c']);
        } elseif ($r === 'lecturer') {
            $data['myAssess'] = qAll("SELECT a.*,s.name sn,s.code sc FROM assessments a JOIN subjects s ON a.subject_id=s.id WHERE a.lecturer_id=? ORDER BY a.created_at DESC LIMIT 5", [$u]);
            $data['mySubjCount'] = (int)(qOne("SELECT COUNT(DISTINCT subject_id) c FROM assessments WHERE lecturer_id=?", [$u])['c']);
        } elseif ($r === 'student') {
            $myEnr = qAll("SELECT se.*,s.name sn,s.code sc,s.credits FROM student_enrollments se JOIN subjects s ON se.subject_id=s.id WHERE se.student_id=?", [$u]);
            $myScores = (int)(qOne("SELECT COUNT(*) c FROM student_scores ss JOIN student_enrollments se ON ss.enrollment_id=se.id WHERE se.student_id=?", [$u])['c']);

            $semMap = [
                '2025-1' => 'Semester 1 (2025-2026)',
                '2024-2' => 'Semester 2 (2024-2025)',
                '2024-1' => 'Semester 1 (2024-2025)'
            ];

            $groupedData = [];
            foreach ($semMap as $dbSem => $jsSemName) {
                $groupedData[$jsSemName] = [
                    'curriculum' => [],
                    'chart' => [
                        'labels' => [],
                        'scores' => [],
                        'averages' => []
                    ]
                ];
            }

            foreach ($myEnr as $e) {
                $semName = $semMap[$e['semester']] ?? $e['semester'];
                if (!isset($groupedData[$semName])) {
                    $groupedData[$semName] = [
                        'curriculum' => [],
                        'chart' => [
                            'labels' => [],
                            'scores' => [],
                            'averages' => []
                        ]
                    ];
                }

                $assessments = qAll("SELECT a.*, r.id rid 
                                     FROM assessments a 
                                     LEFT JOIN rubrics r ON a.id = r.assessment_id 
                                     WHERE a.subject_id = ? AND a.semester = ? 
                                     ORDER BY FIELD(a.type, 'attendance', 'midterm', 'final')", 
                                     [$e['subject_id'], $e['semester']]);
                
                // PE uses Pass/Fail, other subjects use Standard
                $strategy = (strpos($e['sc'], 'PE') === 0) 
                    ? new PassFailGradingStrategy() 
                    : new StandardGradingStrategy();

                // Calculate Final Score
                $finalScoreResult = $strategy->calculateFinalScore((int)$e['id'], $assessments);
                $subjectFinalScore = $finalScoreResult !== null ? $finalScoreResult : 0.0;

                // Calculate Class Average
                $allSubjectEnrs = qAll("SELECT id FROM student_enrollments WHERE subject_id = ? AND semester = ?", [$e['subject_id'], $e['semester']]);
                $allFinalScores = [];

                foreach ($allSubjectEnrs as $se) {
                    $seScore = $strategy->calculateFinalScore((int)$se['id'], $assessments);
                    if ($seScore !== null) {
                        $allFinalScores[] = $seScore;
                    }
                }

                $subjectClassAvgScore = !empty($allFinalScores) 
                    ? round(array_sum($allFinalScores) / count($allFinalScores), 2) 
                    : 0.0;

                $groupedData[$semName]['curriculum'][] = [
                    'code' => $e['sc'],
                    'name' => $e['sn'],
                    'credits' => $e['credits'],
                    'final_score' => $subjectFinalScore,
                    'class_average' => $subjectClassAvgScore
                ];

                $groupedData[$semName]['chart']['labels'][] = $e['sc'];
                $groupedData[$semName]['chart']['scores'][] = $subjectFinalScore;
                $groupedData[$semName]['chart']['averages'][] = $subjectClassAvgScore;
            }

            $data['myEnr'] = $myEnr;
            $data['myScores'] = $myScores;
            $data['semMap'] = $semMap;
            $data['groupedData'] = $groupedData;
        }

        // Extract variables to local scope so view can use them directly
        extract($data);
        require_once __DIR__ . '/../views/dashboard.php';
        if (function_exists('pageDASHBOARD')) {
            pageDASHBOARD($data);
        }
    }
}
