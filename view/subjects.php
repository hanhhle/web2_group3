<?php
// ── ADMIN: SUBJECTS ──────────────────────────────────────────
function pageSUBJECTS(array $subjects = [], array $programs = [], array $lecturers = [], ?array $edit = null): void {
    requirePermission('manage_subjects');
    layoutStart();
    
    // Hệ thống Siêu CSS Quản trị Môn học Cao cấp - Đẳng cấp Đăng kiểm Học thuật Quốc tế
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
            -webkit-font-smoothing: antialiased;
        }

        /* Khối điều khiển Form phẳng tối giản sang trọng (Minimal Luxury Console) */
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

        /* Định dạng các ô nhập liệu và nhãn tinh xảo */
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

        /* Hệ thống nút bấm hành chính cao cấp phẳng tuyệt đối */
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
        .btn-luxury-outline:hover {
            background: #f9fafb;
            border-color: #0b1320;
            color: #0b1320 !important;
        }

        /* Cấu trúc Ledger chứa bảng phẳng thanh lịch (Flat Journal Rows) */
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
            transition: background-color 0.2s ease;
        }

        .luxury-table tr:last-child td {
            border-bottom: none;
        }

        .luxury-table tr:hover td {
            background-color: #fafafa;
        }

        /* Mã định danh môn học phong cách mã hóa tối giản sâu sắc */
        .institutional-code {
            font-family: SFMono-Regular, Consolas, monospace;
            font-weight: 600;
            font-size: 0.8rem;
            color: #0b1320;
            background: #f3f4f6;
            padding: 0.3rem 0.6rem;
            border-radius: 6px;
            border: 1px solid #e5e7eb;
            display: inline-block;
        }
        
        .luxury-table tr:hover .institutional-code {
            background: #0b1320;
            color: #ffffff;
            border-color: #0b1320;
        }

        /* Khối chương trình trực thuộc (Program Scope Tag) */
        .academic-scope-badge {
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.3px;
            padding: 0.3rem 0.65rem;
            border-radius: 6px;
            background: #eff6ff;
            color: #1e40af;
            border: 1px solid #dbeafe;
        }

        /* Khối số liệu Metric đếm cấu trúc thông tin */
        .metric-indicator {
            display: inline-flex;
            align-items: center;
            font-size: 0.88rem;
            font-weight: 500;
            color: #4b5563;
        }
        .metric-indicator span {
            font-weight: 700;
            color: #0b1320;
            margin-right: 4px;
        }

        /* Hệ thống nút Kén hành động tinh xảo (Capsule Action Buttons) */
        .action-link-premium {
            font-size: 0.78rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            padding: 0.45rem 0.9rem;
            border-radius: 8px;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .action-link-premium.edit { 
            color: #1e40af; 
            background: #eff6ff; 
            border: 1px solid #dbeafe;
        }
        .action-link-premium.edit:hover { 
            background: #1e40af; 
            color: #ffffff !important; 
            border-color: #1e40af;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(30, 64, 175, 0.15);
        }

        .action-link-premium.delete { 
            color: #991b1b; 
            background: #fef2f2; 
            border: 1px solid #fee2e2;
            margin-left: 0.75rem; 
        }
        .action-link-premium.delete:hover { 
            background: #dc2626; 
            color: #ffffff !important; 
            border-color: #dc2626;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.15);
        }

        .action-link-premium button { 
            background: none; 
            border: none; 
            color: inherit; 
            padding: 0; 
            font: inherit; 
            cursor: pointer; 
            display: inline-flex;
            align-items: center;
        }

        .action-link-premium i {
            font-size: 0.9rem;
            margin-right: 0.35rem;
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

    // Khởi tạo hiển thị trang con mặc định
    pageStart('Subjects Management', 'book', 'text-warning');

    $isEdit = (bool)$edit; 
    $act = $isEdit ? 'subj_edit' : 'subj_create';

    // ── BẢNG ĐIỀU KHIỂN ĐĂNG KÝ MÔN HỌC (Minimal Luxury Console Form) ──
    echo "<div class='card academic-console'>";
    echo "<div class='console-header-text'><i class='bi bi-circle-fill me-2 text-dark' style='font-size:6px;'></i>" . ($isEdit ? 'Modify Subject Parameters' : 'Register New Institutional Subject') . "</div>";
    echo "<div class='card-body p-0'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='$act'>";
    if ($isEdit) echo "<input type='hidden' name='id' value='{$edit['id']}'>";
    
    // Dropdown chọn chương trình đào tạo
    echo "<div class='col-md-2'><label class='form-label academic-field-label'>Program Route *</label><select name='program_id' class='form-select academic-field-select' required><option value=''>-- Select --</option>";
    foreach ($programs as $p) { 
        $sel = ($edit['program_id'] ?? 0) == $p['id'] ? 'selected' : ''; 
        echo "<option value='{$p['id']}' $sel>" . h($p['code'] . ' - ' . $p['name']) . "</option>"; 
    }
    echo "</select></div>";
    
    echo "<div class='col-md-2'><label class='form-label academic-field-label'>Subject Code *</label><input type='text' name='code' class='form-control academic-field-input' placeholder='e.g. IT302' value='" . h($edit['code'] ?? '') . "' required></div>";
    echo "<div class='col-md-3'><label class='form-label academic-field-label'>Subject Name *</label><input type='text' name='name' class='form-control academic-field-input' placeholder='e.g. Web Development' value='" . h($edit['name'] ?? '') . "' required></div>";
    echo "<div class='col-md-1'><label class='form-label academic-field-label'>Credits *</label><input type='number' name='credits' class='form-control academic-field-input text-center' min='1' max='10' value='" . ($edit['credits'] ?? 3) . "' required></div>";
    
    // Dropdown chọn giảng viên phụ trách
    echo "<div class='col-md-2'><label class='form-label academic-field-label'>Assigned Lecturer *</label><select name='lecturer_id' class='form-select academic-field-select' required><option value=''>-- Select Lecturer --</option>";
    foreach ($lecturers as $l) {
        $sel = ($edit['lecturer_id'] ?? 0) == $l['id'] ? 'selected' : '';
        echo "<option value='{$l['id']}' $sel>" . h($l['full_name']) . "</option>";
    }
    echo "</select></div>";

    echo "<div class='col-md-2 d-flex gap-2'>";
    echo "<button type='submit' class='btn btn-luxury-solid w-100'>" . ($isEdit ? 'Save' : 'Deploy') . "</button>";
    if ($isEdit) echo "<a href='index.php?page=subjects' class='btn btn-luxury-outline'>Cancel</a>";
    echo "</div></form></div></div>";

    // ── MA TRẬN DỮ LIỆU DANH SÁCH MÔN HỌC (Institutional Matrix Ledger) ──
    echo "<div class='section-sub-title'>Active Institutional Curriculum (Total: " . count($subjects) . ")</div>";
    echo "<div class='academic-ledger-container'>";
    echo "<table class='table luxury-table'>";
    echo "<thead><tr><th style='width: 12%;'>Code</th><th style='width: 28%;'>Subject Title</th><th style='width: 15%;'>Program Route</th><th style='width: 10%; text-align: center;'>Credits</th><th style='width: 10%;'>CLOs Mapping</th><th style='width: 12%;'>Assessments</th><th style='width: 13%; text-align: right;'>Actions</th></tr></thead><tbody>";
    
    foreach ($subjects as $s) {
        echo "<tr>";
        // Mã môn học độc bản
        echo "<td><span class='institutional-code'>" . h($s['code']) . "</span></td>";
        // Tên môn học chính quy + tên giảng viên phụ trách
        $lectLabel = $s['lecturer_name'] ? h($s['lecturer_name']) : "<span class='text-danger'>Unassigned</span>";
        echo "<td class='fw-semibold' style='color: #0b1320; font-size: 0.95rem;'>" . h($s['name']) . "<br><small class='text-muted fw-normal' style='font-size:0.75rem;'>Lecturer: $lectLabel</small></td>";
        // Badge mã chương trình trực thuộc sạch sẽ
        echo "<td><span class='academic-scope-badge'>" . h($s['pc']) . "</span></td>";
        // Số tín chỉ căn giữa trang nghiêm
        echo "<td style='text-align: center;'><span class='fw-bold text-secondary' style='font-size: 0.95rem;'>{$s['credits']}</span></td>";
        // Cấu trúc đếm chỉ số đầu ra CLOs
        echo "<td><div class='metric-indicator'><span>{$s['clo_count']}</span> CLOs</div></td>";
        // Cấu trúc đếm chỉ số bài kiểm tra Assessments
        echo "<td><div class='metric-indicator'><span>{$s['assess_count']}</span> Tasks</div></td>";
        
        // Cột tổ hợp nút kén hành động chuyên nghiệp
        echo "<td style='text-align: right; white-space: nowrap;'>";
        echo "<a href='index.php?page=subjects&edit={$s['id']}' class='action-link-premium edit' title='Modify Parameter'><i class='bi bi-pencil-square'></i>Edit</a>";
        
        echo "<form method='POST' class='d-inline' onsubmit='return confirm(\"Delete subject?\")'>";
        echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='subj_delete'><input type='hidden' name='id' value='{$s['id']}'>";
        echo "<button type='submit' class='action-link-premium delete' title='Purge Record'><i class='bi bi-trash3'></i>Delete</button></form>";
        echo "</td>";
        echo "</tr>";
    }
    
    if (empty($subjects)) {
        echo "<tr><td colspan='7' class='text-center text-muted py-5'><i class='bi bi-archive me-1 fs-5 d-block mb-2'></i> No active institutional subjects registered in the curriculum ledger.</td></tr>";
    }
    
    echo "</tbody></table></div>";
    
    layoutEnd();
}