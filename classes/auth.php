<?php
require_once __DIR__ . '/database.php';

class Auth {

    public static function login($username, $password) {
        $db   = Database::getInstance();
        $user = $db->fetchOne(
            "SELECT * FROM users WHERE username = ?",
            [trim($username)]
        );
        if ($user && password_verify($password, $user['password_hash'])) {
            session_regenerate_id(true);
            $_SESSION['user_id']   = (int)$user['id'];
            $_SESSION['username']  = $user['username'];
            $_SESSION['full_name'] = $user['full_name'];
            $_SESSION['role']      = self::normalizeRole($user['role']);
            self::log((int)$user['id'], 'LOGIN', 'users', (int)$user['id'], "User logged in: " . $user['username']);
            return true;
        }
        return false;
    }

    public static function logout() {
        if (!empty($_SESSION['user_id'])) {
            $username = $_SESSION['username'] ?? 'unknown';
            self::log((int)$_SESSION['user_id'], 'LOGOUT', 'users', (int)$_SESSION['user_id'], "User logged out: " . $username);
        }
        $_SESSION = [];
        if (ini_get('session.use_cookies')) {
            $p = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $p['path'], $p['domain'], $p['secure'], $p['httponly']);
        }
        session_destroy();
    }

    public static function isLoggedIn() {
        return !empty($_SESSION['user_id']);
    }

    public static function getRole() {
        return self::normalizeRole($_SESSION['role'] ?? null);
    }

    public static function getUserId() {
        return (int)($_SESSION['user_id'] ?? 0);
    }

    public static function generateCsrfToken() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        if (empty($_SESSION['csrf_token'])) {
            $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
        }
        return $_SESSION['csrf_token'];
    }

    public static function getCsrfToken() {
        return $_SESSION['csrf_token'] ?? self::generateCsrfToken();
    }

    public static function validateCsrfToken($token) {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $stored = $_SESSION['csrf_token'] ?? '';
        return !empty($stored) && hash_equals($stored, (string)$token);
    }

    public static function normalizeRole(?string $role): ?string {
        if ($role === null) {
            return null;
        }
        $role = trim(strtolower($role));
        if ($role === 'lecture') {
            return 'lecturer';
        }
        return $role;
    }

    // ----------------------------------------------------------------
    // Each guard redirects to an ABSOLUTE path so it always works.
    /** Redirect to login if not authenticated */
    public static function requireLogin() {
        if (!self::isLoggedIn()) {
            header('Location: ' . self::url('index.php?page=login'));
            exit;
        }
    }

    /** Redirect to dashboard if wrong role */
    public static function requireRole($role) {
        self::requireLogin();
        if (self::getRole() !== $role) {
            header('Location: ' . self::url('index.php?page=dashboard'));
            exit;
        }
    }

    /** Redirect to dashboard if not in allowed roles */
    public static function requireAnyRole(array $roles) {
        self::requireLogin();
        if (!in_array(self::getRole(), $roles, true)) {
            header('Location: ' . self::url('index.php?page=dashboard'));
            exit;
        }
    }

    /**
     * Build an absolute URL to a project-root-relative file.
     *
     * Strategy: find the project folder name from __FILE__,
     * then look for it in SCRIPT_NAME to get the web-visible base path.
     *
     * e.g.  __FILE__ lives in  E:/htdocs/web2_group3-main/classes/auth.php
     *       project folder  =  web2_group3-main
     *       SCRIPT_NAME     =  /web2_group3-main/admin/users.php
     *       base            =  /web2_group3-main/
     *       url('auth/login.php') = /web2_group3-main/auth/login.php
     */
    public static function url($path) {
        static $base = null;
        if ($base === null) {
            // Project folder name (e.g. "web2_group3-main")
            $projectFolder = basename(dirname(__DIR__));

            $scriptName = str_replace('\\', '/', $_SERVER['SCRIPT_NAME'] ?? '');

            // Find "/projectFolder/" in the script name
            $needle = '/' . $projectFolder . '/';
            $pos    = strpos($scriptName, $needle);

            if ($pos !== false) {
                $base = substr($scriptName, 0, $pos + strlen($needle));
            } else {
                // Fallback: use document root detection
                $docRoot = rtrim(str_replace('\\', '/', realpath($_SERVER['DOCUMENT_ROOT'] ?? '')), '/');
                $projDir = rtrim(str_replace('\\', '/', realpath(dirname(__DIR__))), '/');
                $base    = str_replace($docRoot, '', $projDir) . '/';
            }
        }
        return $base . ltrim($path, '/');
    }

    /** Write to audit_logs — wrapped in try/catch so it never breaks auth */
    public static function log($userId, $action, $table = null, $recordId = null, $details = null) {
        try {
            $db = Database::getInstance();
            $db->query(
                "INSERT INTO audit_logs (user_id, action, table_name, record_id, details, ip_address)
                 VALUES (?, ?, ?, ?, ?, ?)",
                [$userId, $action, $table, $recordId, $details,
                 $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1']
            );
        } catch (Exception $e) { /* silent */ }
    }
}
