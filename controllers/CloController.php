<?php
declare(strict_types=1);

class CloController {
    public function index(): void {
        requirePermission('manage_clos');
        $clos = CloModel::getAll();
        $subjects = SubjectModel::getSimpleAll();
        $edit = isset($_GET['edit']) ? CloModel::getById((int)$_GET['edit']) : null;

        require_once __DIR__ . '/../views/clos.php';
        if (function_exists('pageCLOS')) {
            pageCLOS($clos, $subjects, $edit);
        }
    }

    public function matrix(): void {
        requirePermission('manage_matrix');
        $programs = ProgramModel::getSimpleAll();
        $selProg = isset($_GET['program_id']) ? (int)$_GET['program_id'] : 0;
        $selSubj = isset($_GET['subject_id']) ? (int)$_GET['subject_id'] : 0;

        $subjsOfProg = $selProg ? SubjectModel::getByProgram($selProg) : [];
        $plos = $selProg ? PloModel::getByProgram($selProg) : [];
        $clos = $selSubj ? CloModel::getBySubject($selSubj) : [];
        $currentMapping = $selSubj ? CloModel::getMappingsForSubject($selSubj) : [];

        require_once __DIR__ . '/../views/clo_matrix.php';
        if (function_exists('pageCLO_MATRIX')) {
            pageCLO_MATRIX($programs, $selProg, $selSubj, $subjsOfProg, $plos, $clos, $currentMapping);
        }
    }

    public function create(): void {
        requirePermission('manage_clos');
        $subjectId = (int)$_POST['subject_id'];
        $code = trim($_POST['code'] ?? '');
        $description = trim($_POST['description'] ?? '');

        try {
            $newId = CloModel::create($subjectId, $code, $description);
            auditLog('CREATE_CLO', 'clos', $newId);
            flash('success', 'CLO created.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=clos');
        exit;
    }

    public function edit(): void {
        requirePermission('manage_clos');
        $id = (int)$_POST['id'];
        $subjectId = (int)$_POST['subject_id'];
        $code = trim($_POST['code'] ?? '');
        $description = trim($_POST['description'] ?? '');

        try {
            CloModel::update($id, $subjectId, $code, $description);
            auditLog('EDIT_CLO', 'clos', $id);
            flash('success', 'CLO updated.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=clos');
        exit;
    }

    public function delete(): void {
        requirePermission('manage_clos');
        $id = (int)$_POST['id'];

        try {
            CloModel::delete($id);
            auditLog('DELETE_CLO', 'clos', $id);
            flash('success', 'CLO deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete CLO: Check related criteria or PLO mapping.');
        }
        header('Location: index.php?page=clos');
        exit;
    }

    public function saveMatrix(): void {
        requirePermission('manage_matrix');
        $sid = (int)$_POST['subject_id'];
        $programId = (int)$_POST['program_id'];
        $mappings = $_POST['map'] ?? []; // format: [clo_id => [plo_id => 1]]

        try {
            CloModel::saveMatrix($sid, $mappings);
            auditLog('SAVE_CLO_PLO_MATRIX', 'subjects', $sid);
            flash('success', 'Matrix mapping saved successfully.');
        } catch (Exception $e) {
            flash('error', 'Error saving matrix: ' . $e->getMessage());
        }
        header("Location: index.php?page=clo_matrix&program_id={$programId}&subject_id={$sid}");
        exit;
    }
}
