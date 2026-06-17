<?php
// ============================================================
//   INS3064 Group 3 — Secure University Grading System
// ============================================================

ini_set('display_errors', '0');
ini_set('display_startup_errors', '0');
error_reporting(E_ALL);

require_once __DIR__ . '/classes/auth.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start([
        'cookie_httponly' => true,
        'cookie_secure'   => isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on',
        'cookie_samesite' => 'Lax'
    ]);
}

// Load Core & HTML Layout helpers
require_once __DIR__ . '/includes/core.php';
require_once __DIR__ . '/includes/layout.php';

// Route page
$page = trim((string)($_GET['page'] ?? ''));
if ($page === '') {
    $page = isLoggedIn() ? 'dashboard' : 'login';
}
// Prevent path traversal — only allow alphanumeric + underscore page names
if (!preg_match('/^[a-zA-Z0-9_]+$/', $page)) {
    $page = isLoggedIn() ? 'dashboard' : 'login';
}

// Handle POST actions before any output
if (($_SERVER['REQUEST_METHOD'] ?? '') === 'POST') {
    require_once __DIR__ . '/includes/actions.php';
}



// Inline Login routing
if ($page === 'login') {
    if (isLoggedIn()) { header('Location: index.php?page=dashboard'); exit; }
    require_once __DIR__ . '/pages/login.php';
    pageLOGIN(); exit;
}

// All other pages require login
requireLogin();

// Dynamic page loader
$pagesFile = __DIR__ . '/pages/' . $page . '.php';
if (file_exists($pagesFile)) {
    require_once $pagesFile;
}

$fn = 'page' . strtoupper($page);
if (function_exists($fn)) {
    $fn(); exit;
}

header('Location: index.php?page=dashboard'); exit;