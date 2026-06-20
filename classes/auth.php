<?php
require_once __DIR__ . '/database.php';

class EnrollmentController {
    private $db;

    public function __construct() {
        $this->db = Database::getInstance();
    }

    // Lấy danh sách tất cả môn học hiện có
    public function getAllSubjects() {
        $stmt = $this->db->query("SELECT id, code, name FROM subjects ORDER BY code ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Lấy danh sách người dùng có vai trò là Sinh viên ('student') để đưa vào form chọn lựa
    public function getAllStudents() {
        $sql = "SELECT id, username, full_name, email FROM users WHERE role = 'student' ORDER BY username ASC";
        $stmt = $this->db->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // READ: Lấy danh sách sinh viên đã được ghi danh vào một môn học trong học kỳ chỉ định
    public function getEnrollmentsByClass($subject_id, $semester) {
        $sql = "SELECT se.id as enrollment_id, u.username, u.full_name, u.email, s.name as subject_name, se.semester
                FROM student_enrollments se
                JOIN users u ON se.student_id = u.id
                JOIN subjects s ON se.subject_id = s.id
                WHERE se.subject_id = ? AND se.semester = ?
                ORDER BY u.username ASC";
        $stmt = $this->db->query($sql, [$subject_id, $semester]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // CREATE: Ghi danh sinh viên vào lớp học kèm theo luật kiểm tra trùng lặp bản ghi (Business Rule)
    public function enrollStudent($student_id, $subject_id, $semester) {
        // --- BACKEND BUSINESS RULE --- [WorkSheet12 - Mục 26, 30]
        // Ngăn chặn việc ghi danh trùng lặp một sinh viên học cùng một môn học trong cùng một học kỳ
        $sql_check = "SELECT id FROM student_enrollments WHERE student_id = ? AND subject_id = ? AND semester = ?";
        $stmt_check = $this->db->query($sql_check, [$student_id, $subject_id, $semester]);
        
        if ($stmt_check->fetch()) {
            throw new Exception("Lỗi nghiệp vụ: Sinh viên này hiện tại đã có tên trong danh sách lớp học của học kỳ được chọn.");
        }
        // ----------------------------------------------------

        $sql_insert = "INSERT INTO student_enrollments (student_id, subject_id, semester) VALUES (?, ?, ?)";
        return $this->db->query($sql_insert, [$student_id, $subject_id, $semester]);
    }

    // DELETE: Hủy ghi danh sinh viên khỏi lớp học học phần
    public function removeEnrollment($enrollment_id) {
        $sql = "DELETE FROM student_enrollments WHERE id = ?";
        return $this->db->query($sql, [$enrollment_id]);
    }
}
?>