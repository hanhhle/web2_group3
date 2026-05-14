<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();

// Lấy danh sách CLO kèm tên môn học
$sql = "SELECT c.*, s.name as subject_name, s.code as subject_code 
        FROM clos c 
        JOIN subjects s ON c.subject_id = s.id 
        ORDER BY s.code ASC, c.code ASC";
$clos = $db->fetchAll($sql);

// Lấy danh sách môn học cho Dropdown
$subjects = $db->fetchAll("SELECT * FROM subjects ORDER BY code ASC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Chuẩn đầu ra Học phần (CLOs)</h2>
    <a href="matrix.php" class="btn btn-primary fw-bold">🎯 Mở Ma trận Ánh xạ (CLO-PLO)</a>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4 shadow-sm">
    <div class="card-header bg-info text-white fw-bold">Thêm CLO cho Môn học</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-4">
                <select name="subject_id" class="form-select" required>
                    <option value="">-- Chọn Môn học --</option>
                    <?php foreach ($subjects as $sub): ?>
                        <option value="<?php echo $sub['id']; ?>">
                            <?php echo htmlspecialchars($sub['code'] . ' - ' . $sub['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-2">
                <input type="text" name="code" class="form-control" placeholder="Mã (VD: CLO1)" required>
            </div>
            <div class="col-md-4">
                <input type="text" name="description" class="form-control" placeholder="Mô tả chi tiết CLO" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-info text-white w-100">Thêm CLO</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Môn học</th>
            <th>Mã CLO</th>
            <th>Mô tả chi tiết</th>
            <th style="width: 150px;">Hành động</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($clos as $row): ?>
        <tr>
            <td><strong><?php echo htmlspecialchars($row['subject_code']); ?></strong> - <?php echo htmlspecialchars($row['subject_name']); ?></td>
            <td><span class="badge bg-secondary"><?php echo htmlspecialchars($row['code']); ?></span></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
            <td>
                <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Xóa CLO này?');">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; ?>