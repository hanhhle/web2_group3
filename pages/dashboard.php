<?php
function pageDASHBOARD(): void {
    requireLogin();
    layoutStart();
    $r = role(); $u = uid();
    $totalUsers    = qOne("SELECT COUNT(*) c FROM users")['c'];
    $totalSubjects = qOne("SELECT COUNT(*) c FROM subjects")['c'];
    $totalClos     = qOne("SELECT COUNT(*) c FROM clos")['c'];
    $totalPlos     = qOne("SELECT COUNT(*) c FROM plos")['c'];
    $totalLedger   = qOne("SELECT COUNT(*) c FROM score_ledger")['c'];
    $totalAssess   = qOne("SELECT COUNT(*) c FROM assessments")['c'];

    // Toàn bộ CSS được thiết kế lại theo trường phái Luxury Minimalist
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fdfdfd !important; 
            color: #0f172a; 
            font-family: 'Plus Jakarta Sans', sans-serif !important;
        }
        
        /* Tiêu đề thanh lịch, mượt mà */
        .page-title {
            font-weight: 700;
            font-size: 1.6rem;
            letter-spacing: -0.5px;
            color: #0f172a;
        }
        
        .page-subtitle {
            font-size: 0.85rem;
            color: #64748b;
            letter-spacing: 0.2px;
        }

        /* Thẻ Luxury Card - Loại bỏ hoàn toàn viền màu thô cứng */
        .luxury-card {
            background: #ffffff;
            border: 1px solid rgba(15, 23, 42, 0.05);
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.01), 
                        0 10px 30px -5px rgba(15, 23, 42, 0.03);
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }
        
        .luxury-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 1px 3px rgba(0,0,0,0.01), 
                        0 25px 50px -12px rgba(15, 23, 42, 0.08);
            border-color: rgba(15, 23, 42, 0.08);
        }

        /* Khung chứa Icon đơn sắc, tinh xảo */
        .luxury-icon-box {
            width: 46px;
            height: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #f8fafc;
            color: #475569;
            font-size: 1.25rem;
            border: 1px solid rgba(15, 23, 42, 0.03);
            transition: all 0.3s ease;
        }
        
        .luxury-card:hover .luxury-icon-box {
            background: #0f172a;
            color: #ffffff;
        }

        /* Định dạng số liệu thống kê lớn thanh mảnh */
        .stat-value {
            font-size: 2.1rem;
            font-weight: 600;
            letter-spacing: -1px;
            color: #0f172a;
            line-height: 1.1;
            margin-top: 1rem;
        }

        .stat-label {
            font-size: 0.72rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #94a3b8;
            margin-top: 0.4rem;
        }

        /* Tiêu đề khối thông tin theo phong cách Art Gallery */
        .luxury-header {
            padding: 1.5rem 1.5rem 1rem 1.5rem;
            background: transparent;
            border-bottom: none;
            font-weight: 600;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            color: #1e293b;
        }

        /* Nút bấm hành động tối giản cao cấp */
        .luxury-action-btn {
            background: #f8fafc;
            border: 1px solid rgba(15, 23, 42, 0.04);
            color: #334155 !important;
            border-radius: 12px;
            padding: 0.85rem 1.2rem;
            font-weight: 500;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }
        
        .luxury-action-btn div {
            display: flex;
            align-items: center;
        }
        
        .luxury-action-btn i.btn-icon {
            font-size: 1.1rem;
            margin-right: 0.8rem;
            color: #64748b;
            transition: color 0.3s ease;
        }
        
        .luxury-action-btn i.arrow-icon {
            font-size: 0.8rem;
            opacity: 0;
            transform: translateX(-5px);
            transition: all 0.3s ease;
        }

        .luxury-action-btn:hover {
            background: #ffffff;
            border-color: #0f172a;
            color: #0f172a !important;
            box-shadow: 0 4px 12px rgba(0,0,0,0.03);
        }
        
        .luxury-action-btn:hover i.btn-icon { color: #0f172a; }
        .luxury-action-btn:hover i.arrow-icon { opacity: 1; transform: translateX(0); }

        /* Nút bấm nổi bật (Primary Action) */
        .luxury-action-btn.btn-main {
            background: #0f172a;
            color: #ffffff !important;
            border: none;
        }
        .luxury-action-btn.btn-main i.btn-icon { color: #94a3b8; }
        .luxury-action-btn.btn-main:hover {
            background: #1e293b;
            color: #ffffff !important;
        }
        .luxury-action-btn.btn-main:hover i.btn-icon { color: #ffffff; }

        /* Bảng hiển thị dữ liệu tinh xảo */
        .luxury-table th {
            background-color: #f8fafc !important;
            color: #64748b;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.7rem;
            letter-spacing: 0.8px;
            padding: 0.85rem 1.5rem !important;
            border-bottom: 1px solid #f1f5f9;
        }
        
        .luxury-table td {
            padding: 1rem 1.5rem !important;
            vertical-align: middle;
            color: #334155;
            font-size: 0.9rem;
            border-bottom: 1px solid #f8fafc;
        }
        
        .luxury-table tr:hover td {
            background-color: #fbfcfd;
        }

        /* Badge thiết kế mỏng nhẹ tinh giản */
        .luxury-badge {
            font-size: 0.72rem;
            font-weight: 500;
            letter-spacing: 0.3px;
            padding: 0.3rem 0.6rem;
            border-radius: 6px;
            background: #f1f5f9;
            color: #475569;
            border: 1px solid rgba(0,0,0,0.02);
        }
        
        .luxury-badge.badge-view {
            padding: 0.5rem 1rem;
            border-radius: 30px;
            background: #0f172a;
            color: #ffffff;
            font-weight: 600;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
    </style>";

    // Khu vực Header trang tối giản sang trọng
    echo "<div class='d-flex justify-content-between align-items-end mb-5 pb-3 border-bottom' style='border-color: #f1f5f9 !important;'>";
    echo "<div><h4 class='mb-1 page-title'>System Dashboard</h4>";
    echo "<span class='page-subtitle'>Welcome back, <strong>".h(fullName())."</strong></span></div>";
    echo "<span class='luxury-badge badge-view shadow-sm'>".h($r)." perspective</span></div>";
    
    renderFlash();

    // ==========================================
    // GIAO DIỆN ADMIN (Luxury Monochrome)
    // ==========================================
    if ($r === 'admin') {
        $stats = [
            ['icon' => 'people',         'val' => $totalUsers,    'label' => 'Total Users'],
            ['icon' => 'book',           'val' => $totalSubjects, 'label' => 'Subjects'],
            ['icon' => 'bullseye',       'val' => $totalPlos,     'label' => 'Program PLOs'],
            ['icon' => 'diagram-3',      'val' => $totalClos,     'label' => 'Course CLOs'],
            ['icon' => 'fingerprint',    'val' => $totalLedger,   'label' => 'Ledger Logs'],
            ['icon' => 'shield-check',   'val' => $totalAssess,   'label' => 'Assessments'],
        ];

        echo "<div class='row g-4 mb-5'>";
        foreach ($stats as $s) {
            echo "<div class='col-6 col-md-2'>";
            echo "<div class='card luxury-card p-4 h-100'>";
            echo "<div class='luxury-icon-box'><i class='bi bi-{$s['icon']}'></i></div>";
            echo "<div class='stat-value'>{$s['val']}</div>";
            echo "<div class='stat-label'>{$s['label']}</div>";
            echo "</div></div>";
        }
        echo "</div>";

        echo "<div class='row g-4'>";
        // Khối Quản lý Đào tạo
        echo "<div class='col-md-4'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-mortarboard me-2'></i>Academic Structure</div><div class='card-body d-flex flex-column gap-2 p-4 pt-0'>";
        foreach ([['programs','mortarboard','Degree Programs'],['subjects','book','Manage Subjects'],['plos','bullseye','Program PLOs'],['clos','diagram-3','Course CLOs'],['clo_matrix','grid-3x3','CLO-PLO Mapping']] as $b) {
            echo "<a href='index.php?page={$b[0]}' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-{$b[1]} btn-icon'></i>{$b[2]}</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        }
        echo "</div></div></div>";
        
        // Khối Quản lý Tài khoản
        echo "<div class='col-md-4'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-people me-2'></i>Identity & Access</div><div class='card-body d-flex flex-column gap-2 p-4 pt-0'>";
        echo "<a href='index.php?page=users' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-person-gear btn-icon'></i>User Accounts</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "<a href='index.php?page=enrollments' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-person-check btn-icon'></i>Course Enrollments</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "</div></div></div>";
        
        // Khối Bảo mật & Ledger
        echo "<div class='col-md-4'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-shield-lock me-2'></i>Data Integrity</div><div class='card-body d-flex flex-column gap-2 p-4 pt-0'>";
        echo "<a href='index.php?page=ledger' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-fingerprint btn-icon'></i>Cryptographic Ledger</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "<a href='index.php?page=audit_logs' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-journal-text btn-icon'></i>System Audit Logs</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        $pendingCount = (int)(qOne("SELECT COUNT(*) c FROM grade_change_requests WHERE status='pending'")['c']);
        $pendingBadge = $pendingCount > 0 ? " <span class='badge bg-danger ms-1' style='font-size:0.6rem;'>{$pendingCount}</span>" : '';
        echo "<a href='index.php?page=grade_requests' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-arrow-repeat btn-icon'></i>Grade Change Requests{$pendingBadge}</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "</div></div></div></div>";
    }

    // ==========================================
    // GIAO DIỆN LECTURER (Luxury Monochrome)
    // ==========================================
    elseif ($r === 'lecturer') {
        $myAssess = qAll("SELECT a.*,s.name sn,s.code sc FROM assessments a JOIN subjects s ON a.subject_id=s.id WHERE a.lecturer_id=? ORDER BY a.created_at DESC LIMIT 5",[$u]);
        $mySubjCount = qOne("SELECT COUNT(DISTINCT subject_id) c FROM assessments WHERE lecturer_id=?",[$u])['c'];
        
        echo "<div class='row g-4 mb-5'>";
        foreach ([
            ['clipboard-check', count($myAssess), 'My Assessments'],
            ['book',            $mySubjCount,     'Assigned Subjects'],
            ['fingerprint',     $totalLedger,     'Global Ledger Blocks'],
        ] as $s) {
            echo "<div class='col-md-3'>";
            echo "<div class='card luxury-card p-4 h-100'>";
            echo "<div class='luxury-icon-box'><i class='bi bi-{$s[0]}'></i></div>";
            echo "<div class='stat-value'>{$s[1]}</div>";
            echo "<div class='stat-label'>{$s[2]}</div>";
            echo "</div></div>";
        }
        
        // Ô xác thực mã hóa thiết kế tinh xảo liền khối
        echo "<div class='col-md-3'><div class='card luxury-card p-4 h-100' style='background: linear-gradient(to bottom right, #fafbfc, #ffffff); border: 1px dashed #cbd5e1;'>";
        echo "<a href='index.php?page=verify_ledger' class='text-decoration-none d-flex flex-column h-100 justify-content-between'>";
        echo "<div><div class='luxury-icon-box' style='background:#0f172a; color:#fff;'><i class='bi bi-shield-shaded'></i></div>";
        echo "<div class='fw-semibold text-dark fs-6 mt-3 mb-1'>Verify Ledger Integrity</div>";
        echo "<div class='text-muted' style='font-size:0.8rem; line-height:1.4;'>Audit cryptographic hash-links of current grades.</div></div>";
        echo "<span class='text-dark fw-semibold small mt-3 d-inline-flex align-items-center' style='font-size:0.82rem;'>Execute Audit <i class='bi bi-arrow-right ms-1'></i></span></a></div></div>";
        echo "</div>";

        echo "<div class='row g-4'>";
        // Thao tác nhanh của giảng viên
        echo "<div class='col-md-4'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-lightning me-2'></i>Quick Actions</div><div class='card-body d-flex flex-column gap-2 p-4 pt-0'>";
        foreach ([['assessments','plus-circle','Create Assessment'],['rubrics','list-check','Configure Rubrics'],['grade','pencil-square','Enter Student Marks'],['verify_ledger','shield-check','Verify Ledger Blocks'],['my_requests','arrow-repeat','My Change Requests']] as $b) {
            echo "<a href='index.php?page={$b[0]}' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-{$b[1]} btn-icon'></i>{$b[2]}</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        }
        echo "</div></div></div>";
        
        // Bảng danh sách cấu trúc tối giản
        echo "<div class='col-md-8'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-clock-history me-2'></i>Recent Assessments Log</div><div class='card-body p-0 pb-2'>";
        echo "<div class='table-responsive'><table class='table luxury-table mb-0'><thead><tr><th>Subject</th><th>Assessment Title</th><th class='text-end'>Type</th></tr></thead><tbody>";
        foreach ($myAssess as $a) {
            echo "<tr><td><span class='luxury-badge fw-semibold'>".h($a['sc'])."</span></td>";
            echo "<td class='fw-medium text-dark'>".h($a['name'])."</td>";
            echo "<td class='text-end'><span class='text-muted small fw-medium'>".strtoupper($a['type'])."</span></td></tr>";
        }
        if (empty($myAssess)) echo "<tr><td colspan='3' class='text-center text-muted py-5'><i class='bi bi-cloud-slash d-block mb-2 fs-4'></i>No recent activities recorded.</td></tr>";
        echo "</tbody></table></div></div></div></div></div>";
    }

    // ==========================================
    // GIAO DIỆN STUDENT (Luxury Monochrome)
    // ==========================================
    elseif ($r === 'student') {
        $myEnr = qAll("SELECT se.*,s.name sn,s.code sc,s.credits FROM student_enrollments se JOIN subjects s ON se.subject_id=s.id WHERE se.student_id=?",[$u]);
        $myScores = qOne("SELECT COUNT(*) c FROM student_scores ss JOIN student_enrollments se ON ss.enrollment_id=se.id WHERE se.student_id=?",[$u])['c'];
        
        echo "<div class='row g-4 mb-5'>";
        foreach ([
            ['book',        count($myEnr), 'Enrolled Courses'],
            ['activity',    $myScores,     'Graded Metrics'],
            ['calendar-o',  SEMESTER,      'Current Semester']
        ] as $s) {
            echo "<div class='col-md-4'>";
            echo "<div class='card luxury-card p-4 h-100'>";
            echo "<div class='luxury-icon-box'><i class='bi bi-{$s[0]}'></i></div>";
            echo "<div class='stat-value'>{$s[1]}</div>";
            echo "<div class='stat-label'>{$s[2]}</div>";
            echo "</div></div>";
        }
        echo "</div>";

        echo "<div class='row g-4'>";
        // Chương trình học hiện tại của sinh viên
        echo "<div class='col-md-6'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-journal-text me-2'></i>Current Curriculum</div><div class='card-body p-0 pb-2'>";
        echo "<div class='table-responsive'><table class='table luxury-table mb-0'><thead><tr><th>Code</th><th>Subject Title</th><th class='text-center'>Credits</th></tr></thead><tbody>";
        foreach ($myEnr as $e) {
            echo "<tr><td><span class='luxury-badge fw-semibold'>".h($e['sc'])."</span></td>";
            echo "<td class='fw-medium text-dark'>".h($e['sn'])."</td>";
            echo "<td class='text-center text-secondary fw-medium'>{$e['credits']}</td></tr>";
        }
        if (empty($myEnr)) echo "<tr><td colspan='3' class='text-center text-muted py-5'><i class='bi bi-folder-x d-block mb-2 fs-4'></i>No course registrations found.</td></tr>";
        echo "</tbody></table></div></div></div>";
        
        // Các cổng kết nối báo cáo kết quả học tập lớn
        echo "<div class='col-md-6'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-award me-2'></i>Performance Analytics</div><div class='card-body d-flex flex-column justify-content-center gap-3 p-4 pt-0'>";
        echo "<a href='index.php?page=grades' class='luxury-action-btn btn-main py-3'><span class='fw-semibold'><i class='bi bi-grid-3x3-gap btn-icon'></i>View Academic Grade Sheet</span> <i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "<a href='index.php?page=clo_report' class='luxury-action-btn py-3'><span class='fw-semibold'><i class='bi bi-diagram-3 btn-icon'></i>CLO Attainment Metrics Report</span> <i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "</div></div></div>";
        echo "</div>";
    }
    
    layoutEnd();
}