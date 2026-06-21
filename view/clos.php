<?php
// ── ADMIN: CLOs ──────────────────────────────────────────────
function pageCLOS(array $clos = [], array $subjects = [], ?array $edit = null): void {
    requirePermission('manage_clos');
    layoutStart();
    
    // Hệ thống Siêu CSS Quản trị CLO Cao cấp - Tinh tế và Chính quy
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
            -webkit-font-smoothing: antialiased;
        }

        /* Khối Console điều khiển nhập liệu */
        .academic-console {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.01), 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 2rem !important;
            margin-bottom: 3rem !important;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }
        
        .academic-console:focus-within {
            border-color: #0ea5e9; /* Sky Blue cho CLO */
            box-shadow: 0 20px 40px rgba(14, 165, 233, 0.05);
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
            border-color: #0ea5e9;
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.08);
            outline: none;
        }

        /* Nút bấm Deploy/Save */
        .btn-luxury-solid-info {
            background: #0ea5e9;
            border: none;
            color: #ffffff !important;
            border-radius: 10px;
            padding: 0.65rem 1.5rem;
            font-size: 0.9rem;
            font-weight: 600;
            letter-spacing: 0.3px;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .btn-luxury-solid-info:hover {
            background: #0284c7;
            transform: translateY(-1px);
            box-shadow: 0 8px 16px rgba(14, 165, 233, 0.2);
        }

        .btn-luxury-outline {
            background: transparent;
            border: 1px solid #e5e7eb;
            color: #4b5563 !important;
            border-radius: 10px;
            padding: 0.65rem 1.5rem;
            font-size: 0.9rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        /* Container Ledger */
        .academic-ledger-container {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.01), 0 12px 30px rgba(0, 0, 0, 0.02);
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

        /* Badges đặc thù cho CLO */
        .institutional-code-info {
            font-family: SFMono-Regular, Consolas, monospace;
            font-weight: 700;
            font-size: 0.8rem;
            color: #0369a1;
            background: #f0f9ff;
            padding: 0.3rem 0.6rem;
            border-radius: 6px;
            border: 1px solid #e0f2fe;
        }

        .academic-subject-badge {
            font-size: 0.75rem;
            font-weight: 600;
            padding: 0.3rem 0.65rem;
            border-radius: 6px;
            background: #fffbeb;
            color: #92400e;
            border: 1px solid #fef3c7;
        }

        .metric-indicator-success {
            display: inline-flex;
            align-items: center;
            font-size: 0.88rem;
            font-weight: 600;
            color: #059669;
            background: #ecfdf5;
            padding: 0.2rem 0.6rem;
            border-radius: 6px;
        }

        /* Capsule Action Buttons (Đồng bộ với các trang trước) */
        .action-link-premium {
            font-size: 0.82rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.2s ease-in-out;
        }

        .action-link-premium.edit { 
            color: #1e40af; 
            background: #eff6ff; 
            border: 1px solid #dbeafe;
        }
        .action-link-premium.edit:hover { 
            background: #dbeafe; 
            transform: translateY(-1px);
        }

        .action-link-premium.delete { 
            color: #991b1b; 
            background: #fef2f2; 
            border: 1px solid #fee2e2;
            margin-left: 0.75rem; 
        }
        .action-link-premium.delete:hover { 
            background: #fee2e2; 
            transform: translateY(-1px);
        }

        .action-link-premium button { 
            background: none; border: none; color: inherit; padding: 0; font: inherit; cursor: pointer; display: flex; align-items: center;
        }

        .action-link-premium i {
            font-size: 1rem;
            margin-right: 0.4rem;
        }

        .section-sub-title {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #6b7280;
            margin-bottom: 1rem;
            margin-left: 0.5rem;
        }
    </style>";

    pageStart('CLOs Management','diagram-3','text-info');

    
    
    
    $isEdit = (bool)$edit; 
    $act = $isEdit?'clo_edit':'clo_create';

    // ── BIỂU MẪU ĐIỀU KHIỂN (Formal Console) ──
    echo "<div class='card academic-console'>";
    echo "<div class='console-header-text'><i class='bi bi-circle-fill me-2 text-info' style='font-size:6px;'></i>".($isEdit?'Modify Learning Outcome':'Register New Course Outcome')."</div>";
    echo "<div class='card-body p-0'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='$act'>";
    if ($isEdit) echo "<input type='hidden' name='id' value='{$edit['id']}'>";
    
    echo "<div class='col-md-3'><label class='form-label academic-field-label'>Parent Subject *</label><select name='subject_id' class='form-select academic-field-select' required><option value=''>-- Select --</option>";
    foreach ($subjects as $s) { 
        $sel=($edit['subject_id']??0)==$s['id']?'selected':''; 
        echo "<option value='{$s['id']}' $sel>".h($s['code'].' - '.$s['name'])."</option>"; 
    }
    echo "</select></div>";
    
    echo "<div class='col-md-2'><label class='form-label academic-field-label'>CLO Identifier *</label><input type='text' name='code' class='form-control academic-field-input' placeholder='e.g. CLO1' value='".h($edit['code']??'')."' required></div>";
    echo "<div class='col-md-5'><label class='form-label academic-field-label'>Outcome Description *</label><input type='text' name='description' class='form-control academic-field-input' placeholder='Expected competency description...' value='".h($edit['description']??'')."' required></div>";
    
    echo "<div class='col-md-2 d-flex gap-2'>";
    echo "<button type='submit' class='btn btn-luxury-solid-info w-100'>".($isEdit?'Update':'Deploy')."</button>";
    if ($isEdit) echo "<a href='index.php?page=clos' class='btn btn-luxury-outline'>Cancel</a>";
    echo "</div></form></div></div>";

    // ── DANH SÁCH CLO (Academic Ledger) ──
    echo "<div class='section-sub-title'>Course Learning Outcomes (Total: ".count($clos).")</div>";
    echo "<div class='academic-ledger-container'>";
    echo "<table class='table luxury-table'>";
    echo "<thead><tr><th style='width: 20%;'>Subject</th><th style='width: 12%;'>CLO Code</th><th>Outcome Description</th><th style='width: 15%;'>PLO Mappings</th><th style='width: 20%; text-align: right;'>Actions</th></tr></thead><tbody>";
    
    foreach ($clos as $c) {
        echo "<tr>";
        echo "<td><span class='academic-subject-badge'>".h($c['sc'])."</span> <br><small class='text-muted' style='font-size:0.75rem;'>".h($c['sn'])."</small></td>";
        echo "<td><span class='institutional-code-info'>".h($c['code'])."</span></td>";
        echo "<td class='fw-medium' style='color: #374151;'>".h($c['description'])."</td>";
        echo "<td><div class='metric-indicator-success'><span>{$c['map_count']}</span> PLOs</div></td>";
        
        // Cột Actions dạng Kén
        echo "<td style='text-align: right; white-space: nowrap;'>";
        echo "<a href='index.php?page=clos&edit={$c['id']}' class='action-link-premium edit'><i class='bi bi-pencil-square'></i> EDIT</a>";
        
        echo "<form method='POST' class='d-inline' onsubmit='return confirm(\"Delete CLO?\")'>";
        echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='clo_delete'><input type='hidden' name='id' value='{$c['id']}'>";
        echo "<button type='submit' class='action-link-premium delete'><i class='bi bi-trash3'></i> DELETE</button></form>";
        echo "</td>";
        echo "</tr>";
    }
    
    if (empty($clos)) {
        echo "<tr><td colspan='5' class='text-center text-muted py-5'><i class='bi bi-diagram-3 d-block mb-2 fs-4'></i> No CLO records found in the ledger.</td></tr>";
    }
    
    echo "</tbody></table></div>";
    
    layoutEnd();
}