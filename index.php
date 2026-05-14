<?php 
// Đường dẫn include lúc này chỉ cần 1 dấu chấm vì file đang ở thư mục gốc
include 'includes/header.php'; 
?>

<div class="text-center py-5">
    <h1 class="display-5 fw-bold">Hệ thống Quản lý Đào tạo VNU-IS</h1>
    <p class="col-md-8 mx-auto fs-5 text-muted">
        Hệ thống tích hợp công nghệ <strong>Ledger-based</strong> đảm bảo tính toàn vẹn dữ liệu cho Chuẩn đầu ra (CLO-PLO) và kết quả học tập.
    </p>
</div>

<div class="row g-4 mt-2">
    <div class="col-md-6">
        <div class="card h-100 border-primary">
            <div class="card-body text-center">
                <h3 class="card-title">🎓 Quản lý Chương trình</h3>
                <p class="card-text">Thiết lập các chương trình đào tạo cốt lõi với mã định danh bất biến.</p>
                <a href="programs/index.php" class="btn btn-outline-primary">Truy cập ngay</a>
            </div>
        </div>
    </div>
    
    <div class="col-md-6">
        <div class="card h-100 border-success">
            <div class="card-body text-center">
                <h3 class="card-title">🎯 Quản lý Chuẩn đầu ra</h3>
                <p class="card-text">Xây dựng ma trận Chuẩn đầu ra chương trình (PLOs) đạt chuẩn kiểm định.</p>
                <a href="plos/index.php" class="btn btn-outline-success">Truy cập ngay</a>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card h-100 border-warning">
            <div class="card-body text-center">
                <h3 class="card-title">📚 Quản lý Môn học</h3>
                <p class="card-text">Phân bổ học phần và số tín chỉ tương ứng cho từng chương trình đào tạo.</p>
                <a href="subjects/index.php" class="btn btn-outline-warning">Truy cập ngay</a>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card h-100 border-info">
            <div class="card-body text-center">
                <h3 class="card-title">👥 Quản lý Tài khoản</h3>
                <p class="card-text">Phân quyền chặt chẽ Admin, Giảng viên và Sinh viên với bảo mật mật khẩu.</p>
                <a href="users/index.php" class="btn btn-outline-info">Truy cập ngay</a>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>