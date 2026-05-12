<?php
require_once '../classes/database.php';
include '../includes/header.php';

$db = Database::getInstance();

// XỬ LÝ LƯU DỮ LIỆU (POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)$_POST['id'];
    $username = trim($_POST['username']);
    $full_name = trim($_POST['full_name']);
    $email = trim($_POST['email']);
    $role = $_POST['role'];
    $password_raw = $_POST['password'];

    try {
        if (!empty($password_raw)) {
            // Nếu có nhập pass mới -> Hash và cập nhật cả pass
            $password_hashed = password_hash($password_raw, PASSWORD_DEFAULT);
            $sql = "UPDATE users SET username=?, full_name=?, email=?, role=?, password_hash=? WHERE id=?";
            $db->query($sql, [$username, $full_name, $email, $role, $password_hashed, $id]);
        } else {
            // Nếu để trống pass -> Chỉ cập nhật thông tin khác
            $sql = "UPDATE users SET username=?, full_name=?, email=?, role=? WHERE id=?";
            $db->query($sql, [$username, $full_name, $email, $role, $id]);
        }
        $_SESSION['msg'] = "Cập nhật tài khoản thành công!";
        header("Location: index.php");
        exit;
    } catch (PDOException $e) {
        $_SESSION['error'] = "Lỗi cập nhật (Có thể trùng Username/Email): " . $e->getMessage();
        header("Location: index.php");
        exit;
    }
}

// HIỂN THỊ FORM (GET)
$id = $_GET['id'] ?? null;
if (!$id) { header("Location: index.php"); exit; }

$user = $db->query("SELECT * FROM users WHERE id = ?", [$id])->fetch(PDO::FETCH_ASSOC);
if (!$user) { header("Location: index.php"); exit; }
?>

<h2>Sửa Tài khoản</h2>
<div class="card mt-3">
    <div class="card-body">
        <form action="edit.php" method="POST">
            <input type="hidden" name="id" value="<?php echo $user['id']; ?>">
            
            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<?php echo htmlspecialchars($user['username']); ?>" required>
            </div>
            <div class="mb-3">
                <label>Họ và Tên</label>
                <input type="text" name="full_name" class="form-control" value="<?php echo htmlspecialchars($user['full_name']); ?>" required>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="<?php echo htmlspecialchars($user['email']); ?>" required>
            </div>
            <div class="mb-3">
                <label>Vai trò</label>
                <select name="role" class="form-select" required>
                    <option value="student" <?php echo ($user['role'] == 'student') ? 'selected' : ''; ?>>Sinh viên</option>
                    <option value="lecturer" <?php echo ($user['role'] == 'lecturer') ? 'selected' : ''; ?>>Giảng viên</option>
                    <option value="admin" <?php echo ($user['role'] == 'admin') ? 'selected' : ''; ?>>Admin</option>
                </select>
            </div>
            <div class="mb-3">
                <label>Mật khẩu mới (Để trống nếu không muốn đổi)</label>
                <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu mới...">
            </div>
            <button type="submit" class="btn btn-success">Lưu thay đổi</button>
            <a href="index.php" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</div>
<?php include '../includes/footer.php'; ?>