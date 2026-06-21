<?php
declare(strict_types=1);

function pageMY_REQUESTS(array $myReqs = []): void {
    requirePermission('request_grade_change');
    layoutStart();

    echo "<style>
        body { background:#ffffff !important; font-family:'Inter',sans-serif !important; color:#1e293b; }
        .req-wrapper { max-width:1100px; margin:2rem auto; padding:0 1.5rem; }
        .req-card { background:#fff; border:1px solid #e2e8f0; border-radius:14px; margin-bottom:1.25rem; overflow:hidden; }
        .req-card-header { display:flex; justify-content:space-between; align-items:flex-start; padding:1.1rem 1.5rem; border-bottom:1px solid #f1f5f9; background:#f8fafc; }
        .req-card-body { padding:1.1rem 1.5rem; }
        .req-title { font-size:0.9rem; font-weight:700; color:#0f172a; }
        .req-meta { font-size:0.72rem; color:#94a3b8; font-family:monospace; }
        .score-change-visual { display:inline-flex; align-items:center; gap:0.5rem; background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px; padding:0.35rem 0.7rem; font-size:0.85rem; font-weight:700; }
        .score-old { color:#ef4444; text-decoration:line-through; opacity:0.7; }
        .score-new { color:#10b981; }
        .status-badge { font-size:0.7rem; font-weight:700; text-transform:uppercase; letter-spacing:0.5px; padding:0.3rem 0.7rem; border-radius:6px; display:inline-block; }
        .badge-pending  { background:#fffbeb; color:#d97706; border:1px solid #fef3c7; }
        .badge-approved { background:#ecfdf5; color:#059669; border:1px solid #d1fae5; }
        .badge-rejected { background:#fef2f2; color:#dc2626; border:1px solid #fee2e2; }
        .reason-box { background:#fffbeb; border-left:3px solid #f59e0b; border-radius:0 6px 6px 0; padding:0.5rem 0.85rem; font-size:0.8rem; color:#78350f; margin-top:0.75rem; }
        .review-note-box { background:#f0f9ff; border-left:3px solid #0ea5e9; border-radius:0 6px 6px 0; padding:0.5rem 0.85rem; font-size:0.8rem; color:#0369a1; margin-top:0.5rem; }
        .reviewer-info { display:inline-flex; align-items:center; gap:0.35rem; background:#f1f5f9; border:1px solid #e2e8f0; border-radius:20px; padding:0.2rem 0.65rem; font-size:0.75rem; font-weight:600; color:#334155; }
        .empty-state { text-align:center; padding:4rem; color:#94a3b8; }
        .empty-state i { font-size:2.5rem; display:block; margin-bottom:1rem; }
    </style>";

    pageStart('My Grade Change Requests', 'arrow-repeat', 'text-info');



    echo "<div class='req-wrapper'>";

    if (empty($myReqs)) {
        echo "<div class='empty-state'><i class='bi bi-inbox'></i><div class='fw-semibold'>No requests submitted yet</div><div style='font-size:0.82rem; margin-top:0.5rem;'>Grade change requests you submit will appear here.</div></div>";
        layoutEnd(); return;
    }

    foreach ($myReqs as $r) {
        $statusClass = ['pending' => 'badge-pending', 'approved' => 'badge-approved', 'rejected' => 'badge-rejected'][$r['status']] ?? '';
        $reqTime = date('d/m/Y H:i', strtotime($r['requested_at']));

        echo "<div class='req-card'>";
        echo "<div class='req-card-header'>
                <div>
                    <div class='req-title'>
                        <span class='badge bg-warning text-dark me-1' style='font-size:0.65rem;'>" . h($r['subject_code']) . "</span>
                        " . h($r['subject_name']) . "
                        <span class='text-muted fw-normal' style='font-size:0.8rem;'> · " . h($r['semester']) . "</span>
                    </div>
                    <div class='req-meta mt-1'>Request #" . $r['id'] . " · " . h($r['criterion_desc']) . " · Submitted: {$reqTime}</div>
                </div>
                <span class='status-badge {$statusClass}'>" . ucfirst($r['status']) . "</span>
              </div>";

        echo "<div class='req-card-body'>";
        echo "<div class='d-flex flex-wrap gap-4 align-items-start'>";

        echo "<div>
                <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Score Change</div>
                <div class='score-change-visual'>
                    <span class='score-old'>" . $r['old_score'] . "</span>
                    <span style='color:#94a3b8;'>→</span>
                    <span class='score-new'>" . $r['new_score'] . "</span>
                </div>
              </div>";

        echo "<div>
                <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Student</div>
                <span class='reviewer-info'><i class='bi bi-person-fill'></i>" . h($r['student_name']) . "</span>
              </div>";

        if ($r['reviewed_by'] && $r['reviewer_name']) {
            $revIcon  = $r['status'] === 'approved' ? 'bi-check-circle-fill' : 'bi-x-circle-fill';
            $revColor = $r['status'] === 'approved' ? '#059669' : '#dc2626';
            $revTime  = $r['reviewed_at'] ? date('d/m/Y H:i', strtotime($r['reviewed_at'])) : '';
            echo "<div>
                    <div style='font-size:0.7rem; font-weight:600; text-transform:uppercase; color:#94a3b8; margin-bottom:6px;'>Reviewed By</div>
                    <span class='reviewer-info'><i class='bi {$revIcon}' style='color:{$revColor};'></i>" . h($r['reviewer_name']) . "</span>
                    <div class='req-meta mt-1'>{$revTime}</div>
                  </div>";
        }

        echo "</div>";

        if ($r['reason']) {
            echo "<div class='reason-box'><i class='bi bi-chat-left-text-fill me-1'></i><strong>Your reason:</strong> " . h($r['reason']) . "</div>";
        }
        if ($r['review_note']) {
            echo "<div class='review-note-box'><i class='bi bi-info-circle-fill me-1'></i><strong>Admin note:</strong> " . h($r['review_note']) . "</div>";
        }

        echo "</div></div>";
    }

    echo "</div>";
    layoutEnd();
}
