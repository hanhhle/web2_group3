<?php
include '../includes/header.php';
require_once '../classes/AssessmentController.php';

$assessmentCtrl = new AssessmentController();
$id             = isset($_GET['id'])         ? intval($_GET['id'])         : 0;
$subject_id     = isset($_GET['subject_id']) ? intval($_GET['subject_id']) : 0;

$error = '';

if ($id > 0) {
    // ── BUSINESS RULE: Không xoá nếu đã có điểm trong score_ledger ─────────
    $hasScores = $assessmentCtrl->assessmentHasScores($id);

    if ($hasScores) {
        // Lấy tên assessment để hiển thị thông báo rõ ràng
        $assessmentName = $assessmentCtrl->getAssessmentNameById($id);
        $error = "Không thể xoá thành phần đánh giá \"$assessmentName\" "
               . "vì đã có dữ liệu điểm được ghi nhận trong Sổ cái (Score Ledger). "
               . "Xoá sẽ phá vỡ chuỗi hash toàn vẹn dữ liệu.";
    } else {
        $assessmentCtrl->deleteAssessment($id);
        header("Location: index.php?subject_id={$subject_id}&deleted=1");
        exit();
    }
}
?>

<style>
    :root { --system-blue:#0f172a; }
    body { background-color:#f8fafc; color:#1e293b; }
    .page-header { color:var(--system-blue); font-weight:700; border-bottom:2px solid #e2e8f0; padding-bottom:10px; }
</style>

<div class="container py-4">
    <h3 class="mb-4 page-header">Xoá thành phần đánh giá</h3>

    <?php if ($error): ?>
        <div class="alert alert-danger border-start border-4 border-danger shadow-sm">
            <div class="d-flex align-items-start gap-3">
                <span style="font-size:1.5rem">🔒</span>
                <div>
                    <strong class="d-block mb-1">Không thể thực hiện thao tác xoá</strong>
                    <?= htmlspecialchars($error) ?>
                    <div class="mt-3">
                        <a href="index.php?subject_id=<?= $subject_id ?>"
                           class="btn btn-sm btn-outline-secondary">
                            ← Quay lại danh sách
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php include '../includes/footer.php'; ?>
