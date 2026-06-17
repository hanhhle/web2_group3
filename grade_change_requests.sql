-- ============================================================
-- Grade Change Request System
-- Run this AFTER web2 .sql
-- ============================================================

CREATE TABLE IF NOT EXISTS `grade_change_requests` (
  `id`              int(11)                                    NOT NULL AUTO_INCREMENT,
  `enrollment_id`   int(11)                                    NOT NULL,
  `criterion_id`    int(11)                                    NOT NULL,
  `old_score`       decimal(5,2)                               NOT NULL,
  `new_score`       decimal(5,2)                               NOT NULL,
  `reason`          text                                       NOT NULL,
  `requested_by`    int(11)                                    NOT NULL,
  `requested_at`    timestamp                                  NOT NULL DEFAULT current_timestamp(),
  `status`          enum('pending','approved','rejected')      NOT NULL DEFAULT 'pending',
  `reviewed_by`     int(11)                                    DEFAULT NULL,
  `reviewed_at`     timestamp                                  NULL DEFAULT NULL,
  `review_note`     text                                       DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollment_id`  (`enrollment_id`),
  KEY `criterion_id`   (`criterion_id`),
  KEY `requested_by`   (`requested_by`),
  KEY `reviewed_by`    (`reviewed_by`),
  KEY `status`         (`status`),
  CONSTRAINT `gcr_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`),
  CONSTRAINT `gcr_ibfk_2` FOREIGN KEY (`criterion_id`)  REFERENCES `rubric_criteria`     (`id`),
  CONSTRAINT `gcr_ibfk_3` FOREIGN KEY (`requested_by`) REFERENCES `users`               (`id`),
  CONSTRAINT `gcr_ibfk_4` FOREIGN KEY (`reviewed_by`)  REFERENCES `users`               (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
