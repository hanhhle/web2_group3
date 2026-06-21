<?php
declare(strict_types=1);

function pageVERIFY_LEDGER(?array $result = null): void {
    requirePermission('verify_ledger');
    layoutStart();
    

    ?>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');

        body { 
            background: #ffffff !important; 
            font-family: 'Inter', sans-serif !important; 
            color: #1e293b;
            -webkit-font-smoothing: antialiased;
        }

        .ledger-container {
            max-width: 1000px;
            margin: 4rem auto;
            padding: 0 1.5rem;
        }

        .integrity-header {
            background: #ffffff;
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 3rem;
            margin-bottom: 3rem;
        }
        
        .integrity-header h1 {
            font-size: 1.6rem !important;
            letter-spacing: -0.03em;
            font-weight: 700;
            color: #0f172a;
        }

        .verify-summary { 
            color: #64748b; 
            font-size: 0.88rem;
            max-width: 680px; 
            line-height: 1.8; 
            font-weight: 400;
        }

        .step-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); 
            gap: 1.5rem; 
            margin: 2.5rem 0 0 0; 
        }
        .step-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 1.25rem 1.5rem;
            transition: all 0.2s ease;
        }
        .step-card:hover { 
            border-color: #cbd5e1;
            transform: translateY(-2px);
        }
        .step-num { 
            font-size: 0.65rem; 
            font-weight: 700; 
            text-transform: uppercase; 
            letter-spacing: 2px; 
            color: #94a3b8;
            margin-bottom: 0.5rem; 
        }
        .step-title { 
            font-size: 0.95rem; 
            font-weight: 600; 
            color: #0f172a;
            margin-bottom: 0.25rem; 
        }
        .step-desc {
            font-size: 0.8rem;
            color: #64748b;
        }
        .step-status {
            font-size: 0.8rem;
            font-weight: 500;
            color: #0d9488 !important;
            margin-top: 0.5rem;
        }

        .verify-action-btn {
            background: #0f172a;
            color: #ffffff !important;
            border: none;
            border-radius: 8px;
            padding: 0.85rem 2.2rem;
            font-weight: 500;
            font-size: 0.88rem;
            letter-spacing: 0.3px;
            transition: all 0.2s ease;
        }
        .verify-action-btn:hover { 
            background: #1e293b; 
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.08);
        }

        .result-panel {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            padding: 4rem 2rem;
            animation: fadeIn 0.4s ease-out;
            margin-top: 2rem;
        }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        .status-blob {
            width: 64px; height: 64px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 1.25rem;
            font-size: 1.5rem;
        }
        .status-blob.success { background: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0; }
        .status-blob.danger { background: #fef2f2; color: #dc2626; border: 1px solid #fecaca; }

        .result-title {
            font-size: 1.4rem !important;
            font-weight: 700;
            color: #0f172a;
            letter-spacing: -0.02em;
        }
        .result-desc {
            font-size: 0.88rem;
            color: #64748b;
        }

        .violation-card { 
            border-radius: 16px; 
            border: 1px solid #fee2e2 !important; 
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(220, 38, 38, 0.02);
            animation: fadeIn 0.4s ease-out;
            margin-top: 2rem;
        }
        .violation-card-header { 
            background: #fff5f5; 
            color: #991b1b; 
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid #fee2e2;
        }
        .violation-card-heading { font-size: 0.95rem; font-weight: 600; letter-spacing: -0.01em; }
        .violation-summary { color: #64748b; font-size: 0.88rem; }

        .violation-table { margin-bottom: 0; }
        .violation-table thead th { 
            background: #ffffff !important; 
            color: #64748b !important; 
            padding: 1rem 1.25rem; 
            border-bottom: 1px solid #edf2f7; 
            font-size: 0.72rem; 
            font-weight: 600;
            text-transform: uppercase; 
            letter-spacing: 1px; 
        }
        .violation-table td { 
            padding: 1rem 1.25rem; 
            vertical-align: middle; 
            background: white; 
            border-bottom: 1px solid #f1f5f9; 
            font-size: 0.85rem; 
            color: #334155;
        }
        
        .hash-mono { 
            font-family: 'JetBrains Mono', monospace; 
            font-size: 0.64rem; 
            background: #f8fafc; 
            padding: 4px 8px; 
            border-radius: 6px; 
            display: inline-block;
            border: 1px solid #e2e8f0;
            max-width: 110px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            transition: all 0.15s ease;
        }
        .hash-mono:hover {
            background: #f1f5f9;
            border-color: #cbd5e1;
            color: #2563eb !important;
        }
        .hash-mono.text-success { color: #0f766e !important; background: #f0fdfa; border-color: #ccfbf1; }
        .hash-mono.text-danger { color: #991b1b !important; background: #fef2f2; border-color: #fee2e2; }

        .badge-luxury {
            font-size: 0.75rem;
            font-weight: 500;
            padding: 0.35rem 1rem;
            border-radius: 6px;
            display: inline-block;
        }
        .badge-luxury.bg-success { background: #e6f4ea !important; color: #137333 !important; }
        .badge-luxury.bg-danger { background: #fce8e6 !important; color: #c5221f !important; }

        .val-badge {
            font-family: 'JetBrains Mono', monospace;
            font-weight: 700;
            font-size: 0.8rem;
        }
        .val-badge.text-success { color: #10b981; }
        .val-badge.text-danger { color: #ef4444; }

        /* Self-Healing Container Box (Red Warning Style) */
        .self-heal-box {
            background: linear-gradient(135deg, #fff5f5 0%, #ffffff 100%);
            border-top: 2px solid #fca5a5;
            padding: 2rem;
            text-align: center;
            border-radius: 0 0 16px 16px;
        }
        .self-heal-btn {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: #ffffff !important;
            border: none;
            border-radius: 10px;
            padding: 0.9rem 2.2rem;
            font-weight: 700;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            transition: all 0.2s ease;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.25);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        .self-heal-btn:hover {
            background: linear-gradient(135deg, #f87171, #ef4444);
            box-shadow: 0 6px 20px rgba(239, 68, 68, 0.35);
            transform: translateY(-1px);
        }

    </style>

    <div class="ledger-container">

        <!-- Header -->
        <div class="integrity-header">
            <h1 class="mb-2"><i class="bi bi-shield-lock me-2 text-dark"></i>Ledger Integrity Center</h1>
            <p class="verify-summary">This security utility utilizes a SHA-256 cryptographic blockchain ledger to protect student grades. Trace link discontinuity or discrepancies in database records to detect direct database tampering or unauthorized grade modifications.</p>
            
            <!-- Grid các bước tối giản -->
            <div class="step-grid">
                <?php
                $steps = [
                    ['01', 'Secure Entry', 'Lecturer enters grades', 'Chain links computed'],
                    ['02', 'Verification', 'Run Integrity Check', 'System re-scans chain'],
                    ['03', 'Detection', 'Tamper detected', 'Mismatch pinpointed']
                ];
                foreach ($steps as $s):
                ?>
                    <div class="step-card">
                        <div class="step-num">Step <?php echo $s[0]; ?></div>
                        <div class="step-title"><?php echo h($s[1]); ?></div>
                        <div class="step-desc"><?php echo h($s[2]); ?></div>
                        <div class="step-status"><?php echo h($s[3]); ?></div>
                    </div>
                <?php endforeach; ?>
            </div>

            <!-- Launch Audit Action -->
            <div class="mt-4">
                <form method="POST">
                    <input type="hidden" name="csrf_token" value="<?php echo Auth::getCsrfToken(); ?>">
                    <input type="hidden" name="_action" value="verify_ledger">
                    <button type="submit" class="btn verify-action-btn"><i class="bi bi-cpu me-2"></i>Launch Security Scan</button>
                </form>
            </div>
        </div>

        <!-- SCAN RESULTS SECTION -->
        <?php if ($result !== null): ?>
            <?php if ($result['valid']): ?>
                <div class="result-panel text-center">
                    <div class="status-blob success"><i class="bi bi-check-lg"></i></div>
                    <h2 class="result-title mb-2">Integrity Confirmed</h2>
                    <p class="result-desc mb-3">Successfully verified <strong><?php echo $result['total']; ?></strong> ledger blocks. Active database grades are fully synchronized with the cryptographic ledger. Chain state is healthy.</p>
                    <div class="badge-luxury bg-success mb-2"><i class="bi bi-shield-check me-1"></i> Blockchain Ledger Intact</div>
                </div>
            <?php else: ?>
                <div class="card border-0 violation-card">
                    <div class="violation-card-header">
                        <h4 class="mb-0 violation-card-heading"><i class="bi bi-exclamation-circle me-2"></i>Security Violations Detected</h4>
                    </div>
                    <div class="card-body p-0 bg-white">
                        
                        <div class="p-4 border-bottom text-center">
                            <div class="status-blob danger"><i class="bi bi-shield-exclamation"></i></div>
                            <p class="violation-summary mb-0">The diagnostic integrity scan flagged <strong><?php echo count($result['violations']); ?></strong> active table discrepancies relative to the secure ledger journal.</p>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table violation-table">
                                <thead>
                                    <tr>
                                        <th>Block ID</th>
                                        <th>Student</th>
                                        <th>Subject</th>
                                        <th>Type</th>
                                        <th>Grader (Ledger vs DB)</th>
                                        <th>Diagnostic Details</th>
                                        <th>Expected Hash/Value</th>
                                        <th>Detected Hash/Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($result['violations'] as $v):
                                        $studentInfo = isset($v['student']) ? h($v['student']) : 'N/A';
                                        $subjectInfo = isset($v['subject']) ? "<span class='badge bg-warning text-dark border-0' style='font-size:0.65rem; font-weight:700;'>".h($v['subject'])."</span>" : 'N/A';
                                        $entryId = $v['ledger_id'] ? "#{$v['ledger_id']}" : 'N/A';
                                        
                                        $isHashExp = (strlen($v['expected']) === 64);
                                        $isHashFound = (strlen($v['found']) === 64);
                                        
                                        $expClass = $isHashExp ? 'hash-mono text-success' : 'val-badge text-success';
                                        $foundClass = $isHashFound ? 'hash-mono text-danger' : 'val-badge text-danger';

                                        $graderMismatched = ($v['expected_grader'] !== $v['detected_grader']);
                                        $graderColorClass = $graderMismatched ? 'text-danger fw-bold' : 'text-muted';
                                    ?>
                                        <tr>
                                            <td class="fw-semibold text-dark"><?php echo $entryId; ?></td>
                                            <td class="fw-semibold text-dark"><?php echo $studentInfo; ?></td>
                                            <td><?php echo $subjectInfo; ?></td>
                                            <td><span class="badge-luxury bg-danger"><?php echo $v['type']; ?></span></td>
                                            <td>
                                                <div style="font-size: 0.78rem;"><span class="text-success fw-semibold" title="Authorized Grader from Ledger">L: <?php echo h($v['expected_grader']); ?></span></div>
                                                <div style="font-size: 0.78rem;"><span class="<?php echo $graderColorClass; ?>" title="Current Grader recorded in Database">DB: <?php echo h($v['detected_grader']); ?></span></div>
                                            </td>
                                            <td class="text-muted" style="font-size: 0.8rem;"><?php echo h($v['message']); ?></td>
                                            <td>
                                                <code class="<?php echo $expClass; ?>" title="<?php echo h($v['expected']); ?>">
                                                    <?php echo $isHashExp ? substr($v['expected'], 0, 8).'...' : h($v['expected']); ?>
                                                </code>
                                            </td>
                                            <td>
                                                <code class="<?php echo $foundClass; ?>" title="<?php echo h($v['found']); ?>">
                                                    <?php echo $isHashFound ? substr($v['found'], 0, 8).'...' : h($v['found']); ?>
                                                </code>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>

                        <?php
                        $hasScoreTamper = false;
                        foreach ($result['violations'] as $v) {
                            if ($v['type'] === 'SCORE_TAMPER') {
                                $hasScoreTamper = true;
                                break;
                            }
                        }
                        ?>

                        <?php if ($hasScoreTamper): ?>
                            <div class="self-heal-box">
                                <h5 class="fw-bold text-danger mb-2"><i class="bi bi-shield-fill-exclamation me-1"></i>Database Integrity Compromised</h5>
                                <p class="small text-muted mb-3" style="max-width: 600px; margin: 0 auto 1rem auto;">Unauthorized discrepancies detected between the database scores and the secure ledger. Recover all database grade entries automatically from the cryptographic record chain.</p>
                                <form method="POST" style="display:inline-block;">
                                    <input type="hidden" name="csrf_token" value="<?php echo Auth::getCsrfToken(); ?>">
                                    <input type="hidden" name="_action" value="self_heal_ledger">
                                    <button type="submit" class="btn self-heal-btn"><i class="bi bi-shield-fill-check"></i>Self-Heal Active Grades</button>
                                </form>
                            </div>
                        <?php endif; ?>

                    </div>
                </div>
            <?php endif; ?>
        <?php endif; ?>
        
    </div>

    <script>
    document.querySelectorAll('.hash-mono').forEach(el => {
        el.addEventListener('click', function() {
            const hash = this.getAttribute('title');
            if (!hash) return;
            navigator.clipboard.writeText(hash).then(() => {
                const originalText = this.innerHTML;
                this.style.background = '#d1fae5';
                this.style.color = '#065f46';
                this.style.borderColor = '#34d399';
                this.innerHTML = 'Copied!';
                setTimeout(() => {
                    this.style.background = '';
                    this.style.color = '';
                    this.style.borderColor = '';
                    this.innerHTML = originalText;
                }, 1000);
            });
        });
    });
    </script>
    <?php
    layoutEnd();
}
