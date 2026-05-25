<?php
include '../includes/header.php';
require_once '../classes/AssessmentController.php';

$assessmentCtrl      = new AssessmentController();
$subjects            = $assessmentCtrl->getAllSubjects();
$selected_subject_id = isset($_GET['subject_id'])
    ? intval($_GET['subject_id'])
    : ($subjects[0]['id'] ?? 0);

$message = '';
$error   = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $assessment_id = intval($_POST['assessment_id']);
    $clo_id        = intval($_POST['clo_id']);
    $description   = trim($_POST['description']);
    $max_score     = floatval($_POST['max_score']);

    // Lấy thông tin assessment được chọn
    $allAssessments  = $assessmentCtrl->getAssessmentsBySubject($selected_subject_id);
    $selectedAssess  = null;
    foreach ($allAssessments as $a) {
        if ($a['id'] === $assessment_id) { $selectedAssess = $a; break; }
    }

    if ($selectedAssess) {
        $assessWeight    = floatval($selectedAssess['weight']); // VD: 30 (%)
        $existCriteria   = $assessmentCtrl->getRubricCriteriaByAssessment($assessment_id);
        $usedScore       = array_sum(array_column($existCriteria, 'max_score'));
        $remainingScore  = $assessWeight - $usedScore;

        // ── BUSINESS RULE: Tổng max_score phải bằng đúng weight% của assessment ──
        if ($max_score > $remainingScore) {
            $error = "Tổng điểm tiêu chí của \"{$selectedAssess['name']}\" "
                   . "phải bằng đúng {$assessWeight} điểm (= trọng số {$assessWeight}%). "
                   . "Đã dùng: {$usedScore} — còn lại tối đa: {$remainingScore}.";
        }
    }

    if (!$error) {
        try {
            $assessmentCtrl->createCriterion($assessment_id, $clo_id, $description, $max_score);
            $message = "Thiết lập tiêu chí đánh giá và ánh xạ chuẩn đầu ra thành công.";
        } catch (Exception $e) {
            $error = $e->getMessage();
        }
    }
}

$assessments = $assessmentCtrl->getAssessmentsBySubject($selected_subject_id);
$clos        = $assessmentCtrl->getCLOsBySubject($selected_subject_id);

// Tính điểm đã dùng cho từng assessment để hiển thị trạng thái
$criteriaStats = [];
foreach ($assessments as $a) {
    $criteria = $assessmentCtrl->getRubricCriteriaByAssessment($a['id']);
    $used     = array_sum(array_column($criteria, 'max_score'));
    $criteriaStats[$a['id']] = [
        'used'      => $used,
        'max'       => floatval($a['weight']),
        'remaining' => floatval($a['weight']) - $used,
        'full'      => abs(floatval($a['weight']) - $used) < 0.01,
    ];
}
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
    .text-highlight { color:var(--system-blue); font-weight:600; }
    .score-bar-wrap { background:#e2e8f0; border-radius:20px; height:8px; margin-top:4px; }
    .score-bar-fill { background:var(--theme-primary); border-radius:20px; height:8px; transition:width .3s; }
    .score-bar-fill.full { background:#16a34a; }
    .badge-full { background:#dcfce7; color:#166534; border:1px solid #bbf7d0; padding:3px 8px; border-radius:20px; font-size:11px; font-weight:600; }
    .badge-partial { background:#fef9c3; color:#854d0e; border:1px solid #fde68a; padding:3px 8px; border-radius:20px; font-size:11px; font-weight:600; }
</style>

<div class="container py-4">
    <h3 class="mb-4 page-header">Thiết kế Rubric và Khớp nối Chuẩn đầu ra</h3>

    <!-- Chọn học phần -->
    <div class="card card-theme mb-4">
        <div class="card-body py-3">
            <label class="form-label fw-bold text-secondary mb-2">Học phần:</label>
            <form method="GET" action="rubric_builder.php" id="subjectForm">
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

    <?php if ($message): ?>
        <div class="alert alert-success border-0 shadow-sm mb-4"><?= $message ?></div>
    <?php endif; ?>
    <?php if ($error): ?>
        <div class="alert alert-danger border-start border-4 border-danger shadow-sm mb-4">
            <strong>Không thể thêm tiêu chí:</strong> <?= htmlspecialchars($error) ?>
        </div>
    <?php endif; ?>

    <div class="row g-4">
        <!-- Cột trái: trạng thái điểm từng assessment -->
        <div class="col-md-5">
            <h6 class="fw-bold text-secondary mb-3" style="text-transform:uppercase;font-size:.8rem;letter-spacing:.5px;">
                Trạng thái phân bổ điểm
            </h6>
            <?php foreach ($assessments as $a):
                $stat = $criteriaStats[$a['id']];
                $pct  = $stat['max'] > 0 ? min(($stat['used'] / $stat['max']) * 100, 100) : 0;
            ?>
            <div class="card card-theme mb-3 p-3">
                <div class="d-flex justify-content-between align-items-center mb-1">
                    <span class="fw-bold" style="font-size:.9rem">
                        <?= htmlspecialchars($a['name']) ?>
                    </span>
                    <?php if ($stat['full']): ?>
                        <span class="badge-full">✓ Đủ <?= $stat['max'] ?> điểm</span>
                    <?php else: ?>
                        <span class="badge-partial">Còn <?= $stat['remaining'] ?> điểm</span>
                    <?php endif; ?>
                </div>
                <div class="score-bar-wrap">
                    <div class="score-bar-fill <?= $stat['full'] ? 'full' : '' ?>"
                         style="width:<?= $pct ?>%"></div>
                </div>
                <small class="text-muted mt-1 d-block">
                    Đã phân bổ: <strong><?= $stat['used'] ?></strong> /
                    <strong><?= $stat['max'] ?></strong> điểm
                    (trọng số <?= $a['weight'] ?>%)
                </small>
            </div>
            <?php endforeach; ?>
        </div>

        <!-- Cột phải: form thêm criterion -->
        <div class="col-md-7">
            <div class="card card-theme">
                <div class="card-header-theme">Thêm tiêu chí Rubric</div>
                <div class="card-body p-4">

                    <?php if (empty($assessments)): ?>
                        <div class="text-center text-muted py-4">
                            Vui lòng
                            <a href="create.php?subject_id=<?= $selected_subject_id ?>">tạo thành phần đánh giá</a>
                            trước.
                        </div>

                    <?php elseif (empty($clos)): ?>
                        <div class="alert alert-warning border-start border-4 border-warning mb-0">
                            <strong>Lưu ý:</strong> Học phần chưa có CLO.
                            Vui lòng bổ sung tại
                            <a href="../clos/index.php?subject_id=<?= $selected_subject_id ?>">Step 1 - CLO</a>.
                        </div>

                    <?php else: ?>
                        <form method="POST"
                              action="rubric_builder.php?subject_id=<?= $selected_subject_id ?>"
                              id="rubricForm">

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">
                                    Thành phần đánh giá:
                                </label>
                                <select name="assessment_id" id="assessmentSelect"
                                        class="form-select" required
                                        onchange="updateRemainingScore(this)">
                                    <?php foreach ($assessments as $a):
                                        $stat = $criteriaStats[$a['id']];
                                    ?>
                                        <option value="<?= $a['id'] ?>"
                                                data-remaining="<?= $stat['remaining'] ?>"
                                                data-max="<?= $stat['max'] ?>"
                                                <?= $stat['full'] ? 'data-full="1"' : '' ?>>
                                            <?= htmlspecialchars($a['name']) ?>
                                            (<?= $a['weight'] ?>%)
                                            <?= $stat['full'] ? '— ✓ Đã đủ điểm' : "— còn {$stat['remaining']} điểm" ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                                <small id="scoreHint" class="text-muted mt-1 d-block"></small>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-highlight">
                                    Ánh xạ CLO:
                                </label>
                                <select name="clo_id" class="form-select" required>
                                    <?php foreach ($clos as $clo): ?>
                                        <option value="<?= $clo['id'] ?>">
                                            <?= htmlspecialchars($clo['code']) ?> —
                                            <?= htmlspecialchars(substr($clo['description'], 0, 55)) ?>...
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold text-secondary">
                                    Mô tả tiêu chí:
                                </label>
                                <textarea name="description" class="form-control" rows="3"
                                          placeholder="Ví dụ: Tính chính xác của thuật toán..."
                                          required></textarea>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold text-secondary">
                                    Điểm tối đa:
                                </label>
                                <input type="number" name="max_score" id="maxScoreInput"
                                       class="form-control" step="0.5" min="0.5"
                                       placeholder="Tối đa còn lại: ..." required>
                                <small class="text-muted">
                                    Tổng điểm các tiêu chí phải bằng đúng trọng số (%) của thành phần.
                                </small>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-theme flex-grow-1 py-2 fw-bold">
                                    Xác nhận thêm tiêu chí
                                </button>
                                <a href="index.php?subject_id=<?= $selected_subject_id ?>"
                                   class="btn btn-outline-secondary py-2">Quay lại</a>
                            </div>
                        </form>

                        <script>
                        function updateRemainingScore(sel) {
                            const opt       = sel.options[sel.selectedIndex];
                            const remaining = parseFloat(opt.dataset.remaining || 0);
                            const max       = parseFloat(opt.dataset.max || 0);
                            const isFull    = opt.dataset.full === '1';
                            const hint      = document.getElementById('scoreHint');
                            const input     = document.getElementById('maxScoreInput');

                            if (isFull) {
                                hint.innerHTML  = '<span class="text-success fw-bold">✓ Thành phần này đã đủ điểm, không cần thêm tiêu chí.</span>';
                                input.max       = 0;
                                input.disabled  = true;
                            } else {
                                hint.innerHTML  = `Còn có thể thêm tối đa <strong>${remaining}</strong> / ${max} điểm.`;
                                input.max       = remaining;
                                input.disabled  = false;
                                input.placeholder = `Tối đa: ${remaining}`;
                            }
                        }
                        // Chạy ngay khi load
                        window.addEventListener('DOMContentLoaded', () => {
                            updateRemainingScore(document.getElementById('assessmentSelect'));
                        });
                        </script>
                    <?php endif; ?>

                </div>
            </div>
        </div>
    </div>
</div>

<?php include '../includes/footer.php'; ?>
