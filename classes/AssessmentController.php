<?php
require_once __DIR__ . '/database.php';

class AssessmentController {
    private $db;

    public function __construct() {
        $this->db = Database::getInstance();
    }

    // Lấy danh sách tất cả môn học để hiển thị trên Dropdown
    public function getAllSubjects() {
        $stmt = $this->db->query("SELECT id, code, name FROM subjects ORDER BY code ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Lấy danh sách CLO của môn học (Kế thừa từ kết quả Step 1)
    public function getCLOsBySubject($subject_id) {
        $sql = "SELECT id, code, description FROM clos WHERE subject_id = ? ORDER BY code ASC";
        $stmt = $this->db->query($sql, [$subject_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // READ: Lấy danh sách bài kiểm tra của một môn học cụ thể
    public function getAssessmentsBySubject($subject_id) {
        $sql = "SELECT * FROM assessments WHERE subject_id = ? ORDER BY id DESC";
        $stmt = $this->db->query($sql, [$subject_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // READ: Lấy chi tiết tiêu chí Rubric của một bài kiểm tra kèm thông tin mã CLO (Step 1)
    public function getRubricCriteriaByAssessment($assessment_id) {
        $sql = "SELECT rc.*, c.code as clo_code 
                FROM rubric_criteria rc
                JOIN rubrics r ON rc.rubric_id = r.id
                JOIN clos c ON rc.clo_id = c.id
                WHERE r.assessment_id = ?";
        $stmt = $this->db->query($sql, [$assessment_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // CREATE: Thêm bài kiểm tra mới + Kiểm tra ràng buộc Tổng Trọng Số <= 100% (Business Rule)
    public function createAssessment($subject_id, $name, $weight) {
        // --- BACKEND BUSINESS RULE --- [WorkSheet12 - Mục 26, 29]
        $sql_check = "SELECT SUM(weight) as total_weight FROM assessments WHERE subject_id = ?";
        $stmt_check = $this->db->query($sql_check, [$subject_id]);
        $result = $stmt_check->fetch(PDO::FETCH_ASSOC);
        $current_total = $result['total_weight'] ?? 0;

        if (($current_total + $weight) > 100.00) {
            // Chặn trực tiếp từ Backend [WorkSheet12 - Mục 33]
            throw new Exception("Lỗi nghiệp vụ: Tổng trọng số cấu trúc đánh giá của môn học này không được vượt quá 100%. Hiện tại môn này đã chiếm $current_total%.");
        }

        try {
            $this->db->beginTransaction();

            // 1. Chèn vào bảng assessments
            $sql_assess = "INSERT INTO assessments (subject_id, name, weight) VALUES (?, ?, ?)";
            $this->db->query($sql_assess, [$subject_id, $name, $weight]);
            $assessment_id = $this->db->getLastInsertId();

            // 2. Tự động tạo vỏ Rubric đi kèm tương ứng [Tương thích cấu trúc web2.sql]
            $sql_rubric = "INSERT INTO rubrics (assessment_id, name) VALUES (?, ?)";
            $this->db->query($sql_rubric, [$assessment_id, "Rubric cho " . $name]);

            $this->db->commit();
            return true;
        } catch (Exception $e) {
            $this->db->rollBack();
            throw $e;
        }
    }

    // CREATE: Thêm một tiêu chí cụ thể vào bộ Rubric (Bắt buộc chỉ định rõ map với clo_id nào)
    public function createCriterion($assessment_id, $clo_id, $description, $max_score) {
        // Truy vấn lấy rubric_id thuộc bài kiểm tra này
        $sql_r = "SELECT id FROM rubrics WHERE assessment_id = ? LIMIT 1";
        $stmt_r = $this->db->query($sql_r, [$assessment_id]);
        $rubric = $stmt_r->fetch(PDO::FETCH_ASSOC);

        if (!$rubric) {
            throw new Exception("Không tìm thấy bộ Rubric tương ứng cho bài đánh giá này.");
        }

        $rubric_id = $rubric['id'];
        
        // Chèn vào bảng rubric_criteria theo đúng schema web2.sql
        $sql_c = "INSERT INTO rubric_criteria (rubric_id, clo_id, description, max_score) VALUES (?, ?, ?, ?)";
        return $this->db->query($sql_c, [$rubric_id, $clo_id, $description, $max_score]);
    }

    // DELETE: Xóa bài kiểm tra (Do cấu trúc của em có ON DELETE CASCADE nên tự động xóa sạch các bảng phụ liên quan)
    public function deleteAssessment($id) {
        $sql = "DELETE FROM assessments WHERE id = ?";
        return $this->db->query($sql, [$id]);
    }
}
?>