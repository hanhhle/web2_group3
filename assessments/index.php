<?php
include '../includes/header.php';
require_once '../classes/AssessmentController.php';

$assessmentCtrl      = new AssessmentController();
$subjects            = $assessmentCtrl->getAllSubjects();
$selected_subject_id = isset($_GET['subject_id'])
    ? intval($_GET['subject_id'])
    : ($subjects[0]['id'] ?? 0);

$assessments = $assessmentCtrl->getAssessmentsBySubject($selected_subject_id);

$successMsg = '';
if (isset($_GET['success'])) $successMsg = "Thêm thành phần đánh giá thành công.";
if (isset($_GET['deleted'])) $successMsg = "Đã xoá thành phần đánh giá.";
?>

<style>
    :root { --system-blue:#0f172a; --theme-primary:#1e40af; --border-smooth:#cbd5e1; }
    body { background-color:#f8fafc; color:#1e293b; }
    .page-header { color:var(--system-blue); font-weight:700; border-bottom:2px solid #e2e8f0; padding-bottom:10px; }
    .card-theme { border:1px solid #e2e8f0 !important; box-shadow:0 4px 6px -1px rgba(0,0,0,.05) !important; border-radius:8px !important; }
    .card-header-theme { background-color:var(--system-blue) !important; color:#fff !important; font-weight:600; padding:14px 20px; border-radius:8px 8px 0 0 !important; }
    .btn-theme { background-color:var(--system-blue) !important; border-color:var(--system-blue) !important; color:#fff !important; font-weight:500; border-radius:6px; transition:all .2s; }
    .btn-theme:hover { opacity:.9; transform:translateY(-1px); }
    .form-select { border:1px solid var(--border-smooth); border-radius:6px; padding:10px; }
    .form-select:focus { border-color:var(--theme-primary); box-shadow:0 0 0 3px rgba(30,64,175,.15); }
    .badge-theme { background-color:rgba(15,23,42,.08) !important; color:var(--system-blue) !important; font-weight:600; border:1px solid rgba(15,23,42,.15); padding:6px 10px; }
    .table-theme thead th { background-color:#f1f5f9 !important; color:var(--system-blue); font-weight:600; text-transform:uppercase; font-size:.75rem; letter-spacing:.5px; border-bottom:2px solid #cbd5e1; }
    .assessment-block { border-left:4px solid var(--system-blue) !important; border-radius:6px; background:#fff; }
    .text-highlight { color:var(--system-blue); font-weight:600; }
    /* Badge trạng thái rubric */
    .badge-rubric-full    { background:#dcfce7; color:#166534; border:1px solid #bbf7d0; padding:3px 9px; border-radius:20px; font-size:11px; font-weight:600; }
    .badge-rubric-partial { background:#fef9c3; color:#854d0e; border:1px solid #fde68a; padding:3px 9px; border-radius:20px; font-size:11px; font-weight:600; }
    /* Badge có điểm trong ledger */
    .badge-locked { background:#fee2e2; color:#991b1b; border:1px solid #fecaca; padding:3px 9px; border-radius:20px; font-size:11px; font-weight:600; }
</style>

<div class="container py-4">
    <h3 class="mb-4 page-header">Cấu trúc Đánh giá và Thiết kế Rubric</h3>

    <!-- Chọn học phần -->
    <div class="card card-theme mb-4">
        <div class="card-body py-3">
            <label class="form-label fw-bold text-secondary mb-2">Học phần cấu hình hệ thống:</label>
            <form method="GET" action="index.php" id="subjectForm">
                <select name="subject_id" class="form-select"
                        onchange="document.getElementById('subjectForm').submit()">
                    <?php foreach ($subjects as $sj): ?>
                        <option value="<?= $sj['id'] ?>"
                            <?= $sj['id'] == $selected_subject_id ? 'selected' : '' ?>>
                            <?= htmlspecialchars($sj['code'] . ' - ' . $sj['name']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </form>
        </div>
    </div>

    <?php if ($successMsg): ?>
        <div class="alert alert-success border-0 shadow-sm mb-4"><?= $successMsg ?></div>
    <?php endif; ?>

    <!-- Nút hành động -->
    <div class="d-flex gap-2 mb-4">
        <a href="create.php?subject_id=<?= $selected_subject_id ?>" class="btn btn-theme">
            + Thêm thành phần đánh giá
        </a>
        <a href="rubric_builder.php?subject_id=<?= $selected_subject_id ?>"
           class="btn btn-outline-secondary">
            Thiết kế Rubric
        </a>
    </div>

    <!-- Danh sách assessments -->
    <?php if (empty($assessments)): ?>
        <div class="alert alert-light border text-center text-muted">
            Học phần chưa được thiết lập cấu trúc điểm.
        </div>
    <?php else: ?>
        <?php foreach ($assessments as $as):
            $criteria   = $assessmentCtrl->getRubricCriteriaByAssessment($as['id']);
            $usedScore  = array_sum(array_column($criteria, 'max_score'));
            $isFull     = abs(floatval($as['weight']) - $usedScore) < 0.01;
            $hasScores  = $assessmentCtrl->assessmentHasScores($as['id']);
        ?>
            <div class="card mb-3 assessment-block shadow-sm border border-start-0">
                <div class="card-body d-flex justify-content-between align-items-center py-3">
                    <div>
                        <h6 class="card-title mb-1 fw-bold text-highlight d-flex align-items-center gap-2">
                            <?= htmlspecialchars($as['name']) ?>
                            <!-- Badge trạng thái rubric -->
                            <?php if ($isFull): ?>
                                <span class="badge-rubric-full">✓ Rubric đủ điểm</span>
                            <?php else: ?>
                                <span class="badge-rubric-partial">
                                    Rubric: <?= $usedScore ?>/<?= $as['weight'] ?> điểm
                                </span>
                            <?php endif; ?>
                            <!-- Badge khoá ledger -->
                            <?php if ($hasScores): ?>
                                <span class="badge-locked">🔒 Đã có điểm</span>
                            <?php endif; ?>
                        </h6>
                        <small class="text-muted">
                            Trọng số: <strong class="text-dark"><?= $as['weight'] ?>%</strong>
                        </small>
                    </div>

                    <?php if ($hasScores): ?>
                        <!-- Đã có điểm → disable nút xoá, hiện tooltip -->
                        <button class="btn btn-sm btn-outline-danger px-3 disabled"
                                title="Không thể xoá: đã có điểm trong Sổ cái"
                                disabled>
                            🔒 Khoá
                        </button>
                    <?php else: ?>
                        <a href="delete.php?id=<?= $as['id'] ?>&subject_id=<?= $selected_subject_id ?>"
                           class="btn btn-sm btn-outline-danger px-3"
                           onclick="return confirm('Xóa sẽ loại bỏ toàn bộ tiêu chí rubric liên quan?')">
                            Xóa
                        </a>
                    <?php endif; ?>
                </div>

                <!-- Bảng criteria -->
                <div class="card-footer bg-white p-3 border-top border-light">
                    <span class="text-secondary fw-bold d-block mb-2"
                          style="font-size:.8rem;text-transform:uppercase;letter-spacing:.3px;">
                        Tiêu chí đánh giá chi tiết:
                    </span>
                    <?php if (empty($criteria)): ?>
                        <span class="text-muted small">
                            <em>Chưa thiết lập bộ tiêu chí chấm điểm.
                            <a href="rubric_builder.php?subject_id=<?= $selected_subject_id ?>">Thiết kế ngay</a></em>
                        </span>
                    <?php else: ?>
                        <table class="table table-sm table-bordered bg-white mb-0 table-theme"
                               style="font-size:.85rem;">
                            <thead>
                                <tr class="text-center">
                                    <th>Mô tả tiêu chí</th>
                                    <th>CLO</th>
                                    <th>Điểm tối đa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($criteria as $cr): ?>
                                    <tr>
                                        <td class="px-2 py-2 text-secondary">
                                            <?= htmlspecialchars($cr['description']) ?>
                                        </td>
                                        <td class="text-center px-2 py-2">
                                            <span class="badge badge-theme">
                                                <?= htmlspecialchars($cr['clo_code']) ?>
                                            </span>
                                        </td>
                                        <td class="text-center fw-bold text-dark px-2 py-2">
                                            <?= $cr['max_score'] ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr class="table-light">
                                    <td colspan="2" class="text-end fw-bold text-secondary px-2 py-2">
                                        Tổng:
                                    </td>
                                    <td class="text-center fw-bold px-2 py-2
                                        <?= $isFull ? 'text-success' : 'text-warning' ?>">
                                        <?= $usedScore ?> / <?= $as['weight'] ?>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    <?php endif; ?>
                </div>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

<?php include '../includes/footer.php'; ?>
