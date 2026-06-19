<?php
declare(strict_types=1);

// ── HTML helpers ─────────────────────────────────────────────
function h(string $s): string { return htmlspecialchars($s, ENT_QUOTES, 'UTF-8'); }
function navLink(string $p, string $icon, string $label): void {
    global $page;
    $active = ($page === $p) ? ' active' : '';
    echo "<a href='index.php?page=$p' class='sidebar-link$active'><i class='bi bi-$icon'></i>$label</a>";
}

// ── Page HEAD + Navbar + Sidebar ─────────────────────────────
function renderHead(): void {
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title><?php echo APP_NAME; ?></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
/* ── Base ── */
*, *::before, *::after { box-sizing: border-box; }
:root {
  --sidebar-bg:     #ffffff;
  --sidebar-width:  240px;
  --navbar-h:       58px;
  --accent:         #2563eb;
  --accent-hover:   #1d4ed8;
  --accent-glow:    rgba(37,99,235,.18);
  --surface:        #ffffff;
  --surface-2:      #f8fafc;
  --border:         #e5e7eb;
  --text-main:      #111827;
  --text-muted:     #6b7280;
  --text-sidebar:   #4b5563;
  --text-sidebar-active: #2563eb;
  --success:        #10b981;
  --danger:         #ef4444;
  --warning:        #f59e0b;
  --info:           #3b82f6;
  --radius:         10px;
  --shadow-sm:      0 1px 3px rgba(0,0,0,.06), 0 1px 2px rgba(0,0,0,.04);
  --shadow-md:      0 4px 16px rgba(0,0,0,.08);
  --shadow-lg:      0 10px 40px rgba(0,0,0,.10);
  --transition:     all .18s ease;
}
body {
  font-family: 'Inter', system-ui, sans-serif;
  background: var(--surface-2);
  color: var(--text-main);
  font-size: .875rem;
  line-height: 1.6;
  -webkit-font-smoothing: antialiased;
}

/* ── Scrollbar ── */
::-webkit-scrollbar { width: 5px; height: 5px; }
::-webkit-scrollbar-track { background: transparent; }
::-webkit-scrollbar-thumb { background: #d1d5db; border-radius: 99px; }
::-webkit-scrollbar-thumb:hover { background: #9ca3af; }

/* ── Navbar ── */
.app-navbar {
  height: var(--navbar-h);
  background: #ffffff; /* Dấu chấm phẩy ở đây */
  border-bottom: 1px solid #e5e7eb; /* Tách riêng phần viền */
  display: flex;
  align-items: center;
  padding: 0 1.5rem;
  position: sticky;
  top: 0;
  z-index: 1030;
  gap: 1rem;
}
.app-navbar .brand {
  display: flex;
  align-items: center;
  gap: .55rem;
  text-decoration: none;
  font-weight: 700;
  font-size: 1rem;
  letter-spacing: -.01em;
  color: #111827;
  white-space: nowrap;
}
.app-navbar .brand .brand-icon {
  width: 32px; height: 32px;
  background: linear-gradient(135deg, #1d4ed8, #3b82f6);
  border-radius: 8px;
  display: flex; align-items: center; justify-content: center;
  font-size: .9rem;
  color: #fff;
  flex-shrink: 0;
  box-shadow: 0 0 0 3px var(--accent-glow);
}
.app-navbar .brand span { color: #111827; }
.app-navbar { border-bottom: 2px solid #2563eb !important; box-shadow: 0 1px 4px rgba(0,0,0,.06); }
.brand-text { display:flex; flex-direction:column; line-height:1.15; }
.brand-name { font-size:.95rem; font-weight:800; color:#111827; letter-spacing:-.02em; }
.brand-sub  { font-size:.63rem; font-weight:500; color:#6b7280; margin-top:1px; }
.user-info  { display:flex; flex-direction:column; line-height:1.2; }
.user-name  { font-size:.8rem; font-weight:600; color:#111827; }
.app-navbar .brand span em { color: #818cf8; font-style: normal; }
.app-navbar .ms-auto { margin-left: auto !important; }
.app-navbar .nav-right { display: flex; align-items: center; gap: .75rem; }
.user-pill {
  display: flex; align-items: center; gap: .5rem;
  background: #f1f5f9;
  border: 1px solid #e5e7eb;
  border-radius: 99px;
  padding: .3rem .85rem .3rem .45rem;
  font-size: .8rem;
  font-weight: 500;
  color: #111827;
  cursor: default;
}
.user-pill .avatar {
  width: 26px; height: 26px;
  border-radius: 50%;
  display: flex; align-items: center; justify-content: center;
  font-size: .7rem;
  font-weight: 700;
  color: #fff;
  flex-shrink: 0;
}
.user-pill .role-tag {
  font-size: .68rem;
  padding: .1rem .45rem;
  border-radius: 99px;
  font-weight: 600;
  margin-left: .25rem;
}
.btn-logout {
  display: flex; align-items: center; gap: .4rem;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  color: #374151;
  font-size: .8rem;
  font-weight: 500;
  padding: .35rem .8rem;
  cursor: pointer;
  transition: var(--transition);
  text-decoration: none;
}
.btn-logout:hover { background: #fef2f2; border-color: #fca5a5; color: #dc2626; }

/* ── Layout ── */
.app-layout { display: flex; min-height: calc(100vh - var(--navbar-h)); }

/* ── Sidebar ── */
.app-sidebar {
  width: var(--sidebar-width);
  min-width: var(--sidebar-width);
  background: var(--sidebar-bg);
  border-right: 1px solid #e5e7eb;
  padding: 1.25rem .75rem;
  overflow-y: auto;
  position: sticky;
  top: var(--navbar-h);
  height: calc(100vh - var(--navbar-h));
  flex-shrink: 0;
}
.sidebar-section {
  font-size: .65rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: .1em;
  color: #4b5563;
  padding: .9rem .6rem .3rem;
  margin-top: .25rem;
}
.sidebar-section:first-child { padding-top: .1rem; }
.sidebar-link {
  display: flex;
  align-items: center;
  gap: .6rem;
  padding: .48rem .75rem;
  border-radius: 8px;
  color: var(--text-sidebar);
  text-decoration: none;
  font-size: .82rem;
  font-weight: 500;
  transition: var(--transition);
  margin-bottom: 1px;
  position: relative;
}
.sidebar-link i { font-size: .9rem; width: 18px; flex-shrink: 0; }
.sidebar-link:hover {
  background: #eff6ff;
  color: #2563eb;
}
.sidebar-link.active {
  background: #eff6ff;
  color: #2563eb;
  font-weight: 600;
}
.sidebar-link.active::before {
  content: '';
  position: absolute;
  left: 0; top: 20%; bottom: 20%;
  width: 3px;
  background: var(--accent);
  border-radius: 0 3px 3px 0;
}
.sidebar-link.active i { color: #2563eb; }

/* ── Main content ── */
.app-main {
  flex: 1;
  padding: 1.75rem 2rem;
  min-width: 0;
  overflow-x: hidden;
}

/* ── Page header ── */
.page-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--border);
}
.page-header h5 {
  font-size: 1.15rem;
  font-weight: 700;
  color: var(--text-main);
  margin: 0;
  display: flex;
  align-items: center;
  gap: .5rem;
}
.page-header h5 i { color: var(--accent); }

/* ── Cards ── */
.card {
  border: 1px solid var(--border) !important;
  border-radius: var(--radius) !important;
  box-shadow: var(--shadow-sm) !important;
  background: var(--surface);
  overflow: hidden;
}
.card-header {
  background: var(--surface) !important;
  border-bottom: 1px solid var(--border) !important;
  padding: .85rem 1.1rem !important;
  font-weight: 600 !important;
  font-size: .875rem !important;
  color: var(--text-main) !important;
  border-radius: 0 !important;
}
.card-header.bg-primary  { background: linear-gradient(135deg,#6366f1,#4f46e5) !important; color:#fff !important; border:none !important; }
.card-header.bg-success  { background: linear-gradient(135deg,#10b981,#059669) !important; color:#fff !important; border:none !important; }
.card-header.bg-warning  { background: linear-gradient(135deg,#f59e0b,#d97706) !important; color:#fff !important; border:none !important; }
.card-header.bg-info     { background: linear-gradient(135deg,#3b82f6,#2563eb) !important; color:#fff !important; border:none !important; }
.card-header.bg-danger   { background: linear-gradient(135deg,#ef4444,#dc2626) !important; color:#fff !important; border:none !important; }
.card-header.bg-dark     { background: linear-gradient(135deg,#1f2937,#111827) !important; color:#fff !important; border:none !important; }
.card-body { padding: 1.1rem; }

/* ── Stat cards ── */
.stat-card {
  border: 1px solid var(--border) !important;
  border-radius: var(--radius) !important;
  background: var(--surface);
  padding: 1.25rem 1rem;
  text-align: center;
  transition: var(--transition);
  box-shadow: var(--shadow-sm) !important;
}
.stat-card:hover { transform: translateY(-2px); box-shadow: var(--shadow-md) !important; }
.stat-card .stat-icon { font-size: 1.8rem; margin-bottom: .4rem; }
.stat-card .stat-val { font-size: 1.6rem; font-weight: 800; line-height: 1; color: var(--text-main); }
.stat-card .stat-label { font-size: .75rem; color: var(--text-muted); margin-top: .2rem; font-weight: 500; }

/* ── Tables ── */
.table { font-size: .84rem; }
.table th {
  font-size: .75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: .04em;
  color: var(--text-muted);
  background: #f9fafb;
  border-bottom: 1px solid var(--border) !important;
  padding: .65rem 1rem;
}
.table td { padding: .65rem 1rem; border-color: #f3f4f6; vertical-align: middle; }
.table-hover tbody tr:hover { background: #f9fafb; }
.table-dark th { background: #1f2937 !important; color: #e5e7eb !important; font-size: .73rem; }

/* ── Buttons ── */
.btn { border-radius: 8px; font-weight: 500; font-size: .84rem; transition: var(--transition); }
.btn-primary { background: var(--accent); border-color: var(--accent); }
.btn-primary:hover { background: var(--accent-hover); border-color: var(--accent-hover); box-shadow: 0 4px 12px var(--accent-glow); }
.btn-sm { font-size: .78rem; padding: .3rem .65rem; border-radius: 6px; }
.btn-outline-primary { color: var(--accent); border-color: var(--accent); }
.btn-outline-primary:hover { background: var(--accent); border-color: var(--accent); }

/* ── Forms ── */
.form-control, .form-select {
  border-radius: 8px;
  border: 1px solid #d1d5db;
  font-size: .875rem;
  padding: .45rem .75rem;
  transition: var(--transition);
}
.form-control:focus, .form-select:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 3px var(--accent-glow);
}
.form-label { font-weight: 600; font-size: .8rem; color: #374151; margin-bottom: .35rem; }
.input-group-text { background: #f9fafb; border-color: #d1d5db; color: var(--text-muted); border-radius: 8px 0 0 8px; }

/* ── Badges ── */
.badge { font-size: .72rem; font-weight: 600; border-radius: 6px; padding: .28em .6em; }

/* ── Alerts ── */
.alert { border-radius: var(--radius); border: none; font-size: .875rem; }
.alert-success { background: #ecfdf5; color: #065f46; }
.alert-danger  { background: #fef2f2; color: #991b1b; }
.alert-info    { background: #eff6ff; color: #1e40af; }
.alert-warning { background: #fffbeb; color: #92400e; }

/* ── Progress ── */
.progress { border-radius: 99px; background: #f3f4f6; }
.progress-bar { border-radius: 99px; }

/* ── Hash text ── */
.hash-text { font-family: 'JetBrains Mono', 'Fira Code', monospace; font-size: .7rem; word-break: break-all; }

/* ── Misc ── */
.text-accent { color: var(--accent) !important; }
.border-accent { border-color: var(--accent) !important; }
</style>
</head>
<body>
<?php
}

function renderNavbar(): void {
    $r = role(); $fn = fullName();
    $avatarColors  = ['admin'=>'#2563eb','lecturer'=>'#059669','student'=>'#d97706'];
    $roleBgColors  = ['admin'=>'#dbeafe', 'lecturer'=>'#d1fae5', 'student'=>'#fef3c7'];
    $roleTextColors= ['admin'=>'#1d4ed8', 'lecturer'=>'#065f46', 'student'=>'#92400e'];
    $avatarBg  = $avatarColors[$r]  ?? '#6b7280';
    $roleBg    = $roleBgColors[$r]  ?? '#f3f4f6';
    $roleText  = $roleTextColors[$r]?? '#374151';
    $initials  = strtoupper(mb_substr($fn, 0, 1, 'UTF-8'));
?>
<nav class="app-navbar">
  <a class="brand" href="index.php?page=dashboard">
    <div class="brand-icon">
      <i class="bi bi-shield-lock-fill" style="font-size:1rem;color:#fff"></i>
    </div>
    <div class="brand-text">
      <span class="brand-name"><?php echo APP_NAME; ?></span>
      <span class="brand-sub">Secure Grading System</span>
    </div>
  </a>
  <div class="nav-right ms-auto">
    <?php if ($r): ?>
      <?php 
        $unreadCount = NotificationModel::getUnreadCount(uid());
        $badgeHtml = $unreadCount > 0 ? "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger' style='font-size:0.6rem; padding: 0.25em 0.45em;'>$unreadCount</span>" : "";
      ?>
      <a href="index.php?page=notifications" class="btn position-relative p-2 rounded-circle me-1 border-0" style="width:36px; height:36px; display:flex; align-items:center; justify-content:center; background:#f1f5f9; color:#475569;" title="Notifications">
        <i class="bi bi-bell-fill" style="font-size: 0.95rem;"></i>
        <?php echo $badgeHtml; ?>
      </a>
      <div class="user-pill">
        <div class="avatar" style="background:<?php echo $avatarBg; ?>"><?php echo $initials; ?></div>
        <div class="user-info">
          <span class="user-name"><?php echo h($fn); ?></span>
          <span class="role-tag" style="background:<?php echo $roleBg; ?>;color:<?php echo $roleText; ?>"><?php echo ucfirst($r); ?></span>
        </div>
      </div>
      <form method="POST" class="d-inline">
        <input type="hidden" name="csrf_token" value="<?php echo Auth::getCsrfToken(); ?>">
        <input type="hidden" name="_action" value="logout">
        <button class="btn-logout" type="submit">
          <i class="bi bi-box-arrow-right"></i>Logout
        </button>
      </form>
    <?php endif; ?>
  </div>
</nav>
<?php
}

function renderSidebar(): void {
    $r = role();
?>
<aside class="app-sidebar">
<?php if ($r === 'admin'): ?>
  <div class="sidebar-section">Overview</div>
  <?php navLink('dashboard','speedometer2','Dashboard'); ?>
  <?php navLink('notifications','bell','Notifications'); ?>
  <div class="sidebar-section">Academic</div>
  <?php navLink('programs','mortarboard','Programs'); ?>
  <?php navLink('subjects','book','Subjects'); ?>
  <?php navLink('plos','bullseye','PLOs'); ?>
  <?php navLink('clos','diagram-3','CLOs'); ?>
  <?php navLink('clo_matrix','grid-3x3','CLO-PLO Matrix'); ?>
  <div class="sidebar-section">Users</div>
  <?php navLink('users','people','Manage Users'); ?>
  <?php navLink('enrollments','person-check','Enrollments'); ?>
  <div class="sidebar-section">Security</div>
  <?php navLink('ledger','link-45deg','Ledger'); ?>
  <?php navLink('verify_ledger','shield-check','Verify Ledger'); ?>
  <?php navLink('audit_logs','journal-text','Audit Logs'); ?>
  <?php navLink('grade_requests','arrow-repeat','Grade Change Requests'); ?>
<?php elseif ($r === 'lecturer'): ?>
  <div class="sidebar-section">Overview</div>
  <?php navLink('dashboard','speedometer2','Dashboard'); ?>
  <?php navLink('notifications','bell','Notifications'); ?>
  <div class="sidebar-section">Grading</div>
  <?php navLink('assessments','clipboard-check','Assessments'); ?>
  <?php navLink('rubrics','list-check','Rubrics'); ?>
  <?php navLink('grade','pencil-square','Enter Grades'); ?>
  <?php navLink('my_requests','arrow-repeat','My Change Requests'); ?>
<?php elseif ($r === 'student'): ?>
  <div class="sidebar-section">Overview</div>
  <?php navLink('dashboard','speedometer2','Dashboard'); ?>
  <?php navLink('notifications','bell','Notifications'); ?>
  <div class="sidebar-section">My Grades</div>
  <?php navLink('grades','bar-chart','My Grades'); ?>
  <?php navLink('clo_report','file-earmark-text','CLO Report'); ?>
<?php endif; ?>
</aside>
<?php
}

function renderFlash(): void {
    $s = getFlash('success'); $e = getFlash('error');
    if (!$s && !$e) return;

    // Inline alert (for in-page context)
    if ($s) echo "<div class='alert alert-success alert-dismissible fade show' role='alert'>".h($s)."<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";
    if ($e) echo "<div class='alert alert-danger  alert-dismissible fade show' role='alert'>".h($e)."<button type='button' class='btn-close' data-bs-dismiss='alert'></button></div>";

    // Fixed toast notification (always visible regardless of scroll position)
    $toastMsg   = $s ?: $e;
    $toastType  = $s ? 'success' : 'error';
    $toastIcon  = $s ? 'check-circle-fill' : 'exclamation-triangle-fill';
    $toastBg    = $s ? '#ecfdf5' : '#fef2f2';
    $toastBorder= $s ? '#10b981' : '#ef4444';
    $toastColor = $s ? '#065f46' : '#991b1b';
    echo "
    <div id='flash-toast' style='
        position:fixed; bottom:1.5rem; right:1.5rem; z-index:99999;
        background:{$toastBg}; border:1.5px solid {$toastBorder}; border-radius:12px;
        padding:0.85rem 1.25rem; display:flex; align-items:center; gap:0.75rem;
        box-shadow:0 8px 30px rgba(0,0,0,0.12); max-width:380px; min-width:260px;
        animation: toastSlideIn 0.35s cubic-bezier(0.16,1,0.3,1) forwards;
    '>
        <i class='bi bi-{$toastIcon}' style='font-size:1.3rem; color:{$toastBorder}; flex-shrink:0;'></i>
        <span style='font-size:0.87rem; font-weight:600; color:{$toastColor}; flex:1;'>" . h($toastMsg) . "</span>
        <button onclick=\"document.getElementById('flash-toast').remove()\" style='
            background:none; border:none; font-size:1.1rem; cursor:pointer;
            color:{$toastColor}; opacity:0.6; padding:0; line-height:1; flex-shrink:0;
        '>&times;</button>
    </div>
    <style>
    @keyframes toastSlideIn {
        from { opacity:0; transform:translateY(20px) scale(0.95); }
        to   { opacity:1; transform:translateY(0)    scale(1); }
    }
    </style>
    <script>
    setTimeout(function() {
        var t = document.getElementById('flash-toast');
        if (t) {
            t.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
            t.style.opacity = '0';
            t.style.transform = 'translateY(10px)';
            setTimeout(function() { if (t) t.remove(); }, 400);
        }
    }, 5000);
    </script>";
}

function pageStart(string $title, string $icon, string $iconColor='text-primary'): void {
    echo "<div class='page-header'>";
    echo "<h5><i class='bi bi-$icon'></i>".h($title)."</h5>";
    echo "</div>";
    renderFlash();
}

function layoutStart(): void {
    renderHead(); renderNavbar();
    echo "<div class='app-layout'>";
    renderSidebar();
    echo "<main class='app-main'>";
}

function layoutEnd(): void {
    echo "</main></div>";
    echo "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js'></script>";
    echo "<script>setTimeout(()=>{document.querySelectorAll('.alert-dismissible').forEach(a=>{let b=bootstrap.Alert.getOrCreateInstance(a);setTimeout(()=>b.close(),4000)})},100)</script>";
    echo "</body></html>";
}
