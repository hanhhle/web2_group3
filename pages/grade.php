<?php
// ── LECTURER: ENTER GRADES ───────────────────────────────────
function pageGRADE(): void {
    requireRole('admin','lecturer');
    layoutStart();
    
    // Luxury CSS Console Rules
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { background: #fbfbfd !important; color: #111827; font-family: 'Inter', sans-serif !important; }

        /* Filter Card */
        .academic-filter-card {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 1.8rem !important;
            margin-bottom: 2.5rem !important;
        }

        .academic-field-label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .academic-field-select {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.65rem 1rem;
            font-size: 0.9rem;
            color: #111827;
            transition: all 0.3s ease;
        }
        .academic-field-select:focus {
            background: #ffffff;
            border-color: #0ea5e9;
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.08);
            outline: none;
        }

        /* Rubric Console Card */
        .grade-console-card {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            margin-bottom: 3rem;
            overflow: hidden;
        }
        .grade-console-header {
            background: #fcfcfd;
            border-bottom: 1px solid #f1f5f9;
            padding: 1.5rem 2rem;
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
        }

        /* Clean Flat Grades Table */
        .grade-table {
            width: 100%;
            border-collapse: collapse;
        }
        .grade-table th {
            background: #ffffff;
            color: #64748b;
            font-weight: 600;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1.25rem 2rem !important;
            border-bottom: 1px solid #f1f5f9;
            text-align: left;
        }
        .grade-table td {
            padding: 1.25rem 2rem !important;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
        }
        .grade-table tr:last-child td { border-bottom: none; }
        
        .student-box {
            display: flex;
            flex-direction: column;
        }
        .student-name {
            font-weight: 700;
            color: #1e293b;
            font-size: 0.95rem;
        }
        .student-un {
            font-family: monospace;
            font-size: 0.75rem;
            color: #94a3b8;
            margin-top: 2px;
        }

        /* Premium Score Input */
        .score-input {
            width: 76px;
            padding: 0.5rem;
            border: 1.5px solid #e2e8f0;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.9rem;
            color: #0f172a;
            transition: all 0.2s ease;
        }
        .score-input:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.15);
            outline: none;
            background: #f0fdf4;
        }

        .max-score-label {
            display: block;
            font-size: 0.65rem;
            font-weight: 700;
            color: #94a3b8;
            margin-top: 4px;
            text-transform: uppercase;
        }
        .max-score-label span {
            color: #475569;
        }

        /* Commit Button */
        .btn-save-grades {
            background: #0b1320;
            color: #ffffff !important;
            border: none;
            border-radius: 12px;
            padding: 1rem 2.5rem;
            font-weight: 700;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            box-shadow: 0 10px 25px rgba(11, 19, 32, 0.15);
        }
        .btn-save-grades:hover:not([disabled]) {
            background: #1e2937;
            transform: translateY(-2px);
            box-shadow: 0 15px 35px rgba(11, 19, 32, 0.25);
        }
        
        .clo-badge {
            font-family: monospace;
            font-size: 0.65rem;
            font-weight: 700;
            padding: 0.15rem 0.4rem;
            background: #f0fdf4;
            color: #16a34a;
            border: 1px solid #dcfce7;
            border-radius: 4px;
            display: inline-block;
            margin-top: 2px;
        }

        .weight-pill {
            background: #e0f2fe;
            color: #0369a1;
            padding: 0.1rem 0.3rem;
            border-radius: 4px;
            font-size: 0.62rem;
        }
        /* Request change button */
        .btn-request-change {
            font-size: 0.62rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            padding: 0.25rem 0.55rem;
            border-radius: 5px;
            background: #fffbeb;
            color: #d97706;
            border: 1px solid #fef3c7;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 3px;
            margin-top: 4px;
        }
        .btn-request-change:hover { background: #f59e0b; color: #fff; border-color: #f59e0b; }
        .pending-tag {
            font-size: 0.6rem; font-weight: 700; text-transform: uppercase;
            background: #fffbeb; color: #d97706; border: 1px solid #fef3c7;
            border-radius: 4px; padding: 0.15rem 0.4rem; margin-top: 4px; display: inline-block;
        }

        /* Modal */
        .change-modal-overlay {
            display:none; position:fixed; inset:0; background:rgba(15,23,42,0.4);
            z-index:9999; align-items:center; justify-content:center;
        }
        .change-modal-overlay.open { display:flex; }
        .change-modal {
            background:#fff; border-radius:16px; padding:2rem; width:440px; max-width:95vw;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
        }
        .change-modal h5 { font-size:1rem; font-weight:700; color:#0f172a; margin-bottom:1rem; }
        .change-modal label { font-size:0.75rem; font-weight:600; color:#374151; text-transform:uppercase; letter-spacing:0.4px; }
        .change-modal input, .change-modal textarea {
            width:100%; border:1px solid #e5e7eb; border-radius:8px; padding:0.55rem 0.9rem;
            font-size:0.88rem; font-family:inherit; margin-top:0.3rem; margin-bottom:0.9rem;
        }
        .change-modal input:focus, .change-modal textarea:focus {
            outline:none; border-color:#2563eb; box-shadow:0 0 0 3px rgba(37,99,235,0.08);
        }
        .change-modal .btn-submit-req {
            background:#0b1320; color:#fff; border:none; border-radius:8px;
            padding:0.6rem 1.5rem; font-weight:600; font-size:0.88rem; cursor:pointer; width:100%;
        }
        .change-modal .btn-cancel-req {
            background:#f1f5f9; color:#475569; border:none; border-radius:8px;
            padding:0.6rem 1.5rem; font-weight:600; font-size:0.88rem; cursor:pointer; width:100%; margin-top:0.5rem;
        }
    </style>";

    $isAdmin = (role() === 'admin');
    $u = uid();

    // Fetch all assessments in the dropdown so lecturers can see system assessments but enforce read-only
    $assessments = qAll("SELECT a.*, s.code as sc, u.full_name as lecturer_name FROM assessments a JOIN subjects s ON a.subject_id=s.id LEFT JOIN users u ON a.lecturer_id=u.id ORDER BY a.created_at DESC");

    $filterAid = isset($_GET['assessment_id']) ? (int)$_GET['assessment_id'] : 0;
    if ($filterAid === 0 && !empty($assessments)) {
        $filterAid = (int)$assessments[0]['id'];
    }

    $selAssess = null;
    foreach ($assessments as $a) {
        if ((int)$a['id'] === $filterAid) { $selAssess = $a; break; }
    }

    $canEdit = $isAdmin || ($selAssess && (int)$selAssess['lecturer_id'] === $u);

    pageStart('Enter Grades', 'pencil-square', 'text-success');

    // UI/UX Banner for clear permissions boundaries
    if ($isAdmin) {
        echo "<div class='alert alert-info border-0 shadow-sm mb-4' style='background:#f0f9ff; border-left:4px solid #0284c7; color:#0369a1;'>
                <i class='bi bi-shield-check me-2' style='font-size:1.1rem;'></i>
                <strong>Superuser Override:</strong> You are logged in with Administrator privileges. You have master authorization to edit grades for any subject. All edits will be recorded in the security audit logs and secure Ledger.
              </div>";
    } elseif ($canEdit) {
        echo "<div class='alert alert-success border-0 shadow-sm mb-4' style='background:#f0fdf4; border-left:4px solid #16a34a; color:#14532d;'>
                <i class='bi bi-person-badge me-2' style='font-size:1.1rem;'></i>
                <strong>Lecturer Access (Owner):</strong> You are the assigned lecturer for this course assessment. You can enter grades for students who have not been graded yet. To change an existing score, use the <strong>Request Change</strong> button — changes require admin approval.
              </div>";
    } else {
        $graderName = $selAssess ? h($selAssess['lecturer_name']) : 'another lecturer';
        echo "<div class='alert alert-warning border-0 shadow-sm mb-4' style='background:#fffbeb; border-left:4px solid #f59e0b; color:#78350f;'>
                <i class='bi bi-lock-fill me-2' style='font-size:1.1rem;'></i>
                <strong>Read-Only Mode:</strong> This course assessment is assigned to Lecturer <strong>$graderName</strong>. Editing is locked. You can view the grades, but only the owner or an administrator can modify them.
              </div>";
    }

    // ── BỘ LỌC CHỌN ASSESSMENT (Console Select) ──
    echo "<div class='academic-filter-card'>";
    echo "<form method='GET' class='row g-3 align-items-end'><input type='hidden' name='page' value='grade'>";
    echo "<div class='col-md-6'><label class='academic-field-label'>Select Assessment Task *</label><select name='assessment_id' class='form-select academic-field-select' onchange='this.form.submit()'>";
    if (empty($assessments)) {
        echo "<option value=''>-- No Assessments Registered --</option>";
    }
    foreach ($assessments as $a) {
        $sel = $filterAid == $a['id'] ? 'selected' : '';
        $lectSuffix = " [GV: {$a['lecturer_name']}]";
        echo "<option value='{$a['id']}' $sel>[" . h($a['sc']) . "] " . h($a['name']) . " (" . ucfirst($a['type']) . ")$lectSuffix</option>";
    }
    echo "</select></div>";
    echo "</form></div>";

    if (!$selAssess) {
        echo "<div class='alert alert-warning border-0 shadow-sm'><i class='bi bi-info-circle-fill me-2'></i>Please create an assessment before entering grades.</div>";
        layoutEnd();
        return;
    }

    // Get enrolled students
    $enrollments = qAll("SELECT se.id, u.full_name fn, u.username un FROM student_enrollments se JOIN users u ON se.student_id=u.id WHERE se.subject_id=? AND se.semester=? ORDER BY u.full_name", [$selAssess['subject_id'], $selAssess['semester']]);
    
    // Get rubric and criteria groups
    $rubrics = qAll("SELECT * FROM rubrics WHERE assessment_id=? ORDER BY id", [$filterAid]);
    $rwc = [];
    foreach ($rubrics as $r) {
        $criteria = qAll("SELECT rc.*, c.code as clo_code FROM rubric_criteria rc LEFT JOIN clos c ON rc.clo_id=c.id WHERE rc.rubric_id=? ORDER BY rc.id", [$r['id']]);
        if (!empty($criteria)) {
            $rwc[] = ['rubric' => $r, 'criteria' => $criteria];
        }
    }

    if (empty($rwc)) {
        echo "<div class='alert alert-danger border-0 shadow-sm' style='background:#fef2f2; color:#991b1b'>
                <i class='bi bi-exclamation-triangle-fill me-2'></i>This assessment does not have any grading criteria defined. Set them up under 
                <a href='index.php?page=rubrics&assessment_id=$filterAid' class='fw-bold' style='color:#991b1b'>Manage Rubrics</a> first.
              </div>";
        layoutEnd();
        return;
    }

    if (empty($enrollments)) {
        echo "<div class='alert alert-info border-0 shadow-sm'><i class='bi bi-info-circle-fill me-2'></i>No students enrolled in this course for this semester.</div>";
        layoutEnd();
        return;
    }

    // Fetch scores with grader metadata
    $allScores = qAll("SELECT ss.enrollment_id, ss.criterion_id, ss.score, ss.graded_at, u.full_name as grader_name 
                       FROM student_scores ss 
                       JOIN student_enrollments se ON ss.enrollment_id=se.id 
                       LEFT JOIN users u ON ss.graded_by=u.id
                       WHERE se.subject_id=? AND se.semester=?", [$selAssess['subject_id'], $selAssess['semester']]);
    $existing = [];
    foreach ($allScores as $s) {
        $existing[$s['enrollment_id']][$s['criterion_id']] = [
            'score'       => $s['score'],
            'graded_at'   => $s['graded_at'],
            'grader_name' => $s['grader_name'],
        ];
    }

    // Fetch pending change requests for this assessment's subject+semester
    $pendingReqs = [];
    if ($selAssess) {
        $rows = qAll(
            "SELECT gcr.enrollment_id, gcr.criterion_id, gcr.new_score, gcr.id as req_id
             FROM grade_change_requests gcr
             JOIN student_enrollments se ON gcr.enrollment_id = se.id
             WHERE se.subject_id = ? AND se.semester = ? AND gcr.status = 'pending'",
            [$selAssess['subject_id'], $selAssess['semester']]
        );
        foreach ($rows as $pr) {
            $pendingReqs[$pr['enrollment_id']][$pr['criterion_id']] = $pr;
        }
    }

    // Lecturer sees "Request Change" button only when they OWN the assessment and score already exists
    $canRequestChange = !$isAdmin && $canEdit;

    echo "<form method='POST' action='index.php' id='grades-form'>
            <input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'>
            <input type='hidden' name='_action' value='save_grades'>
            <input type='hidden' name='assessment_id' value='$filterAid'>";

    // Render Rubric Sheets
    foreach ($rwc as $rdata) {
        echo "<div class='grade-console-card'>";
        echo "<div class='grade-console-header'><i class='bi bi-layers-half me-2 text-primary'></i>" . h($rdata['rubric']['name']) . "</div>";
        echo "<div class='table-responsive'>";
        echo "<table class='grade-table'><thead><tr><th style='width:250px;'>Student Identity</th>";

        foreach ($rdata['criteria'] as $rc) {
            $cloB = $rc['clo_code'] ? "<span class='clo-badge'>{$rc['clo_code']}</span>" : '';
            echo "<th class='text-center' style='min-width:160px;'>"
               . h($rc['description']) . "<br>$cloB"
               . "<span class='max-score-label'>Max: <span style='color:#475569;'>{$rc['max_score']}</span> | <span class='weight-pill'>{$rc['weight_percent']}%</span></span>"
               . "</th>";
        }
        echo "</tr></thead><tbody>";

        foreach ($enrollments as $enr) {
            echo "<tr>";
            echo "<td><div class='student-box'>
                    <span class='student-name'>" . h($enr['fn']) . "</span>
                    <span class='student-un'>" . h($enr['un']) . "</span>
                  </div></td>";

            foreach ($rdata['criteria'] as $rc) {
                $scoreData  = $existing[$enr['id']][$rc['id']] ?? null;
                $val        = $scoreData ? $scoreData['score'] : '';
                $graderInfo = $scoreData
                    ? "Graded by: " . h($scoreData['grader_name']) . " on " . date('Y-m-d H:i', strtotime($scoreData['graded_at']))
                    : 'Not graded yet';
                $pendingReq = $pendingReqs[$enr['id']][$rc['id']] ?? null;

                echo "<td class='text-center'>";

                if ($canEdit) {
                    if ($scoreData && !$isAdmin) {
                        // Score already exists + lecturer (not admin) → lock input, must use Request Change
                        echo "<input type='text' class='score-input text-center bg-light text-muted'
                                value='" . ($val !== '' ? $val : '—') . "' disabled title='" . h($graderInfo) . "'>";
                        echo "<div class='text-muted mt-1' style='font-size:0.65rem; white-space:nowrap;'>
                                <i class='bi bi-person-check'></i> " . h($scoreData['grader_name']) . "
                              </div>";
                        if ($pendingReq) {
                            echo "<span class='pending-tag'><i class='bi bi-hourglass-split'></i> Pending #{$pendingReq['req_id']} → {$pendingReq['new_score']}</span>";
                        } else {
                            echo "<button type='button' class='btn-request-change btn-open-modal'"
                                . " data-eid='" . (int)$enr['id'] . "'"
                                . " data-cid='" . (int)$rc['id'] . "'"
                                . " data-val='" . h((string)$val) . "'"
                                . " data-max='" . h((string)$rc['max_score']) . "'"
                                . " data-student='" . h($enr['fn']) . "'"
                                . " data-criterion='" . h($rc['description']) . "'"
                                . " data-aid='" . (int)$filterAid . "'"
                                . "><i class='bi bi-arrow-repeat'></i> Request Change</button>";
                        }
                    } else {
                        // No score yet (first-time entry), OR admin → allow direct input
                        echo "<input type='number' name='scores[{$enr['id']}][{$rc['id']}]'
                                class='score-input text-center' value='$val'
                                min='0' max='{$rc['max_score']}' step='0.01'
                                placeholder='-' title='" . h($graderInfo) . "'>";
                        if ($scoreData && $isAdmin) {
                            // Admin editing existing score: show grader info
                            echo "<div class='text-muted mt-1' style='font-size:0.65rem; white-space:nowrap;'>
                                    <i class='bi bi-person-check'></i> " . h($scoreData['grader_name']) . "
                                  </div>";
                        }
                    }
                } else {
                    // Read-only view
                    echo "<input type='text' class='score-input text-center bg-light text-muted'
                            value='" . ($val !== '' ? $val : '—') . "' disabled title='" . h($graderInfo) . "'>";
                    if ($scoreData) {
                        echo "<div class='text-muted mt-1' style='font-size:0.65rem; white-space:nowrap;'>
                                <i class='bi bi-person-lock'></i> " . h($scoreData['grader_name']) . "
                              </div>";
                    }
                    // Non-owner lecturer can STILL request change if there's a score
                    if (!$isAdmin && $scoreData) {
                        if ($pendingReq) {
                            echo "<span class='pending-tag'><i class='bi bi-hourglass-split'></i> Pending #{$pendingReq['req_id']} → {$pendingReq['new_score']}</span>";
                        } else {
                            echo "<button type='button' class='btn-request-change btn-open-modal'"
                                . " data-eid='" . (int)$enr['id'] . "'"
                                . " data-cid='" . (int)$rc['id'] . "'"
                                . " data-val='" . h((string)$val) . "'"
                                . " data-max='" . h((string)$rc['max_score']) . "'"
                                . " data-student='" . h($enr['fn']) . "'"
                                . " data-criterion='" . h($rc['description']) . "'"
                                . " data-aid='" . (int)$filterAid . "'"
                                . "><i class='bi bi-arrow-repeat'></i> Request Change</button>";
                        }
                    }
                }
                echo "</td>";
            }
            echo "</tr>";
        }
        echo "</tbody></table></div></div>";
    }

    echo "<div class='text-center mt-5 mb-5'>";
    if ($canEdit) {
        echo "<button type='submit' class='btn btn-save-grades'><i class='bi bi-cloud-arrow-up-fill me-2'></i>Commit All Grades to Secure Ledger</button>";
        echo "<div class='text-muted mt-2' style='font-size:0.75rem;'><i class='bi bi-shield-fill-check'></i> All commits are hashed and recorded in the cryptographically chained block ledger.</div>";
        if (!$isAdmin) {
            echo "<div class='text-muted mt-1' style='font-size:0.72rem;'><i class='bi bi-info-circle'></i> Note: This saves grades for students without a score. To change an existing score, use the <strong>Request Change</strong> button on each cell.</div>";
        }
    } else {
        echo "<button type='button' class='btn btn-save-grades bg-secondary text-white' style='cursor:not-allowed; opacity:0.6;' disabled><i class='bi bi-lock-fill me-2'></i>Grade Entry Locked</button>";
        echo "<div class='text-muted mt-2' style='font-size:0.75rem;'><i class='bi bi-shield-lock-fill'></i> Grade changes are locked. Use the <strong>Request Change</strong> button on individual scores above.</div>";
    }
    echo "</div></form>";

    // ── GRADE CHANGE REQUEST MODAL ────────────────────────────
    $csrf = Auth::getCsrfToken();
    echo "
    <div class='change-modal-overlay' id='changeModalOverlay' onclick='closeChangeModal(event)'>
      <div class='change-modal'>
        <h5><i class='bi bi-arrow-repeat me-2 text-warning'></i>Request Grade Change</h5>
        <form method='POST' action='index.php' id='changeReqForm'>
          <input type='hidden' name='csrf_token' value='{$csrf}'>
          <input type='hidden' name='_action' value='request_grade_change'>
          <input type='hidden' name='assessment_id' id='modal_aid'>
          <input type='hidden' name='enrollment_id' id='modal_eid'>
          <input type='hidden' name='criterion_id'  id='modal_cid'>

          <div style='background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px; padding:0.75rem 1rem; margin-bottom:1rem; font-size:0.82rem; color:#475569;'>
            <div id='modal_info_student' style='font-weight:700; color:#0f172a;'></div>
            <div id='modal_info_criterion' style='margin-top:2px;'></div>
          </div>

          <label>Current Score</label>
          <input type='text' id='modal_old_score' readonly style='background:#f1f5f9; color:#64748b;'>

          <label>New Score (max: <span id='modal_max'></span>)</label>
          <input type='number' name='new_score' id='modal_new_score' min='0' step='0.01' required placeholder='Enter proposed score'>

          <label>Reason for Change <span style='color:#ef4444;'>*</span></label>
          <textarea name='reason' rows='3' required placeholder='Explain why this score should be changed (e.g. data entry error, re-evaluation after appeal...)' style='resize:vertical;'></textarea>

          <button type='submit' class='btn-submit-req'><i class='bi bi-send me-2'></i>Submit Request to Admin</button>
          <button type='button' class='btn-cancel-req' onclick='closeChangeModal(null)'><i class='bi bi-x me-1'></i>Cancel</button>
        </form>
      </div>
    </div>

    <script>
    document.addEventListener('click', function(e) {
        var btn = e.target.closest('.btn-open-modal');
        if (!btn) return;
        var d = btn.dataset;
        document.getElementById('modal_eid').value = d.eid;
        document.getElementById('modal_cid').value = d.cid;
        document.getElementById('modal_aid').value = d.aid;
        document.getElementById('modal_old_score').value = d.val;
        document.getElementById('modal_max').textContent = d.max;
        document.getElementById('modal_new_score').max = d.max;
        document.getElementById('modal_new_score').value = '';
        document.getElementById('modal_info_student').textContent = d.student;
        document.getElementById('modal_info_criterion').textContent = d.criterion;
        document.getElementById('changeModalOverlay').classList.add('open');
        setTimeout(() => document.getElementById('modal_new_score').focus(), 100);
    });
    function closeChangeModal(e) {
        if (e === null || e.target === document.getElementById('changeModalOverlay')) {
            document.getElementById('changeModalOverlay').classList.remove('open');
        }
    }
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') closeChangeModal(null);
    });
    </script>";

    layoutEnd();
}
