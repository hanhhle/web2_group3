<?php
declare(strict_types=1);

class ProgramController {
    public function index(): void {
        requirePermission('manage_programs');
        $programs = ProgramModel::getAll();
        $edit = isset($_GET['edit']) ? ProgramModel::getById((int)$_GET['edit']) : null;

        require_once __DIR__ . '/../views/programs.php';
        if (function_exists('pagePROGRAMS')) {
            pagePROGRAMS($programs, $edit);
        }
    }

    public function create(): void {
        requirePermission('manage_programs');
        $code = trim($_POST['code'] ?? '');
        $name = trim($_POST['name'] ?? '');
        $description = trim($_POST['description'] ?? '');

        try {
            $newId = ProgramModel::create($code, $name, $description);
            auditLog('CREATE_PROGRAM', 'programs', $newId);
            flash('success', 'Program created.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=programs');
        exit;
    }

    public function edit(): void {
        requirePermission('manage_programs');
        $id = (int)$_POST['id'];
        $code = trim($_POST['code'] ?? '');
        $name = trim($_POST['name'] ?? '');
        $description = trim($_POST['description'] ?? '');

        try {
            ProgramModel::update($id, $code, $name, $description);
            auditLog('EDIT_PROGRAM', 'programs', $id);
            flash('success', 'Program updated.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=programs');
        exit;
    }

    public function delete(): void {
        requirePermission('manage_programs');
        $id = (int)$_POST['id'];

        try {
            ProgramModel::delete($id);
            auditLog('DELETE_PROGRAM', 'programs', $id);
            flash('success', 'Program deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete program: Check if subjects are registered in it.');
        }
        header('Location: index.php?page=programs');
        exit;
    }
}
