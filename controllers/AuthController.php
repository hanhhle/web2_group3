<?php
declare(strict_types=1);

class AuthController {
    public function showLogin(): void {
        if (isLoggedIn()) {
            header('Location: index.php?page=dashboard');
            exit;
        }
        require_once __DIR__ . '/../views/login.php';
        if (function_exists('pageLOGIN')) {
            pageLOGIN();
        }
    }

    public function handleLogin(): void {
        $username = $_POST['username'] ?? '';
        $password = $_POST['password'] ?? '';
        if (Auth::login($username, $password)) {
            header('Location: index.php?page=dashboard');
        } else {
            flash('error', 'Invalid username or password.');
            header('Location: index.php?page=login');
        }
        exit;
    }

    public function handleLogout(): void {
        Auth::logout();
        header('Location: index.php?page=login');
        exit;
    }
}
