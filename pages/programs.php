<?php
// ── ADMIN: PROGRAMS ──────────────────────────────────────────
function pagePROGRAMS(): void {
    requireRole('admin');
    layoutStart();
    
    // Siêu CSS Quản trị Học thuật Cao cấp - Đẳng cấp Ivy League / Oxford Luxury
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
            -webkit-font-smoothing: antialiased;
        }

        /* Khối điều khiển Form phẳng tối giản sang trọng */
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

        .academic-field-input {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.65rem 1rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: #111827;
            transition: all 0.3s ease;
        }

        .academic-field-input:focus {
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

        .metric-indicator {
            display: inline-flex;
            align-items: center;
            font-size: 0.88rem;
            font-weight: 500;
            color: #374151;
        }

        .metric-indicator span {
            font-weight: 700;
            color: #0b1320;
            margin-right: 4px;
        }

        /* Nút kén Capsule Action Buttons */
        .action-link-premium {
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1.1rem;
            border-radius: 8px;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
        }

        .action-link-premium.edit { 
            color: #1e40af; 
            background: #eff6ff; 
            border: 1px solid #dbeafe;
        }
        .action-link-premium.edit:hover { 
            background: #dbeafe; 
            color: #1e3a8a;
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
            color: #7f1d1d;
            transform: translateY(-1px);
        }

        .action-link-premium button { 
            background: none; border: none; color: inherit; padding: 0; font: inherit; cursor: pointer; display: flex; align-items: center;
        }

        .action-link-premium i {
            font-size: 1rem;
            margin-right: 0.5rem;
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

    pageStart('Programs Management', 'mortarboard', 'text-primary');

    $programs = qAll("SELECT p.*, COUNT(DISTINCT pl.id) plo_count, COUNT(DISTINCT s.id) subj_count FROM programs p LEFT JOIN plos pl ON p.id=pl.program_id LEFT JOIN subjects s ON p.id=s.program_id GROUP BY p.id ORDER BY p.code");
    $edit = isset($_GET['edit']) ? qOne("SELECT * FROM programs WHERE id=?", [(int)$_GET['edit']]) : null;
    $isEdit = (bool)$edit; 
    $act = $isEdit ? 'prog_edit' : 'prog_create';

    // ── FORM ──
    echo "<div class='card academic-console'>";
    echo "<div class='console-header-text'><i class='bi bi-circle-fill me-2 text-dark' style='font-size:6px;'></i>" . ($isEdit ? 'Modify Program Parameters' : 'Register New Institutional Program') . "</div>";
    echo "<div class='card-body p-0'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='$act'>";
    if ($isEdit) echo "<input type='hidden' name='id' value='{$edit['id']}'>";
    
    echo "<div class='col-md-2'><label class='form-label academic-field-label'>Code *</label><input type='text' name='code' class='form-control academic-field-input' placeholder='e.g. BSIT' value='" . h($edit['code'] ?? '') . "' required></div>";
    echo "<div class='col-md-4'><label class='form-label academic-field-label'>Program Name *</label><input type='text' name='name' class='form-control academic-field-input' placeholder='e.g. Bachelor of Information Technology' value='" . h($edit['name'] ?? '') . "' required></div>";
    echo "<div class='col-md-4'><label class='form-label academic-field-label'>Description</label><input type='text' name='description' class='form-control academic-field-input' placeholder='Enter core curriculum notes...' value='" . h($edit['description'] ?? '') . "'></div>";
    
    echo "<div class='col-md-2 d-flex gap-2'>";
    echo "<button type='submit' class='btn btn-luxury-solid w-100'>" . ($isEdit ? 'Save' : 'Deploy') . "</button>";
    if ($isEdit) echo "<a href='index.php?page=programs' class='btn btn-luxury-outline'>Cancel</a>";
    echo "</div></form></div></div>";

    // ── TABLE ──
    echo "<div class='section-sub-title'>Active Institutional Programs</div>";
    echo "<div class='academic-ledger-container'>";
    echo "<table class='table luxury-table'>";
    echo "<thead><tr><th style='width: 12%;'>Code</th><th style='width: 32%;'>Program Title</th><th>Description</th><th style='width: 12%;'>PLOs</th><th style='width: 12%;'>Subjects</th><th style='width: 20%; text-align: right;'>Actions</th></tr></thead><tbody>";
    
    foreach ($programs as $p) {
        echo "<tr>";
        echo "<td><span class='institutional-code'>" . h($p['code']) . "</span></td>";
        echo "<td class='fw-semibold' style='color: #0b1320; font-size: 0.95rem;'>" . h($p['name']) . "</td>";
        echo "<td class='text-muted small' style='line-height: 1.5;'>" . h($p['description'] ?? '—') . "</td>";
        echo "<td><div class='metric-indicator'><span>{$p['plo_count']}</span> PLOs</div></td>";
        echo "<td><div class='metric-indicator'><span>{$p['subj_count']}</span> Subj</div></td>";
        
        // CỘT ACTIONS DUY NHẤT
        echo "<td style='text-align: right; white-space: nowrap;'>";
        
        // Nút EDIT
        echo "<a href='index.php?page=programs&edit={$p['id']}' class='action-link-premium edit'>
                <i class='bi bi-pencil-square'></i> EDIT
              </a>";

        // Nút DELETE
        echo "<form method='POST' class='d-inline' onsubmit='return confirm(\"Delete program?\")'>";
        echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='prog_delete'>
              <input type='hidden' name='id' value='{$p['id']}'>";
        echo "<button type='submit' class='action-link-premium delete'>
                <i class='bi bi-trash3'></i> DELETE
              </button>";
        echo "</form>";

        echo "</td>";
        echo "</tr>";
    }
    
    if (empty($programs)) {
        echo "<tr><td colspan='6' class='text-center text-muted py-5'><i class='bi bi-archive me-1 fs-5 d-block mb-2'></i> No active academic programs found.</td></tr>";
    }
    
    echo "</tbody></table></div>";
    
    layoutEnd();
}