<?php
declare(strict_types=1);

class EnrollmentController {
    public function index(): void {
        requirePermission('manage_enrollments');
        $enrollments = EnrollmentModel::getAll();
        $students = UserModel::getStudents();
        $subjects = SubjectModel::getSimpleAll();

        require_once __DIR__ . '/../views/enrollments.php';
        if (function_exists('pageENROLLMENTS')) {
            pageENROLLMENTS($enrollments, $students, $subjects);
        }
    }

    public function enroll(): void {
        requirePermission('manage_enrollments');
        $studentId = (int)$_POST['student_id'];
        $subjectId = (int)$_POST['subject_id'];
        $semester = trim($_POST['semester'] ?? '');

        try {
            $dup = EnrollmentModel::checkDuplicate($studentId, $subjectId, $semester);
            if ($dup) {
                flash('error', 'Enrollment already exists.');
            } else {
                $newId = EnrollmentModel::enroll($studentId, $subjectId, $semester);
                auditLog('ENROLL_STUDENT', 'student_enrollments', $newId);
                flash('success', 'Student enrolled successfully.');
            }
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=enrollments');
        exit;
    }

    public function unenroll(): void {
        requirePermission('manage_enrollments');
        $id = (int)$_POST['id'];

        try {
            EnrollmentModel::unenroll($id);
            auditLog('UNENROLL_STUDENT', 'student_enrollments', $id);
            flash('success', 'Enrollment removed.');
        } catch (Exception $e) {
            flash('error', 'Cannot unenroll student: This course enrollment has scores already recorded in the secure ledger.');
        }
        header('Location: index.php?page=enrollments');
        exit;
    }
}
