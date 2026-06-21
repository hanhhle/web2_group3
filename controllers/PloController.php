<?php
declare(strict_types=1);

class PloController {
    public function index(): void {
        requirePermission('manage_plos');
        $plos = PloModel::getAll();
        $programs = ProgramModel::getSimpleAll();
        $edit = isset($_GET['edit']) ? PloModel::getById((int)$_GET['edit']) : null;

        require_once __DIR__ . '/../views/plos.php';
        if (function_exists('pagePLOS')) {
            pagePLOS($plos, $programs, $edit);
        }
    }

    public function create(): void {
        requirePermission('manage_plos');
        $programId = (int)$_POST['program_id'];
        $code = trim($_POST['code'] ?? '');
        $description = trim($_POST['description'] ?? '');

        try {
            $newId = PloModel::create($programId, $code, $description);
            auditLog('CREATE_PLO', 'plos', $newId);
            flash('success', 'PLO created.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=plos');
        exit;
    }

    public function edit(): void {
        requirePermission('manage_plos');
        $id = (int)$_POST['id'];
        $programId = (int)$_POST['program_id'];
        $code = trim($_POST['code'] ?? '');
        $description = trim($_POST['description'] ?? '');

        try {
            PloModel::update($id, $programId, $code, $description);
            auditLog('EDIT_PLO', 'plos', $id);
            flash('success', 'PLO updated.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=plos');
        exit;
    }

    public function delete(): void {
        requirePermission('manage_plos');
        $id = (int)$_POST['id'];

        try {
            PloModel::delete($id);
            auditLog('DELETE_PLO', 'plos', $id);
            flash('success', 'PLO deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete PLO: Check mapped CLOs.');
        }
        header('Location: index.php?page=plos');
        exit;
    }
}
