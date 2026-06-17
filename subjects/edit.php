<?php
require_once '../classes/database.php';
include '../includes/header.php';

$db = Database::getInstance();

// XỬ LÝ LƯU DỮ LIỆU (POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)$_POST['id'];
    $code = strtoupper(trim($_POST['code']));
    $name = trim($_POST['name']);
    $credits = (int)$_POST['credits'];
    $program_ids = $_POST['program_ids'] ?? [];

    if (empty($code) || empty($name) || empty($program_ids)) {
        $_SESSION['error'] = "Please fill all required fields and select at least one program!";
        header("Location: edit.php?id=$id");
        exit;
    }

    try {
        // Bước 1: Cập nhật thông tin cơ bản của môn học
        $db->query("UPDATE subjects SET code=?, name=?, credits=? WHERE id=?", [$code, $name, $credits, $id]);

        // Bước 2: Xóa toàn bộ mapping cũ của môn học này
        $db->query("DELETE FROM subject_program_mapping WHERE subject_id = ?", [$id]);

        // Bước 3: Chèn lại các mapping mới dựa trên các checkbox đã chọn
        $sql_mapping = "INSERT INTO subject_program_mapping (subject_id, program_id) VALUES (?, ?)";
        foreach ($program_ids as $p_id) {
            $db->query($sql_mapping, [$id, (int)$p_id]);
        }

        $_SESSION['msg'] = "Subject updated successfully!";
        header("Location: index.php");
        exit;
    } catch (PDOException $e) {
        $_SESSION['error'] = "Update Error: " . $e->getMessage();
        header("Location: edit.php?id=$id");
        exit;
    }
}

// LẤY DỮ LIỆU ĐỂ HIỂN THỊ (GET)
$id = $_GET['id'] ?? null;
if (!$id) { header("Location: index.php"); exit; }

// Lấy thông tin môn học
$subject = $db->query("SELECT * FROM subjects WHERE id = ?", [$id])->fetch(PDO::FETCH_ASSOC);
if (!$subject) { header("Location: index.php"); exit; }

// Lấy danh sách ID các ngành mà môn học này đang thuộc về
$current_mappings = $db->fetchAll("SELECT program_id FROM subject_program_mapping WHERE subject_id = ?", [$id]);
$mapped_ids = array_column($current_mappings, 'program_id');

// Lấy danh sách tất cả các ngành để hiển thị checkbox
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY name ASC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Edit Subject</h2>
</div>

<div class="card shadow-sm">
    <div class="card-body">
        <form action="edit.php" method="POST">
            <input type="hidden" name="id" value="<?php echo $subject['id']; ?>">
            
            <div class="row g-3">
                <div class="col-md-3">
                    <label class="form-label fw-bold">Subject Code</label>
                    <input type="text" name="code" class="form-control" value="<?php echo htmlspecialchars($subject['code']); ?>" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">Subject Name</label>
                    <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($subject['name']); ?>" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold">Credits</label>
                    <input type="number" name="credits" class="form-control" value="<?php echo htmlspecialchars($subject['credits']); ?>" min="1" required>
                </div>

                <div class="col-12 mt-4">
                    <label class="form-label fw-bold">Applicable Programs:</label>
                    <div class="row border p-3 rounded bg-light mx-0" style="max-height: 300px; overflow-y: auto;">
                        <?php foreach ($programs as $prog): ?>
                            <div class="col-md-4 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="program_ids[]" 
                                           value="<?php echo $prog['id']; ?>" 
                                           id="prog_<?php echo $prog['id']; ?>"
                                           <?php echo in_array($prog['id'], $mapped_ids) ? 'checked' : ''; ?>>
                                    <label class="form-check-label" for="prog_<?php echo $prog['id']; ?>">
                                        <?php echo htmlspecialchars($prog['code'] . ' - ' . $prog['name']); ?>
                                    </label>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="col-12 text-end mt-4">
                    <hr>
                    <a href="index.php" class="btn btn-secondary px-4 me-2">Cancel</a>
                    <button type="submit" class="btn btn-success px-4">Save Changes</button>
                </div>
            </div>
        </form>
    </div>
</div>

<?php include '../includes/footer.php'; ?>