<?php 
require_once '../classes/Database.php';
include '../includes/header.php'; 

$db = Database::getInstance();
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY id DESC");
?>

<h2>Quản lý Chương trình (Programs)</h2>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success">
        <?php 
            echo $_SESSION['msg']; 
            unset($_SESSION['msg']);
        ?>
    </div>
<?php endif; ?>

<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger">
        <?php 
            echo $_SESSION['error']; 
            unset($_SESSION['error']); 
        ?>
    </div>
<?php endif; ?>

<div class="card mb-4">
    <div class="card-body">
        <form action="create.php" method="POST">
            <div class="row">
                <div class="col-md-4">
                    <input type="text" name="name" class="form-control" placeholder="Tên chương trình (Vd: CNTT)">
                </div>
                <div class="col-md-3">
                    <input type="text" name="code" class="form-control" placeholder="Mã (Vd: IT)">
                </div>
                <div class="col-md-4">
                    <input type="text" name="description" class="form-control" placeholder="Mô tả ngắn...">
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered">
    <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Code</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($programs as $row): ?>
        <tr>
            <td><?php echo htmlspecialchars($row['id']); ?></td>
            <td><?php echo htmlspecialchars($row['name']); ?></td>
            <td><?php echo htmlspecialchars($row['code']); ?></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; ?>