<?php
include '../includes/header.php';
require_once '../classes/AssessmentController.php';

$assessmentCtrl      = new AssessmentController();
$subjects            = $assessmentCtrl->getAllSubjects();
$selected_subject_id = isset($_GET['subject_id'])
    ? intval($_GET['subject_id'])
    : ($subjects[0]['id'] ?? 0);

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name   = trim($_POST['name']);
    $weight = floatval($_POST['weight']);

    // ── BUSINESS RULE 1: Không trùng tên trong cùng 1 môn ──────────────────
    $existing = $assessmentCtrl->getAssessmentsBySubject($selected_subject_id);
    foreach ($existing as $ex) {
        if (strtolower($ex['name']) === strtolower($name)) {
            $error = "Thành phần đánh giá \"$name\" đã tồn tại trong môn học này. Không thể tạo trùng lặp.";
            break;
        }
    }

    // ── BUSINESS RULE 2: Tổng trọng số không vượt quá 100% ─────────────────
    if (!$error) {
        $totalWeight = array_sum(array_column($existing, 'weight'));
        if ($totalWeight + $weight > 100) {
            $remaining = 100 - $totalWeight;
            $error = "Tổng trọng số hiện tại là {$totalWeight}%. "
                   . "Chỉ còn có thể thêm tối đa {$remaining}% — bạn đang nhập {$weight}%.";
        }
    }

    if (!$error) {
        try {
            $assessmentCtrl->createAssessment($selected_subject_id, $name, $weight);
            header("Location: index.php?subject_id={$selected_subject_id}&success=1");
            exit();
        } catch (Exception $e) {
            $error = $e->getMessage();
        }
    }
}

// Tính tổng trọng số hiện tại để hiển thị gợi ý
$existing    = $assessmentCtrl->getAssessmentsBySubject($selected_subject_id);
$totalWeight = array_sum(array_column($existing, 'weight'));
$remaining   = 100 - $totalWeight;
?>

<style>
    :root { --system-blue:#0f172a; --theme-primary:#1e40af; --border-smooth:#cbd5e1; }
    body { background-color:#f8fafc; color:#1e293b; }
    .page-header { color:var(--system-blue); font-weight:700; border-bottom:2px solid #e2e8f0; padding-bottom:10px; }
    .card-theme { border:1px solid #e2e8f0 !important; box-shadow:0 4px 6px -1px rgba(0,0,0,.05) !important; border-radius:8px !important; }
    .card-header-theme { background-color:var(--system-blue) !important; color:#fff !important; font-weight:600; padding:14px 20px; border-radius:8px 8px 0 0 !important; }
    .btn-theme { background-color:var(--system-blue) !important; border-color:var(--system-blue) !important; color:#fff !important; font-weight:500; border-radius:6px; transition:all .2s; }
    .btn-theme:hover { opacity:.9; transform:translateY(-1px); }
    .form-select, .form-control { border:1px solid var(--border-smooth); border-radius:6px; padding:10px; }
    .form-select:focus, .form-control:focus { border-color:var(--theme-primary); box-shadow:0 0 0 3px rgba(30,64,175,.15); }
    .weight-bar-wrap { background:#e2e8f0; border-radius:20px; height:10px; margin-top:6px; }
    .weight-bar-fill { background:var(--theme-primary); border-radius:20px; height:10px; transition:width .3s; }
    .weight-bar-fill.danger { background:#dc2626; }
</style>

<div class="container py-4">
    <h3 class="mb-4 page-header">Thêm thành phần đánh giá mới</h3>

    <?php if ($error): ?>
        <div class="alert alert-danger border-start border-4 border-danger shadow-sm mb-4">
            <strong>Không thể thêm:</strong> <?= htmlspecialchars($error) ?>
        </div>
    <?php endif; ?>

    <div class="row justify-content-center">
        <div class="col-md-6">

            <!-- Thanh trọng số hiện tại -->
            <div class="card card-theme mb-4">
                <div class="card-body py-3">
                    <div class="d-flex justify-content-between mb-1">
                        <span class="fw-bold text-secondary" style="font-size:.85rem">
                            Tổng trọng số đã dùng
                        </span>
                        <span class="fw-bold <?= $totalWeight >= 100 ? 'text-danger' : 'text-dark' ?>">
                            <?= $totalWeight ?>% / 100%
                        </span>
                    </div>
                    <div class="weight-bar-wrap">
                        <div class="weight-bar-fill <?= $totalWeight >= 100 ? 'danger' : '' ?>"
                             style="width:<?= min($totalWeight, 100) ?>%"></div>
                    </div>
                    <small class="text-muted mt-1 d-block">
                        <?php if ($totalWeight >= 100): ?>
                            <span class="text-danger fw-bold">Đã đạt 100% — không thể thêm thành phần mới.</span>
                        <?php else: ?>
                            Còn lại có thể thêm: <strong><?= $remaining ?>%</strong>
                        <?php endif; ?>
                    </small>
                </div>
            </div>

            <div class="card card-theme">
                <div class="card-header-theme">Thông tin thành phần đánh giá</div>
                <div class="card-body p-4">
                    <form method="POST" action="create.php?subject_id=<?= $selected_subject_id ?>">

                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary">Tên thành phần:</label>
                            <select name="name" class="form-select" required
                                    <?= $totalWeight >= 100 ? 'disabled' : '' ?>>
                                <option value="Chuyên cần">Chuyên cần</option>
                                <option value="Thi giữa kỳ">Thi giữa kỳ</option>
                                <option value="Thi cuối kỳ">Thi cuối kỳ</option>
                                <option value="Bài tập lớn">Bài tập lớn</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold text-secondary">
                                Trọng số (%):
                                <span class="text-muted fw-normal">(tối đa còn <?= $remaining ?>%)</span>
                            </label>
                            <input type="number" name="weight" class="form-control"
                                   step="0.5" min="1" max="<?= $remaining ?>"
                                   placeholder="Nhập số phần trăm" required
                                   <?= $totalWeight >= 100 ? 'disabled' : '' ?>>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-theme flex-grow-1 py-2"
                                    <?= $totalWeight >= 100 ? 'disabled' : '' ?>>
                                Lưu thành phần đánh giá
                            </button>
                            <a href="index.php?subject_id=<?= $selected_subject_id ?>"
                               class="btn btn-outline-secondary py-2">Hủy</a>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<?php include '../includes/footer.php'; ?>
