<?php
declare(strict_types=1);

class UserModel {
    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM users WHERE id=?", [$id]);
        return $res ?: null;
    }

    public static function getByUsername(string $username): ?array {
        $res = qOne("SELECT * FROM users WHERE username = ?", [trim($username)]);
        return $res ?: null;
    }

    public static function getLecturers(): array {
        return qAll("SELECT id, full_name FROM users WHERE role='lecturer' ORDER BY full_name");
    }

    public static function getStudents(): array {
        return qAll("SELECT * FROM users WHERE role='student' ORDER BY full_name");
    }

    public static function getAll(): array {
        return qAll("SELECT * FROM users ORDER BY full_name");
    }

    public static function create(string $username, string $password, string $role, string $fullName, string $email): int {
        if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/', $password)) {
            throw new Exception('Password is not strong enough. It must contain at least 8 characters, including uppercase, lowercase, numbers, and special symbols.');
        }
        $hash = password_hash($password, PASSWORD_BCRYPT);
        qRun("INSERT INTO users (username,password_hash,role,full_name,email) VALUES (?,?,?,?,?)",
            [$username, $hash, $role, trim($fullName), trim($email)]);
        return (int)lastId();
    }

    public static function update(int $id, string $fullName, string $email, string $role, ?string $password = null): void {
        if ($password !== null && $password !== '') {
            if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/', $password)) {
                throw new Exception('Password is not strong enough. It must contain at least 8 characters, including uppercase, lowercase, numbers, and special symbols.');
            }
            $hash = password_hash($password, PASSWORD_BCRYPT);
            qRun("UPDATE users SET full_name=?,email=?,role=?,password_hash=? WHERE id=?",
                [trim($fullName), trim($email), $role, $hash, $id]);
        } else {
            qRun("UPDATE users SET full_name=?,email=?,role=? WHERE id=?",
                [trim($fullName), trim($email), $role, $id]);
        }
    }

    public static function delete(int $id): void {
        qRun("DELETE FROM users WHERE id=?", [$id]);
    }
}
