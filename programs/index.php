<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY id DESC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Program Management</h2>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4">
    <div class="card-header bg-primary text-white">Add New Program</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-4">
                <input type="text" name="name" class="form-control" placeholder="Program name (e.g. Software Engineering)" required>
            </div>
            <div class="col-md-2">
                <input type="text" name="code" class="form-control" placeholder="Code (e.g. SE)" required>
            </div>
            <div class="col-md-4">
                <input type="text" name="description" class="form-control" placeholder="Detailed description...">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">Add Program</button>
            </div>
        </form>
    </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Code</th>
                <th>Program Name</th>
                <th>Description</th>
                <th>Actions</th>
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
                    <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Edit</a>
                    <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this program? All related PLOs and Subjects will also be removed.');">
                        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<?php include '../includes/footer.php'; ?>