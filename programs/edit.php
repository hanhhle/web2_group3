<?php
require_once '../classes/database.php';
include '../includes/header.php';

$db = Database::getInstance();

// NẾU LÀ METHOD POST -> Xử lý cập nhật dữ liệu
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)$_POST['id'];
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);

    try {
        // BUSINESS RULE: KHÔNG cập nhật cột 'code', chỉ cập nhật name và description
        $sql = "UPDATE programs SET name = ?, description = ? WHERE id = ?";
        $db->query($sql, [$name, $description, $id]);

        $_SESSION['msg'] = "Program updated successfully!";
        header("Location: index.php");
        exit;
    } catch (PDOException $e) {
        $_SESSION['error'] = "Update error: " . $e->getMessage();
        header("Location: index.php");
        exit;
    }
}

// NẾU LÀ METHOD GET -> Lấy dữ liệu cũ hiển thị ra form
$id = $_GET['id'] ?? null;
if (!$id) {
    header("Location: index.php");
    exit;
}

$stmt = $db->query("SELECT * FROM programs WHERE id = ?", [$id]);
$program = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$program) {
    $_SESSION['error'] = "Program not found!";
    header("Location: index.php");
    exit;
}
?>

<h2>Edit Program</h2>
<div class="card mt-3">
    <div class="card-body">
        <form action="edit.php" method="POST">
            <input type="hidden" name="id" value="<?php echo $program['id']; ?>">
            
            <div class="mb-3">
                <label class="form-label">Program Code <span class="text-danger">*</span></label>
                <input type="text" class="form-control bg-light" value="<?php echo htmlspecialchars($program['code']); ?>" readonly title="Program code is immutable and cannot be changed.">
                <small class="text-muted">For ledger integrity, the program identifier cannot be modified.</small>
            </div>

            <div class="mb-3">
                <label class="form-label">Program Name</label>
                <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($program['name']); ?>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control"><?php echo htmlspecialchars($program['description']); ?></textarea>
            </div>

            <button type="submit" class="btn btn-success">Save changes</button>
            <a href="index.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

<?php include '../includes/footer.php'; ?>