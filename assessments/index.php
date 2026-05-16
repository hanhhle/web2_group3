<?php 
// Đường dẫn include cấu trúc chung của hệ thống
include '../includes/header.php'; 
require_once '../classes/AssessmentController.php';

$assessmentCtrl = new AssessmentController();
$subjects = $assessmentCtrl->getAllSubjects();

// Lấy định danh môn học được lựa chọn từ Request, mặc định chọn học phần đầu tiên
$selected_subject_id = isset($_GET['subject_id']) ? intval($_GET['subject_id']) : ($subjects[0]['id'] ?? 0);

$message = '';
$error = '';

// Xử lý các yêu cầu gửi dữ liệu từ Form
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    if ($_POST['action'] === 'add_assessment') {
        $name = trim($_POST['name']);
        $weight = floatval($_POST['weight']);
        try {
            $assessmentCtrl->createAssessment($selected_subject_id, $name, $weight);
            $message = "Thêm thành phần đánh giá học phần thành công.";
        } catch (Exception $e) {
            $error = $e->getMessage(); 
        }
    }
    
    if ($_POST['action'] === 'add_criterion') {
        $assessment_id = intval($_POST['assessment_id']);
        $clo_id = intval($_POST['clo_id']);
        $description = trim($_POST['description']);
        $max_score = floatval($_POST['max_score']);
        try {
            $assessmentCtrl->createCriterion($assessment_id, $clo_id, $description, $max_score);
            $message = "Thiết lập tiêu chí đánh giá và ánh xạ chuẩn đầu ra thành công.";
        } catch (Exception $e) {
            $error = $e->getMessage();
        }
    }
}

// Xử lý yêu cầu loại bỏ thành phần đánh giá
if (isset($_GET['delete_id'])) {
    $assessmentCtrl->deleteAssessment(intval($_GET['delete_id']));
    echo "<script>window.location.href='index.php?subject_id=".$selected_subject_id."';</script>";
    exit();
}

// Truy vấn dữ liệu liên kết phục vụ hiển thị
$assessments = $assessmentCtrl->getAssessmentsBySubject($selected_subject_id);
$clos_step1 = $assessmentCtrl->getCLOsBySubject($selected_subject_id);
?>

<style>
    :root {
        --system-blue: #0f172a; /* Màu xanh đen sang trọng theo Navbar hệ thống */
        --theme-primary: #1e40af; /* Màu xanh thương hiệu chính */
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

    .badge-theme {
        background-color: rgba(15, 23, 42, 0.08) !important;
        color: var(--system-blue) !important;
        font-weight: 600;
        border: 1px solid rgba(15, 23, 42, 0.15);
        padding: 6px 10px;
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

    .assessment-block {
        border-left: 4px solid var(--system-blue) !important;
        border-radius: 6px;
        background-color: #ffffff;
    }

    .text-highlight {
        color: var(--system-blue);
        font-weight: 600;
    }
</style>

<div class="container py-4">
    <h3 class="mb-4 page-header">Cấu trúc Đánh giá và Thiết kế Rubric</h3>
    
    <div class="card card-theme mb-4">
        <div class="card-body py-3">
            <label class="form-label fw-bold text-secondary mb-2">Học phần cấu hình hệ thống:</label>
            <form method="GET" action="index.php" id="subjectForm">
                <select name="subject_id" class="form-select" onchange="document.getElementById('subjectForm').submit();">
                    <?php foreach ($subjects as $sj): ?>
                        <option value="<?= $sj['id'] ?>" <?= $sj['id'] == $selected_subject_id ? 'selected' : '' ?>>
                            <?= htmlspecialchars($sj['code'] . ' - ' . $sj['name']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
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
        <div class="col-md-6">
            <div class="card card-theme mb-4">
                <div class="card-header-theme">Thêm thành phần đánh giá mới</div>
                <div class="card-body p-4">
                    <form action="index.php?subject_id=<?= $selected_subject_id ?>" method="POST">
                        <input type="hidden" name="action" value="add_assessment">
                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">Tên thành phần đánh giá:</label>
                            <select name="name" class="form-select" required>
                                <option value="Chuyên cần">Chuyên cần</option>
                                <option value="Thi giữa kỳ">Thi giữa kỳ</option>
                                <option value="Thi cuối kỳ">Thi cuối kỳ</option>
                                <option value="Bài tập lớn">Bài tập lớn</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">Trọng số kết quả (%):</label>
                            <input type="number" name="weight" class="form-control" step="0.5" min="1" max="100" placeholder="Nhập số phần trăm" required>
                        </div>
                        <button type="submit" class="btn btn-theme w-100 py-2">Lưu thành phần đánh giá</button>
                    </form>
                </div>
            </div>

            <h5 class="mb-3 text-highlight">Cấu trúc điểm học phần hiện tại</h5>
            <?php if (empty($assessments)): ?>
                <div class="alert alert-light border text-center text-muted">Học phần chưa được thiết lập cấu trúc điểm.</div>
            <?php else: ?>
                <?php foreach ($assessments as $as): ?>
                    <div class="card mb-3 assessment-block shadow-sm border border-start-0">
                        <div class="card-body d-flex justify-content-between align-items-center py-3">
                            <div>
                                <h6 class="card-title mb-0 fw-bold text-highlight"><?= htmlspecialchars($as['name']) ?></h6>
                                <small class="text-muted">Trọng số thành phần: <strong class="text-dark"><?= $as['weight'] ?>%</strong></small>
                            </div>
                            <a href="index.php?subject_id=<?= $selected_subject_id ?>&delete_id=<?= $as['id'] ?>" class="btn btn-sm btn-outline-danger px-3" onclick="return confirm('Xóa thành phần đánh giá sẽ loại bỏ toàn bộ các tiêu chí thiết kế rubric liên quan?')">Xóa</a>
                        </div>
                        
                        <div class="card-footer bg-white p-3 border-top border-light">
                            <span class="text-secondary fw-bold d-block mb-2" style="font-size: 0.8rem; text-transform: uppercase; letter-spacing: 0.3px;">Tiêu chí đánh giá chi tiết:</span>
                            <?php 
                            $criteria = $assessmentCtrl->getRubricCriteriaByAssessment($as['id']);
                            if (empty($criteria)): 
                            ?>
                                <span class="text-muted d-block small"><em>Chưa thiết lập bộ tiêu chí chấm điểm chi tiết.</em></span>
                            <?php else: ?>
                                <table class="table table-sm table-bordered bg-white mb-0 table-theme" style="font-size: 0.85rem;">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Mô tả tiêu chí</th>
                                            <th>Chuẩn đầu ra (CLO)</th>
                                            <th>Điểm tối đa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($criteria as $cr): ?>
                                            <tr>
                                                <td class="px-2 py-2 text-secondary"><?= htmlspecialchars($cr['description']) ?></td>
                                                <td class="text-center px-2 py-2"><span class="badge badge-theme"><?= htmlspecialchars($cr['clo_code']) ?></span></td>
                                                <td class="text-center fw-bold text-dark px-2 py-2"><?= $cr['max_score'] ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <div class="col-md-6">
            <div class="card card-theme">
                <div class="card-header-theme">Thiết kế Rubric và Khớp nối Chuẩn đầu ra</div>
                <div class="card-body p-4">
                    <?php if (empty($assessments)): ?>
                        <div class="text-center text-muted py-5">Vui lòng khởi tạo cấu trúc điểm ở cột bên trái trước khi cấu hình tiêu chí Rubric.</div>
                    <?php elseif (empty($clos_step1)): ?>
                        <div class="alert alert-warning mb-0 border-start border-4 border-warning shadow-sm">
                            <strong>Lưu ý:</strong> Học phần này chưa có dữ liệu Chuẩn đầu ra (CLO) được khai báo tại Step 1. Vui lòng bổ sung dữ liệu CLO để thực hiện ánh xạ.
                        </div>
                    <?php else: ?>
                        <form action="index.php?subject_id=<?= $selected_subject_id ?>" method="POST">
                            <input type="hidden" name="action" value="add_criterion">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">Chọn thành phần đánh giá:</label>
                                <select name="assessment_id" class="form-select" required>
                                    <?php foreach ($assessments as $as): ?>
                                        <option value="<?= $as['id'] ?>"><?= htmlspecialchars($as['name']) ?> (<?= $as['weight'] ?>%)</option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-highlight">Ánh xạ chuẩn đầu ra môn học (CLO):</label>
                                <select name="clo_id" class="form-select fw-medium" required>
                                    <?php foreach ($clos_step1 as $clo): ?>
                                        <option value="<?= $clo['id'] ?>">
                                            <?= htmlspecialchars($clo['code']) ?> - <?= htmlspecialchars(substr($clo['description'], 0, 60)) ?>...
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">Mô tả nội dung tiêu chí đánh giá:</label>
                                <textarea name="description" class="form-control" rows="3" placeholder="Ví dụ: Tính chính xác của thuật toán, Cấu trúc báo cáo phân tích hệ thống..." required></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">Thang điểm tối đa:</label>
                                <input type="number" name="max_score" class="form-control" step="0.1" min="0.5" max="10" placeholder="Ví dụ: 2.5 hoặc 10" required>
                            </div>

                            <button type="submit" class="btn btn-theme w-100 py-2 fw-bold">Xác nhận thêm tiêu chí Rubric</button>
                        </form>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include '../includes/footer.php'; ?>