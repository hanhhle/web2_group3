<?php
require_once '../classes/database.php';
include '../includes/header.php';

$db = Database::getInstance();

// XỬ LÝ LƯU DỮ LIỆU (POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)$_POST['id'];
    $program_id = (int)$_POST['program_id'];
    $code = strtoupper(trim($_POST['code']));
    $description = trim($_POST['description']);

    try {
        $sql = "UPDATE plos SET program_id=?, code=?, description=? WHERE id=?";
        $db->query($sql, [$program_id, $code, $description, $id]);
        $_SESSION['msg'] = "Cập nhật PLO thành công!";
        header("Location: index.php");
        exit;
    } catch (PDOException $e) {
        $_SESSION['error'] = "Lỗi cập nhật: " . $e->getMessage();
        header("Location: index.php");
        exit;
    }
}

// HIỂN THỊ FORM (GET)
$id = $_GET['id'] ?? null;
if (!$id) { header("Location: index.php"); exit; }

$plo = $db->query("SELECT * FROM plos WHERE id = ?", [$id])->fetch(PDO::FETCH_ASSOC);
if (!$plo) { header("Location: index.php"); exit; }

$programs = $db->fetchAll("SELECT * FROM programs ORDER BY name ASC");
?>

<h2>Sửa Chuẩn đầu ra (PLO)</h2>
<div class="card mt-3">
    <div class="card-body">
        <form action="edit.php" method="POST">
            <input type="hidden" name="id" value="<?php echo $plo['id']; ?>">
            
            <div class="mb-3">
                <label>Thuộc Chương trình</label>
                <select name="program_id" class="form-select" required>
                    <?php foreach ($programs as $prog): ?>
                        <option value="<?php echo $prog['id']; ?>" <?php echo ($prog['id'] == $plo['program_id']) ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($prog['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="mb-3">
                <label>Mã PLO</label>
                <input type="text" name="code" class="form-control" value="<?php echo htmlspecialchars($plo['code']); ?>" required>
            </div>
            <div class="mb-3">
                <label>Mô tả chi tiết</label>
                <input type="text" name="description" class="form-control" value="<?php echo htmlspecialchars($plo['description']); ?>" required>
            </div>
            <button type="submit" class="btn btn-success">Lưu thay đổi</button>
            <a href="index.php" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</div>
<?php include '../includes/footer.php'; ?>