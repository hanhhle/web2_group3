<?php
// ── STUDENT/LECTURER/ADMIN: SIGN IN GATEWAY ─────────────────
function pageLOGIN(): void {
    $err = getFlash('error');
?>
<!DOCTYPE html><html lang="en"><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title><?php echo APP_NAME; ?> — Sign In</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box}
body{font-family:'Inter',system-ui,sans-serif;margin:0;min-height:100vh;display:flex;background:#0f1117;-webkit-font-smoothing:antialiased}
.login-left{flex:1;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:3rem;position:relative;overflow:hidden}
.login-left::before{content:'';position:absolute;inset:0;background:radial-gradient(ellipse 80% 60% at 50% 0%,rgba(99,102,241,.35),transparent),radial-gradient(ellipse 60% 50% at 80% 100%,rgba(139,92,246,.2),transparent);pointer-events:none}
.login-right{width:480px;min-width:480px;background:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:3.5rem 3rem}
.brand-logo{width:52px;height:52px;background:linear-gradient(135deg,#6366f1,#818cf8);border-radius:14px;display:flex;align-items:center;justify-content:center;font-size:1.5rem;color:#fff;box-shadow:0 0 0 6px rgba(99,102,241,.2),0 8px 24px rgba(99,102,241,.4);margin-bottom:1.5rem}
.hero-title{font-size:2.2rem;font-weight:800;color:#fff;text-align:center;line-height:1.2;margin-bottom:.75rem}
.hero-title span{background:linear-gradient(135deg,#818cf8,#c4b5fd);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.hero-sub{color:#9ca3af;text-align:center;font-size:.95rem;max-width:340px;line-height:1.7}
.feature-list{margin-top:2.5rem;display:flex;flex-direction:column;gap:.75rem;width:100%;max-width:340px}
.feature-item{display:flex;align-items:center;gap:.75rem;color:#d1d5db;font-size:.875rem}
.feature-icon{width:32px;height:32px;border-radius:8px;display:flex;align-items:center;justify-content:center;font-size:.85rem;flex-shrink:0}
.login-form-title{font-size:1.5rem;font-weight:800;color:#111827;margin-bottom:.35rem;text-align:center}
.login-form-sub{color:#6b7280;font-size:.875rem;text-align:center;margin-bottom:2rem}
.form-label{font-weight:600;font-size:.8rem;color:#374151;margin-bottom:.35rem;display:block}
.form-control{width:100%;border:1.5px solid #e5e7eb;border-radius:10px;padding:.6rem .9rem;font-size:.875rem;font-family:inherit;transition:all .18s;outline:none;color:#111827}
.form-control:focus{border-color:#6366f1;box-shadow:0 0 0 3px rgba(99,102,241,.15)}
.input-wrap{position:relative;margin-bottom:1.1rem}
.input-icon{position:absolute;left:.85rem;top:50%;transform:translateY(-50%);color:#9ca3af;font-size:.9rem;pointer-events:none}
.input-wrap .form-control{padding-left:2.4rem}
.btn-signin{width:100%;background:linear-gradient(135deg,#6366f1,#4f46e5);color:#fff;border:none;border-radius:10px;padding:.75rem;font-size:.95rem;font-weight:700;font-family:inherit;cursor:pointer;transition:all .2s;margin-top:.5rem;display:flex;align-items:center;justify-content:center;gap:.5rem}
.btn-signin:hover{background:linear-gradient(135deg,#4f46e5,#4338ca);box-shadow:0 8px 24px rgba(99,102,241,.4);transform:translateY(-1px)}
.btn-signin:active{transform:translateY(0)}
.divider{display:flex;align-items:center;gap:.75rem;margin:1.5rem 0;color:#d1d5db;font-size:.8rem}
.divider::before,.divider::after{content:'';flex:1;height:1px;background:#e5e7eb}
.demo-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:.5rem}
.demo-btn{background:#f9fafb;border:1.5px solid #e5e7eb;border-radius:8px;padding:.5rem .4rem;text-align:center;cursor:pointer;transition:all .18s;font-family:inherit}
.demo-btn:hover{border-color:#6366f1;background:#eef2ff}
.demo-btn .role{font-size:.65rem;font-weight:700;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.15rem}
.demo-btn .uname{font-size:.78rem;font-weight:600;color:#374151}
.alert-err{background:#fef2f2;border:1px solid #fecaca;border-radius:10px;padding:.65rem .9rem;color:#991b1b;font-size:.84rem;margin-bottom:1rem;display:flex;align-items:center;gap:.5rem}
@media(max-width:768px){.login-left{display:none}.login-right{width:100%;min-width:0;padding:2rem 1.5rem}}
</style>
</head>
<body>
<!-- LEFT PANEL -->
<div class="login-left">
  <div class="brand-logo"><i class="bi bi-shield-lock-fill"></i></div>
  <div class="hero-title">Secure University<br><span>Grading System</span></div>
  <div class="hero-sub">A blockchain-inspired ledger system ensuring tamper-proof academic records for VNU-IS.</div>
  <div class="feature-list">
    <div class="feature-item">
      <div class="feature-icon" style="background:rgba(99,102,241,.15)"><i class="bi bi-shield-check" style="color:#818cf8"></i></div>
      <span>SHA-256 hash chain — tamper detection</span>
    </div>
    <div class="feature-item">
      <div class="feature-icon" style="background:rgba(16,185,129,.15)"><i class="bi bi-people" style="color:#6ee7b7"></i></div>
      <span>Role-based access: Admin, Lecturer, Student</span>
    </div>
    <div class="feature-item">
      <div class="feature-icon" style="background:rgba(245,158,11,.15)"><i class="bi bi-diagram-3" style="color:#fcd34d"></i></div>
      <span>CLO-PLO mapping &amp; attainment reports</span>
    </div>
    <div class="feature-item">
      <div class="feature-icon" style="background:rgba(59,130,246,.15)"><i class="bi bi-journal-text" style="color:#93c5fd"></i></div>
      <span>Full audit trail on every action</span>
    </div>
  </div>
</div>

<!-- RIGHT PANEL -->
<div class="login-right">
  <div class="login-form-title">Welcome back</div>
  <div class="login-form-sub">Sign in to your account to continue</div>

  <?php if ($err): ?>
    <div class="alert-err"><i class="bi bi-exclamation-triangle-fill"></i><?php echo h($err); ?></div>
  <?php endif; ?>

  <form method="POST" style="width:100%">
    <input type="hidden" name="_action" value="login">
    <div>
      <label class="form-label">Username</label>
      <div class="input-wrap">
        <i class="bi bi-person input-icon"></i>
        <input type="text" name="username" class="form-control" placeholder="Enter your username" required autofocus>
      </div>
    </div>
    <div>
      <label class="form-label">Password</label>
      <div class="input-wrap">
        <i class="bi bi-lock input-icon"></i>
        <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
      </div>
    </div>
    <button type="submit" class="btn-signin">
      <i class="bi bi-box-arrow-in-right"></i>Sign In
    </button>
  </form>

 

<script>
function fillLogin(u,p){
  document.querySelector('input[name=username]').value=u;
  document.querySelector('input[name=password]').value=p;
}
</script>
</body></html>
<?php
}
