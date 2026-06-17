<?php
declare(strict_types=1);

function pageGRADE_REQUESTS(): void {
    requireRole('admin');
    layoutStart();

    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');
        body { background:#ffffff !important; font-family:'Inter',sans-serif !important; color:#1e293b; -webkit-font-smoothing:antialiased; }

        .req-wrapper { max-width:1300px; margin:2rem auto; padding:0 1.5rem; }

        .tab-strip { display:flex; gap:0.25rem; border-bottom:2px solid #f1f5f9; margin-bottom:2rem; }
        .tab-btn {
            padding:0.6rem 1.4rem; font-size:0.82rem; font-weight:600; border:none; background:none;
            color:#94a3b8; cursor:pointer; border-bottom:2px solid transparent; margin-bottom:-2px;
            transition:all 0.2s; border-radius:6px 6px 0 0;
        }
        .tab-btn:hover { color:#0f172a; background:#f8fafc; }
        .tab-btn.active { color:#2563eb; border-bottom-color:#2563eb; background:#eff6ff; }

        .tab-pane { display:none; }
        .tab-pane.active { display:block; }

        /* Request card */
        .req-card {
            background:#ffffff; border:1px solid #e2e8f0; border-radius:14px;
            margin-bottom:1.25rem; overflow:hidden;
            transition: box-shadow 0.2s ease;
        }
        .req-card:hover { box-shadow: 0 4px 20px rgba(0,0,0,0.05); }

        .req-card-header {
            display:flex; justify-content:space-between; align-items:flex-start;
            padding:1.25rem 1.5rem; border-bottom:1px solid #f1f5f9; background:#f8fafc;
        }
        .req-card-body { padding:1.25rem 1.5rem; }

        .req-meta { font-size:0.72rem; color:#94a3b8; font-family:'JetBrains Mono',monospace; }
        .req-title { font-size:0.92rem; font-weight:700; color:#0f172a; }

        /* Score change visual */
        .score-change-visual {
            display:inline-flex; align-items:center; gap:0.5rem;
            background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px;
            padding:0.4rem 0.75rem; font-size:0.85rem; font-weight:700;
        }
        .score-old { color:#ef4444; text-decoration:line-through; opacity:0.7; }
        .score-arrow { color:#94a3b8; font-size:0.9rem; }
        .score-new { color:#10b981; }

        /* Status badges */
        .badge-pending  { background:#fffbeb; color:#d97706; border:1px solid #fef3c7; }
        .badge-approved { background:#ecfdf5; color:#059669; border:1px solid #d1fae5; }
        .badge-rejected { background:#fef2f2; color:#dc2626; border:1px solid #fee2e2; }
        .status-badge {
            font-size:0.7rem; font-weight:700; text-transform:uppercase; letter-spacing:0.5px;
            padding:0.3rem 0.7rem; border-radius:6px; display:inline-block;
        }

        /* Action form */
        .action-form-row { display:flex; gap:0.75rem; align-items:flex-end; margin-top:1rem; padding-top:1rem; border-top:1px solid #f1f5f9; }
        .action-note-input {
            flex:1; background:#f9fafb; border:1px solid #e5e7eb; border-radius:8px;
            padding:0.5rem 0.9rem; font-size:0.85rem; font-family:inherit;
        }
        .action-note-input:focus { outline:none; border-color:#2563eb; box-shadow:0 0 0 3px rgba(37,99,235,0.08); }

        .btn-approve {
            background:#059669; color:#fff; border:none; border-radius:8px;
            padding:0.5rem 1.25rem; font-size:0.82rem; font-weight:600; cursor:pointer;
            transition:all 0.2s; white-space:nowrap;
        }
        .btn-approve:hover { background:#047857; transform:translateY(-1px); }

        .btn-reject {
            background:#dc2626; color:#fff; border:none; border-radius:8px;
            padding:0.5rem 1.25rem; font-size:0.82rem; font-weight:600; cursor:pointer;
            transition:all 0.2s; white-space:nowrap;
        }
        .btn-reject:hover { background:#b91c1c; transform:translateY(-1px); }

        /* Reason box */
        .reason-box {
            background:#fffbeb; border-left:3px solid #f59e0b; border-radius:0 6px 6px 0;
            padding:0.6rem 0.9rem; font-size:0.82rem; color:#78350f; margin-top:0.75rem;
        }

        /* Review note */
        .review-note-box {
            background:#f0f9ff; border-left:3px solid #0ea5e9; border-radius:0 6px 6px 0;
            padding:0.6rem 0.9rem; font-size:0.82rem; color:#0369a1; margin-top:0.5rem;
        }

        /* Identity pill */
        .user-pill-inline {
            display:inline-flex; align-items:center; gap:0.35rem;
            background:#f1f5f9; border:1px solid #e2e8f0; border-radius:20px;
            padding:0.2rem 0.65rem; font-size:0.75rem; font-weight:600; color:#334155;
        }

        .empty-state { text-align:center; padding:4rem 2rem; color:#94a3b8; }
        .empty-state i { font-size:2.5rem; display:block; margin-bottom:1rem; }
    </style>";

    pageStart('Grade Change Requests', 'arrow-repeat', 'text-warning');

    // Fetch all requests with joined info
    $allReqs = qAll(
        "SELECT gcr.*,
                req_u.full_name  AS requester_name,
                req_u.username   AS requester_username,
                rev_u.full_name  AS reviewer_name,
                rev_u.username   AS reviewer_username,
                rc.description   AS criterion_desc,
                rc.max_score,
                sub.name         AS subject_name,
                sub.code         AS subject_code,
                se.semester,
                stu.full_name    AS student_name,
                stu.username     AS student_username
         FROM grade_change_requests gcr
         JOIN users         req_u ON gcr.requested_by  = req_u.id
         LEFT JOIN users    rev_u ON gcr.reviewed_by   = rev_u.id
         LEFT JOIN rubric_criteria rc  ON gcr.criterion_id  = rc.id
         JOIN student_enrollments se ON gcr.enrollment_id = se.id
         JOIN subjects sub ON se.subject_id = sub.id
         JOIN users stu    ON se.student_id = stu.id
         ORDER BY gcr.id DESC"
    );

    $pending  = array_filter($allReqs, fn($r) => $r['status'] === 'pending');
    $resolved = array_filter($allReqs, fn($r) => $r['status'] !== 'pending');

    $pendingCount = count($pending);

    echo "<div class='req-wrapper'>";

    // Tab strip
    echo "<div class='tab-strip'>
            <button class='tab-btn active' onclick=\"switchTab('pending',this)\">
                <i class='bi bi-hourglass-split me-1'></i>Pending
                " . ($pendingCount > 0 ? "<span class='badge bg-danger ms-1' style='font-size:0.65rem;'>{$pendingCount}</span>" : '') . "
            </button>
            <button class='tab-btn' onclick=\"switchTab('resolved',this)\">
                <i class='bi bi-check2-all me-1'></i>Resolved
            </button>
          </div>";

    // ── PENDING TAB ──────────────────────────────────────────
    echo "<div id='tab-pending' class='tab-pane active'>";
    if (empty($pending)) {
        echo "<div class='empty-state'><i class='bi bi-inbox'></i><div class='fw-semibold'>No pending requests</div><div style='font-size:0.82rem;'>All grade change requests have been reviewed.</div></div>";
    } else {
        foreach ($pending as $r) {
            renderRequestCard($r, true);
        }
    }
    echo "</div>";

    // ── RESOLVED TAB ─────────────────────────────────────────
    echo "<div id='tab-resolved' class='tab-pane'>";
    if (empty($resolved)) {
        echo "<div class='empty-state'><i class='bi bi-archive'></i><div class='fw-semibold'>No resolved requests yet</div></div>";
    } else {
        foreach ($resolved as $r) {
            renderRequestCard($r, false);
        }
    }
    echo "</div>";

    echo "</div>"; // .req-wrapper

    echo "<script>
    function switchTab(name, btn) {
        document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.getElementById('tab-' + name).classList.add('active');
        btn.classList.add('active');
    }
    </script>";

    layoutEnd();
}

function renderRequestCard(array $r, bool $showActions): void {
    $statusClass = ['pending' => 'badge-pending', 'approved' => 'badge-approved', 'rejected' => 'badge-rejected'][$r['status']] ?? '';
    $statusLabel = ucfirst($r['status']);
    $reqTime     = date('d/m/Y H:i', strtotime($r['requested_at']));

    echo "<div class='req-card'>";

    // Header
    echo "<div class='req-card-header'>";
    echo "<div>
            <div class='req-title'>
                <span class='badge bg-warning text-dark me-1' style='font-size:0.65rem;'>" . h($r['subject_code']) . "</span>
                " . h($r['subject_name']) . "
                <span class='text-muted fw-normal' style='font-size:0.8rem;'> · " . h($r['semester']) . "</span>
            </div>
            <div class='req-meta mt-1'>Request #" . $r['id'] . " · " . h($r['criterion_desc']) . " · Max: " . $r['max_score'] . "</div>
          </div>";
    echo "<span class='status-badge $statusClass'>$statusLabel</span>";
    echo "</div>";

    // Body
    echo "<div class='req-card-body'>";

    // Score change + student info
    echo "<div class='d-flex flex-wrap gap-4 align-items-start'>";

    // Score visual
    echo "<div>
            <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Score Change</div>
            <div class='score-change-visual'>
                <span class='score-old'>" . $r['old_score'] . "</span>
                <span class='score-arrow'>→</span>
                <span class='score-new'>" . $r['new_score'] . "</span>
            </div>
          </div>";

    // Student
    echo "<div>
            <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Student</div>
            <span class='user-pill-inline'><i class='bi bi-person-fill'></i>" . h($r['student_name']) . " <span style='color:#94a3b8;'>@" . h($r['student_username']) . "</span></span>
          </div>";

    // Requested by
    echo "<div>
            <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Requested By</div>
            <span class='user-pill-inline'><i class='bi bi-person-badge-fill' style='color:#2563eb;'></i>" . h($r['requester_name']) . " <span style='color:#94a3b8;'>@" . h($r['requester_username']) . "</span></span>
            <div class='req-meta mt-1'>" . $reqTime . "</div>
          </div>";

    // Reviewed by (if resolved)
    if ($r['reviewed_by'] && $r['reviewer_name']) {
        $revTime = $r['reviewed_at'] ? date('d/m/Y H:i', strtotime($r['reviewed_at'])) : '';
        $revIconColor = $r['status'] === 'approved' ? '#059669' : '#dc2626';
        echo "<div>
                <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Reviewed By</div>
                <span class='user-pill-inline'><i class='bi bi-shield-fill-check' style='color:{$revIconColor};'></i>" . h($r['reviewer_name']) . " <span style='color:#94a3b8;'>@" . h($r['reviewer_username']) . "</span></span>
                <div class='req-meta mt-1'>" . $revTime . "</div>
              </div>";
    }

    echo "</div>"; // flex row

    // Reason
    if ($r['reason']) {
        echo "<div class='reason-box'><i class='bi bi-chat-left-text-fill me-1'></i><strong>Reason:</strong> " . h($r['reason']) . "</div>";
    }

    // Review note
    if ($r['review_note']) {
        echo "<div class='review-note-box'><i class='bi bi-info-circle-fill me-1'></i><strong>Admin note:</strong> " . h($r['review_note']) . "</div>";
    }

    // Action buttons (pending only)
    if ($showActions) {
        $csrf = Auth::getCsrfToken();
        echo "<div class='action-form-row'>";

        // Note input shared
        echo "<input type='text' id='note_{$r['id']}' class='action-note-input' placeholder='Admin note (optional)...'>";

        // Approve form
        echo "<form method='POST' onsubmit='return confirm(\"Approve this grade change?\")' style='display:inline;'>
                <input type='hidden' name='csrf_token' value='{$csrf}'>
                <input type='hidden' name='_action' value='approve_grade_change'>
                <input type='hidden' name='request_id' value='{$r['id']}'>
                <input type='hidden' name='review_note' id='approve_note_{$r['id']}'>
                <button type='submit' class='btn-approve'
                    onclick=\"document.getElementById('approve_note_{$r['id']}').value=document.getElementById('note_{$r['id']}').value\">
                    <i class='bi bi-check-lg me-1'></i>Approve
                </button>
              </form>";

        // Reject form
        echo "<form method='POST' onsubmit='return confirm(\"Reject this grade change request?\")' style='display:inline;'>
                <input type='hidden' name='csrf_token' value='{$csrf}'>
                <input type='hidden' name='_action' value='reject_grade_change'>
                <input type='hidden' name='request_id' value='{$r['id']}'>
                <input type='hidden' name='review_note' id='reject_note_{$r['id']}'>
                <button type='submit' class='btn-reject'
                    onclick=\"document.getElementById('reject_note_{$r['id']}').value=document.getElementById('note_{$r['id']}').value\">
                    <i class='bi bi-x-lg me-1'></i>Reject
                </button>
              </form>";

        echo "</div>"; // action-form-row
    }

    echo "</div>"; // req-card-body
    echo "</div>"; // req-card
}
