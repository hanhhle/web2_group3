<?php 
require_once '../classes/database.php';
include '../includes/header.php'; // Đã bao gồm session_start() [cite: 150, 268]

$db = Database::getInstance(); // Singleton Pattern [cite: 251]
$users = $db->fetchAll("SELECT * FROM users ORDER BY id DESC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Quản lý Người dùng (Users)</h2>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">Tạo tài khoản mới</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-2">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="col-md-3">
                <input type="text" name="full_name" class="form-control" placeholder="Họ và Tên" required>
            </div>
            <div class="col-md-3">
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="col-md-2">
                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
            <div class="col-md-2">
                <select name="role" class="form-select" required>
                    <option value="student">Sinh viên</option>
                    <option value="lecturer">Giảng viên</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <div class="col-md-12 text-end">
                <button type="submit" class="btn btn-primary">Lưu tài khoản</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Username</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>Vai trò</th>
            <th style="width: 150px;">Hành động</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($users as $row): ?>
        <tr>
            <td><?php echo htmlspecialchars($row['username']); ?></td>
            <td><?php echo htmlspecialchars($row['full_name']); ?></td>
            <td><?php echo htmlspecialchars($row['email']); ?></td>
            <td><span class="badge bg-info text-dark"><?php echo htmlspecialchars($row['role']); ?></span></td>
            <td>
                <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Sửa</a>
                <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Xác nhận xóa tài khoản này?');">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; [cite_start]//[cite: 271]?>