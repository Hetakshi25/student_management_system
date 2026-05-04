-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2026 at 02:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add attendance', 6, 'add_attendance'),
(22, 'Can change attendance', 6, 'change_attendance'),
(23, 'Can delete attendance', 6, 'delete_attendance'),
(24, 'Can view attendance', 6, 'view_attendance'),
(25, 'Can add course', 7, 'add_course'),
(26, 'Can change course', 7, 'change_course'),
(27, 'Can delete course', 7, 'delete_course'),
(28, 'Can view course', 7, 'view_course'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add student', 9, 'add_student'),
(34, 'Can change student', 9, 'change_student'),
(35, 'Can delete student', 9, 'delete_student'),
(36, 'Can view student', 9, 'view_student'),
(37, 'Can add notification student', 10, 'add_notificationstudent'),
(38, 'Can change notification student', 10, 'change_notificationstudent'),
(39, 'Can delete notification student', 10, 'delete_notificationstudent'),
(40, 'Can view notification student', 10, 'view_notificationstudent'),
(41, 'Can add leave report student', 11, 'add_leavereportstudent'),
(42, 'Can change leave report student', 11, 'change_leavereportstudent'),
(43, 'Can delete leave report student', 11, 'delete_leavereportstudent'),
(44, 'Can view leave report student', 11, 'view_leavereportstudent'),
(45, 'Can add attendance report', 12, 'add_attendancereport'),
(46, 'Can change attendance report', 12, 'change_attendancereport'),
(47, 'Can delete attendance report', 12, 'delete_attendancereport'),
(48, 'Can view attendance report', 12, 'view_attendancereport'),
(49, 'Can add subject', 13, 'add_subject'),
(50, 'Can change subject', 13, 'change_subject'),
(51, 'Can delete subject', 13, 'delete_subject'),
(52, 'Can view subject', 13, 'view_subject'),
(53, 'Can add student result', 14, 'add_studentresult'),
(54, 'Can change student result', 14, 'change_studentresult'),
(55, 'Can delete student result', 14, 'delete_studentresult'),
(56, 'Can view student result', 14, 'view_studentresult'),
(57, 'Can add teacher', 15, 'add_teacher'),
(58, 'Can change teacher', 15, 'change_teacher'),
(59, 'Can delete teacher', 15, 'delete_teacher'),
(60, 'Can view teacher', 15, 'view_teacher'),
(61, 'Can add notification teacher', 16, 'add_notificationteacher'),
(62, 'Can change notification teacher', 16, 'change_notificationteacher'),
(63, 'Can delete notification teacher', 16, 'delete_notificationteacher'),
(64, 'Can view notification teacher', 16, 'view_notificationteacher'),
(65, 'Can add feedback teacher', 17, 'add_feedbackteacher'),
(66, 'Can change feedback teacher', 17, 'change_feedbackteacher'),
(67, 'Can delete feedback teacher', 17, 'delete_feedbackteacher'),
(68, 'Can view feedback teacher', 17, 'view_feedbackteacher'),
(69, 'Can add leave report teacher', 18, 'add_leavereportteacher'),
(70, 'Can change leave report teacher', 18, 'change_leavereportteacher'),
(71, 'Can delete leave report teacher', 18, 'delete_leavereportteacher'),
(72, 'Can view leave report teacher', 18, 'view_leavereportteacher'),
(73, 'Can add feedback student', 19, 'add_feedbackstudent'),
(74, 'Can change feedback student', 19, 'change_feedbackstudent'),
(75, 'Can delete feedback student', 19, 'delete_feedbackstudent'),
(76, 'Can view feedback student', 19, 'view_feedbackstudent'),
(77, 'Can add contact us', 20, 'add_contactus'),
(78, 'Can change contact us', 20, 'change_contactus'),
(79, 'Can delete contact us', 20, 'delete_contactus'),
(80, 'Can view contact us', 20, 'view_contactus'),
(81, 'Can add department', 21, 'add_department'),
(82, 'Can change department', 21, 'change_department'),
(83, 'Can delete department', 21, 'delete_department'),
(84, 'Can view department', 21, 'view_department'),
(85, 'Can add exam schedule', 22, 'add_examschedule'),
(86, 'Can change exam schedule', 22, 'change_examschedule'),
(87, 'Can delete exam schedule', 22, 'delete_examschedule'),
(88, 'Can view exam schedule', 22, 'view_examschedule'),
(89, 'Can add student fee', 23, 'add_studentfee'),
(90, 'Can change student fee', 23, 'change_studentfee'),
(91, 'Can delete student fee', 23, 'delete_studentfee'),
(92, 'Can view student fee', 23, 'view_studentfee'),
(93, 'Can add teacher salary', 24, 'add_teachersalary'),
(94, 'Can change teacher salary', 24, 'change_teachersalary'),
(95, 'Can delete teacher salary', 24, 'delete_teachersalary'),
(96, 'Can view teacher salary', 24, 'view_teachersalary'),
(97, 'Can add fee', 25, 'add_fee'),
(98, 'Can change fee', 25, 'change_fee'),
(99, 'Can delete fee', 25, 'delete_fee'),
(100, 'Can view fee', 25, 'view_fee'),
(101, 'Can add salary', 26, 'add_salary'),
(102, 'Can change salary', 26, 'change_salary'),
(103, 'Can delete salary', 26, 'delete_salary'),
(104, 'Can view salary', 26, 'view_salary'),
(105, 'Can add daily lesson target', 27, 'add_dailylessontarget'),
(106, 'Can change daily lesson target', 27, 'change_dailylessontarget'),
(107, 'Can delete daily lesson target', 27, 'delete_dailylessontarget'),
(108, 'Can view daily lesson target', 27, 'view_dailylessontarget'),
(109, 'Can add salary request', 28, 'add_salaryrequest'),
(110, 'Can change salary request', 28, 'change_salaryrequest'),
(111, 'Can delete salary request', 28, 'delete_salaryrequest'),
(112, 'Can view salary request', 28, 'view_salaryrequest'),
(113, 'Can add teacher place application', 29, 'add_teacherplaceapplication'),
(114, 'Can change teacher place application', 29, 'change_teacherplaceapplication'),
(115, 'Can delete teacher place application', 29, 'delete_teacherplaceapplication'),
(116, 'Can view teacher place application', 29, 'view_teacherplaceapplication');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'sms', 'attendance'),
(12, 'sms', 'attendancereport'),
(20, 'sms', 'contactus'),
(7, 'sms', 'course'),
(8, 'sms', 'customuser'),
(27, 'sms', 'dailylessontarget'),
(21, 'sms', 'department'),
(22, 'sms', 'examschedule'),
(25, 'sms', 'fee'),
(19, 'sms', 'feedbackstudent'),
(17, 'sms', 'feedbackteacher'),
(11, 'sms', 'leavereportstudent'),
(18, 'sms', 'leavereportteacher'),
(10, 'sms', 'notificationstudent'),
(16, 'sms', 'notificationteacher'),
(26, 'sms', 'salary'),
(28, 'sms', 'salaryrequest'),
(9, 'sms', 'student'),
(23, 'sms', 'studentfee'),
(14, 'sms', 'studentresult'),
(13, 'sms', 'subject'),
(15, 'sms', 'teacher'),
(29, 'sms', 'teacherplaceapplication'),
(24, 'sms', 'teachersalary');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-01-28 17:30:39.267355'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-01-28 17:30:39.345105'),
(3, 'auth', '0001_initial', '2026-01-28 17:30:39.529677'),
(4, 'auth', '0002_alter_permission_name_max_length', '2026-01-28 17:30:39.575340'),
(5, 'auth', '0003_alter_user_email_max_length', '2026-01-28 17:30:39.579351'),
(6, 'auth', '0004_alter_user_username_opts', '2026-01-28 17:30:39.583813'),
(7, 'auth', '0005_alter_user_last_login_null', '2026-01-28 17:30:39.588373'),
(8, 'auth', '0006_require_contenttypes_0002', '2026-01-28 17:30:39.590614'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2026-01-28 17:30:39.594461'),
(10, 'auth', '0008_alter_user_username_max_length', '2026-01-28 17:30:39.599176'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2026-01-28 17:30:39.603852'),
(12, 'auth', '0010_alter_group_name_max_length', '2026-01-28 17:30:39.612851'),
(13, 'auth', '0011_update_proxy_permissions', '2026-01-28 17:30:39.617772'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2026-01-28 17:30:39.621523'),
(19, 'sessions', '0001_initial', '2026-01-28 17:30:49.716704'),
(20, 'sms', '0001_initial', '2026-01-28 18:32:25.692389'),
(21, 'sms', '0002_leavereportteacher_feedbackteacher_feedbackstudent', '2026-01-28 18:34:52.503715'),
(22, 'admin', '0001_initial', '2026-02-04 05:48:29.297086'),
(23, 'admin', '0002_logentry_remove_auto_add', '2026-02-04 05:48:29.303930'),
(24, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-04 05:48:29.306797'),
(25, 'sms', '0002_contactus', '2026-02-12 03:53:02.871787'),
(27, 'sms', '0003_department_course_department_teacher_department', '2026-02-18 06:20:33.824999'),
(29, 'sms', '0003_department_course_department', '2026-02-21 17:17:40.513918'),
(30, 'sms', '0004_examschedule', '2026-02-22 10:34:20.130415'),
(31, 'sms', '0005_teachersalary_studentfee', '2026-02-22 11:41:58.135924'),
(32, 'sms', '0005_alter_student_course_alter_teacher_department', '2026-02-24 19:14:10.577084'),
(33, 'sms', '0006_salary_fee', '2026-02-24 20:56:00.273494'),
(34, 'sms', '0006_dailylessontarget', '2026-03-03 17:30:24.125489'),
(35, 'sms', '0007_course_fee', '2026-03-05 17:32:02.012559'),
(36, 'sms', '0008_customuser_phone', '2026-03-10 09:13:46.966391'),
(37, 'sms', '0009_salaryrequest', '2026-03-10 09:31:22.116881'),
(38, 'sms', '0010_examschedule_venue', '2026-03-27 06:13:53.532666'),
(39, 'sms', '0011_teacher_department', '2026-03-27 06:20:08.744348'),
(40, 'sms', '0012_teacherplaceapplication', '2026-03-27 06:30:58.997452');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0jjd047lya32exbl8urzx8giywzr4ymv', '.eJxVjLsOwjAMAP_FM4qSNg1xR3a-IXJsQwookfqYEP-OKnWA9e50b0i0rSVti85pEhjBwemXZeKn1l3Ig-q9GW51nads9sQcdjHXJvq6HO3foNBSYAS0aHEIN1QfOLJ2XjocgkUlK4wUnM_9kCmLOuEz9sQYfR9FMDvGCJ8v3MA4Hg:1w0BOq:yqokAoP3vLNL2SR3jIBZ9tmE9mmUObMf0OjdQNPQsl0', '2026-03-25 04:42:24.314489'),
('2rqpztrtmgfkrypqy6ixook5zkmpqlia', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vyk6r:n5xx0o1SeVJj6MFysz0S5HVkHCXJroTY8Ound_f74SI', '2026-03-21 05:21:53.985523'),
('3nl6fsajrhua119wr4i4jxyhcpsxycqm', '.eJxVjLsOwjAMAP_FM4qc5uV2ZOcbIttNSQG1Uh8T4t9RpQ6w3p3uDZn3reZ9LUsee-igiXD5hcL6LNNh-gdP99noPG3LKOZIzGlXc5v78rqe7d-g8lqhg9ZrEioYdEiuZRcCRUQrmDARBrXUONKALTkWUYlCfohW2XpkYYTPF-QyN2I:1w0Bhf:WLdiuNqQ_pfAEYoy2TQIihqyGyVkOj0c06PQTErUztw', '2026-03-25 05:01:51.198089'),
('73rfu860rek636avvxrsg6tvs412apl4', '.eJxVjLsOwjAMAP_FM4qSNg1xR3a-IXJsQwookfqYEP-OKnWA9e50b0i0rSVti85pEhjBwemXZeKn1l3Ig-q9GW51nads9sQcdjHXJvq6HO3foNBSYAS0aHEIN1QfOLJ2XjocgkUlK4wUnM_9kCmLOuEz9sQYfR9FMDvGCJ8v3MA4Hg:1w5Gmd:HB_WiMQDXrvgFoKWp-m8eAO65TmVDFvYgIwMsgVXCl4', '2026-04-08 05:27:59.568955'),
('7v20081ra6trr2cgb3vrs36adc5uasbd', '.eJxVjLsOwjAMAP_FM4qSNg1xR3a-IXJsQwookfqYEP-OKnWA9e50b0i0rSVti85pEhjBwemXZeKn1l3Ig-q9GW51nads9sQcdjHXJvq6HO3foNBSYAS0aHEIN1QfOLJ2XjocgkUlK4wUnM_9kCmLOuEz9sQYfR9FMDvGCJ8v3MA4Hg:1w4wyt:7HvckLsyCegz2fGGQgOrTYikYN-S_nHAd8PXvt9UPng', '2026-04-07 08:19:19.171948'),
('9g4wnhareljfgws4ah211z78cg1irpmw', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vyk7e:CiMCE4hHhGxxi1CF6t-E6k2MsHh8LYca36UEqX0czr4', '2026-03-21 05:22:42.325806'),
('9ojw8ug8vfq9c3wm51dgeq4n7ptqrnxb', '.eJxVjLsOwjAMAP_FM4qSNg1xR3a-IXJsQwookfqYEP-OKnWA9e50b0i0rSVti85pEhjBwemXZeKn1l3Ig-q9GW51nads9sQcdjHXJvq6HO3foNBSYAS0aHEIN1QfOLJ2XjocgkUlK4wUnM_9kCmLOuEz9sQYfR9FMDvGCJ8v3MA4Hg:1w4bci:dbVx1_G905wtY2umilA33qVmtI47YZOqLdaR_6RcCrI', '2026-04-06 09:31:00.367403'),
('bcax9htjvdiyqq9hr8ld9wh7rlt4fxcq', '.eJxVjkEOgjAQRe8ya9K0UErHpXvPQKYzo6CmJLSsjHc3RBa6_e_l5b9gpK1O41Z0HWeBEzhofrdE_NC8A7lTvi2Gl1zXOZldMQct5rKIPs-H-xeYqExwArRosQ9XVB84srZeWuyDRSUrjBScT12fKIk64QE7Yoy-iyKYHGOEBkrdRHP93uwGeH8ABbA9qQ:1w5HLQ:3QhcMZj3MvV70S_dLYRpn8c7CW7cI8mibXCtrHR1SAc', '2026-04-08 06:03:56.983679'),
('cpnursz0w26mdz2s2dreyl7ty0mzqiap', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vyCVF:eK60D__yI3IVTk7wcgmsS-B3svM6dBmeKHLapS8Ii3w', '2026-03-19 17:28:49.573100'),
('gf33yjb5vl9fehgza8l7ed0yq61oppm0', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vzpdj:6SVlwnUwZSSmEaV-_uM9Ijwbi4JC3h7TvhvARI_MhLk', '2026-03-24 05:28:19.487387'),
('h6b3hgcsf1nper8okl12vmv98fbdso64', '.eJxVjssKwjAQRf9l1iU06cRpunTvN5TMQ1OVFvpYif8uhQq6vedwuC_o87aWflts7geFDkID1e_IWR427kTvebxNTqZxnQd2u-IOurjLpPY8H-5foOSlQAd0Qqrb1CQj89S0RKYerz6KsPpAFjkwpjpzUgxJmKOQomHyFAkFKlgtS_n-bOH9AdI7PO0:1vxUbv:2Q8Nv6Mpai_feJ2zroWET_xuSjBq0-viTvxsRWN0Sp4', '2026-03-17 18:36:47.300651'),
('hqys26ddskpp7raopvf6u885k37acuca', '.eJxVjEEOwiAQAP-yZ0OAFtj26N03kF0WpGrapLQn499Nkx70OjOZN0Tatxr3ltc4CYxg4PLLmNIzz4eQB833RaVl3taJ1ZGo0zZ1WyS_rmf7N6jUKozgHaW-WC_B6BAsD9rmQtahZy9ksGByQ9cjM6LRQzZYiAO6ZDuUIAU-X9U7N7o:1vy5xa:viLqH0zKmWyomrqzzKPI6Zis5HXGz1QFTl4-5Ob6RWs', '2026-03-19 10:29:38.141413'),
('ir19beuvi1stlfyk3v9dsvovxfvpiw9b', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vzqFE:qvJRoqkJd79ufVs3xdyf1-Soxeazm4w6MNpo8Dkx6E0', '2026-03-24 06:07:04.483862'),
('jv8ugkavaole4t844mw4su2pcvw1dyi0', '.eJxVjMsOgjAQAP9lz6bpY9tSjt75BrLdrRY1kFA4Gf_dkHDQ68xk3jDSvtVxb2UdJ4EerIPLL8zEzzIfRh403xfFy7ytU1ZHok7b1LBIeV3P9m9QqVXogbqboAudlZhTYM8axaKjFKIW74SNyeg9WyYuETEyp2C06yjrKIbg8wUEojf3:1vxSCm:RdR0Jlzb09t5p9UM2NczYCvIBNf80KZl7ZdLTxNFBtc', '2026-03-17 16:02:40.088989'),
('l09745kh0mcxmp32nq686t8tpwjvjxry', '.eJxVjEEOwiAQAP-yZ0NggVJ69O4bCLCsVA1NSnsy_t006UGvM5N5Q4j7VsPeyxpmgglQw-UXppifpR2GHrHdF5GXtq1zEkciTtvFbaHyup7t36DGXmECZqkdk5GMCgtJ69AkT4OyRSbjUyLnXUQ2ox6zLYa1woG1jpmlRWnh8wUI2zfO:1vy53m:Eyt97XOX9-2BwRC1gz20CZL-I2F9v-FVYbXrU5oPeDw', '2026-03-19 09:31:58.754995'),
('m4joz72ia6pgeiiwoqitq9g5uaacll63', '.eJxVjDsOgkAUAO_yarPh8xYXSnvOQN5XUAMJC5Xx7oaEQtuZybxhoH0bhz3bOkwKHZRw-WVM8rT5EPqg-b4EWeZtnTgcSThtDv2i9rqd7d9gpDxCB4UTIyfEuk18VWevjCwWynUdTZJbhSgS28aFy2hJXFyxRWocFQ0-XxeeOZA:1vu7ae:8t_xzvlMdJ_XUHn7gO8nObmjaZfG1AJAMU74rl6WehQ', '2026-03-08 11:25:32.550784'),
('qr4955ueyzwydqa8ujzyh4qstvhfdn1b', '.eJxVjEEOwiAQAP-yZ0OAKiw9evcNZGEXqRqalPZk_Ltp0oNeZybzhkjbWuPWZYkTwwjWwekXJspPabvhB7X7rPLc1mVKak_UYbu6zSyv69H-DSr1CiOY4FByMCi2MDoTvKA4HvSZRJwU1KhDLt4yXYyU5HNKYXDFow-SDMPnCxVSOMk:1w60RO:INQ_iXIc3BIYLuYVjViowXa3n1OLCBBgw9-FY_53B4g', '2026-04-10 06:13:06.016678'),
('ti8m5wmgb1xintvc1myvk3cm62te7gyc', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vzpUv:MdvZSgN3wBRnkVVwkwhExSihNcUqF3rARTuwc8CYlQE', '2026-03-24 05:19:13.225436'),
('tjzh2a3f0v0lp0olgd32et475xvoy6t1', '.eJxVjLsOwjAMAP_FM4qSNg1xR3a-IXJsQwookfqYEP-OKnWA9e50b0i0rSVti85pEhjBwemXZeKn1l3Ig-q9GW51nads9sQcdjHXJvq6HO3foNBSYAS0aHEIN1QfOLJ2XjocgkUlK4wUnM_9kCmLOuEz9sQYfR9FMDvGCJ8v3MA4Hg:1w4bGq:E_Ly8kU0I1NhYpMJXpD30thEcsVcABPBYAEVaTmDVIA', '2026-04-06 09:08:24.822967'),
('vsiu6gnivg1fiwtlzaa4c911bvjvvppk', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vyXj7:HpgAUe467sP8KdDMqaKcA9ZnC0xL26WzwSqa8hdFIyo', '2026-03-20 16:08:33.258741'),
('y4sljecm1e8c4nbabszosal1ah8hnepk', '.eJxVjDkOwjAQAP-yNbJie83GKel5Q-Q9IAHkSDkqxN9RpBTQzozmDX3Z1qHfFpv7UaGDEOH0C7nI0-pu9FHqfXIy1XUe2e2JO-zirpPa63K0f4OhLAN0QGekps0xG5mn2BKZerz5JMLqA1niwJibwlkxZGFOQoqG2VMiFPh8Ae9bN78:1vxoEZ:Trf2GAvHOdhl0WMXmTZrRf-ZWyFQM3HNnDnbW14KjEA', '2026-03-18 15:33:59.923603'),
('yz5g033gx15ieoxsk8y5ioc6x4m3h7yk', '.eJxVjMsKwyAQAP9lz0VcH6g59t5vEHXXmrYYiMmp9N9LIIf2OjPMG2Latxb3wWucCSZAuPyynMqT-yHokfp9EWXp2zpncSTitEPcFuLX9Wz_Bi2NBhOwzrai8toFo6uyVVefCB3LYKTPFLwKRNUUJm9tZokoMasU0DuHJOHzBdpMN3g:1vyBnC:YEAqxzBJZ6I-L-ds3eYBSx4fKf2YP-t_TmAiqgWcACE', '2026-03-19 16:43:18.349554');

-- --------------------------------------------------------

--
-- Table structure for table `sms_attendance`
--

CREATE TABLE `sms_attendance` (
  `id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_attendance`
--

INSERT INTO `sms_attendance` (`id`, `attendance_date`, `created_at`, `updated_at`, `subject_id`) VALUES
(2, '2026-03-05', '2026-03-03 18:02:58.427287', '2026-03-03 18:02:58.427305', 14),
(3, '2026-03-03', '2026-03-03 18:03:29.215089', '2026-03-03 18:03:29.215112', 14),
(4, '2026-03-03', '2026-03-03 18:31:30.876831', '2026-03-03 18:31:30.876867', 14),
(5, '2026-03-05', '2026-03-05 10:22:37.891886', '2026-03-05 10:22:37.891912', 14),
(6, '2026-03-23', '2026-03-23 08:24:04.597850', '2026-03-23 08:24:04.597879', 21),
(7, '2026-03-23', '2026-03-23 08:24:04.638848', '2026-03-23 08:24:04.638885', 54),
(8, '2026-03-23', '2026-03-23 08:24:04.660877', '2026-03-23 08:24:04.660903', 50),
(9, '2026-03-23', '2026-03-23 08:24:04.675750', '2026-03-23 08:24:04.675779', 28),
(10, '2026-03-23', '2026-03-23 08:24:04.681065', '2026-03-23 08:24:04.681089', 51),
(11, '2026-03-22', '2026-03-23 08:24:04.698437', '2026-03-23 08:24:04.698462', 35),
(12, '2026-03-22', '2026-03-23 08:24:04.840969', '2026-03-23 08:24:04.841005', 30),
(13, '2026-03-22', '2026-03-23 08:24:04.861538', '2026-03-23 08:24:04.861573', 48),
(14, '2026-03-22', '2026-03-23 08:24:04.869312', '2026-03-23 08:24:04.869336', 21),
(15, '2026-03-22', '2026-03-23 08:24:04.880953', '2026-03-23 08:24:04.880984', 27),
(16, '2026-03-21', '2026-03-23 08:24:04.886394', '2026-03-23 08:24:04.886433', 50),
(17, '2026-03-21', '2026-03-23 08:24:04.902993', '2026-03-23 08:24:04.903030', 44),
(18, '2026-03-21', '2026-03-23 08:24:04.914062', '2026-03-23 08:24:04.914098', 25),
(19, '2026-03-21', '2026-03-23 08:24:04.919928', '2026-03-23 08:24:04.919951', 34),
(20, '2026-03-21', '2026-03-23 08:24:04.929475', '2026-03-23 08:24:04.929490', 31),
(21, '2026-03-20', '2026-03-23 08:24:04.942020', '2026-03-23 08:24:04.942033', 26),
(22, '2026-03-20', '2026-03-23 08:24:04.944846', '2026-03-23 08:24:04.944859', 38),
(23, '2026-03-20', '2026-03-23 08:24:04.948712', '2026-03-23 08:24:04.948747', 36),
(24, '2026-03-20', '2026-03-23 08:24:04.957131', '2026-03-23 08:24:04.957144', 21),
(25, '2026-03-20', '2026-03-23 08:24:04.965667', '2026-03-23 08:24:04.965688', 29),
(26, '2026-03-19', '2026-03-23 08:24:04.976983', '2026-03-23 08:24:04.977004', 53),
(27, '2026-03-19', '2026-03-23 08:24:04.989489', '2026-03-23 08:24:04.989510', 19),
(28, '2026-03-19', '2026-03-23 08:24:05.001170', '2026-03-23 08:24:05.001188', 28),
(29, '2026-03-19', '2026-03-23 08:24:05.004659', '2026-03-23 08:24:05.004674', 52),
(30, '2026-03-19', '2026-03-23 08:24:05.018523', '2026-03-23 08:24:05.018548', 23),
(31, '2026-03-23', '2026-03-23 08:25:16.838722', '2026-03-23 08:25:16.838735', 74),
(32, '2026-03-23', '2026-03-23 08:25:16.853923', '2026-03-23 08:25:16.853939', 62),
(33, '2026-03-23', '2026-03-23 08:25:16.858812', '2026-03-23 08:25:16.858856', 26),
(34, '2026-03-23', '2026-03-23 08:25:16.865282', '2026-03-23 08:25:16.865296', 32),
(35, '2026-03-23', '2026-03-23 08:25:16.884670', '2026-03-23 08:25:16.884686', 72),
(36, '2026-03-22', '2026-03-23 08:25:16.889812', '2026-03-23 08:25:16.889824', 62),
(37, '2026-03-22', '2026-03-23 08:25:16.895158', '2026-03-23 08:25:16.895180', 26),
(38, '2026-03-22', '2026-03-23 08:25:16.900515', '2026-03-23 08:25:16.900533', 61),
(39, '2026-03-22', '2026-03-23 08:25:16.915714', '2026-03-23 08:25:16.915728', 65),
(40, '2026-03-21', '2026-03-23 08:25:16.929368', '2026-03-23 08:25:16.929388', 37),
(41, '2026-03-21', '2026-03-23 08:25:16.935172', '2026-03-23 08:25:16.935187', 61),
(42, '2026-03-21', '2026-03-23 08:25:16.939993', '2026-03-23 08:25:16.940005', 36),
(43, '2026-03-21', '2026-03-23 08:25:16.954689', '2026-03-23 08:25:16.954707', 59),
(44, '2026-03-21', '2026-03-23 08:25:16.974723', '2026-03-23 08:25:16.974754', 42),
(45, '2026-03-20', '2026-03-23 08:25:16.991140', '2026-03-23 08:25:16.991165', 54),
(46, '2026-03-20', '2026-03-23 08:25:17.012413', '2026-03-23 08:25:17.012433', 34),
(47, '2026-03-20', '2026-03-23 08:25:17.030379', '2026-03-23 08:25:17.030393', 47),
(48, '2026-03-20', '2026-03-23 08:25:17.036342', '2026-03-23 08:25:17.036355', 70),
(49, '2026-03-19', '2026-03-23 08:25:17.046738', '2026-03-23 08:25:17.046756', 32),
(50, '2026-03-19', '2026-03-23 08:25:17.065544', '2026-03-23 08:25:17.065579', 74),
(51, '2026-03-19', '2026-03-23 08:25:17.080747', '2026-03-23 08:25:17.080765', 55),
(52, '2026-03-19', '2026-03-23 08:25:17.094971', '2026-03-23 08:25:17.094991', 34),
(53, '2026-03-19', '2026-03-23 08:25:17.109490', '2026-03-23 08:25:17.109517', 47),
(54, '2026-03-23', '2026-03-23 08:26:00.084499', '2026-03-23 08:26:00.084517', 92),
(55, '2026-03-23', '2026-03-23 08:26:00.114977', '2026-03-23 08:26:00.115002', 46),
(56, '2026-03-23', '2026-03-23 08:26:00.125387', '2026-03-23 08:26:00.125408', 43),
(57, '2026-03-23', '2026-03-23 08:26:00.141880', '2026-03-23 08:26:00.141907', 38),
(58, '2026-03-23', '2026-03-23 08:26:00.148704', '2026-03-23 08:26:00.148733', 69),
(59, '2026-03-23', '2026-03-23 08:26:00.163929', '2026-03-23 08:26:00.163949', 24),
(60, '2026-03-23', '2026-03-23 08:26:00.191829', '2026-03-23 08:26:00.191865', 36),
(61, '2026-03-22', '2026-03-23 08:26:00.209083', '2026-03-23 08:26:00.209104', 77),
(62, '2026-03-22', '2026-03-23 08:26:00.234194', '2026-03-23 08:26:00.234213', 92),
(63, '2026-03-22', '2026-03-23 08:26:00.246667', '2026-03-23 08:26:00.246689', 89),
(64, '2026-03-22', '2026-03-23 08:26:00.251184', '2026-03-23 08:26:00.251197', 87),
(65, '2026-03-22', '2026-03-23 08:26:00.265763', '2026-03-23 08:26:00.265793', 50),
(66, '2026-03-22', '2026-03-23 08:26:00.285504', '2026-03-23 08:26:00.285522', 84),
(67, '2026-03-22', '2026-03-23 08:26:00.310561', '2026-03-23 08:26:00.310590', 76),
(68, '2026-03-21', '2026-03-23 08:26:00.333899', '2026-03-23 08:26:00.333913', 98),
(69, '2026-03-21', '2026-03-23 08:26:00.355220', '2026-03-23 08:26:00.355239', 27),
(70, '2026-03-21', '2026-03-23 08:26:00.367376', '2026-03-23 08:26:00.367404', 87),
(71, '2026-03-21', '2026-03-23 08:26:00.381460', '2026-03-23 08:26:00.381475', 95),
(72, '2026-03-21', '2026-03-23 08:26:00.390927', '2026-03-23 08:26:00.390943', 100),
(73, '2026-03-21', '2026-03-23 08:26:00.412886', '2026-03-23 08:26:00.412900', 53),
(74, '2026-03-21', '2026-03-23 08:26:00.436226', '2026-03-23 08:26:00.436249', 94),
(75, '2026-03-20', '2026-03-23 08:26:00.445650', '2026-03-23 08:26:00.445666', 84),
(76, '2026-03-20', '2026-03-23 08:26:00.469900', '2026-03-23 08:26:00.469917', 82),
(77, '2026-03-20', '2026-03-23 08:26:00.474976', '2026-03-23 08:26:00.475001', 24),
(78, '2026-03-20', '2026-03-23 08:26:00.500730', '2026-03-23 08:26:00.500744', 100),
(79, '2026-03-20', '2026-03-23 08:26:00.523264', '2026-03-23 08:26:00.523282', 98),
(80, '2026-03-20', '2026-03-23 08:26:00.550787', '2026-03-23 08:26:00.550803', 50),
(81, '2026-03-20', '2026-03-23 08:26:00.571791', '2026-03-23 08:26:00.571806', 78),
(82, '2026-03-19', '2026-03-23 08:26:00.603463', '2026-03-23 08:26:00.603485', 56),
(83, '2026-03-19', '2026-03-23 08:26:00.635954', '2026-03-23 08:26:00.635977', 50),
(84, '2026-03-19', '2026-03-23 08:26:00.657870', '2026-03-23 08:26:00.657892', 95),
(85, '2026-03-19', '2026-03-23 08:26:00.668852', '2026-03-23 08:26:00.668876', 77),
(86, '2026-03-19', '2026-03-23 08:26:00.700060', '2026-03-23 08:26:00.700075', 98),
(87, '2026-03-19', '2026-03-23 08:26:00.719661', '2026-03-23 08:26:00.719675', 87),
(88, '2026-03-19', '2026-03-23 08:26:00.734033', '2026-03-23 08:26:00.734050', 83),
(89, '2026-03-25', '2026-03-25 05:57:22.511344', '2026-03-25 05:57:22.511436', 17);

-- --------------------------------------------------------

--
-- Table structure for table `sms_attendancereport`
--

CREATE TABLE `sms_attendancereport` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_attendancereport`
--

INSERT INTO `sms_attendancereport` (`id`, `status`, `created_at`, `updated_at`, `attendance_id`, `student_id`) VALUES
(2, 1, '2026-03-03 18:03:29.229298', '2026-03-03 18:03:29.229315', 3, 9),
(3, 1, '2026-03-03 18:31:30.892534', '2026-03-03 18:31:30.892577', 4, 9),
(4, 1, '2026-03-03 18:31:30.897785', '2026-03-03 18:31:30.897801', 4, 10),
(5, 1, '2026-03-03 18:31:30.899966', '2026-03-03 18:31:30.899984', 4, 11),
(6, 1, '2026-03-05 10:22:37.897575', '2026-03-05 10:22:37.897606', 5, 9),
(7, 1, '2026-03-05 10:22:37.902636', '2026-03-05 10:22:37.902683', 5, 10),
(8, 0, '2026-03-05 10:22:37.910006', '2026-03-05 10:22:37.910045', 5, 11),
(9, 1, '2026-03-23 08:24:04.629756', '2026-03-23 08:24:04.629781', 6, 9),
(10, 1, '2026-03-23 08:24:04.634405', '2026-03-23 08:24:04.634439', 6, 12),
(11, 1, '2026-03-23 08:24:04.648064', '2026-03-23 08:24:04.648130', 7, 13),
(12, 1, '2026-03-23 08:24:04.652648', '2026-03-23 08:24:04.652680', 7, 21),
(13, 1, '2026-03-23 08:24:04.656835', '2026-03-23 08:24:04.656868', 7, 25),
(14, 1, '2026-03-23 08:24:04.667492', '2026-03-23 08:24:04.667548', 8, 23),
(15, 0, '2026-03-23 08:24:04.671827', '2026-03-23 08:24:04.671867', 8, 24),
(16, 1, '2026-03-23 08:24:04.687888', '2026-03-23 08:24:04.687942', 10, 23),
(17, 1, '2026-03-23 08:24:04.693020', '2026-03-23 08:24:04.693063', 10, 24),
(18, 1, '2026-03-23 08:24:04.704699', '2026-03-23 08:24:04.704722', 11, 22),
(19, 1, '2026-03-23 08:24:04.780657', '2026-03-23 08:24:04.780709', 11, 26),
(20, 1, '2026-03-23 08:24:04.850112', '2026-03-23 08:24:04.850153', 12, 14),
(21, 0, '2026-03-23 08:24:04.854295', '2026-03-23 08:24:04.854335', 12, 17),
(22, 1, '2026-03-23 08:24:04.857995', '2026-03-23 08:24:04.858033', 12, 19),
(23, 0, '2026-03-23 08:24:04.874245', '2026-03-23 08:24:04.874274', 14, 9),
(24, 1, '2026-03-23 08:24:04.877543', '2026-03-23 08:24:04.877567', 14, 12),
(25, 1, '2026-03-23 08:24:04.892784', '2026-03-23 08:24:04.892828', 16, 23),
(26, 1, '2026-03-23 08:24:04.897501', '2026-03-23 08:24:04.897553', 16, 24),
(27, 0, '2026-03-23 08:24:04.909515', '2026-03-23 08:24:04.909557', 17, 18),
(28, 1, '2026-03-23 08:24:04.924598', '2026-03-23 08:24:04.924633', 19, 22),
(29, 0, '2026-03-23 08:24:04.927249', '2026-03-23 08:24:04.927267', 19, 26),
(30, 1, '2026-03-23 08:24:04.934474', '2026-03-23 08:24:04.934498', 20, 14),
(31, 1, '2026-03-23 08:24:04.937119', '2026-03-23 08:24:04.937138', 20, 17),
(32, 1, '2026-03-23 08:24:04.939696', '2026-03-23 08:24:04.939711', 20, 19),
(33, 1, '2026-03-23 08:24:04.952960', '2026-03-23 08:24:04.952980', 23, 22),
(34, 1, '2026-03-23 08:24:04.955159', '2026-03-23 08:24:04.955177', 23, 26),
(35, 0, '2026-03-23 08:24:04.959861', '2026-03-23 08:24:04.959877', 24, 9),
(36, 1, '2026-03-23 08:24:04.962282', '2026-03-23 08:24:04.962296', 24, 12),
(37, 1, '2026-03-23 08:24:04.969557', '2026-03-23 08:24:04.969575', 25, 14),
(38, 1, '2026-03-23 08:24:04.972015', '2026-03-23 08:24:04.972029', 25, 17),
(39, 1, '2026-03-23 08:24:04.974361', '2026-03-23 08:24:04.974376', 25, 19),
(40, 0, '2026-03-23 08:24:04.980144', '2026-03-23 08:24:04.980161', 26, 13),
(41, 1, '2026-03-23 08:24:04.983788', '2026-03-23 08:24:04.983817', 26, 21),
(42, 0, '2026-03-23 08:24:04.986872', '2026-03-23 08:24:04.986896', 26, 25),
(43, 0, '2026-03-23 08:24:04.993551', '2026-03-23 08:24:04.993574', 27, 9),
(44, 1, '2026-03-23 08:24:04.997462', '2026-03-23 08:24:04.997544', 27, 12),
(45, 1, '2026-03-23 08:24:05.009083', '2026-03-23 08:24:05.009102', 29, 13),
(46, 0, '2026-03-23 08:24:05.011683', '2026-03-23 08:24:05.011702', 29, 21),
(47, 1, '2026-03-23 08:24:05.014890', '2026-03-23 08:24:05.014933', 29, 25),
(48, 1, '2026-03-23 08:24:05.022959', '2026-03-23 08:24:05.022988', 30, 10),
(49, 0, '2026-03-23 08:24:05.025719', '2026-03-23 08:24:05.025742', 30, 11),
(50, 1, '2026-03-23 08:24:05.028440', '2026-03-23 08:24:05.028457', 30, 15),
(51, 0, '2026-03-23 08:25:16.845696', '2026-03-23 08:25:16.845723', 31, 23),
(52, 1, '2026-03-23 08:25:16.850092', '2026-03-23 08:25:16.850113', 31, 24),
(53, 1, '2026-03-23 08:25:16.870709', '2026-03-23 08:25:16.870725', 34, 14),
(54, 1, '2026-03-23 08:25:16.874367', '2026-03-23 08:25:16.874381', 34, 17),
(55, 1, '2026-03-23 08:25:16.879964', '2026-03-23 08:25:16.879988', 34, 19),
(56, 1, '2026-03-23 08:25:16.920460', '2026-03-23 08:25:16.920483', 39, 22),
(57, 1, '2026-03-23 08:25:16.923865', '2026-03-23 08:25:16.923879', 39, 26),
(58, 1, '2026-03-23 08:25:16.946907', '2026-03-23 08:25:16.946926', 42, 22),
(59, 1, '2026-03-23 08:25:16.950714', '2026-03-23 08:25:16.950733', 42, 26),
(60, 1, '2026-03-23 08:25:16.961157', '2026-03-23 08:25:16.961181', 43, 10),
(61, 1, '2026-03-23 08:25:16.965642', '2026-03-23 08:25:16.965661', 43, 11),
(62, 1, '2026-03-23 08:25:16.969813', '2026-03-23 08:25:16.969835', 43, 15),
(63, 0, '2026-03-23 08:25:16.982148', '2026-03-23 08:25:16.982172', 44, 16),
(64, 0, '2026-03-23 08:25:16.986515', '2026-03-23 08:25:16.986539', 44, 20),
(65, 0, '2026-03-23 08:25:16.998166', '2026-03-23 08:25:16.998188', 45, 13),
(66, 1, '2026-03-23 08:25:17.002788', '2026-03-23 08:25:17.002813', 45, 21),
(67, 1, '2026-03-23 08:25:17.007171', '2026-03-23 08:25:17.007189', 45, 25),
(68, 1, '2026-03-23 08:25:17.019074', '2026-03-23 08:25:17.019089', 46, 22),
(69, 1, '2026-03-23 08:25:17.022851', '2026-03-23 08:25:17.022869', 46, 26),
(70, 1, '2026-03-23 08:25:17.042535', '2026-03-23 08:25:17.042570', 48, 18),
(71, 1, '2026-03-23 08:25:17.052537', '2026-03-23 08:25:17.052563', 49, 14),
(72, 1, '2026-03-23 08:25:17.056401', '2026-03-23 08:25:17.056422', 49, 17),
(73, 1, '2026-03-23 08:25:17.061224', '2026-03-23 08:25:17.061248', 49, 19),
(74, 1, '2026-03-23 08:25:17.071280', '2026-03-23 08:25:17.071300', 50, 23),
(75, 1, '2026-03-23 08:25:17.076023', '2026-03-23 08:25:17.076060', 50, 24),
(76, 1, '2026-03-23 08:25:17.085768', '2026-03-23 08:25:17.085785', 51, 9),
(77, 1, '2026-03-23 08:25:17.089967', '2026-03-23 08:25:17.089980', 51, 12),
(78, 0, '2026-03-23 08:25:17.100097', '2026-03-23 08:25:17.100114', 52, 22),
(79, 0, '2026-03-23 08:25:17.104680', '2026-03-23 08:25:17.104700', 52, 26),
(80, 1, '2026-03-23 08:26:00.104687', '2026-03-23 08:26:00.104711', 54, 16),
(81, 1, '2026-03-23 08:26:00.110463', '2026-03-23 08:26:00.110497', 54, 20),
(82, 1, '2026-03-23 08:26:00.121272', '2026-03-23 08:26:00.121292', 55, 28),
(83, 1, '2026-03-23 08:26:00.132315', '2026-03-23 08:26:00.132343', 56, 18),
(84, 0, '2026-03-23 08:26:00.136975', '2026-03-23 08:26:00.137003', 56, 36),
(85, 1, '2026-03-23 08:26:00.155590', '2026-03-23 08:26:00.155609', 58, 16),
(86, 1, '2026-03-23 08:26:00.159650', '2026-03-23 08:26:00.159681', 58, 20),
(87, 1, '2026-03-23 08:26:00.171067', '2026-03-23 08:26:00.171101', 59, 10),
(88, 0, '2026-03-23 08:26:00.174969', '2026-03-23 08:26:00.175012', 59, 11),
(89, 0, '2026-03-23 08:26:00.179676', '2026-03-23 08:26:00.179696', 59, 15),
(90, 0, '2026-03-23 08:26:00.183471', '2026-03-23 08:26:00.183491', 59, 29),
(91, 1, '2026-03-23 08:26:00.187317', '2026-03-23 08:26:00.187336', 59, 31),
(92, 1, '2026-03-23 08:26:00.200717', '2026-03-23 08:26:00.200744', 60, 22),
(93, 1, '2026-03-23 08:26:00.204758', '2026-03-23 08:26:00.204793', 60, 26),
(94, 0, '2026-03-23 08:26:00.214725', '2026-03-23 08:26:00.214750', 61, 9),
(95, 1, '2026-03-23 08:26:00.218480', '2026-03-23 08:26:00.218498', 61, 12),
(96, 0, '2026-03-23 08:26:00.222056', '2026-03-23 08:26:00.222075', 61, 32),
(97, 1, '2026-03-23 08:26:00.226293', '2026-03-23 08:26:00.226319', 61, 33),
(98, 1, '2026-03-23 08:26:00.230182', '2026-03-23 08:26:00.230198', 61, 35),
(99, 1, '2026-03-23 08:26:00.238849', '2026-03-23 08:26:00.238865', 62, 16),
(100, 0, '2026-03-23 08:26:00.242779', '2026-03-23 08:26:00.242818', 62, 20),
(101, 0, '2026-03-23 08:26:00.257077', '2026-03-23 08:26:00.257116', 64, 22),
(102, 1, '2026-03-23 08:26:00.261594', '2026-03-23 08:26:00.261636', 64, 26),
(103, 1, '2026-03-23 08:26:00.272284', '2026-03-23 08:26:00.272310', 65, 23),
(104, 1, '2026-03-23 08:26:00.277075', '2026-03-23 08:26:00.277100', 65, 24),
(105, 1, '2026-03-23 08:26:00.281436', '2026-03-23 08:26:00.281460', 65, 27),
(106, 0, '2026-03-23 08:26:00.290596', '2026-03-23 08:26:00.290614', 66, 14),
(107, 1, '2026-03-23 08:26:00.295151', '2026-03-23 08:26:00.295177', 66, 17),
(108, 0, '2026-03-23 08:26:00.299940', '2026-03-23 08:26:00.299977', 66, 19),
(109, 0, '2026-03-23 08:26:00.305292', '2026-03-23 08:26:00.305348', 66, 34),
(110, 0, '2026-03-23 08:26:00.316947', '2026-03-23 08:26:00.316965', 67, 13),
(111, 1, '2026-03-23 08:26:00.320890', '2026-03-23 08:26:00.320910', 67, 21),
(112, 1, '2026-03-23 08:26:00.325307', '2026-03-23 08:26:00.325338', 67, 25),
(113, 0, '2026-03-23 08:26:00.329702', '2026-03-23 08:26:00.329722', 67, 30),
(114, 1, '2026-03-23 08:26:00.341692', '2026-03-23 08:26:00.341728', 68, 23),
(115, 1, '2026-03-23 08:26:00.346321', '2026-03-23 08:26:00.346370', 68, 24),
(116, 1, '2026-03-23 08:26:00.350674', '2026-03-23 08:26:00.350697', 68, 27),
(117, 1, '2026-03-23 08:26:00.373010', '2026-03-23 08:26:00.373032', 70, 22),
(118, 0, '2026-03-23 08:26:00.377350', '2026-03-23 08:26:00.377368', 70, 26),
(119, 1, '2026-03-23 08:26:00.386722', '2026-03-23 08:26:00.386741', 71, 28),
(120, 0, '2026-03-23 08:26:00.396173', '2026-03-23 08:26:00.396191', 72, 13),
(121, 1, '2026-03-23 08:26:00.400195', '2026-03-23 08:26:00.400216', 72, 21),
(122, 1, '2026-03-23 08:26:00.404440', '2026-03-23 08:26:00.404457', 72, 25),
(123, 0, '2026-03-23 08:26:00.408698', '2026-03-23 08:26:00.408732', 72, 30),
(124, 0, '2026-03-23 08:26:00.418655', '2026-03-23 08:26:00.418671', 73, 13),
(125, 0, '2026-03-23 08:26:00.422751', '2026-03-23 08:26:00.422770', 73, 21),
(126, 1, '2026-03-23 08:26:00.427944', '2026-03-23 08:26:00.427968', 73, 25),
(127, 1, '2026-03-23 08:26:00.432168', '2026-03-23 08:26:00.432185', 73, 30),
(128, 1, '2026-03-23 08:26:00.441079', '2026-03-23 08:26:00.441099', 74, 28),
(129, 0, '2026-03-23 08:26:00.450896', '2026-03-23 08:26:00.450913', 75, 14),
(130, 1, '2026-03-23 08:26:00.454939', '2026-03-23 08:26:00.454956', 75, 17),
(131, 0, '2026-03-23 08:26:00.459862', '2026-03-23 08:26:00.459934', 75, 19),
(132, 1, '2026-03-23 08:26:00.464434', '2026-03-23 08:26:00.464453', 75, 34),
(133, 1, '2026-03-23 08:26:00.480316', '2026-03-23 08:26:00.480343', 77, 10),
(134, 1, '2026-03-23 08:26:00.484137', '2026-03-23 08:26:00.484156', 77, 11),
(135, 1, '2026-03-23 08:26:00.488169', '2026-03-23 08:26:00.488184', 77, 15),
(136, 0, '2026-03-23 08:26:00.492547', '2026-03-23 08:26:00.492570', 77, 29),
(137, 1, '2026-03-23 08:26:00.496922', '2026-03-23 08:26:00.496943', 77, 31),
(138, 0, '2026-03-23 08:26:00.505621', '2026-03-23 08:26:00.505636', 78, 13),
(139, 1, '2026-03-23 08:26:00.510044', '2026-03-23 08:26:00.510073', 78, 21),
(140, 0, '2026-03-23 08:26:00.514893', '2026-03-23 08:26:00.514911', 78, 25),
(141, 1, '2026-03-23 08:26:00.519089', '2026-03-23 08:26:00.519112', 78, 30),
(142, 0, '2026-03-23 08:26:00.531062', '2026-03-23 08:26:00.531085', 79, 23),
(143, 1, '2026-03-23 08:26:00.539338', '2026-03-23 08:26:00.539375', 79, 24),
(144, 1, '2026-03-23 08:26:00.546322', '2026-03-23 08:26:00.546341', 79, 27),
(145, 1, '2026-03-23 08:26:00.555997', '2026-03-23 08:26:00.556012', 80, 23),
(146, 0, '2026-03-23 08:26:00.561802', '2026-03-23 08:26:00.561822', 80, 24),
(147, 0, '2026-03-23 08:26:00.566891', '2026-03-23 08:26:00.566909', 80, 27),
(148, 0, '2026-03-23 08:26:00.578937', '2026-03-23 08:26:00.578958', 81, 9),
(149, 0, '2026-03-23 08:26:00.583405', '2026-03-23 08:26:00.583424', 81, 12),
(150, 1, '2026-03-23 08:26:00.588128', '2026-03-23 08:26:00.588146', 81, 32),
(151, 1, '2026-03-23 08:26:00.593645', '2026-03-23 08:26:00.593683', 81, 33),
(152, 1, '2026-03-23 08:26:00.598648', '2026-03-23 08:26:00.598673', 81, 35),
(153, 0, '2026-03-23 08:26:00.611930', '2026-03-23 08:26:00.611951', 82, 9),
(154, 0, '2026-03-23 08:26:00.616031', '2026-03-23 08:26:00.616050', 82, 12),
(155, 1, '2026-03-23 08:26:00.620824', '2026-03-23 08:26:00.620842', 82, 32),
(156, 1, '2026-03-23 08:26:00.626364', '2026-03-23 08:26:00.626387', 82, 33),
(157, 0, '2026-03-23 08:26:00.631154', '2026-03-23 08:26:00.631173', 82, 35),
(158, 1, '2026-03-23 08:26:00.642655', '2026-03-23 08:26:00.642698', 83, 23),
(159, 0, '2026-03-23 08:26:00.647551', '2026-03-23 08:26:00.647572', 83, 24),
(160, 1, '2026-03-23 08:26:00.652400', '2026-03-23 08:26:00.652421', 83, 27),
(161, 0, '2026-03-23 08:26:00.663636', '2026-03-23 08:26:00.663659', 84, 28),
(162, 1, '2026-03-23 08:26:00.675545', '2026-03-23 08:26:00.675602', 85, 9),
(163, 1, '2026-03-23 08:26:00.680591', '2026-03-23 08:26:00.680614', 85, 12),
(164, 0, '2026-03-23 08:26:00.685996', '2026-03-23 08:26:00.686015', 85, 32),
(165, 0, '2026-03-23 08:26:00.691105', '2026-03-23 08:26:00.691141', 85, 33),
(166, 1, '2026-03-23 08:26:00.696427', '2026-03-23 08:26:00.696455', 85, 35),
(167, 1, '2026-03-23 08:26:00.706048', '2026-03-23 08:26:00.706066', 86, 23),
(168, 1, '2026-03-23 08:26:00.710933', '2026-03-23 08:26:00.710967', 86, 24),
(169, 0, '2026-03-23 08:26:00.715716', '2026-03-23 08:26:00.715740', 86, 27),
(170, 1, '2026-03-23 08:26:00.724511', '2026-03-23 08:26:00.724529', 87, 22),
(171, 1, '2026-03-23 08:26:00.729552', '2026-03-23 08:26:00.729573', 87, 26),
(172, 0, '2026-03-25 05:57:22.527373', '2026-03-25 05:57:22.527430', 89, 9),
(173, 0, '2026-03-25 05:57:22.532515', '2026-03-25 05:57:22.532556', 89, 12),
(174, 0, '2026-03-25 05:57:22.536267', '2026-03-25 05:57:22.536301', 89, 32),
(175, 0, '2026-03-25 05:57:22.540602', '2026-03-25 05:57:22.540652', 89, 33),
(176, 0, '2026-03-25 05:57:22.545454', '2026-03-25 05:57:22.545506', 89, 35);

-- --------------------------------------------------------

--
-- Table structure for table `sms_contactus`
--

CREATE TABLE `sms_contactus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_course`
--

CREATE TABLE `sms_course` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_course`
--

INSERT INTO `sms_course` (`id`, `name`, `created_at`, `updated_at`, `department_id`, `fee`) VALUES
(16, 'bca', '2026-02-24 20:28:47.121006', '2026-03-03 18:14:39.032454', 7, 5000.00),
(17, 'mca', '2026-03-03 18:27:32.640630', '2026-03-03 18:27:32.640654', 7, 7000.00),
(18, 'business ', '2026-03-03 18:27:57.593784', '2026-03-03 18:27:57.593808', 8, 0.00),
(19, 'cts', '2026-03-03 18:28:26.137151', '2026-03-03 18:28:26.137176', 9, 6000.00),
(20, 'B.Tech', '2026-03-05 16:28:50.916428', '2026-03-05 16:28:50.916497', NULL, 12000.00),
(21, 'M.Sc CS', '2026-03-23 08:23:53.237374', '2026-03-23 08:23:53.237407', 11, 55355.00),
(22, 'B.Sc IT', '2026-03-23 08:23:53.240987', '2026-03-23 08:23:53.241006', 12, 49084.00),
(23, 'M.Sc IT', '2026-03-23 08:23:53.244394', '2026-03-23 08:23:53.244419', 12, 34196.00),
(24, 'BBA', '2026-03-23 08:23:53.247928', '2026-03-23 08:23:53.247950', 13, 48066.00),
(25, 'MBA', '2026-03-23 08:23:53.251320', '2026-03-23 08:23:53.251342', 13, 30365.00),
(26, 'B.Tech EE', '2026-03-23 08:23:53.254125', '2026-03-23 08:23:53.254146', 14, 30705.00),
(27, 'M.Tech EE', '2026-03-23 08:23:53.257092', '2026-03-23 08:23:53.257115', 14, 40542.00),
(28, 'BA English', '2026-03-23 08:23:53.261510', '2026-03-23 08:23:53.261547', 15, 31077.00),
(29, 'MA History', '2026-03-23 08:23:53.264857', '2026-03-23 08:23:53.264882', 15, 77118.00);

-- --------------------------------------------------------

--
-- Table structure for table `sms_customuser`
--

CREATE TABLE `sms_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_customuser`
--

INSERT INTO `sms_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `user_type`, `profile_pic`, `phone`) VALUES
(1, 'pbkdf2_sha256$600000$oZFvAOzgwZBGP4SzoDXJx4$+eonnxfe+qDwSkIsHLltyqm/sTvAqx/DO+2YVWo5j2s=', '2026-03-27 06:12:44.228010', 1, 'admin', 'Yash', 'kapatel', 'admin@example.com', 1, 1, '2026-01-28 17:16:08.000000', 'ADMIN', '', ''),
(20, 'pbkdf2_sha256$600000$iNpvyMwq6uytLMLrQIMkk2$JLF7ibEXPQ7Pot9eQdGPXer56sx3x67RcDgOZHCoIRE=', '2026-03-05 17:25:58.849906', 0, 'nikunj123', 'nikunj', 'kaPatel', 'nikunj2411@gmail.com', 0, 1, '2026-02-24 19:25:05.065727', 'TEACHER', '', '7229006772'),
(21, 'pbkdf2_sha256$600000$3FNdnAyq3Q0dunsUfYjg8W$iLV6aK7FfDPoADxeZLyRRjU7RHfcnFVSr5RY3cHaZzE=', NULL, 0, 'harsh2211', 'harsh', 'patel', 'harshpatel@gmail.com', 0, 1, '2026-02-24 19:55:25.245280', 'TEACHER', '', ''),
(22, 'pbkdf2_sha256$600000$UH8BXDUOnJ48JJN2csPu1X$eTtJAQYSaoIHz3aMevx9qh1gAgXiqqAPxHtY71zfbyA=', '2026-03-05 17:25:19.032990', 0, 'dhruv1702', 'dhruv', 'patel', 'dhruv123@gmail.com', 0, 1, '2026-02-24 20:32:58.216851', 'STUDENT', '', ''),
(24, 'pbkdf2_sha256$600000$n10kLaGLgIvMkl3lrxTz3E$P4vVtFL+zNpU4xlJUX+QPk8o/snwpYRCnj+pEYIs5Vg=', NULL, 0, 'manav_123', 'manav', 'patel', 'manav@gmail.com', 0, 1, '2026-03-03 18:10:29.338525', 'STUDENT', '', ''),
(25, 'pbkdf2_sha256$600000$uL2uY3Y2pOSH6d7OySNcbE$F+mvurn9JDeiBOLjrVLcdLZGe/vUhVD2gU3Fx9641VA=', NULL, 0, 'neel_123', 'neel', 'patel', 'neelbarot151099@gmail.com', 0, 1, '2026-03-03 18:26:55.439501', 'STUDENT', '', ''),
(26, 'pbkdf2_sha256$600000$LiAVTlXErIrI7FdnQcdxkl$5pW3bS2tgulzMT7Cnxa0OdRpAUdGO7hNoQVfBi814ZQ=', '2026-03-27 06:13:06.012685', 0, 'teacher1', 'John', 'Doe', 'john@gmail.com', 0, 1, '2026-03-05 16:28:50.959621', 'TEACHER', '', '1040506022'),
(27, 'pbkdf2_sha256$600000$Uru1hxgE4W7B2E86UG4igz$0fTb/a82Iut6fL8v9AKT6ZpVj1syTlNoHoyOr7Q56m8=', '2026-03-25 05:54:04.649246', 0, 'student1', 'Jane', 'Smith', 's1@example.com', 0, 1, '2026-03-05 16:28:51.546964', 'STUDENT', '', ''),
(28, 'pbkdf2_sha256$600000$vp5cR9wD5MnJSyjvwXAv7d$TWEZzqaL4Ls6cKBTznnm4D5DEXUDj/af0X2bWMETZTQ=', NULL, 0, 'teacher2', 'Aryan', 'Sharma', 'teacher2@gmail.com', 0, 1, '2026-03-23 08:23:53.272713', 'TEACHER', '', '9876543211'),
(29, 'pbkdf2_sha256$600000$CZpvAuZgvf6HyIP12Sbb4o$rEo4UqiGawMP4jwOOp2uhYxHdFwbPnh6W9um6pknDb4=', NULL, 0, 'teacher3', 'Sneha', 'Gupta', 'teacher3@gmail.com', 0, 1, '2026-03-23 08:23:53.722410', 'TEACHER', '', '9876543212'),
(30, 'pbkdf2_sha256$600000$GajjA2coGY6sV5A2or9LGr$WMeCs940KafzLfh5w2GwRwA1S7LL8kqENhPwH/EBXbY=', NULL, 0, 'teacher4', 'Rahul', 'Verma', 'teacher4@gmail.com', 0, 1, '2026-03-23 08:23:54.180748', 'TEACHER', '', '9876543213'),
(31, 'pbkdf2_sha256$600000$hd6750gPNvVKRkmR1wy8Ak$GYowdcfnvVtcNedmOiL6v/eioNUlkAXOEQrOD3Exjxk=', NULL, 0, 'teacher5', 'Priya', 'Singh', 'teacher5@gmail.com', 0, 1, '2026-03-23 08:23:54.596026', 'TEACHER', '', '9876543214'),
(32, 'pbkdf2_sha256$600000$RMVnD71eIfQlGj61DMp4zf$YtVnfyKA636XtZfdjyAovbbWrTRWorLYeYa7TP9cALY=', NULL, 0, 'teacher6', 'Amit', 'Kumar', 'teacher6@gmail.com', 0, 1, '2026-03-23 08:23:55.019634', 'TEACHER', '', '9876543215'),
(33, 'pbkdf2_sha256$600000$hrwt1pSVbW0Ns3tYbIDbaA$tXVZlE4juV1kYhl+h9JmhX1cXfvK7GiB4eoPQBoWQ8M=', NULL, 0, 'teacher7', 'Sonal', 'Mehta', 'teacher7@gmail.com', 0, 1, '2026-03-23 08:23:55.431702', 'TEACHER', '', '9876543216'),
(34, 'pbkdf2_sha256$600000$GI4TFz17y18pVHBvMKtfDT$v3p51xpPPmg8YShWTpvtsAOsZSRa9EIop2WNWkDZ9iw=', NULL, 0, 'teacher8', 'Vikram', 'Rathore', 'teacher8@gmail.com', 0, 1, '2026-03-23 08:23:55.942759', 'TEACHER', '', '9876543217'),
(35, 'pbkdf2_sha256$600000$JPIFv56kdyeG5vqrKs78Dg$b0NCMKPfI8DvZjA0FM08SeAEA0bP21rbep9GXFo52lE=', NULL, 0, 'teacher9', 'Anjali', 'Desai', 'teacher9@gmail.com', 0, 1, '2026-03-23 08:23:56.392816', 'TEACHER', '', '9876543218'),
(36, 'pbkdf2_sha256$600000$8ntekOzS3bII75eqw62W2k$upNCiy+Lijq0D55EL7htXEy1JB2j7jwMyJ0GhaQ3gSM=', NULL, 0, 'teacher10', 'Raj', 'Malhotra', 'teacher10@gmail.com', 0, 1, '2026-03-23 08:23:56.815916', 'TEACHER', '', '9876543219'),
(37, 'pbkdf2_sha256$600000$7thTGiNGOHykWMdQM8QTzq$pzwMkNtjVsU+hzZD05QS1Xs8PQV17ISX7QvJEXyo8+k=', '2026-03-25 05:21:32.514171', 0, 'student2', 'Vihaan', 'Shah', 'student2@gmail.com', 0, 1, '2026-03-23 08:23:57.481710', 'STUDENT', '', ''),
(38, 'pbkdf2_sha256$600000$8f18ZuKxP7hfKxdZtwrSg2$GW8c45+bejHAAmWy2JQwxzYI5IeaesvxIFHV5HKbZO8=', NULL, 0, 'student3', 'Myra', 'Iyer', 'student3@gmail.com', 0, 1, '2026-03-23 08:23:57.936747', 'STUDENT', '', ''),
(39, 'pbkdf2_sha256$600000$th0igChamG64QHKsOESdII$63FmBZc33ucJpnHNUyjstLXdBjYFw0xYN87RzCw+kmI=', NULL, 0, 'student4', 'Ananya', 'Nair', 'student4@gmail.com', 0, 1, '2026-03-23 08:23:58.488047', 'STUDENT', '', ''),
(40, 'pbkdf2_sha256$600000$BQPbOb1tiaciz8AP55FJE8$6zuhi8m3wnODn+fQgVGs6kFjZwu5/+9PXEuD95Hb/og=', NULL, 0, 'student5', 'Ishaan', 'Misra', 'student5@gmail.com', 0, 1, '2026-03-23 08:23:59.016204', 'STUDENT', '', ''),
(41, 'pbkdf2_sha256$600000$3Etmvq9OKLUz2eTgGlxTaw$UMrlWMiEAdOgSfDriknlx39h4jYzUld6YKmLpVB3tKg=', NULL, 0, 'student6', 'Sai', 'Reddy', 'student6@gmail.com', 0, 1, '2026-03-23 08:23:59.639824', 'STUDENT', '', ''),
(42, 'pbkdf2_sha256$600000$MFsjB2d6QI80bmnOOlXS51$bTOt0xJIXGnuhlQa4uT9sX7vS6wtxbEkbB/Hvdv46Co=', NULL, 0, 'student7', 'Zoya', 'Khan', 'student7@gmail.com', 0, 1, '2026-03-23 08:24:00.224626', 'STUDENT', '', ''),
(43, 'pbkdf2_sha256$600000$oeq5pdnPYBkiRd6xci1Cmr$NF697Q1O7Rf3wNCGN8psU8QhOeJPMDS1I3vETy+aOBI=', NULL, 0, 'student8', 'Kabir', 'Joshi', 'student8@gmail.com', 0, 1, '2026-03-23 08:24:00.803105', 'STUDENT', '', ''),
(44, 'pbkdf2_sha256$600000$sZZRcLUaKjHR1myBHrdGIK$k718abdEOG/72YpVA7VU8xUnfmp1PvFPlfA5fhcv7yY=', NULL, 0, 'student9', 'Diya', 'Bose', 'student9@gmail.com', 0, 1, '2026-03-23 08:24:01.337147', 'STUDENT', '', ''),
(45, 'pbkdf2_sha256$600000$U1tuTPyNcOhhjFNAESa4QU$VwLB4xobX+uWfQnd0QT458Mp3Y3S+JghhfN+pgRoGss=', NULL, 0, 'student10', 'Arjun', 'Gupta', 'student10@gmail.com', 0, 1, '2026-03-23 08:24:01.832537', 'STUDENT', '', ''),
(46, 'pbkdf2_sha256$600000$Vi8KwJD6gQSMWLZu8MMV0C$mctTys9bfyQi/Exd1KPMARX7yRhrKK8SfhYl93ei3sA=', NULL, 0, 'student11', 'Riya', 'Das', 'student11@gmail.com', 0, 1, '2026-03-23 08:24:02.275556', 'STUDENT', '', ''),
(47, 'pbkdf2_sha256$600000$gxczMhebtw3dJsnpYMwJhP$v0jP+Fp5YdH/Q1L01BxnHP/+5qsuCPjGmHUpZBfZxJA=', NULL, 0, 'student12', 'Aditya', 'Sen', 'student12@gmail.com', 0, 1, '2026-03-23 08:24:02.758764', 'STUDENT', '', ''),
(48, 'pbkdf2_sha256$600000$Jh4uTcpeAzqugrYhOsr4O2$4wws90PzUF8nOTz3BCACJJN8wGuOH+tmb7Txm4LcTmU=', NULL, 0, 'student13', 'Saanvi', 'Kapoor', 'student13@gmail.com', 0, 1, '2026-03-23 08:24:03.219623', 'STUDENT', '', ''),
(49, 'pbkdf2_sha256$600000$A02Viho5GlcTejsNqSPpj7$5fCeO7AIE86P1EW7bgcsYFW0KoCXsLXH7FfpDYfnijU=', NULL, 0, 'student14', 'Reyansh', 'Malhotra', 'student14@gmail.com', 0, 1, '2026-03-23 08:24:03.643503', 'STUDENT', '', ''),
(50, 'pbkdf2_sha256$600000$FzwRtlInSBPqbHaWgmHlCc$6vVBiSSHAnw3wOW/zDK6WVlAT8Hd27zhCvAtmpW+QvI=', NULL, 0, 'student15', 'Prisha', 'Chopra', 'student15@gmail.com', 0, 1, '2026-03-23 08:24:04.106202', 'STUDENT', '', ''),
(51, 'pbkdf2_sha256$600000$BDL9QIGjy57wWaeOJQIbEt$/JrMxGcomrO15SuKt5K+2UcFuWptIh/RZUFkAsvZ0qk=', NULL, 0, 'student16', 'Advait', 'Vats', 'student16@gmail.com', 0, 1, '2026-03-23 08:25:55.897720', 'STUDENT', '', ''),
(52, 'pbkdf2_sha256$600000$LYJEanHY6kIPdaUkFLZu9K$5Nx5Ai5cBNND0NuqsYT9Ep/LVhlNf8mutm5v0OGUlPE=', NULL, 0, 'student17', 'Kavya', 'Goyal', 'student17@gmail.com', 0, 1, '2026-03-23 08:25:56.247200', 'STUDENT', '', ''),
(53, 'pbkdf2_sha256$600000$vgCxv7meld0GpLU7uoygQW$YQ9uGC65JYRGYwyBanJKpza0BXYnEJ5PukKLjW0oPhw=', NULL, 0, 'student18', 'Aahil', 'Sheikh', 'student18@gmail.com', 0, 1, '2026-03-23 08:25:56.578614', 'STUDENT', '', ''),
(54, 'pbkdf2_sha256$600000$iEMZh9sRoJ7kH6SQp6bP39$xZAvLRo7YlU6ywjYmfPQF+dfICHdYo9opcfCAkN+oT8=', NULL, 0, 'student19', 'Navya', 'Iyer', 'student19@gmail.com', 0, 1, '2026-03-23 08:25:56.945988', 'STUDENT', '', ''),
(55, 'pbkdf2_sha256$600000$4v3UU0XsT7Cr6AE9SFKSrH$aCRdP5IBn8eJuZGq+cHpN+3XZt/fourjbsqSNtL2aUA=', NULL, 0, 'student20', 'Ishani', 'Bhardwaj', 'student20@gmail.com', 0, 1, '2026-03-23 08:25:57.308504', 'STUDENT', '', ''),
(56, 'pbkdf2_sha256$600000$p4VAXT3p58HneBos2FPbcs$D7CX4/9fHQ+FSZ7MdRpKiSWWLZ16royJXU8NeIOMpxU=', NULL, 0, 'student21', 'Shaan', 'Malik', 'student21@gmail.com', 0, 1, '2026-03-23 08:25:57.800393', 'STUDENT', '', ''),
(57, 'pbkdf2_sha256$600000$zbrhNReTL0h5k3iowB8KFR$5sNv4YDkVbEE9ghZmlQ/I3mkmKbmiEqP9kkZw67JrkM=', NULL, 0, 'student22', 'Kiara', 'Advani', 'student22@gmail.com', 0, 1, '2026-03-23 08:25:58.240088', 'STUDENT', '', ''),
(58, 'pbkdf2_sha256$600000$XiPtLhAVMS6ht4S4HeyVvq$o1uzNI9k8Iiiwl9eCAPadQo4iI6QkCTzA4l15xsyn/k=', NULL, 0, 'student23', 'Ranveer', 'Singh', 'student23@gmail.com', 0, 1, '2026-03-23 08:25:58.728434', 'STUDENT', '', ''),
(59, 'pbkdf2_sha256$600000$bg7E2V5yUUCglc8ahyv2uK$+X94Xq88iPHwfgXPiOrvAhcgqAhF2VS+jnasJ/C+tOc=', NULL, 0, 'student24', 'Deepika', 'Padukone', 'student24@gmail.com', 0, 1, '2026-03-23 08:25:59.147833', 'STUDENT', '', ''),
(60, 'pbkdf2_sha256$600000$kKkJGi9ssBwV8nbwSvPZvt$k7A24JujCunDGKqx5Ss1iUEvsTRUWUnvixd+REAOByg=', NULL, 0, 'student25', 'Ayush', 'Pandey', 'student25@gmail.com', 0, 1, '2026-03-23 08:25:59.477634', 'STUDENT', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sms_customuser_groups`
--

CREATE TABLE `sms_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_customuser_user_permissions`
--

CREATE TABLE `sms_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_dailylessontarget`
--

CREATE TABLE `sms_dailylessontarget` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `target_lessons` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_dailylessontarget`
--

INSERT INTO `sms_dailylessontarget` (`id`, `date`, `target_lessons`, `created_at`, `updated_at`, `teacher_id`) VALUES
(1, '2026-03-03', 3, '2026-03-03 18:14:08.355138', '2026-03-03 18:14:08.355156', 8),
(2, '2026-03-23', 5, '2026-03-23 08:19:55.711428', '2026-03-23 08:19:55.711526', 7),
(3, '2026-03-23', 4, '2026-03-23 08:24:04.531649', '2026-03-23 08:24:04.531674', 9),
(4, '2026-03-23', 5, '2026-03-23 08:24:04.537681', '2026-03-23 08:24:04.537697', 10),
(5, '2026-03-23', 4, '2026-03-23 08:24:04.542401', '2026-03-23 08:24:04.542417', 11),
(6, '2026-03-23', 4, '2026-03-23 08:24:04.551516', '2026-03-23 08:24:04.551548', 12),
(7, '2026-03-23', 4, '2026-03-23 08:24:04.556869', '2026-03-23 08:24:04.556887', 13),
(8, '2026-03-23', 5, '2026-03-23 08:24:04.563320', '2026-03-23 08:24:04.563353', 14),
(9, '2026-03-23', 4, '2026-03-23 08:24:04.569495', '2026-03-23 08:24:04.569513', 15),
(10, '2026-03-23', 6, '2026-03-23 08:24:04.575033', '2026-03-23 08:24:04.575051', 16),
(11, '2026-03-23', 4, '2026-03-23 08:24:04.581402', '2026-03-23 08:24:04.581437', 17),
(12, '2026-03-23', 5, '2026-03-23 08:24:04.587306', '2026-03-23 08:24:04.587323', 18);

-- --------------------------------------------------------

--
-- Table structure for table `sms_department`
--

CREATE TABLE `sms_department` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_department`
--

INSERT INTO `sms_department` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(7, 'cmpica', '', '2026-02-24 19:24:01.236280', '2026-02-24 19:24:01.236314'),
(8, 'iim', '', '2026-02-24 19:24:07.274081', '2026-02-24 19:24:07.274120'),
(9, 'abcd', 'iig', '2026-02-24 19:26:52.084602', '2026-02-24 19:26:52.084625'),
(10, 'cmpica', '132', '2026-02-24 19:56:33.634110', '2026-02-24 19:56:33.634157'),
(11, 'Computer Science', NULL, '2026-03-23 08:23:53.196031', '2026-03-23 08:23:53.196070'),
(12, 'Information Technology', NULL, '2026-03-23 08:23:53.207343', '2026-03-23 08:23:53.207390'),
(13, 'Business Administration', NULL, '2026-03-23 08:23:53.219646', '2026-03-23 08:23:53.219675'),
(14, 'Electrical Engineering', NULL, '2026-03-23 08:23:53.228185', '2026-03-23 08:23:53.228210'),
(15, 'Humanities', NULL, '2026-03-23 08:23:53.231770', '2026-03-23 08:23:53.231788');

-- --------------------------------------------------------

--
-- Table structure for table `sms_examschedule`
--

CREATE TABLE `sms_examschedule` (
  `id` bigint(20) NOT NULL,
  `exam_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `venue` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_examschedule`
--

INSERT INTO `sms_examschedule` (`id`, `exam_date`, `start_time`, `end_time`, `room_number`, `created_at`, `updated_at`, `subject_id`, `venue`) VALUES
(1, '2026-04-02', '10:00:00.000000', '13:00:00.000000', 'Room-302', '2026-03-23 08:25:17.124622', '2026-03-23 08:25:17.124671', 71, 'Main Hall'),
(2, '2026-04-01', '10:00:00.000000', '13:00:00.000000', 'Room-482', '2026-03-23 08:25:17.134502', '2026-03-23 08:25:17.134523', 74, 'Main Hall'),
(3, '2026-04-06', '10:00:00.000000', '13:00:00.000000', 'Room-177', '2026-03-23 08:25:17.140209', '2026-03-23 08:25:17.140229', 41, 'Main Hall'),
(4, '2026-04-06', '10:00:00.000000', '13:00:00.000000', 'Room-360', '2026-03-23 08:25:17.145678', '2026-03-23 08:25:17.145701', 34, 'Main Hall'),
(5, '2026-03-29', '10:00:00.000000', '13:00:00.000000', 'Room-295', '2026-03-23 08:25:17.150030', '2026-03-23 08:25:17.150047', 76, 'Main Hall'),
(6, '2026-03-30', '10:00:00.000000', '13:00:00.000000', 'Room-299', '2026-03-23 08:26:00.745449', '2026-03-23 08:26:00.745467', 93, 'Main Hall'),
(7, '2026-04-02', '10:00:00.000000', '13:00:00.000000', 'Room-324', '2026-03-23 08:26:00.750615', '2026-03-23 08:26:00.750630', 85, 'Main Hall'),
(8, '2026-04-06', '10:00:00.000000', '13:00:00.000000', 'Room-128', '2026-03-23 08:26:00.754380', '2026-03-23 08:26:00.754395', 83, 'Main Hall'),
(9, '2026-04-01', '10:00:00.000000', '13:00:00.000000', 'Room-410', '2026-03-23 08:26:00.759836', '2026-03-23 08:26:00.759854', 91, 'Main Hall'),
(10, '2026-03-30', '10:00:00.000000', '13:00:00.000000', 'Room-459', '2026-03-23 08:26:00.764638', '2026-03-23 08:26:00.764657', 90, 'Main Hall'),
(11, '2026-04-03', '10:00:00.000000', '13:00:00.000000', 'Room-330', '2026-03-23 08:26:00.769014', '2026-03-23 09:40:42.847919', 56, 'Main Hall'),
(12, '2020-02-20', '12:12:00.000000', '12:12:00.000000', '10', '2026-03-25 06:05:53.770719', '2026-03-25 06:05:53.770750', 73, 'Main Hall');

-- --------------------------------------------------------

--
-- Table structure for table `sms_fee`
--

CREATE TABLE `sms_fee` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_feedbackstudent`
--

CREATE TABLE `sms_feedbackstudent` (
  `id` bigint(20) NOT NULL,
  `feedback` longtext NOT NULL,
  `feedback_reply` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_feedbackteacher`
--

CREATE TABLE `sms_feedbackteacher` (
  `id` bigint(20) NOT NULL,
  `feedback` longtext NOT NULL,
  `feedback_reply` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_leavereportstudent`
--

CREATE TABLE `sms_leavereportstudent` (
  `id` bigint(20) NOT NULL,
  `leave_date` varchar(255) NOT NULL,
  `leave_message` longtext NOT NULL,
  `leave_status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_leavereportstudent`
--

INSERT INTO `sms_leavereportstudent` (`id`, `leave_date`, `leave_message`, `leave_status`, `created_at`, `updated_at`, `student_id`) VALUES
(1, '2020-02-25', 'testing', 2, '2026-03-25 05:54:54.854070', '2026-03-25 06:06:32.733675', 12);

-- --------------------------------------------------------

--
-- Table structure for table `sms_leavereportteacher`
--

CREATE TABLE `sms_leavereportteacher` (
  `id` bigint(20) NOT NULL,
  `leave_date` varchar(255) NOT NULL,
  `leave_message` longtext NOT NULL,
  `leave_status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_notificationstudent`
--

CREATE TABLE `sms_notificationstudent` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_notificationteacher`
--

CREATE TABLE `sms_notificationteacher` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_salary`
--

CREATE TABLE `sms_salary` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_salaryrequest`
--

CREATE TABLE `sms_salaryrequest` (
  `id` bigint(20) NOT NULL,
  `requested_amount` decimal(10,2) NOT NULL,
  `request_message` longtext NOT NULL,
  `request_status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_salaryrequest`
--

INSERT INTO `sms_salaryrequest` (`id`, `requested_amount`, `request_message`, `request_status`, `created_at`, `updated_at`, `teacher_id`) VALUES
(1, 70000.00, '', 1, '2026-03-10 09:45:37.709105', '2026-03-10 09:47:47.099928', 9),
(2, 250000.00, '', 1, '2026-03-14 19:10:09.306816', '2026-03-25 06:06:26.278267', 9);

-- --------------------------------------------------------

--
-- Table structure for table `sms_student`
--

CREATE TABLE `sms_student` (
  `id` bigint(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_student`
--

INSERT INTO `sms_student` (`id`, `gender`, `address`, `created_at`, `updated_at`, `course_id`, `user_id`) VALUES
(9, 'Male', 'Navli', '2026-02-24 20:32:59.112313', '2026-02-24 20:32:59.112396', 16, 22),
(10, 'Male', 'baroda', '2026-03-03 18:10:29.955983', '2026-03-05 17:46:13.744380', 17, 24),
(11, 'Male', 'navli', '2026-03-03 18:26:55.960896', '2026-03-05 17:46:13.747664', 17, 25),
(12, 'Female', '456 Student Rd', '2026-03-05 16:28:52.049847', '2026-03-05 16:28:52.049873', 16, 27),
(13, 'Male', '910 Student Square, Floor 2', '2026-03-23 08:23:57.933318', '2026-03-23 08:23:57.933340', 29, 37),
(14, 'Male', '451 Student Square, Floor 3', '2026-03-23 08:23:58.484559', '2026-03-23 08:23:58.484591', 22, 38),
(15, 'Female', '409 Student Square, Floor 4', '2026-03-23 08:23:59.008994', '2026-03-23 08:23:59.009022', 17, 39),
(16, 'Male', '591 Student Square, Floor 5', '2026-03-23 08:23:59.630945', '2026-03-23 08:23:59.630980', 25, 40),
(17, 'Female', '196 Student Square, Floor 1', '2026-03-23 08:24:00.219925', '2026-03-23 08:24:00.219966', 22, 41),
(18, 'Female', '123 Student Square, Floor 2', '2026-03-23 08:24:00.800421', '2026-03-23 08:24:00.800456', 26, 42),
(19, 'Male', '629 Student Square, Floor 3', '2026-03-23 08:24:01.331252', '2026-03-23 08:24:01.331276', 22, 43),
(20, 'Female', '371 Student Square, Floor 4', '2026-03-23 08:24:01.828166', '2026-03-23 08:24:01.828210', 25, 44),
(21, 'Male', '61 Student Square, Floor 5', '2026-03-23 08:24:02.272030', '2026-03-23 08:24:02.272049', 29, 45),
(22, 'Male', '713 Student Square, Floor 1', '2026-03-23 08:24:02.755580', '2026-03-23 08:24:02.755601', 23, 46),
(23, 'Male', '249 Student Square, Floor 2', '2026-03-23 08:24:03.216631', '2026-03-23 08:24:03.216653', 28, 47),
(24, 'Male', '356 Student Square, Floor 3', '2026-03-23 08:24:03.637698', '2026-03-23 08:24:03.637726', 28, 48),
(25, 'Female', '13 Student Square, Floor 4', '2026-03-23 08:24:04.098632', '2026-03-23 08:24:04.098665', 29, 49),
(26, 'Male', '612 Student Square, Floor 5', '2026-03-23 08:24:04.519077', '2026-03-23 08:24:04.519102', 23, 50),
(27, 'Female', '208 Student Square, Floor 1', '2026-03-23 08:25:56.240789', '2026-03-23 08:25:56.240829', 28, 51),
(28, 'Male', '848 Student Square, Floor 2', '2026-03-23 08:25:56.572581', '2026-03-23 08:25:56.572605', 27, 52),
(29, 'Female', '521 Student Square, Floor 3', '2026-03-23 08:25:56.941880', '2026-03-23 08:25:56.941910', 17, 53),
(30, 'Female', '718 Student Square, Floor 4', '2026-03-23 08:25:57.302427', '2026-03-23 08:25:57.302446', 29, 54),
(31, 'Female', '277 Student Square, Floor 5', '2026-03-23 08:25:57.794697', '2026-03-23 08:25:57.794738', 17, 55),
(32, 'Male', '747 Student Square, Floor 1', '2026-03-23 08:25:58.236793', '2026-03-23 08:25:58.236834', 16, 56),
(33, 'Female', '246 Student Square, Floor 2', '2026-03-23 08:25:58.723198', '2026-03-23 08:25:58.723220', 16, 57),
(34, 'Male', '296 Student Square, Floor 3', '2026-03-23 08:25:59.142859', '2026-03-23 08:25:59.142880', 22, 58),
(35, 'Female', '252 Student Square, Floor 4', '2026-03-23 08:25:59.473144', '2026-03-23 08:25:59.473173', 16, 59),
(36, 'Female', '944 Student Square, Floor 5', '2026-03-23 08:25:59.812283', '2026-03-23 08:25:59.812311', 26, 60);

-- --------------------------------------------------------

--
-- Table structure for table `sms_studentfee`
--

CREATE TABLE `sms_studentfee` (
  `id` bigint(20) NOT NULL,
  `fee_amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_studentfee`
--

INSERT INTO `sms_studentfee` (`id`, `fee_amount`, `payment_date`, `description`, `status`, `created_at`, `updated_at`, `student_id`) VALUES
(2, 5200000.00, '2026-03-05', 'ok', 'Paid', '2026-03-05 17:37:23.990410', '2026-03-05 17:37:23.990427', 10),
(3, 1250.00, '2026-03-23', 'Installment for bca', 'Paid', '2026-03-23 08:25:59.837150', '2026-03-23 08:25:59.837164', 12),
(4, 19279.50, '2026-03-23', 'Installment for MA History', 'Paid', '2026-03-23 08:25:59.843693', '2026-03-23 08:25:59.843775', 13),
(5, 12271.00, '2026-03-23', 'Installment for B.Sc IT', 'Paid', '2026-03-23 08:25:59.849466', '2026-03-23 08:25:59.849483', 14),
(6, 1750.00, '2026-03-23', 'Installment for mca', 'Paid', '2026-03-23 08:25:59.857389', '2026-03-23 08:25:59.857400', 15),
(7, 7591.25, '2026-03-23', 'Installment for MBA', 'Paid', '2026-03-23 08:25:59.863443', '2026-03-23 08:25:59.863458', 16),
(8, 12271.00, '2026-03-23', 'Installment for B.Sc IT', 'Paid', '2026-03-23 08:25:59.869125', '2026-03-23 08:25:59.869141', 17),
(9, 7676.25, '2026-03-23', 'Installment for B.Tech EE', 'Paid', '2026-03-23 08:25:59.874475', '2026-03-23 08:25:59.874663', 18),
(10, 12271.00, '2026-03-23', 'Installment for B.Sc IT', 'Paid', '2026-03-23 08:25:59.880533', '2026-03-23 08:25:59.880546', 19),
(11, 7591.25, '2026-03-23', 'Installment for MBA', 'Paid', '2026-03-23 08:25:59.885866', '2026-03-23 08:25:59.885878', 20),
(12, 19279.50, '2026-03-23', 'Installment for MA History', 'Paid', '2026-03-23 08:25:59.892849', '2026-03-23 08:25:59.892870', 21),
(13, 8549.00, '2026-03-23', 'Installment for M.Sc IT', 'Paid', '2026-03-23 08:25:59.899388', '2026-03-23 08:25:59.899407', 22),
(14, 7769.25, '2026-03-23', 'Installment for BA English', 'Paid', '2026-03-23 08:25:59.905639', '2026-03-23 08:25:59.905659', 23),
(15, 7769.25, '2026-03-23', 'Installment for BA English', 'Paid', '2026-03-23 08:25:59.912259', '2026-03-23 08:25:59.912277', 24),
(16, 19279.50, '2026-03-23', 'Installment for MA History', 'Paid', '2026-03-23 08:25:59.918605', '2026-03-23 08:25:59.918624', 25),
(17, 8549.00, '2026-03-23', 'Installment for M.Sc IT', 'Paid', '2026-03-23 08:25:59.924114', '2026-03-23 08:25:59.924127', 26),
(18, 7769.25, '2026-03-23', 'Installment for BA English', 'Paid', '2026-03-23 08:25:59.929471', '2026-03-23 08:25:59.929485', 27),
(19, 10135.50, '2026-03-23', 'Installment for M.Tech EE', 'Paid', '2026-03-23 08:25:59.934065', '2026-03-23 08:25:59.934081', 28),
(20, 1750.00, '2026-03-23', 'Installment for mca', 'Paid', '2026-03-23 08:25:59.938948', '2026-03-23 08:25:59.938974', 29),
(21, 19279.50, '2026-03-23', 'Installment for MA History', 'Paid', '2026-03-23 08:25:59.944382', '2026-03-23 08:25:59.944399', 30),
(22, 1750.00, '2026-03-23', 'Installment for mca', 'Paid', '2026-03-23 08:25:59.949051', '2026-03-23 08:25:59.949065', 31),
(23, 1250.00, '2026-03-23', 'Installment for bca', 'Paid', '2026-03-23 08:25:59.953145', '2026-03-23 08:25:59.953162', 32),
(24, 1250.00, '2026-03-23', 'Installment for bca', 'Paid', '2026-03-23 08:25:59.958335', '2026-03-23 08:25:59.958364', 33),
(25, 12271.00, '2026-03-23', 'Installment for B.Sc IT', 'Paid', '2026-03-23 08:25:59.962909', '2026-03-23 08:25:59.962928', 34),
(26, 1250.00, '2026-03-23', 'Installment for bca', 'Paid', '2026-03-23 08:25:59.967260', '2026-03-23 08:25:59.967275', 35),
(27, 7676.25, '2026-03-23', 'Installment for B.Tech EE', 'Paid', '2026-03-23 08:25:59.971021', '2026-03-23 08:25:59.971034', 36);

-- --------------------------------------------------------

--
-- Table structure for table `sms_studentresult`
--

CREATE TABLE `sms_studentresult` (
  `id` bigint(20) NOT NULL,
  `subject_exam_marks` double NOT NULL,
  `subject_assignment_marks` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_studentresult`
--

INSERT INTO `sms_studentresult` (`id`, `subject_exam_marks`, `subject_assignment_marks`, `created_at`, `updated_at`, `student_id`, `subject_id`) VALUES
(2, 45, 12, '2026-03-03 17:52:56.205942', '2026-03-03 17:52:56.205991', 9, 14),
(3, 80, 20, '2026-03-03 18:03:29.232188', '2026-03-03 18:03:29.232204', 9, 14);

-- --------------------------------------------------------

--
-- Table structure for table `sms_subject`
--

CREATE TABLE `sms_subject` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_subject`
--

INSERT INTO `sms_subject` (`id`, `name`, `created_at`, `updated_at`, `course_id`, `teacher_id`) VALUES
(14, 'computer', '2026-02-24 20:29:02.049868', '2026-02-24 20:29:02.049907', 16, 20),
(15, 'django', '2026-03-03 18:28:49.217720', '2026-03-03 18:28:49.217748', 17, 20),
(16, 'software-based ', '2026-03-03 18:29:39.207864', '2026-03-03 18:29:39.207887', 19, 21),
(17, 'Python Programming', '2026-03-05 16:28:51.528547', '2026-03-05 16:28:51.528610', 16, 26),
(18, 'Database Systems', '2026-03-05 16:28:51.536077', '2026-03-05 16:28:51.536148', 16, 26),
(19, 'Control Systems (bca)', '2026-03-23 08:23:57.311376', '2026-03-23 08:23:57.311415', 16, 35),
(20, 'Cloud Computing (bca)', '2026-03-23 08:23:57.318463', '2026-03-23 08:23:57.318487', 16, 33),
(21, 'Modern History (bca)', '2026-03-23 08:23:57.330972', '2026-03-23 08:23:57.331000', 16, 34),
(22, 'Data Structures (mca)', '2026-03-23 08:23:57.337562', '2026-03-23 08:23:57.337588', 17, 33),
(23, 'Business Ethics (mca)', '2026-03-23 08:23:57.341682', '2026-03-23 08:23:57.341709', 17, 30),
(24, 'English Literature (mca)', '2026-03-23 08:23:57.346963', '2026-03-23 08:23:57.346992', 17, 31),
(25, 'Business Ethics (M.Sc CS)', '2026-03-23 08:23:57.358661', '2026-03-23 08:23:57.358692', 21, 30),
(26, 'English Literature (M.Sc CS)', '2026-03-23 08:23:57.364052', '2026-03-23 08:23:57.364085', 21, 28),
(27, 'Modern History (M.Sc CS)', '2026-03-23 08:23:57.369363', '2026-03-23 08:23:57.369393', 21, 33),
(28, 'Digital Electronics (M.Sc CS)', '2026-03-23 08:23:57.373625', '2026-03-23 08:23:57.373650', 21, 28),
(29, 'Web Development (B.Sc IT)', '2026-03-23 08:23:57.377439', '2026-03-23 08:23:57.377472', 22, 35),
(30, 'Digital Electronics (B.Sc IT)', '2026-03-23 08:23:57.382866', '2026-03-23 08:23:57.382893', 22, 31),
(31, 'Python Programming (B.Sc IT)', '2026-03-23 08:23:57.390437', '2026-03-23 08:23:57.390461', 22, 35),
(32, 'Modern History (B.Sc IT)', '2026-03-23 08:23:57.393353', '2026-03-23 08:23:57.393380', 22, 28),
(33, 'Modern History (M.Sc IT)', '2026-03-23 08:23:57.397056', '2026-03-23 08:23:57.397084', 23, 34),
(34, 'Marketing Management (M.Sc IT)', '2026-03-23 08:23:57.399870', '2026-03-23 08:23:57.399891', 23, 33),
(35, 'Control Systems (M.Sc IT)', '2026-03-23 08:23:57.402551', '2026-03-23 08:23:57.402572', 23, 36),
(36, 'Database Systems (M.Sc IT)', '2026-03-23 08:23:57.405497', '2026-03-23 08:23:57.405518', 23, 35),
(37, 'Machine Learning (BBA)', '2026-03-23 08:23:57.408437', '2026-03-23 08:23:57.408471', 24, 33),
(38, 'Database Systems (BBA)', '2026-03-23 08:23:57.411964', '2026-03-23 08:23:57.412004', 24, 34),
(39, 'Business Ethics (BBA)', '2026-03-23 08:23:57.415701', '2026-03-23 08:23:57.415725', 24, 33),
(40, 'Modern History (MBA)', '2026-03-23 08:23:57.418813', '2026-03-23 08:23:57.418835', 25, 29),
(41, 'Control Systems (MBA)', '2026-03-23 08:23:57.421548', '2026-03-23 08:23:57.421568', 25, 26),
(42, 'Machine Learning (MBA)', '2026-03-23 08:23:57.424266', '2026-03-23 08:23:57.424285', 25, 34),
(43, 'Cloud Computing (B.Tech EE)', '2026-03-23 08:23:57.427099', '2026-03-23 08:23:57.427118', 26, 26),
(44, 'Database Systems (B.Tech EE)', '2026-03-23 08:23:57.430921', '2026-03-23 08:23:57.430950', 26, 28),
(45, 'Modern History (B.Tech EE)', '2026-03-23 08:23:57.434222', '2026-03-23 08:23:57.434251', 26, 31),
(46, 'Web Development (M.Tech EE)', '2026-03-23 08:23:57.436954', '2026-03-23 08:23:57.436973', 27, 34),
(47, 'Cloud Computing (M.Tech EE)', '2026-03-23 08:23:57.440457', '2026-03-23 08:23:57.440478', 27, 32),
(48, 'Machine Learning (M.Tech EE)', '2026-03-23 08:23:57.443486', '2026-03-23 08:23:57.443507', 27, 28),
(49, 'Data Structures (BA English)', '2026-03-23 08:23:57.447381', '2026-03-23 08:23:57.447417', 28, 33),
(50, 'Control Systems (BA English)', '2026-03-23 08:23:57.450679', '2026-03-23 08:23:57.450704', 28, 30),
(51, 'Machine Learning (BA English)', '2026-03-23 08:23:57.453806', '2026-03-23 08:23:57.453828', 28, 31),
(52, 'Database Systems (MA History)', '2026-03-23 08:23:57.456725', '2026-03-23 08:23:57.456744', 29, 26),
(53, 'Digital Electronics (MA History)', '2026-03-23 08:23:57.459513', '2026-03-23 08:23:57.459533', 29, 29),
(54, 'Cloud Computing (MA History)', '2026-03-23 08:23:57.463057', '2026-03-23 08:23:57.463132', 29, 36),
(55, 'Python Programming (bca)', '2026-03-23 08:25:16.684515', '2026-03-23 08:25:16.684542', 16, 28),
(56, 'Web Development (bca)', '2026-03-23 08:25:16.688823', '2026-03-23 08:25:16.688841', 16, 29),
(57, 'Machine Learning (bca)', '2026-03-23 08:25:16.692741', '2026-03-23 08:25:16.692801', 16, 30),
(58, 'Digital Electronics (bca)', '2026-03-23 08:25:16.696859', '2026-03-23 08:25:16.696879', 16, 33),
(59, 'Marketing Management (mca)', '2026-03-23 08:25:16.701257', '2026-03-23 08:25:16.701274', 17, 33),
(60, 'Digital Electronics (mca)', '2026-03-23 08:25:16.704610', '2026-03-23 08:25:16.704627', 17, 31),
(61, 'Machine Learning (M.Sc CS)', '2026-03-23 08:25:16.710844', '2026-03-23 08:25:16.710868', 21, 34),
(62, 'Cloud Computing (M.Sc CS)', '2026-03-23 08:25:16.714732', '2026-03-23 08:25:16.714751', 21, 31),
(63, 'Marketing Management (B.Sc IT)', '2026-03-23 08:25:16.718388', '2026-03-23 08:25:16.718404', 22, 28),
(64, 'Cloud Computing (M.Sc IT)', '2026-03-23 08:25:16.726997', '2026-03-23 08:25:16.727021', 23, 35),
(65, 'Data Structures (M.Sc IT)', '2026-03-23 08:25:16.730860', '2026-03-23 08:25:16.730880', 23, 34),
(66, 'Web Development (BBA)', '2026-03-23 08:25:16.734156', '2026-03-23 08:25:16.734171', 24, 31),
(67, 'Cloud Computing (BBA)', '2026-03-23 08:25:16.738607', '2026-03-23 08:25:16.738623', 24, 28),
(68, 'Web Development (MBA)', '2026-03-23 08:25:16.744424', '2026-03-23 08:25:16.744450', 25, 35),
(69, 'Marketing Management (MBA)', '2026-03-23 08:25:16.749801', '2026-03-23 08:25:16.749817', 25, 34),
(70, 'Marketing Management (B.Tech EE)', '2026-03-23 08:25:16.753407', '2026-03-23 08:25:16.753435', 26, 31),
(71, 'Business Ethics (B.Tech EE)', '2026-03-23 08:25:16.757101', '2026-03-23 08:25:16.757120', 26, 31),
(72, 'Control Systems (M.Tech EE)', '2026-03-23 08:25:16.761851', '2026-03-23 08:25:16.761873', 27, 33),
(73, 'Marketing Management (BA English)', '2026-03-23 08:25:16.768139', '2026-03-23 08:25:16.768156', 28, 28),
(74, 'Database Systems (BA English)', '2026-03-23 08:25:16.771471', '2026-03-23 08:25:16.771489', 28, 26),
(75, 'Python Programming (MA History)', '2026-03-23 08:25:16.775599', '2026-03-23 08:25:16.775628', 29, 29),
(76, 'Business Ethics (MA History)', '2026-03-23 08:25:16.779440', '2026-03-23 08:25:16.779461', 29, 33),
(77, 'English Literature (bca)', '2026-03-23 08:25:55.744037', '2026-03-23 08:25:55.744073', 16, 35),
(78, 'Data Structures (bca)', '2026-03-23 08:25:55.749641', '2026-03-23 08:25:55.749656', 16, 33),
(79, 'Marketing Management (bca)', '2026-03-23 08:25:55.755341', '2026-03-23 08:25:55.755356', 16, 30),
(80, 'Web Development (mca)', '2026-03-23 08:25:55.760221', '2026-03-23 08:25:55.760246', 17, 31),
(81, 'Control Systems (mca)', '2026-03-23 08:25:55.765233', '2026-03-23 08:25:55.765279', 17, 30),
(82, 'Marketing Management (M.Sc CS)', '2026-03-23 08:25:55.769293', '2026-03-23 08:25:55.769345', 21, 30),
(83, 'Web Development (M.Sc CS)', '2026-03-23 08:25:55.774781', '2026-03-23 08:25:55.774816', 21, 32),
(84, 'Database Systems (B.Sc IT)', '2026-03-23 08:25:55.780650', '2026-03-23 08:25:55.780674', 22, 34),
(85, 'Cloud Computing (B.Sc IT)', '2026-03-23 08:25:55.785051', '2026-03-23 08:25:55.785075', 22, 30),
(86, 'Machine Learning (B.Sc IT)', '2026-03-23 08:25:55.789938', '2026-03-23 08:25:55.789964', 22, 36),
(87, 'Digital Electronics (M.Sc IT)', '2026-03-23 08:25:55.795453', '2026-03-23 08:25:55.795470', 23, 31),
(88, 'Python Programming (M.Sc IT)', '2026-03-23 08:25:55.799860', '2026-03-23 08:25:55.799885', 23, 26),
(89, 'English Literature (BBA)', '2026-03-23 08:25:55.805610', '2026-03-23 08:25:55.805628', 24, 34),
(90, 'Data Structures (BBA)', '2026-03-23 08:25:55.810134', '2026-03-23 08:25:55.810167', 24, 32),
(91, 'Python Programming (MBA)', '2026-03-23 08:25:55.814194', '2026-03-23 08:25:55.814213', 25, 28),
(92, 'Database Systems (MBA)', '2026-03-23 08:25:55.818020', '2026-03-23 08:25:55.818036', 25, 33),
(93, 'English Literature (B.Tech EE)', '2026-03-23 08:25:55.823555', '2026-03-23 08:25:55.823580', 26, 34),
(94, 'Marketing Management (M.Tech EE)', '2026-03-23 08:25:55.828774', '2026-03-23 08:25:55.828791', 27, 35),
(95, 'Database Systems (M.Tech EE)', '2026-03-23 08:25:55.833987', '2026-03-23 08:25:55.834004', 27, 28),
(96, 'Digital Electronics (BA English)', '2026-03-23 08:25:55.838668', '2026-03-23 08:25:55.838686', 28, 36),
(97, 'Modern History (BA English)', '2026-03-23 08:25:55.842865', '2026-03-23 08:25:55.842913', 28, 36),
(98, 'Web Development (BA English)', '2026-03-23 08:25:55.846759', '2026-03-23 08:25:55.846779', 28, 28),
(99, 'Data Structures (MA History)', '2026-03-23 08:25:55.851358', '2026-03-23 08:25:55.851374', 29, 30),
(100, 'Machine Learning (MA History)', '2026-03-23 08:25:55.857365', '2026-03-23 08:25:55.857394', 29, 26);

-- --------------------------------------------------------

--
-- Table structure for table `sms_teacher`
--

CREATE TABLE `sms_teacher` (
  `id` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_teacher`
--

INSERT INTO `sms_teacher` (`id`, `address`, `created_at`, `updated_at`, `user_id`, `department_id`) VALUES
(7, 'Vallabh Chowk Navli', '2026-02-24 19:25:05.555137', '2026-03-10 09:58:22.881248', 20, NULL),
(8, 'Anand', '2026-02-24 19:55:25.640803', '2026-03-03 18:35:19.381761', 21, NULL),
(9, '123 Teacher St', '2026-03-05 16:28:51.514720', '2026-03-27 07:50:57.706939', 26, NULL),
(10, '939 Teacher Colony, Block 2', '2026-03-23 08:23:53.711957', '2026-03-23 08:23:53.712020', 28, NULL),
(11, '490 Teacher Colony, Block 3', '2026-03-23 08:23:54.176592', '2026-03-23 08:23:54.176630', 29, NULL),
(12, '147 Teacher Colony, Block 4', '2026-03-23 08:23:54.586970', '2026-03-23 08:23:54.586991', 30, NULL),
(13, '467 Teacher Colony, Block 5', '2026-03-23 08:23:55.016488', '2026-03-23 08:23:55.016523', 31, NULL),
(14, '625 Teacher Colony, Block 6', '2026-03-23 08:23:55.425957', '2026-03-23 08:23:55.425977', 32, NULL),
(15, '369 Teacher Colony, Block 7', '2026-03-23 08:23:55.932417', '2026-03-23 08:23:55.932443', 33, NULL),
(16, '777 Teacher Colony, Block 8', '2026-03-23 08:23:56.389782', '2026-03-23 08:23:56.389803', 34, NULL),
(17, '931 Teacher Colony, Block 9', '2026-03-23 08:23:56.808144', '2026-03-23 08:23:56.808168', 35, NULL),
(18, '863 Teacher Colony, Block 10', '2026-03-23 08:23:57.303618', '2026-03-23 08:23:57.303640', 36, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_teacherplaceapplication`
--

CREATE TABLE `sms_teacherplaceapplication` (
  `id` bigint(20) NOT NULL,
  `place_name` varchar(255) NOT NULL,
  `application_date` date NOT NULL,
  `reasons` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_teachersalary`
--

CREATE TABLE `sms_teachersalary` (
  `id` bigint(20) NOT NULL,
  `salary_amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_teachersalary`
--

INSERT INTO `sms_teachersalary` (`id`, `salary_amount`, `payment_date`, `description`, `status`, `created_at`, `updated_at`, `teacher_id`) VALUES
(1, 5000.00, '2026-03-04', 'ok', 'Paid', '2026-03-03 19:00:47.810141', '2026-03-10 09:20:12.486541', 7),
(2, 70000.00, '2026-03-10', 'Approved Request:', 'Paid', '2026-03-10 09:47:47.105675', '2026-03-14 19:08:52.107936', 9),
(3, 47231.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:25:59.992568', '2026-03-23 08:25:59.992591', 9),
(4, 40918.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:25:59.998286', '2026-03-23 08:25:59.998305', 10),
(5, 46451.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.005253', '2026-03-23 08:26:00.005277', 11),
(6, 44959.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.012957', '2026-03-23 08:26:00.012972', 12),
(7, 47869.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.018566', '2026-03-23 08:26:00.018589', 13),
(8, 56256.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.024753', '2026-03-23 08:26:00.024798', 14),
(9, 51193.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.030889', '2026-03-23 08:26:00.030902', 15),
(10, 55441.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.036139', '2026-03-23 08:26:00.036152', 16),
(11, 50979.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.040903', '2026-03-23 08:26:00.040914', 17),
(12, 41442.00, '2026-03-23', 'Monthly Salary (March 2026)', 'Paid', '2026-03-23 08:26:00.047560', '2026-03-23 08:26:00.047572', 18),
(13, 250000.00, '2026-03-25', 'Approved Request: ', 'Paid', '2026-03-25 06:06:26.287469', '2026-03-25 06:06:26.287521', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_sms_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_attendance_subject_id_fkey` (`subject_id`);

--
-- Indexes for table `sms_attendancereport`
--
ALTER TABLE `sms_attendancereport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_attendancereport_student_id_fkey` (`student_id`),
  ADD KEY `sms_attendancereport_attendance_id_77295774_fk` (`attendance_id`);

--
-- Indexes for table `sms_contactus`
--
ALTER TABLE `sms_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_course`
--
ALTER TABLE `sms_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_course_department_id_d25721dc_fk_sms_department_id` (`department_id`);

--
-- Indexes for table `sms_customuser`
--
ALTER TABLE `sms_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sms_customuser_groups`
--
ALTER TABLE `sms_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sms_customuser_groups_user_id_group_id_uniq` (`customuser_id`,`group_id`),
  ADD KEY `sms_customuser_groups_group_id_idx` (`group_id`);

--
-- Indexes for table `sms_customuser_user_permissions`
--
ALTER TABLE `sms_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sms_customuser_user_per_user_id_perm_id_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `sms_customuser_user_p_permission_id_idx` (`permission_id`);

--
-- Indexes for table `sms_dailylessontarget`
--
ALTER TABLE `sms_dailylessontarget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sms_dailylessontarget_teacher_id_date_418e201d_uniq` (`teacher_id`,`date`);

--
-- Indexes for table `sms_department`
--
ALTER TABLE `sms_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_examschedule`
--
ALTER TABLE `sms_examschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_examschedule_subject_id_fa664a37_fk_sms_subject_id` (`subject_id`);

--
-- Indexes for table `sms_fee`
--
ALTER TABLE `sms_fee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_fee_student_id_fe6554b6_fk_sms_student_id` (`student_id`);

--
-- Indexes for table `sms_feedbackstudent`
--
ALTER TABLE `sms_feedbackstudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_feedbackstudent_student_id_cca36e46_fk_sms_student_id` (`student_id`);

--
-- Indexes for table `sms_feedbackteacher`
--
ALTER TABLE `sms_feedbackteacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_feedbackteacher_teacher_id_84d240cb_fk_sms_teacher_id` (`teacher_id`);

--
-- Indexes for table `sms_leavereportstudent`
--
ALTER TABLE `sms_leavereportstudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_leavereportstudent_student_id_fkey` (`student_id`);

--
-- Indexes for table `sms_leavereportteacher`
--
ALTER TABLE `sms_leavereportteacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_leavereportteacher_teacher_id_b5de868c_fk_sms_teacher_id` (`teacher_id`);

--
-- Indexes for table `sms_notificationstudent`
--
ALTER TABLE `sms_notificationstudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_notificationstudent_student_id_fkey` (`student_id`);

--
-- Indexes for table `sms_notificationteacher`
--
ALTER TABLE `sms_notificationteacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_notificationteacher_teacher_id_fkey` (`teacher_id`);

--
-- Indexes for table `sms_salary`
--
ALTER TABLE `sms_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_salary_teacher_id_37352521_fk_sms_teacher_id` (`teacher_id`);

--
-- Indexes for table `sms_salaryrequest`
--
ALTER TABLE `sms_salaryrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_salaryrequest_teacher_id_08725cdf_fk_sms_teacher_id` (`teacher_id`);

--
-- Indexes for table `sms_student`
--
ALTER TABLE `sms_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `sms_student_course_id_cb448d07_fk` (`course_id`);

--
-- Indexes for table `sms_studentfee`
--
ALTER TABLE `sms_studentfee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_studentfee_student_id_60f9c5a9_fk_sms_student_id` (`student_id`);

--
-- Indexes for table `sms_studentresult`
--
ALTER TABLE `sms_studentresult`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_studentresult_student_id_fkey` (`student_id`),
  ADD KEY `sms_studentresult_subject_id_fkey` (`subject_id`);

--
-- Indexes for table `sms_subject`
--
ALTER TABLE `sms_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_subject_teacher_id_fkey` (`teacher_id`),
  ADD KEY `sms_subject_course_id_c6c571a1_fk` (`course_id`);

--
-- Indexes for table `sms_teacher`
--
ALTER TABLE `sms_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `sms_teacher_department_id_be054de9_fk_sms_department_id` (`department_id`);

--
-- Indexes for table `sms_teacherplaceapplication`
--
ALTER TABLE `sms_teacherplaceapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_teacherplaceappl_teacher_id_5f9983d1_fk_sms_teach` (`teacher_id`);

--
-- Indexes for table `sms_teachersalary`
--
ALTER TABLE `sms_teachersalary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_teachersalary_teacher_id_70bdee95_fk_sms_teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `sms_attendancereport`
--
ALTER TABLE `sms_attendancereport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `sms_contactus`
--
ALTER TABLE `sms_contactus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_course`
--
ALTER TABLE `sms_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sms_customuser`
--
ALTER TABLE `sms_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `sms_customuser_groups`
--
ALTER TABLE `sms_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_customuser_user_permissions`
--
ALTER TABLE `sms_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_dailylessontarget`
--
ALTER TABLE `sms_dailylessontarget`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sms_department`
--
ALTER TABLE `sms_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sms_examschedule`
--
ALTER TABLE `sms_examschedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sms_fee`
--
ALTER TABLE `sms_fee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_feedbackstudent`
--
ALTER TABLE `sms_feedbackstudent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_feedbackteacher`
--
ALTER TABLE `sms_feedbackteacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_leavereportstudent`
--
ALTER TABLE `sms_leavereportstudent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_leavereportteacher`
--
ALTER TABLE `sms_leavereportteacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_notificationstudent`
--
ALTER TABLE `sms_notificationstudent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_notificationteacher`
--
ALTER TABLE `sms_notificationteacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_salary`
--
ALTER TABLE `sms_salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_salaryrequest`
--
ALTER TABLE `sms_salaryrequest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_student`
--
ALTER TABLE `sms_student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sms_studentfee`
--
ALTER TABLE `sms_studentfee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sms_studentresult`
--
ALTER TABLE `sms_studentresult`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_subject`
--
ALTER TABLE `sms_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `sms_teacher`
--
ALTER TABLE `sms_teacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sms_teacherplaceapplication`
--
ALTER TABLE `sms_teacherplaceapplication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_teachersalary`
--
ALTER TABLE `sms_teachersalary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_sms_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `sms_customuser` (`id`);

--
-- Constraints for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  ADD CONSTRAINT `sms_attendance_subject_id_fkey` FOREIGN KEY (`subject_id`) REFERENCES `sms_subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_attendancereport`
--
ALTER TABLE `sms_attendancereport`
  ADD CONSTRAINT `sms_attendancereport_attendance_id_77295774_fk` FOREIGN KEY (`attendance_id`) REFERENCES `sms_attendance` (`id`),
  ADD CONSTRAINT `sms_attendancereport_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_course`
--
ALTER TABLE `sms_course`
  ADD CONSTRAINT `sms_course_department_id_d25721dc_fk_sms_department_id` FOREIGN KEY (`department_id`) REFERENCES `sms_department` (`id`);

--
-- Constraints for table `sms_customuser_groups`
--
ALTER TABLE `sms_customuser_groups`
  ADD CONSTRAINT `sms_customuser_groups_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `sms_customuser_user_permissions`
--
ALTER TABLE `sms_customuser_user_permissions`
  ADD CONSTRAINT `sms_customuser_user_p_permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `sms_dailylessontarget`
--
ALTER TABLE `sms_dailylessontarget`
  ADD CONSTRAINT `sms_dailylessontarget_teacher_id_21c25569_fk_sms_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);

--
-- Constraints for table `sms_examschedule`
--
ALTER TABLE `sms_examschedule`
  ADD CONSTRAINT `sms_examschedule_subject_id_fa664a37_fk_sms_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `sms_subject` (`id`);

--
-- Constraints for table `sms_fee`
--
ALTER TABLE `sms_fee`
  ADD CONSTRAINT `sms_fee_student_id_fe6554b6_fk_sms_student_id` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`);

--
-- Constraints for table `sms_feedbackstudent`
--
ALTER TABLE `sms_feedbackstudent`
  ADD CONSTRAINT `sms_feedbackstudent_student_id_cca36e46_fk_sms_student_id` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`);

--
-- Constraints for table `sms_feedbackteacher`
--
ALTER TABLE `sms_feedbackteacher`
  ADD CONSTRAINT `sms_feedbackteacher_teacher_id_84d240cb_fk_sms_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);

--
-- Constraints for table `sms_leavereportstudent`
--
ALTER TABLE `sms_leavereportstudent`
  ADD CONSTRAINT `sms_leavereportstudent_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_leavereportteacher`
--
ALTER TABLE `sms_leavereportteacher`
  ADD CONSTRAINT `sms_leavereportteacher_teacher_id_b5de868c_fk_sms_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);

--
-- Constraints for table `sms_notificationstudent`
--
ALTER TABLE `sms_notificationstudent`
  ADD CONSTRAINT `sms_notificationstudent_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_notificationteacher`
--
ALTER TABLE `sms_notificationteacher`
  ADD CONSTRAINT `sms_notificationteacher_teacher_id_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_salary`
--
ALTER TABLE `sms_salary`
  ADD CONSTRAINT `sms_salary_teacher_id_37352521_fk_sms_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);

--
-- Constraints for table `sms_salaryrequest`
--
ALTER TABLE `sms_salaryrequest`
  ADD CONSTRAINT `sms_salaryrequest_teacher_id_08725cdf_fk_sms_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);

--
-- Constraints for table `sms_student`
--
ALTER TABLE `sms_student`
  ADD CONSTRAINT `sms_student_course_id_cb448d07_fk` FOREIGN KEY (`course_id`) REFERENCES `sms_course` (`id`);

--
-- Constraints for table `sms_studentfee`
--
ALTER TABLE `sms_studentfee`
  ADD CONSTRAINT `sms_studentfee_student_id_60f9c5a9_fk_sms_student_id` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`);

--
-- Constraints for table `sms_studentresult`
--
ALTER TABLE `sms_studentresult`
  ADD CONSTRAINT `sms_studentresult_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `sms_student` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_studentresult_subject_id_fkey` FOREIGN KEY (`subject_id`) REFERENCES `sms_subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_subject`
--
ALTER TABLE `sms_subject`
  ADD CONSTRAINT `sms_subject_course_id_c6c571a1_fk` FOREIGN KEY (`course_id`) REFERENCES `sms_course` (`id`);

--
-- Constraints for table `sms_teacher`
--
ALTER TABLE `sms_teacher`
  ADD CONSTRAINT `sms_teacher_department_id_be054de9_fk_sms_department_id` FOREIGN KEY (`department_id`) REFERENCES `sms_department` (`id`);

--
-- Constraints for table `sms_teacherplaceapplication`
--
ALTER TABLE `sms_teacherplaceapplication`
  ADD CONSTRAINT `sms_teacherplaceappl_teacher_id_5f9983d1_fk_sms_teach` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);

--
-- Constraints for table `sms_teachersalary`
--
ALTER TABLE `sms_teachersalary`
  ADD CONSTRAINT `sms_teachersalary_teacher_id_70bdee95_fk_sms_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
