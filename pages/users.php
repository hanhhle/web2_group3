<?php
// ── ADMIN: USERS ─────────────────────────────────────────────
function pageUSERS(): void {
    requireRole('admin');
    layoutStart();
    
    // Hệ thống CSS tùy biến: Sang trọng, tối giản, phân cấp rõ ràng
    echo "<style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body { 
            background: #fbfbfd !important; 
            color: #111827; 
            font-family: 'Inter', -apple-system, sans-serif !important;
        }

        /* Console điều khiển nhập liệu */
        .academic-console {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.01), 0 12px 30px rgba(0, 0, 0, 0.02);
            padding: 2rem !important;
            margin-bottom: 3rem !important;
        }

        .console-header-text {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #6b7280;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .academic-field-label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .academic-field-input, .academic-field-select {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.65rem 1rem;
            font-size: 0.9rem;
            color: #111827;
            transition: all 0.3s ease;
        }

        .academic-field-input:focus {
            background: #ffffff;
            border-color: #0b1320;
            box-shadow: 0 0 0 4px rgba(11, 19, 32, 0.05);
            outline: none;
        }

        /* Nút bấm chính */
        .btn-luxury-solid {
            background: #0b1320;
            color: #fff !important;
            border: none;
            border-radius: 10px;
            padding: 0.65rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-luxury-solid:hover {
            background: #1f2937;
            transform: translateY(-1px);
        }

        /* Container bảng */
        .academic-ledger-container {
            background: #ffffff;
            border: 1px solid rgba(0, 0, 0, 0.04);
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.02);
            overflow: hidden;
        }

        .luxury-table {
            width: 100%;
            border-collapse: collapse;
        }

        .luxury-table th {
            background: #ffffff !important;
            color: #6b7280;
            font-weight: 600;
            font-size: 0.72rem;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            padding: 1.25rem 2rem !important;
            border-bottom: 1px solid #f3f4f6;
        }

        .luxury-table td {
            padding: 1.2rem 2rem !important;
            vertical-align: middle;
            font-size: 0.9rem;
            border-bottom: 1px solid #f3f4f6;
        }

        /* Badge vai trò (Role) phong cách Pastel Luxury */
        .role-badge {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            padding: 0.35rem 0.75rem;
            border-radius: 6px;
            letter-spacing: 0.5px;
        }
        .role-admin { background: #fef2f2; color: #991b1b; border: 1px solid #fee2e2; }
        .role-lecturer { background: #eff6ff; color: #1e40af; border: 1px solid #dbeafe; }
        .role-student { background: #f0fdf4; color: #16a34a; border: 1px solid #dcfce7; }

        /* Nút hành động dạng kén */
        .action-link-premium {
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            padding: 0.45rem 0.9rem;
            border-radius: 8px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            transition: all 0.2s ease;
        }
        .action-link-premium.edit { color: #1e40af; background: #eff6ff; border: 1px solid #dbeafe; }
        .action-link-premium.edit:hover { background: #1e40af; color: #fff !important; }
        
        .action-link-premium.delete { color: #991b1b; background: #fef2f2; border: 1px solid #fee2e2; margin-left: 0.5rem; }
        .action-link-premium.delete:hover { background: #dc2626; color: #fff !important; }
        .action-link-premium button { background: none; border: none; color: inherit; padding: 0; cursor: pointer; display: flex; align-items: center; font: inherit; }

        .user-avatar-circle {
            width: 35px;
            height: 35px;
            background: #f3f4f6;
            color: #4b5563;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            margin-right: 12px;
            border: 1px solid #e5e7eb;
        }
    </style>";

    pageStart('Manage Users', 'people', 'text-danger');

    $users = qAll("SELECT * FROM users ORDER BY role, id");
    $editUser = isset($_GET['edit']) ? qOne("SELECT * FROM users WHERE id=?", [(int)$_GET['edit']]) : null;
    $isEdit = (bool)$editUser;
    $hdr = $isEdit ? 'Modify User Identity' : 'Register New User';
    $act = $isEdit ? 'user_edit' : 'user_create';

    // ── BIỂU MẪU ĐIỀU KHIỂN (Console Form) ──
    echo "<div class='card academic-console'>";
    echo "<div class='console-header-text'><i class='bi bi-person-badge-fill me-2'></i>$hdr</div>";
    echo "<div class='card-body p-0'>";
    echo "<form method='POST' class='row g-3 align-items-end'><input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='$act'>";
    
    if ($isEdit) echo "<input type='hidden' name='id' value='{$editUser['id']}'>";
    
    if (!$isEdit) {
        echo "<div class='col-md-2'><label class='academic-field-label'>Username *</label><input type='text' name='username' class='form-control academic-field-input' required></div>";
    }
    
    $fn = h($editUser['full_name'] ?? ''); 
    $em = h($editUser['email'] ?? '');
    
    echo "<div class='col-md-3'><label class='academic-field-label'>Full Name *</label><input type='text' name='full_name' class='form-control academic-field-input' value='$fn' required></div>";
    echo "<div class='col-md-3'><label class='academic-field-label'>Email Address *</label><input type='email' name='email' class='form-control academic-field-input' value='$em' required></div>";
    
    $pwLabel = $isEdit ? 'Password (Leave blank to keep)' : 'Secure Password *';
    $pwReq = $isEdit ? '' : 'required';
    echo "<div class='col-md-2'><label class='academic-field-label'>$pwLabel</label><input type='password' name='password' class='form-control academic-field-input' placeholder='8+ chars, mix case, symb' $pwReq></div>";
    
    $selRole = $editUser['role'] ?? 'student';
    echo "<div class='col-md-2'><label class='academic-field-label'>Access Role *</label><select name='role' class='form-select academic-field-select' required>";
    foreach (['student','lecturer','admin'] as $rv) {
        $sel = $selRole === $rv ? 'selected' : '';
        echo "<option value='$rv' $sel>".ucfirst($rv)."</option>";
    }
    echo "</select></div>";
    
    echo "<div class='col-12 d-flex gap-2 mt-2'>";
    echo "<button type='submit' class='btn btn-luxury-solid'><i class='bi bi-shield-check me-2'></i>".($isEdit?'Update Profile':'Authorize User')."</button>";
    if ($isEdit) echo "<a href='index.php?page=users' class='btn btn-outline-secondary btn-sm rounded-pill px-3'>Cancel</a>";
    echo "</div></form></div></div>";

    // ── DANH SÁCH NGƯỜI DÙNG (User Ledger) ──
    echo "<div class='section-sub-title mb-3' style='font-size:0.75rem; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#6b7280;'>System Registry: ".count($users)." Verified Accounts</div>";
    echo "<div class='academic-ledger-container'>";
    echo "<table class='luxury-table'>";
    echo "<thead><tr><th>Identity</th><th>Email</th><th>Role</th><th>Registered</th><th style='text-align:right;'>Actions</th></tr></thead><tbody>";
    
    foreach ($users as $u) {
        $roleClass = 'role-' . $u['role'];
        $initials = strtoupper(mb_substr($u['full_name'], 0, 1, 'UTF-8'));
        
        echo "<tr>";
        echo "<td><div class='d-flex align-items-center'><div class='user-avatar-circle'>$initials</div><div><strong class='text-dark'>".h($u['username'])."</strong><br><small class='text-muted'>".h($u['full_name'])."</small></div></div></td>";
        echo "<td><span class='text-secondary'>".h($u['email'])."</span></td>";
        echo "<td><span class='role-badge $roleClass'>".ucfirst($u['role'])."</span></td>";
        echo "<td class='text-muted'>".date('M d, Y', strtotime($u['created_at']))."</td>";
        
        // Cột Actions
        echo "<td style='text-align:right; white-space:nowrap;'>";
        echo "<a href='index.php?page=users&edit={$u['id']}' class='action-link-premium edit'><i class='bi bi-pencil-square'></i> EDIT</a>";
        
        if ($u['id'] !== uid()) {
            echo "<form method='POST' class='d-inline' onsubmit='return confirm(\"Delete this user?\")'>";
            echo "<input type='hidden' name='csrf_token' value='" . Auth::getCsrfToken() . "'><input type='hidden' name='_action' value='user_delete'><input type='hidden' name='id' value='{$u['id']}'>";
            echo "<button type='submit' class='action-link-premium delete'><i class='bi bi-trash3'></i> DELETE</button></form>";
        } else {
            echo "<span class='badge bg-light text-muted ms-2' style='font-size:0.6rem;'>CURRENT SESSION</span>";
        }
        echo "</td>";
        echo "</tr>";
    }
    
    if (empty($users)) {
        echo "<tr><td colspan='5' class='text-center py-5 text-muted'>No user accounts found.</td></tr>";
    }
    
    echo "</tbody></table></div>";
    
    layoutEnd();
}