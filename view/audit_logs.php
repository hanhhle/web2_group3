<?php
// ── ADMIN: AUDIT LOGS / LECTURER: MY ACTIVITY LOGS ──────────
function pageAUDIT_LOGS(array $logs = [], string $pageTitle = '', string $pageDesc = ''): void {
    requirePermission('view_audit_logs');
    layoutStart();
    $isAdmin = (role() === 'admin');
    $uid = uid();



    // --- HỆ THỐNG CSS LUXURY TINH CHỈNH ---
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

        body { 
            background: #ffffff !important; 
            font-family: 'Inter', sans-serif !important; 
            color: #1e293b;
            -webkit-font-smoothing: antialiased;
        }

        .log-wrapper {
            max-width: 1400px;
            margin: 2.5rem auto;
            padding: 0 1.5rem;
        }

        /* Page Header */
        .page-header-luxury {
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 1.5rem;
            margin-bottom: 2rem;
        }
        .page-header-luxury h5 {
            font-size: 1.4rem !important;
            font-weight: 700;
            color: #0f172a;
            letter-spacing: -0.02em;
            margin: 0;
        }
        .page-header-luxury .desc {
            display: block;
            font-size: 0.8rem;
            color: #64748b;
            font-weight: 400;
            margin-top: 0.25rem;
        }

        /* Khung bọc bảng dạng kính siêu mỏng */
        .academic-ledger-container {
            background: #ffffff;
            border: 1px solid #f1f5f9;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.01);
            overflow: hidden;
        }

        .luxury-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 0;
        }

        .luxury-table th {
            background: #f8fafc !important;
            color: #64748b;
            font-weight: 600;
            font-size: 0.72rem;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            padding: 1.25rem 2rem !important;
            border-bottom: 1px solid #f1f5f9;
        }

        .luxury-table td {
            padding: 1.2rem 2rem !important;
            vertical-align: middle;
            color: #111827;
            font-size: 0.9rem;
            border-bottom: 1px solid #f1f5f9;
        }

        .luxury-table tr:last-child td { border-bottom: none; }
        .luxury-table tr:hover td { background-color: #fafafa; }

        /* Badge hành động (Color Palette dịu mát) */
        .badge-luxury-tag {
            font-size: 0.68rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 0.35rem 0.65rem;
            border-radius: 6px;
            border: 1px solid transparent;
            display: inline-block;
        }
        .action-primary { background: #eff6ff; color: #1e40af; border-color: #dbeafe; }
        .action-success { background: #ecfdf5; color: #059669; border-color: #d1fae5; }
        .action-warning { background: #fffbeb; color: #d97706; border-color: #fef3c7; }
        .action-danger  { background: #fef2f2; color: #dc2626; border-color: #fee2e2; }
        .action-info    { background: #f0fdf4; color: #16a34a; border-color: #dcfce7; }
        .action-default { background: #f8fafc; color: #475569; border-color: #e2e8f0; }

        /* Font mã độc quyền */
        .log-mono {
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.78rem;
            color: #475569;
        }
        .record-badge {
            background: #f8fafc;
            padding: 0.2rem 0.4rem;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            display: inline-block;
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.78rem;
            color: #475569;
        }
        .text-system {
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.78rem;
            color: #94a3b8;
            font-weight: 500;
        }
    </style>";

    echo "<div class='log-wrapper'>";
    echo "<div class='page-header-luxury'>";
    echo "<h5><i class='bi bi-terminal me-2 text-primary'></i>{$pageTitle}</h5><span class='desc'>{$pageDesc}</span>";
    echo "</div>";

    echo "<div class='academic-ledger-container'>";
    echo "<div class='table-responsive'>";
    echo "<table class='table luxury-table'>";
    echo "<thead>
            <tr>
                <th style='width: 8%'>Log ID</th>
                <th style='width: 15%'>Operator</th>
                <th style='width: 15%'>Action</th>
                <th style='width: 12%'>Table Scope</th>
                <th style='width: 10%'>Record ID</th>
                <th>Operation Details</th>
                <th style='width: 12%'>IP Address</th>
                <th style='width: 15%'>Timestamp</th>
            </tr>
          </thead><tbody>";

    foreach ($logs as $l) {
        $act = strtoupper($l['action'] ?? '');
        $bc = 'action-default';
        
        if (str_contains($act,'LOGIN') || str_contains($act,'LOGOUT')) $bc = 'action-primary';
        elseif (str_contains($act,'CREATE') || str_contains($act,'INSERT') || str_contains($act,'ENROLL')) $bc = 'action-success';
        elseif (str_contains($act,'EDIT') || str_contains($act,'UPDATE') || str_contains($act,'LEDGER')) $bc = 'action-warning';
        elseif (str_contains($act,'DELETE') || str_contains($act,'TAMPER')) $bc = 'action-danger';
        elseif (str_contains($act,'VERIFY')) $bc = 'action-info';

        $operator = !empty($l['username']) ? h($l['username']) : '<span class="text-system">system</span>';
        $tableName = !empty($l['table_name']) ? h($l['table_name']) : '—';
        $recordId = !empty($l['record_id']) ? h($l['record_id']) : '—';
        $ipAddress = !empty($l['ip_address']) ? h($l['ip_address']) : '—';

        echo "<tr>
            <td class='log-mono'>#{$l['id']}</td>
            <td class='fw-medium text-dark' title='".h($l['full_name'] ?? '')."'>{$operator}</td>
            <td><span class='badge-luxury-tag {$bc}' title='".h($l['action'])."'>" . h($l['action']) . "</span></td>
            <td class='text-secondary fw-medium' title='".h($tableName)."'>{$tableName}</td>
            <td><span class='record-badge'>{$recordId}</span></td>
            
            <td class='text-muted' title='" . h($l['details'] ?? '') . "'>" . h($l['details'] ?? '—') . "</td>
            <td class='log-mono' style='color: #64748b;'>{$ipAddress}</td>
            <td class='text-secondary' style='font-size: 0.78rem;'>{$l['created_at']}</td>
        </tr>";
    }
    
    if (empty($logs)) {
        echo "<tr><td colspan='8' class='text-center text-muted py-5' style='font-size: 0.85rem;'>No audit logs have been recorded for this account.</td></tr>";
    }
    
    echo "</tbody></table></div></div></div>";
    layoutEnd();
}
