<?php 
// BẬT BÁO LỖI LÊN ĐỂ BẮT BUG
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once '../classes/database.php';
include '../includes/header.php'; 

// ... (code cũ giữ nguyên ở dưới) ...

$db = Database::getInstance();

// Xử lý bộ lọc chọn Chương trình & Môn học
$selected_program_id = $_GET['program_id'] ?? null;
$selected_subject_id = $_GET['subject_id'] ?? null;

$programs = $db->fetchAll("SELECT * FROM programs ORDER BY name ASC");

$plos = [];
$clos = [];
$existing_mappings = [];

if ($selected_program_id && $selected_subject_id) {
    // 1. Lấy tất cả PLO của Chương trình đang chọn
    $plos = $db->fetchAll("SELECT * FROM plos WHERE program_id = ? ORDER BY code ASC", [$selected_program_id]);
    
    // 2. Lấy tất cả CLO của Môn học đang chọn
    $clos = $db->fetchAll("SELECT * FROM clos WHERE subject_id = ? ORDER BY code ASC", [$selected_subject_id]);
    
    // 3. Lấy dữ liệu Mapping cũ (nếu có) để điền sẵn vào ô Input
    $mappings_raw = $db->fetchAll("
        SELECT clo_id, plo_id, weight 
        FROM clo_plo_mappings 
        WHERE clo_id IN (SELECT id FROM clos WHERE subject_id = ?)
    ", [$selected_subject_id]);
    
    // Chuyển mảng phẳng thành mảng 2 chiều: array[clo_id][plo_id] = %
    foreach ($mappings_raw as $m) {
        $existing_mappings[$m['clo_id']][$m['plo_id']] = $m['weight'];
    }
}
?>

<h2>Ma trận Ánh xạ CLO - PLO</h2>
<p class="text-muted">Nhập tỷ lệ % đóng góp của từng chuẩn đầu ra môn học (CLO) vào chuẩn đầu ra chương trình (PLO).</p>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>

<div class="card mb-4 shadow-sm">
    <div class="card-body bg-light">
        <form action="matrix.php" method="GET" class="row g-3">
            <div class="col-md-5">
                <select name="program_id" class="form-select" onchange="this.form.submit()" required>
                    <option value="">-- Bước 1: Chọn Chương trình Đào tạo --</option>
                    <?php foreach ($programs as $prog): ?>
                        <option value="<?php echo $prog['id']; ?>" <?php echo ($selected_program_id == $prog['id']) ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($prog['code'] . ' - ' . $prog['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            
            <?php if ($selected_program_id): 
                // Chỉ hiển thị các môn học thuộc chương trình đang chọn (Nhờ bảng mapping N-N)
                $subjects_of_program = $db->fetchAll("
                    SELECT s.* FROM subjects s 
                    JOIN subject_program_mapping spm ON s.id = spm.subject_id 
                    WHERE spm.program_id = ? ORDER BY s.code ASC
                ", [$selected_program_id]);
            ?>
            <div class="col-md-5">
                <select name="subject_id" class="form-select" onchange="this.form.submit()" required>
                    <option value="">-- Bước 2: Chọn Môn học --</option>
                    <?php foreach ($subjects_of_program as $sub): ?>
                        <option value="<?php echo $sub['id']; ?>" <?php echo ($selected_subject_id == $sub['id']) ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($sub['code'] . ' - ' . $sub['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <?php endif; ?>
        </form>
    </div>
</div>

<?php if ($selected_program_id && $selected_subject_id): ?>
    <?php if (empty($plos) || empty($clos)): ?>
        <div class="alert alert-warning">Vui lòng đảm bảo Môn học này đã có CLO và Chương trình này đã có PLO.</div>
    <?php else: ?>
        <form action="save_matrix.php" method="POST">
            <input type="hidden" name="program_id" value="<?php echo $selected_program_id; ?>">
            <input type="hidden" name="subject_id" value="<?php echo $selected_subject_id; ?>">
            
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead class="table-primary">
                        <tr>
                            <th class="align-middle" style="width: 120px;">CLO \ PLO</th>
                            <?php foreach ($plos as $plo): ?>
                                <th title="<?php echo htmlspecialchars($plo['description']); ?>">
                                    <?php echo htmlspecialchars($plo['code']); ?>
                                </th>
                            <?php endforeach; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($clos as $clo): ?>
                            <tr>
                                <td class="fw-bold bg-light" title="<?php echo htmlspecialchars($clo['description']); ?>">
                                    <?php echo htmlspecialchars($clo['code']); ?>
                                </td>
                                <?php foreach ($plos as $plo): 
                                    // Lấy giá trị % đã lưu (nếu có)
                                    $val = $existing_mappings[$clo['id']][$plo['id']] ?? '';
                                ?>
                                    <td>
                                        <input type="number" 
                                               name="mapping[<?php echo $clo['id']; ?>][<?php echo $plo['id']; ?>]" 
                                               class="form-control form-control-sm text-center" 
                                               value="<?php echo $val; ?>" 
                                               min="0" max="100" 
                                               placeholder="%">
                                    </td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-success px-5 fw-bold">💾 Lưu Ma Trận Ánh Xạ</button>
            </div>
        </form>
    <?php endif; ?>
<?php endif; ?>

<?php include '../includes/footer.php'; ?>