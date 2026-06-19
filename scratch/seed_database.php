<?php
declare(strict_types=1);

if (php_sapi_name() !== 'cli') {
    die("This script must be run from the command line.\n");
}

echo "Starting database seeding...\n";

// Set up CLI session mock
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../includes/core.php';

// Turn off foreign keys temporarily for truncation
db()->exec("SET FOREIGN_KEY_CHECKS = 0;");

$tables = [
    'audit_logs',
    'score_ledger',
    'student_scores',
    'rubric_criteria',
    'rubrics',
    'assessments',
    'student_enrollments',
    'clo_plo_mappings',
    'clos',
    'plos',
    'subjects',
    'programs',
    'users'
];

foreach ($tables as $tbl) {
    db()->exec("TRUNCATE TABLE `$tbl`;");
    db()->exec("ALTER TABLE `$tbl` AUTO_INCREMENT = 1;");
    echo "Truncated table: $tbl\n";
}

db()->exec("SET FOREIGN_KEY_CHECKS = 1;");

// 1. Seed Users (password_hash is for 'password')
$pwHash = '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi';
$users = [
    [1, 'admin', $pwHash, 'admin', 'System Administrator', 'admin@vnu.edu.vn'],
    [2, 'lecturer1', $pwHash, 'lecturer', 'Nguyễn Văn An', 'lecturer1@vnu.edu.vn'],
    [3, 'lecturer2', $pwHash, 'lecturer', 'Trần Thị Bình', 'lecturer2@vnu.edu.vn'],
    [7, 'lecturer3', $pwHash, 'lecturer', 'Lê Thị An', 'lethian@vnu.edu.vn'],
    [4, 'student1', $pwHash, 'student', 'Lê Văn Cường', 'student1@vnu.edu.vn'],
    [5, 'student2', $pwHash, 'student', 'Phạm Thị Dung', 'student2@vnu.edu.vn'],
    [6, 'student3', $pwHash, 'student', 'Hoàng Văn Em', 'student3@vnu.edu.vn'],
    [8, 'student4', $pwHash, 'student', 'Vũ Thị Giang', 'student4@vnu.edu.vn'],
    [9, 'student5', $pwHash, 'student', 'Đặng Văn Hùng', 'student5@vnu.edu.vn'],
    [10, 'student6', $pwHash, 'student', 'Bùi Thị Kim', 'student6@vnu.edu.vn'],
    [11, 'student7', $pwHash, 'student', 'Nguyễn Thị Lan', 'student7@vnu.edu.vn']
];

foreach ($users as $u) {
    qRun("INSERT INTO users (id, username, password_hash, role, full_name, email) VALUES (?,?,?,?,?,?)", $u);
}
echo "Seeded users.\n";

// 2. Seed Programs
$programs = [
    [1, 'Information Systems', 'IS', 'Chương trình Hệ thống Thông tin'],
    [2, 'Software Engineering', 'SE', 'Chương trình Kỹ thuật Phần mềm'],
    [3, 'Computer Science', 'CS', 'Chương trình Khoa học Máy tính'],
    [4, 'Cybersecurity', 'CY', 'Chương trình An toàn thông tin']
];

foreach ($programs as $p) {
    qRun("INSERT INTO programs (id, name, code, description) VALUES (?,?,?,?)", $p);
}
echo "Seeded programs.\n";

// 3. Seed Subjects (16 subjects across 3 semesters)
// Mapping subject ID -> [program_id, code, name, credits]
$subjects = [
    // 2025-1 (Semester 1 2025-2026)
    1 => [1, 'INS3064', 'Web Application Development 2', 3],
    6 => [1, 'INS4010', 'Machine Learning Applications', 3],
    14 => [1, 'INS4030', 'Cloud Computing', 3],
    15 => [1, 'INS4050', 'Mobile Application Development', 3],
    16 => [2, 'SE4010', 'Enterprise Architecture', 3],

    // 2024-2 (Semester 2 2024-2025)
    2 => [1, 'INS3021', 'Database Systems', 3],
    7 => [1, 'INS3080', 'Data Structures & Algorithms', 3],
    11 => [2, 'SE3010', 'Software Testing & QA', 3],
    12 => [1, 'INS4020', 'Artificial Intelligence', 3],
    13 => [1, 'INS3070', 'Computer Architecture', 3],

    // 2024-1 (Semester 1 2024-2025)
    3 => [2, 'SE3001', 'Software Engineering Principles', 3],
    4 => [2, 'SE3002', 'Software Design Patterns', 3],
    5 => [1, 'INS4001', 'Advanced Web Development', 3],
    8 => [2, 'SE4002', 'Agile Software Development', 3],
    9 => [1, 'INS3010', 'Computer Networks', 3],
    10 => [1, 'INS3015', 'Operating Systems', 3]
];
// Subject Lecturer Assignment mapping
$subjectLecturers = [
    1 => 2, 5 => 2, 12 => 2, 14 => 2, // Lecturer 1
    2 => 3, 7 => 3, 10 => 3, 15 => 3, // Lecturer 2
    3 => 7, 4 => 7, 6 => 7, 8 => 7, 9 => 7, 11 => 7, 13 => 7, 16 => 7 // Lecturer 3
];

foreach ($subjects as $sid => $s) {
    $lectId = $subjectLecturers[$sid] ?? null;
    qRun("INSERT INTO subjects (id, program_id, code, name, credits, lecturer_id) VALUES (?,?,?,?,?,?)", [
        $sid, $s[0], $s[1], $s[2], $s[3], $lectId
    ]);
}
echo "Seeded subjects.\n";

// 4. Seed PLOs & CLOs
$plos = [
    [1, 1, 'PLO1', 'Apply computing knowledge to solve IS problems'],
    [2, 1, 'PLO2', 'Design and implement database-driven web applications'],
    [3, 1, 'PLO3', 'Demonstrate critical thinking and problem-solving skills'],
    [4, 1, 'PLO4', 'Work effectively in teams and communicate technical concepts'],
    [5, 2, 'PLO1', 'Apply software engineering principles to develop quality software'],
    [6, 2, 'PLO2', 'Design scalable and maintainable software architectures'],
    [7, 3, 'PLO1', 'Apply theoretical computer science to solve practical problems'],
    [8, 3, 'PLO2', 'Design and analyze efficient algorithms'],
    [9, 3, 'PLO3', 'Demonstrate knowledge of machine learning techniques'],
    [10, 4, 'PLO1', 'Identify and mitigate cybersecurity threats'],
    [11, 4, 'PLO2', 'Design secure software systems'],
    [12, 2, 'PLO3', 'Apply agile methodologies in software development']
];

foreach ($plos as $plo) {
    qRun("INSERT INTO plos (id, program_id, code, description) VALUES (?,?,?,?)", $plo);
}
echo "Seeded PLOs.\n";

// For each subject, insert 3 CLOs
$cloId = 1;
$subjectClos = []; // maps subject_id -> list of clo_ids
for ($sid = 1; $sid <= 16; $sid++) {
    $subjectClos[$sid] = [];
    for ($c = 1; $c <= 3; $c++) {
        qRun("INSERT INTO clos (id, subject_id, code, description) VALUES (?,?,?,?)", [
            $cloId, $sid, "CLO$c", "Learning outcome $c for subject ID $sid"
        ]);
        $subjectClos[$sid][] = $cloId;
        
        // Map to a PLO (simple mapping)
        $ploId = ($sid % 2 === 0) ? 5 : 1; // map to SE PLO1 or IS PLO1
        qRun("INSERT INTO clo_plo_mappings (clo_id, plo_id, weight) VALUES (?,?,?)", [
            $cloId, $ploId, 1.00
        ]);
        $cloId++;
    }
}
echo "Seeded CLOs and mappings.\n";

// 5. Seed Enrollments
// student_id -> list of [subject_id, semester]
$enrollmentsList = [
    // Student 1 (id=4)
    4 => [
        // 2024-1
        [3, '2024-1'], [4, '2024-1'], [5, '2024-1'], [8, '2024-1'], [9, '2024-1'], [10, '2024-1'],
        // 2024-2
        [2, '2024-2'], [7, '2024-2'], [11, '2024-2'], [12, '2024-2'], [13, '2024-2'],
        // 2025-1
        [1, '2025-1'], [6, '2025-1'], [14, '2025-1'], [15, '2025-1'], [16, '2025-1']
    ],
    // Student 2 (id=5)
    5 => [
        [3, '2024-1'], [4, '2024-1'], [5, '2024-1'], [8, '2024-1'], [9, '2024-1'], [10, '2024-1'],
        [2, '2024-2'], [7, '2024-2'], [11, '2024-2'], [12, '2024-2'], [13, '2024-2'],
        [1, '2025-1'], [6, '2025-1'], [14, '2025-1'], [15, '2025-1'], [16, '2025-1']
    ],
    // Student 3 (id=6)
    6 => [
        [3, '2024-1'], [4, '2024-1'], [5, '2024-1'], [8, '2024-1'],
        [2, '2024-2'], [7, '2024-2'], [11, '2024-2'],
        [1, '2025-1'], [6, '2025-1'], [14, '2025-1']
    ],
    // Student 4 (id=8)
    8 => [
        [3, '2024-1'], [4, '2024-1'], [5, '2024-1'],
        [2, '2024-2'], [7, '2024-2'],
        [1, '2025-1'], [6, '2025-1']
    ],
    // Student 5 (id=9)
    9 => [
        [3, '2024-1'], [4, '2024-1'], [5, '2024-1'],
        [2, '2024-2'], [7, '2024-2'],
        [1, '2025-1'], [6, '2025-1']
    ],
    // Student 6 (id=10)
    10 => [
        [3, '2024-1'],
        [2, '2024-2'],
        [1, '2025-1']
    ],
    // Student 7 (id=11)
    11 => [
        [3, '2024-1'],
        [2, '2024-2'],
        [1, '2025-1']
    ]
];

$enrollmentMapping = []; // student_id -> subject_id -> enrollment_id
$eid = 1;
foreach ($enrollmentsList as $studId => $list) {
    $enrollmentMapping[$studId] = [];
    foreach ($list as $item) {
        $subId = $item[0];
        $semester = $item[1];
        
        qRun("INSERT INTO student_enrollments (id, student_id, subject_id, semester) VALUES (?,?,?,?)", [
            $eid, $studId, $subId, $semester
        ]);
        $enrollmentMapping[$studId][$subId] = $eid;
        $eid++;
    }
}
echo "Seeded student enrollments.\n";

// 6. Seed Assessments, Rubrics, Rubric Criteria
// For each of the 16 subjects, we create assessments for the semester it belongs to.
$assessmentsData = [
    // [subject_id, name, type, weight, max_score, semester]
];

$assessId = 1;
$rubricId = 1;
$criterionId = 1;

$subjectCriteria = []; // maps subject_id -> list of criterion_ids

for ($sid = 1; $sid <= 16; $sid++) {
    $subjectCriteria[$sid] = [];
    
    // Find semester of this subject
    $sub = $subjects[$sid];
    $semester = ($sid === 1 || $sid === 6 || $sid === 14 || $sid === 15 || $sid === 16) ? '2025-1' 
              : (($sid === 2 || $sid === 7 || $sid === 11 || $sid === 12 || $sid === 13) ? '2024-2' : '2024-1');
              
    $lectId = $subjectLecturers[$sid];
    
    // 3 Assessments: Attendance (10%), Midterm (30%), Final (60%)
    $assessConfig = [
        ['Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00],
        ['Midterm Exam', 'midterm', 30.00, 10.00],
        ['Final Project Delivery', 'final', 60.00, 10.00]
    ];
    
    foreach ($assessConfig as $conf) {
        qRun("INSERT INTO assessments (id, subject_id, lecturer_id, name, type, weight, max_score, semester) VALUES (?,?,?,?,?,?,?,?)", [
            $assessId, $sid, $lectId, $conf[0], $conf[1], $conf[2], $conf[3], $semester
        ]);
        
        // Rubric
        qRun("INSERT INTO rubrics (id, assessment_id, name) VALUES (?,?,?)", [
            $rubricId, $assessId, $sub[2] . " " . ucfirst($conf[1]) . " Rubric"
        ]);
        
        // Rubric Criteria
        // Attendance: 2 criteria (weight 50%, 50%)
        // Midterm: 2 criteria (weight 50%, 50%)
        // Final: 3 criteria (weight 40%, 30%, 30%)
        $closForSub = $subjectClos[$sid];
        
        if ($conf[1] === 'attendance') {
            $crit = [
                ['Classroom active participation', $closForSub[0], 50.00],
                ['Weekly quizzes performance', $closForSub[1], 50.00]
            ];
        } elseif ($conf[1] === 'midterm') {
            $crit = [
                ['Theoretical concepts application', $closForSub[0], 50.00],
                ['Problem solving skills', $closForSub[2], 50.00]
            ];
        } else {
            $crit = [
                ['Implementation logic & code quality', $closForSub[0], 40.00],
                ['System architecture & database design', $closForSub[1], 30.00],
                ['Presentation & defense report', $closForSub[2], 30.00]
            ];
        }
        
        foreach ($crit as $c) {
            qRun("INSERT INTO rubric_criteria (id, rubric_id, clo_id, description, max_score, weight_percent) VALUES (?,?,?,?,?,?)", [
                $criterionId, $rubricId, $c[1], $c[0], 10.00, $c[2]
            ]);
            $subjectCriteria[$sid][] = $criterionId;
            $criterionId++;
        }
        
        $rubricId++;
        $assessId++;
    }
}
echo "Seeded assessments, rubrics, and rubric criteria.\n";

// 7. Seed Student Scores & Ledger Entries
// We mock sessions dynamically for each grade to register who graded it.
// Ledger requires a continuous hash chain starting from 64 zeros.
// We must build it record-by-record using the system's ledgerRecord function.

// Initialize SHA-256 Chain
db()->exec("DELETE FROM `score_ledger`;");
db()->exec("DELETE FROM `student_scores`;");
db()->exec("ALTER TABLE `score_ledger` AUTO_INCREMENT = 1;");
db()->exec("ALTER TABLE `student_scores` AUTO_INCREMENT = 1;");

echo "Generating and chain-signing student grades...\n";

// Set timezone to match system
date_default_timezone_set('Asia/Ho_Chi_Minh');

// Seed scores for each student and each enrolled subject
foreach ($enrollmentsList as $studId => $list) {
    foreach ($list as $item) {
        $subId = $item[0];
        $enrId = $enrollmentMapping[$studId][$subId];
        $lectId = $subjectLecturers[$subId];
        
        // Mock Session
        $_SESSION['user_id'] = $lectId;
        $_SESSION['role'] = 'lecturer';
        $_SESSION['full_name'] = qOne("SELECT full_name FROM users WHERE id=?", [$lectId])['full_name'];
        
        // Get criteria for this subject
        $criteriaIds = $subjectCriteria[$subId];
        
        // Grade each criterion
        foreach ($criteriaIds as $cid) {
            // Generate realistic randomized scores
            if ($studId === 4) { // student1: Lê Văn Cường (Very high/high scores)
                $score = round(7.5 + mt_rand(0, 25) / 10, 1); // 7.5 to 10.0
            } elseif ($studId === 6) { // student3: Hoàng Văn Em (Excellent scores)
                $score = round(8.5 + mt_rand(0, 15) / 10, 1); // 8.5 to 10.0
            } elseif ($studId === 5) { // student2: Phạm Thị Dung (Average scores)
                $score = round(5.5 + mt_rand(0, 25) / 10, 1); // 5.5 to 8.0
            } else { // Others (Normal distribution)
                $score = round(5.0 + mt_rand(0, 45) / 10, 1); // 5.0 to 9.5
            }
            
            // Insert directly into student_scores
            qRun("INSERT INTO student_scores (enrollment_id, criterion_id, score, graded_by) VALUES (?,?,?,?)", [
                $enrId, $cid, $score, $lectId
            ]);
            
            // Log it in the score ledger
            // ledgerRecord expects: ($eid, $cid, $score, $action, $gradedBy, $previousScore)
            ledgerRecord($enrId, $cid, $score, 'INSERT', $lectId, null);
        }
    }
}

echo "Successfully seeded " . qOne("SELECT count(*) c FROM student_scores")['c'] . " grades.\n";
echo "Successfully recorded " . qOne("SELECT count(*) c FROM score_ledger")['c'] . " ledger blocks.\n";
echo "Ledger Verification Status:\n";

$verify = ledgerVerify();
if (empty($verify['violations'])) {
    echo "SUCCESS: Ledger verification passed with 0 violations! The hash chain is perfect.\n";
} else {
    echo "ERROR: Ledger verification failed! Found " . count($verify['violations']) . " violations:\n";
    print_r($verify['violations']);
}
echo "Done database seeding!\n";
