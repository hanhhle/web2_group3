<?php
declare(strict_types=1);

$act = $_POST['_action'] ?? '';

// Validate CSRF token for all actions except login
if ($act !== 'login') {
    $token = $_POST['csrf_token'] ?? '';
    if (!Auth::validateCsrfToken($token)) {
        flash('error', 'Security Alert: Request rejected due to missing or invalid CSRF token.');
        header('Location: index.php?page=dashboard');
        exit;
    }
}

// ── LOGIN ────────────────────────────────────────────────
if ($act === 'login') {
    $uname = trim($_POST['username'] ?? '');
    $pass  = $_POST['password'] ?? '';
    if (Auth::login($uname, $pass)) {
        auditLog('LOGIN', 'users', uid(), "Login: $uname");
        header('Location: index.php?page=dashboard'); exit;
    }
    flash('error', 'Invalid username or password.');
    header('Location: index.php?page=login'); exit;
}

// ── LOGOUT ───────────────────────────────────────────────
if ($act === 'logout') {
    auditLog('LOGOUT');
    $_SESSION = [];
    if (ini_get('session.use_cookies')) {
        $p = session_get_cookie_params();
        setcookie(session_name(),'',time()-42000,$p['path'],$p['domain'],$p['secure'],$p['httponly']);
    }
    session_destroy();
    header('Location: index.php?page=login'); exit;
}

// ── USERS CRUD ───────────────────────────────────────────
if ($act === 'user_create') {
    requireRole('admin');
    $uname = trim($_POST['username'] ?? '');
    try {
        $exists = qOne("SELECT id FROM users WHERE username = ?", [$uname]);
        if ($exists) {
            throw new Exception('Username already exists. Please choose another.');
        }
        $password = $_POST['password'] ?? '';
        if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/', $password)) {
            throw new Exception('Password is not strong enough. It must contain at least 8 characters, including uppercase, lowercase, numbers, and special symbols.');
        }
        $hash = password_hash($password, PASSWORD_BCRYPT);
        qRun("INSERT INTO users (username,password_hash,role,full_name,email) VALUES (?,?,?,?,?)",
            [$uname,$hash,$_POST['role'],trim($_POST['full_name']),trim($_POST['email'])]);
        auditLog('CREATE_USER','users',lastId(),"Created: ".$uname);
        flash('success','User created successfully.');
    } catch(Exception $e){ flash('error','Error: '.$e->getMessage()); }
    header('Location: index.php?page=users'); exit;
}
if ($act === 'user_edit') {
    requireRole('admin');
    $id = (int)$_POST['id'];
    try {
        if (isset($_POST['password']) && $_POST['password'] !== '') {
            $password = $_POST['password'];
            if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/', $password)) {
                throw new Exception('Password is not strong enough. It must contain at least 8 characters, including uppercase, lowercase, numbers, and special symbols.');
            }
            $hash = password_hash($password, PASSWORD_BCRYPT);
            qRun("UPDATE users SET full_name=?,email=?,role=?,password_hash=? WHERE id=?",
                [trim($_POST['full_name']),trim($_POST['email']),$_POST['role'],$hash,$id]);
        } else {
            qRun("UPDATE users SET full_name=?,email=?,role=? WHERE id=?",
                [trim($_POST['full_name']),trim($_POST['email']),$_POST['role'],$id]);
        }
        auditLog('EDIT_USER','users',$id); flash('success','User updated.');
    } catch(Exception $e){ flash('error','Error: '.$e->getMessage()); }
    header('Location: index.php?page=users'); exit;
}
if ($act === 'user_delete') {
    requireRole('admin');
    $id = (int)$_POST['id'];
    if ($id === uid()) {
        flash('error', 'Cannot delete yourself.');
    } else {
        try {
            qRun("DELETE FROM users WHERE id=?", [$id]);
            auditLog('DELETE_USER', 'users', $id);
            flash('success', 'User deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete user: The account has activity history linked to other data.');
        }
    }
    header('Location: index.php?page=users'); exit;
}

// ── PROGRAMS CRUD ────────────────────────────────────────
if ($act === 'prog_create') {
    requireRole('admin');
    try {
        qRun("INSERT INTO programs (name,code,description) VALUES (?,?,?)",
            [trim($_POST['name']),strtoupper(trim($_POST['code'])),trim($_POST['description'])]);
        auditLog('CREATE_PROGRAM','programs',lastId()); flash('success','Program created.');
    } catch(Exception $e){ flash('error',$e->getMessage()); }
    header('Location: index.php?page=programs'); exit;
}
if ($act === 'prog_edit') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    qRun("UPDATE programs SET name=?,code=?,description=? WHERE id=?",
        [trim($_POST['name']),strtoupper(trim($_POST['code'])),trim($_POST['description']),$id]);
    auditLog('EDIT_PROGRAM','programs',$id); flash('success','Program updated.');
    header('Location: index.php?page=programs'); exit;
}
if ($act === 'prog_delete') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    try {
        qRun("DELETE FROM programs WHERE id=?", [$id]);
        auditLog('DELETE_PROGRAM', 'programs', $id);
        flash('success', 'Program deleted.');
    } catch (Exception $e) {
        flash('error', 'Cannot delete program: Please delete all associated PLOs and subjects first.');
    }
    header('Location: index.php?page=programs'); exit;
}

// ── SUBJECTS CRUD ────────────────────────────────────────
if ($act === 'subj_create') {
    requireRole('admin');
    try {
        qRun("INSERT INTO subjects (program_id,code,name,credits) VALUES (?,?,?,?)",
            [(int)$_POST['program_id'],strtoupper(trim($_POST['code'])),trim($_POST['name']),(int)$_POST['credits']]);
        auditLog('CREATE_SUBJECT','subjects',lastId()); flash('success','Subject created.');
    } catch(Exception $e){ flash('error',$e->getMessage()); }
    header('Location: index.php?page=subjects'); exit;
}
if ($act === 'subj_edit') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    qRun("UPDATE subjects SET program_id=?,code=?,name=?,credits=? WHERE id=?",
        [(int)$_POST['program_id'],strtoupper(trim($_POST['code'])),trim($_POST['name']),(int)$_POST['credits'],$id]);
    auditLog('EDIT_SUBJECT','subjects',$id); flash('success','Subject updated.');
    header('Location: index.php?page=subjects'); exit;
}
if ($act === 'subj_delete') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    try {
        qRun("DELETE FROM subjects WHERE id=?", [$id]);
        auditLog('DELETE_SUBJECT', 'subjects', $id);
        flash('success', 'Subject deleted.');
    } catch (Exception $e) {
        flash('error', 'Cannot delete subject: The subject already has associated CLOs, assessments, or student enrollments.');
    }
    header('Location: index.php?page=subjects'); exit;
}

// ── PLOs CRUD ────────────────────────────────────────────
if ($act === 'plo_create') {
    requireRole('admin');
    try {
        qRun("INSERT INTO plos (program_id,code,description) VALUES (?,?,?)",
            [(int)$_POST['program_id'],strtoupper(trim($_POST['code'])),trim($_POST['description'])]);
        auditLog('CREATE_PLO','plos',lastId()); flash('success','PLO created.');
    } catch(Exception $e){ flash('error',$e->getMessage()); }
    header('Location: index.php?page=plos'); exit;
}
if ($act === 'plo_edit') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    qRun("UPDATE plos SET program_id=?,code=?,description=? WHERE id=?",
        [(int)$_POST['program_id'],strtoupper(trim($_POST['code'])),trim($_POST['description']),$id]);
    auditLog('EDIT_PLO','plos',$id); flash('success','PLO updated.');
    header('Location: index.php?page=plos'); exit;
}
if ($act === 'plo_delete') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    try {
        qRun("DELETE FROM plos WHERE id=?", [$id]);
        auditLog('DELETE_PLO', 'plos', $id);
        flash('success', 'PLO deleted.');
    } catch (Exception $e) {
        flash('error', 'Cannot delete PLO: This PLO is currently linked in the CLO-PLO matrix.');
    }
    header('Location: index.php?page=plos'); exit;
}

// ── CLOs CRUD ────────────────────────────────────────────
if ($act === 'clo_create') {
    requireRole('admin');
    try {
        qRun("INSERT INTO clos (subject_id,code,description) VALUES (?,?,?)",
            [(int)$_POST['subject_id'],strtoupper(trim($_POST['code'])),trim($_POST['description'])]);
        auditLog('CREATE_CLO','clos',lastId()); flash('success','CLO created.');
    } catch(Exception $e){ flash('error',$e->getMessage()); }
    header('Location: index.php?page=clos'); exit;
}
if ($act === 'clo_edit') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    qRun("UPDATE clos SET subject_id=?,code=?,description=? WHERE id=?",
        [(int)$_POST['subject_id'],strtoupper(trim($_POST['code'])),trim($_POST['description']),$id]);
    auditLog('EDIT_CLO','clos',$id); flash('success','CLO updated.');
    header('Location: index.php?page=clos'); exit;
}
if ($act === 'clo_delete') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    try {
        qRun("DELETE FROM clos WHERE id=?", [$id]);
        auditLog('DELETE_CLO', 'clos', $id);
        flash('success', 'CLO deleted.');
    } catch (Exception $e) {
        flash('error', 'Cannot delete CLO: This CLO is currently linked to a grading criterion or PLO.');
    }
    header('Location: index.php?page=clos'); exit;
}

// ── CLO-PLO MATRIX ───────────────────────────────────────
if ($act === 'save_matrix') {
    requireRole('admin');
    $sid = (int)$_POST['subject_id'];
    $pid = (int)$_POST['program_id'];
    
    // Validate subject belongs to program
    $subjCheck = qOne("SELECT id FROM subjects WHERE id=? AND program_id=?", [$sid, $pid]);
    if (!$subjCheck) {
        flash('error', 'Security Alert: Subject does not belong to the selected program.');
        header("Location: index.php?page=clo_matrix&program_id=$pid&subject_id=$sid"); exit;
    }

    $mappings = $_POST['mapping'] ?? [];
    try {
        db()->beginTransaction();
        qRun("DELETE FROM clo_plo_mappings WHERE clo_id IN (SELECT id FROM clos WHERE subject_id=?)",[$sid]);
        $ins = 0;
        foreach ($mappings as $cloId => $ploIds) {
            foreach ($ploIds as $ploId => $v) {
                if ($v) { qRun("INSERT INTO clo_plo_mappings (clo_id,plo_id,weight) VALUES (?,?,1.00)",[(int)$cloId,(int)$ploId]); $ins++; }
            }
        }
        db()->commit();
        auditLog('SAVE_CLO_PLO_MATRIX','clo_plo_mappings',null,"subject=$sid inserted=$ins");
        flash('success',"Matrix saved ($ins mappings).");
    } catch(Exception $e){ db()->rollBack(); flash('error',$e->getMessage()); }
    header("Location: index.php?page=clo_matrix&program_id=$pid&subject_id=$sid"); exit;
}

// ── ENROLLMENTS ──────────────────────────────────────────
if ($act === 'enroll') {
    requireRole('admin');
    try {
        qRun("INSERT INTO student_enrollments (student_id,subject_id,semester) VALUES (?,?,?)",
            [(int)$_POST['student_id'],(int)$_POST['subject_id'],trim($_POST['semester'])]);
        auditLog('ENROLL_STUDENT','student_enrollments',lastId()); flash('success','Student enrolled.');
    } catch(Exception $e){ flash('error','Error (already enrolled?): '.$e->getMessage()); }
    header('Location: index.php?page=enrollments'); exit;
}
if ($act === 'unenroll') {
    requireRole('admin');
    $id=(int)$_POST['id'];
    try {
        qRun("DELETE FROM student_enrollments WHERE id=?",[$id]);
        auditLog('UNENROLL','student_enrollments',$id);
        flash('success','Enrollment removed.');
    } catch(Exception $e) {
        flash('error','Cannot unenroll student: This course enrollment has scores already recorded in the secure ledger.');
    }
    header('Location: index.php?page=enrollments'); exit;
}

// ── ASSESSMENTS ──────────────────────────────────────────
if ($act === 'assess_create') {
    requireRole('admin','lecturer');
    $type = trim($_POST['type']);
    if ($type === 'attendance') {
        $w = 10.0;
    } elseif ($type === 'midterm') {
        $w = 30.0;
    } elseif ($type === 'final') {
        $w = 60.0;
    } else {
        flash('error', 'Invalid assessment type. Only Attendance, Midterm, and Final are accepted.');
        header('Location: index.php?page=assessments'); exit;
    }
    
    $sid = (int)$_POST['subject_id'];
    $sem = trim($_POST['semester']);
    
    // Check if the subject already has this type of assessment in this semester
    $exists = qOne("SELECT COUNT(*) as cnt FROM assessments WHERE subject_id = ? AND semester = ? AND type = ?", [$sid, $sem, $type])['cnt'];
    if ($exists > 0) {
        flash('error', "Cannot create: This subject already has a '" . ucfirst($type) . "' assessment for this semester.");
        header('Location: index.php?page=assessments'); exit;
    }

    // Enforce total weight of assessments for this subject in this semester <= 100%
    $currentTotal = (float)(qOne("SELECT COALESCE(SUM(weight), 0) as t FROM assessments WHERE subject_id = ? AND semester = ?", [$sid, $sem])['t']);
    if ($currentTotal + $w > 100.01) {
        flash('error', "Cannot create: The total weight of assessments for this subject in this semester has reached {$currentTotal}%. Adding {$w}% would exceed 100%.");
        header('Location: index.php?page=assessments'); exit;
    }

    $maxScore = ($type === 'attendance') ? 10.0 : (float)$_POST['max_score'];
    if ($maxScore < 0.01 || $maxScore > 100) {
        flash('error', 'Max score must be between 0.01 and 100.');
        header('Location: index.php?page=assessments'); exit;
    }

    try {
        db()->beginTransaction();
        
        qRun("INSERT INTO assessments (subject_id,lecturer_id,name,type,weight,max_score,semester) VALUES (?,?,?,?,?,?,?)",
            [$sid,uid(),trim($_POST['name']),$type,$w,$maxScore,$sem]);
        $newAid = (int)lastId();
        auditLog('CREATE_ASSESSMENT','assessments',$newAid);
        
        // Auto-generate Rubric and Criterion for Attendance
        if ($type === 'attendance') {
            qRun("INSERT INTO rubrics (assessment_id,name) VALUES (?,?)", [$newAid, 'Attendance Rubric']);
            $newRid = (int)lastId();
            auditLog('CREATE_RUBRIC','rubrics',$newRid);

            // Find the first CLO for this subject if available, otherwise NULL
            $firstClo = qOne("SELECT id FROM clos WHERE subject_id=? ORDER BY id LIMIT 1", [$sid]);
            $cloId = $firstClo ? (int)$firstClo['id'] : null;

            qRun("INSERT INTO rubric_criteria (rubric_id,clo_id,description,max_score,weight_percent) VALUES (?,?,?,?,?)",
                [$newRid, $cloId, 'Full attendance and active class volunteering (voluntary contributions)', 10.0, 100.0]);
            auditLog('CREATE_CRITERION','rubric_criteria',lastId());
        }
        db()->commit();
        flash('success','Assessment created successfully.');
    } catch(Exception $e){ db()->rollBack(); flash('error',$e->getMessage()); }
    header('Location: index.php?page=assessments'); exit;
}
if ($act === 'assess_delete') {
    requireRole('admin','lecturer');
    $id = (int)$_POST['id'];
    // Ownership Validation
    if (role() !== 'admin') {
        $assess = qOne("SELECT lecturer_id FROM assessments WHERE id=?", [$id]);
        if (!$assess || (int)$assess['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to delete this assessment.');
            header('Location: index.php?page=assessments'); exit;
        }
    }
    try {
        if (role() === 'admin') {
            qRun("DELETE FROM assessments WHERE id=?", [$id]);
        } else {
            qRun("DELETE FROM assessments WHERE id=? AND lecturer_id=?", [$id, uid()]);
        }
        auditLog('DELETE_ASSESSMENT','assessments',$id); flash('success','Assessment deleted.');
    } catch(Exception $e) {
        flash('error','Cannot delete assessment: This assessment already has rubrics, criteria, or student scores.');
    }
    header('Location: index.php?page=assessments'); exit;
}

// ── RUBRICS ──────────────────────────────────────────────
if ($act === 'rubric_create') {
    requireRole('admin','lecturer');
    $aid = (int)$_POST['assessment_id'];
    // Ownership Validation
    if (role() !== 'admin') {
        $assessOwner = qOne("SELECT lecturer_id FROM assessments WHERE id=?", [$aid]);
        if (!$assessOwner || (int)$assessOwner['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to add rubrics to this assessment.');
            header('Location: index.php?page=dashboard'); exit;
        }
    }
    try {
        qRun("INSERT INTO rubrics (assessment_id,name) VALUES (?,?)",[$aid,trim($_POST['rubric_name'])]);
        auditLog('CREATE_RUBRIC','rubrics',lastId()); flash('success','Rubric created.');
    } catch(Exception $e){ flash('error',$e->getMessage()); }
    header("Location: index.php?page=rubrics&assessment_id=$aid"); exit;
}
if ($act === 'rubric_delete') {
    requireRole('admin','lecturer');
    $id=(int)$_POST['id']; $aid=(int)$_POST['assessment_id'];
    // Ownership Validation
    if (role() !== 'admin') {
        $rubricAssess = qOne("SELECT r.assessment_id, a.lecturer_id FROM rubrics r JOIN assessments a ON r.assessment_id = a.id WHERE r.id=?", [$id]);
        if (!$rubricAssess || (int)$rubricAssess['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to delete this rubric.');
            header('Location: index.php?page=dashboard'); exit;
        }
    }
    try {
        qRun("DELETE FROM rubrics WHERE id=?",[$id]); auditLog('DELETE_RUBRIC','rubrics',$id);
        flash('success','Rubric deleted.');
    } catch(Exception $e) {
        flash('error','Cannot delete rubric: This rubric contains criteria or data dependencies.');
    }
    header("Location: index.php?page=rubrics&assessment_id=$aid"); exit;
}
if ($act === 'criterion_add') {
    requireRole('admin','lecturer');
    $rid=(int)$_POST['rubric_id']; $aid=(int)$_POST['assessment_id'];
    $wp = (float)$_POST['weight_percent'];
    // Ownership Validation
    if (role() !== 'admin') {
        $rubricAssess = qOne("SELECT r.assessment_id, a.lecturer_id FROM rubrics r JOIN assessments a ON r.assessment_id = a.id WHERE r.id=?", [$rid]);
        if (!$rubricAssess || (int)$rubricAssess['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to edit this rubric.');
            header('Location: index.php?page=dashboard'); exit;
        }
    }
    
    $cur = (float)(qOne("SELECT COALESCE(SUM(weight_percent),0) as t FROM rubric_criteria WHERE rubric_id=?",[$rid])['t']);
    if ($cur + $wp > 100.01) {
        flash('error',"Total weight would exceed 100% (current: {$cur}%). Cannot add {$wp}%.");
    } else {
        $cloId = $_POST['clo_id'] ? (int)$_POST['clo_id'] : null;
        qRun("INSERT INTO rubric_criteria (rubric_id,clo_id,description,max_score,weight_percent) VALUES (?,?,?,?,?)",
            [$rid,$cloId,trim($_POST['description']),(float)$_POST['max_score'],$wp]);
        auditLog('ADD_CRITERION','rubric_criteria',lastId()); flash('success','Criterion added.');
    }
    header("Location: index.php?page=rubrics&assessment_id=$aid"); exit;
}
if ($act === 'criterion_delete') {
    requireRole('admin','lecturer');
    $id=(int)$_POST['id']; $aid=(int)$_POST['assessment_id'];
    // Ownership Validation
    if (role() !== 'admin') {
        $critAssess = qOne("SELECT r.assessment_id, a.lecturer_id FROM rubric_criteria rc JOIN rubrics r ON rc.rubric_id = r.id JOIN assessments a ON r.assessment_id = a.id WHERE rc.id=?", [$id]);
        if (!$critAssess || (int)$critAssess['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to delete this criterion.');
            header('Location: index.php?page=dashboard'); exit;
        }
    }
    try {
        qRun("DELETE FROM rubric_criteria WHERE id=?",[$id]); auditLog('DELETE_CRITERION','rubric_criteria',$id);
        flash('success','Criterion deleted.');
    } catch(Exception $e) {
        flash('error','Cannot delete criterion: This criterion already has student scores linked to it.');
    }
    header("Location: index.php?page=rubrics&assessment_id=$aid"); exit;
}

// ── GRADE ENTRY ──────────────────────────────────────────
if ($act === 'save_grades') {
    requireRole('admin','lecturer');
    $aid = (int)$_POST['assessment_id'];
    
    $selAssess = qOne("SELECT subject_id, semester, lecturer_id FROM assessments WHERE id=?", [$aid]);
    if (!$selAssess) {
        flash('error', 'Assessment not found.');
        header('Location: index.php?page=dashboard'); exit;
    }

    // Ownership Validation
    if (role() !== 'admin') {
        if ((int)$selAssess['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to grade this assessment.');
            header('Location: index.php?page=dashboard'); exit;
        }
    }

    $scores = $_POST['scores'] ?? [];
    $criteriaMap = [];
    foreach (qAll("SELECT rc.id,rc.max_score FROM rubric_criteria rc JOIN rubrics r ON rc.rubric_id=r.id WHERE r.assessment_id=?",[$aid]) as $cr)
        $criteriaMap[$cr['id']] = $cr['max_score'];
        
    // Fetch valid enrollments for the subject and semester of this assessment
    $validEnrollments = array_column(qAll(
        "SELECT se.id FROM student_enrollments se WHERE se.subject_id=? AND se.semester=?",
        [(int)$selAssess['subject_id'], $selAssess['semester']]
    ), 'id');

    try {
        db()->beginTransaction();
        $saved = 0;
        foreach ($scores as $eid => $criteria) {
            // Validate enrollment belongs to the assessment's subject and semester
            if (!in_array((int)$eid, $validEnrollments)) {
                continue;
            }
            foreach ($criteria as $cid => $scoreRaw) {
                if ($scoreRaw === '' || $scoreRaw === null) {
                    continue;
                }
                if (!is_numeric($scoreRaw)) {
                    throw new Exception("Invalid score '{$scoreRaw}' for criterion #$cid");
                }

                $score = (float)$scoreRaw;
                $max   = (float)($criteriaMap[$cid] ?? 0);
                if ($score > $max) throw new Exception("Score $score exceeds max $max for criterion #$cid");
                if ($score < 0)   throw new Exception("Score cannot be negative.");

                $existing = qOne("SELECT id, score FROM student_scores WHERE enrollment_id=? AND criterion_id=?",[(int)$eid,(int)$cid]);
                $previousScore = null;
                if ($existing) {
                    if ((float)$existing['score'] === $score) {
                        continue;
                    }
                    $previousScore = (float)$existing['score'];
                    qRun("UPDATE student_scores SET score=?,graded_by=?,graded_at=NOW() WHERE enrollment_id=? AND criterion_id=?",
                        [$score,uid(),(int)$eid,(int)$cid]);
                    $action = 'UPDATE';
                } else {
                    qRun("INSERT INTO student_scores (enrollment_id,criterion_id,score,graded_by) VALUES (?,?,?,?)",
                        [(int)$eid,(int)$cid,$score,uid()]);
                    $action = 'INSERT';
                }
                ledgerRecord((int)$eid,(int)$cid,$score,$action,uid(),$previousScore);
                $saved++;
            }
        }
        db()->commit();
        flash('success',"Saved $saved scores. Ledger updated successfully.");
    } catch(Exception $e){ db()->rollBack(); flash('error','Error: '.$e->getMessage()); }
    header("Location: index.php?page=grade&assessment_id=$aid"); exit;
}

// ── GRADE CHANGE REQUESTS ────────────────────────────────────

// Lecturer submits a grade change request
if ($act === 'request_grade_change') {
    requireRole('lecturer', 'admin');

    $eid      = (int)$_POST['enrollment_id'];
    $cid      = (int)$_POST['criterion_id'];
    $newScore = (float)$_POST['new_score'];
    $reason   = trim($_POST['reason'] ?? '');
    $aid      = (int)$_POST['assessment_id'];

    if ($reason === '') {
        flash('error', 'Please provide a reason for the grade change request.');
        header("Location: index.php?page=grade&assessment_id=$aid"); exit;
    }

    $aid = (int)$_POST['assessment_id'];

    // Fetch current score — filter by assessment_id to ensure correct lecturer ownership
    $existing = qOne(
        "SELECT ss.score, a.lecturer_id, a.id as aid, rc.max_score
         FROM student_scores ss
         JOIN student_enrollments se ON ss.enrollment_id = se.id
         JOIN rubric_criteria rc ON ss.criterion_id = rc.id
         JOIN rubrics r ON rc.rubric_id = r.id
         JOIN assessments a ON r.assessment_id = a.id
         WHERE ss.enrollment_id = ? AND ss.criterion_id = ? AND a.id = ?",
        [$eid, $cid, $aid]
    );

    if (!$existing) {
        flash('error', 'No existing score found to request a change for.');
        header("Location: index.php?page=grade&assessment_id=$aid"); exit;
    }

    // Ownership: lecturer can only request change for their own assessment
    if (role() !== 'admin' && (int)$existing['lecturer_id'] !== uid()) {
        flash('error', 'Security Alert: You can only request changes for assessments you own.');
        header("Location: index.php?page=grade&assessment_id=$aid"); exit;
    }

    // Validate new score
    if ($newScore < 0 || $newScore > (float)$existing['max_score']) {
        flash('error', "New score must be between 0 and {$existing['max_score']}.");
        header("Location: index.php?page=grade&assessment_id=$aid"); exit;
    }

    if (abs($newScore - (float)$existing['score']) < 0.001) {
        flash('error', 'New score is the same as the current score. No change needed.');
        header("Location: index.php?page=grade&assessment_id=$aid"); exit;
    }

    // Check for existing pending request for same enrollment+criterion
    $pendingExists = qOne(
        "SELECT id FROM grade_change_requests WHERE enrollment_id=? AND criterion_id=? AND status='pending'",
        [$eid, $cid]
    );
    if ($pendingExists) {
        flash('error', 'There is already a pending change request for this score. Please wait for admin review.');
        header("Location: index.php?page=grade&assessment_id=$aid"); exit;
    }

    qRun(
        "INSERT INTO grade_change_requests (enrollment_id, criterion_id, old_score, new_score, reason, requested_by)
         VALUES (?,?,?,?,?,?)",
        [$eid, $cid, $existing['score'], $newScore, $reason, uid()]
    );
    auditLog('REQUEST_GRADE_CHANGE', 'grade_change_requests', lastId(),
        "enrollment=$eid criterion=$cid old={$existing['score']} new=$newScore reason=$reason"
    );
    flash('success', 'Grade change request submitted. Waiting for admin approval.');
    header("Location: index.php?page=grade&assessment_id=$aid"); exit;
}

// Admin approves a grade change request
if ($act === 'approve_grade_change') {
    requireRole('admin');

    $reqId     = (int)$_POST['request_id'];
    $reviewNote = trim($_POST['review_note'] ?? '');

    $req = qOne(
        "SELECT gcr.*, ss.score as current_score
         FROM grade_change_requests gcr
         LEFT JOIN student_scores ss ON gcr.enrollment_id = ss.enrollment_id AND gcr.criterion_id = ss.criterion_id
         WHERE gcr.id = ? AND gcr.status = 'pending'",
        [$reqId]
    );

    if (!$req) {
        flash('error', 'Request not found or already processed.');
        header('Location: index.php?page=grade_requests'); exit;
    }

    try {
        db()->beginTransaction();

        $eid      = (int)$req['enrollment_id'];
        $cid      = (int)$req['criterion_id'];
        $newScore = (float)$req['new_score'];
        $oldScore = (float)$req['old_score'];

        // Apply the score change
        if ($req['current_score'] !== null) {
            qRun(
                "UPDATE student_scores SET score=?, graded_by=?, graded_at=NOW() WHERE enrollment_id=? AND criterion_id=?",
                [$newScore, (int)$req['requested_by'], $eid, $cid]
            );
        } else {
            qRun(
                "INSERT INTO student_scores (enrollment_id, criterion_id, score, graded_by) VALUES (?,?,?,?)",
                [$eid, $cid, $newScore, (int)$req['requested_by']]
            );
        }

        // Mark request as approved
        qRun(
            "UPDATE grade_change_requests SET status='approved', reviewed_by=?, reviewed_at=NOW(), review_note=? WHERE id=?",
            [uid(), $reviewNote ?: null, $reqId]
        );

        // Write to ledger: graded_by = requester (lecturer), approved_by = current admin
        ledgerRecord($eid, $cid, $newScore, 'UPDATE', (int)$req['requested_by'], $oldScore, uid(), $reqId);

        db()->commit();

        auditLog('APPROVE_GRADE_CHANGE', 'grade_change_requests', $reqId,
            "enrollment=$eid criterion=$cid old=$oldScore new=$newScore approved_by=" . uid()
        );
        flash('success', 'Grade change approved and applied to ledger.');
    } catch (Exception $e) {
        db()->rollBack();
        flash('error', 'Error applying grade change: ' . $e->getMessage());
    }
    header('Location: index.php?page=grade_requests'); exit;
}

// Admin rejects a grade change request
if ($act === 'reject_grade_change') {
    requireRole('admin');

    $reqId      = (int)$_POST['request_id'];
    $reviewNote = trim($_POST['review_note'] ?? '');

    $req = qOne("SELECT id FROM grade_change_requests WHERE id=? AND status='pending'", [$reqId]);
    if (!$req) {
        flash('error', 'Request not found or already processed.');
        header('Location: index.php?page=grade_requests'); exit;
    }

    qRun(
        "UPDATE grade_change_requests SET status='rejected', reviewed_by=?, reviewed_at=NOW(), review_note=? WHERE id=?",
        [uid(), $reviewNote ?: null, $reqId]
    );
    auditLog('REJECT_GRADE_CHANGE', 'grade_change_requests', $reqId, "Rejected by admin " . uid());
    flash('success', 'Grade change request rejected.');
    header('Location: index.php?page=grade_requests'); exit;
}
