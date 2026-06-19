<?php
// ============================================================
//   INS3064 Group 3 — Secure University Grading System
// ============================================================

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

// Autoloader: load classes, models, controllers
spl_autoload_register(function ($class) {
    $dirs = [
        __DIR__ . '/classes/',
        __DIR__ . '/classes/Strategies/',
        __DIR__ . '/models/',
        __DIR__ . '/controllers/'
    ];
    foreach ($dirs as $dir) {
        $files = [
            $dir . $class . '.php',
            $dir . strtolower($class) . '.php'
        ];
        foreach ($files as $file) {
            if (file_exists($file)) {
                require_once $file;
                return;
            }
        }
    }
});

if (session_status() === PHP_SESSION_NONE) {
    session_start([
        'cookie_httponly' => true,
        'cookie_secure'   => isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on',
        'cookie_samesite' => 'Lax'
    ]);
}

// Load Core & HTML Layout helpers
require_once __DIR__ . '/includes/core.php';
require_once __DIR__ . '/includes/layout.php';

// Route page
$page = trim((string)($_GET['page'] ?? ''));
if ($page === '') {
    $page = isLoggedIn() ? 'dashboard' : 'login';
}
// Prevent path traversal — only allow alphanumeric + underscore page names
if (!preg_match('/^[a-zA-Z0-9_]+$/', $page)) {
    $page = isLoggedIn() ? 'dashboard' : 'login';
}

// Dispatch POST actions to Controllers
if (($_SERVER['REQUEST_METHOD'] ?? '') === 'POST') {
    $action = trim((string)($_POST['_action'] ?? ''));
    
    // Validate CSRF token for all actions except login
    if ($action !== 'login') {
        $token = $_POST['csrf_token'] ?? '';
        if (!Auth::validateCsrfToken($token)) {
            flash('error', 'Security Alert: Request rejected due to missing or invalid CSRF token.');
            header('Location: index.php?page=dashboard');
            exit;
        }
    }

    switch ($action) {
        case 'login':
            (new AuthController())->handleLogin();
            break;
        case 'logout':
            (new AuthController())->handleLogout();
            break;
        case 'user_create':
            (new UserController())->create();
            break;
        case 'user_edit':
            (new UserController())->edit();
            break;
        case 'user_delete':
            (new UserController())->delete();
            break;
        case 'prog_create':
            (new ProgramController())->create();
            break;
        case 'prog_edit':
            (new ProgramController())->edit();
            break;
        case 'prog_delete':
            (new ProgramController())->delete();
            break;
        case 'subj_create':
            (new SubjectController())->create();
            break;
        case 'subj_edit':
            (new SubjectController())->edit();
            break;
        case 'subj_delete':
            (new SubjectController())->delete();
            break;
        case 'plo_create':
            (new PloController())->create();
            break;
        case 'plo_edit':
            (new PloController())->edit();
            break;
        case 'plo_delete':
            (new PloController())->delete();
            break;
        case 'clo_create':
            (new CloController())->create();
            break;
        case 'clo_edit':
            (new CloController())->edit();
            break;
        case 'clo_delete':
            (new CloController())->delete();
            break;
        case 'save_matrix':
            (new CloController())->saveMatrix();
            break;
        case 'enroll':
            (new EnrollmentController())->enroll();
            break;
        case 'unenroll':
            (new EnrollmentController())->unenroll();
            break;
        case 'assess_create':
            (new AssessmentController())->create();
            break;
        case 'assess_delete':
            (new AssessmentController())->delete();
            break;
        case 'rubric_create':
            (new RubricController())->createRubric();
            break;
        case 'rubric_delete':
            (new RubricController())->deleteRubric();
            break;
        case 'criterion_add':
            (new RubricController())->addCriterion();
            break;
        case 'criterion_delete':
            (new RubricController())->deleteCriterion();
            break;
        case 'save_grades':
            (new GradeController())->saveGrades();
            break;
        case 'save_grades_ajax':
            (new GradeController())->saveGradesAjax();
            break;
        case 'request_grade_change_ajax':
            (new GradeController())->requestGradeChangeAjax();
            break;
        case 'approve_grade_change_ajax':
            (new GradeRequestController())->approveGradeChangeAjax();
            break;
        case 'reject_grade_change_ajax':
            (new GradeRequestController())->rejectGradeChangeAjax();
            break;
        case 'request_grade_change':
            (new GradeController())->requestGradeChange();
            break;
        case 'approve_grade_change':
            (new GradeRequestController())->approveGradeChange();
            break;
        case 'reject_grade_change':
            (new GradeRequestController())->rejectGradeChange();
            break;
        case 'self_heal_ledger':
            (new LedgerController())->selfHealLedger();
            break;
        case 'notif_create':
            (new NotificationController())->create();
            break;
        case 'notif_update':
            (new NotificationController())->update();
            break;
        case 'notif_delete':
            (new NotificationController())->delete();
            break;
        case 'notif_mark_read':
            (new NotificationController())->markRead();
            break;
    }
}

// Dispatch GET requests to Controllers
switch ($page) {
    case 'login':
        (new AuthController())->showLogin();
        break;
    case 'dashboard':
        (new DashboardController())->index();
        break;
    case 'users':
        (new UserController())->index();
        break;
    case 'programs':
        (new ProgramController())->index();
        break;
    case 'subjects':
        (new SubjectController())->index();
        break;
    case 'plos':
        (new PloController())->index();
        break;
    case 'clos':
        (new CloController())->index();
        break;
    case 'clo_matrix':
        (new CloController())->matrix();
        break;
    case 'enrollments':
        (new EnrollmentController())->index();
        break;
    case 'assessments':
        (new AssessmentController())->index();
        break;
    case 'rubrics':
        (new RubricController())->index();
        break;
    case 'grade':
        (new GradeController())->index();
        break;
    case 'grades':
        (new GradeController())->showGrades();
        break;
    case 'clo_report':
        (new GradeController())->showCloReport();
        break;
    case 'grade_requests':
        (new GradeRequestController())->index();
        break;
    case 'my_requests':
        (new GradeRequestController())->showMyRequests();
        break;
    case 'ledger':
        (new LedgerController())->index();
        break;
    case 'verify_ledger':
        (new LedgerController())->verify();
        break;
    case 'audit_logs':
        (new AuditLogController())->index();
        break;
    case 'notifications':
        if (isset($_GET['_api']) && $_GET['_api'] === 'list') {
            (new NotificationController())->list();
        } else {
            (new NotificationController())->index();
        }
        break;
    default:
        header('Location: index.php?page=dashboard');
        exit;
}