<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();

// Fetch CLO list along with subject details
$sql = "SELECT c.*, s.name as subject_name, s.code as subject_code 
        FROM clos c 
        JOIN subjects s ON c.subject_id = s.id 
        ORDER BY s.code ASC, c.code ASC";
$clos = $db->fetchAll($sql);

// Fetch subjects for dropdown
$subjects = $db->fetchAll("SELECT * FROM subjects ORDER BY code ASC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Course Learning Outcomes (CLOs)</h2>
    <a href="matrix.php" class="btn btn-primary fw-bold">🎯 Open CLO-PLO Matrix</a>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4 shadow-sm">
    <div class="card-header bg-info text-white fw-bold">Add CLO to Subject</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-4">
                <select name="subject_id" class="form-select" required>
                    <option value="">-- Select Subject --</option>
                    <?php foreach ($subjects as $sub): ?>
                        <option value="<?php echo $sub['id']; ?>">
                            <?php echo htmlspecialchars($sub['code'] . ' - ' . $sub['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-2">
                <input type="text" name="code" class="form-control" placeholder="Code (e.g. CLO1)" required>
            </div>
            <div class="col-md-4">
                <input type="text" name="description" class="form-control" placeholder="Detailed CLO description" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-info text-white w-100">Add CLO</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Subject</th>
            <th>CLO Code</th>
            <th>Description</th>
            <th style="width: 150px;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($clos as $row): ?>
        <tr>
            <td><strong><?php echo htmlspecialchars($row['subject_code']); ?></strong> - <?php echo htmlspecialchars($row['subject_name']); ?></td>
            <td><span class="badge bg-secondary"><?php echo htmlspecialchars($row['code']); ?></span></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
            <td>
                <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Delete this CLO?');">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; ?>