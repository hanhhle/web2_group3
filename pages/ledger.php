<?php
// ── ADMIN: LEDGER VIEW (all subjects) ───────────────────────
function pageLEDGER(): void {
    requireRole('admin','lecturer');
    layoutStart();
    $isAdmin = (role() === 'admin');
    $uid = uid();

    // --- GIỮ NGUYÊN LOGIC TRUY VẤN ---
    if ($isAdmin) {
        $entries = qAll("SELECT sl.*, u.full_name grader, u.username grader_username, se.semester, su.full_name student_name, sub.name subject_name, sub.code subject_code, rc.description crit_desc FROM score_ledger sl JOIN users u ON sl.graded_by = u.id JOIN student_enrollments se ON sl.enrollment_id = se.id JOIN users su ON se.student_id = su.id JOIN subjects sub ON se.subject_id = sub.id JOIN rubric_criteria rc ON sl.criterion_id = rc.id ORDER BY sl.id DESC LIMIT 300");
        $pageTitle = 'Global Score Ledger';
        $pageDesc  = 'All subjects — full hash chain view';
    } else {
        $entries = qAll("SELECT sl.*, u.full_name grader, u.username grader_username, se.semester, su.full_name student_name, sub.name subject_name, sub.code subject_code, rc.description crit_desc FROM score_ledger sl JOIN users u ON sl.graded_by = u.id JOIN student_enrollments se ON sl.enrollment_id = se.id JOIN users su ON se.student_id = su.id JOIN subjects sub ON se.subject_id = sub.id JOIN rubric_criteria rc ON sl.criterion_id = rc.id WHERE sl.graded_by = ? ORDER BY sl.id DESC LIMIT 200", [$uid]);
        $pageTitle = 'My Subject Ledger';
        $pageDesc  = 'Ledger entries for subjects you teach';
    }

    // --- HỆ THỐNG CSS LUXURY TINH CHỈNH ---
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

        body { 
            background: #ffffff !important; 
            font-family: 'Inter', sans-serif !important; 
            color: #1e293b;
            -webkit-font-smoothing: antialiased;
        }

        .ledger-wrapper {
            max-width: 1400px;
            margin: 2.5rem auto;
            padding: 0 1.5rem;
        }

        /* Page Header tinh giản */
        .page-header-luxury {
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        /* Nút Verify kiểu công nghệ */
        .btn-verify-luxury {
            background: #10b981;
            color: #ffffff !important;
            border: none;
            border-radius: 8px;
            padding: 0.6rem 1.25rem;
            font-size: 0.82rem;
            font-weight: 500;
            letter-spacing: 0.2px;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 4px 10px rgba(16, 185, 129, 0.1);
        }
        .btn-verify-luxury:hover {
            background: #059669;
            transform: translateY(-1px);
            box-shadow: 0 6px 15px rgba(16, 185, 129, 0.2);
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
            padding: 1.4rem 2rem !important;
            vertical-align: middle;
            color: #111827;
            font-size: 0.92rem;
            border-bottom: 1px solid #f1f5f9;
        }

        .luxury-table tr:last-child td { border-bottom: none; }
        .luxury-table tr:hover td { background-color: #fafafa; }

        /* Badge trạng thái giao dịch */
        .badge-luxury {
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 0.35rem 0.7rem;
            border-radius: 6px;
            border: 1px solid transparent;
        }
        .bg-success-soft { background: #ecfdf5; color: #059669; border-color: #d1fae5; }
        .bg-warning-soft { background: #fffbeb; color: #d97706; border-color: #fef3c7; }
        .bg-danger-soft { background: #fef2f2; color: #dc2626; border-color: #fee2e2; }

        /* Font mã độc quyền */
        .hash-mono {
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.75rem;
            color: #64748b;
            background: #f8fafc;
            padding: 0.25rem 0.5rem;
            border-radius: 6px;
            border: 1px solid #f1f5f9;
        }

        /* Grader info cell */
        .grader-cell { display: flex; flex-direction: column; gap: 2px; }
        .grader-name-text { font-weight: 600; color: #0f172a; font-size: 0.85rem; }
        .grader-username { font-family: 'JetBrains Mono', monospace; font-size: 0.68rem; color: #94a3b8; }
        .grader-time-text { font-size: 0.72rem; color: #64748b; margin-top: 2px; }

        /* Score change indicator */
        .score-change { display: flex; flex-direction: column; align-items: flex-start; gap: 2px; }
        .score-current { font-size: 0.95rem; font-weight: 700; color: #0f172a; }
        .score-prev { font-size: 0.68rem; color: #94a3b8; font-family: 'JetBrains Mono', monospace; }
        .score-arrow { color: #f59e0b; font-size: 0.65rem; }
    </style>";

    echo "<div class='ledger-wrapper'>";
    echo "<div class='page-header-luxury'>";
    echo "<div><h5><i class='bi bi-layers-half me-2 text-primary'></i>{$pageTitle}</h5><span class='desc'>{$pageDesc}</span></div>";
    
    // Nút điều hướng sang Verify Ledger thiết kế phẳng
    if (!$isAdmin) {
        echo "<a href='index.php?page=verify_ledger' class='btn-verify-luxury'><i class='bi bi-shield-check me-1.5'></i>Verify Ledger Integrity</a>";
    }
    echo "</div>";

    echo "<div class='academic-ledger-container'>";
    echo "<table class='table luxury-table'>";
    echo "<thead>
            <tr>
                <th>#ID</th>
                <th>Student</th>
                <th>Subject</th>
                <th>Criterion</th>
                <th>Score</th>
                <th>Action</th>
                <th>Graded By</th>
                <th>Time</th>
                <th>Prev Hash</th>
                <th>Curr Hash</th>
            </tr>
          </thead><tbody>";

    foreach ($entries as $e) {
        $acClass = [
            'INSERT' => 'bg-success-soft',
            'UPDATE' => 'bg-warning-soft',
            'DELETE' => 'bg-danger-soft'
        ][$e['action']] ?? 'bg-light text-muted';

        // Parse snapshot for previous score (UPDATE records)
        $snap = json_decode($e['data_snapshot'], true);
        $prevScore  = (is_array($snap) && isset($snap['previous_score']) && $snap['previous_score'] !== null)
            ? $snap['previous_score'] : null;
        $approvedBy = is_array($snap) ? ($snap['approved_by'] ?? null) : null;
        $reqId      = is_array($snap) ? ($snap['change_request'] ?? null) : null;

        // Score display: show change arrow for UPDATEs
        if ($e['action'] === 'UPDATE' && $prevScore !== null) {
            $scoreHtml = "<div class='score-change'>
                <span class='score-current'>{$e['score']}</span>
                <span class='score-prev'><span class='score-arrow'>↑</span> was {$prevScore}</span>
              </div>";
        } else {
            $scoreHtml = "<span class='score-current'>{$e['score']}</span>";
        }

        // Grader display — show requester + approver when it was a change request
        $graderTime = date('d/m/Y H:i:s', strtotime($e['timestamp']));
        if ($approvedBy !== null && $reqId !== null) {
            // Fetch approver name
            $approver = qOne("SELECT full_name, username FROM users WHERE id=?", [$approvedBy]);
            $approverName     = $approver ? h($approver['full_name'])  : "User #{$approvedBy}";
            $approverUsername = $approver ? '@' . h($approver['username']) : '';
            $graderHtml = "<div class='grader-cell'>
                <div style='font-size:0.7rem; color:#94a3b8; text-transform:uppercase; letter-spacing:0.4px; font-weight:600; margin-bottom:2px;'>Changed by</div>
                <span class='grader-name-text'>" . h($e['grader']) . "</span>
                <span class='grader-username'>@" . h($e['grader_username']) . "</span>
                <div style='margin-top:4px; font-size:0.7rem; color:#94a3b8; text-transform:uppercase; letter-spacing:0.4px; font-weight:600;'>Approved by</div>
                <span class='grader-name-text' style='color:#059669;'>{$approverName}</span>
                <span class='grader-username'>{$approverUsername}</span>
                <div style='margin-top:3px; font-size:0.65rem; color:#94a3b8;'>Request #" . (int)$reqId . "</div>
              </div>";
        } else {
            $graderHtml = "<div class='grader-cell'>
                <span class='grader-name-text'>" . h($e['grader']) . "</span>
                <span class='grader-username'>@" . h($e['grader_username']) . "</span>
              </div>";
        }

        echo "<tr>";
        echo "<td class='hash-mono' style='border:none; background:none; color:#94a3b8'>#{$e['id']}</td>";
        echo "<td class='fw-semibold text-dark'>".h($e['student_name'])."</td>";
        echo "<td><span class='badge bg-warning text-dark border-0' style='font-size:0.65rem; font-weight:700;'>".h($e['subject_code'])."</span></td>";
        echo "<td class='text-muted' style='font-size:0.82rem;' title='".h($e['crit_desc'])."'>".h($e['crit_desc'])."</td>";
        echo "<td>{$scoreHtml}</td>";
        echo "<td><span class='badge-luxury {$acClass}'>{$e['action']}</span></td>";
        echo "<td>{$graderHtml}</td>";
        echo "<td style='font-size:0.75rem; color:#475569; font-family:monospace; white-space:nowrap;'>{$graderTime}</td>";
        echo "<td><code class='hash-mono'>".substr($e['previous_hash'], 0, 14)."…</code></td>";
        echo "<td><code class='hash-mono' style='color:#0f172a; font-weight:600; background:#f1f5f9;'>".substr($e['current_hash'], 0, 14)."…</code></td>";
        echo "</tr>";
    }

    if (empty($entries)) {
        echo "<tr><td colspan='10' class='text-center text-muted py-5'>No records found in the blockchain ledger.</td></tr>";
    }

    echo "</tbody></table></div></div>";
    echo "</div>"; // End .ledger-wrapper

    layoutEnd();
}
