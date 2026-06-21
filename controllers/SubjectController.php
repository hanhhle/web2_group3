<?php
declare(strict_types=1);

class SubjectController {
    public function index(): void {
        requirePermission('manage_subjects');
        $subjects = SubjectModel::getAll();
        $programs = ProgramModel::getSimpleAll();
        $lecturers = UserModel::getLecturers();
        $edit = isset($_GET['edit']) ? SubjectModel::getById((int)$_GET['edit']) : null;

        require_once __DIR__ . '/../views/subjects.php';
        if (function_exists('pageSUBJECTS')) {
            pageSUBJECTS($subjects, $programs, $lecturers, $edit);
        }
    }

    public function create(): void {
        requirePermission('manage_subjects');
        $programId = (int)$_POST['program_id'];
        $code = trim($_POST['code'] ?? '');
        $name = trim($_POST['name'] ?? '');
        $credits = (int)$_POST['credits'];
        $lecturerId = !empty($_POST['lecturer_id']) ? (int)$_POST['lecturer_id'] : null;

        try {
            $newId = SubjectModel::create($programId, $code, $name, $credits, $lecturerId);
            auditLog('CREATE_SUBJECT', 'subjects', $newId);
            flash('success', 'Subject added.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=subjects');
        exit;
    }

    public function edit(): void {
        requirePermission('manage_subjects');
        $id = (int)$_POST['id'];
        $programId = (int)$_POST['program_id'];
        $code = trim($_POST['code'] ?? '');
        $name = trim($_POST['name'] ?? '');
        $credits = (int)$_POST['credits'];
        $lecturerId = !empty($_POST['lecturer_id']) ? (int)$_POST['lecturer_id'] : null;

        try {
            SubjectModel::update($id, $programId, $code, $name, $credits, $lecturerId);
            auditLog('EDIT_SUBJECT', 'subjects', $id);
            flash('success', 'Subject updated.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=subjects');
        exit;
    }

    public function delete(): void {
        requirePermission('manage_subjects');
        $id = (int)$_POST['id'];

        try {
            SubjectModel::delete($id);
            auditLog('DELETE_SUBJECT', 'subjects', $id);
            flash('success', 'Subject deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete subject: Check related CLOs, Assessments or student enrollments.');
        }
        header('Location: index.php?page=subjects');
        exit;
    }
}
