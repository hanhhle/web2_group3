<?php
declare(strict_types=1);

class UserController {
    public function index(): void {
        requirePermission('manage_users');
        $users = UserModel::getAll();
        $editUser = isset($_GET['edit']) ? UserModel::getById((int)$_GET['edit']) : null;

        require_once __DIR__ . '/../views/users.php';
        if (function_exists('pageUSERS')) {
            pageUSERS($users, $editUser);
        }
    }

    public function create(): void {
        requirePermission('manage_users');
        $username = trim($_POST['username'] ?? '');
        $password = $_POST['password'] ?? '';
        $role = $_POST['role'] ?? 'student';
        $fullName = trim($_POST['full_name'] ?? '');
        $email = trim($_POST['email'] ?? '');

        try {
            $exists = UserModel::getByUsername($username);
            if ($exists) {
                throw new Exception('Username already exists. Please choose another.');
            }
            $userId = UserModel::create($username, $password, $role, $fullName, $email);
            auditLog('CREATE_USER', 'users', $userId, "Created: " . $username);
            flash('success', 'User created successfully.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=users');
        exit;
    }

    public function edit(): void {
        requirePermission('manage_users');
        $id = (int)$_POST['id'];
        $fullName = trim($_POST['full_name'] ?? '');
        $email = trim($_POST['email'] ?? '');
        $role = $_POST['role'] ?? 'student';
        $password = isset($_POST['password']) && $_POST['password'] !== '' ? $_POST['password'] : null;

        try {
            UserModel::update($id, $fullName, $email, $role, $password);
            auditLog('EDIT_USER', 'users', $id);
            flash('success', 'User updated.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=users');
        exit;
    }

    public function delete(): void {
        requirePermission('manage_users');
        $id = (int)$_POST['id'];
        if ($id === uid()) {
            flash('error', 'Cannot delete yourself.');
        } else {
            try {
                UserModel::delete($id);
                auditLog('DELETE_USER', 'users', $id);
                flash('success', 'User deleted.');
            } catch (Exception $e) {
                flash('error', 'Cannot delete user: The account has activity history linked to other data.');
            }
        }
        header('Location: index.php?page=users');
        exit;
    }
}
