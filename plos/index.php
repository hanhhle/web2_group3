<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();

// Truy vấn JOIN để lấy tên chương trình đào tạo [cite: 300]
$sql_plos = "SELECT plos.*, programs.name as program_name 
             FROM plos 
             JOIN programs ON plos.program_id = programs.id 
             ORDER BY plos.id DESC";
$plos = $db->fetchAll($sql_plos);

// Lấy danh sách chương trình cho Menu thả xuống [cite: 280]
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY name ASC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Chuẩn đầu ra Chương trình (PLOs)</h2>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4">
    <div class="card-header bg-success text-white">Thêm chuẩn đầu ra mới</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-3">
                <select name="program_id" class="form-select" required>
                    <option value="">-- Thuộc Chương trình --</option>
                    <?php foreach ($programs as $prog): ?>
                        <option value="<?php echo $prog['id']; ?>">
                            <?php echo htmlspecialchars($prog['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-2">
                <input type="text" name="code" class="form-control" placeholder="Mã PLO" required>
            </div>
            <div class="col-md-5">
                <input type="text" name="description" class="form-control" placeholder="Mô tả chuẩn đầu ra" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success w-100">Thêm PLO</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered">
    <thead class="table-secondary">
        <tr>
            <th>Chương trình</th>
            <th>Mã PLO</th>
            <th>Mô tả chi tiết</th>
            <th style="width: 150px;">Hành động</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($plos as $row): ?>
        <tr>
            <td><?php echo htmlspecialchars($row['program_name']); ?></td>
            <td><strong><?php echo htmlspecialchars($row['code']); ?></strong></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
            <td>
                <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Sửa</a>
                <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Bạn có chắc muốn xóa PLO này?');">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; ?>