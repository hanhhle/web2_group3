<?php
// ── LECTURER: ASSESSMENTS ───────────────────────────────────
function pageASSESSMENTS(array $assessments = [], array $subjects = []): void {
    requirePermission('view_assessments');
    layoutStart();

    // Premium International University Style Custom CSS
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
            -webkit-font-smoothing: antialiased;
        }

        /* Flat Premium Console Form */
        .academic-console {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.01), 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 2.2rem !important;
            margin-bottom: 3rem !important;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }
        
        .academic-console:focus-within {
            border-color: #0b1320;
            box-shadow: 0 20px 40px rgba(11, 19, 32, 0.04);
        }

        .console-header-text {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #6b7280;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .academic-field-label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .academic-field-input, .academic-field-select {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.65rem 1rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: #111827;
            transition: all 0.3s ease;
        }

        .academic-field-input:focus, .academic-field-select:focus {
            background: #ffffff;
            border-color: #0b1320;
            box-shadow: 0 0 0 4px rgba(11, 19, 32, 0.05);
            outline: none;
        }

        .btn-luxury-solid {
            background: #0b1320;
            border: none;
            color: #ffffff !important;
            border-radius: 10px;
            padding: 0.65rem 1.5rem;
            font-size: 0.9rem;
            font-weight: 600;
            letter-spacing: 0.3px;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .btn-luxury-solid:hover {
            background: #1f2937;
            transform: translateY(-1px);
            box-shadow: 0 8px 16px rgba(11, 19, 32, 0.15);
        }

        /* Table Container */
        .academic-ledger-container {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            overflow: hidden;
        }

        .luxury-table {
            width: 100%;
            margin-bottom: 0;
            border-collapse: collapse;
        }

        .luxury-table th {
            background: #ffffff !important;
            color: #6b7280;
            font-weight: 600;
            font-size: 0.72rem;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            padding: 1.25rem 2rem !important;
            border-bottom: 1px solid #f3f4f6;
        }

        .luxury-table td {
            padding: 1.4rem 2rem !important;
            vertical-align: middle;
            color: #111827;
            font-size: 0.92rem;
            border-bottom: 1px solid #f3f4f6;
        }

        .institutional-code {
            font-family: SFMono-Regular, Consolas, monospace;
            font-weight: 600;
            font-size: 0.8rem;
            color: #0b1320;
            background: #f3f4f6;
            padding: 0.3rem 0.6rem;
            border-radius: 6px;
            border: 1px solid #e5e7eb;
        }

        .type-badge {
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 0.35rem 0.7rem;
            border-radius: 6px;
            background: #eff6ff;
            color: #1e40af;
            border: 1px solid #dbeafe;
        }

        .rubric-capsule {
            font-size: 0.75rem;
            font-weight: 600;
            background: #fffbeb;
            color: #b45309;
            padding: 0.35rem 0.7rem;
            border-radius: 6px;
            border: 1px solid #fef3c7;
            transition: all 0.2s ease;
        }
        .rubric-capsule:hover {
            background: #fef3c7;
            color: #78350f;
            transform: translateY(-1px);
        }

        /* Action Buttons */
        .action-link-premium {
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            padding: 0.45rem 0.9rem;
            border-radius: 8px;
            transition: all 0.2s ease-in-out;
        }

        .action-link-premium.edit { 
            color: #1e40af; 
            background: #eff6ff; 
            border: 1px solid #dbeafe;
        }
        .action-link-premium.edit:hover { 
            background: #1e40af; 
            color: #ffffff !important; 
        }

        .action-link-premium.delete { 
            color: #991b1b; 
            background: #fef2f2; 
            border: 1px solid #fee2e2;
            margin-left: 0.5rem;
        }
        .action-link-premium.delete:hover:not([disabled]) { 
            background: #dc2626; 
            color: #ffffff !important; 
        }
        .action-link-premium button { background: none; border: none; color: inherit; padding: 0; cursor: pointer; display: flex; align-items: center; font: inherit; }
    </style>";

    echo "<div class='d-flex justify-content-between align-items-end mb-4'>";
    echo "<div><h4 class='fw-bold mb-1'><i class='bi bi-clipboard-check me-2 text-primary'></i>Assessment Management</h4>";
    echo "<small class='text-muted'>Define evaluation tasks and curriculum assessment weights</small></div>";
    echo "<a href='index.php?page=rubrics' class='btn btn-outline-dark btn-sm rounded-pill px-3 fw-bold'><i class='bi bi-list-check me-1'></i>Manage Rubrics</a></div>";

$isAdmin = (role() === 'admin');

    // ── INITIALIZE NEW ASSESSMENT (Console Form) ──
    echo "<div class='card academic-console'>";
    echo "<div class='console-header-text'><i class='bi bi-circle-fill me-2 text-primary' style='font-size:6px;'></i>Initialize New Assessment Entry</div>";
    echo "<div class='card-body p-0'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='assess_create'>";
    
    echo "<div class='col-md-3'><label class='academic-field-label'>Subject Selection *</label><select name='subject_id' class='form-select academic-field-select' required><option value=''>-- Select Subject --</option>";
    foreach ($subjects as $s) {
        echo "<option value='" . (int)$s['id'] . "'>" . h($s['code'] . ' - ' . $s['name']) . "</option>";
    }
    echo "</select></div>";
    
    echo "<div class='col-md-3'><label class='academic-field-label'>Assessment Title *</label><input type='text' name='name' class='form-control academic-field-input' placeholder='e.g. Midterm Exam' required></div>";
    
    echo "<div class='col-md-2'><label class='academic-field-label'>Evaluation Type *</label><select name='type' id='assess_type' class='form-select academic-field-select' required onchange=\"var w = {'attendance':10,'midterm':30,'final':60}; document.getElementById('assess_weight').value = w[this.value]; var m = document.getElementById('assess_max'); if(this.value==='attendance'){m.value=10; m.readOnly=true;}else{m.value=100; m.readOnly=false;}\"><option value='attendance'>Attendance (10%)</option><option value='midterm'>Midterm (30%)</option><option value='final'>Final (60%)</option></select></div>";
    
    echo "<div class='col-md-1'><label class='academic-field-label'>Weight %</label><input type='number' name='weight' id='assess_weight' class='form-control academic-field-input text-center' min='0' max='100' step='0.01' value='10' readonly required></div>";
    
    echo "<div class='col-md-1'><label class='academic-field-label'>Max Score</label><input type='number' name='max_score' id='assess_max' class='form-control academic-field-input text-center' min='1' value='10' readonly required></div>";
    
    $semesters = ['2023-1', '2023-2', '2024-1', '2024-2', '2025-1', '2025-2'];
    if (!in_array(SEMESTER, $semesters)) {
        $semesters[] = SEMESTER;
    }
    echo "<div class='col-md-2'><label class='academic-field-label'>Semester *</label><select name='semester' class='form-select academic-field-select text-center' required>";
    foreach ($semesters as $sOpt) {
        $sel = (SEMESTER === $sOpt) ? 'selected' : '';
        echo "<option value='" . h($sOpt) . "' $sel>" . h($sOpt) . "</option>";
    }
    echo "</select></div>";
    
    echo "<div class='col-12 text-end mt-4'><button type='submit' class='btn btn-luxury-solid px-4'><i class='bi bi-plus-circle me-2'></i>Deploy Assessment</button></div>";
    echo "</form></div></div>";

    // ── ASSESSMENT LOG TABLE ──
    echo "<div class='academic-ledger-container'>";
    echo "<table class='table luxury-table'>";
    echo "<thead><tr><th>Code</th><th>Task Title</th><th>Type</th><th>Weight</th><th>Max</th><th>Term</th><th>Mapping</th><th style='text-align:right;'>Actions</th></tr></thead><tbody>";
    
    if (empty($assessments)) {
        echo "<tr><td colspan='8' class='text-center text-muted py-5'><i class='bi bi-inbox d-block mb-2 fs-4'></i> No active assessments found in the system.</td></tr>";
    } else {
        foreach ($assessments as $a) {
            $lectName = $a['lecturer_name'] ? h($a['lecturer_name']) : 'Unassigned';
            $isOwner = $isAdmin || ((int)$a['lecturer_id'] === $u);
            
            echo "<tr>";
            echo "<td><span class='institutional-code'>" . h($a['subject_code']) . "</span></td>";
            echo "<td><div class='fw-bold text-dark'>" . h($a['name']) . "</div><small class='text-muted' style='font-size:0.75rem;'>GV: $lectName • Created at: ".date('M d, Y', strtotime($a['created_at']))."</small></td>";
            echo "<td><span class='type-badge'>" . ucfirst(h($a['type'])) . "</span></td>";
            echo "<td><span class='fw-bold text-secondary'>" . h($a['weight']) . "%</span></td>";
            echo "<td><span class='fw-bold'>" . h($a['max_score']) . "</span></td>";
            echo "<td>" . h($a['semester']) . "</td>";
            echo "<td><a href='index.php?page=rubrics&assessment_id=" . (int)$a['id'] . "' class='rubric-capsule text-decoration-none d-inline-flex align-items-center'><i class='bi bi-diagram-2 me-1.5'></i>" . (int)$a['rubric_count'] . " Rubrics</a></td>";
            
            echo "<td style='text-align:right; white-space:nowrap;'>";
            if ($isOwner) {
                echo "<a href='index.php?page=grade&assessment_id=" . (int)$a['id'] . "' class='action-link-premium edit'><i class='bi bi-pencil-square me-1.5'></i>Grade</a>";
                
                echo "<form method='POST' class='d-inline' onsubmit='return confirm(\"Delete this assessment?\")'>";
                echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'>";
                echo "<input type='hidden' name='_action' value='assess_delete'><input type='hidden' name='id' value='" . (int)$a['id'] . "'>";
                echo "<button type='submit' class='action-link-premium delete' title='Delete Assessment'><i class='bi bi-trash3'></i></button></form>";
            } else {
                echo "<a href='index.php?page=grade&assessment_id=" . (int)$a['id'] . "' class='action-link-premium edit' style='background: #f1f5f9; color: #64748b; border-color: #e2e8f0;'><i class='bi bi-eye me-1.5'></i>View</a>";
                echo "<span class='action-link-premium delete text-muted' style='background: #f8fafc; border-color: #f1f5f9; cursor: not-allowed; opacity: 0.6;' title='Locked (Assigned to $lectName)'><i class='bi bi-lock-fill'></i></span>";
            }
            echo "</td>";
            echo "</tr>";
        }
    }
    echo "</tbody></table></div>";

    layoutEnd();
}
