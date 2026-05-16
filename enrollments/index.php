<?php 
// Đường dẫn include cấu trúc chung của hệ thống
include '../includes/header.php'; 
require_once '../classes/database.php'; // Gọi trực tiếp Database class của nhóm

$db = Database::getInstance();

// 1. Lấy danh sách tất cả môn học hiển thị lên Dropdown
$subject_stmt = $db->query("SELECT id, code, name FROM subjects ORDER BY code ASC");
$subjects = $subject_stmt->fetchAll(PDO::FETCH_ASSOC);

// 2. Lấy danh sách tài khoản là Sinh viên
$student_stmt = $db->query("SELECT id, username, full_name FROM users WHERE role = 'student' ORDER BY username ASC");
$students = $student_stmt->fetchAll(PDO::FETCH_ASSOC);

// Đọc bộ lọc lớp học từ Request
$selected_subject_id = isset($_GET['subject_id']) ? intval($_GET['subject_id']) : ($subjects[0]['id'] ?? 0);
$selected_semester = isset($_GET['semester']) ? trim($_GET['semester']) : 'HK1-2025-2026';

$message = '';
$error = '';

// 3. Xử lý Form Ghi danh sinh viên (Thêm)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add_enrollment') {
    $student_id = intval($_POST['student_id']);
    $semester = trim($_POST['semester']);
    
    // BACKEND BUSINESS RULE: Kiểm tra trùng lặp ghi danh [WorkSheet12 - Mục 26, 30]
    $check = $db->query("SELECT id FROM student_enrollments WHERE student_id = ? AND subject_id = ? AND semester = ?", [$student_id, $selected_subject_id, $semester]);
    
    if ($check->fetch()) {
        $error = "Lỗi nghiệp vụ: Sinh viên này đã được ghi danh vào lớp học phần trong học kỳ được chọn.";
    } else {
        $db->query("INSERT INTO student_enrollments (student_id, subject_id, semester) VALUES (?, ?, ?)", [$student_id, $selected_subject_id, $semester]);
        $message = "Ghi danh sinh viên vào lớp học phần thành công.";
        $selected_semester = $semester; // Đồng bộ học kỳ hiển thị
    }
}

// 4. Xử lý yêu cầu hủy ghi danh (Xóa) [WorkSheet12 - Mục 25]
if (isset($_GET['delete_id'])) {
    $db->query("DELETE FROM student_enrollments WHERE id = ?", [intval($_GET['delete_id'])]);
    echo "<script>window.location.href='index.php?subject_id=".$selected_subject_id."&semester=".$selected_semester."';</script>";
    exit();
}

// 5. Lấy danh sách sinh viên đã ghi danh theo đúng cấu trúc cột trong web2.sql [WorkSheet12 - Mục 24]
$enrolled_stmt = $db->query("
    SELECT se.id, u.username, u.full_name, u.email 
    FROM student_enrollments se
    JOIN users u ON se.student_id = u.id
    WHERE se.subject_id = ? AND se.semester = ?
    ORDER BY u.username ASC
", [$selected_subject_id, $selected_semester]);
$enrolled_students = $enrolled_stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<style>
    :root {
        --system-blue: #0f172a; /* Màu xanh đen đặc trưng Navbar */
        --theme-primary: #1e40af;
        --border-smooth: #cbd5e1;
        --card-bg: #ffffff;
    }
    
    body {
        background-color: #f8fafc;
        color: #1e293b;
    }

    .page-header {
        color: var(--system-blue);
        font-weight: 700;
        border-bottom: 2px solid #e2e8f0;
        padding-bottom: 10px;
    }

    .card-theme {
        border: 1px solid #e2e8f0 !important;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03) !important;
        border-radius: 8px !important;
        background-color: var(--card-bg);
    }

    .card-header-theme {
        background-color: var(--system-blue) !important;
        color: #ffffff !important;
        font-weight: 600;
        padding: 14px 20px;
        border-top-left-radius: 8px !important;
        border-top-right-radius: 8px !important;
        border-bottom: none;
    }

    .btn-theme {
        background-color: var(--system-blue) !important;
        border-color: var(--system-blue) !important;
        color: #ffffff !important;
        font-weight: 500;
        padding: 10px;
        border-radius: 6px;
        transition: all 0.2s ease-in-out;
    }

    .btn-theme:hover {
        opacity: 0.9;
        transform: translateY(-1px);
    }

    .form-select, .form-control {
        border: 1px solid var(--border-smooth);
        border-radius: 6px;
        padding: 10px;
        color: #334155;
    }

    .form-select:focus, .form-control:focus {
        border-color: var(--theme-primary);
        box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.15);
    }

    .table-theme {
        border-color: #e2e8f0;
    }

    .table-theme thead th {
        background-color: #f1f5f9 !important;
        color: var(--system-blue);
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.5px;
        border-bottom: 2px solid #cbd5e1;
    }

    .text-highlight {
        color: var(--system-blue);
        font-weight: 600;
    }
</style>

<div class="container py-4">
    <h3 class="mb-4 page-header">Quản lý Lớp học phần và Ghi danh</h3>
    
    <div class="card card-theme mb-4">
        <div class="card-body py-3">
            <form method="GET" action="index.php" class="row g-3 align-items-end">
                <div class="col-md-5">
                    <label class="form-label fw-bold text-secondary">Chọn lớp học phần:</label>
                    <select name="subject_id" class="form-select">
                        <?php foreach ($subjects as $sj): ?>
                            <option value="<?= $sj['id'] ?>" <?= $sj['id'] == $selected_subject_id ? 'selected' : '' ?>>
                                <?= htmlspecialchars($sj['code'] . ' - ' . $sj['name']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold text-secondary">Chọn học kỳ:</label>
                    <select name="semester" class="form-select">
                        <option value="HK1-2025-2026" <?= $selected_semester == 'HK1-2025-2026' ? 'selected' : '' ?>>Học kỳ 1 (2025 - 2026)</option>
                        <option value="HK2-2025-2026" <?= $selected_semester == 'HK2-2025-2026' ? 'selected' : '' ?>>Học kỳ 2 (2025 - 2026)</option>
                        <option value="HK3-2025-2026" <?= $selected_semester == 'HK3-2025-2026' ? 'selected' : '' ?>>Học kỳ hè (2025 - 2026)</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-theme w-100 py-2">🔍 Lọc danh sách</button>
                </div>
            </form>
        </div>
    </div>

    <?php if ($message): ?>
        <div class="alert alert-success border-0 shadow-sm mb-4"><?= $message ?></div>
    <?php endif; ?>
    <?php if ($error): ?>
        <div class="alert alert-danger border-start border-4 border-danger shadow-sm mb-4"><?= $error ?></div>
    <?php endif; ?>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card card-theme mb-4">
                <div class="card-header-theme">Thêm sinh viên vào lớp</div>
                <div class="card-body p-4">
                    <?php if (empty($students)): ?>
                        <div class="text-center text-muted">Hệ thống chưa có dữ liệu tài khoản sinh viên.</div>
                    <?php else: ?>
                        <form action="index.php?subject_id=<?= $selected_subject_id ?>&semester=<?= $selected_semester ?>" method="POST">
                            <input type="hidden" name="action" value="add_enrollment">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">Lựa chọn sinh viên:</label>
                                <select name="student_id" class="form-select" required>
                                    <option value="">-- Chọn học viên --</option>
                                    <?php foreach ($students as $st): ?>
                                        <option value="<?= $st['id'] ?>">
                                            <?= htmlspecialchars($st['username']) ?> - <?= htmlspecialchars($st['full_name']) ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">Học kỳ ghi danh:</label>
                                <select name="semester" class="form-select" required>
                                    <option value="HK1-2025-2026" <?= $selected_semester == 'HK1-2025-2026' ? 'selected' : '' ?>>Học kỳ 1 (2025 - 2026)</option>
                                    <option value="HK2-2025-2026" <?= $selected_semester == 'HK2-2025-2026' ? 'selected' : '' ?>>Học kỳ 2 (2025 - 2026)</option>
                                    <option value="HK3-2025-2026" <?= $selected_semester == 'HK3-2025-2026' ? 'selected' : '' ?>>Học kỳ hè (2025 - 2026)</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-theme w-100 py-2">Xác nhận ghi danh vào lớp</button>
                        </form>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card card-theme">
                <div class="card-header-theme d-flex justify-content-between align-items-center">
                    <span>Danh sách học viên đã ghi danh</span>
                    <span class="badge bg-white text-dark px-3 py-2 fw-bold" style="border-radius: 4px;">
                        Sĩ số: <?= count($enrolled_students) ?>
                    </span>
                </div>
                <div class="card-body p-0">
                    <?php if (empty($enrolled_students)): ?>
                        <div class="text-center text-muted py-5">Chưa có sinh viên nào ghi danh vào học phần này trong học kỳ đang chọn.</div>
                    <?php else: ?>
                        <table class="table table-striped table-hover mb-0 table-theme" style="vertical-align: middle;">
                            <thead>
                                <tr class="text-center">
                                    <th style="width: 10%;">STT</th>
                                    <th style="width: 25%;" class="text-start">Mã sinh viên</th>
                                    <th style="width: 45%;" class="text-start">Họ và tên</th>
                                    <th style="width: 20%;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $stt = 1;
                                foreach ($enrolled_students as $en): 
                                ?>
                                    <tr class="text-center">
                                        <td><?= $stt++ ?></td>
                                        <td class="text-start font-monospace fw-bold text-highlight"><?= htmlspecialchars($en['username']) ?></td>
                                        <td class="text-start text-secondary"><?= htmlspecialchars($en['full_name']) ?></td>
                                        <td>
                                            <a href="index.php?subject_id=<?= $selected_subject_id ?>&semester=<?= $selected_semester ?>&delete_id=<?= $en['id'] ?>" 
                                               class="btn btn-sm btn-outline-danger px-3" 
                                               onclick="return confirm('Xác nhận xóa sinh viên khỏi danh sách lớp học phần?')">
                                                Xóa tên
                                            </a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include '../includes/footer.php'; ?>