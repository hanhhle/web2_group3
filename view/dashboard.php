<?php
function pageDASHBOARD(array $data = []): void {
    extract($data);
    requireLogin();
    layoutStart();
    $r = role(); $u = uid();

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
        
        .bg-success-soft { background: #ecfdf5 !important; color: #059669 !important; border: 1px solid #bbf7d0 !important; }
        .bg-danger-soft { background: #fef2f2 !important; color: #dc2626 !important; border: 1px solid #fecaca !important; }
        .border-success-soft { border-color: #bbf7d0 !important; }
        .border-danger-soft { border-color: #fecaca !important; }
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
        echo "<a href='index.php?page=verify_ledger' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-shield-check btn-icon'></i>Verify Ledger Blocks</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "<a href='index.php?page=audit_logs' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-journal-text btn-icon'></i>System Audit Logs</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        $pendingBadge = (isset($pendingCount) && $pendingCount > 0) ? " <span class='badge bg-danger ms-1' style='font-size:0.6rem;'>{$pendingCount}</span>" : '';
        echo "<a href='index.php?page=grade_requests' class='luxury-action-btn'><span class='fw-medium'><i class='bi bi-arrow-repeat btn-icon'></i>Grade Change Requests{$pendingBadge}</span><i class='bi bi-chevron-right arrow-icon'></i></a>";
        echo "</div></div></div></div>";
    }

    // ==========================================
    // GIAO DIỆN LECTURER (Luxury Monochrome)
    // ==========================================
    elseif ($r === 'lecturer') {
        $myAssess = $myAssess ?? [];
        $mySubjCount = $mySubjCount ?? 0;
        
        echo "<div class='row g-4 mb-5'>";
        foreach ([
            ['clipboard-check', count($myAssess), 'My Assessments'],
            ['book',            $mySubjCount,     'Assigned Subjects'],
            ['fingerprint',     $totalLedger,     'Global Ledger Blocks'],
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
        // Thao tác nhanh của giảng viên
        echo "<div class='col-md-4'><div class='card luxury-card h-100'><div class='luxury-header'><i class='bi bi-lightning me-2'></i>Quick Actions</div><div class='card-body d-flex flex-column gap-2 p-4 pt-0'>";
        foreach ([['assessments','plus-circle','Create Assessment'],['rubrics','list-check','Configure Rubrics'],['grade','pencil-square','Enter Student Marks'],['my_requests','arrow-repeat','My Change Requests']] as $b) {
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
    // GIAO DIỆN STUDENT (Luxury Pink/Rose Accent)
    // ==========================================
    elseif ($r === 'student') {
        $myEnr = $myEnr ?? [];
        $myScores = $myScores ?? 0;

        // Load Chart.js CDN (using cdnjs hosted by Cloudflare for max speed/reliability in VN)
        echo "<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js'></script>";

        // Helper function to split long subject names into arrays of lines for multi-line X-axis wrapping
        if (!function_exists('splitSubjectName')) {
            function splitSubjectName(string $name): array {
                $words = explode(' ', $name);
                $lines = [];
                $currentLine = '';
                foreach ($words as $word) {
                    if (mb_strlen($currentLine . ' ' . $word) > 16) {
                        $lines[] = trim($currentLine);
                        $currentLine = $word;
                    } else {
                        $currentLine .= ' ' . $word;
                    }
                }
                if (trim($currentLine) !== '') {
                    $lines[] = trim($currentLine);
                }
                return $lines;
            }
        }

        // Pre-calculate grades for summary table and visualization grouped by semester
        $semMap = [
            '2025-1' => 'Semester 1 (2025-2026)',
            '2024-2' => 'Semester 2 (2024-2025)',
            '2024-1' => 'Semester 1 (2024-2025)'
        ];

        $groupedData = $groupedData ?? [];

        // Setup default/initial semester data dynamically using the configured SEMESTER constant
        $defaultSemId = defined('SEMESTER') ? SEMESTER : '2025-1';
        $defaultSemester = $semMap[$defaultSemId] ?? 'Semester 1 (2025-2026)';
        
        $initialCurriculum = $groupedData[$defaultSemester]['curriculum'] ?? [];
        $jsonLabels = json_encode($groupedData[$defaultSemester]['chart']['labels'] ?? []);
        $jsonStudentScores = json_encode($groupedData[$defaultSemester]['chart']['scores'] ?? []);
        $jsonClassAverages = json_encode($groupedData[$defaultSemester]['chart']['averages'] ?? []);

        $jsonSemesterData = json_encode($groupedData);

        // Stats overview cards (with dynamic IDs for Semester Switcher)
        echo "<div class='row g-4 mb-5'>";
        
        // Card 1: Enrolled Courses
        $enrolledCount = count($initialCurriculum);
        echo "<div class='col-md-4'>";
        echo "<div class='card luxury-card p-4 h-100'>";
        echo "<div class='luxury-icon-box'><i class='bi bi-book'></i></div>";
        echo "<div class='stat-value' id='stat-enrolled-courses'>{$enrolledCount}</div>";
        echo "<div class='stat-label'>Enrolled Courses</div>";
        echo "</div></div>";

        // Card 2: Graded Metrics
        echo "<div class='col-md-4'>";
        echo "<div class='card luxury-card p-4 h-100'>";
        echo "<div class='luxury-icon-box'><i class='bi bi-activity'></i></div>";
        echo "<div class='stat-value'>{$myScores}</div>";
        echo "<div class='stat-label'>Graded Metrics</div>";
        echo "</div></div>";

        // Card 3: Current Semester
        echo "<div class='col-md-4'>";
        echo "<div class='card luxury-card p-4 h-100'>";
        echo "<div class='luxury-icon-box'><i class='bi bi-calendar-o'></i></div>";
        echo "<div class='stat-value' id='stat-current-semester' style='font-size: 1.35rem; margin-top: 1.5rem; font-weight: 700;'>{$defaultSemester}</div>";
        echo "<div class='stat-label'>Current Semester</div>";
        echo "</div></div>";

        echo "</div>";

        echo "<div class='row g-4'>";
        // Chương trình học hiện tại của sinh viên
        echo "<div class='col-md-4'><div class='card luxury-card h-100'><div class='luxury-header' id='curriculum-header-text'><i class='bi bi-journal-text me-2'></i>Current Curriculum - " . h($defaultSemester) . "</div><div class='card-body p-0 pb-2'>";
        echo "<div class='table-responsive'><table class='table luxury-table mb-0'><thead><tr><th>Code</th><th>Subject Title</th><th class='text-center'>Credits</th></tr></thead><tbody id='curriculum-table-body'>";
        foreach ($initialCurriculum as $item) {
            echo "<tr><td><span class='luxury-badge fw-semibold'>".h($item['code'])."</span></td>";
            echo "<td class='fw-medium text-dark'>".h($item['name'])."</td>";
            echo "<td class='text-center text-secondary fw-medium'>{$item['credits']}</td></tr>";
        }
        if (empty($initialCurriculum)) echo "<tr><td colspan='3' class='text-center text-muted py-5'><i class='bi bi-folder-x d-block mb-2 fs-4'></i>No course registrations found.</td></tr>";
        echo "</tbody></table></div></div></div></div>";
        
        // Biểu đồ trực quan hóa kết quả học tập (Pink theme, matching mockup screenshot)
        echo "<div class='col-md-8'>";
        echo "<div class='card luxury-card h-100'>";
        echo "<div class='luxury-header d-flex justify-content-between align-items-center' style='padding: 1.5rem 1.5rem 0.5rem 1.5rem;'>";
        echo "<span style='font-size: 1.1rem; font-weight: 700; color: #0f172a; text-transform: none; letter-spacing: normal;'><i class='bi bi-bar-chart-line-fill me-2 text-primary'></i>Academic Performance</span>";
        echo "<select id='semester-filter' class='form-select form-select-sm rounded-3' style='width: 190px; border-color: rgba(15, 23, 42, 0.08); font-size: 0.82rem; font-weight: 600; color: #475569;'>";
        foreach ($semMap as $dbSem => $jsSemName) {
            $sel = ($jsSemName === $defaultSemester) ? 'selected' : '';
            echo "<option value='" . h($jsSemName) . "' {$sel}>" . h($jsSemName) . "</option>";
        }
        echo "</select>";
        echo "</div>";
        echo "<div class='card-body p-4 pt-0 d-flex flex-column'>";
        echo "<div style='height: 380px; position: relative;' class='w-100 mt-2'>";
        echo "<canvas id='academicPerformanceChart'></canvas>";
        echo "</div>";
        // Nút liên kết chi tiết (nằm dẹt, trải rộng sang hai bên cân đối ở dưới biểu đồ)
        echo "<div class='row g-3 mt-1'>";
        echo "<div class='col-6'><a href='index.php?page=grades' class='btn btn-dark w-100 py-2.5 rounded-3' style='font-size:0.85rem; font-weight:600; transition:all 0.2s;'><i class='bi bi-grid-3x3-gap me-2'></i>Full Grade Sheet</a></div>";
        echo "<div class='col-6'><a href='index.php?page=clo_report' class='btn btn-outline-secondary w-100 py-2.5 rounded-3' style='font-size:0.85rem; font-weight:600; color:#334155; border-color:#e2e8f0; transition:all 0.2s;'><i class='bi bi-diagram-3 me-2'></i>CLO Report</a></div>";
        echo "</div>";
        echo "</div>";
        echo "</div>";
        echo "</div>";
        echo "</div>"; // End first row

        // Scripts to initialize Chart.js
        echo "<script>
        document.addEventListener('DOMContentLoaded', function() {
            var canvas = document.getElementById('academicPerformanceChart');
            if (!canvas) return;
            
            if (typeof Chart === 'undefined') {
                canvas.parentElement.innerHTML = \"<div class='text-center py-5 text-muted'><i class='bi bi-exclamation-triangle-fill d-block fs-3 mb-2 text-warning'></i>Failed to load chart library (CDN blocked). Please check your internet connection or reload the page.</div>\";
                return;
            }
            
            var ctx = canvas.getContext('2d');
            
            // Custom plugin to draw numbers directly on top of the bars (just like the screenshot)
            const topLabelsPlugin = {
                id: 'topLabels',
                afterDatasetsDraw(chart, args, pluginOptions) {
                    const { ctx } = chart;
                    ctx.save();
                    ctx.font = 'bold 10px \"Plus Jakarta Sans\", sans-serif';
                    ctx.fillStyle = '#475569';
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';

                    chart.data.datasets.forEach((dataset, datasetIndex) => {
                        if (dataset.type !== 'bar') return;
                        
                        const meta = chart.getDatasetMeta(datasetIndex);
                        meta.data.forEach((bar, index) => {
                            const val = dataset.data[index];
                            if (val > 0) {
                                ctx.fillText(val.toFixed(1), bar.x, bar.y - 5);
                            }
                        });
                    });
                    ctx.restore();
                }
            };

            window.myChart = new Chart(ctx, {
                plugins: [topLabelsPlugin],
                data: {
                    labels: {$jsonLabels},
                    datasets: [
                        {
                            label: 'Your Score',
                            data: {$jsonStudentScores},
                            type: 'bar',
                            yAxisID: 'y1',
                            backgroundColor: '#ff6b6b', // Coral pink bars
                            borderColor: '#e11d48',
                            borderWidth: 1,
                            borderRadius: 4,
                            barPercentage: 0.45,
                            categoryPercentage: 0.8,
                            pointStyle: 'rect'
                        },
                        {
                            label: 'Class Average',
                            data: {$jsonClassAverages},
                            type: 'line',
                            yAxisID: 'y',
                            borderColor: '#facc15', // Yellow line
                            borderWidth: 2,
                            pointBackgroundColor: '#facc15',
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 1.5,
                            pointRadius: 5,
                            pointHoverRadius: 7,
                            fill: false,
                            tension: 0.15,
                            pointStyle: 'circle'
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'right',
                            align: 'center',
                            labels: {
                                usePointStyle: true,
                                font: { family: \"'Plus Jakarta Sans', sans-serif\", size: 12, weight: '600' },
                                color: '#475569',
                                boxWidth: 10,
                                padding: 20
                            }
                        },
                        tooltip: {
                            backgroundColor: '#0f172a',
                            titleFont: { family: \"'Plus Jakarta Sans', sans-serif\", size: 12, weight: '700' },
                            bodyFont: { family: \"'Plus Jakarta Sans', sans-serif\", size: 11 },
                            padding: 10,
                            cornerRadius: 8,
                            boxPadding: 6,
                            callbacks: {
                                label: function(context) {
                                    var label = context.dataset.label || '';
                                    if (label) {
                                        label += ': ';
                                    }
                                    if (context.parsed.y !== null) {
                                        label += context.parsed.y.toFixed(1);
                                    }
                                    return label;
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            type: 'linear',
                            display: true,
                            position: 'left',
                            min: 0,
                            max: 10,
                            title: {
                                display: true,
                                text: 'Class Average',
                                font: { family: \"'Plus Jakarta Sans', sans-serif\", size: 10, weight: '700' },
                                color: '#ca8a04'
                            },
                            ticks: {
                                stepSize: 2,
                                color: '#94a3b8',
                                font: { family: \"'Plus Jakarta Sans', sans-serif\", size: 10 }
                            },
                            grid: {
                                color: '#f1f5f9'
                            }
                        },
                        y1: {
                            type: 'linear',
                            display: true,
                            position: 'right',
                            min: 0,
                            max: 10,
                            title: {
                                display: true,
                                text: 'Your Score',
                                font: { family: \"'Plus Jakarta Sans', sans-serif\", size: 10, weight: '700' },
                                color: '#e11d48'
                            },
                            ticks: {
                                stepSize: 2,
                                color: '#94a3b8',
                                font: { family: \"'Plus Jakarta Sans', sans-serif\", size: 10 }
                            },
                            grid: {
                                drawOnChartArea: false
                            }
                        },
                        x: {
                            ticks: {
                                color: '#475569',
                                font: { family: \"'Plus Jakarta Sans', sans-serif\", size: 9, weight: '600' }
                            },
                            grid: {
                                display: false
                            }
                        }
                    }
                }
            });

            // Semester Switcher Interactive Logic
            const semesterData = {$jsonSemesterData};

            function escapeHtml(str) {
                return String(str)
                    .replace(/&/g, '&amp;')
                    .replace(/</g, '&lt;')
                    .replace(/>/g, '&gt;')
                    .replace(/\"/g, '&quot;')
                    .replace(/'/g, '&#039;');
            }

            const filterEl = document.getElementById('semester-filter');
            const tbodyEl = document.getElementById('curriculum-table-body');
            const headerEl = document.getElementById('curriculum-header-text');

            if (filterEl && tbodyEl) {
                filterEl.addEventListener('change', function() {
                    const selected = this.value;
                    const data = semesterData[selected];
                    if (!data) return;

                    // 1. Update header
                    if (headerEl) {
                        headerEl.innerHTML = `<i class='bi bi-journal-text me-2'></i>Current Curriculum - \${selected}`;
                    }

                    // 2. Update table tbody
                    let html = '';
                    if (data.curriculum.length === 0) {
                        html = `<tr><td colspan='3' class='text-center text-muted py-5'><i class='bi bi-folder-x d-block mb-2 fs-4'></i>No course registrations found.</td></tr>`;
                    } else {
                        data.curriculum.forEach(item => {
                            html += `<tr>
                                <td><span class='luxury-badge fw-semibold'>\${escapeHtml(item.code)}</span></td>
                                <td class='fw-medium text-dark'>\${escapeHtml(item.name)}</td>
                                <td class='text-center text-secondary fw-medium'>\${item.credits}</td>
                            </tr>`;
                        });
                    }
                    tbodyEl.innerHTML = html;

                    // 3. Update Chart
                    if (window.myChart) {
                        window.myChart.data.labels = data.chart.labels;
                        window.myChart.data.datasets[0].data = data.chart.scores;
                        window.myChart.data.datasets[1].data = data.chart.averages;
                        window.myChart.update();
                    }

                    // 4. Update top stats cards
                    const enrolledCoursesEl = document.getElementById('stat-enrolled-courses');
                    const currentSemesterEl = document.getElementById('stat-current-semester');
                    if (enrolledCoursesEl) {
                        enrolledCoursesEl.innerText = data.curriculum.length;
                    }
                    if (currentSemesterEl) {
                        currentSemesterEl.innerText = selected;
                    }
                });
            }
        });
        </script>";
    }
    
    layoutEnd();
}