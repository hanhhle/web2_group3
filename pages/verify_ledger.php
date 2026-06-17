<?php
declare(strict_types=1);

function pageVERIFY_LEDGER(): void {
    requireRole('admin','lecturer');
    layoutStart();
    
    $result = null;
    if (($_SERVER['REQUEST_METHOD'] ?? '') === 'POST' && ($_POST['_action'] ?? '') === 'verify_ledger') {
        $result = ledgerVerify();
    }

    // Hệ thống CSS Cao cấp: Phong cách Minimalist Luxury (Trắng, chữ nhỏ, siêu tinh tế)
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

        body { 
            background: #ffffff !important; 
            font-family: 'Inter', sans-serif !important; 
            color: #1e293b;
            -webkit-font-smoothing: antialiased;
        }

        /* Container tổng thể thu hẹp tạo sự tập trung */
        .ledger-container {
            max-width: 1000px;
            margin: 4rem auto;
            padding: 0 1.5rem;
        }

        /* Banner thông tin chính - Đổi từ tối sang trắng tinh khôi */
        .integrity-header {
            background: #ffffff;
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 3rem;
            margin-bottom: 3rem;
        }
        
        .integrity-header h1 {
            font-size: 1.6rem !important; /* Chữ nhỏ lại, tinh tế hơn */
            letter-spacing: -0.03em;
            font-weight: 700;
            color: #0f172a;
        }

        .verify-summary { 
            color: #64748b; 
            font-size: 0.88rem; /* Hạ font size xuống mịn màng */
            max-width: 680px; 
            line-height: 1.8; 
            font-weight: 400;
        }

        /* Các bước hướng dẫn dạng Khung mảnh siêu tinh tế */
        .step-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); 
            gap: 1.5rem; 
            margin: 2.5rem 0 0 0; 
            }
        .step-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 1.25rem 1.5rem;
            transition: all 0.2s ease;
        }
        .step-card:hover { 
            border-color: #cbd5e1;
            transform: translateY(-2px);
        }
        .step-num { 
            font-size: 0.65rem; 
            font-weight: 700; 
            text-transform: uppercase; 
            letter-spacing: 2px; 
            color: #94a3b8;
            margin-bottom: 0.5rem; 
        }
        .step-title { 
            font-size: 0.95rem; 
            font-weight: 600; 
            color: #0f172a;
            margin-bottom: 0.25rem; 
        }
        .step-desc {
            font-size: 0.8rem;
            color: #64748b;
        }
        .step-status {
            font-size: 0.8rem;
            font-weight: 500;
            color: #0d9488 !important;
            margin-top: 0.5rem;
        }

        /* Nút kích hoạt tinh giản dáng vẻ công nghệ */
        .verify-action-btn {
            background: #0f172a;
            color: #ffffff !important;
            border: none;
            border-radius: 8px;
            padding: 0.85rem 2.2rem;
            font-weight: 500;
            font-size: 0.88rem;
            letter-spacing: 0.3px;
            transition: all 0.2s ease;
        }
        .verify-action-btn:hover { 
            background: #1e293b; 
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.08);
        }

        /* Kết quả Panel - Trắng tuyệt đối và mượt mà */
        .result-panel {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            padding: 4rem 2rem;
            animation: fadeIn 0.4s ease-out;
        }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        /* Icon Blob nhẹ nhàng không còn lòe loẹt */
        .status-blob {
            width: 64px; height: 64px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 1.25rem;
            font-size: 1.5rem;
        }
        .status-blob.success { background: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0; }
        .status-blob.danger { background: #fef2f2; color: #dc2626; border: 1px solid #fecaca; }

        .result-title {
            font-size: 1.4rem !important;
            font-weight: 700;
            color: #0f172a;
            letter-spacing: -0.02em;
        }
        .result-desc {
            font-size: 0.88rem;
            color: #64748b;
        }

        /* Vi phạm Card chỉ dùng viền đỏ siêu nhẹ */
        .violation-card { 
            border-radius: 16px; 
            border: 1px solid #fee2e2 !important; 
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(220, 38, 38, 0.02);
            animation: fadeIn 0.4s ease-out;
        }
        .violation-card-header { 
            background: #fff5f5; 
            color: #991b1b; 
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid #fee2e2;
        }
        .violation-card-heading { font-size: 0.95rem; font-weight: 600; letter-spacing: -0.01em; }
        .violation-summary { color: #64748b; font-size: 0.88rem; }

        /* Bảng vi phạm tối giản, chữ thanh mảnh */
        .violation-table { margin-bottom: 0; }
        .violation-table thead th { 
            background: #ffffff !important; 
            color: #64748b !important; 
            padding: 1rem 1.25rem; 
            border-bottom: 1px solid #edf2f7; 
            font-size: 0.72rem; 
            font-weight: 600;
            text-transform: uppercase; 
            letter-spacing: 1px; 
        }
        .violation-table td { 
            padding: 1rem 1.25rem; 
            vertical-align: middle; 
            background: white; 
            border-bottom: 1px solid #f1f5f9; 
            font-size: 0.85rem; 
            color: #334155;
        }
        
        /* Cải tiến hiển thị mã Hash siêu nhỏ dạng Mini Tag */
        .hash-mono { 
            font-family: 'JetBrains Mono', monospace; 
            font-size: 0.72rem; 
            background: #f8fafc; 
            padding: 4px 8px; 
            border-radius: 6px; 
            display: inline-block;
            border: 1px solid #e2e8f0;
            max-width: 180px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .hash-mono.text-success { color: #0f766e !important; background: #f0fdfa; border-color: #ccfbf1; }
        .hash-mono.text-danger { color: #991b1b !important; background: #fef2f2; border-color: #fee2e2; }

        /* Custom Badge sang trọng */
        .badge-luxury {
            font-size: 0.75rem;
            font-weight: 500;
            padding: 0.35rem 1rem;
            border-radius: 6px;
            display: inline-block;
        }
        .badge-luxury.bg-success { background: #e6f4ea !important; color: #137333 !important; }
        .badge-luxury.bg-danger { background: #fce8e6 !important; color: #c5221f !important; }

    </style>";

    echo "<div class='ledger-container'>";

    // Header trắng tinh khôi
    echo "<div class='integrity-header'>";
    echo "<h1 class='mb-2'><i class='bi bi-shield-lock me-2 text-dark'></i>Ledger Integrity Center</h1>";
    echo "<p class='verify-summary'>This security utility utilizes the SHA-256 cryptographic hashing algorithm to verify the integrity of the ledger chain. Any direct database tampering or unauthorized grade modifications will be immediately flagged by tracing link discontinuity.</p>";

    // Grid các bước tối giản
    echo "<div class='step-grid'>";
    $steps = [
        ['01', 'Secure Entry', 'Lecturer enters grades', 'Chain links computed'],
        ['02', 'Verification', 'Run Integrity Check', 'System re-scans chain'],
        ['03', 'Detection', 'Tamper detected', 'Mismatch pinpointed']
    ];
    foreach ($steps as $s) {
        echo "<div class='step-card'>
                <div class='step-num'>Step {$s[0]}</div>
                <div class='step-title'>{$s[1]}</div>
                <div class='step-desc'>{$s[2]}</div>
                <div class='step-status'>{$s[3]}</div>
              </div>";
    }
    echo "</div>";

    echo "<div class='mt-4'>";
    echo "<form method='POST'>";
    echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'>";
    echo "<input type='hidden' name='_action' value='verify_ledger'>";
    echo "<button type='submit' class='btn verify-action-btn'><i class='bi bi-cpu me-2'></i>Launch Security Scan</button>";
    echo "</form>";
    echo "</div></div>";

    // Khối kết quả xử lý
    if ($result !== null) {
        if ($result['valid']) {
            echo "<div class='result-panel text-center'>";
            echo "<div class='status-blob success'><i class='bi bi-check-lg'></i></div>";
            echo "<h2 class='result-title mb-2'>Integrity Confirmed</h2>";
            echo "<p class='result-desc mb-3'>The system has successfully validated <strong>{$result['total']}</strong> ledger records. No integrity deviations or structural tampering were detected.</p>";
            echo "<div class='badge-luxury bg-success'><i class='bi bi-shield-check me-1'></i> Ledger Chain Intact</div>";
            echo "</div>";
        } else {
            echo "<div class='card border-0 violation-card'>";
            echo "<div class='violation-card-header'><h4 class='mb-0 violation-card-heading'><i class='bi bi-exclamation-circle me-2'></i>Security Violation Detected</h4></div>";
            echo "<div class='card-body p-0 bg-white'>";
            
            echo "<div class='p-4 border-bottom text-center'>";
            echo "<div class='status-blob danger'><i class='bi bi-shield-exclamation'></i></div>";
            echo "<p class='violation-summary mb-0'>The system detected <strong>".count($result['violations'])."</strong> integrity violations out of {$result['total']} total ledger blocks.</p>";
            echo "</div>";
            
            echo "<div class='table-responsive'>";
            echo "<table class='table violation-table'>";
            echo "<thead><tr><th>Entry ID</th><th>Type</th><th>Analysis Detail</th><th>Expected Score</th><th>Detected Score</th></tr></thead><tbody>";
            foreach ($result['violations'] as $v) {
                echo "<tr>
                        <td class='fw-semibold text-dark'>#{$v['ledger_id']}</td>
                        <td><span class='badge-luxury bg-danger'>{$v['type']}</span></td>
                        <td class='text-muted' style='font-size: 0.8rem;'>".h($v['message'])."</td>
                        <td><code class='hash-mono text-success'>".substr($v['expected'],0,24)."</code></td>
                        <td><code class='hash-mono text-danger'>".substr($v['found'],0,24)."</code></td>
                      </tr>";
            }
            echo "</tbody></table></div></div></div>";
        }
    }
    
    echo "</div>"; // Đóng .ledger-container
    layoutEnd();
}
