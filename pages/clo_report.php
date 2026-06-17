<?php
declare(strict_types=1);

function pageCLO_REPORT(): void {
    requireRole('student');
    layoutStart();
    
    // --- HỆ THỐNG CSS LUXURY TINH CHỈNH ---
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

        body { background: #ffffff !important; font-family: 'Inter', sans-serif !important; color: #1e293b; -webkit-font-smoothing: antialiased; }

        .report-container { max-width: 1200px; margin: 3rem auto; padding: 0 1.5rem; }

        /* Tiêu đề trang tinh tế */
        .page-header-luxury { border-bottom: 1px solid #f1f5f9; padding-bottom: 1.5rem; margin-bottom: 2rem; }
        .page-header-luxury h5 { font-size: 1.5rem !important; font-weight: 700; color: #0f172a; letter-spacing: -0.03em; }

        /* Thông báo phẳng */
        .alert-luxury { background: #f8fafc; border: 1px solid #e2e8f0; border-left: 3px solid #0ea5e9; color: #475569; font-size: 0.82rem; padding: 1rem 1.25rem; border-radius: 8px; margin-bottom: 2rem; }

        /* Card học phần hiện đại */
        .subject-card { border: 1px solid #f1f5f9; border-radius: 16px; background: #ffffff; margin-bottom: 3rem; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.02); }
        .subject-header { background: #f8fafc; padding: 1.5rem 2rem; border-bottom: 1px solid #f1f5f9; display: flex; justify-content: space-between; align-items: center; }
        .subject-title { font-size: 1.1rem; font-weight: 700; color: #0f172a; }

        /* Bảng CLO tối giản */
        .table-clo { margin-bottom: 0; }
        .table-clo thead th { background: transparent !important; color: #94a3b8 !important; font-size: 0.7rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; padding: 1rem; border: none; }
        .table-clo td { padding: 1.25rem 1rem; vertical-align: middle; border-bottom: 1px solid #f8fafc; font-size: 0.85rem; color: #475569; }
        .table-clo tr:last-child td { border-bottom: none; }

        /* Chỉ số Attainment */
        .att-val { font-size: 1rem; font-weight: 700; letter-spacing: -0.02em; }
        .text-success-luxury { color: #10b981; }
        .text-danger-luxury { color: #ef4444; }
        .text-muted-luxury { color: #94a3b8; }

        /* Thanh Progress siêu mảnh */
        .progress-luxury { height: 4px; background-color: #f1f5f9; border-radius: 10px; margin-top: 8px; }
        .progress-bar-luxury { border-radius: 10px; transition: width 0.8s cubic-bezier(0.4, 0, 0.2, 1); }

        /* Badge PLO Mapper */
        .plo-badge { font-family: 'JetBrains Mono', monospace; font-size: 0.65rem; font-weight: 600; padding: 0.25rem 0.6rem; border-radius: 4px; background: #ffffff; color: #6366f1; border: 1px solid #e0e7ff; margin-right: 4px; transition: all 0.2s; }
        .plo-badge:hover { background: #6366f1; color: #ffffff; border-color: #6366f1; }

        .clo-code { font-family: 'JetBrains Mono', monospace; font-weight: 700; color: #0ea5e9; font-size: 0.9rem; }
    </style>";

    $u = uid();
    echo "<div class='report-container'>";
    
    echo "<div class='page-header-luxury'>";
    echo "<h5><i class='bi bi-file-earmark-text me-2 text-info'></i>CLO Attainment Report</h5>";
    echo "</div>";

    echo "<div class='alert-luxury'><i class='bi bi-info-circle-fill me-2'></i>This report analyzes the attainment level of each Course Learning Outcome (CLO) based on assessment scores, and displays their mappings to Program Learning Outcomes (PLO).</div>";

    $enrollments = qAll("SELECT se.*,s.name sn,s.code sc,s.program_id FROM student_enrollments se JOIN subjects s ON se.subject_id=s.id WHERE se.student_id=?",[$u]);
    
    if (empty($enrollments)) {
        echo "<div class='alert alert-warning border-0 shadow-sm'>No CLO data available yet.</div>";
        layoutEnd();
        return;
    }

    $hasAny = false;
    foreach ($enrollments as $enr) {
        $clos = qAll("SELECT c.*,COUNT(DISTINCT m.plo_id) plo_count FROM clos c LEFT JOIN clo_plo_mappings m ON c.id=m.clo_id WHERE c.subject_id=? GROUP BY c.id ORDER BY c.code",[$enr['subject_id']]);
        if (empty($clos)) continue;
        $hasAny = true;

        echo "<div class='subject-card'>";
        echo "<div class='subject-header'>";
        echo "<div class='subject-title'><span class='badge bg-dark me-2' style='font-size:0.7rem; font-weight:500; padding: 0.4rem 0.7rem;'>" . h($enr['sc']) . "</span> " . h($enr['sn']) . "</div>";
        echo "<div class='text-muted small fw-medium'>" . h($enr['semester']) . "</div>";
        echo "</div>";

        echo "<div class='table-responsive'>";
        echo "<table class='table table-clo'>";
        echo "<thead><tr><th style='width:12%'>Code</th><th style='width:38%'>CLO Description</th><th style='width:15%'>Attainment</th><th style='width:20%'>Performance</th><th style='width:15%'>Mapped PLOs</th></tr></thead><tbody>";

        foreach ($clos as $clo) {
            $criteria = qAll("SELECT rc.max_score,ss.score FROM rubric_criteria rc LEFT JOIN student_scores ss ON rc.id=ss.criterion_id AND ss.enrollment_id=? WHERE rc.clo_id=?",[$enr['id'],$clo['id']]);
            $totalMax=0; $totalScore=0; $graded=false;
            foreach ($criteria as $cr) {
                $totalMax += $cr['max_score'];
                if ($cr['score'] !== null) {
                    $totalScore += $cr['score'];
                    $graded = true;
                }
            }
            
            $att = ($graded && $totalMax>0) ? round(($totalScore/$totalMax)*100,1) : null;
            $mappedPlos = qAll("SELECT p.code,p.description FROM clo_plo_mappings m JOIN plos p ON m.plo_id=p.id WHERE m.clo_id=?",[$clo['id']]);
            
            // Attainment Display
            if ($att !== null) {
                $colorClass = $att >= 50 ? 'text-success-luxury' : 'text-danger-luxury';
                $barColor = $att >= 50 ? '#10b981' : '#ef4444';
                $attDisp = "<span class='att-val $colorClass'>{$att}%</span>";
                $bar = "<div class='progress-luxury'><div class='progress-bar-luxury' style='width:{$att}%; background-color:$barColor; height:100%;'></div></div>";
            } else {
                $attDisp = "<span class='att-val text-muted-luxury' style='font-size:0.8rem;'>Not graded</span>";
                $bar = "<div class='progress-luxury'><div class='progress-bar-luxury' style='width:0%; background-color:#e2e8f0; height:100%;'></div></div>";
            }

            // PLO Badges
            $plosBadges = '';
            foreach ($mappedPlos as $plo) {
                $plosBadges .= "<span class='plo-badge' title='".h($plo['description'])."'>".h($plo['code'])."</span>";
            }
            if (!$plosBadges) $plosBadges = "<span class='text-muted' style='font-size:0.75rem;'>—</span>";

            echo "<tr>
                    <td><span class='clo-code'>" . h($clo['code']) . "</span></td>
                    <td class='fw-medium text-dark'>" . h($clo['description']) . "</td>
                    <td>$attDisp</td>
                    <td>$bar</td>
                    <td>$plosBadges</td>
                  </tr>";
        }
        echo "</tbody></table></div></div>";
    }

    if (!$hasAny) echo "<div class='alert alert-warning border-0'>No CLO data available yet.</div>";
    
    echo "</div>"; // End .report-container
    layoutEnd();
}
