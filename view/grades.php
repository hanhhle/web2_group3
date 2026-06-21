<?php
declare(strict_types=1);

function pageGRADES(array $semestersList = [], string $selectedSemester = '', array $enrollments = []): void {
    requirePermission('view_my_grades');
    layoutStart();
    
    // --- LUXURY CSS SYSTEM FOR GRADES PAGE ---
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body { background: #ffffff !important; font-family: 'Inter', sans-serif !important; color: #1e293b; -webkit-font-smoothing: antialiased; }

        .grades-container { max-width: 1100px; margin: 3rem auto; padding: 0 1.5rem; }

        /* Subject Cards */
        .subject-card { border: 1px solid #f1f5f9; border-radius: 16px; background: #ffffff; margin-bottom: 2.5rem; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.02); }
        .subject-header { background: #f8fafc; padding: 1.5rem 2rem; border-bottom: 1px solid #f1f5f9; }
        .subject-title { font-size: 1.25rem; font-weight: 700; color: #0f172a; letter-spacing: -0.02em; margin-bottom: 0.25rem; }
        .subject-meta { font-size: 0.8rem; color: #64748b; font-weight: 500; }

        /* Assessment Block */
        .assessment-section { padding: 2rem; border-bottom: 1px solid #f8fafc; }
        .assessment-section:last-child { border-bottom: none; }
        .assessment-heading { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 1.5rem; }
        .assessment-name { font-size: 1rem; font-weight: 600; color: #334155; }
        
        /* Badges */
        .final-badge { font-size: 0.85rem; font-weight: 700; padding: 0.4rem 1rem; border-radius: 8px; letter-spacing: 0.5px; }
        .bg-success-soft { background: #ecfdf5 !important; color: #059669 !important; border: 1px solid #bbf7d0; }
        .bg-danger-soft { background: #fef2f2 !important; color: #dc2626 !important; border: 1px solid #fecaca; }
        .bg-secondary-soft { background: #f1f5f9 !important; color: #64748b !important; border: 1px solid #e2e8f0; }

        /* Grades Table */
        .table-grades { margin-bottom: 0; }
        .table-grades thead th { background: transparent !important; color: #94a3b8 !important; font-size: 0.7rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; padding: 1rem 0.5rem; border-bottom: 1px solid #e2e8f0 !important; }
        .table-grades td { padding: 1.25rem 0.5rem; vertical-align: middle; border-bottom: 1px solid #f1f5f9; font-size: 0.85rem; color: #475569; }
        .table-grades tr:last-child td { border-bottom: none; }

        /* Luxury Progress Bars */
        .progress-luxury { height: 6px; background-color: #f1f5f9; border-radius: 10px; overflow: visible; position: relative; margin-top: 6px; }
        .progress-bar-luxury { border-radius: 10px; transition: width 0.6s ease; }
        .pct-label { font-size: 0.75rem; font-weight: 700; color: #1e293b; display: block; margin-bottom: 4px; }

        .badge-clo { font-size: 0.65rem; font-weight: 700; padding: 0.2rem 0.5rem; border-radius: 4px; background: #eff6ff; color: #2563eb; border: 1px solid #dbeafe; }
        .score-val { font-size: 0.95rem; font-weight: 700; color: #0f172a; }
        .max-val { font-size: 0.75rem; color: #94a3b8; font-weight: 400; }

        /* Grader info badge */
        .grader-info { font-size: 0.68rem; color: #94a3b8; margin-top: 4px; display: flex; align-items: center; gap: 4px; }
        .grader-info .grader-name { color: #64748b; font-weight: 600; }
        .grader-info .grader-time { font-family: monospace; color: #94a3b8; }

        /* Final score card */
        .final-score-card { background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1rem 1.5rem; margin: 0 2rem 1.5rem 2rem; display: flex; justify-content: space-between; align-items: center; }
        .final-score-label { font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; color: #64748b; }
        .final-score-value { font-size: 1.6rem; font-weight: 800; letter-spacing: -0.05em; }
        .letter-grade-badge { font-size: 1rem; font-weight: 700; padding: 0.3rem 0.8rem; border-radius: 8px; }
    </style>";

    $u = uid();

    // Map database semester IDs to human-readable English semester names
    $semMap = [
        '2025-1' => 'Semester 1 (2025-2026)',
        '2024-2' => 'Semester 2 (2024-2025)',
        '2024-1' => 'Semester 1 (2024-2025)'
    ];

    // Determine selected semester fallback if empty
    if ($selectedSemester === '') {
        $selectedSemester = !empty($semestersList) ? $semestersList[0]['semester'] : '2024-1';
    }

    echo "<div class='grades-container'>";

    // Semester Selection Header
    echo "<div class='d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom' style='border-color:#f1f5f9 !important;'>";
    echo "<div><h4 class='mb-1 fw-bold' style='color:#0f172a; font-size:1.6rem; letter-spacing:-0.5px;'>Academic Grades</h4>";
    echo "<span class='text-muted' style='font-size:0.85rem;'>Filter by semester to view your grade report</span></div>";
    
    echo "<div class='d-flex align-items-center gap-2'>";
    echo "<form method='GET' action='index.php' id='semester-grades-form' class='d-flex align-items-center gap-2'>";
    echo "<input type='hidden' name='page' value='grades'>";
    echo "<select name='semester' class='form-select form-select-sm rounded-3' style='width: 220px; border-color: rgba(15, 23, 42, 0.08); font-size: 0.82rem; font-weight: 600; color: #475569; padding: 0.5rem 1rem;' onchange='document.getElementById(\"semester-grades-form\").submit();'>";
    foreach ($semestersList as $s) {
        $semName = $semMap[$s['semester']] ?? $s['semester'];
        $sel = ($s['semester'] === $selectedSemester) ? 'selected' : '';
        echo "<option value='" . h($s['semester']) . "' {$sel}>" . h($semName) . "</option>";
    }
    echo "</select>";
    echo "</form>";
    if (hasPermission('export_my_grades')) {
        echo "<a href='index.php?page=grades&semester=" . h($selectedSemester) . "&export=csv' class='btn btn-dark btn-sm rounded-3' style='font-size: 0.82rem; font-weight: 600; padding: 0.5rem 1rem;'><i class='bi bi-file-earmark-spreadsheet me-1'></i> Export CSV</a>";
    }
    echo "</div>";
    echo "</div>";
    
    // Premium Minimal Security & Grading Policy Banner
    echo "<div class='card mb-4 border-0 shadow-sm' style='background: #f8fafc; border-radius: 16px; border: 1px solid #e2e8f0 !important;'>
            <div class='card-body p-4'>
                <div class='d-flex align-items-center mb-3'>
                    <div class='me-3' style='font-size: 1.5rem; color: #0f172a;'>
                        <i class='bi bi-shield-lock-fill'></i>
                    </div>
                    <div>
                        <h6 class='mb-0 fw-bold' style='color: #0f172a;'>Academic Grading & Security Policy</h6>
                        <small class='text-muted'>VNU-IS Cryptographically Secured Ledger Protocol</small>
                    </div>
                </div>
                <div class='row g-3' style='font-size: 0.82rem; color: #475569;'>
                    <div class='col-md-4'>
                        <div class='p-3 rounded h-100' style='background: #fff; border: 1px solid #f1f5f9;'>
                            <strong class='d-block text-dark mb-1'><i class='bi bi-percent text-primary me-1'></i> Standardized Weights</strong>
                            Attendance (10%), Midterm (30%), and Final (60%) weights are strictly applied across all subjects.
                        </div>
                    </div>
                    <div class='col-md-4'>
                        <div class='p-3 rounded h-100' style='background: #fff; border: 1px solid #f1f5f9;'>
                            <strong class='d-block text-dark mb-1'><i class='bi bi-person-badge text-success me-1'></i> Edit Restrictions</strong>
                            Grades can only be entered/modified by the assigned lecturer or an administrator. Student view is read-only.
                        </div>
                    </div>
                    <div class='col-md-4'>
                        <div class='p-3 rounded h-100' style='background: #fff; border: 1px solid #f1f5f9;'>
                            <strong class='d-block text-dark mb-1'><i class='bi bi-fingerprint text-dark me-1'></i> Security Ledger</strong>
                            All modifications are cryptographically signed with SHA-256 and appended to the immutable blockchain ledger.
                        </div>
                    </div>
                </div>
            </div>
          </div>";
    
    if (empty($enrollments)) {
        echo "<div class='alert alert-info border-0 shadow-sm'>You are not enrolled in any subjects.</div>";
        layoutEnd();
        return;
    }

    foreach ($enrollments as $enr) {
        $assessments = AssessmentModel::getBySubjectAndSemester((int)$enr['subject_id'], $enr['semester']);

        echo "<div class='subject-card'>";
        // Subject Header
        echo "<div class='subject-header'>";
        echo "<div class='subject-title'>" . h($enr['sn']) . "</div>";
        echo "<div class='subject-meta'><span class='badge bg-dark me-2' style='font-size:0.65rem;'>" . h($enr['sc']) . "</span> " . h($enr['semester']) . " • {$enr['credits']} Credits</div>";
        echo "</div>";

        echo "<div class='card-body p-0'>";
        if (empty($assessments)) {
            echo "<p class='text-muted p-4 mb-0'>No assessments created for this subject yet.</p>";
        } else {
            echo "<div class='table-responsive'>";
            echo "<table class='table table-grades mb-0'>";
            echo "<thead>
                    <tr>
                        <th style='width:22%; padding-left: 2rem;'>Category</th>
                        <th style='width:10%;'>Weight</th>
                        <th style='width:38%;'>Criteria Details & Audit Log</th>
                        <th style='width:15%;'>Score</th>
                        <th style='width:15%; padding-right: 2rem;'>Performance</th>
                    </tr>
                  </thead>
                  <tbody>";

            $seen = [];
            // Pre-compute subject final score
            $subjectWeightedSum = 0.0;
            $subjectTotalWeight = 0.0;
            $assessmentRows = [];

            foreach ($assessments as $a) {
                if (isset($seen[$a['id']])) continue;
                $seen[$a['id']] = true;

                $catLabel = ucfirst($a['type']);
                $criteria = [];
                if ($a['rid']) {
                    $criteria = GradeModel::getCriteriaAndScoresWithClos((int)$enr['id'], (int)$a['rid']);
                }

                // Compute weighted assessment score (out of 100%)
                $twScore = 0.0; $tw = 0.0; $gradedCount = 0; $totalCriteria = count($criteria);
                foreach ($criteria as $rc) {
                    if ($rc['score'] !== null) {
                        $pct = ($rc['max_score'] > 0) ? ($rc['score'] / $rc['max_score']) * 100 : 0;
                        $twScore += $pct * ($rc['weight_percent'] / 100);
                        $tw += $rc['weight_percent'];
                        $gradedCount++;
                    }
                }
                $finalPct  = ($gradedCount > 0 && $tw > 0) ? round($twScore / ($tw / 100), 1) : null;
                $isPartial = ($gradedCount > 0 && $gradedCount < $totalCriteria);

                // Accumulate subject total (only fully graded assessments)
                if ($finalPct !== null && !$isPartial) {
                    $subjectWeightedSum += $finalPct * ($a['weight'] / 100);
                    $subjectTotalWeight += $a['weight'];
                }

                $assessmentRows[] = compact('a', 'catLabel', 'criteria', 'finalPct', 'isPartial');
            }

            // Subject final score (thang 10)
            $subjectFinalPct   = $subjectTotalWeight > 0 ? round($subjectWeightedSum, 2) : null;
            $subjectFinalScore = $subjectFinalPct !== null ? round($subjectFinalPct / 10, 2) : null;

            // Render subject final score banner
            if ($subjectFinalScore !== null) {
                $lg = $subjectFinalScore >= 9 ? 'A+' : ($subjectFinalScore >= 8.5 ? 'A' : ($subjectFinalScore >= 8 ? 'B+' : ($subjectFinalScore >= 7 ? 'B' : ($subjectFinalScore >= 6.5 ? 'C+' : ($subjectFinalScore >= 5.5 ? 'C' : ($subjectFinalScore >= 5 ? 'D+' : ($subjectFinalScore >= 4 ? 'D' : 'F')))))));
                $lgBg = $subjectFinalScore >= 5 ? '#10b981' : '#ef4444';
                $lgTextBg = $subjectFinalScore >= 5 ? '#ecfdf5' : '#fef2f2';
                $lgText   = $subjectFinalScore >= 5 ? '#065f46' : '#991b1b';
                echo "<div class='final-score-card'>
                        <div>
                            <div class='final-score-label'><i class='bi bi-award-fill me-1'></i>Subject Final Score</div>
                            <div class='final-score-value mt-1' style='color:{$lgBg};'>{$subjectFinalScore}<span style='font-size:0.9rem; color:#94a3b8;'>/10</span></div>
                        </div>
                        <div class='text-end'>
                            <span class='letter-grade-badge' style='background:{$lgTextBg}; color:{$lgText};'>{$lg}</span>
                            <div class='text-muted mt-1' style='font-size:0.72rem;'>Based on {$subjectTotalWeight}% of assessments graded</div>
                        </div>
                      </div>";
            }

            // Render table
            foreach ($assessmentRows as $row) {
                $a         = $row['a'];
                $catLabel  = $row['catLabel'];
                $criteria  = $row['criteria'];
                $finalPct  = $row['finalPct'];
                $isPartial = $row['isPartial'];

                // Criteria Details HTML
                $critHtml = "";
                if (empty($criteria)) {
                    $critHtml = "<span class='text-muted' style='font-size:0.8rem;'>No criteria defined</span>";
                } else {
                    $critHtml .= "<ul class='mb-0 ps-3' style='font-size: 0.78rem; color: #64748b;'>";
                    foreach ($criteria as $rc) {
                        $cloBadge  = $rc['clo_code'] ? "<span class='badge-clo ms-1'>" . h($rc['clo_code']) . "</span>" : '';
                        $scoreText = $rc['score'] !== null
                            ? "<strong class='text-dark'>{$rc['score']}</strong><span class='max-val'>/{$rc['max_score']}</span>"
                            : "<span class='text-muted'>—</span>";

                        // Grader info: who graded + when
                        $graderHtml = '';
                        if ($rc['score'] !== null && $rc['grader_name']) {
                            $gradedTime = date('d/m/Y H:i', strtotime($rc['graded_at']));
                            $graderHtml = "<div class='grader-info'>
                                <i class='bi bi-person-check-fill' style='color:#10b981; font-size:0.75rem;'></i>
                                <span class='grader-name'>" . h($rc['grader_name']) . "</span>
                                <span style='color:#cbd5e1'>·</span>
                                <span class='grader-time'>{$gradedTime}</span>
                              </div>";
                        }

                        $critHtml .= "<li class='mb-2'>
                            <span class='fw-medium'>" . h($rc['description']) . "</span>{$cloBadge}
                            <span class='ms-1'>{$scoreText}</span>
                            <small class='text-muted ms-1'>({$rc['weight_percent']}%)</small>
                            {$graderHtml}
                          </li>";
                    }
                    $critHtml .= "</ul>";
                }

                // Score cell
                if ($finalPct !== null) {
                    $partialTag = $isPartial ? "<span style='font-size:0.65rem; color:#d97706; background:#fffbeb; border:1px solid #fef3c7; border-radius:4px; padding:0.1rem 0.4rem; margin-left:4px;'>partial</span>" : '';
                    $badgeClass = $finalPct >= 50 ? 'bg-success-soft' : 'bg-danger-soft';
                    $scoreCell  = "<div><span class='score-val'>{$finalPct}%</span>{$partialTag} <span class='final-badge {$badgeClass} ms-1' style='padding:0.15rem 0.45rem; font-size:0.68rem;'>" . ($finalPct >= 50 ? 'Pass' : 'Fail') . "</span></div>";
                    $barColor   = $finalPct >= 50 ? '#10b981' : '#ef4444';
                    $pctBar     = "<div class='progress-luxury' style='margin-top:0;'><div class='progress-bar-luxury' style='width:{$finalPct}%; background-color:{$barColor}; height:100%;'></div></div>";
                } else {
                    $scoreCell = "<span class='text-muted' style='font-size:0.8rem;'>Pending</span>";
                    $pctBar    = "<span class='text-muted' style='font-size:0.75rem;'>Waiting...</span>";
                }

                $lectName = isset($a['lecturer_name']) ? h($a['lecturer_name']) : 'Unassigned';
                echo "<tr>
                        <td style='padding-left:2rem;'>
                            <span class='fw-bold text-dark' style='font-size:0.9rem;'>{$catLabel}</span>
                            <div class='text-muted' style='font-size:0.72rem; margin-top:2px;'><i class='bi bi-person'></i> {$lectName}</div>
                        </td>
                        <td class='fw-semibold text-secondary'>{$a['weight']}%</td>
                        <td>{$critHtml}</td>
                        <td>{$scoreCell}</td>
                        <td style='padding-right:2rem;'>{$pctBar}</td>
                      </tr>";
            }
            echo "</tbody></table></div>";
        }
        echo "</div></div>";
    }
    echo "</div>";
    layoutEnd();
}
