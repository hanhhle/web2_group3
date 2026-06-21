<?php
// ── ADMIN: ENROLLMENTS ───────────────────────────────────────
function pageENROLLMENTS(array $enrollments = [], array $students = [], array $subjects = []): void {
    requirePermission('manage_enrollments');
    layoutStart();
    
    // Hệ thống CSS Quản lý Đăng ký - Tinh tế, sắc nét, chính quy
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
        }

        /* Khối Console nhập liệu phẳng */
        .academic-console {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.01), 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 2rem !important;
            margin-bottom: 3rem !important;
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
            color: #111827;
            transition: all 0.3s ease;
        }

        .academic-field-input:focus, .academic-field-select:focus {
            background: #ffffff;
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.05);
            outline: none;
        }

        /* Nút bấm đăng ký chính */
        .btn-luxury-solid {
            background: #0b1320;
            color: #fff !important;
            border: none;
            border-radius: 10px;
            padding: 0.65rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-luxury-solid:hover {
            background: #1e2937;
            transform: translateY(-1px);
            box-shadow: 0 8px 16px rgba(11, 19, 32, 0.1);
        }

        /* Container bảng danh sách */
        .academic-ledger-container {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            overflow: hidden;
        }

        .luxury-table {
            width: 100%;
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
            padding: 1.2rem 2rem !important;
            vertical-align: middle;
            font-size: 0.9rem;
            border-bottom: 1px solid #f3f4f6;
        }

        /* Nhãn hiển thị chuyên biệt cho Enrollment */
        .academic-subject-badge {
            font-family: monospace;
            font-weight: 700;
            background: #fffbeb;
            color: #92400e;
            padding: 0.3rem 0.6rem;
            border-radius: 6px;
            border: 1px solid #fef3c7;
            margin-right: 8px;
        }

        .semester-pill {
            background: #f0fdf4;
            color: #16a34a;
            font-weight: 700;
            font-size: 0.75rem;
            padding: 0.3rem 0.75rem;
            border-radius: 100px;
            border: 1px solid #dcfce7;
        }

        /* Nút Hủy đăng ký (Unenroll) dạng Kén Ruby */
        .action-link-premium.delete { 
            color: #991b1b; 
            background: #fef2f2; 
            border: 1px solid #fee2e2;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            padding: 0.45rem 0.9rem;
            border-radius: 8px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            transition: all 0.2s ease;
        }
        .action-link-premium.delete:hover { 
            background: #dc2626; 
            color: #fff !important; 
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.15);
        }
        .action-link-premium button { background: none; border: none; color: inherit; padding: 0; cursor: pointer; display: flex; align-items: center; font: inherit; }

        .user-identity {
            font-weight: 600;
            color: #111827;
        }
    </style>";

    pageStart('Student Enrollments', 'person-check', 'text-primary');

    
    
    

    // ── BIỂU MẪU ĐĂNG KÝ HỌC PHẦN (Enroll Console) ──
    echo "<div class='card academic-console'>";
    echo "<div class='console-header-text'><i class='bi bi-plus-circle-fill me-2 text-primary'></i>Initialize New Enrollment</div>";
    echo "<div class='card-body p-0'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='enroll'>";
    
    echo "<div class='col-md-4'><label class='academic-field-label'>Select Student *</label><select name='student_id' class='form-select academic-field-select' required><option value=''>-- Select Student --</option>";
    foreach ($students as $s) echo "<option value='{$s['id']}'>".h($s['full_name'].' ('.$s['username'].')')."</option>";
    echo "</select></div>";

    echo "<div class='col-md-4'><label class='academic-field-label'>Academic Subject *</label><select name='subject_id' class='form-select academic-field-select' required><option value=''>-- Select Subject --</option>";
    foreach ($subjects as $s) echo "<option value='{$s['id']}'>".h($s['code'].' - '.$s['name'])."</option>";
    echo "</select></div>";

    $semesters = ['2023-1', '2023-2', '2024-1', '2024-2', '2025-1', '2025-2'];
    if (!in_array(SEMESTER, $semesters)) {
        $semesters[] = SEMESTER;
    }
    echo "<div class='col-md-2'><label class='academic-field-label'>Term / Semester *</label><select name='semester' class='form-select academic-field-select text-center' required>";
    foreach ($semesters as $sOpt) {
        $sel = (SEMESTER === $sOpt) ? 'selected' : '';
        echo "<option value='" . h($sOpt) . "' $sel>" . h($sOpt) . "</option>";
    }
    echo "</select></div>";

    echo "<div class='col-md-2'>";
    echo "<button type='submit' class='btn btn-luxury-solid w-100'><i class='bi bi-person-plus me-2'></i>Enroll</button>";
    echo "</div>";
    echo "</form></div></div>";

    // ── DANH SÁCH ĐĂNG KÝ (Enrollment Registry) ──
    echo "<div class='section-sub-title mb-3' style='font-size:0.75rem; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#6b7280;'>Institutional Registry: ".count($enrollments)." active enrollments</div>";
    echo "<div class='academic-ledger-container'>";
    echo "<table class='luxury-table'>";
    echo "<thead><tr><th>Student Identity</th><th>Enrolled Subject</th><th>Academic Term</th><th>Timestamp</th><th style='text-align:right;'>Management</th></tr></thead><tbody>";
    
    foreach ($enrollments as $e) {
        echo "<tr>";
        echo "<td><div class='user-identity'>".h($e['sn'])."</div><small class='text-muted' style='font-family:monospace;'>".h($e['un'])."</small></td>";
        echo "<td><span class='academic-subject-badge'>".h($e['subjc'])."</span><span class='fw-medium'>".h($e['subjn'])."</span></td>";
        echo "<td><span class='semester-pill'>".h($e['semester'])."</span></td>";
        echo "<td class='text-muted' style='font-size:0.85rem;'>".date('d M Y', strtotime($e['enrolled_at']))."</td>";
        
        // Cột Hành động
        echo "<td style='text-align:right;'>";
        echo "<form method='POST' class='d-inline' onsubmit='return confirm(\"Remove this enrollment?\")'>";
        echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='unenroll'><input type='hidden' name='id' value='{$e['id']}'>";
        echo "<button type='submit' class='action-link-premium delete'><i class='bi bi-x-circle me-2'></i>Unenroll</button></form>";
        echo "</td>";
        echo "</tr>";
    }
    
    if (empty($enrollments)) {
        echo "<tr><td colspan='5' class='text-center py-5 text-muted'><i class='bi bi-inbox fs-4 d-block mb-2'></i>No enrollment records found in the current term.</td></tr>";
    }
    
    echo "</tbody></table></div>";
    
    layoutEnd();
}