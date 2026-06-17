<?php
// ── LECTURER: RUBRICS ────────────────────────────────────────
function pageRUBRICS(): void {
    requireRole('admin','lecturer');
    layoutStart();
    
    // Hệ thống CSS Quản trị Rubric & Tiêu chí Cao cấp
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { background: #fbfbfd !important; color: #111827; font-family: 'Inter', sans-serif !important; }

        /* Console điều khiển chọn Assessment */
        .academic-filter-card {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 1.8rem !important;
            margin-bottom: 2.5rem !important;
        }

        .academic-field-label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .academic-field-select, .academic-field-input {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.65rem 1rem;
            font-size: 0.9rem;
            color: #111827;
            transition: all 0.3s ease;
        }
        .academic-field-select:focus, .academic-field-input:focus {
            background: #ffffff;
            border-color: #0ea5e9;
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.08);
            outline: none;
        }

        /* Rubric Group Master Card */
        .rubric-master-card {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            margin-bottom: 2.5rem;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        .rubric-master-card:hover {
            box-shadow: 0 20px 40px rgba(0,0,0,0.03);
        }

        .rubric-header-bar {
            background: #fcfcfd;
            border-bottom: 1px solid #f1f5f9;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .rubric-title-text {
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        /* Bảng tiêu chí */
        .criteria-table {
            width: 100%;
            border-collapse: collapse;
        }
        .criteria-table th {
            background: #ffffff !important;
            color: #94a3b8;
            font-weight: 600;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1rem 2rem !important;
            border-bottom: 1px solid #f1f5f9;
        }
        .criteria-table td {
            padding: 1.25rem 2rem !important;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
            font-size: 0.9rem;
        }

        .clo-tag {
            font-family: monospace;
            font-weight: 700;
            font-size: 0.75rem;
            background: #eff6ff;
            color: #1d4ed8;
            padding: 0.25rem 0.5rem;
            border-radius: 6px;
            border: 1px solid #dbeafe;
        }

        /* Nút kén */
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
        .action-link-premium.delete {
            color: #991b1b;
            background: #fef2f2;
            border: 1px solid #fee2e2;
        }
        .action-link-premium.delete:hover {
            background: #dc2626;
            color: #ffffff !important;
        }
        .action-link-premium button { background: none; border: none; color: inherit; padding: 0; cursor: pointer; display: flex; align-items: center; font: inherit; }
    </style>";

    $u = uid();
    if (role() === 'admin') {
        $assessments = qAll("SELECT a.*, s.code as sc FROM assessments a JOIN subjects s ON a.subject_id=s.id ORDER BY a.created_at DESC");
    } else {
        $assessments = qAll("SELECT a.*, s.code as sc FROM assessments a JOIN subjects s ON a.subject_id=s.id WHERE a.lecturer_id=? ORDER BY a.created_at DESC", [$u]);
    }
    
    $filterAid = isset($_GET['assessment_id']) ? (int)$_GET['assessment_id'] : 0;
    if ($filterAid === 0 && !empty($assessments)) {
        $filterAid = (int)$assessments[0]['id'];
    }

    $selAssess = null;
    foreach ($assessments as $a) {
        if ((int)$a['id'] === $filterAid) {
            $selAssess = $a; break;
        }
    }

    // ── BIỂU MẪU LỌC (Console Filter) ──
    echo "<div class='academic-filter-card'>";
    echo "<div class='row align-items-end'>";
    echo "<div class='col-md-9'>";
    echo "<form method='GET' class='row g-3 align-items-end'><input type='hidden' name='page' value='rubrics'>";
    echo "<div class='col-md-8'><label class='academic-field-label'>Select Active Assessment Task *</label><select name='assessment_id' class='form-select academic-field-select' onchange='this.form.submit()'>";
    if (empty($assessments)) {
        echo "<option value=''>-- No Assessments Registered --</option>";
    }
    foreach ($assessments as $a) { $sel=$filterAid==$a['id']?'selected':''; echo "<option value='{$a['id']}' $sel>[".h($a['sc'])."] ".h($a['name'])." ({$a['type']})</option>"; }
    echo "</select></div>";
    echo "</form></div>";

    if ($selAssess) {
        echo "<div class='col-md-3 text-end'>";
        echo "<button class='btn btn-luxury-solid btn-sm py-2 px-3' data-bs-toggle='collapse' data-bs-target='#addRubricCollapse'><i class='bi bi-plus-lg me-1.5'></i>Define Rubric Group</button>";
        echo "</div>";
    }
    echo "</div></div>";

    if (!$selAssess) {
        echo "<div class='alert alert-warning border-0 shadow-sm'><i class='bi bi-exclamation-triangle-fill me-2'></i>Please create at least one assessment task before defining rubrics.</div>";
        layoutEnd();
        return;
    }

    // ── COLLAPSIBLE FORM TẠO RUBRIC GROUP ──
    echo "<div class='collapse mb-4' id='addRubricCollapse'>";
    echo "<div class='card card-body academic-filter-card border-0 shadow-sm'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='rubric_create'><input type='hidden' name='assessment_id' value='$filterAid'>";
    echo "<div class='col-md-8'><label class='form-label fw-bold small text-uppercase text-muted'>Create New Rubric Group for ".h($selAssess['name'])."</label><input type='text' name='rubric_name' class='form-control academic-field-input' placeholder='e.g., Technical Implementation, Critical Thinking...' required></div>";
    echo "<div class='col-md-4'><button type='submit' class='btn btn-info text-white w-100 fw-bold py-2 rounded-3 shadow-sm'><i class='bi bi-plus-lg me-2'></i>Define Rubric</button></div>";
    echo "</form></div></div>";

    // ── TRUY VẤN RUBRIC & TIÊU CHÍ ──
    $rubrics = qAll("SELECT * FROM rubrics WHERE assessment_id=? ORDER BY id", [$filterAid]);
    $clos = qAll("SELECT * FROM clos WHERE subject_id=? ORDER BY code", [$selAssess['subject_id']]);

    foreach ($rubrics as $rubric) {
        $criteria = qAll("SELECT rc.*, c.code as clo_code FROM rubric_criteria rc LEFT JOIN clos c ON rc.clo_id=c.id WHERE rc.rubric_id=? ORDER BY rc.id", [$rubric['id']]);
        
        echo "<div class='rubric-master-card'>";
        
        // Header của Rubric Group
        echo "<div class='rubric-header-bar'>";
        echo "<div class='rubric-title-text'><i class='bi bi-folder-fill text-warning me-2'></i>" . h($rubric['name']) . "</div>";
        
        echo "<form method='POST' onsubmit='return confirm(\"Delete this entire rubric group and all its criteria?\")'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='rubric_delete'><input type='hidden' name='id' value='{$rubric['id']}'><input type='hidden' name='assessment_id' value='$filterAid'><button class='action-link-premium delete'><i class='bi bi-trash3 me-1'></i> Delete Group</button></form>";
        echo "</div>";

        // Body chứa danh sách tiêu chí
        echo "<div class='card-body p-0'>";
        
        if ($criteria) {
            echo "<table class='criteria-table'><thead><tr><th style='width:45%'>Evaluation Criterion</th><th style='width:15%'>CLO Mapping</th><th style='width:15%'>Max Score</th><th style='width:15%'>Weight %</th><th style='text-align:right'>Action</th></tr></thead><tbody>";
            foreach ($criteria as $rc) {
                $cloB = $rc['clo_code'] ? "<span class='clo-tag'>{$rc['clo_code']}</span>" : "<span class='text-muted opacity-50'>—</span>";
                echo "<tr>";
                echo "<td><div class='fw-semibold' style='color:#1e293b'>".h($rc['description'])."</div></td>";
                echo "<td>$cloB</td>";
                echo "<td><span class='fw-bold text-dark'>{$rc['max_score']}</span></td>";
                echo "<td><span class='badge bg-light text-dark border fw-bold'>{$rc['weight_percent']}%</span></td>";
                echo "<td style='text-align:right'>";
                echo "<form method='POST' onsubmit='return confirm(\"Remove this criterion?\")'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='criterion_delete'><input type='hidden' name='id' value='{$rc['id']}'><input type='hidden' name='assessment_id' value='$filterAid'><button type='submit' class='action-link-premium delete' style='padding:0.3rem 0.6rem'><i class='bi bi-x-lg'></i></button></form>";
                echo "</td></tr>";
            }
            echo "</tbody></table>";
        } else {
            echo "<div class='text-center py-4 text-muted small'>No criteria defined for this group yet.</div>";
        }

        // ── FORM THÊM CRITERION (Nằm gọn trong chân thẻ Rubric) ──
        echo "<div class='p-4 border-top' style='background: #fcfcfd'>";
        echo "<h6 class='small fw-bold text-uppercase text-muted mb-3' style='letter-spacing:0.5px'><i class='bi bi-plus-circle me-1'></i>Add Specific Criterion</h6>";
        echo "<form method='POST' class='row g-2'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='criterion_add'><input type='hidden' name='rubric_id' value='{$rubric['id']}'><input type='hidden' name='assessment_id' value='$filterAid'>";
        echo "<div class='col-md-4'><input type='text' name='description' class='form-control academic-field-input' placeholder='Criterion description *' required></div>";
        echo "<div class='col-md-2'><select name='clo_id' class='form-select academic-field-select'><option value=''>Link CLO</option>";
        foreach ($clos as $c) echo "<option value='{$c['id']}'>".h($c['code'])."</option>";
        echo "</select></div>";
        echo "<div class='col-md-2'><div class='input-group shadow-sm rounded-3 overflow-hidden'><span class='input-group-text bg-white border-end-0 small fw-bold text-muted' style='font-size:0.7rem'>MAX</span><input type='number' name='max_score' class='form-control academic-field-input border-start-0' placeholder='Score' min='0.01' step='0.01' value='10' required></div></div>";
        echo "<div class='col-md-2'><div class='input-group shadow-sm rounded-3 overflow-hidden'><span class='input-group-text bg-white border-end-0 small fw-bold text-muted' style='font-size:0.7rem'>W %</span><input type='number' name='weight_percent' class='form-control academic-field-input border-start-0' placeholder='Weight' min='0.01' max='100' step='0.01' required></div></div>";
        echo "<div class='col-md-2'><button type='submit' class='btn btn-success w-100 fw-bold rounded-3 shadow-sm'><i class='bi bi-plus-lg'></i> Add</button></div>";
        echo "</form></div>";
        echo "</div></div>"; // Đóng card-body và rubric-master-card
    }

    if (empty($rubrics)) {
        echo "<div class='alert alert-info border-0 shadow-sm' style='background:#f0f9ff; color:#0369a1'><i class='bi bi-info-circle-fill me-2'></i>No rubrics found for this assessment. Use the form above to start defining grading criteria.</div>";
    }
    
    layoutEnd();
}
