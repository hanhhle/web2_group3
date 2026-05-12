<?php 
require_once '../classes/database.php';
include '../includes/header.php'; 

$db = Database::getInstance();

// 1. QUERY THÔNG MINH: Lấy danh sách Môn học, gộp mã chương trình và đếm số lượng
$sql = "
    SELECT s.*, 
           GROUP_CONCAT(p.code SEPARATOR ', ') as list_programs,
           COUNT(spm.program_id) as mapped_count,
           (SELECT COUNT(*) FROM programs) as total_programs_count
    FROM subjects s
    LEFT JOIN subject_program_mapping spm ON s.id = spm.subject_id
    LEFT JOIN programs p ON spm.program_id = p.id
    GROUP BY s.id
    ORDER BY s.id DESC
";
$subjects = $db->fetchAll($sql);

// 2. QUERY BẢNG PHỤ: Lấy danh sách Chương trình để đưa vào Checkbox
$programs = $db->fetchAll("SELECT * FROM programs ORDER BY name ASC");
?>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Quản lý Học phần (Subjects)</h2>
</div>

<?php if (isset($_SESSION['msg'])): ?>
    <div class="alert alert-success"><?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?></div>
<?php endif; ?>
<?php if (isset($_SESSION['error'])): ?>
    <div class="alert alert-danger"><?php echo $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<div class="card mb-4 shadow-sm">
    <div class="card-header bg-warning text-dark fw-bold">Thêm Môn học mới</div>
    <div class="card-body">
        <form action="create.php" method="POST" class="row g-3">
            <div class="col-md-3">
                <label class="form-label fw-bold">Mã môn (VD: INS3064)</label>
                <input type="text" name="code" class="form-control" placeholder="Nhập mã môn" required>
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold">Tên môn học</label>
                <input type="text" name="name" class="form-control" placeholder="Nhập tên môn học" required>
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold">Số tín chỉ</label>
                <input type="number" name="credits" class="form-control" placeholder="Nhập số tín chỉ" min="1" required>
            </div>
            
            <div class="col-12 mt-3">
                <label class="form-label fw-bold d-block">Thuộc các ngành đào tạo:</label>
                <button class="btn btn-outline-secondary btn-sm mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePrograms" aria-expanded="false" aria-controls="collapsePrograms">
                    👇 Hiển thị / Ẩn danh sách ngành (Tích chọn)
                </button>
                
                <div class="collapse" id="collapsePrograms">
                    <div class="row border p-3 rounded bg-light mx-0" style="max-height: 250px; overflow-y: auto;">
                        <?php foreach ($programs as $prog): ?>
                            <div class="col-md-4 mb-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="program_ids[]" 
                                        value="<?php echo $prog['id']; ?>" id="prog_<?php echo $prog['id']; ?>">
                                    <label class="form-check-label" for="prog_<?php echo $prog['id']; ?>">
                                        <?php echo htmlspecialchars($prog['code'] . ' - ' . $prog['name']); ?>
                                    </label>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <small class="text-muted fst-italic">* Có thể tích chọn nhiều ngành cùng lúc nếu đây là môn học chung.</small>
                </div>
            </div>

            <div class="col-12 text-end mt-3">
                <button type="submit" class="btn btn-warning px-5 fw-bold">Thêm Môn Học</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>Mã Môn</th>
            <th>Tên Môn</th>
            <th>Tín chỉ</th>
            <th>Thuộc các Chương trình</th>
            <th style="width: 150px;">Hành động</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($subjects as $row): ?>
        <tr>
            <td><strong><?php echo htmlspecialchars($row['code']); ?></strong></td>
            <td><?php echo htmlspecialchars($row['name']); ?></td>
            <td><?php echo htmlspecialchars($row['credits']); ?></td>
            <td>
                <?php 
                    // Nếu môn học được tích cho TOÀN BỘ số ngành có trong DB
                    if ($row['mapped_count'] > 0 && $row['mapped_count'] == $row['total_programs_count']) {
                        echo '<span class="badge bg-success">Tất cả các chương trình</span>';
                    } else {
                        // Nếu chỉ học ở 1 vài ngành thì liệt kê mã ngành ra
                        echo htmlspecialchars($row['list_programs'] ?? 'Chưa gán ngành nào');
                    }
                ?>
            </td>
            <td>
                <a href="edit.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Sửa</a>
                <form action="delete.php" method="POST" class="d-inline" onsubmit="return confirm('Bạn có chắc chắn muốn xóa môn học này?');">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php include '../includes/footer.php'; ?>