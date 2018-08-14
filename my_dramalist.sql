-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2018 at 03:08 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_dramalist`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `details` text,
  `isActive` tinyint(1) DEFAULT NULL COMMENT 'True=active,false=inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cover_image` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_comments`
--

CREATE TABLE `article_comments` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment_body` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_comment` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_comments_likes`
--

CREATE TABLE `article_comments_likes` (
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_likes`
--

CREATE TABLE `article_likes` (
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cast`
--

CREATE TABLE `cast` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_title` varchar(250) NOT NULL,
  `character_title` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `main_content_id` int(11) NOT NULL,
  `mostlly_known_as` varchar(500) DEFAULT NULL,
  `native_title` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `also_known_as` varchar(500) DEFAULT NULL,
  `release_status` varchar(250) NOT NULL,
  `time_duration` varchar(50) NOT NULL,
  `cover_image` varchar(250) NOT NULL,
  `release_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `content_tag`
--

CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE `crew` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_title` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_content`
--

CREATE TABLE `main_content` (
  `id` int(11) NOT NULL,
  `content_name` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_07_28_203951_create_users_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(5, '2016_06_01_000004_create_oauth_clients_table', 2),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notification` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('150d6113c57920f3f072ca4c9b719fa5ed6c4cb6d0b13d7b87399cae7746e3ee5850182ccf26670b', 8, 1, 'MyApp', '[]', 0, '2018-07-31 14:21:43', '2018-07-31 14:21:43', '2019-07-31 19:21:43'),
('28f55be75985a75e9f9a87c49fc16c6a22b773f1d9d1096f112723262e223d1452607db1117b7e71', 9, 1, 'MyApp', '[]', 0, '2018-07-31 14:28:05', '2018-07-31 14:28:05', '2019-07-31 19:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'zepJMAqhJdcZFiKmRYoaG3nJF9lMskNXBFBUzNEX', 'http://localhost', 1, 0, 0, '2018-07-31 13:44:25', '2018-07-31 13:44:25'),
(2, NULL, 'Laravel Password Grant Client', 'ICO8YdY8z2meF9SaoyLnLW5tJwYiH0RmHvbmJ7Z3', 'http://localhost', 0, 1, 0, '2018-07-31 13:44:25', '2018-07-31 13:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-07-31 13:44:25', '2018-07-31 13:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_info`
--

CREATE TABLE `production_info` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `origin_language` varchar(250) NOT NULL,
  `production_country` varchar(250) NOT NULL,
  `aditional_notes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE `rights` (
  `id` int(11) NOT NULL,
  `right_title` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_right`
--

CREATE TABLE `role_right` (
  `id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` enum('true','false') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tag_title` int(11) NOT NULL,
  `tag_type` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bio_graphy` text COLLATE utf8mb4_unicode_ci,
  `is_verified` enum('false','true') COLLATE utf8mb4_unicode_ci DEFAULT 'false',
  `role_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `first_name`, `last_name`, `display_name`, `email`, `password`, `token`, `avatar`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `location`, `gender`, `dob`, `bio_graphy`, `is_verified`, `role_id`) VALUES
(6, 'Aamir Bashir', '', '', '', '', 'aamir_bashir@live.com', NULL, NULL, NULL, 'facebook', '1444016895663402', '00zPfG8bm4Q2ey149Qx1Q5kl0YBjcbZoykKeYbjxUPVwvmk5SLSn55YuIQdO', '2018-07-30 06:52:55', '2018-07-30 06:52:55', '', '', '0000-00-00', '', 'false', 0),
(7, 'Absolutionshub', '', '', '', '', 'bscsfinal8@gmail.com', NULL, NULL, NULL, 'google', '114234096905396791726', 'iNtMo4m3en9vpNCD58YriB8EbVca4gx0vD5Vyu3mqsapNWz1jmsip5z3upOG', '2018-07-30 07:26:03', '2018-07-30 07:26:03', '', '', '0000-00-00', '', 'false', 0),
(8, 'Shoib Bae', '', '', '', '', 'admin@admin.com', '$2y$10$BXItaMBykc3ZKlfjv3IrYubVrXSw1FLtIKXwga1j2NShUi2Kr7BVO', NULL, NULL, NULL, NULL, 'vb2tmKNKJ0lqhvKecItTtpRIUtBkzPv2c3h1YOjrvX51QdevNp5nRvQGAaBs', '2018-07-31 14:07:12', '2018-07-31 14:07:12', '', '', '0000-00-00', '', 'false', 0),
(9, 'Amir Bashir', 'Amir Bashir', NULL, NULL, NULL, 'amir.bashir@kalsym.com', NULL, NULL, 'https://lh4.googleusercontent.com/-NNJb5q5LCjg/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7qHKx00hb4ahGpQbL9XsDZruutIqA/mo/photo.jpg?sz=50', 'google', '101688777151560982568', 'MRlZDNgRTkfWfEnIAXKgWQ6nPZYipbbIIJZRTrocIXCbJjbGjMVPQtHfhNPH', '2018-08-06 14:27:01', '2018-08-06 14:27:01', NULL, NULL, NULL, NULL, 'true', 1),
(10, 'Shoaib Iqbal', 'Shoaib Iqbal', NULL, NULL, NULL, 'shaibi3036@gmail.com', NULL, NULL, 'https://graph.facebook.com/v3.0/2144518642287666/picture?type=normal', 'facebook', '2144518642287666', '79Uk7R7zVpUEzsI68RjRuDRjZ3qpXDBZ32Z4yNlXj7cJp9MLtov9yIRzkuuY', '2018-08-13 09:50:58', '2018-08-13 09:50:58', NULL, NULL, NULL, NULL, 'false', 1),
(11, 'Shoib Iqbal', 'Shoib Iqbal', NULL, NULL, NULL, 'admin+1@admin.com', '$2y$10$28syKQdTTGAGYANlzbX88.OGEizfFFtDyL5u0SA6fWBqdZhltWEnO', NULL, NULL, NULL, NULL, 'DNfwvx3UKu4K8bw5ghgGIYpfpnGZVyriTBtsSO9LF8BC06ECRVPEKYcqn5GU', '2018-08-13 10:06:47', '2018-08-13 10:06:47', NULL, NULL, NULL, NULL, 'true', 1),
(12, 'Shoib Iqbal', 'Shoib Iqbal', NULL, NULL, NULL, 'shoaib@endurancepartner.com', '$2y$10$4ZkkUqCTfPYkoRgsQwBKuuH/5aBfV315QQA8Eg1rtUdQkKEj..m1W', 'IUPlthogJUOcLh78Y0ptODDVY1pn6ZDC1zxhoCH9', NULL, NULL, NULL, '9dvabouHmpw966oX7gWO9l4uFUVnQeuzjMw7wbb0rxK4U1sKmwqLICqO11OI', '2018-08-13 11:10:55', '2018-08-13 11:10:55', NULL, NULL, NULL, NULL, 'true', 1),
(13, 'shos', 'shos', NULL, NULL, NULL, 'shoaib+1@endurancepartner.com', '$2y$10$kt3nbas1i1O1osq0zHNNie7CroRIEU2AaGscvlB5VbBNSJpJX5O42', 'blJ7v3ms5otgL9c9ksjA5MPxOEnQnvjxxNjyhQtG1534178753', NULL, NULL, NULL, NULL, '2018-08-13 11:45:53', '2018-08-13 11:45:53', NULL, NULL, NULL, NULL, 'true', 1),
(14, 'shos', 'shos', NULL, NULL, NULL, 'shoaib1@endurancepartner.com', '$2y$10$FytrX0sAllyuqTjS/B8v8OUY6/uIj//pBYxZ/tNxen2YRZqCwWXU.', 'JJOM8t2OC5ZE1dRx97tnj5p90ergE8PXVq39jlVH1534178923', NULL, NULL, NULL, NULL, '2018-08-13 11:48:43', '2018-08-13 11:48:43', NULL, NULL, NULL, NULL, 'true', 1),
(15, 'shos', 'shos', NULL, NULL, NULL, 'shoaib15@endurancepartner.com', '$2y$10$CGEKBbeeDd6.m4blsrQzSez1NvVRt0dLwjsPY/todSWUMTbrXDcOG', 'ukdKRbhqZgQUohpUB0zVvDYBsJYrjyEAPVTA97ft1534179169', NULL, NULL, NULL, NULL, '2018-08-13 11:52:49', '2018-08-13 11:52:49', NULL, NULL, NULL, NULL, 'true', 1),
(17, 'Aamir', 'Aamir', NULL, NULL, NULL, 'aamir_bashir+1@live.com', '$2y$10$LkSMwpZ0Dioef42K.P.t0..rg./CHmmB4X32Pza4jHOZm7aWf.nxW', NULL, NULL, NULL, NULL, NULL, '2018-08-13 12:10:37', '2018-08-13 18:45:44', NULL, NULL, NULL, NULL, 'true', 1),
(18, 'Aamir bashir', 'Aamir bashir', NULL, NULL, NULL, 'aamir_bashir+15@live.com', '$2y$10$vcJJifmJODXjXMq15pnZcO3hzXwdu7MnBLz1mgUXWY05fdcj9TkGG', 'gCdvCFxrRe0ntYTnWpxhjl969TlV9g2Expk38XRJ1534203092', NULL, NULL, NULL, NULL, '2018-08-13 18:31:32', '2018-08-13 18:41:07', NULL, NULL, NULL, NULL, 'false', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_feeds`
--

CREATE TABLE `user_feeds` (
  `id` int(11) NOT NULL,
  `details` text,
  `is_spoiler` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_feeds_comments`
--

CREATE TABLE `user_feeds_comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_body` text,
  `parent_comment` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_feeds_comments_likes`
--

CREATE TABLE `user_feeds_comments_likes` (
  `user_id` int(11) NOT NULL,
  `comments_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_feeds_likes`
--

CREATE TABLE `user_feeds_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE `user_friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `is_active` enum('true','false') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role_title` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role_title`, `created_at`, `updated_at`) VALUES
(1, 'Members', '2018-08-06 19:04:19', '2018-08-06 19:04:19'),
(2, 'Administrator', '2018-08-06 19:04:34', '2018-08-06 19:04:34'),
(3, 'Editor', '2018-08-06 19:05:02', '2018-08-06 19:05:02'),
(4, 'Trailer Staff', '2018-08-06 19:05:12', '2018-08-06 19:05:12'),
(5, 'Social Media Manager', '2018-08-06 19:05:29', '2018-08-06 19:05:29'),
(6, 'Approval Staff', '2018-08-06 19:05:42', '2018-08-06 19:05:42'),
(7, 'Editor in Chief', '2018-08-06 19:05:54', '2018-08-06 19:05:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_comments`
--
ALTER TABLE `article_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_comments_likes`
--
ALTER TABLE `article_comments_likes`
  ADD PRIMARY KEY (`user_id`,`comment_id`);

--
-- Indexes for table `article_likes`
--
ALTER TABLE `article_likes`
  ADD PRIMARY KEY (`article_id`,`user_id`);

--
-- Indexes for table `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crew`
--
ALTER TABLE `crew`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_content`
--
ALTER TABLE `main_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_name` (`content_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `production_info`
--
ALTER TABLE `production_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_right`
--
ALTER TABLE `role_right`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_feeds`
--
ALTER TABLE `user_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_feeds_comments`
--
ALTER TABLE `user_feeds_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_feeds_comments_likes`
--
ALTER TABLE `user_feeds_comments_likes`
  ADD PRIMARY KEY (`user_id`,`comments_id`);

--
-- Indexes for table `user_feeds_likes`
--
ALTER TABLE `user_feeds_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_friends`
--
ALTER TABLE `user_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cast`
--
ALTER TABLE `cast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_tag`
--
ALTER TABLE `content_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crew`
--
ALTER TABLE `crew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_content`
--
ALTER TABLE `main_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_info`
--
ALTER TABLE `production_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_right`
--
ALTER TABLE `role_right`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
