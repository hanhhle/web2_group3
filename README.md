# 🎓 VNU-IS Secure Grading System

The University Grade Management System project is built on the **Root Front-Controller MVC** architecture, incorporating **Blockchain Ledger** security mechanisms, **Strategy Pattern**, and **AJAX REST API** for a zero-reload user experience.

---

## 🚀 TECHNOLOGY USED
* **Backend:** PHP 8.x (Native/Vanilla)
* **Database:** MySQL / MariaDB (Connect via PDO Singleton)
* **Architecture:** MVC (Model-View-Controller)
* **Design Patterns:** Strategy Pattern (Flexible scoring), Singleton (Database)
* **Frontend:** HTML5, CSS3, JavaScript (Fetch API / Vanilla JS), Bootstrap 5

---

## ⚙️ SYSTEM REQUIREMENTS
* **XAMPP** (or MAMP/Laragon) must be installed.
* Recommended PHP version: **>= 8.0**.
* Modern web browser (Chrome, Safari, Edge).

---

## 🛠️ INSTRUCTIONS FOR INSTALLING AND RUNNING THE PROJECT

### 1. For Windows computers:
1. Launch the **XAMPP Control Panel** and enable the following two modules: **Apache** and **MySQL**.
2. Copy the entire project source code folder (`web2_group3-main final`).
3. Paste that folder into the following path: `C:\xampp\htdocs\`
*(Ensure the structure is: `C:\xampp\htdocs\web2_group3-main final\index.php`)*

### 2. For macOS computers (MacBook)
1. Open the **XAMPP** application (or XAMPP-VM), start **Apache** and **MySQL** in the *Manage Servers* tab.
2. Open Finder, access the path: `/Applications/XAMPP/xamppfiles/htdocs/`
3. Copy the entire project folder (`web2_group3-main final`) and paste it into this `htdocs` folder.
4. **Note: Grant permissions (if needed):** Open Terminal and run the following command to avoid file write permission errors on Mac:
```
bash
sudo chmod -R 777 "/Applications/XAMPP/xamppfiles/htdocs/web2_group3-main final"
```

## Database
1. Open your browser and go to: http://localhost/phpmyadmin
Create a new database
* Name: web2
* Collation: utf8mb4_unicode_ci

2. Select the Import tab, upload the original database file (the web2.sql file included with the project), and click Go

3. Open the config/config.php file in the source code and check the DB connection information (usually using the default XAMPP standard):
```
PHP
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'web2');
```
(Note: The system has integrated the Auto-Migration feature in core.php, which will automatically create the notifications and grade_change_requests tables if they are not already present)

## 🌐 ACCESS THE SYSTEM
👉 Open your browser and access: http://localhost/web2_group3-main%20final/index.php
🔑 Default Accounts for Testing (Username / Password)
Admin: admin / password
Lecturer: lecturer1 / password
Student: student1 / password

(The default password may differ depending on the group's SQL dump file. If you cannot log in, go to phpMyAdmin, create an MD5/Bcrypt string, and paste it directly into the password column of the users table).

## 🌟 KEY FEATURES FOR DEMO & PROJECT DEFENSE
1. AJAX & Internal REST API: The Grade Entry, Grade Correction Request, and Notification subsystems operate entirely in the background (Background Fetch API), requiring no page reload. The system automatically pushes a Toast notification to the screen corner and instantly updates the number of Pending badges.
2. Blockchain Ledger: All grade correction operations are hashed (SHA-256) and stored in score_ledger, preventing direct interference from phpMyAdmin. Integrated Verify & Self-Heal functionality.
3. Strategy Pattern: Applying Design Patterns for flexible grading (Physical Education uses a Pass/Fail system, specialized subjects use a standard weighting system).
4. RBAC Middleware: Highly stringent role-based access control (Admin, Lecturer, Student). Filters all requests to prevent SQL Injection and CSRF attacks.

<sub> The project is developed by Group 3. <sub>