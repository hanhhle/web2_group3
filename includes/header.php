<?php
if (session_status() === PHP_SESSION_NONE) session_start();
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../classes/database.php';
require_once __DIR__ . '/../classes/auth.php';

$role     = Auth::getRole();
$fullName = $_SESSION['full_name'] ?? '';

// Base URL for all links — computed once via Auth::url()
$b = rtrim(Auth::url(''), '/') . '/';   // e.g. /web2_group3-main/
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo APP_NAME; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    
    <!-- Nhúng Font chữ hình học cao cấp chuyên cho SaaS xa xỉ -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        /* Hệ thống màu sắc đỉnh cao độc bản */
        :root {
            --bg-master: #fcfdfe;
            --text-main: #0c111d;
            --glass-border: rgba(15, 23, 42, 0.04);
            --sidebar-width: 260px;
        }

        body { 
            background-color: var(--bg-master) !important; 
            color: var(--text-main); 
            font-family: 'Plus Jakarta Sans', sans-serif !important;
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        /* Hiệu ứng ánh sáng sinh học dịch chuyển ngầm dưới cấu trúc nền */
        body::before {
            content: '';
            position: absolute;
            width: 700px;
            height: 700px;
            top: -150px;
            left: -100px;
            background: radial-gradient(circle, rgba(13, 110, 253, 0.03) 0%, rgba(0,0,0,0) 70%);
            z-index: -2;
            pointer-events: none;
        }

        /* 1. THANH NAVBAR - Biến thành dải pha lê lơ lửng cao cấp (Floating Glass Navbar) */
        .premium-nav {
            background: rgba(255, 255, 255, 0.7) !important;
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--glass-border) !important;
            padding: 0.85rem 2rem !important;
            position: sticky;
            top: 0;
            z-index: 1050;
        }

        .navbar-brand-custom {
            font-weight: 700;
            font-size: 1.15rem;
            letter-spacing: -0.5px;
            color: var(--text-main) !important;
            display: flex;
            align-items: center;
        }

        .navbar-brand-custom i {
            font-size: 1.35rem;
            color: #0d6efd !important; /* Đổi vàng thô sang xanh hồ sâu thẳm */
            filter: drop-shadow(0 4px 10px rgba(13, 110, 253, 0.2));
            margin-right: 0.6rem;
        }

        /* Thẻ định danh người dùng phong cách tối giản thanh lịch */
        .user-identity-badge {
            background: rgba(12, 17, 29, 0.03);
            border: 1px solid rgba(12, 17, 29, 0.05);
            color: #344054 !important;
            padding: 0.5rem 1rem !important;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.82rem;
            display: flex;
            align-items: center;
            letter-spacing: 0.2px;
        }

        /* Tạo các chấm chỉ thị màu mỏng tinh xảo tương ứng từng Role */
        .role-dot-admin { color: #dc2626 !important; font-weight: 700; }
        .role-dot-lecturer { color: #2563eb !important; font-weight: 700; }
        .role-dot-student { color: #16a34a !important; font-weight: 700; }

        .logout-btn-custom {
            background: #0c111d;
            color: #ffffff !important;
            border: none;
            padding: 0.5rem 1.1rem;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.82rem;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .logout-btn-custom:hover {
            background: #1e293b;
            transform: translateY(-1px);
            box-shadow: 0 8px 20px -6px rgba(12, 17, 29, 0.3);
        }

        /* 2. THANH SIDEBAR - Trường phái không biên giới (Borderless Art Directory) */
        .premium-sidebar {
            background: transparent;
            border-right: 1px solid var(--glass-border);
            min-height: calc(100vh - 65px);
            padding: 2rem 1.25rem !important;
        }

        /* Tiêu đề nhóm danh mục phong cách tạp chí kiến trúc */
        .sidebar-heading-custom {
            font-size: 0.68rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.8px;
            color: #98a2b3;
            padding: 0.75rem 0.85rem 0.4rem 0.85rem;
        }

        /* Đường dẫn menu dạng kén phẳng mượt mà */
        .nav-link-custom {
            color: #475467 !important;
            font-weight: 500;
            font-size: 0.88rem;
            padding: 0.7rem 0.95rem !important;
            border-radius: 12px;
            display: flex;
            align-items: center;
            margin-bottom: 0.25rem;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .nav-link-custom i {
            font-size: 1.15rem;
            margin-right: 0.85rem;
            color: #667085;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        /* Trạng thái Hover trượt nhẹ và đổi màu chiều sâu điện ảnh */
        .nav-link-custom:hover {
            background: rgba(12, 17, 29, 0.04);
            color: #0c111d !important;
            transform: translateX(3px);
        }

        .nav-link-custom:hover i {
            color: #0c111d;
            transform: scale(1.08);
        }

        /* 3. KHÔNG GIAN NỘI DUNG CHÍNH (Main Terminal Space) */
        .premium-main-content {
            padding: 2.5rem 3.5rem !important;
        }

        @media (max-width: 768px) {
            .premium-main-content { padding: 1.5rem !important; }
            .premium-sidebar { border-right: none; border-bottom: 1px solid var(--glass-border); min-height: auto; }
        }
    </style>
</head>
<body>

<!-- Giao diện Thanh Điều Hướng Pha Lê Lơ Lửng -->
<nav class="navbar navbar-expand-lg premium-nav">
    <div class="container-fluid px-1">
        <a class="navbar-brand navbar-brand-custom" href="<?php echo $b; ?>index.php?page=dashboard">
            <i class="bi bi-shield-shaded"></i><?php echo APP_NAME; ?>
        </a>
        <div class="ms-auto d-flex align-items-center gap-2.5">
            <?php if ($role): ?>
                <?php 
                    $roleClass = ['admin'=>'role-dot-admin','lecturer'=>'role-dot-lecturer','student'=>'role-dot-student'][$role] ?? ''; 
                ?>
                <span class="user-identity-badge shadow-sm">
                    <i class="bi bi-circle-fill me-2" style="font-size: 6px; color: <?php echo ['admin'=>'#dc2626','lecturer'=>'#2563eb','student'=>'#16a34a'][$role] ?? '#64748b'; ?>;"></i>
                    <span class="me-1.5 text-dark fw-medium"><?php echo htmlspecialchars($fullName); ?></span>
                    <span class="opacity-40 me-1.5">|</span>
                    <span class="<?php echo $roleClass; ?>"><?php echo ucfirst($role); ?></span>
                </span>
                <form method="POST" action="<?php echo $b; ?>index.php" class="d-inline">
                    <input type="hidden" name="csrf_token" value="<?php echo Auth::getCsrfToken(); ?>">
                    <input type="hidden" name="_action" value="logout">
                    <button class="logout-btn-custom" type="submit" style="cursor: pointer;">
                        <i class="bi bi-power me-1.5"></i>Logout
                    </button>
                </form>
            <?php else: ?>
                <a href="<?php echo $b; ?>index.php?page=login" class="logout-btn-custom"><i class="bi bi-box-arrow-in-right me-1.5"></i>Login</a>
            <?php endif; ?>
        </div>
    </div>
</nav>

<div class="container-fluid">
<div class="row">

<!-- Giao diện Menu Trái Borderless Luxury -->
<nav class="col-md-2 d-none d-md-block premium-sidebar">
    <?php if ($role === 'admin'): ?>
        <div class="sidebar-heading-custom">Core Terminal</div>
        <a href="<?php echo $b; ?>index.php?page=dashboard" class="nav-link-custom"><i class="bi bi-grid-1x2"></i>Dashboard</a>
        
        <div class="sidebar-heading-custom mt-3">Academic Structure</div>
        <a href="<?php echo $b; ?>index.php?page=programs"      class="nav-link-custom"><i class="bi bi-mortarboard"></i>Programs</a>
        <a href="<?php echo $b; ?>index.php?page=subjects"      class="nav-link-custom"><i class="bi bi-book"></i>Subjects</a>
        <a href="<?php echo $b; ?>index.php?page=plos"          class="nav-link-custom"><i class="bi bi-bullseye"></i>Program PLOs</a>
        <a href="<?php echo $b; ?>index.php?page=clos"          class="nav-link-custom"><i class="bi bi-diagram-3"></i>Course CLOs</a>
        <a href="<?php echo $b; ?>index.php?page=clo_matrix"    class="nav-link-custom"><i class="bi bi-grid-3x3"></i>CLO-PLO Matrix</a>
        
        <div class="sidebar-heading-custom mt-3">Identity Gate</div>
        <a href="<?php echo $b; ?>index.php?page=users"         class="nav-link-custom"><i class="bi bi-people"></i>User Accounts</a>
        <a href="<?php echo $b; ?>index.php?page=enrollments"   class="nav-link-custom"><i class="bi bi-person-check"></i>Enrollments</a>
        
        <div class="sidebar-heading-custom mt-3">Cryptographic</div>
        <a href="<?php echo $b; ?>index.php?page=ledger"        class="nav-link-custom"><i class="bi bi-layers-half"></i>Block Ledger</a>
        <a href="<?php echo $b; ?>index.php?page=verify_ledger" class="nav-link-custom"><i class="bi bi-shield-shaded"></i>Verify Ledger</a>
        <a href="<?php echo $b; ?>index.php?page=audit_logs"    class="nav-link-custom"><i class="bi bi-terminal"></i>Audit Engine Logs</a>
        <a href="<?php echo $b; ?>index.php?page=grade_requests" class="nav-link-custom"><i class="bi bi-arrow-repeat"></i>Grade Change Requests</a>
 
    <?php elseif ($role === 'lecturer'): ?>
        <div class="sidebar-heading-custom">Core Terminal</div>
        <a href="<?php echo $b; ?>index.php?page=dashboard"                  class="nav-link-custom"><i class="bi bi-grid-1x2"></i>Dashboard</a>
        
        <div class="sidebar-heading-custom mt-3">Evaluation Control</div>
        <a href="<?php echo $b; ?>index.php?page=assessments"     class="nav-link-custom"><i class="bi bi-clipboard-check"></i>Assessments</a>
        <a href="<?php echo $b; ?>index.php?page=rubrics"         class="nav-link-custom"><i class="bi bi-list-check"></i>Rubrics Matrix</a>
        <a href="<?php echo $b; ?>index.php?page=grade"           class="nav-link-custom"><i class="bi bi-pencil-square"></i>Grading Console</a>
        <a href="<?php echo $b; ?>index.php?page=my_requests"     class="nav-link-custom"><i class="bi bi-arrow-repeat"></i>My Change Requests</a>
 
    <?php elseif ($role === 'student'): ?>
        <div class="sidebar-heading-custom">Core Terminal</div>
        <a href="<?php echo $b; ?>index.php?page=dashboard"           class="nav-link-custom"><i class="bi bi-grid-1x2"></i>Dashboard</a>
        
        <div class="sidebar-heading-custom mt-3">Performance</div>
        <a href="<?php echo $b; ?>index.php?page=grades"              class="nav-link-custom"><i class="bi bi-bar-chart-line"></i>Academic Marks</a>
        <a href="<?php echo $b; ?>index.php?page=clo_report"          class="nav-link-custom"><i class="bi bi-file-earmark-bar-graph"></i>CLO Attainment</a>

    <?php else: ?>
        <a href="<?php echo $b; ?>index.php?page=login" class="nav-link-custom"><i class="bi bi-box-arrow-in-right"></i>Login Gateway</a>
    <?php endif; ?>
</nav>

<!-- Không gian hiển thị nội dung trang con (Main Viewport) -->
<main class="col-md-10 premium-main-content">