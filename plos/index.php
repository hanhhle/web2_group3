<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();

// Query with JOIN to fetch program name for each PLO
$sql_plos = "SELECT plos.*, programs.name as program_name 
             FROM plos 
             JOIN programs ON plos.program_id = programs.id 
             ORDER BY plos.id DESC";
$plos = $db->fetchAll($sql_plos);

// Fetch program list for the dropdown menu
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY name ASC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Program Learning Outcomes (PLOs)</h2>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4">
    <div class="card-header bg-success text-white">Add New PLO</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-3">
                <select name="program_id" class="form-select" required>
                    <option value="">-- Select Program --</option>
                    <?php foreach ($programs as $prog): ?>
                        <option value="<?php echo $prog['id']; ?>">
                            <?php echo htmlspecialchars($prog['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-2">
                <input type="text" name="code" class="form-control" placeholder="PLO Code" required>
            </div>
            <div class="col-md-5">
                <input type="text" name="description" class="form-control" placeholder="PLO Description" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success w-100">Add PLO</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered">
    <thead class="table-secondary">
        <tr>
            <th>Program</th>
            <th>PLO Code</th>
            <th>Description</th>
            <th style="width: 150px;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($plos as $row): ?>
        <tr>
            <td><?php echo htmlspecialchars($row['program_name']); ?></td>
            <td><strong><?php echo htmlspecialchars($row['code']); ?></strong></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
            <td>
                <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Edit</a>
                <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this PLO?');">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; ?>