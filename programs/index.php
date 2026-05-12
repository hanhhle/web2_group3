<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY id DESC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Quản lý Chương trình Đào tạo</h2>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">Thêm Chương trình mới</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-4">
                <input type="text" name="name" class="form-control" placeholder="Tên chương trình (VD: Kỹ thuật Phần mềm)" required>
            </div>
            <div class="col-md-2">
                <input type="text" name="code" class="form-control" placeholder="Mã (VD: SE)" required>
            </div>
            <div class="col-md-4">
                <input type="text" name="description" class="form-control" placeholder="Mô tả chi tiết...">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Thêm mới</button>
            </div>
        </form>
    </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Mã (Code)</th>
                <th>Tên Chương trình</th>
                <th>Mô tả</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($programs as $row): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['id']); ?></td>
                <td><span class="badge bg-secondary"><?php echo htmlspecialchars($row['code']); ?></span></td>
                <td><?php echo htmlspecialchars($row['name']); ?></td>
                <td><?php echo htmlspecialchars($row['description']); ?></td>
                <td>
                    <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Sửa</a>
                    <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Bạn có chắc chắn muốn xóa? Toàn bộ PLO và Môn học liên quan sẽ bị xóa theo!');">
                        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                        <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<?php include '../includes/footer.php'; ?>