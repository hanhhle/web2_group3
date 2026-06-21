<?php
// ── ADMIN: CLO-PLO MATRIX ────────────────────────────────────
function pageCLO_MATRIX(
    array $programs = [],
    int $selProg = 0,
    int $selSubj = 0,
    array $subjsOfProg = [],
    array $plos = [],
    array $clos = [],
    array $existing = []
): void {
    requirePermission('manage_matrix');
    layoutStart();
    
    // Hệ thống Siêu CSS Ma trận Học thuật - Đẳng cấp Quản trị Dữ liệu Thụy Sĩ
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
        }

        /* Khối điều hướng lọc dữ liệu (Filter Console) */
        .academic-filter-console {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.01), 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 1.75rem !important;
            margin-bottom: 2.5rem !important;
        }

        .filter-step-label {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            color: #6b7280;
            margin-bottom: 0.75rem;
            display: block;
        }

        .academic-select {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.7rem 1rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: #111827;
            transition: all 0.3s ease;
        }
        .academic-select:focus {
            border-color: #0b1320;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(11, 19, 32, 0.05);
            outline: none;
        }

        /* Ma trận CLO-PLO Grid */
        .matrix-container {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0,0,0,0.03);
            overflow: hidden;
            padding: 1.5rem;
        }

        .matrix-table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }

        .matrix-table th {
            background: #f8fafc;
            color: #475569;
            font-weight: 700;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1.25rem 0.75rem;
            border-bottom: 2px solid #e2e8f0;
            text-align: center;
        }

        .matrix-table th.header-main {
            text-align: left;
            background: #fff;
            color: #0f172a;
            font-size: 0.85rem;
        }

        .matrix-table td {
            padding: 1rem 0.75rem;
            border-bottom: 1px solid #f1f5f9;
            text-align: center;
            transition: background 0.2s ease;
        }

        /* Nhãn CLO bên trái */
        .clo-row-header {
            text-align: left !important;
            padding-left: 1.5rem !important;
            background: #fcfcfd;
            border-right: 2px solid #f1f5f9;
        }

        .clo-code-badge {
            font-family: monospace;
            background: #0b1320;
            color: #fff;
            padding: 0.25rem 0.6rem;
            border-radius: 6px;
            font-size: 0.8rem;
            margin-right: 10px;
        }

        /* Checkbox tùy biến cao cấp */
        .matrix-checkbox {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: #059669; /* Xanh lá học thuật */
            transition: transform 0.2s ease;
        }
        .matrix-checkbox:hover {
            transform: scale(1.2);
        }

        /* Hiệu ứng Hover hàng ma trận */
        .matrix-table tr:hover td {
            background-color: #f0f9ff !important;
        }

        /* Nút Lưu ma trận */
        .btn-save-matrix {
            background: #059669;
            color: #fff !important;
            border: none;
            padding: 0.8rem 2.5rem;
            border-radius: 12px;
            font-weight: 700;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            box-shadow: 0 10px 20px rgba(5, 150, 105, 0.2);
            transition: all 0.3s ease;
        }
        .btn-save-matrix:hover {
            background: #047857;
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(5, 150, 105, 0.3);
        }

        .alert-academic {
            border-radius: 14px;
            padding: 1.25rem;
            border: 1px solid #fee2e2;
            background: #fef2f2;
            color: #991b1b;
            font-weight: 500;
        }
    </style>";

    pageStart('CLO-PLO Mapping Matrix', 'grid-3x3', 'text-primary');



    // ── BỘ LỌC CHỌN LỌC (Filter Step-by-Step) ──
    echo "<div class='academic-filter-console'><form method='GET' class='row g-4 align-items-end'><input type='hidden' name='page' value='clo_matrix'>";
    
    echo "<div class='col-md-4'><label class='filter-step-label'>Step 1: Institutional Program</label><select name='program_id' class='form-select academic-select' onchange='this.form.submit()'><option value=''>-- Select Program --</option>";
    foreach ($programs as $p) { $sel=$selProg==$p['id']?'selected':''; echo "<option value='{$p['id']}' $sel>".h($p['code'].' - '.$p['name'])."</option>"; }
    echo "</select></div>";

    if ($selProg && $subjsOfProg) {
        echo "<div class='col-md-4'><label class='filter-step-label'>Step 2: Specific Subject</label><select name='subject_id' class='form-select academic-select' onchange='this.form.submit()'><option value=''>-- Select Subject --</option>";
        foreach ($subjsOfProg as $s) { $sel=$selSubj==$s['id']?'selected':''; echo "<option value='{$s['id']}' $sel>".h($s['code'].' - '.$s['name'])."</option>"; }
        echo "</select></div>";
    }
    echo "</form></div>";

    // ── HIỂN THỊ MA TRẬN TƯƠNG TÁC ──
    if ($selProg && $selSubj) {
        if (empty($plos)) { 
            echo "<div class='alert alert-academic'><i class='bi bi-exclamation-octagon me-2'></i>No PLOs found for this program. <a href='index.php?page=plos' class='alert-link'>Create PLOs first</a></div>"; 
        }
        elseif (empty($clos)) { 
            echo "<div class='alert alert-academic'><i class='bi bi-exclamation-octagon me-2'></i>No CLOs defined for this subject. <a href='index.php?page=clos' class='alert-link'>Add CLOs first</a></div>"; 
        }
        else {
            echo "<div class='matrix-container'>";
            echo "<div class='mb-4 d-flex justify-content-between align-items-center'>";
            echo "<div><h5 class='fw-bold mb-0' style='letter-spacing:-0.5px;'>Alignment Matrix</h5><small class='text-muted'>Map Course Learning Outcomes to Program Outcomes</small></div>";
            echo "<div class='badge bg-light text-dark border px-3 py-2'>Check ✓ to create mapping</div>";
            echo "</div>";

            echo "<form method='POST'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='save_matrix'><input type='hidden' name='program_id' value='$selProg'><input type='hidden' name='subject_id' value='$selSubj'>";
            echo "<div class='table-responsive'><table class='matrix-table'><thead><tr><th class='header-main' style='min-width:250px'>CLO Descriptor \\ PLO Code</th>";
            foreach ($plos as $plo) echo "<th title='".h($plo['description'])."'>".h($plo['code'])."</th>";
            echo "</tr></thead><tbody>";

            foreach ($clos as $clo) {
                echo "<tr><td class='clo-row-header'><span class='clo-code-badge'>".h($clo['code'])."</span><small class='fw-medium text-secondary'>".h(mb_substr($clo['description'],0,60, 'UTF-8'))."...</small></td>";
                foreach ($plos as $plo) {
                    $chk = isset($existing[$clo['id']][$plo['id']]) ? 'checked' : '';
                    echo "<td><input type='checkbox' name='mapping[{$clo['id']}][{$plo['id']}]' value='1' class='form-check-input matrix-checkbox' $chk></td>";
                }
                echo "</tr>";
            }
            echo "</tbody></table></div>";
            echo "<div class='mt-4 pt-3 border-top d-flex justify-content-between align-items-center'>";
            echo "<small class='text-muted'><i class='bi bi-info-circle me-1'></i>Changes are only applied after clicking <strong>Save Matrix</strong>.</small>";
            echo "<button type='submit' class='btn btn-save-matrix'><i class='bi bi-shield-check me-2'></i>Save Mapping Matrix</button></div></form>";
            echo "</div>";
        }
    } else {
        echo "<div class='text-center py-5 opacity-50'><i class='bi bi-grid-3x3-gap fs-1 d-block mb-3'></i>Please select a program and subject to view the matrix.</div>";
    }
    
    layoutEnd();
}