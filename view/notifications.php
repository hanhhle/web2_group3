<?php
declare(strict_types=1);

function pageNOTIFICATIONS(array $myInbox = [], array $allNotifs = [], array $recipients = [], bool $isAdmin = false): void {
    requirePermission('view_notifications');
    layoutStart();
    $csrf = Auth::getCsrfToken();
    ?>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap');
        
        .notif-container {
            max-width: 1100px;
            margin: 2rem auto;
            padding: 0 1.5rem;
            font-family: 'Plus Jakarta Sans', sans-serif !important;
        }
        
        .page-header-luxury {
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 1.5rem;
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .page-header-luxury h4 {
            font-size: 1.5rem;
            font-weight: 700;
            color: #0f172a;
            letter-spacing: -0.02em;
            margin: 0;
        }
        
        /* Custom Premium Tabs */
        .notif-tabs {
            display: flex;
            gap: 0.5rem;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 2rem;
            padding-bottom: 0.5rem;
        }
        .notif-tab-btn {
            background: none;
            border: none;
            padding: 0.6rem 1.2rem;
            font-size: 0.88rem;
            font-weight: 600;
            color: #64748b;
            border-radius: 10px;
            transition: all 0.2s ease;
            cursor: pointer;
        }
        .notif-tab-btn:hover {
            background: #f1f5f9;
            color: #0f172a;
        }
        .notif-tab-btn.active {
            background: #0f172a;
            color: #ffffff;
        }
        
        /* Notification Inbox Cards */
        .notif-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.01);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            overflow: hidden;
            display: flex;
            gap: 1.25rem;
        }
        .notif-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 24px rgba(0,0,0,0.03);
            border-color: #cbd5e1;
        }
        .notif-card.unread {
            border-left: 4px solid #3b82f6;
            background: #fcfdfe;
        }
        .notif-card.fade-out {
            opacity: 0;
            transform: scale(0.95) translateY(10px);
            transition: all 0.35s ease;
        }
        
        /* Type Icons */
        .notif-icon-box {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            flex-shrink: 0;
        }
        .icon-info { background: #eff6ff; color: #3b82f6; }
        .icon-success { background: #ecfdf5; color: #10b981; }
        .icon-warning { background: #fffbeb; color: #f59e0b; }
        .icon-danger { background: #fef2f2; color: #ef4444; }
        
        /* Card details */
        .notif-body {
            flex-grow: 1;
        }
        .notif-title-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.35rem;
            gap: 1rem;
        }
        .notif-title {
            font-size: 1rem;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
        }
        .notif-time {
            font-size: 0.72rem;
            color: #94a3b8;
            white-space: nowrap;
        }
        .notif-message {
            font-size: 0.88rem;
            color: #475569;
            margin-bottom: 0.85rem;
            line-height: 1.5;
        }
        .notif-meta {
            font-size: 0.75rem;
            color: #64748b;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        /* AJAX Form Console (Admin) */
        .admin-form-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2.5rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.01);
        }
        .admin-form-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .luxury-field-label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .luxury-field-input, .luxury-field-select {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 0.65rem 1rem;
            font-size: 0.9rem;
            color: #111827;
            transition: all 0.3s ease;
        }
        .luxury-field-input:focus, .luxury-field-select:focus {
            background: #ffffff;
            border-color: #0b1320;
            box-shadow: 0 0 0 4px rgba(11, 19, 32, 0.05);
            outline: none;
        }
        
        .btn-luxury-solid {
            background: #0b1320;
            color: #fff !important;
            border: none;
            border-radius: 10px;
            padding: 0.65rem 1.5rem;
            font-weight: 600;
            font-size: 0.88rem;
            box-shadow: 0 4px 12px rgba(11, 19, 32, 0.1);
            transition: all 0.2s ease;
        }
        .btn-luxury-solid:hover {
            background: #1e293b;
            transform: translateY(-1px);
        }
        
        /* AJAX CRUD Table Styling */
        .luxury-table {
            width: 100%;
            border-collapse: collapse;
        }
        .luxury-table th {
            background: #f8fafc !important;
            color: #64748b;
            font-weight: 600;
            font-size: 0.72rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1rem 1.5rem !important;
            border-bottom: 1px solid #f1f5f9;
        }
        .luxury-table td {
            padding: 1.1rem 1.5rem !important;
            vertical-align: middle;
            color: #1e293b;
            font-size: 0.88rem;
            border-bottom: 1px solid #f1f5f9;
        }
        
        /* Badge actions */
        .btn-action-ajax {
            background: none;
            border: none;
            font-size: 0.82rem;
            font-weight: 600;
            padding: 0.35rem 0.75rem;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }
        .btn-action-dismiss {
            background: #f1f5f9;
            color: #475569;
        }
        .btn-action-dismiss:hover {
            background: #e2e8f0;
            color: #0f172a;
        }
        .btn-action-read {
            background: #eff6ff;
            color: #2563eb;
        }
        .btn-action-read:hover {
            background: #dbeafe;
        }
        .btn-action-delete {
            background: #fef2f2;
            color: #ef4444;
        }
        .btn-action-delete:hover {
            background: #fee2e2;
        }
        .btn-action-edit {
            background: #fcf3e8;
            color: #d97706;
        }
        .btn-action-edit:hover {
            background: #fef3c7;
        }
        
        /* Modal setup */
        .edit-modal-overlay {
            display:none; position:fixed; inset:0; background:rgba(15,23,42,0.4);
            z-index:9999; align-items:center; justify-content:center;
            backdrop-filter: blur(4px);
        }
        .edit-modal-overlay.open { display:flex; }
        .edit-modal {
            background:#fff; border-radius:16px; padding:2rem; width:520px; max-width:95vw;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
            border: 1px solid #e2e8f0;
        }
    </style>

    <div class="notif-container">
        <!-- Header -->
        <div class="page-header-luxury">
            <div>
                <h4><i class="bi bi-bell-fill me-2 text-primary"></i>Notification Center</h4>
            </div>
        </div>

        <!-- Navigation Tabs (only for Admin to handle AJAX CRUD) -->
        <?php if ($isAdmin): ?>
            <div class="notif-tabs">
                <button class="notif-tab-btn active" onclick="switchTab('inbox')">My Inbox</button>
                <button class="notif-tab-btn" onclick="switchTab('crud')">Manage Announcements</button>
            </div>
        <?php endif; ?>

        <!-- TAB 1: INBOX -->
        <div id="tab-inbox" class="tab-content">
            <div id="inbox-list">
                <?php if (empty($myInbox)): ?>
                    <div class="alert alert-info border-0 shadow-sm py-4 text-center">Your notification inbox is currently empty.</div>
                <?php else: ?>
                    <?php foreach ($myInbox as $n): ?>
                        <?php 
                            $unreadClass = $n['is_read'] == 0 ? 'unread' : '';
                            $iconMap = [
                                'info' => 'info-circle-fill',
                                'success' => 'check-circle-fill',
                                'warning' => 'exclamation-triangle-fill',
                                'danger' => 'slash-circle-fill'
                            ];
                            $iconType = $iconMap[$n['type']] ?? 'info-circle-fill';
                            $timeStr = date('d/m/Y H:i', strtotime($n['created_at']));
                        ?>
                        <div class="notif-card <?php echo $unreadClass; ?>" id="notif-card-<?php echo $n['id']; ?>">
                            <div class="notif-icon-box icon-<?php echo h($n['type']); ?>">
                                <i class="bi bi-<?php echo $iconType; ?>"></i>
                            </div>
                            <div class="notif-body">
                                <div class="notif-title-row">
                                    <h5 class="notif-title"><?php echo h($n['title']); ?></h5>
                                    <span class="notif-time"><?php echo $timeStr; ?></span>
                                </div>
                                <div class="notif-message"><?php echo nl2br(h($n['message'])); ?></div>
                                <div class="notif-title-row align-items-center">
                                    <div class="notif-meta">
                                        <span><i class="bi bi-person-circle"></i> Sent by: <strong><?php echo h($n['sender_name'] ?? 'System'); ?></strong></span>
                                        <?php if ($n['user_id'] === null): ?>
                                            <span class="badge bg-secondary-soft text-secondary" style="font-size:0.65rem; border: 1px solid #cbd5e1;"><i class="bi bi-globe"></i> Global Announcement</span>
                                        <?php endif; ?>
                                    </div>
                                    <div class="d-flex gap-2">
                                        <?php if ($n['is_read'] == 0): ?>
                                            <button onclick="ajaxMarkRead(<?php echo $n['id']; ?>)" class="btn-action-ajax btn-action-read" id="btn-read-<?php echo $n['id']; ?>">
                                                <i class="bi bi-check2-circle"></i> Mark as Read
                                            </button>
                                        <?php endif; ?>
                                        <button onclick="ajaxDismiss(<?php echo $n['id']; ?>)" class="btn-action-ajax btn-action-dismiss">
                                            <i class="bi bi-x-lg"></i> Dismiss
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>

        <!-- TAB 2: ADMIN CRUD (Only visible to admin) -->
        <?php if ($isAdmin): ?>
            <div id="tab-crud" class="tab-content" style="display: none;">
                <!-- 2.1 CREATE FORM -->
                <div class="admin-form-card">
                    <div class="admin-form-title">
                        <i class="bi bi-plus-circle text-primary"></i> Create New Notification
                    </div>
                    <form id="createNotifForm" onsubmit="ajaxCreate(event)" class="row g-3">
                        <input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>">
                        <input type="hidden" name="_action" value="notif_create">
                        
                        <div class="col-md-6">
                            <label class="form-label luxury-field-label">Target Recipient</label>
                            <select name="user_id" class="form-select luxury-field-select">
                                <option value="">-- Global (Send to all users) --</option>
                                <?php foreach ($recipients as $r): ?>
                                    <option value="<?php echo $r['id']; ?>">
                                        [<?php echo ucfirst($r['role']); ?>] <?php echo h($r['full_name']); ?> (@<?php echo h($r['username']); ?>)
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        
                        <div class="col-md-6">
                            <label class="form-label luxury-field-label">Notification Type *</label>
                            <select name="type" class="form-select luxury-field-select" required>
                                <option value="info">Information (Blue)</option>
                                <option value="success">Success (Green)</option>
                                <option value="warning">Warning (Yellow)</option>
                                <option value="danger">Alert/Danger (Red)</option>
                            </select>
                        </div>

                        <div class="col-md-12">
                            <label class="form-label luxury-field-label">Notification Title *</label>
                            <input type="text" name="title" class="form-control luxury-field-input" required placeholder="e.g. System Maintenance Window">
                        </div>

                        <div class="col-md-12">
                            <label class="form-label luxury-field-label">Message Details *</label>
                            <textarea name="message" class="form-control luxury-field-input" rows="3" required placeholder="Enter the announcement message..."></textarea>
                        </div>

                        <div class="col-md-12 text-end mt-4">
                            <button type="submit" class="btn btn-luxury-solid"><i class="bi bi-send me-1.5"></i>Broadcast Notification</button>
                        </div>
                    </form>
                </div>

                <!-- 2.2 LIST TABLE -->
                <div class="card border-0 shadow-sm" style="border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0 !important;">
                    <div class="card-header bg-light py-3" style="font-weight:700 !important; color:#0f172a !important;">
                        <i class="bi bi-list-task me-1.5 text-primary"></i> Broadcast History
                    </div>
                    <div class="table-responsive">
                        <table class="table luxury-table" id="adminNotifsTable">
                            <thead>
                                <tr>
                                    <th style="width: 8%">ID</th>
                                    <th style="width: 15%">Recipient</th>
                                    <th style="width: 25%">Title</th>
                                    <th>Message Preview</th>
                                    <th style="width: 10%">Type</th>
                                    <th style="width: 12%">Date</th>
                                    <th style="width: 15%" class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-notif-rows">
                                <?php if (empty($allNotifs)): ?>
                                    <tr id="no-broadcasts-row"><td colspan="7" class="text-center text-muted py-4">No announcements have been broadcasted yet.</td></tr>
                                <?php else: ?>
                                    <?php foreach ($allNotifs as $n): ?>
                                        <tr id="admin-row-<?php echo $n['id']; ?>">
                                            <td class="log-mono">#<?php echo $n['id']; ?></td>
                                            <td class="fw-semibold">
                                                <?php echo $n['recipient_name'] ? h($n['recipient_name']) . " (@" . h($n['recipient_username']) . ")" : '<span class="badge bg-secondary-soft text-secondary"><i class="bi bi-globe"></i> Global</span>'; ?>
                                            </td>
                                            <td class="fw-bold text-dark"><?php echo h($n['title']); ?></td>
                                            <td class="text-muted" style="max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                <?php echo h($n['message']); ?>
                                            </td>
                                            <td>
                                                <span class="badge bg-<?php echo h($n['type']); ?>"><?php echo ucfirst($n['type']); ?></span>
                                            </td>
                                            <td style="font-size:0.75rem; color:#64748b;"><?php echo date('d/m/Y H:i', strtotime($n['created_at'])); ?></td>
                                            <td class="text-center">
                                                <div class="d-flex justify-content-center gap-1">
                                                    <button onclick="openEditModal(<?php echo htmlspecialchars(json_encode($n)); ?>)" class="btn-action-ajax btn-action-edit" title="Edit">
                                                        <i class="bi bi-pencil-square"></i> Edit
                                                    </button>
                                                    <button onclick="ajaxAdminDelete(<?php echo $n['id']; ?>)" class="btn-action-ajax btn-action-delete" title="Delete">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <!-- ── EDIT NOTIFICATION MODAL (Admin only) ── -->
    <?php if ($isAdmin): ?>
        <div class="edit-modal-overlay" id="editModalOverlay" onclick="closeEditModal(event)">
            <div class="edit-modal">
                <h5 class="fw-bold mb-3"><i class="bi bi-pencil-square me-2 text-warning"></i>Edit Notification Details</h5>
                <form id="editNotifForm" onsubmit="ajaxUpdate(event)" class="row g-3">
                    <input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>">
                    <input type="hidden" name="_action" value="notif_update">
                    <input type="hidden" name="id" id="edit_id">

                    <div class="col-md-6">
                        <label class="form-label luxury-field-label">Target Recipient</label>
                        <select name="user_id" id="edit_user_id" class="form-select luxury-field-select">
                            <option value="">-- Global (Send to all users) --</option>
                            <?php foreach ($recipients as $r): ?>
                                <option value="<?php echo $r['id']; ?>">
                                    [<?php echo ucfirst($r['role']); ?>] <?php echo h($r['full_name']); ?> (@<?php echo h($r['username']); ?>)
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label luxury-field-label">Notification Type *</label>
                        <select name="type" id="edit_type" class="form-select luxury-field-select" required>
                            <option value="info">Information (Blue)</option>
                            <option value="success">Success (Green)</option>
                            <option value="warning">Warning (Yellow)</option>
                            <option value="danger">Alert/Danger (Red)</option>
                        </select>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label luxury-field-label">Notification Title *</label>
                        <input type="text" name="title" id="edit_title" class="form-control luxury-field-input" required>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label luxury-field-label">Message Details *</label>
                        <textarea name="message" id="edit_message" class="form-control luxury-field-input" rows="3" required></textarea>
                    </div>

                    <div class="col-md-12 text-end mt-4">
                        <button type="submit" class="btn btn-luxury-solid me-2"><i class="bi bi-save me-1.5"></i>Save Changes</button>
                        <button type="button" class="btn btn-light" onclick="closeEditModal(null)"><i class="bi bi-x me-1"></i>Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    <?php endif; ?>

    <!-- AJAX CRUD CLIENT-SIDE ENGINE -->
    <script>
    // Tab controller
    function switchTab(tab) {
        document.querySelectorAll('.notif-tab-btn').forEach(btn => btn.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(content => content.style.display = 'none');
        
        event.currentTarget.classList.add('active');
        document.getElementById('tab-' + tab).style.display = 'block';
    }

    // Dynamic toast alerts helper
    function showToastAlert(msg, isSuccess = true) {
        // Remove existing toast if any
        var old = document.getElementById('flash-toast');
        if (old) old.remove();

        var toastBg     = isSuccess ? '#ecfdf5' : '#fef2f2';
        var toastBorder = isSuccess ? '#10b981' : '#ef4444';
        var toastColor  = isSuccess ? '#065f46' : '#991b1b';
        var toastIcon   = isSuccess ? 'check-circle-fill' : 'exclamation-triangle-fill';

        var div = document.createElement('div');
        div.id = 'flash-toast';
        div.style = `position:fixed; bottom:1.5rem; right:1.5rem; z-index:99999;
            background:${toastBg}; border:1.5px solid ${toastBorder}; border-radius:12px;
            padding:0.85rem 1.25rem; display:flex; align-items:center; gap:0.75rem;
            box-shadow:0 8px 30px rgba(0,0,0,0.12); max-width:380px; min-width:260px;
            animation: toastSlideIn 0.35s cubic-bezier(0.16,1,0.3,1) forwards;`;
        div.innerHTML = `
            <i class="bi bi-${toastIcon}" style="font-size:1.3rem; color:${toastBorder}; flex-shrink:0;"></i>
            <span style="font-size:0.87rem; font-weight:600; color:${toastColor}; flex:1;">${msg}</span>
            <button onclick="document.getElementById('flash-toast').remove()" style="
                background:none; border:none; font-size:1.1rem; cursor:pointer;
                color:${toastColor}; opacity:0.6; padding:0; line-height:1; flex-shrink:0;
            ">&times;</button>
        `;
        document.body.appendChild(div);

        setTimeout(function() {
            if (div) {
                div.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
                div.style.opacity = '0';
                div.style.transform = 'translateY(10px)';
                setTimeout(function() { if (div) div.remove(); }, 400);
            }
        }, 5000);
    }

    // ── AJAX ACTION: MARK NOTIFICATION AS READ ──
    function ajaxMarkRead(id) {
        var formData = new FormData();
        formData.append('id', id);
        formData.append('csrf_token', '<?php echo $csrf; ?>');
        formData.append('_action', 'notif_mark_read');

        fetch('index.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                // Update CSS styling of the card
                var card = document.getElementById('notif-card-' + id);
                if (card) {
                    card.classList.remove('unread');
                }
                var btn = document.getElementById('btn-read-' + id);
                if (btn) {
                    btn.remove(); // Remove mark-as-read button
                }
                showToastAlert('Notification marked as read.');
                // Refresh unread count in Navbar dynamically
                refreshUnreadCount();
            } else {
                showToastAlert(data.message || 'Error occurred.', false);
            }
        })
        .catch(err => {
            showToastAlert('Server communication error.', false);
        });
    }

    // ── AJAX ACTION: DISMISS (DELETE FOR STUDENTS/LECTURERS) ──
    function ajaxDismiss(id) {
        var formData = new FormData();
        formData.append('id', id);
        formData.append('csrf_token', '<?php echo $csrf; ?>');
        formData.append('_action', 'notif_delete');

        fetch('index.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                var card = document.getElementById('notif-card-' + id);
                if (card) {
                    card.classList.add('fade-out');
                    setTimeout(() => {
                        card.remove();
                        // Check if inbox is now empty
                        var inbox = document.getElementById('inbox-list');
                        if (inbox && inbox.children.length === 0) {
                            inbox.innerHTML = `<div class="alert alert-info border-0 shadow-sm py-4 text-center">Your notification inbox is currently empty.</div>`;
                        }
                    }, 350);
                }
                showToastAlert('Notification dismissed.');
                refreshUnreadCount();
            } else {
                showToastAlert(data.message || 'Error occurred.', false);
            }
        })
        .catch(err => {
            showToastAlert('Server communication error.', false);
        });
    }

    // Refresh unread badge counter in Navbar
    function refreshUnreadCount() {
        fetch('index.php?page=notifications&_api=list')
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                // Find target bell badge in DOM
                var bell = document.querySelector('.btn[title="Notifications"]');
                if (bell) {
                    // Remove existing badge
                    var badge = bell.querySelector('.badge');
                    if (badge) badge.remove();

                    if (data.unread_count > 0) {
                        var newBadge = document.createElement('span');
                        newBadge.className = 'position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger';
                        newBadge.style = 'font-size:0.6rem; padding: 0.25em 0.45em;';
                        newBadge.textContent = data.unread_count;
                        bell.appendChild(newBadge);
                    }
                }
            }
        });
    }

    // ── AJAX CRUD ACTION: ADMIN CREATE ──
    function ajaxCreate(e) {
        e.preventDefault();
        var form = e.target;
        var formData = new FormData(form);

        fetch('index.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                showToastAlert('Announcement broadcasted successfully.');
                form.reset();
                // Reload list table dynamically
                reloadAdminTable();
                refreshUnreadCount();
            } else {
                showToastAlert(data.message || 'Failed to create.', false);
            }
        })
        .catch(err => {
            showToastAlert('Server communication error.', false);
        });
    }

    // ── AJAX CRUD ACTION: ADMIN DELETE ──
    function ajaxAdminDelete(id) {
        if (!confirm('Are you sure you want to delete this broadcast? It will be removed from recipient inboxes.')) {
            return;
        }

        var formData = new FormData();
        formData.append('id', id);
        formData.append('csrf_token', '<?php echo $csrf; ?>');
        formData.append('_action', 'notif_delete');

        fetch('index.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                var row = document.getElementById('admin-row-' + id);
                if (row) {
                    row.remove();
                    // If no broadcasts left
                    var rows = document.getElementById('admin-notif-rows');
                    if (rows && rows.children.length === 0) {
                        rows.innerHTML = `<tr id="no-broadcasts-row"><td colspan="7" class="text-center text-muted py-4">No announcements have been broadcasted yet.</td></tr>`;
                    }
                }
                showToastAlert('Broadcast removed.');
                refreshUnreadCount();
            } else {
                showToastAlert(data.message || 'Failed to delete.', false);
            }
        })
        .catch(err => {
            showToastAlert('Server communication error.', false);
        });
    }

    // Modal helpers
    function openEditModal(notif) {
        document.getElementById('edit_id').value = notif.id;
        document.getElementById('edit_user_id').value = notif.user_id || '';
        document.getElementById('edit_type').value = notif.type;
        document.getElementById('edit_title').value = notif.title;
        document.getElementById('edit_message').value = notif.message;
        document.getElementById('editModalOverlay').classList.add('open');
    }
    
    function closeEditModal(e) {
        if (e === null || e.target === document.getElementById('editModalOverlay')) {
            document.getElementById('editModalOverlay').classList.remove('open');
        }
    }

    // ── AJAX CRUD ACTION: ADMIN UPDATE ──
    function ajaxUpdate(e) {
        e.preventDefault();
        var form = e.target;
        var formData = new FormData(form);

        fetch('index.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                showToastAlert('Broadcast details updated.');
                document.getElementById('editModalOverlay').classList.remove('open');
                reloadAdminTable();
            } else {
                showToastAlert(data.message || 'Failed to update.', false);
            }
        })
        .catch(err => {
            showToastAlert('Server communication error.', false);
        });
    }

    // Fetch and redraw Admin Table rows dynamically via JSON list endpoint
    function reloadAdminTable() {
        // Simulating reload for simple DOM rendering:
        window.location.reload();
    }
    </script>
    <?php
    layoutEnd();
}
