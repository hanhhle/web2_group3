-- ============================================================
-- notifications.sql
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id`           int(11)      NOT NULL AUTO_INCREMENT,
  `user_id`      int(11)      DEFAULT NULL COMMENT 'NULL = thông báo chung (broadcast) cho mọi user',
  `title`        varchar(255) NOT NULL,
  `message`      text         NOT NULL,
  `type`         enum('info','success','warning','danger') NOT NULL DEFAULT 'info',
  `is_read`      tinyint(1)   NOT NULL DEFAULT 0 COMMENT 'Dùng cho thông báo cá nhân (user_id khác NULL)',
  `created_by`   int(11)      DEFAULT NULL COMMENT 'Người tạo thông báo (thường là admin)',
  `created_at`   timestamp    NOT NULL DEFAULT current_timestamp(),
  `read_by`      text         DEFAULT NULL COMMENT 'JSON mảng user_id đã đọc (dùng cho thông báo chung)',
  `dismissed_by` text         DEFAULT NULL COMMENT 'JSON mảng user_id đã ẩn/xoá thông báo (dùng cho thông báo chung)',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `fk_notif_user`   FOREIGN KEY (`user_id`)    REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_notif_sender` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sample data for table `notifications`
-- NOTE: notifications are only created manually by an admin via the UI
-- (NotificationController::create) — there is no automatic trigger in
-- this app. The rows below only cover actions that actually exist in
-- the web: (1) a welcome broadcast, (2) a notice to the lecturer who
-- graded a student, (3) a notice to whoever requested a grade change
-- once it is reviewed.
-- (admin id = 1, lecturer ids = 2/3/7, student ids = 4..11 per existing seed data)
--

INSERT INTO `notifications`
  (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `created_by`, `created_at`, `read_by`, `dismissed_by`)
VALUES
  -- Broadcast (user_id = NULL) shown to every user on login
  (1, NULL, 'Welcome to System',
      'Welcome to VNU-IS Grading System.',
      'info', 0, 1, '2026-06-18 12:00:00', NULL, NULL),

  -- Personal notification to the lecturer who entered a score (Lecturer 3, id=7)
  -- corresponds to a row in score_ledger graded by user 7
  (2, 7, 'Score recorded successfully',
      'You graded enrollment #1, criterion #15 with a score of 8.9.',
      'success', 1, 7, '2026-06-18 11:52:26', NULL, NULL),

  -- Personal notification to whoever requested a grade change, once it is reviewed
  -- corresponds to grade_change_requests row (id=1, requested_by=2, status=approved)
  (3, 2, 'Grade change request approved',
      'Your grade change request for enrollment #3, criterion #1 (8.90 → 7.00) has been approved.',
      'success', 1, 1, '2026-06-17 09:47:29', NULL, NULL);

-- Reset AUTO_INCREMENT so future inserts don't collide with seed ids
ALTER TABLE `notifications` AUTO_INCREMENT = 4;

SET FOREIGN_KEY_CHECKS = 1;
