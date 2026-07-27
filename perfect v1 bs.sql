-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2022 at 12:13 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insaniya_Puffxchild1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text COLLATE utf8mb4_bin NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `category_icon` text COLLATE utf8mb4_bin NOT NULL,
  `is_refill` enum('true','false') COLLATE utf8mb4_bin NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_line`, `category_type`, `category_secret`, `category_icon`, `is_refill`) VALUES
(2, '🥳 𝐇𝐚𝐩𝐩𝐲 𝐍𝐞𝐰 𝐘𝐞𝐚𝐫🥳', 1, '2', '2', '', 'false'),
(3, '❄️Winter Sale❄️ ', 2, '2', '2', '', 'false'),
(4, '🛒Black Market▪️', 3, '2', '2', '', 'false'),
(5, '🤫 Own Sever ', 4, '2', '2', '', 'false'),
(6, '🤩 Vip Sever 🤩 { AntiUpdate▪️Fastest 🚀 }', 5, '2', '2', '', 'false'),
(7, '🚀One Click Done', 6, '2', '2', '', 'false'),
(8, '🎊𝗡𝗦 𝗕𝗲𝘀𝘁 𝗦𝗲𝘃𝗶𝗰𝗲𝘀🎊', 7, '2', '2', '', 'false'),
(9, '💟 Instagram : Followers [ 1 YEAR REFILL ♻️] 🤩', 8, '2', '2', '', 'false'),
(10, '💟 Instagram : Followers [ 🚅 Bullet Speed ] ', 9, '2', '2', '', 'false'),
(11, '💟 Instagram : Followers [ 100% NON DROP ] 🔥 [ Recommend] ✔️', 10, '2', '2', '', 'false'),
(12, '💫 0% Drop Sevices 😍 [ Admin Recommended ] ✔️', 11, '2', '2', '', 'false'),
(13, '💟 Instagram  : 😍 VIP Followers Sevices 🤩', 12, '2', '2', '', 'false'),
(14, '💟 Instagram : Super Real And Active ✨ Followers 🥰', 13, '2', '2', '', 'false'),
(15, '💟 Instagram : Followers [ REFILL♻️] ', 14, '2', '2', '', 'false'),
(16, '💟 Instagram : Cheapest Followers 😍 ', 15, '2', '2', '', 'false'),
(17, '💟 Instagram : Verifed [ Blue tick ☑️ ] Followers 😍', 16, '2', '2', '', 'false'),
(18, '💟 Instagram : Verified [ Blue Tick ☑️ ] Likes 👍 ', 17, '2', '2', '', 'false'),
(19, '💟 Instagram : 🇮🇳 INDIAN 🇮🇳 Likes 👍 ', 18, '2', '2', '', 'false'),
(20, '💟 Instagram : 🇮🇳 INDIAN 🇮🇳 Followers 😍', 19, '2', '2', '', 'false'),
(21, '💟 Instagram  : 🇮🇳 Indian Comments 💌 ', 20, '2', '2', '', 'false'),
(22, '💟 Instagram : Likes 👍 [Non drop] 🤩', 21, '2', '2', '', 'false'),
(23, '💟 Instagram  :  Likes 👍 {{ 0% Drop💧}} {{ Ultra Fast Delivery }} ✈️✈️', 22, '2', '2', '', 'false'),
(24, '💟 Instagram  :  Likes 👍 {{ LIFETIME REFILL }} ♻️ ', 23, '2', '2', '', 'false'),
(25, '💟 Instagram  : 💫 Primeum 🙀 Likes 👍 {{ Super Real Qulity }} 😍 ', 24, '2', '2', '', 'false'),
(26, '💟 Instagram : Reels 👀 sevices 🕺💃', 25, '2', '2', '', 'false'),
(27, '💟 Reels Viwes 👀 {{ Ultra Fast }} 🚀 ', 26, '2', '2', '', 'false'),
(28, '💟 Instagram : Female sevices 👱‍♀️', 27, '2', '2', '', 'false'),
(29, '💟 Instagram : Radoom Comments 💌', 28, '2', '2', '', 'false'),
(30, '💟 Instagram : Costum Comments 💌', 29, '2', '2', '', 'false'),
(31, '💟 Instagram : Story 🤳 Sevices ', 30, '2', '2', '', 'false'),
(32, '💟 Instagram : Impassion and Reach sevices📈', 31, '2', '2', '', 'false'),
(33, '💟 Instagram : Saves 📥', 32, '2', '2', '', 'false'),
(34, '🔷 Facebook  : Views', 33, '2', '2', '', 'false'),
(35, '🔹 Facebook : Post Likes 👍', 34, '2', '2', '', 'false'),
(36, '🔹 Facebook : Reaction {{ 👍❤️😍😂😭😁 }}  ', 35, '2', '2', '', 'false'),
(37, '🔹 Facebook : Reaction 👍❤️😍😂😭😁 {{ Refill ♻️ }} ', 36, '2', '2', '', 'false'),
(38, '🔶 YouTube : Views 👀  ⟪ No Refill ⟫', 37, '2', '2', '', 'false'),
(39, '▶️  YouTube : Views 👀', 38, '2', '2', '', 'false'),
(40, '🔶 YouTube : Adwords Viwes 👀 ', 39, '2', '2', '', 'false'),
(41, '🔶  YouTube : Views 👀 AdSense earning 💲💲', 40, '2', '2', '', 'false'),
(42, '🔶  YouTube : Likes 👍 ', 41, '2', '2', '', 'false'),
(43, '▶️  YouTube : Dislikes 👎', 42, '2', '2', '', 'false'),
(44, '▶️  YouTube : Subscribers ', 43, '2', '2', '', 'false'),
(45, '▶️  YouTube : Subscribers 🤩 ⟪ Non Drop ⟫', 44, '2', '2', '', 'false'),
(46, '▶️  YouTube : Comments 💌', 45, '2', '2', '', 'false'),
(47, '🔶  YouTube : Comments ✉️ Likes 👍', 46, '2', '2', '', 'false'),
(48, '▶️  YouTube : Watch time 💲👀', 47, '2', '2', '', 'false'),
(49, '▶️  YouTube : Watch time 💲⏰ {{ Super Fastest ✈️ }} ', 48, '2', '2', '', 'false'),
(50, '▶️  YouTube : 💲Monetization💲 Plan ', 49, '2', '2', '', 'false'),
(51, '📫 Telegram : Members ', 50, '2', '2', '', 'false'),
(52, ' 📫 Telegram : Members {[ Refill }}', 51, '2', '2', '', 'false'),
(53, '📫 Telegram : Real Members 😍 {{ Non Drop }} ', 52, '2', '2', '', 'false'),
(54, '📫 Telegram : Likes and Reactions 👍😍😂😱🥰❤️', 53, '2', '2', '', 'false'),
(55, '📫 Telegram : Viwes 👀', 54, '2', '2', '', 'false'),
(56, '🌐 Tweeter : Followers ', 55, '2', '2', '', 'false'),
(57, '🌐 Tweeter : Likes 👍', 56, '2', '2', '', 'false'),
(58, '🌐 Tweeter : Viwes 👀', 57, '2', '2', '', 'false'),
(59, '🌐 Tweeter : Indian 🇮🇳 Sevices', 58, '2', '2', '', 'false'),
(60, '💃🕺 Tik Tok : Viwes 👀', 59, '2', '2', '', 'false'),
(61, '💃🕺 Tik Tok : Likes 👍', 60, '2', '2', '', 'false'),
(62, '⚜️ Account verification { Blue tick }  ☑️', 61, '2', '2', '', 'false'),
(63, '☠️ Hac#king Sevices ❌ [ 100% Satisfaction ]', 62, '2', '2', '', 'false'),
(64, '📱 Subscription 📱[ Monthly ] ', 63, '2', '2', '', 'false'),
(65, '☠️ Account Reports 🚫', 64, '2', '2', '', 'false'),
(66, '📊 Run Google ads ', 65, '2', '2', '', 'false'),
(67, ' Artical ✍️ Publishing ', 66, '2', '2', '', 'false'),
(68, '📄 Verified ✔️Certificates ', 67, '2', '2', '', 'false'),
(69, '😂 Prank Sevices 😜', 68, '2', '2', '', 'false'),
(70, 'Api user only 🚫🚫 ', 69, '2', '2', '', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `spent` double NOT NULL DEFAULT 0,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`) VALUES
(195, 'janardan1', 'admin@puffx.com', 'Shiva9.0', 'cd3f603646b298b88450a3a82b2d86a7', '8080808080', 0, '2', NULL, 0, '2022-12-31 06:53:42', '2022-12-31 09:03:35', '1.187.212.191', 'b30743f54b7ce87ca3b7ad64e0085a14', '1', '1', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"admins\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"child-panels\":\"1\",\"proxy\":\"1\",\"kuponlar\":\"1\"}', 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 73, 'Kullanıcı kaydı yapıldı.', '85.98.109.42', '2020-04-19 03:32:37'),
(2, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-19 03:33:04'),
(3, 73, 'Yönetici girişi yapıldı.', '85.98.109.42', '2020-04-19 03:34:51'),
(4, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-19 03:42:15'),
(5, 74, 'Kullanıcı kaydı yapıldı.', '213.186.149.239', '2020-04-19 03:47:07'),
(6, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-19 03:47:17'),
(7, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:37:54'),
(8, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:37:59'),
(9, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:37:59'),
(10, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:38:04'),
(11, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-19 11:47:13'),
(12, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-19 12:24:07'),
(13, 74, '5 TL tutarında yeni sipariş geçildi #1.', '213.186.149.239', '2020-04-19 12:44:38'),
(14, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 12:47:52'),
(15, 74, 'API Key değiştirildi', '213.186.149.239', '2020-04-19 15:14:40'),
(16, 75, 'Kullanıcı kaydı yapıldı.', '94.123.180.209', '2020-04-19 20:50:13'),
(17, 75, 'Üye girişi yapıldı.', '94.123.180.209', '2020-04-19 20:50:31'),
(18, 75, '0 TL tutarında yeni sipariş geçildi #.', '94.123.180.209', '2020-04-19 20:50:54'),
(19, 75, '0 TL tutarında yeni sipariş geçildi #.', '94.123.180.209', '2020-04-19 20:51:12'),
(20, 75, '0 TL tutarında yeni sipariş geçildi #.', '94.123.180.209', '2020-04-19 20:51:20'),
(21, 75, 'Üye girişi yapıldı.', '94.123.180.209', '2020-04-19 20:52:03'),
(22, 75, 'Üye girişi yapıldı.', '94.123.180.209', '2020-04-19 20:52:20'),
(23, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 01:30:24'),
(24, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-20 01:59:21'),
(25, 73, '90 TL tutarında yeni sipariş geçildi #2.', '85.98.109.42', '2020-04-20 03:00:10'),
(26, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-20 03:29:09'),
(27, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-20 12:39:15'),
(28, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-20 12:39:15'),
(29, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 13:00:27'),
(30, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 14:20:38'),
(31, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 15:45:39'),
(32, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 15:45:45'),
(33, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 21:06:40'),
(34, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-20 22:19:29'),
(35, 76, 'Kullanıcı kaydı yapıldı.', '185.32.44.114', '2020-04-20 22:59:38'),
(36, 76, 'Üye girişi yapıldı.', '185.32.44.114', '2020-04-20 23:00:00'),
(37, 76, 'Yeni destek talebi oluşturuldu #1', '185.32.44.114', '2020-04-20 23:02:29'),
(38, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-20 23:22:40'),
(39, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-21 02:42:45'),
(40, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-21 12:25:33'),
(41, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-21 12:25:49'),
(42, 74, '0.0095 TL tutarında yeni sipariş geçildi #3.', '213.186.149.239', '2020-04-21 12:26:32'),
(43, 74, '#3 numaralı sipariş iptal edildi ve 0.0095 TL ücret iade edildi Eski bakiye:0.9905 / Yeni bakiye:1', '127.0.0.1', '2020-04-21 16:50:06'),
(44, 77, 'Kullanıcı kaydı yapıldı.', '151.135.30.88', '2020-04-21 18:21:52'),
(45, 77, 'Üye girişi yapıldı.', '151.135.30.88', '2020-04-21 18:22:08'),
(46, 74, 'Yeni destek talebi oluşturuldu #2', '213.186.149.239', '2020-04-21 21:41:42'),
(47, 74, '0.987 TL tutarında yeni sipariş geçildi #4.', '213.186.149.239', '2020-04-21 23:16:59'),
(48, 74, '#4 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-21 23:45:11'),
(49, 74, '0.08 TL tutarında yeni sipariş geçildi #5.', '213.186.153.173', '2020-04-22 12:11:42'),
(50, 74, '#5 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-22 13:05:08'),
(51, 77, '9 TL tutarında yeni sipariş geçildi #6.', '31.155.157.196', '2020-04-22 23:48:37'),
(52, 77, '0.95 TL tutarında yeni sipariş geçildi #7.', '31.155.157.196', '2020-04-23 00:17:41'),
(53, 77, '4.75 TL tutarında yeni sipariş geçildi #8.', '31.155.157.196', '2020-04-23 00:18:04'),
(54, 77, '0.95 TL tutarında yeni sipariş geçildi #9.', '31.155.157.196', '2020-04-23 00:18:19'),
(55, 73, 'Üye girişi yapıldı.', '78.178.109.72', '2020-04-23 00:19:34'),
(56, 77, '12 TL tutarında yeni sipariş geçildi #10.', '31.155.157.196', '2020-04-23 00:20:36'),
(57, 77, '0.95 TL tutarında yeni sipariş geçildi #11.', '31.155.157.196', '2020-04-23 00:34:37'),
(58, 77, '0.95 TL tutarında yeni sipariş geçildi #12.', '31.155.157.196', '2020-04-23 00:35:02'),
(59, 77, '#7 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:10:12'),
(60, 77, '#9 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:10:14'),
(61, 77, '#11 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:10:15'),
(62, 77, '#12 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:50:11'),
(63, 77, '#6 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 02:05:06'),
(64, 77, '#8 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 02:05:07'),
(65, 77, '#10 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 02:35:14'),
(66, 78, 'Kullanıcı kaydı yapıldı.', '81.215.16.156', '2020-04-23 03:34:23'),
(67, 78, 'Üye girişi yapıldı.', '81.215.16.156', '2020-04-23 03:34:28'),
(68, 78, '0 TL tutarında yeni sipariş geçildi #.', '81.215.16.156', '2020-04-23 03:34:29'),
(69, 74, 'Üye girişi yapıldı.', '149.56.28.113', '2020-04-23 14:03:52'),
(70, 74, 'Yönetici girişi yapıldı.', '149.56.28.113', '2020-04-23 14:04:14'),
(71, 79, 'Kullanıcı kaydı yapıldı.', '5.176.82.224', '2020-04-23 21:00:25'),
(72, 79, 'Üye girişi yapıldı.', '5.176.82.224', '2020-04-23 21:00:50'),
(73, 80, 'Kullanıcı kaydı yapıldı.', '95.70.132.3', '2020-04-23 21:07:44'),
(74, 80, 'Üye girişi yapıldı.', '95.70.132.3', '2020-04-23 21:08:04'),
(75, 79, '0.999 TL tutarında yeni sipariş geçildi #13.', '5.176.82.224', '2020-04-23 21:08:05'),
(76, 79, '#13 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 23:05:06'),
(77, 77, '15 TL tutarında yeni sipariş geçildi #14.', '176.218.120.209', '2020-04-23 23:19:45'),
(78, 81, 'Kullanıcı kaydı yapıldı.', '78.190.190.105', '2020-04-24 01:07:10'),
(79, 81, 'Üye girişi yapıldı.', '78.190.190.105', '2020-04-24 01:07:25'),
(80, 77, '#14 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-24 02:15:08'),
(81, 74, 'Yönetici girişi yapıldı.', '213.186.148.176', '2020-04-24 02:23:35'),
(82, 74, 'Üye girişi yapıldı.', '213.186.148.176', '2020-04-24 13:31:42'),
(83, 73, 'Üye girişi yapıldı.', '78.178.109.72', '2020-04-25 02:38:43'),
(84, 74, '2.1 TL tutarında yeni sipariş geçildi #15.', '213.186.148.176', '2020-04-25 11:45:54'),
(85, 74, '#15 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-25 13:15:11'),
(86, 74, 'Üye girişi yapıldı.', '213.186.148.176', '2020-04-25 16:32:13'),
(87, 82, 'Kullanıcı kaydı yapıldı.', '85.98.238.74', '2020-04-25 16:33:07'),
(88, 82, 'Üye girişi yapıldı.', '85.98.238.74', '2020-04-25 16:33:15'),
(89, 82, '0.095 TL tutarında yeni sipariş geçildi #16.', '85.98.238.74', '2020-04-25 16:36:43'),
(90, 82, '#16 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-25 17:10:09'),
(91, 83, 'Kullanıcı kaydı yapıldı.', '78.190.228.75', '2020-04-25 20:09:57'),
(92, 83, 'Üye girişi yapıldı.', '78.190.228.75', '2020-04-25 20:10:12'),
(93, 73, 'Üye girişi yapıldı.', '78.178.109.72', '2020-04-25 20:38:40'),
(94, 77, '15 TL tutarında yeni sipariş geçildi #17.', '176.218.120.209', '2020-04-26 14:35:12'),
(95, 77, '0.2 TL tutarında yeni sipariş geçildi #18.', '176.218.120.209', '2020-04-26 14:51:18'),
(96, 77, '0.2 TL tutarında yeni sipariş geçildi #19.', '176.218.120.209', '2020-04-26 14:52:57'),
(97, 77, '#18 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-26 15:15:07'),
(98, 77, '#19 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-26 15:15:08'),
(99, 77, '#17 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-26 19:10:06'),
(100, 77, '1 TL tutarında yeni sipariş geçildi #20.', '176.218.120.209', '2020-04-26 23:19:24'),
(101, 77, '1 TL tutarında yeni sipariş geçildi #21.', '176.218.120.209', '2020-04-26 23:19:48'),
(102, 77, '1 TL tutarında yeni sipariş geçildi #22.', '176.218.120.209', '2020-04-26 23:20:28'),
(103, 77, '0.5375 TL tutarında yeni sipariş geçildi #23.', '176.218.120.209', '2020-04-26 23:21:12'),
(104, 77, '#20 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:11'),
(105, 77, '#21 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:13'),
(106, 77, '#22 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:14'),
(107, 77, '#23 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:16'),
(108, 84, 'Kullanıcı kaydı yapıldı.', '78.180.11.192', '2020-04-27 06:46:38'),
(109, 84, 'Üye girişi yapıldı.', '78.180.11.192', '2020-04-27 06:46:45'),
(110, 77, 'Üye girişi yapıldı.', '176.218.120.209', '2020-04-27 17:15:43'),
(111, 77, '0.5 TL tutarında yeni sipariş geçildi #24.', '176.218.120.209', '2020-04-27 17:16:34'),
(112, 77, '0.5 TL tutarında yeni sipariş geçildi #25.', '176.218.120.209', '2020-04-27 17:17:11'),
(113, 77, '2.75 TL tutarında yeni sipariş geçildi #26.', '176.218.120.209', '2020-04-27 17:21:22'),
(114, 77, '2.75 TL tutarında yeni sipariş geçildi #27.', '176.218.120.209', '2020-04-27 17:22:15'),
(115, 77, '0.475 TL tutarında yeni sipariş geçildi #28.', '176.218.120.209', '2020-04-27 17:39:52'),
(116, 77, '#24 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:05:07'),
(117, 77, '#25 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:05:09'),
(118, 77, '#26 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:10:06'),
(119, 77, '#27 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:10:07'),
(120, 77, '#28 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:10:09'),
(121, 77, '0 TL tutarında yeni sipariş geçildi #29.', '176.218.120.209', '2020-04-27 19:43:35'),
(122, 77, '28.8 TL tutarında yeni sipariş geçildi #30.', '176.218.120.209', '2020-04-27 20:02:31'),
(123, 77, '4.75 TL tutarında yeni sipariş geçildi #31.', '176.218.120.209', '2020-04-27 20:17:16'),
(124, 77, '5 TL tutarında yeni sipariş geçildi #44.', '176.218.120.209', '2020-04-27 21:09:19'),
(125, 77, '#30 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 22:10:10'),
(126, 77, '#31 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 22:10:11'),
(127, 77, '#44 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 00:05:07'),
(128, 74, '0.03 TL tutarında yeni sipariş geçildi #45.', '213.186.144.61', '2020-04-28 20:16:44'),
(129, 74, '0.03 TL tutarında yeni sipariş geçildi #46.', '213.186.144.61', '2020-04-28 20:18:25'),
(130, 74, '0.03 TL tutarında yeni sipariş geçildi #47.', '213.186.144.61', '2020-04-28 20:19:45'),
(131, 74, '0.03 TL tutarında yeni sipariş geçildi #48.', '213.186.144.61', '2020-04-28 20:20:25'),
(132, 74, '#45 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:05:08'),
(133, 74, '#46 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:05:09'),
(134, 74, '#47 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:05:10'),
(135, 74, '#48 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:10:09'),
(136, 74, '0.03 TL tutarında yeni sipariş geçildi #49.', '213.186.144.61', '2020-04-28 22:08:34'),
(137, 74, '0.02 TL tutarında yeni sipariş geçildi #50.', '213.186.144.61', '2020-04-28 22:13:53'),
(138, 74, 'Yönetici girişi yapıldı.', '213.186.144.61', '2020-04-28 23:47:51'),
(139, 74, '0.02 TL tutarında yeni sipariş geçildi #51.', '213.186.144.61', '2020-04-28 23:54:13'),
(140, 74, '#49 numaralı sipariş kısmi olarak işaretlendi ve 0.03 TL ücret iade edildi Eski bakiye:8.643 / Yeni bakiye:8.673', '127.0.0.1', '2020-04-29 02:10:09'),
(141, 74, '0.03 TL tutarında yeni sipariş geçildi #52.', '213.186.144.61', '2020-04-29 02:10:31'),
(142, 74, '0.012 TL tutarında yeni sipariş geçildi #53.', '213.186.144.61', '2020-04-29 02:11:18'),
(143, 74, '#50 numaralı sipariş kısmi olarak işaretlendi ve 0.02 TL ücret iade edildi Eski bakiye:8.661 / Yeni bakiye:8.681', '127.0.0.1', '2020-04-29 02:15:10'),
(144, 74, '#51 numaralı sipariş kısmi olarak işaretlendi ve 0.02 TL ücret iade edildi Eski bakiye:8.681 / Yeni bakiye:8.701', '127.0.0.1', '2020-04-29 03:55:08'),
(145, 74, '#53 numaralı sipariş kısmi olarak işaretlendi ve 0.012 TL ücret iade edildi Eski bakiye:8.701 / Yeni bakiye:8.713', '127.0.0.1', '2020-04-29 06:15:10'),
(146, 73, 'Üye girişi yapıldı.', '5.24.168.125', '2020-04-29 10:13:52'),
(147, 73, '0 TL tutarında yeni sipariş geçildi #54.', '5.24.168.125', '2020-04-29 10:16:22'),
(148, 73, '2 TL tutarında yeni sipariş geçildi #55.', '178.247.17.225', '2020-04-29 10:54:05'),
(149, 73, '#54 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-29 10:55:10'),
(150, 73, '#55 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-29 11:05:14'),
(151, 73, '0.02 TL tutarında yeni sipariş geçildi #56.', '178.247.17.225', '2020-04-29 11:12:06'),
(152, 73, '#56 numaralı sipariş kısmi olarak işaretlendi ve 0.003 TL ücret iade edildi Eski bakiye:-92.02 / Yeni bakiye:-92.017', '127.0.0.1', '2020-04-29 11:50:06'),
(153, 74, 'Üye girişi yapıldı.', '213.186.144.61', '2020-04-29 16:27:40'),
(154, 74, '0.03 TL tutarında yeni sipariş geçildi #57.', '213.186.144.61', '2020-04-29 16:28:02'),
(155, 74, '#57 numaralı sipariş kısmi olarak işaretlendi ve 0.03 TL ücret iade edildi Eski bakiye:8.683 / Yeni bakiye:8.713', '127.0.0.1', '2020-04-29 16:30:14'),
(156, 74, 'Üye girişi yapıldı.', '213.186.144.61', '2020-04-30 01:20:19'),
(157, 74, 'Shopier API aracılığıyla 1 TL tutarında bakiye yüklendi', '213.186.144.61', '2020-04-30 13:46:24'),
(158, 74, 'Yönetici girişi yapıldı.', '213.186.144.61', '2020-04-30 15:14:20'),
(159, 74, 'Yönetici girişi yapıldı.', '213.186.144.61', '2020-04-30 15:15:41'),
(160, 85, 'Kullanıcı kaydı yapıldı.', '88.241.47.81', '2020-04-30 15:35:34'),
(161, 85, 'Üye girişi yapıldı.', '88.241.47.81', '2020-04-30 15:35:52'),
(162, 86, 'Kullanıcı kaydı yapıldı.', '88.241.47.81', '2020-04-30 19:29:14'),
(163, 86, 'Üye girişi yapıldı.', '88.241.47.81', '2020-04-30 19:29:27'),
(164, 86, 'Shopier API aracılığıyla 7 TL tutarında bakiye yüklendi', '88.241.47.81', '2020-04-30 19:39:00'),
(165, 86, '0.95 TL tutarında yeni sipariş geçildi #58.', '88.241.47.81', '2020-04-30 19:39:16'),
(166, 86, '0.95 TL tutarında yeni sipariş geçildi #59.', '88.241.47.81', '2020-04-30 19:40:56'),
(167, 86, '0.95 TL tutarında yeni sipariş geçildi #60.', '88.241.47.81', '2020-04-30 19:41:36'),
(168, 86, '0.95 TL tutarında yeni sipariş geçildi #61.', '88.241.47.81', '2020-04-30 19:41:44'),
(169, 86, '2.25 TL tutarında yeni sipariş geçildi #62.', '88.241.47.81', '2020-04-30 19:43:03'),
(170, 86, '0.95 TL tutarında yeni sipariş geçildi #63.', '88.241.47.81', '2020-04-30 19:45:50'),
(171, 86, '#58 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:10:06'),
(172, 86, '#60 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:10:06'),
(173, 86, '#59 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:15:05'),
(174, 86, '#61 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:15:05'),
(175, 86, '#62 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:15:06'),
(176, 86, '#63 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:20:06'),
(177, 86, 'Shopier API aracılığıyla 20 TL tutarında bakiye yüklendi', '88.241.47.81', '2020-04-30 20:55:08'),
(178, 86, '2.25 TL tutarında yeni sipariş geçildi #64.', '88.241.47.81', '2020-04-30 20:59:53'),
(179, 86, '2.25 TL tutarında yeni sipariş geçildi #65.', '88.241.47.81', '2020-04-30 21:05:16'),
(180, 86, '#64 numaralı sipariş iptal edildi ve 2.25 TL ücret iade edildi Eski bakiye:15.5 / Yeni bakiye:17.75', '127.0.0.1', '2020-04-30 21:10:05'),
(181, 86, '2.25 TL tutarında yeni sipariş geçildi #66.', '88.241.47.81', '2020-04-30 21:13:12'),
(182, 86, '2.25 TL tutarında yeni sipariş geçildi #67.', '88.241.47.81', '2020-04-30 21:14:53'),
(183, 86, '#66 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 22:10:06'),
(184, 87, 'Kullanıcı kaydı yapıldı.', '213.74.84.126', '2020-04-30 22:38:12'),
(185, 87, 'Üye girişi yapıldı.', '213.74.84.126', '2020-04-30 22:38:26'),
(187, 87, '11.25 TL tutarında yeni sipariş geçildi #68.', '213.74.84.126', '2020-04-30 22:47:21'),
(188, 87, '11.25 TL tutarında yeni sipariş geçildi #69.', '213.74.84.126', '2020-04-30 22:49:01'),
(189, 87, '11.25 TL tutarında yeni sipariş geçildi #70.', '213.74.84.126', '2020-04-30 22:49:07'),
(190, 87, 'Üye girişi yapıldı.', '213.74.84.126', '2020-04-30 22:49:30'),
(191, 86, '#67 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 22:50:07'),
(192, 87, '11.25 TL tutarında yeni sipariş geçildi #71.', '213.74.84.126', '2020-04-30 22:50:24'),
(193, 87, 'Üye girişi yapıldı.', '213.74.84.126', '2020-04-30 22:51:38'),
(194, 86, '#65 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 23:20:06'),
(195, 74, 'Yönetici girişi yapıldı.', '213.186.148.102', '2020-05-01 01:26:42'),
(196, 87, '#68 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 01:50:10'),
(197, 86, '11.25 TL tutarında yeni sipariş geçildi #72.', '88.241.47.81', '2020-05-01 04:00:24'),
(198, 86, '#72 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 07:00:08'),
(199, 77, '12.8 TL tutarında yeni sipariş geçildi #73.', '176.218.120.209', '2020-05-01 13:33:19'),
(200, 77, '12.8 TL tutarında yeni sipariş geçildi #74.', '176.218.120.209', '2020-05-01 13:34:59'),
(201, 74, '1 TL tutarında yeni sipariş geçildi #75.', '213.186.148.102', '2020-05-01 15:38:53'),
(202, 86, '0.95 TL tutarında yeni sipariş geçildi #76.', '88.241.47.81', '2020-05-01 16:26:39'),
(203, 86, '0.95 TL tutarında yeni sipariş geçildi #77.', '88.241.47.81', '2020-05-01 16:26:42'),
(204, 74, '1 TL tutarında yeni sipariş geçildi #78.', '213.186.148.102', '2020-05-01 17:38:53'),
(205, 86, '#76 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 17:40:06'),
(206, 77, '#73 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 18:30:07'),
(207, 74, 'Üye girişi yapıldı.', '213.186.148.102', '2020-05-01 21:57:05'),
(208, 77, '0.3 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:17:30'),
(209, 77, '0.2 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:18:00'),
(210, 77, '0.2 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:18:18'),
(211, 77, '0.3 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:19:16'),
(212, 77, '0.3 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:20:12'),
(213, 74, '0.01 TL tutarında yeni sipariş geçildi #79.', '213.186.148.102', '2020-05-01 22:30:15'),
(214, 74, '#79 numaralı sipariş iptal edildi ve 0.01 TL ücret iade edildi Eski bakiye:7.703 / Yeni bakiye:7.713', '127.0.0.1', '2020-05-02 00:05:16'),
(215, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:31:36'),
(216, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:31:38'),
(217, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:31:42'),
(218, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:34:46'),
(219, 88, 'Kullanıcı kaydı yapıldı.', '213.186.148.102', '2020-05-02 01:22:06'),
(220, 74, 'Yönetici girişi yapıldı.', '213.186.148.102', '2020-05-02 01:22:55'),
(221, 89, 'Kullanıcı kaydı yapıldı.', '176.33.243.62', '2020-05-02 02:01:29'),
(222, 89, 'Üye girişi yapıldı.', '176.33.243.62', '2020-05-02 02:02:01'),
(223, 89, '0 TL tutarında yeni sipariş geçildi #.', '176.33.243.62', '2020-05-02 02:03:15'),
(224, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 02:16:10'),
(225, 73, 'Yeni destek talebi oluşturuldu #4', '85.96.123.137', '2020-05-02 02:24:37'),
(226, 73, 'Üye girişi yapıldı.', '188.57.123.232', '2020-05-02 04:06:14'),
(227, 74, 'Yönetici girişi yapıldı.', '213.186.148.102', '2020-05-02 04:35:29'),
(228, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:21:49'),
(229, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:23:54'),
(230, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:28:21'),
(231, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:33:19'),
(232, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:37:48'),
(233, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:42:51'),
(234, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 15:46:07'),
(235, 73, '0 TL tutarında yeni sipariş geçildi #80.', '85.96.123.137', '2020-05-02 15:58:27'),
(236, 73, '#80 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-02 16:05:06'),
(237, 77, '12.8 TL tutarında yeni sipariş geçildi #81.', '176.218.120.209', '2020-05-03 04:10:50'),
(238, 74, '0.15 TL tutarında yeni sipariş geçildi #82.', '213.186.148.102', '2020-05-03 14:50:09'),
(239, 77, '#81 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-03 15:55:05'),
(240, 74, '#82 numaralı sipariş kısmi olarak işaretlendi ve 0.15 TL ücret iade edildi Eski bakiye:7.563 / Yeni bakiye:7.713', '127.0.0.1', '2020-05-03 15:55:06'),
(241, 90, 'Kullanıcı kaydı yapıldı.', '46.155.11.124', '2020-05-03 15:59:59'),
(242, 90, 'Üye girişi yapıldı.', '46.155.11.124', '2020-05-03 16:00:17'),
(243, 77, '12.8 TL tutarında yeni sipariş geçildi #83.', '176.218.120.209', '2020-05-03 21:00:39'),
(244, 73, '0 TL tutarında yeni sipariş geçildi #84.', '85.96.123.137', '2020-05-04 01:03:55'),
(245, 73, '#84 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 01:05:06'),
(246, 73, '0 TL tutarında yeni sipariş geçildi #85.', '85.96.123.137', '2020-05-04 01:52:03'),
(247, 73, '#85 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 01:55:06'),
(248, 91, 'Kullanıcı kaydı yapıldı.', '46.154.244.34', '2020-05-04 02:02:57'),
(249, 91, 'Üye girişi yapıldı.', '46.154.244.34', '2020-05-04 02:03:10'),
(250, 73, '0 TL tutarında yeni sipariş geçildi #86.', '85.96.123.137', '2020-05-04 02:03:27'),
(251, 73, '#86 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:03:56'),
(252, 73, '0 TL tutarında yeni sipariş geçildi #87.', '85.96.123.137', '2020-05-04 02:13:34'),
(253, 73, '0 TL tutarında yeni sipariş geçildi #88.', '85.96.123.137', '2020-05-04 02:13:52'),
(254, 73, '#87 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:15:05'),
(255, 73, '#88 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:15:06'),
(256, 73, '0 TL tutarında yeni sipariş geçildi #89.', '85.96.123.137', '2020-05-04 02:15:58'),
(257, 73, '0 TL tutarında yeni sipariş geçildi #90.', '85.96.123.137', '2020-05-04 02:16:29'),
(258, 73, '#89 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 02:19:33'),
(259, 73, '#90 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:19:33'),
(260, 73, '0 TL tutarında yeni sipariş geçildi #91.', '85.96.123.137', '2020-05-04 02:27:57'),
(261, 73, '#91 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:28:31'),
(262, 73, '0 TL tutarında yeni sipariş geçildi #92.', '85.96.123.137', '2020-05-04 02:38:03'),
(263, 73, '#92 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 02:40:51'),
(264, 92, 'Kullanıcı kaydı yapıldı.', '78.185.131.123', '2020-05-04 02:59:40'),
(265, 92, 'Üye girişi yapıldı.', '78.185.131.123', '2020-05-04 03:00:08'),
(266, 73, '0 TL tutarında yeni sipariş geçildi #93.', '85.96.123.137', '2020-05-04 03:46:02'),
(267, 73, '#93 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 03:50:19'),
(268, 73, '0 TL tutarında yeni sipariş geçildi #94.', '85.96.123.137', '2020-05-04 03:51:02'),
(269, 73, '0 TL tutarında yeni sipariş geçildi #95.', '85.96.123.137', '2020-05-04 04:01:37'),
(270, 73, '#95 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 04:02:07'),
(271, 77, '#83 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 05:25:04'),
(272, 73, '#94 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 07:55:06'),
(273, 87, '1.05 TL tutarında yeni sipariş geçildi #96.', '213.74.85.183', '2020-05-04 15:32:12'),
(274, 87, '0.478 TL tutarında yeni sipariş geçildi #97.', '213.74.85.183', '2020-05-04 15:35:29'),
(275, 87, '#96 numaralı sipariş iptal edildi ve 1.05 TL ücret iade edildi Eski bakiye:37.222 / Yeni bakiye:38.272', '127.0.0.1', '2020-05-04 16:20:06'),
(276, 87, '#97 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 17:05:23'),
(277, 74, '0.3 TL tutarında yeni sipariş geçildi #98.', '213.186.144.20', '2020-05-04 18:21:21'),
(278, 74, '#98 numaralı sipariş kısmi olarak işaretlendi ve 0.3 TL ücret iade edildi Eski bakiye:7.413 / Yeni bakiye:7.713', '127.0.0.1', '2020-05-04 18:25:07'),
(279, 77, 'Üye girişi yapıldı.', '37.154.236.97', '2020-05-04 20:34:10'),
(280, 77, '0 TL tutarında yeni sipariş geçildi #.', '37.154.236.97', '2020-05-04 20:34:20'),
(281, 77, '1 TL tutarında yeni sipariş geçildi #99.', '37.154.236.97', '2020-05-04 20:34:41'),
(282, 77, '12.8 TL tutarında yeni sipariş geçildi #100.', '37.154.236.97', '2020-05-04 20:35:56'),
(283, 77, '#99 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 21:20:06'),
(284, 74, 'Üye girişi yapıldı.', '93.177.75.174', '2020-05-05 00:15:25'),
(285, 93, 'Kullanıcı kaydı yapıldı.', '176.55.91.87', '2020-05-05 00:41:38'),
(286, 74, 'Yönetici girişi yapıldı.', '213.186.144.20', '2020-05-05 14:20:07'),
(287, 86, 'Üye girişi yapıldı.', '81.213.85.13', '2020-05-05 17:14:53'),
(288, 94, 'Kullanıcı kaydı yapıldı.', '188.3.169.27', '2020-05-06 01:20:22'),
(289, 94, 'Üye girişi yapıldı.', '188.3.169.27', '2020-05-06 01:29:00'),
(290, 77, '21.6 TL tutarında yeni sipariş geçildi #101.', '176.218.120.209', '2020-05-06 05:41:57'),
(291, 77, '0.3 TL tutarında yeni sipariş geçildi #102.', '176.218.120.209', '2020-05-06 05:44:02'),
(292, 77, '#102 numaralı sipariş kısmi olarak işaretlendi ve 0.3 TL ücret iade edildi Eski bakiye:5.5875 / Yeni bakiye:5.8875', '127.0.0.1', '2020-05-06 05:50:11'),
(293, 87, '5.22 TL tutarında yeni sipariş geçildi #103.', '213.74.84.70', '2020-05-06 17:37:01'),
(294, 87, '5.22 TL tutarında yeni sipariş geçildi #104.', '213.74.84.70', '2020-05-06 17:37:08'),
(295, 87, '5.22 TL tutarında yeni sipariş geçildi #105.', '213.74.84.70', '2020-05-06 17:37:57'),
(296, 87, '8.7 TL tutarında yeni sipariş geçildi #106.', '213.74.84.70', '2020-05-06 17:38:24'),
(297, 87, '8.7 TL tutarında yeni sipariş geçildi #107.', '213.74.84.70', '2020-05-06 17:40:09'),
(298, 87, '0.7 TL tutarında yeni sipariş geçildi #108.', '213.74.84.70', '2020-05-06 20:54:38'),
(299, 77, '#101 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-07 03:30:10'),
(300, 87, '13.4 TL tutarında yeni sipariş geçildi #109.', '213.74.86.123', '2020-05-07 14:05:27'),
(301, 87, '8.04 TL tutarında yeni sipariş geçildi #110.', '213.74.86.123', '2020-05-07 14:06:00'),
(302, 87, '#104 numaralı sipariş iptal edildi ve 5.22 TL ücret iade edildi Eski bakiye:0.472 / Yeni bakiye:5.692', '127.0.0.1', '2020-05-07 15:35:07'),
(303, 95, 'Kullanıcı kaydı yapıldı.', '176.55.225.128', '2020-05-07 15:38:57'),
(304, 95, 'Üye girişi yapıldı.', '176.55.225.128', '2020-05-07 15:39:12'),
(305, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:41:50'),
(306, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:06'),
(307, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:32'),
(308, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:32'),
(309, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:33'),
(310, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:33'),
(311, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:33'),
(312, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(313, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(314, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(315, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(316, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:35'),
(317, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:37'),
(318, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:37'),
(319, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:38'),
(320, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:39'),
(321, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:40'),
(322, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:44'),
(323, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:44'),
(324, 87, '#103 numaralı sipariş kısmi olarak işaretlendi ve 5.20782 TL ücret iade edildi Eski bakiye:5.692 / Yeni bakiye:10.89982', '127.0.0.1', '2020-05-07 18:25:06'),
(325, 87, '#105 numaralı sipariş kısmi olarak işaretlendi ve 5.22 TL ücret iade edildi Eski bakiye:10.89982 / Yeni bakiye:16.11982', '127.0.0.1', '2020-05-07 18:25:07'),
(326, 73, 'Yönetici girişi yapıldı.', '88.236.53.214', '2020-05-07 18:57:48'),
(327, 74, 'Üye girişi yapıldı.', '193.109.85.14', '2020-05-07 19:24:23'),
(328, 74, 'Yönetici girişi yapıldı.', '193.109.85.14', '2020-05-07 19:27:36'),
(329, 74, 'Üye girişi yapıldı.', '213.186.147.37', '2020-05-08 00:21:24'),
(330, 74, '2.948 TL tutarında yeni sipariş geçildi #111.', '213.186.147.37', '2020-05-08 00:22:24'),
(331, 96, 'Kullanıcı kaydı yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:33:31'),
(332, 74, 'Üye girişi yapıldı.', '213.186.147.37', '2020-05-08 00:36:17'),
(333, 97, 'Kullanıcı kaydı yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:36:36'),
(334, 97, 'Üye girişi yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:37:00'),
(335, 97, 'Üye girişi yapıldı.', '213.186.147.37', '2020-05-08 00:41:13'),
(336, 97, 'Üye girişi yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:42:44'),
(337, 97, '0.35 TL tutarında yeni sipariş geçildi #112.', '2a0b:f4c2:2::1', '2020-05-08 00:46:20'),
(338, 97, '0.35 TL tutarında yeni sipariş geçildi #113.', '2a0b:f4c2:2::1', '2020-05-08 00:46:26'),
(339, 97, '0.7 TL tutarında yeni sipariş geçildi #114.', '2a0b:f4c2:2::1', '2020-05-08 00:47:05'),
(340, 97, 'Yeni destek talebi oluşturuldu #5', '2a0b:f4c2:2::1', '2020-05-08 00:49:54'),
(341, 74, '#111 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-08 03:05:08'),
(342, 97, 'Üye girişi yapıldı.', '185.32.44.125', '2020-05-08 03:11:00'),
(343, 97, 'Destek talebine yanıt verildi #5', '185.32.44.125', '2020-05-08 03:11:27'),
(344, 97, '1.19 TL tutarında yeni sipariş geçildi #115.', '185.32.44.125', '2020-05-08 03:12:28'),
(345, 97, '1.3685 TL tutarında yeni sipariş geçildi #116.', '185.32.44.125', '2020-05-08 03:14:57'),
(346, 97, '1.3825 TL tutarında yeni sipariş geçildi #117.', '185.32.44.125', '2020-05-08 03:16:35'),
(347, 97, '0.6545 TL tutarında yeni sipariş geçildi #118.', '185.32.44.125', '2020-05-08 03:21:21'),
(348, 98, 'Kullanıcı kaydı yapıldı.', '178.246.161.235', '2020-05-08 04:36:39'),
(349, 98, 'Üye girişi yapıldı.', '178.246.161.235', '2020-05-08 04:36:45'),
(350, 73, 'Yönetici girişi yapıldı.', '88.231.202.160', '2020-06-05 04:49:58'),
(351, 99, 'Kullanıcı kaydı yapıldı.', '103.232.149.95', '2020-06-09 13:28:56'),
(352, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 13:29:07'),
(353, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 13:32:24'),
(354, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 13:59:34'),
(355, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 14:05:33'),
(356, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 14:20:19'),
(357, 99, 'New 10  payment has been made with PayTM', '103.232.149.95', '2020-06-09 14:21:24'),
(358, 99, 'Yeni destek talebi oluşturuldu #6', '103.232.149.95', '2020-06-09 14:56:54'),
(359, 99, '7.5 TL tutarında yeni sipariş geçildi #.', '103.232.149.95', '2020-06-09 14:59:13'),
(360, 99, '0.01 TL tutarında yeni sipariş geçildi #1.', '103.232.149.95', '2020-06-09 15:05:21'),
(361, 100, 'Kullanıcı kaydı yapıldı.', '103.72.10.32', '2020-06-09 15:06:51'),
(362, 100, 'Üye girişi yapıldı.', '103.72.10.32', '2020-06-09 15:07:02'),
(363, 100, 'Yeni destek talebi oluşturuldu #7', '103.72.10.32', '2020-06-09 15:07:56'),
(364, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 15:15:04'),
(365, 99, 'API Key değiştirildi', '103.232.149.95', '2020-06-09 15:18:57'),
(366, 99, '0.1 TL tutarında yeni sipariş geçildi #2.', '103.232.149.95', '2020-06-09 15:41:07'),
(367, 101, 'Kullanıcı kaydı yapıldı.', '137.97.122.85', '2020-06-10 10:27:02'),
(368, 101, 'Üye girişi yapıldı.', '137.97.122.85', '2020-06-10 10:27:36'),
(371, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-16 20:17:51'),
(372, 99, 'Yönetici girişi yapıldı.', '157.47.200.173', '2020-06-16 20:41:30'),
(373, 99, 'Yönetici girişi yapıldı.', '157.47.200.173', '2020-06-16 22:54:05'),
(374, 99, 'Üye girişi yapıldı.', '157.47.215.106', '2020-06-17 05:27:51'),
(375, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-17 07:23:54'),
(376, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-17 07:24:37'),
(377, 99, 'Yönetici girişi yapıldı.', '157.47.215.106', '2020-06-17 07:25:05'),
(378, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-17 07:27:14'),
(379, 99, 'Yönetici girişi yapıldı.', '157.46.153.114', '2020-06-17 12:07:38'),
(380, 99, 'Üye girişi yapıldı.', '157.46.132.85', '2020-06-17 14:02:30'),
(381, 99, '0 TL tutarında yeni sipariş geçildi #.', '157.47.217.195', '2020-06-18 07:39:00'),
(382, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.47.217.195', '2020-06-18 07:39:14'),
(383, 99, 'Destek talebine yanıt verildi #6', '157.46.158.177', '2020-06-18 13:36:17'),
(384, 99, 'Üye girişi yapıldı.', '157.37.174.119', '2020-06-19 06:54:49'),
(385, 99, '1 TL tutarında yeni sipariş geçildi #.', '157.37.174.119', '2020-06-19 06:55:26'),
(387, 99, 'Yönetici girişi yapıldı.', '27.56.214.208', '2020-06-19 17:37:18'),
(388, 99, 'Üye girişi yapıldı.', '157.46.136.64', '2020-06-19 20:13:58'),
(389, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '27.56.214.208', '2020-06-20 11:31:43'),
(390, 99, '0.1 TL tutarında yeni sipariş geçildi #.', '27.56.214.208', '2020-06-20 11:32:02'),
(391, 99, 'Yönetici girişi yapıldı.', '113.210.183.96', '2020-06-21 16:15:23'),
(392, 99, 'New 1  payment has been made with PayTM', '157.37.255.29', '2020-06-21 21:51:30'),
(393, 99, '99', '199.199.0.0', '2020-06-22 12:32:21'),
(394, 99, 'New 1  payment has been made with PayTM', '157.37.255.29', '2020-06-21 22:11:18'),
(395, 99, 'New 5  payment has been made with PayTM', '27.62.239.158', '2020-06-21 22:17:46'),
(396, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 08:18:41'),
(397, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 08:19:05'),
(398, 99, 'Üye girişi yapıldı.', '157.37.255.29', '2020-06-22 08:22:15'),
(399, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 08:25:25'),
(400, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 10:20:16'),
(401, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 10:44:07'),
(402, 99, '0.01 TL tutarında yeni sipariş geçildi #4.', '157.37.255.29', '2020-06-22 11:46:57'),
(405, 99, 'Üye girişi yapıldı.', '157.46.128.198', '2020-06-22 17:54:58'),
(406, 99, 'Yönetici girişi yapıldı.', '223.188.80.137', '2020-06-22 18:01:01'),
(407, 99, 'Yönetici girişi yapıldı.', '197.53.54.131', '2020-06-23 14:39:06'),
(408, 99, 'Yönetici girişi yapıldı.', '27.62.237.23', '2020-06-23 15:18:44'),
(409, 99, 'Üye girişi yapıldı.', '157.46.143.57', '2020-06-23 15:57:18'),
(410, 99, 'Üye girişi yapıldı.', '102.184.15.44', '2020-06-23 17:59:42'),
(411, 99, 'Yönetici girişi yapıldı.', '157.37.233.130', '2020-06-23 18:05:29'),
(412, 99, 'Yönetici girişi yapıldı.', '103.40.197.147', '2020-06-23 20:52:21'),
(413, 99, 'Kullanıcı parolası değiştirildi', '157.46.143.57', '2020-06-23 21:31:33'),
(414, 99, 'Yönetici girişi yapıldı.', '157.46.143.57', '2020-06-23 21:46:12'),
(415, 99, 'Yönetici girişi yapıldı.', '157.46.128.79', '2020-06-24 19:40:19'),
(416, 99, 'Yönetici girişi yapıldı.', '157.47.202.163', '2020-06-25 12:26:13'),
(417, 99, 'Yönetici girişi yapıldı.', '27.56.192.26', '2020-06-25 13:27:48'),
(418, 99, 'Yönetici girişi yapıldı.', '27.56.249.94', '2020-09-21 14:11:36'),
(419, 99, 'Üye girişi yapıldı.', '27.56.249.94', '2020-09-21 14:14:37'),
(420, 99, 'Yönetici girişi yapıldı.', '27.56.249.94', '2020-09-21 14:15:13'),
(421, 99, 'Üye girişi yapıldı.', '27.56.249.94', '2020-09-21 14:25:42'),
(422, 99, 'Kullanıcı parolası değiştirildi', '27.56.249.94', '2020-09-21 14:26:10'),
(423, 99, 'Üye girişi yapıldı.', '27.56.249.94', '2020-09-21 14:26:39'),
(424, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 14:28:17'),
(425, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 14:42:12'),
(426, 99, 'Yönetici girişi yapıldı.', '83.136.106.197', '2020-09-21 17:31:46'),
(427, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 17:32:06'),
(428, 103, 'Kullanıcı kaydı yapıldı.', '83.136.106.197', '2020-09-21 17:36:19'),
(429, 103, 'Üye girişi yapıldı.', '83.136.106.197', '2020-09-21 17:36:28'),
(430, 99, 'Yönetici girişi yapıldı.', '83.136.106.197', '2020-09-21 17:36:49'),
(431, 99, 'Yönetici girişi yapıldı.', '106.193.244.133', '2020-09-21 17:39:24'),
(432, 104, 'Kullanıcı kaydı yapıldı.', '128.199.84.170', '2020-09-21 18:23:32'),
(433, 104, 'Üye girişi yapıldı.', '128.199.84.170', '2020-09-21 18:23:46'),
(434, 99, 'Yönetici girişi yapıldı.', '106.193.244.133', '2020-09-21 18:30:20'),
(435, 105, 'Kullanıcı kaydı yapıldı.', '14.102.48.99', '2020-09-21 20:09:29'),
(436, 105, 'Üye girişi yapıldı.', '14.102.48.99', '2020-09-21 20:09:34'),
(437, 106, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 20:57:51'),
(438, 106, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 20:58:03'),
(439, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 21:25:30'),
(440, 107, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:27:47'),
(441, 108, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:30:39'),
(442, 109, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:32:19'),
(443, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 21:32:30'),
(444, 110, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:33:45'),
(445, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 21:33:51'),
(446, 111, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:35:09'),
(447, 112, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:37:58'),
(448, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:04:04'),
(449, 113, 'Kullanıcı kaydı yapıldı.', '106.207.216.248', '2020-09-21 23:08:48'),
(450, 113, 'Üye girişi yapıldı.', '106.207.216.248', '2020-09-21 23:09:00'),
(451, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:19:19'),
(452, 99, 'Üye girişi yapıldı.', '106.207.216.248', '2020-09-21 23:26:13'),
(453, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:42:01'),
(454, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:51:03'),
(455, 105, 'Üye girişi yapıldı.', '14.102.48.103', '2020-09-22 00:13:19'),
(456, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-22 00:43:34'),
(457, 114, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-22 00:47:43'),
(458, 114, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-22 00:48:04'),
(459, 99, 'Üye girişi yapıldı.', '106.208.181.248', '2020-09-22 22:37:09'),
(460, 99, 'Yönetici girişi yapıldı.', '106.208.181.248', '2020-09-22 22:38:48'),
(461, 99, 'Yönetici girişi yapıldı.', '106.210.178.38', '2020-09-23 14:33:22'),
(462, 115, 'Kullanıcı kaydı yapıldı.', '157.42.93.201', '2020-10-06 23:30:56'),
(463, 115, 'Üye girişi yapıldı.', '157.42.93.201', '2020-10-06 23:31:07'),
(464, 99, 'Yönetici girişi yapıldı.', '106.220.147.58', '2020-10-06 23:53:36'),
(465, 99, 'Üye girişi yapıldı.', '110.224.174.102', '2020-10-06 23:56:36'),
(466, 99, 'Üye girişi yapıldı.', '110.224.168.7', '2020-10-07 11:09:52'),
(467, 99, 'Yönetici girişi yapıldı.', '110.224.168.7', '2020-10-07 11:10:13'),
(468, 99, 'Yönetici girişi yapıldı.', '223.189.185.7', '2020-10-07 11:12:01'),
(469, 99, 'Üye girişi yapıldı.', '106.220.147.58', '2020-10-07 12:46:38'),
(470, 99, '24 TL tutarında yeni sipariş geçildi #.', '106.220.147.58', '2020-10-07 12:50:44'),
(471, 99, 'Yönetici girişi yapıldı.', '110.224.191.100', '2020-10-07 14:49:09'),
(472, 99, 'Yönetici girişi yapıldı.', '157.37.48.28', '2020-10-07 15:05:03'),
(473, 116, 'Kullanıcı kaydı yapıldı.', '106.220.147.58', '2020-10-07 16:25:01'),
(474, 115, '0 TL tutarında yeni sipariş geçildi #5.', '157.42.68.53', '2020-10-07 17:31:39'),
(475, 115, 'Yeni destek talebi oluşturuldu #9', '157.42.68.53', '2020-10-07 17:33:02'),
(476, 99, 'Üye girişi yapıldı.', '106.220.147.58', '2020-10-07 19:04:10'),
(477, 99, '24 TL tutarında yeni sipariş geçildi #.', '110.224.165.191', '2020-10-07 19:05:02'),
(478, 99, '24 TL tutarında yeni sipariş geçildi #.', '110.224.165.191', '2020-10-07 19:05:03'),
(479, 99, '0 TL tutarında yeni sipariş geçildi #6.', '110.224.165.191', '2020-10-07 19:05:25'),
(480, 117, 'Kullanıcı kaydı yapıldı.', '223.225.113.54', '2020-10-07 20:00:15'),
(481, 117, 'Üye girişi yapıldı.', '223.225.113.54', '2020-10-07 20:00:23'),
(482, 99, 'Üye girişi yapıldı.', '157.37.80.189', '2020-10-09 10:11:53'),
(483, 99, 'Üye girişi yapıldı.', '157.37.50.187', '2020-10-09 11:01:30'),
(484, 99, 'Üye girişi yapıldı.', '110.224.186.235', '2020-10-09 14:45:54'),
(485, 99, 'New 100  payment has been made with RazorPay', '157.37.173.98', '2020-10-10 00:31:05'),
(486, 99, 'New 50  payment has been made with RazorPay', '157.37.173.98', '2020-10-10 00:31:41'),
(487, 99, 'New 100  payment has been made with RazorPay', '110.224.173.27', '2020-10-10 00:36:49'),
(488, 99, 'New 69  payment has been made with RazorPay', '110.224.173.27', '2020-10-10 00:43:30'),
(489, 99, 'New 49000  payment has been made with RazorPay', '110.224.173.27', '2020-10-10 00:46:08'),
(490, 99, 'Üye girişi yapıldı.', '110.224.165.66', '2020-10-10 12:01:53'),
(491, 99, 'Üye girişi yapıldı.', '106.210.220.156', '2020-10-10 13:59:37'),
(492, 99, 'New 1000  payment has been made with PayTM', '110.224.166.58', '2020-10-10 14:48:34'),
(493, 99, 'New 69  payment has been made with PayTM', '110.224.166.58', '2020-10-10 14:50:36'),
(494, 99, 'New 1  payment has been made with PayTM', '110.224.166.58', '2020-10-10 15:04:19'),
(495, 99, 'New 1  payment has been made with PayTM', '110.224.166.58', '2020-10-10 15:05:05'),
(496, 118, 'Kullanıcı kaydı yapıldı.', '171.76.197.48', '2020-10-10 16:33:13'),
(497, 118, 'Üye girişi yapıldı.', '171.76.197.48', '2020-10-10 16:33:21'),
(498, 99, 'Üye girişi yapıldı.', '106.210.220.156', '2020-10-10 16:34:35'),
(499, 99, '24 TL tutarında yeni sipariş geçildi #.', '110.224.167.30', '2020-10-10 22:56:33'),
(500, 99, '0 TL tutarında yeni sipariş geçildi #7.', '110.224.167.30', '2020-10-10 22:56:47'),
(501, 99, 'Yönetici girişi yapıldı.', '110.224.167.30', '2020-10-11 00:42:04'),
(502, 99, '562.248 TL tutarında yeni sipariş geçildi #8.', '110.224.180.109', '2020-10-11 12:33:46'),
(503, 119, 'Kullanıcı kaydı yapıldı.', '47.247.91.248', '2020-10-11 23:26:01'),
(504, 119, 'Üye girişi yapıldı.', '47.247.91.248', '2020-10-11 23:26:14'),
(505, 119, 'Üye girişi yapıldı.', '47.247.91.248', '2020-10-11 23:32:15'),
(506, 119, 'Kullanıcı parolası değiştirildi', '47.247.91.248', '2020-10-11 23:34:53'),
(507, 120, 'Kullanıcı kaydı yapıldı.', '103.49.118.62', '2020-10-12 11:06:02'),
(508, 99, 'Üye girişi yapıldı.', '110.224.165.70', '2020-10-12 16:48:59'),
(509, 120, 'Üye girişi yapıldı.', '103.49.118.62', '2020-10-12 16:49:46'),
(510, 99, 'Üye girişi yapıldı.', '110.224.165.70', '2020-10-12 17:21:29'),
(511, 99, 'New 104  payment has been made with PayTM QR', '110.224.165.70', '2020-10-12 18:58:00'),
(512, 99, 'New 104  payment has been made with PayTM QR', '110.224.165.70', '2020-10-12 18:58:21'),
(513, 99, 'New 104  payment has been made with PayTM QR', '110.224.165.70', '2020-10-12 19:03:12'),
(514, 99, 'New 1  payment has been made with PayTM QR', '106.220.172.255', '2020-10-12 19:10:06'),
(515, 121, 'Kullanıcı kaydı yapıldı.', '223.187.178.103', '2020-10-12 19:14:27'),
(516, 121, 'Üye girişi yapıldı.', '223.187.178.103', '2020-10-12 19:14:51'),
(517, 121, 'New 1  payment has been made with PayTM QR', '223.187.178.103', '2020-10-12 19:16:32'),
(518, 122, 'Kullanıcı kaydı yapıldı.', '106.220.191.187', '2020-10-13 22:20:55'),
(519, 99, 'Üye girişi yapıldı.', '106.220.191.187', '2020-10-13 22:21:00'),
(520, 122, 'Yönetici girişi yapıldı.', '103.16.147.153', '2020-10-13 22:23:15'),
(521, 123, 'Kullanıcı kaydı yapıldı.', '157.39.152.136', '2020-10-14 14:31:20'),
(522, 123, 'Üye girişi yapıldı.', '157.39.152.136', '2020-10-14 14:31:37'),
(523, 124, 'Kullanıcı kaydı yapıldı.', '47.8.57.116', '2020-10-14 15:59:24'),
(524, 99, 'Üye girişi yapıldı.', '110.224.160.224', '2020-10-14 16:11:31'),
(525, 99, 'New 1  payment has been made with PayTM QR', '110.224.160.224', '2020-10-14 16:20:22'),
(526, 125, 'Kullanıcı kaydı yapıldı.', '27.62.250.217', '2020-10-14 18:47:34'),
(527, 125, 'Üye girişi yapıldı.', '27.62.250.217', '2020-10-14 18:47:42'),
(528, 126, 'Kullanıcı kaydı yapıldı.', '14.102.33.198', '2020-10-14 22:56:28'),
(529, 126, 'Üye girişi yapıldı.', '14.102.33.198', '2020-10-14 22:56:35'),
(530, 99, 'Üye girişi yapıldı.', '106.220.191.187', '2020-10-15 19:20:54'),
(531, 127, 'Kullanıcı kaydı yapıldı.', '106.220.191.187', '2020-10-16 18:48:01'),
(532, 99, 'Yönetici girişi yapıldı.', '157.37.120.177', '2020-10-18 16:08:20'),
(533, 99, 'Üye girişi yapıldı.', '106.207.215.240', '2020-10-19 19:03:36'),
(534, 99, 'Yönetici girişi yapıldı.', '106.220.190.118', '2020-10-21 11:23:45'),
(535, 128, 'Kullanıcı kaydı yapıldı.', '103.70.197.111', '2020-10-21 14:25:56'),
(536, 128, 'Üye girişi yapıldı.', '103.70.197.111', '2020-10-21 14:26:03'),
(537, 99, 'Yönetici girişi yapıldı.', '106.220.190.118', '2020-10-21 14:40:56'),
(538, 129, 'Kullanıcı kaydı yapıldı.', '49.32.7.218', '2020-10-21 23:26:29'),
(539, 129, 'Üye girişi yapıldı.', '49.32.7.218', '2020-10-21 23:26:41'),
(540, 130, 'Kullanıcı kaydı yapıldı.', '103.41.38.128', '2020-10-24 18:45:14'),
(541, 130, 'Üye girişi yapıldı.', '103.41.38.128', '2020-10-24 18:45:34'),
(542, 130, 'Üye girişi yapıldı.', '103.41.38.128', '2020-10-24 18:49:33'),
(543, 131, 'Kullanıcı kaydı yapıldı.', '106.204.28.148', '2020-10-28 13:39:19'),
(544, 131, 'Üye girişi yapıldı.', '106.204.28.148', '2020-10-28 13:40:18'),
(545, 99, 'Yönetici girişi yapıldı.', '106.220.190.118', '2020-10-28 13:40:45'),
(546, 131, 'Üye girişi yapıldı.', '106.204.28.148', '2020-10-28 13:42:25'),
(547, 131, 'Yönetici girişi yapıldı.', '106.204.28.148', '2020-10-28 13:48:00'),
(548, 128, 'Üye girişi yapıldı.', '103.99.205.43', '2020-10-29 11:32:43'),
(549, 99, 'Üye girişi yapıldı.', '27.62.181.63', '2020-11-06 23:30:58'),
(550, 128, 'Üye girişi yapıldı.', '103.70.196.190', '2020-11-07 15:59:10'),
(551, 132, 'Kullanıcı kaydı yapıldı.', '106.204.154.62', '2020-11-07 16:08:46'),
(552, 132, 'Üye girişi yapıldı.', '106.204.154.62', '2020-11-07 16:08:55'),
(553, 128, 'Yönetici girişi yapıldı.', '106.204.154.62', '2020-11-07 16:14:06'),
(554, 133, 'Kullanıcı kaydı yapıldı.', '49.35.200.94', '2020-11-07 21:31:35'),
(555, 133, 'Üye girişi yapıldı.', '49.35.200.94', '2020-11-07 21:31:57'),
(556, 133, 'New 1  payment has been made with PayTM', '103.106.101.103', '2020-11-07 21:37:09'),
(557, 133, 'Üye girişi yapıldı.', '103.106.101.103', '2020-11-07 21:44:43'),
(558, 133, 'New 1  payment has been made with PayTM', '103.106.101.103', '2020-11-07 21:47:51'),
(559, 133, 'New 1  payment has been made with PayTM', '103.106.101.103', '2020-11-07 21:50:30'),
(560, 132, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 21:55:36'),
(561, 133, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 21:56:22'),
(562, 128, 'Yönetici girişi yapıldı.', '106.204.42.176', '2020-11-07 21:57:44'),
(563, 133, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 21:58:52'),
(564, 128, 'Yönetici girişi yapıldı.', '106.204.42.176', '2020-11-07 22:03:17'),
(565, 133, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 22:09:52'),
(566, 133, '1.2 TL tutarında yeni sipariş geçildi #9.', '106.204.42.176', '2020-11-07 22:11:48'),
(567, 128, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 22:13:39'),
(568, 128, 'Yönetici girişi yapıldı.', '106.204.42.176', '2020-11-07 22:37:04'),
(569, 99, 'Üye girişi yapıldı.', '27.62.181.63', '2020-11-08 09:26:19'),
(570, 134, 'Kullanıcı kaydı yapıldı.', '27.62.145.160', '2020-11-12 19:18:34'),
(571, 134, 'Üye girişi yapıldı.', '27.62.145.160', '2020-11-12 19:19:33'),
(572, 99, 'Yönetici girişi yapıldı.', '106.216.167.110', '2020-11-12 19:22:20'),
(573, 135, 'Kullanıcı kaydı yapıldı.', '128.90.162.178', '2020-11-12 20:04:31'),
(574, 135, 'Üye girişi yapıldı.', '128.90.162.178', '2020-11-12 20:04:55'),
(575, 99, 'Yönetici girişi yapıldı.', '106.216.167.110', '2020-11-12 20:08:15'),
(576, 135, 'Üye girişi yapıldı.', '128.90.162.178', '2020-11-12 20:25:00'),
(577, 136, 'Kullanıcı kaydı yapıldı.', '157.44.151.165', '2020-11-14 21:40:47'),
(578, 136, 'Üye girişi yapıldı.', '157.44.151.165', '2020-11-14 21:42:19'),
(579, 99, 'Üye girişi yapıldı.', '110.224.182.181', '2020-11-16 15:48:32'),
(580, 99, 'Yönetici girişi yapıldı.', '110.224.182.181', '2020-11-16 16:04:31'),
(581, 99, 'Yönetici girişi yapıldı.', '110.224.182.181', '2020-11-16 16:08:50'),
(582, 126, 'Üye girişi yapıldı.', '14.102.33.201', '2020-11-17 22:44:24'),
(583, 137, 'Kullanıcı kaydı yapıldı.', '192.145.125.90', '2020-11-20 01:30:48');
INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(584, 137, 'Üye girişi yapıldı.', '192.145.125.90', '2020-11-20 01:31:46'),
(585, 99, 'Üye girişi yapıldı.', '110.224.185.151', '2020-11-28 22:37:52'),
(586, 99, '1.2 TL tutarında yeni sipariş geçildi #10.', '110.224.185.151', '2020-11-28 23:18:31'),
(587, 99, 'Yeni destek talebi oluşturuldu #10', '110.224.162.205', '2020-11-29 00:02:12'),
(588, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:13:56'),
(589, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:40:32'),
(590, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:42:58'),
(591, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:43:40'),
(592, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:49:33'),
(593, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:56:07'),
(594, 138, 'Kullanıcı kaydı yapıldı.', '110.224.183.37', '2020-11-29 01:03:56'),
(595, 99, 'Üye girişi yapıldı.', '110.224.183.37', '2020-11-29 01:07:14'),
(596, 99, '0 TL tutarında yeni sipariş geçildi #.', '110.224.183.37', '2020-11-29 01:52:01'),
(597, 99, 'Üye girişi yapıldı.', '106.193.196.227', '2020-11-29 10:02:56'),
(598, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 10:05:40'),
(599, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 10:11:54'),
(600, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 11:25:10'),
(601, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 11:43:45'),
(602, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 11:53:59'),
(603, 140, 'Kullanıcı kaydı yapıldı.', '157.42.63.169', '2020-11-29 13:52:42'),
(604, 140, 'Üye girişi yapıldı.', '157.42.63.169', '2020-11-29 13:52:56'),
(605, 141, 'Kullanıcı kaydı yapıldı.', '27.56.207.119', '2020-11-29 16:13:34'),
(606, 141, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 16:13:46'),
(607, 115, 'Üye girişi yapıldı.', '157.42.172.131', '2020-11-29 20:26:47'),
(608, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 22:37:41'),
(609, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-30 17:20:03'),
(610, 141, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-30 17:21:45'),
(611, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-30 20:03:07'),
(612, 99, 'Üye girişi yapıldı.', '106.210.229.29', '2020-12-03 10:59:29'),
(613, 99, 'Üye girişi yapıldı.', '27.56.218.117', '2020-12-03 10:59:34'),
(614, 115, 'Üye girişi yapıldı.', '157.35.228.163', '2020-12-03 11:23:55'),
(615, 142, 'Kullanıcı kaydı yapıldı.', '157.42.84.158', '2020-12-03 19:44:29'),
(616, 142, 'Üye girişi yapıldı.', '157.42.84.158', '2020-12-03 19:44:58'),
(617, 128, 'Üye girişi yapıldı.', '103.70.197.51', '2020-12-03 19:47:03'),
(618, 99, 'Yönetici girişi yapıldı.', '106.210.191.28', '2020-12-03 19:48:58'),
(619, 142, 'Yönetici girişi yapıldı.', '157.42.84.158', '2020-12-03 19:50:15'),
(620, 143, 'Kullanıcı kaydı yapıldı.', '180.244.235.181', '2020-12-04 06:50:08'),
(621, 143, 'Üye girişi yapıldı.', '180.244.235.181', '2020-12-04 06:50:23'),
(622, 144, 'Kullanıcı kaydı yapıldı.', '117.237.208.221', '2020-12-04 09:30:13'),
(623, 144, 'Üye girişi yapıldı.', '117.237.208.221', '2020-12-04 09:30:32'),
(624, 144, '0 TL tutarında yeni sipariş geçildi #11.', '117.237.208.221', '2020-12-04 09:32:46'),
(625, 144, '0 TL tutarında yeni sipariş geçildi #12.', '117.237.208.221', '2020-12-04 09:33:13'),
(626, 144, '0 TL tutarında yeni sipariş geçildi #13.', '117.237.208.221', '2020-12-04 09:33:41'),
(627, 144, '0 TL tutarında yeni sipariş geçildi #14.', '117.237.208.221', '2020-12-04 09:34:27'),
(628, 143, 'Üye girişi yapıldı.', '114.124.130.15', '2020-12-04 11:50:51'),
(629, 99, 'Yönetici girişi yapıldı.', '106.210.191.66', '2020-12-04 11:51:42'),
(630, 145, 'Kullanıcı kaydı yapıldı.', '14.102.33.198', '2020-12-04 12:52:50'),
(631, 145, 'Üye girişi yapıldı.', '14.102.33.198', '2020-12-04 12:53:04'),
(632, 141, 'Üye girişi yapıldı.', '110.224.160.186', '2020-12-04 13:22:36'),
(633, 146, 'Kullanıcı kaydı yapıldı.', '157.36.58.13', '2020-12-04 15:04:09'),
(634, 147, 'Kullanıcı kaydı yapıldı.', '157.44.77.107', '2020-12-04 19:48:12'),
(635, 147, 'Üye girişi yapıldı.', '157.44.77.107', '2020-12-04 19:48:26'),
(636, 148, 'Kullanıcı kaydı yapıldı.', '47.31.146.50', '2020-12-04 21:36:30'),
(637, 148, 'Üye girişi yapıldı.', '47.31.146.50', '2020-12-04 21:36:53'),
(638, 149, 'Kullanıcı kaydı yapıldı.', '106.210.191.66', '2020-12-04 22:58:03'),
(639, 99, 'Yönetici girişi yapıldı.', '106.210.191.66', '2020-12-04 23:50:10'),
(640, 145, 'Üye girişi yapıldı.', '14.102.33.198', '2020-12-05 13:26:32'),
(641, 143, 'Yönetici girişi yapıldı.', '180.244.233.131', '2020-12-05 17:36:39'),
(642, 149, 'Üye girişi yapıldı.', '103.3.220.60', '2020-12-05 18:12:11'),
(643, 99, 'Yönetici girişi yapıldı.', '106.220.134.34', '2020-12-05 20:50:13'),
(644, 128, 'Yönetici girişi yapıldı.', '106.204.5.217', '2020-12-05 20:52:03'),
(645, 150, 'Kullanıcı kaydı yapıldı.', '47.9.107.140', '2020-12-08 19:22:01'),
(646, 150, 'Üye girişi yapıldı.', '47.9.107.140', '2020-12-08 19:22:23'),
(647, 149, 'Yönetici girişi yapıldı.', '106.193.231.105', '2020-12-09 12:53:20'),
(648, 149, 'Yönetici girişi yapıldı.', '171.252.155.10', '2020-12-09 12:55:36'),
(649, 99, 'Yönetici girişi yapıldı.', '106.193.231.105', '2020-12-09 13:12:34'),
(650, 151, 'Kullanıcı kaydı yapıldı.', '117.233.102.163', '2020-12-09 20:01:12'),
(651, 151, 'Üye girişi yapıldı.', '117.233.102.163', '2020-12-09 20:01:39'),
(652, 152, 'Kullanıcı kaydı yapıldı.', '206.189.143.17', '2020-12-10 17:33:41'),
(653, 152, 'Üye girişi yapıldı.', '206.189.143.17', '2020-12-10 17:33:56'),
(654, 149, 'Yönetici girişi yapıldı.', '157.36.132.217', '2020-12-11 12:20:52'),
(655, 141, 'Üye girişi yapıldı.', '110.224.164.145', '2020-12-13 10:10:17'),
(656, 141, 'Üye girişi yapıldı.', '110.224.165.183', '2020-12-13 23:04:17'),
(657, 143, 'Üye girişi yapıldı.', '36.88.128.10', '2020-12-14 05:33:22'),
(658, 143, 'Üye girişi yapıldı.', '114.124.247.6', '2020-12-14 12:30:31'),
(659, 141, 'Üye girişi yapıldı.', '110.224.170.200', '2020-12-14 14:26:23'),
(660, 141, 'Üye girişi yapıldı.', '169.149.221.84', '2020-12-14 14:33:53'),
(661, 141, 'Üye girişi yapıldı.', '47.29.133.179', '2020-12-14 14:34:27'),
(662, 141, '0 TL tutarında yeni sipariş geçildi #.', '47.29.133.179', '2020-12-14 14:39:23'),
(663, 141, 'Üye girişi yapıldı.', '47.29.133.179', '2020-12-14 14:40:44'),
(664, 141, 'New 45  payment has been made with RazorPay', '47.29.133.179', '2020-12-14 14:42:32'),
(665, 141, 'Yeni destek talebi oluşturuldu #11', '47.29.133.179', '2020-12-14 14:46:54'),
(666, 141, 'Üye girişi yapıldı.', '169.149.235.14', '2020-12-14 14:48:13'),
(667, 141, 'API Key değiştirildi', '169.149.221.84', '2020-12-14 14:58:24'),
(668, 153, 'Kullanıcı kaydı yapıldı.', '45.124.146.33', '2020-12-14 15:12:18'),
(669, 153, 'Üye girişi yapıldı.', '45.124.146.33', '2020-12-14 15:12:31'),
(670, 99, 'Üye girişi yapıldı.', '110.224.168.190', '2020-12-14 15:19:31'),
(671, 141, 'Üye girişi yapıldı.', '47.29.133.179', '2020-12-14 15:27:18'),
(672, 141, '6 TL tutarında yeni sipariş geçildi #15.', '47.29.161.38', '2020-12-14 17:28:33'),
(673, 154, 'Kullanıcı kaydı yapıldı.', '182.70.101.154', '2020-12-14 18:59:26'),
(674, 154, 'Üye girişi yapıldı.', '182.70.101.154', '2020-12-14 18:59:59'),
(675, 149, 'Üye girişi yapıldı.', '182.70.101.154', '2020-12-14 19:01:47'),
(676, 149, 'Üye girişi yapıldı.', '114.124.196.0', '2020-12-17 16:08:13'),
(677, 149, 'Üye girişi yapıldı.', '122.161.93.245', '2020-12-17 17:56:24'),
(678, 141, 'New 50  payment has been made with RazorPay', '47.29.76.188', '2020-12-19 07:19:58'),
(679, 149, 'Üye girişi yapıldı.', '210.16.94.32', '2020-12-19 10:21:02'),
(680, 149, 'New 0.1  payment has been made with Perfect Money', '210.16.94.32', '2020-12-19 11:17:41'),
(681, 149, 'New 0.1  payment has been made with Perfect Money', '78.41.203.75', '2020-12-19 13:06:45'),
(682, 149, 'Yönetici girişi yapıldı.', '210.16.94.32', '2020-12-19 18:24:14'),
(683, 149, 'Üye girişi yapıldı.', '180.245.62.191', '2020-12-19 20:50:08'),
(684, 149, 'New 0.1  payment has been made with Perfect Money', '78.41.203.75', '2020-12-19 20:50:54'),
(685, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 16:50:23'),
(686, 141, 'New 50  payment has been made with RazorPay', '47.29.188.185', '2020-12-21 17:08:06'),
(687, 141, 'Destek talebine yanıt verildi #11', '47.29.188.185', '2020-12-21 17:24:08'),
(688, 141, 'Yönetici girişi yapıldı.', '47.29.188.185', '2020-12-21 17:45:11'),
(689, 141, 'New 11  payment has been made with RazorPay', '47.29.188.185', '2020-12-21 17:46:59'),
(690, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 17:54:42'),
(691, 99, 'Üye girişi yapıldı.', '110.224.185.157', '2020-12-21 18:35:34'),
(692, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 18:44:27'),
(693, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 21:10:48'),
(694, 141, 'New 100  payment has been made with RazorPay', '47.29.188.185', '2020-12-21 21:12:16'),
(695, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 21:18:45'),
(696, 141, 'Yönetici girişi yapıldı.', '169.149.231.72', '2020-12-22 10:16:30'),
(697, 149, 'Yönetici girişi yapıldı.', '155.94.250.83', '2020-12-22 16:47:20'),
(698, 155, 'Kullanıcı kaydı yapıldı.', '171.79.129.200', '2020-12-22 17:00:56'),
(699, 155, 'Üye girişi yapıldı.', '171.79.129.200', '2020-12-22 17:01:09'),
(700, 156, 'Kullanıcı kaydı yapıldı.', '102.52.73.63', '2020-12-22 20:56:58'),
(701, 156, 'Üye girişi yapıldı.', '102.52.73.63', '2020-12-22 20:57:09'),
(702, 126, 'Üye girişi yapıldı.', '14.102.33.198', '2020-12-22 22:59:28'),
(703, 126, 'Yeni destek talebi oluşturuldu #12', '14.102.33.198', '2020-12-22 23:01:34'),
(704, 149, 'Yönetici girişi yapıldı.', '47.9.230.98', '2020-12-23 00:41:59'),
(705, 149, 'Üye girişi yapıldı.', '47.9.230.98', '2020-12-23 00:55:58'),
(706, 149, 'Üye girişi yapıldı.', '47.9.230.98', '2020-12-23 00:58:53'),
(707, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2020-12-23 01:08:24'),
(708, 142, 'Üye girişi yapıldı.', '157.42.119.222', '2020-12-25 10:58:31'),
(709, 149, 'Yönetici girişi yapıldı.', '157.36.64.108', '2020-12-25 13:56:26'),
(710, 147, 'Üye girişi yapıldı.', '157.47.90.36', '2020-12-25 23:49:55'),
(711, 128, 'Üye girişi yapıldı.', '103.70.197.66', '2020-12-26 09:15:46'),
(712, 118, 'Üye girişi yapıldı.', '59.153.1.83', '2020-12-26 09:52:26'),
(713, 157, 'Kullanıcı kaydı yapıldı.', '183.83.163.32', '2020-12-26 12:36:28'),
(714, 157, 'Üye girişi yapıldı.', '183.83.163.32', '2020-12-26 12:36:39'),
(765, 115, 'Üye girişi yapıldı.', '157.42.82.113', '2021-01-03 09:54:09'),
(766, 149, 'Yönetici girişi yapıldı.', '124.253.158.159', '2021-01-03 14:41:24'),
(767, 141, 'Üye girişi yapıldı.', '47.29.249.53', '2021-01-03 21:33:48'),
(768, 161, 'Üye girişi yapıldı.', '157.42.184.70', '2021-01-04 15:52:24'),
(769, 149, 'Üye girişi yapıldı.', '124.253.237.190', '2021-01-04 15:58:05'),
(770, 149, 'Üye girişi yapıldı.', '157.47.193.247', '2021-01-04 17:47:14'),
(771, 149, 'Yönetici girişi yapıldı.', '197.132.41.176', '2021-01-04 23:58:16'),
(772, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-05 13:38:55'),
(773, 141, '2.42592 TL tutarında yeni sipariş geçildi #17.', '110.224.182.67', '2021-01-05 19:15:42'),
(774, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:09:10'),
(775, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:10:42'),
(776, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:10:57'),
(777, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:11:25'),
(778, 141, 'New Child Panel Order with id : 1.', '110.224.181.45', '2021-01-06 11:14:28'),
(779, 141, 'New Child Panel Order with id : 2.', '110.224.181.45', '2021-01-06 11:14:41'),
(780, 141, 'New Child Panel Order with id : 3.', '110.224.181.140', '2021-01-06 12:26:55'),
(781, 141, 'New Child Panel Order with id : 4.', '110.224.181.140', '2021-01-06 12:33:12'),
(782, 141, 'New Child Panel Order with id : 5.', '110.224.181.140', '2021-01-06 12:34:33'),
(783, 141, 'New Child Panel Order with id : 6.', '110.224.181.140', '2021-01-06 12:35:10'),
(784, 141, 'New Child Panel Order with id : 7.', '110.224.181.140', '2021-01-06 12:36:28'),
(785, 141, 'New Child Panel Order with id : 8.', '110.224.181.140', '2021-01-06 12:37:42'),
(786, 141, 'New Child Panel Order with id : 9.', '110.224.181.140', '2021-01-06 12:37:48'),
(787, 141, 'New Child Panel Order with id : 10.', '110.224.181.140', '2021-01-06 12:42:26'),
(788, 141, 'New Child Panel Order with id : 11.', '110.224.181.140', '2021-01-06 12:44:11'),
(789, 141, 'New Child Panel Order with id : 12.', '110.224.181.140', '2021-01-06 12:46:15'),
(790, 141, 'New Child Panel Order with id : 13.', '110.224.181.140', '2021-01-06 12:47:55'),
(791, 141, 'New Child Panel Order with id : 14.', '110.224.181.140', '2021-01-06 12:48:39'),
(792, 141, 'New Child Panel Order with id : 15.', '110.224.181.140', '2021-01-06 12:49:21'),
(793, 141, 'New Child Panel Order with id : 16.', '110.224.181.140', '2021-01-06 12:49:49'),
(794, 141, 'New Child Panel Order with id : 17.', '110.224.181.140', '2021-01-06 12:50:25'),
(795, 141, 'New Child Panel Order with id : 18.', '110.224.181.140', '2021-01-06 12:50:46'),
(796, 141, '2.42592 TL tutarında yeni sipariş geçildi #18.', '110.224.181.140', '2021-01-06 12:54:45'),
(797, 141, 'New Child Panel Order with id : 19.', '110.224.181.140', '2021-01-06 12:56:20'),
(798, 141, 'New Child Panel Order with id : 20.', '110.224.181.140', '2021-01-06 12:57:09'),
(799, 141, 'New Child Panel Order with id : 21.', '110.224.181.140', '2021-01-06 12:59:11'),
(800, 141, 'New Child Panel Order with id : 22.', '110.224.181.140', '2021-01-06 13:01:57'),
(801, 141, 'New Child Panel Order with id : 23.', '110.224.181.140', '2021-01-06 13:05:47'),
(802, 141, 'New Child Panel Order with id : 24.', '110.224.181.140', '2021-01-06 13:10:18'),
(803, 141, 'New Child Panel Order with id : 25.', '110.224.181.140', '2021-01-06 13:11:50'),
(804, 141, 'New Child Panel Order with id : 26.', '110.224.181.140', '2021-01-06 13:13:14'),
(805, 141, 'New Child Panel Order with id : 27.', '110.224.181.140', '2021-01-06 13:13:36'),
(806, 141, 'New Child Panel Order with id : 28.', '110.224.181.140', '2021-01-06 13:14:47'),
(807, 141, 'New Child Panel Order with id : 29.', '110.224.181.140', '2021-01-06 13:17:20'),
(808, 141, 'New Child Panel Order with id : 30.', '110.224.181.140', '2021-01-06 13:55:02'),
(809, 149, 'Üye girişi yapıldı.', '171.51.148.215', '2021-01-07 08:22:21'),
(810, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:07:40'),
(811, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:10:56'),
(812, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:18:16'),
(813, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:37:25'),
(814, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-09 22:05:05'),
(815, 141, 'Üye girişi yapıldı.', '110.224.185.192', '2021-01-09 22:13:06'),
(816, 149, 'Üye girişi yapıldı.', '157.48.169.34', '2021-01-10 10:14:18'),
(817, 149, 'Üye girişi yapıldı.', '157.48.169.34', '2021-01-10 10:17:14'),
(818, 149, 'Yeni destek talebi oluşturuldu #14', '197.132.135.180', '2021-01-10 10:22:17'),
(819, 164, 'Kullanıcı kaydı yapıldı.', '47.9.120.208', '2021-01-10 12:10:28'),
(820, 164, 'Üye girişi yapıldı.', '47.9.120.208', '2021-01-10 12:10:41'),
(821, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-10 19:47:10'),
(822, 128, 'Üye girişi yapıldı.', '106.204.160.105', '2021-01-10 20:29:55'),
(823, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-10 20:30:22'),
(824, 149, 'Üye girişi yapıldı.', '157.48.200.50', '2021-01-11 08:09:29'),
(825, 141, 'Üye girişi yapıldı.', '47.29.185.48', '2021-01-12 11:21:40'),
(826, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-13 12:02:15'),
(827, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-15 10:26:29'),
(828, 128, 'Üye girişi yapıldı.', '117.245.154.91', '2021-01-15 10:30:26'),
(829, 149, 'Yönetici girişi yapıldı.', '157.46.141.12', '2021-01-15 14:42:28'),
(830, 165, 'Kullanıcı kaydı yapıldı.', '157.46.141.12', '2021-01-15 14:52:05'),
(831, 165, 'Üye girişi yapıldı.', '157.46.141.12', '2021-01-15 14:52:19'),
(832, 149, 'Üye girişi yapıldı.', '106.192.59.8', '2021-01-15 20:00:05'),
(833, 149, 'Üye girişi yapıldı.', '106.192.59.8', '2021-01-15 20:03:18'),
(834, 166, 'Kullanıcı kaydı yapıldı.', '102.42.59.229', '2021-01-16 13:06:30'),
(835, 99, 'New Child Panel Order with id : 31.', '210.16.94.32', '2021-01-16 19:03:15'),
(836, 99, 'New Child Panel Order with id : 32.', '210.16.94.32', '2021-01-16 19:05:22'),
(837, 118, 'Üye girişi yapıldı.', '103.197.224.71', '2021-01-16 19:34:15'),
(838, 126, 'Üye girişi yapıldı.', '14.102.33.198', '2021-01-16 20:01:59'),
(839, 149, 'Yönetici girişi yapıldı.', '14.102.33.198', '2021-01-16 20:54:07'),
(840, 167, 'Kullanıcı kaydı yapıldı.', '157.38.92.199', '2021-01-16 21:53:56'),
(841, 167, 'Üye girişi yapıldı.', '157.38.92.199', '2021-01-16 21:54:31'),
(842, 165, 'Üye girişi yapıldı.', '157.46.150.9', '2021-01-17 11:28:40'),
(843, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-17 13:07:09'),
(844, 149, 'Üye girişi yapıldı.', '171.79.74.89', '2021-01-17 13:08:38'),
(845, 149, 'Üye girişi yapıldı.', '157.42.126.228', '2021-01-17 22:00:12'),
(846, 149, '0.2688 TL tutarında yeni sipariş geçildi #19.', '209.58.147.242', '2021-01-18 23:14:11'),
(847, 168, 'Kullanıcı kaydı yapıldı.', '47.9.90.9', '2021-01-18 23:58:19'),
(848, 168, 'Üye girişi yapıldı.', '47.9.90.9', '2021-01-18 23:58:32'),
(849, 149, 'Yönetici girişi yapıldı.', '157.48.145.149', '2021-01-19 11:49:58'),
(850, 130, 'Üye girişi yapıldı.', '114.134.24.172', '2021-01-20 00:27:59'),
(851, 99, 'Yönetici girişi yapıldı.', '106.220.138.154', '2021-01-20 00:49:34'),
(852, 149, 'Üye girişi yapıldı.', '114.134.24.172', '2021-01-20 00:53:15'),
(853, 149, 'Yönetici girişi yapıldı.', '114.134.24.172', '2021-01-20 00:53:35'),
(854, 149, 'Yönetici girişi yapıldı.', '114.134.24.172', '2021-01-20 02:49:30'),
(855, 149, 'Üye girişi yapıldı.', '47.31.49.138', '2021-01-20 15:05:43'),
(856, 149, 'Destek talebine yanıt verildi #14', '47.31.13.47', '2021-01-20 15:06:19'),
(857, 149, 'Üye girişi yapıldı.', '223.182.52.220', '2021-01-21 19:11:11'),
(858, 149, 'Üye girişi yapıldı.', '223.182.52.220', '2021-01-21 20:41:50'),
(859, 149, 'Yönetici girişi yapıldı.', '124.253.151.103', '2021-01-23 13:00:19'),
(860, 169, 'Kullanıcı kaydı yapıldı.', '47.15.103.239', '2021-01-23 17:42:28'),
(861, 169, 'Üye girişi yapıldı.', '47.15.103.239', '2021-01-23 17:42:41'),
(862, 99, 'Yönetici girişi yapıldı.', '106.220.218.128', '2021-01-23 17:56:46'),
(863, 149, 'Yönetici girişi yapıldı.', '106.220.218.128', '2021-01-23 17:56:59'),
(864, 149, 'Yönetici girişi yapıldı.', '47.15.112.119', '2021-01-23 17:58:10'),
(865, 149, 'Yönetici girişi yapıldı.', '27.255.206.253', '2021-01-23 19:02:25'),
(866, 149, 'Yönetici girişi yapıldı.', '27.255.206.253', '2021-01-23 20:51:23'),
(867, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-23 23:08:40'),
(868, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-23 23:09:05'),
(869, 149, 'Üye girişi yapıldı.', '27.61.165.131', '2021-01-24 20:23:38'),
(870, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-25 13:38:20'),
(871, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-26 00:21:23'),
(872, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-26 00:23:01'),
(874, 149, 'Yönetici girişi yapıldı.', '223.182.170.191', '2021-01-27 12:22:54'),
(876, 149, 'Yönetici girişi yapıldı.', '120.89.74.163', '2021-01-27 13:54:45'),
(877, 149, 'Yönetici girişi yapıldı.', '171.252.188.168', '2021-01-27 13:56:51'),
(878, 149, 'Yeni destek talebi oluşturuldu #15', '120.89.74.163', '2021-01-27 14:17:54'),
(879, 141, 'Üye girişi yapıldı.', '110.224.187.59', '2021-01-27 14:37:44'),
(880, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-27 14:38:15'),
(881, 141, 'Üye girişi yapıldı.', '110.224.187.59', '2021-01-27 14:38:24'),
(882, 99, '0.152 TL tutarında yeni sipariş geçildi #20.', '210.16.94.32', '2021-01-27 14:59:25'),
(883, 141, '1.52 TL tutarında yeni sipariş geçildi #21.', '110.224.187.59', '2021-01-27 15:00:23'),
(884, 170, 'Kullanıcı kaydı yapıldı.', '157.42.30.245', '2021-01-27 15:04:33'),
(885, 170, 'Üye girişi yapıldı.', '157.42.30.245', '2021-01-27 15:04:48'),
(886, 141, '0.152 TL tutarında yeni sipariş geçildi #22.', '110.224.187.59', '2021-01-27 15:06:11'),
(887, 149, 'Üye girişi yapıldı.', '197.132.247.181', '2021-01-28 04:59:23'),
(888, 149, 'Yönetici girişi yapıldı.', '157.46.249.134', '2021-01-28 19:21:16'),
(889, 149, 'Üye girişi yapıldı.', '106.205.9.59', '2021-01-28 19:40:44'),
(890, 149, 'Üye girişi yapıldı.', '106.76.73.124', '2021-01-28 19:41:47'),
(891, 141, 'New Child Panel Order with id : .', '110.224.169.108', '2021-01-29 12:20:20'),
(892, 141, 'New Child Panel Order with id : 33.', '110.224.169.108', '2021-01-29 12:21:22'),
(893, 149, 'Yönetici girişi yapıldı.', '202.51.88.21', '2021-01-29 12:23:52'),
(894, 141, 'New Child Panel Order with id : 34.', '110.224.169.108', '2021-01-29 13:54:24'),
(895, 141, 'Child Panel Renewed with id : 33.', '110.224.169.10', '2021-01-29 17:45:53'),
(896, 141, 'Child Panel Renewed with id : 33.', '110.224.169.10', '2021-01-29 17:51:14'),
(897, 141, 'Child Panel Renewed with id : 34.', '110.224.169.10', '2021-01-29 17:52:17'),
(898, 149, 'Üye girişi yapıldı.', '157.48.213.186', '2021-01-29 19:33:38'),
(899, 149, 'Üye girişi yapıldı.', '106.76.73.18', '2021-01-29 19:34:47'),
(900, 149, 'Üye girişi yapıldı.', '110.235.219.147', '2021-01-30 00:02:48'),
(901, 149, '0 TL tutarında yeni sipariş geçildi #.', '157.48.209.207', '2021-01-30 11:29:07'),
(902, 149, 'Yönetici girişi yapıldı.', '27.61.57.201', '2021-01-30 11:39:50'),
(903, 149, 'Üye girişi yapıldı.', '178.218.103.83', '2021-01-30 13:41:52'),
(904, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-30 14:22:51'),
(905, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 14:48:34'),
(906, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 14:51:27'),
(907, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 14:57:00'),
(908, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 15:01:44'),
(909, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 15:02:44'),
(910, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 15:08:31'),
(911, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 15:13:18'),
(912, 141, 'New Child Panel Order with id : 35.', '110.224.168.107', '2021-01-30 15:14:18'),
(913, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 15:19:30'),
(914, 141, 'Child Panel Renewed with id : 33.', '110.224.179.26', '2021-01-30 23:39:58'),
(915, 141, '0.001 TL tutarında yeni sipariş geçildi #23.', '110.224.174.142', '2021-01-31 11:04:25'),
(916, 141, '4.5 TL tutarında yeni sipariş geçildi #24.', '110.224.174.142', '2021-01-31 11:23:42'),
(917, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:52:02'),
(918, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:53:23'),
(919, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:54:56'),
(920, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:57:34'),
(921, 141, '4.5 TL tutarında yeni sipariş geçildi #25.', '110.224.174.142', '2021-01-31 11:59:49'),
(922, 141, '4.5 TL tutarında yeni sipariş geçildi #26.', '110.224.174.142', '2021-01-31 12:09:50'),
(923, 171, 'Kullanıcı kaydı yapıldı.', '42.111.212.35', '2021-06-05 17:57:36'),
(924, 171, 'Üye girişi yapıldı.', '42.111.212.35', '2021-06-05 17:59:00'),
(925, 171, 'Üye girişi yapıldı.', '42.111.212.35', '2021-06-05 18:10:59'),
(926, 171, 'Üye girişi yapıldı.', '42.111.212.35', '2021-06-05 19:59:05'),
(927, 171, '0 TL tutarında yeni sipariş geçildi #.', '42.111.212.35', '2021-06-05 19:59:34'),
(928, 171, 'Yönetici girişi yapıldı.', '42.111.212.35', '2021-06-05 20:43:51'),
(929, 172, 'Kullanıcı kaydı yapıldı.', '42.111.220.162', '2021-06-06 11:30:36'),
(930, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 11:30:47'),
(931, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 11:41:40'),
(932, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 11:48:53'),
(933, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 12:06:28'),
(934, 173, 'Kullanıcı kaydı yapıldı.', '157.47.235.217', '2021-06-06 14:00:57'),
(935, 173, 'Üye girişi yapıldı.', '157.47.235.217', '2021-06-06 14:01:37'),
(936, 174, 'Kullanıcı kaydı yapıldı.', '157.32.126.25', '2021-06-06 19:40:32'),
(937, 174, 'Üye girişi yapıldı.', '27.61.190.245', '2021-06-06 19:41:59'),
(938, 171, 'Yönetici girişi yapıldı.', '42.111.204.16', '2021-06-09 14:11:38'),
(939, 171, 'Üye girişi yapıldı.', '157.33.41.89', '2021-06-09 14:14:18'),
(940, 172, 'Yönetici girişi yapıldı.', '42.111.216.170', '2021-06-13 08:55:52'),
(941, 172, 'Yönetici girişi yapıldı.', '106.0.38.119', '2021-06-13 09:11:33'),
(942, 172, 'Yönetici girişi yapıldı.', '106.204.235.55', '2021-06-13 09:11:38'),
(943, 172, 'Yönetici girişi yapıldı.', '106.204.235.55', '2021-06-13 09:14:43'),
(947, 176, 'Kullanıcı kaydı yapıldı.', '47.15.185.102', '2021-06-14 09:06:40'),
(948, 176, 'Üye girişi yapıldı.', '47.15.185.102', '2021-06-14 09:06:47'),
(949, 177, 'Kullanıcı kaydı yapıldı.', '223.225.171.109', '2021-06-14 11:11:03'),
(950, 177, 'Üye girişi yapıldı.', '223.225.171.109', '2021-06-14 11:11:15'),
(951, 175, 'Yönetici girişi yapıldı.', '157.37.155.193', '2021-06-14 11:27:29'),
(952, 175, 'Yönetici girişi yapıldı.', '223.225.171.109', '2021-06-14 11:28:26'),
(953, 175, 'Yönetici girişi yapıldı.', '62.201.242.60', '2021-06-14 13:10:07'),
(954, 175, 'Üye girişi yapıldı.', '106.220.107.171', '2021-06-14 18:44:55'),
(955, 178, 'Kullanıcı kaydı yapıldı.', '47.247.207.230', '2021-06-15 13:33:53'),
(956, 178, 'Üye girişi yapıldı.', '47.247.207.230', '2021-06-15 13:34:01'),
(957, 179, 'Kullanıcı kaydı yapıldı.', '157.37.157.251', '2021-06-16 09:41:54'),
(958, 179, 'Üye girişi yapıldı.', '157.37.157.251', '2021-06-16 09:42:13'),
(959, 175, 'Üye girişi yapıldı.', '47.31.210.2', '2021-06-16 13:06:22'),
(960, 175, 'Yönetici girişi yapıldı.', '42.111.204.83', '2021-06-16 13:15:05'),
(961, 175, 'Üye girişi yapıldı.', '157.37.168.140', '2021-06-21 13:33:58'),
(962, 175, 'Yönetici girişi yapıldı.', '157.37.168.140', '2021-06-21 14:36:02'),
(963, 180, 'Kullanıcı kaydı yapıldı.', '27.61.126.193', '2021-06-21 14:46:07'),
(964, 180, 'Üye girişi yapıldı.', '27.61.126.193', '2021-06-21 14:46:49'),
(965, 180, 'Üye girişi yapıldı.', '223.228.237.157', '2021-06-21 15:08:00'),
(966, 175, 'Yönetici girişi yapıldı.', '157.37.168.140', '2021-06-21 15:45:49'),
(967, 175, 'Üye girişi yapıldı.', '157.37.164.5', '2021-06-21 16:22:11'),
(968, 175, 'Yönetici girişi yapıldı.', '132.154.133.106', '2021-06-21 16:35:29'),
(969, 175, 'Yönetici girişi yapıldı.', '223.228.237.157', '2021-06-21 16:41:25'),
(970, 175, 'Üye girişi yapıldı.', '157.37.189.248', '2021-06-21 18:17:22'),
(971, 175, 'Üye girişi yapıldı.', '103.100.4.197', '2021-06-21 22:21:15'),
(972, 181, 'Kullanıcı kaydı yapıldı.', '157.42.234.206', '2021-06-22 00:12:07'),
(973, 181, 'Üye girişi yapıldı.', '157.42.234.206', '2021-06-22 00:12:39'),
(974, 182, 'Kullanıcı kaydı yapıldı.', '157.44.223.251', '2021-06-22 18:07:42'),
(975, 182, 'Üye girişi yapıldı.', '157.44.223.251', '2021-06-22 18:07:53'),
(976, 182, 'Üye girişi yapıldı.', '157.44.223.251', '2021-06-22 18:08:05'),
(977, 175, 'Yönetici girişi yapıldı.', '47.9.236.126', '2021-06-22 18:40:24'),
(978, 183, 'Kullanıcı kaydı yapıldı.', '2409:4063:409c:6a14:a15e:7354:d511:4f5c, 108.162.221.244', '2021-10-29 12:52:24'),
(979, 183, 'Üye girişi yapıldı.', '2409:4063:409c:6a14:a15e:7354:d511:4f5c, 108.162.221.244', '2021-10-29 12:52:35'),
(980, 183, 'Yönetici girişi yapıldı.', '103.217.243.208, 172.69.68.201', '2021-10-29 13:09:52'),
(981, 184, 'Kullanıcı kaydı yapıldı.', '2402:8100:22e9:5268:d40b:a652:30a:d15f, 108.162.221.244', '2021-10-29 16:35:07'),
(982, 184, 'Üye girişi yapıldı.', '2402:8100:22e9:5268:d40b:a652:30a:d15f, 108.162.221.244', '2021-10-29 16:35:15'),
(983, 184, 'Yeni destek talebi oluşturuldu #1', '2402:8100:22e9:5268:d40b:a652:30a:d15f, 108.162.221.192', '2021-10-29 16:42:29'),
(984, 184, 'New 10  payment has been made with PayTM QR', '2401:4900:5450:8932::82f:9337, 172.69.71.128', '2021-10-29 17:02:48'),
(985, 185, 'Kullanıcı kaydı yapıldı.', '2409:4050:2e89:4375::16ca:df0a, 108.162.221.244', '2021-10-29 22:58:30'),
(986, 185, 'Üye girişi yapıldı.', '2409:4050:2e89:4375::16ca:df0a, 108.162.221.244', '2021-10-29 22:58:47'),
(987, 186, 'Kullanıcı kaydı yapıldı.', '2401:4900:c8a:87eb:7033:9357:c30b:e1f2, 108.162.221.244', '2021-10-31 12:57:28'),
(988, 186, 'Üye girişi yapıldı.', '2401:4900:c8a:87eb:7033:9357:c30b:e1f2, 108.162.221.244', '2021-10-31 12:57:53'),
(989, 187, 'Kullanıcı kaydı yapıldı.', '185.173.205.74, 108.162.221.178', '2021-10-31 22:56:27'),
(990, 187, 'Üye girişi yapıldı.', '185.173.205.74, 108.162.221.178', '2021-10-31 22:56:44'),
(991, 183, 'Yeni destek talebi oluşturuldu #2', '103.217.243.238, 172.69.71.43', '2021-11-01 15:55:22'),
(992, 183, 'Yeni destek talebi oluşturuldu #3', '103.217.243.244, 172.69.68.201', '2021-11-01 16:05:23'),
(993, 188, 'Kullanıcı kaydı yapıldı.', '105.67.1.250, 172.69.71.43', '2021-11-04 22:37:22'),
(994, 188, 'Üye girişi yapıldı.', '105.67.1.250, 172.69.71.43', '2021-11-04 22:37:36'),
(995, 189, 'Kullanıcı kaydı yapıldı.', '2401:4900:3b11:ab3f:24d:72f1:d2b6:daf0, 172.69.68.201', '2021-11-06 05:13:27'),
(996, 189, 'Üye girişi yapıldı.', '2401:4900:3b11:ab3f:24d:72f1:d2b6:daf0, 172.69.68.201', '2021-11-06 05:13:56'),
(997, 190, 'Kullanıcı kaydı yapıldı.', '117.236.128.17, 108.162.221.216', '2021-11-06 10:41:25'),
(998, 190, 'Üye girişi yapıldı.', '117.236.128.17, 108.162.221.216', '2021-11-06 10:41:30'),
(999, 191, 'Kullanıcı kaydı yapıldı.', '2409:4064:398:ee17::2143:60b1, 172.69.71.43', '2021-11-07 12:27:01'),
(1000, 191, 'Üye girişi yapıldı.', '2409:4064:398:ee17::2143:60b1, 172.69.71.43', '2021-11-07 12:27:10'),
(1001, 192, 'Kullanıcı kaydı yapıldı.', '2409:4063:4182:949f:707b:fbf9:3923:d195, 172.69.68.201', '2021-11-09 14:28:54'),
(1002, 183, 'Yönetici girişi yapıldı.', '2409:4063:4182:949f:707b:fbf9:3923:d195, 108.162.221.178', '2021-11-09 14:30:17'),
(1003, 193, 'Kullanıcı kaydı yapıldı.', '2402:3a80:b07:e2d8:f054:fb7a:5c6f:b788, 108.162.221.216', '2021-11-09 15:24:03'),
(1004, 193, 'Üye girişi yapıldı.', '2402:3a80:b07:e2d8:f054:fb7a:5c6f:b788, 108.162.221.216', '2021-11-09 15:24:16'),
(1005, 194, 'Kullanıcı kaydı yapıldı.', '110.235.235.184, 108.162.221.244', '2021-11-11 10:39:49'),
(1006, 194, 'Üye girişi yapıldı.', '110.235.235.184, 108.162.221.244', '2021-11-11 10:39:58'),
(1007, 195, 'Kullanıcı kaydı yapıldı.', '1.187.181.38', '2022-12-31 06:53:42'),
(1008, 195, 'Üye girişi yapıldı.', '1.187.181.38', '2022-12-31 06:56:11'),
(1009, 195, 'Üye girişi yapıldı.', '1.187.212.191', '2022-12-31 09:03:35'),
(1010, 195, 'New Child Panel Order with id : .', '1.187.212.191', '2022-12-31 09:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Türkçe', 'tr', '1', '0'),
(2, 'English', 'en', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `is_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(1, 'Login', 'auth', '<p>BEST CHEAPEST SMM PANEL</p>'),
(2, 'New Order', 'neworder', '<h4 style=\"margin-top: 0px; margin-bottom: 0.5rem; font-weight: 700; line-height: 28px; font-size: 20px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\">Create a ticke&nbsp; for Quick support</h4><div><br></div><div><h5 segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" color:=\"\" rgb(5,=\"\" 59,=\"\" 62);=\"\" background-color:=\"\" rgb(229,=\"\" 249,=\"\" 250);\"=\"\" style=\"margin-bottom: 10.5px; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow;\"><div style=\"text-align: center;\"><span style=\"color: inherit; font-family: inherit;\">Hi User\'s ,</span></div><div style=\"text-align: center;\"><span style=\"color: inherit; font-family: inherit;\">अगर आप को puffxsmmpanel.in पर कोई भी issue आता है Too Support टिकट का उपयोग करें आपको 30 मिनट mai रिप्लाई मेलेगा&nbsp;</span></div></h5><h5 segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" color:=\"\" rgb(5,=\"\" 59,=\"\" 62);=\"\" margin-top:=\"\" 0px;=\"\" background-color:=\"\" rgb(229,=\"\" 249,=\"\" 250);\"=\"\" style=\"margin-bottom: 10.5px; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><span <br=\"\">Thankyou&nbsp;</span></h5><h5 segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-weight:=\"\" 700;=\"\" background-color:=\"\" rgb(229,=\"\" 249,=\"\" 250);\"=\"\" style=\"margin-bottom: 0.5rem; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><span <br=\"\">Team - puffxsmmpanel.in</span></h5><h5 segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";=\"\" font-weight:=\"\" 700;=\"\" background-color:=\"\" rgb(229,=\"\" 249,=\"\" 250);\"=\"\" style=\"margin-bottom: 0.5rem; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><span <br=\"\"><br></span></h5><h4 style=\"margin-top: 0px; margin-bottom: 0.5rem; font-weight: 700; line-height: 28px; font-size: 20px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><span <br=\"\" style=\"color: rgb(255, 0, 0);\">Notice</span></h4><div><span <br=\"\"><h5 segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";\"=\"\" style=\"margin-bottom: 10.5px; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\">All services are getting updated now only fastest service will be available on puffxsmmpanel.in If any user finds any Slow services then please complain to Support team ☺️</h5><h5 style=\"margin-bottom: 10.5px; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow;\"><font segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";\"=\"\"><div style=\"text-align: center;\"><span style=\"color: inherit;\">सभी सेवाएं अपडेट हो रही हैं अब केवल सबसे तेज सेवा puffxsmmpanel.in पर उपलब्ध होगी यदि किसी उपयोगकर्ता को कोई धीमी सेवा मिलती है तो कृपया Support team से शिकायत करें ️☺️</span></div><div style=\"text-align: center;\"><span style=\"color: inherit;\"><br></span></div></font></h5><h3 style=\"margin-bottom: 0.5rem; font-weight: 700; line-height: 32px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><span style=\"color: inherit;\">Rules</span></h3><h5 style=\"margin-bottom: 0.5rem; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\">एक link से एक Oder लगाना है दुसरा Oder उसी Link से जबतक नहीं लगाना है तब तक पहला Oder Complete ना हो जाए&nbsp;</h5><p style=\"margin-bottom: 0.5rem; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><br></p><p style=\"margin-bottom: 0.5rem; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow; text-align: center;\"><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/cyrasHO4EvU\" width=\"245\" height=\"138\" class=\"note-video-clip\"></iframe><br></p><h5 style=\"margin-bottom: 10.5px; font-weight: 700; line-height: 24px; font-size: 16px; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Barlow;\"><font segoe=\"\" ui\",=\"\" roboto,=\"\" \"helvetica=\"\" neue\",=\"\" arial,=\"\" \"noto=\"\" sans\",=\"\" sans-serif,=\"\" \"apple=\"\" color=\"\" emoji\",=\"\" \"segoe=\"\" ui=\"\" symbol\",=\"\" emoji\";\"=\"\"><p style=\"margin-bottom: 0px; text-align: center;\"><br></p></font></h5></span></div></div>'),
(3, 'Services', 'services', ''),
(4, 'Add Funds', 'addfunds', '<p><br></p>'),
(5, 'Tickets', 'tickets', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">faf</font></font></p>'),
(6, 'Terms', 'terms', '<div style=\"will-change: transform;\"><h1 class=\"text-center\" style=\"margin-top: 0px; margin-bottom: 0.5rem; font-weight: 700; line-height: 1.16667; font-size: 10vmin; letter-spacing: 0px; color: rgb(5, 42, 54); font-family: Roboto, sans-serif;\">Read Terms of Service Carefully Before Registration and Order Services</h1><div><br></div><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">The use of services provided by Puffx Smm Panel establishes agreement to all the terms listed below. By registering or using our services you agree that you have read and fully understood the following terms of Service and “Puffx Smm Panel” will not be held liable for loss in any way for users who have not read the below terms of service.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><h5 style=\"margin-bottom: 0px;\">1. General</h5><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">By placing an order with Puffx Smm Panel, you automatically accept all the below listed terms of service weather you read them or not.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">We reserve the right to change these terms of service without notice. You are expected to read all terms of service before placing any order to insure you are up to date with any changes or any future changes.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">You will only use the “Puffx Smm Panel website in a manner which follows all agreements made with Instagram/Facebook/Twitter/Youtube/Other social media site on their individual Terms of Service page. “Puffx Smm Panel” rates are subject to change at any time without notice. The payment/refund policy stays in effect in the case of rate changes. Puffx Smm Panel” does not guarantee a delivery time for any services. We offer our best estimation for when the order will be delivered. This is only an estimation and “Puffx Smm Panel” will not refund orders that are processing if you feel they are taking too long. “Puffx Smm Panel” tries hard to deliver exactly what is expected from us by our re-sellers. In this case, we reserve the right to change a service type if we deem it necessary to complete an order.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><h5 style=\"margin-bottom: 0px;\">Disclaimer:</h5><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Puffx Smm Panel  will not be responsible for any damages you or your business may suffer.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><h5 style=\"margin-bottom: 0px;\">Liabilities:</h5><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Puffx Smm Panel”is in no way liable for any refund, refill, or not completion of service account suspension or picture deletion done by Instagram or Twitter or Facebook or YouTube or Other Social Media.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><h5 style=\"margin-bottom: 0px;\">2. Service</h5><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Puffx Smm Panel”will only be used to promote your Instagram/Twitter/Facebook/premium account or Social account and help boost your \"Appearance\" only.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">We DO NOT guarantee your new followers will interact with you, we simply guarantee you to get the followers you pay for.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">We DO NOT guarantee 100% of our accounts will have a profile picture, full bio and uploaded pictures, although we strive to make this the reality for all accounts.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">You will not upload anything into the Puffx Smm Panel site including nudity or any material that is not accepted or suitable for the Instagram/Twitter/Facebook or Social Media community.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Private accounts would not a get a refund! Please ensure that your account is public before ordering.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><h5 style=\"margin-bottom: 0px;\">3. Refund Policy</h5><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">No refunds will be made to your payment method. After a deposit has been completed, there is no way to reverse it. You must use your balance on orders from “Puffx Smm Panel”.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">You agree that once you complete a payment, you will not file a dispute or a chargeback against us for any reason.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">If you file a dispute or charge-back against us after a deposit, we reserve the right to terminate all future orders, ban you from our site. We also reserve the right to take away any followers or likes we delivered to your or your clients Instagram/Facebook/Twitter or other social media account.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Orders placed in “Puffx Smm Panel” will not be refunded or canceled after they are placed. You will receive a refund credit to your “Puffx Smm Panel” account if the order is nondeliverable</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Misplaced or Private account orders will not qualify for a refund. Be sure to confirm each and every order before placing it.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Fraudulent activity such as using unauthorized or stolen credit cards will lead to the termination of your account. There are no exceptions.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Please do not use more than one server at the same time for the same page. We cannot give you the correct followers/likes number in that case. We will not refund for these orders.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><h5 style=\"margin-bottom: 0px;\">4. Privacy Policy</h5><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">This policy covers how we use your personal information. We take your privacy seriously and will take all measures to protect your personal information.</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\">Any personal information received will only be used to fill your order. We will not sell or redistribute your information to anyone. All information is encrypted and saved in secure servers</p><p open=\"\" sans\",=\"\" sans-serif;=\"\" background-color:=\"\" rgb(55,=\"\" 53,=\"\" 57);\"=\"\" style=\"margin-bottom: 0px;\"><br></p></div>'),
(7, 'FAQ', 'faq', '<h4 style=\"text-align: center;\">Any Problem Ask Me&nbsp;</h4><div style=\"text-align: center;\"><br></div><h5 style=\"text-align: center;\">WhatsApp</h5><div style=\"text-align: center;\"><a href=\"https://api.whatsapp.com/send?phone=19177900804&amp;text=Hello%20sir%20\" target=\"_blank\">Contact</a>&nbsp;</div><div style=\"text-align: center;\"><br></div><h5 style=\"text-align: center;\">Instagram&nbsp;</h5><div style=\"text-align: center;\"><a href=\"https://instagram.com/puffxsmmpanel?igshid=YmMyMTA2M2Y=\" target=\"_blank\">Follow</a>&nbsp;</div><div style=\"text-align: center;\"><br></div><h5 style=\"text-align: center;\">Calling Number&nbsp;</h5><div style=\"text-align: center;\">+91 7746067573</div><div style=\"text-align: center;\"><br></div><h5 style=\"text-align: center;\">Download Apk</h5><div style=\"text-align: center; \"><a href=\"https://puffxsmmpanel.in/puffxsmmpanel.apk\" target=\"_blank\">Download</a>&nbsp;</div>'),
(10, 'Child Panel', 'child-panels', '<div class=\"alert alert-danger\" role=\"alert\">\r\n  </div>');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `client_balance` double NOT NULL DEFAULT 0,
  `payment_amount` double NOT NULL DEFAULT 0,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL DEFAULT -1,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` text DEFAULT NULL,
  `payment_mode` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_ip` varchar(225) DEFAULT NULL,
  `payment_extra` text DEFAULT NULL,
  `payment_bank` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`) VALUES
(1, 175, 0, 100, NULL, 15, '1', '1', NULL, 'Otomatik', '2021-06-14 12:38:19', '2021-06-14 12:38:19', '157.37.155.193', '1623654499', 0),
(2, 175, 0, 100, NULL, 13, '1', '1', NULL, 'Otomatik', '2021-06-14 12:38:43', '2021-06-14 12:38:43', '157.37.155.193', 'ec823bbbd6506cf8e809e7941c2647fc', 0),
(3, 175, 0, 100, NULL, 15, '1', '1', NULL, 'Otomatik', '2021-06-21 13:37:17', '2021-06-21 13:37:17', '157.37.168.140', '1624262837', 0),
(4, 184, 0, 10, NULL, 14, '3', '2', NULL, 'Otomatik', '2021-10-29 17:02:47', '2021-10-29 09:02:47', '2401:4900:5450:8932::82f:9337, 172.69.71.128', '202110291931440053', 0),
(5, 186, 0, 10, NULL, 12, '1', '1', NULL, 'Otomatik', '2021-10-31 13:03:55', '2021-10-31 04:03:55', '2401:4900:c8a:87eb:7033:9357:c30b:e1f2, 108.162.221.192', 'ORDS86837190', 0),
(6, 186, 0, 10, NULL, 12, '1', '1', NULL, 'Otomatik', '2021-10-31 13:04:26', '2021-10-31 04:04:26', '2401:4900:c8a:87eb:7033:9357:c30b:e1f2, 108.162.221.192', 'ORDS9840370', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`) VALUES
(1, 'Paypal', 'paypal', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Paypal\",\"min\":\"1\",\"max\":\"0\",\"client_id\":\"dfsdffsfsdfdsfsdfsdfs\",\"client_secret\":\"sdasdadada4cqKLXaNZh1ruiAEmqynjwUuV7moFI6D4Y8JQiF6lv30cJXPvbDZtov3hBBg\",\"fee\":\"10\"}', 4),
(12, 'PayTM', 'paytm', 1, 10000, '1', '{\"method_type\":\"2\",\"name\":\"PayTM\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"\",\"merchant_mid\":\"\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 1),
(13, 'RazorPay', 'razorpay', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"public_key\":\"rzp_test_i2FFGuIEvPDig7\",\"key_secret\":\"djBffjsBkWHWjSbCoNRGIg60\",\"merchant_website\":\"https:\\/\\/api.razorpay.com\\/v1\\/orders\",\"fee\":\"0\"}', 3),
(14, 'PayTM QR', 'paytmqr', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"PayTMQR\",\"min\":\"1\",\"max\":\"0\",\"merchant_key\":\"\\/img\\/Puffxpaytmqr.jpg\",\"merchant_mid\":\"EkNBXQ43692759613250\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 2),
(15, 'Perfect Money', 'perfectmoney', 0, 10000, '1', '{\"method_type\":\"2\",\"name\":\"Perfect Money\",\"min\":\"0\",\"max\":\"10000\",\"passphrase\":\"B8h3EV2OG52mkXxVWZWXOKuot\",\"usd\":\"U27083432\",\"merchant_website\":\"FinalSmmPanel\",\"fee\":\"0\"}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text DEFAULT NULL,
  `service_price` double NOT NULL DEFAULT 0,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` text DEFAULT NULL,
  `description_lang` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`) VALUES
(1, 0, 0, '2', '', 1, 1, '2', '1', 'faizullah', '', 0, 50, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '\"faizullah\"', NULL),
(2, 1, 4623, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"22.0284\",\"currency\":\"INR\"}', 2, 1, '2', '1', '🎉 Instagram Followers // Real HQ Account // 10k Day Speed ✈️ //  Lifetime Refill ', NULL, 24.23124, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(3, 1, 4624, '2', '{\"min\":\"50\",\"max\":\"15000\",\"rate\":\"463.5159552\",\"currency\":\"INR\"}', 2, 1, '2', '1', '🎉 YouTube Subscribers // 100-200/day // Non Drop // 30 days Refill // Fast start ', NULL, 509.86755072, 50, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(4, 1, 4625, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"0.0679296\",\"currency\":\"INR\"}', 2, 1, '2', '1', '🎉 Instagram Reel Views // Super Fast //  Cheapest Service In The Market', NULL, 0.07472256, 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(5, 1, 4626, '2', '{\"min\":\"1000\",\"max\":\"50000000\",\"rate\":\"0.09164\",\"currency\":\"INR\"}', 3, 1, '2', '1', '🥶 Instagram views 👀 // Super Fast 🚀 //  20M DAY // Works for REEL/IGTV/VIDEO ', NULL, 0.100804, 1000, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(6, 1, 4627, '2', '{\"min\":\"2000\",\"max\":\"50000000\",\"rate\":\"0.081084\",\"currency\":\"INR\"}', 3, 1, '2', '1', '🥶 Instagram Reels Views // FAST // 10M Day // Limited Time  ', NULL, 0.0891924, 2000, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(7, 1, 4628, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"26.6684\",\"currency\":\"INR\"}', 4, 1, '2', '1', 'Instagram Followers //  REAL OLD ACCOUNT 😍 // Never Drop // LIFETIME Refill // 100K Day', NULL, 29.33524, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(8, 1, 4629, '2', '{\"min\":\"60\",\"max\":\"500000\",\"rate\":\"25.5084\",\"currency\":\"INR\"}', 4, 1, '2', '1', 'Instagram Followers // OLD ACCOUNT 😍 // Naver Drop // 365 Day Refill // 50K Day ', NULL, 28.05924, 60, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(9, 1, 4630, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"23.1884\",\"currency\":\"INR\"}', 4, 1, '2', '1', 'Instagram Followers // 😍 Super Real // Lifetime Refill // 10K Day✈️ //Full Non Drop ♻️', NULL, 25.50724, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(10, 1, 4631, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"799.008\",\"currency\":\"INR\"}', 5, 1, '2', '1', '🔸 Youtube Subscribe // 20k/day // Full Non Drop // 30 days Guarantee // SUPER FAST ', NULL, 878.9088, 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(11, 1, 4632, '2', '{\"min\":\"50\",\"max\":\"15000\",\"rate\":\"486.04\",\"currency\":\"INR\"}', 5, 1, '2', '1', '🔸YouTube Subscribers // 500/day // Fast Start // 30 Days Refill // Non Drop', NULL, 534.644, 50, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(12, 1, 4633, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"680.108\",\"currency\":\"INR\"}', 5, 1, '2', '1', '🔸 Youtube Subscribe // 10k/day // 30 days Guarantee // SUPER FAST ', NULL, 748.1188, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(13, 1, 4634, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"462.84\",\"currency\":\"INR\"}', 5, 1, '2', '1', '🔸Youtube Subs // 100-200 day speed // Non Drop // 30 days refill ', NULL, 509.124, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(14, 1, 4635, '2', '{\"min\":\"1000000\",\"max\":\"10000000\",\"rate\":\"46.218808\",\"currency\":\"INR\"}', 5, 1, '2', '1', '🔸Youtube Adwords Views // Full Non Drop // 24hr Complete ', NULL, 50.8406888, 1000000, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(15, 1, 4636, '2', '{\"min\":\"100\",\"max\":\"200000\",\"rate\":\"27.8284\",\"currency\":\"INR\"}', 6, 1, '2', '1', '☀️ Instagram Followers // Old Accounts  // Super Stable // 365 Day Refill ♻️ // 50K Day // No stuck Issue 😍 ', NULL, 30.61124, 100, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(16, 1, 4637, '2', '{\"min\":\"70\",\"max\":\"800000\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 7, 1, '2', '1', '✈️✈️  Instagram Followers // Super Real ✨ Premium Old Account Followers 😍 // Lifetime Auto Refill ♻️ // 0% Drop 💧// 500k Day ✈️✈️', NULL, 49.764, 70, 800000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(17, 1, 4638, '2', '{\"min\":\"100\",\"max\":\"250000\",\"rate\":\"34.5216\",\"currency\":\"INR\"}', 7, 1, '2', '1', ' ✈️✈️ Instagram Followers // 0% Drop💧// Super Real ♥️ Old Accounts // Super Instant // One Click Start 🚀 // Lifetime Refill ♻️ ', NULL, 37.97376, 100, 250000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(18, 1, 4639, '2', '{\"min\":\"100\",\"max\":\"1500000\",\"rate\":\"26.6684\",\"currency\":\"INR\"}', 8, 1, '2', '1', '🛍️ Instagram Followers // old account // Non Drop 💧 //  Lifetime Guranteed // Fast Delivery 🚚 // 10% Extra', NULL, 29.33524, 100, 1500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(19, 1, 4640, '2', '{\"min\":\"61\",\"max\":\"2000000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 8, 1, '2', '1', '🛍️ Instagram Followers // 😍Old Account // 0% Drop 💧// Instant Start // 200K/300K Per Day 🚀 // Market King 👑 Sevice ', NULL, 30.624, 61, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(20, 1, 4641, '2', '{\"min\":\"150\",\"max\":\"200000\",\"rate\":\"23.1884\",\"currency\":\"INR\"}', 8, 1, '2', '1', '🛍️ Instagram Followers // Real Accounts 😍// Non Drop // Instant Start // 365 Day // 50k Day 🚀 ', NULL, 25.50724, 150, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(21, 1, 4644, '2', '{\"min\":\"100\",\"max\":\"600000\",\"rate\":\"24.128\",\"currency\":\"INR\"}', 9, 1, '2', '1', '🔥 Instagram Followers // HQ Accounts 😍 // Refill 365 Days // 5k Per Hour 🚀// Non Drop💧', NULL, 26.5408, 100, 600000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(22, 1, 4645, '2', '{\"min\":\"50\",\"max\":\"90000\",\"rate\":\"25.056\",\"currency\":\"INR\"}', 9, 1, '2', '1', '🔥 Instagram Followers // SUPER REAL 😍 // Refill 365 Days // 6/8K per Hour 🚀 // FAST 🚀', NULL, 27.5616, 50, 90000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(23, 1, 4646, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"25.984\",\"currency\":\"INR\"}', 9, 1, '2', '1', '🔥 Instagram Followers // 1 Year Warranty ♻️ // Old Account // Instant Start 🚀// Fastest Sevices in All market', NULL, 28.5824, 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(24, 1, 4643, '2', '{\"min\":\"150\",\"max\":\"500000\",\"rate\":\"23.2\",\"currency\":\"INR\"}', 9, 1, '2', '1', '🔥 Instagram Followers // Real Quality 😍 // Refill 365 Days ♻️ // 2/5K per Hour 🚀 // Non Drop 💧', NULL, 25.52, 150, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(25, 1, 4647, '2', '{\"min\":\"100\",\"max\":\"1500000\",\"rate\":\"27.8284\",\"currency\":\"INR\"}', 10, 1, '2', '1', '❤️ Instagram Followers // Lifetime REFILL ♻️ // 100k/DAY 🚀// 10% Extra // STABLE💧// Instant 🚀', NULL, 30.61124, 100, 1500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(26, 1, 4648, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"26.6684\",\"currency\":\"INR\"}', 10, 1, '2', '1', '❤️ Instagram Followers // Lifetime Reffll ♻️// 50k/DAY🚀// ❣️ High Quality😍//  STABLE💧', NULL, 29.33524, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(27, 1, 4649, '2', '{\"min\":\"100\",\"max\":\"2000000\",\"rate\":\"28.9884\",\"currency\":\"INR\"}', 10, 1, '2', '1', '❤️ Instagram Followers // Lifetime REFILL♻️// 300k/DAY // ❣️ Super High Quality 😍 // Ultra STABLE 💧 // Fastest Sevice 🚚', NULL, 31.88724, 100, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(28, 1, 4650, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"28.9884\",\"currency\":\"INR\"}', 11, 1, '2', '1', '💯 Instagram Follower // 😍100% Non Drop // Refill 1 Year ♻️ // Old Accounts // 100K Per Day 🚀 ', NULL, 31.88724, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(29, 1, 4651, '2', '{\"min\":\"51\",\"max\":\"2000000\",\"rate\":\"30.1484\",\"currency\":\"INR\"}', 11, 1, '2', '1', '💯 Instagram SUPER Real 😍 Follower // 100% Non Drop // Refill Lifetime ♻️ // Old Accounts // 100K Per Day 🚀// Ultra Instant 🚀', NULL, 33.16324, 51, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(30, 1, 4652, '2', '{\"min\":\"100\",\"max\":\"2000000\",\"rate\":\"31.3084\",\"currency\":\"INR\"}', 11, 1, '2', '1', '💯 Instagram Follower // Super Real 25+Post\'s Followers accounts // 100% Non Drop // Refill Lifetime ♻️ // 200K Per Day 🚀', NULL, 34.43924, 100, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(31, 1, 4655, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"34.7884\",\"currency\":\"INR\"}', 12, 1, '2', '1', '💫 Instagram Followers // 3/5 Year Old Accounts 🥰 // 200k/Day // 0% Drop ✔️ // Lifetime Refill ♻️', NULL, 38.26724, 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(32, 1, 4653, '2', '{\"min\":\"100\",\"max\":\"3000000\",\"rate\":\"30.0208\",\"currency\":\"INR\"}', 12, 1, '2', '1', '💫 Instagram Followers  // 15+ Post\'s Old accounts 😍 // Refill 5 Year\'s // 0% Drop // 50k/day ✈️', NULL, 33.02288, 100, 3000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(33, 1, 4654, '2', '{\"min\":\"50\",\"max\":\"4000000\",\"rate\":\"32.4684\",\"currency\":\"INR\"}', 12, 1, '2', '1', '💫 Instagram Followers // 2/3 Years Old accounts 😍 // Lifetime Refill ♻️ // 0% Drop 💧// 200k/day 🚀', NULL, 35.71524, 50, 4000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(34, 1, 4656, '2', '{\"min\":\"20\",\"max\":\"1500000\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 13, 1, '2', '1', '😍 Instagram REAL 😍 Follower // Premium Qulity ❤️ // Ultra stable // Refill Lifetime ♻️ // One Click Start  🚀🚀', NULL, 49.764, 20, 1500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(35, 1, 4657, '2', '{\"min\":\"100\",\"max\":\"2000000\",\"rate\":\"51.04\",\"currency\":\"INR\"}', 13, 1, '2', '1', '😍 Instagram Real 😍 Follower // 💫 Premium Sevice 🥰// Ultra stable // Refill Lifetime ♻️ // 10K in 10 minutes 🚀🚀', NULL, 56.144, 100, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(36, 1, 4658, '2', '{\"min\":\"50\",\"max\":\"250000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 13, 1, '2', '1', '😍 Instagram Followers // 💫 Premium Old Account 😍 // Non-Drop 😁 Lifetime Refill ♻️ // 100K-200K /Day 🚀 // Instant Start🚀', NULL, 43.384, 50, 250000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(37, 1, 4659, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"56.84\",\"currency\":\"INR\"}', 13, 1, '2', '1', '😍 Instagram Real ADS 😍 Follower // Super Real ♥️ Accounts // Ultra stable // 🔁 Automatically Refill Lifetime ♻️ // 50K in 30 minutes ✈️', NULL, 62.524, 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(38, 1, 4660, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"80.04\",\"currency\":\"INR\"}', 14, 1, '2', '1', '💕 Instagram Followers // Worldwide //💕 Super Real And Action Account with Story 💕// Ultra Stable // 30 Day Refill // 50k Per Day 🚀', NULL, 88.044, 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(39, 1, 4661, '2', '{\"min\":\"10\",\"max\":\"200000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 14, 1, '2', '1', '💕 Instagram Followers // Real And 🔐Privet Account 😍 // 30 Day Refill ♻️ // 20K Day 🚀', NULL, 75.284, 10, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(40, 1, 4662, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 14, 1, '2', '1', '💕 Instagram Followers // Almost 0% Drop 💧 //💕 Super Real And Action Account with 80%+Story 💕 + Reels // Fast 🚀 // 60 Day Refill // 50k Per Day 🚀', NULL, 113.564, 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(41, 1, 4663, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"12.7484\",\"currency\":\"INR\"}', 15, 1, '2', '1', '♻️ Instagram Followers // HQ 😍 // Refill 30 days // 10k/day // Fast 🚀', NULL, 14.02324, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(42, 1, 4664, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"11.5884\",\"currency\":\"INR\"}', 15, 1, '2', '1', '♻️ Instagram Followers // 10 Day Refill ♻️ // Good Speed 🚀', NULL, 12.74724, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(43, 1, 4665, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"13.9084\",\"currency\":\"INR\"}', 15, 1, '2', '1', '♻️ Instagram Followers // Real HQ 😍 // 20K Per Day // 30 Day Refill ♻️ // Fast Delivery 🚚', NULL, 15.29924, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(44, 1, 4666, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"15.0684\",\"currency\":\"INR\"}', 15, 1, '2', '1', '♻️ Instagram Followers // Real HQ 😍 // 30K Per Day // 30 Day Refill ♻️ // Fast Delivery 🚚', NULL, 16.57524, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(45, 1, 4667, '2', '{\"min\":\"100\",\"max\":\"60000\",\"rate\":\"10.0804\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // super Good Qulity ❤️// 100k Day 🚀 // Low drop // Fastest Delivery 🚚', NULL, 11.08844, 100, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(46, 1, 4676, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"8.1084\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // HQ ❤️ // 50K Day // Fast Speed 🚀', NULL, 8.91924, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(47, 1, 4675, '2', '{\"min\":\"20\",\"max\":\"2000\",\"rate\":\"15.03708\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // 0-15 Minutes // Old Account 😍 //Superfast // low drop', NULL, 16.540788, 20, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(48, 1, 4674, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"7.259512\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // Bots // Super Good ❤️ // 20K Day // Super Fast 🚀', NULL, 7.9854632, 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(49, 1, 4671, '2', '{\"min\":\"100\",\"max\":\"150000\",\"rate\":\"12.528\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 INSTAGRAM 😍 Super REAL Followers 🤩 // Low Drop💧 // Fastest 🚀', NULL, 13.7808, 100, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(50, 1, 4673, '2', '{\"min\":\"100\",\"max\":\"2000\",\"rate\":\"6.34636\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram - Followers | Cheapest In The Market // Super Fast 🚀 // Sever - 1', NULL, 6.980996, 100, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(51, 1, 4672, '2', '{\"min\":\"10\",\"max\":\"160000\",\"rate\":\"14.8016\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // 15  Posts Profile 😍 // Old Account ❤️ // 100K Per Day 🚀', NULL, 16.28176, 10, 160000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(52, 1, 4668, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"11.5072\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // Old Accounts😁 // Low Drop 💧 // Ulta FASTER 🚀', NULL, 12.65792, 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(53, 1, 4669, '2', '{\"min\":\"100\",\"max\":\"48000\",\"rate\":\"7.716088\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Followers // Good Qulity 😍 // Fast Start 🚀 // 80K Day 🚀// Ultra Instant', NULL, 8.4876968, 100, 48000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(54, 1, 4670, '2', '{\"min\":\"100\",\"max\":\"20000\",\"rate\":\"9.1524\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 INSTAGRAM Followers // Real Qulity ❤️ // Ultra Fast 🚀 // Low Drop 💧 // One Click Done ', NULL, 10.06764, 100, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(55, 1, 4677, '2', '{\"min\":\"100\",\"max\":\"2500\",\"rate\":\"6.802936\",\"currency\":\"INR\"}', 16, 1, '2', '1', '💤 Instagram Bot Followers // Good Qulity // Fast Speed 🚀 // Best For demo ', NULL, 7.4832296, 100, 2500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(56, 1, 4678, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"5.7884\",\"currency\":\"INR\"}', 16, 1, '2', '1', ' 💤 Instagram Bot Followers // Fastest Speed 🚀 ', NULL, 6.36724, 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(57, 1, 4679, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"172.84\",\"currency\":\"INR\"}', 17, 1, '2', '2', '☑️ 1 Bluetick Verified Celebrity 🎥 Follower - [ Delivery : 1-12 Hours ]', NULL, 190.124, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(58, 1, 4680, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 17, 1, '2', '2', '☑️  𝘐𝘕𝘚𝘛𝘈𝘎𝘙𝘈𝘔 𝘍𝘖𝘓𝘓𝘖𝘞𝘌𝘙 || FROM VERIFIED ACCOUNT ✔️ ||  1 FOLLOWER PACKAGE ||', NULL, 113.564, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(59, 1, 4681, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"184.44\",\"currency\":\"INR\"}', 17, 1, '2', '2', '☑️  𝘐𝘕𝘚𝘛𝘈𝘎𝘙𝘈𝘔 𝘍𝘖𝘓𝘓𝘖𝘞𝘌𝘙 || FROM VERIFIED ACCOUNT ✔️ ||  2 FOLLOWER PACKAGE ||', NULL, 202.884, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(60, 1, 4682, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"288.84\",\"currency\":\"INR\"}', 17, 1, '2', '2', '☑️  𝘐𝘕𝘚𝘛𝘈𝘎𝘙𝘈𝘔 𝘍𝘖𝘓𝘓𝘖𝘞𝘌𝘙 || FROM VERIFIED ACCOUNT ✔️ || 3 FOLLOWER PACKAGE ||', NULL, 317.724, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(61, 1, 4683, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"33.64\",\"currency\":\"INR\"}', 18, 1, '2', '2', '☑️ INSTAGRAM : VARIFIED [ BLUE TICK ✔️ ] LIKE 👍 || 1~5 LIKE || 😍', NULL, 37.004, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(62, 1, 4689, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"8.1084\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram Like👍 Indian 🇮🇳 // Best Indian Likes 😍 // 50K/Day // Fast🚀 ', NULL, 8.91924, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(63, 1, 4690, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"10.4284\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram Likes 👍 // PURE INDIAN 🇮🇳 // 70/80% Story Account 😍 // FAST and Real // 50k Speed Day 🚀 // Lifetime Refill ♻️', NULL, 11.47124, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(64, 1, 4687, '2', '{\"min\":\"100\",\"max\":\"150000\",\"rate\":\"16.24\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram REAL 🇮🇳 INDIAN Likes 👍 // Story+ DP + Name Account 😍// 50K/Day // Instant // Lifetime Reffill ♻️', NULL, 17.864, 100, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(65, 1, 4688, '2', '{\"min\":\"20\",\"max\":\"30000\",\"rate\":\"9.8484\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram Like 👍 // Female👱‍♀️Indian 🇮🇳 Accounts // 50K Per Day // SuperFast🚀 // Lifetime Refill ♻️', NULL, 10.83324, 20, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(66, 1, 4685, '2', '{\"min\":\"10\",\"max\":\"200000\",\"rate\":\"4.0368\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram Likes 👍 Indian 🇮🇳 Mix // Indian 🇮🇳 Qulity // No Refill ', NULL, 4.44048, 10, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(67, 1, 4686, '2', '{\"min\":\"100\",\"max\":\"120000\",\"rate\":\"13.9084\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram Likes INDIAN 🇮🇳 // Super Real Story✔ Old User\'s 😍 // Lifetime Refill ♻️', NULL, 15.29924, 100, 120000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(68, 1, 4684, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"8.1084\",\"currency\":\"INR\"}', 19, 1, '2', '1', '🇮🇳 Instagram Like 👍 // Real Story Indian 🇮🇳 Accounts // 50K Day // Fastest Delivery 🚚 ', NULL, 8.91924, 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(69, 1, 4691, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"52.0608\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Primeum 💫 Instagram Pure 𝐈𝐧𝐝𝐢𝐚𝐧 Followers // Superfast🚀 // 100% Non Drop 💧//🔥 Recommended ', NULL, 57.26688, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(70, 1, 4692, '2', '{\"min\":\"100\",\"max\":\"400000\",\"rate\":\"48.59008\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Followers // 100% 🇮🇳 Indian Super Real Account 😍 // NON DROP💧// FAST // LIFETIME REFILL', NULL, 53.449088, 100, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(71, 1, 4693, '2', '{\"min\":\"100\",\"max\":\"200000\",\"rate\":\"33.7792\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Real Indian Followers // 50K/Day 🚀 // Real 🇮🇳 Indian // Instant // Non Drop ♻️ // Refill Lifetime', NULL, 37.15712, 100, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(72, 1, 4694, '2', '{\"min\":\"20\",\"max\":\"1000\",\"rate\":\"13.3632\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Followers // REAL INDIAN 🇮🇳 // 💖 Real // 10k Speed Day // Good speed', NULL, 14.69952, 20, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(73, 1, 4695, '2', '{\"min\":\"20\",\"max\":\"100000\",\"rate\":\"26.5408\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Indian Followers // 20K Day 🇮🇳 // 80%+ 🇮🇳Indian // Non Drop // 365 Day Refill ♻️', NULL, 29.19488, 20, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(74, 1, 4696, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"44.772288\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram All 🇮🇳 Indian Followers // Full Non Drop // INSTANT // LIFETIME GUARANTEE', NULL, 49.2495168, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(75, 1, 4697, '2', '{\"min\":\"20\",\"max\":\"50000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Followers Real 80% Indian // 10K Day // Instant ', NULL, 24.244, 20, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(76, 1, 4698, '2', '{\"min\":\"20\",\"max\":\"2000\",\"rate\":\"15.6832\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Real Followers // HQ // Indian Majority', NULL, 17.25152, 20, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(77, 1, 4699, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"20.8684\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Followers Real Indian  // Some Stories account // 10K Per Day // Instant ', NULL, 22.95524, 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(78, 1, 4700, '2', '{\"min\":\"70\",\"max\":\"5000000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Followers 🤩 // 100% INDIAN // 🤩 // INSTANT START // 30 Days Refill', NULL, 30.624, 70, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(79, 1, 4701, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram Followers Real Indian Majority // Refill 30 Day Button // Instant ', NULL, 30.624, 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(80, 1, 4702, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"146.16\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 100% PURE INDIAN FOLLOWERS // NON DROP // Lifetime Gurantee ♻️ // Full Indian 🇮🇳  ', NULL, 160.776, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(81, 1, 4703, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"172.26\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 Instagram 101% Real And Active Indian 🇮🇳 Followers // 101% Satisfaction // ✨ Premium Qulity ❤️', NULL, 189.486, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(82, 1, 4704, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"156.6\",\"currency\":\"INR\"}', 20, 1, '2', '1', '🇮🇳 100% REAL INDIAN FOLLOWERS // NON DROP // Lifetime Gurantee ♻️ // King Qulity Indian 🇮🇳 Followers  ', NULL, 172.26, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(83, 1, 4705, '2', '{\"min\":\"5\",\"max\":\"200000\",\"rate\":\"75.4\",\"currency\":\"INR\"}', 21, 1, '2', '1', '🇮🇳 Instagram India Random Comments 💌 // Fast Service // Non Drop', NULL, 82.94, 5, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(84, 1, 4706, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"75.4\",\"currency\":\"INR\"}', 21, 1, '2', '3', '🇮🇳 Instagram India || Custom ✍️ || Comments 💌 // 10K Daily Speed', NULL, 82.94, 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(85, 1, 4707, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 21, 1, '2', '1', '🇮🇳 Instagram Random Comments 💌 // High Quality // 95% Indian 🇮🇳 Comments // Natural Speed 🚀', NULL, 113.564, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(86, 1, 4708, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 21, 1, '2', '1', '🇮🇳 Instagram Custom ✍️ Comments 💌 // High Quality // 95% Indian 🇮🇳 Comments // Fast 🚀', NULL, 113.564, 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(87, 1, 4709, '2', '{\"min\":\"100\",\"max\":\"60000\",\"rate\":\"3.754224\",\"currency\":\"INR\"}', 22, 1, '2', '1', '👍 Instagram Likes // 100K+ Day 🚀 // HQ Qulity ❤️ // Fastest ✈️ Sever - 2', NULL, 4.1296464, 100, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(88, 1, 4710, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"3.4684\",\"currency\":\"INR\"}', 22, 1, '2', '1', '👍 Instagram Likes // HQ ❤️ // 5K in 1 Hour\'s  🚀 // Non Drop ♻️ // Instant // Fastest Delivery 🚚', NULL, 3.81524, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(89, 1, 4711, '2', '{\"min\":\"50\",\"max\":\"150000\",\"rate\":\"4.118\",\"currency\":\"INR\"}', 22, 1, '2', '1', '👍 Instagram Likes REAL 😍 // 10k/Hour 🚀 // Non Drop ♻️ // Instant // Super Faster 🚀', NULL, 4.5298, 50, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(90, 1, 4712, '2', '{\"min\":\"100\",\"max\":\"70000\",\"rate\":\"4.3355\",\"currency\":\"INR\"}', 22, 1, '2', '1', '👍 Instagram Likes // 200K Day🚀 // Real HQ 😍 // Instant', NULL, 4.76905, 100, 70000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(91, 1, 4713, '2', '{\"min\":\"50\",\"max\":\"350000\",\"rate\":\"4.6284\",\"currency\":\"INR\"}', 22, 1, '2', '1', '👍 Instagram  Likes  // INDIAN🇮🇳Mix // High Quality // No Drop // 10k in 1 Hour\'s // Instant ', NULL, 5.09124, 50, 350000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(92, 1, 4714, '2', '{\"min\":\"500\",\"max\":\"50000\",\"rate\":\"3.390912\",\"currency\":\"INR\"}', 22, 1, '2', '1', '👍 Instagram Likes // Real ❤️ // 100k Day 🚀 // Fast Speed 🚀 Sever -1', NULL, 3.7300032, 500, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(93, 1, 4715, '2', '{\"min\":\"50\",\"max\":\"200000\",\"rate\":\"3.567\",\"currency\":\"INR\"}', 23, 1, '2', '1', '👍✈️ Instagram Likes 👍 // 5k/Hour // Super Fast Server // 0% Drop ♻️', NULL, 3.9237, 50, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(94, 1, 4716, '2', '{\"min\":\"100\",\"max\":\"300000\",\"rate\":\"4.0426\",\"currency\":\"INR\"}', 23, 1, '2', '1', '👍✈️ Instagram Likes 👍 // 7k/Hour // Always Instant Service // Full Non Drop ♻️ // 60 Day Refill ♻️', NULL, 4.44686, 100, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(95, 1, 4717, '2', '{\"min\":\"100\",\"max\":\"400000\",\"rate\":\"5.7884\",\"currency\":\"INR\"}', 23, 1, '2', '1', '👍✈️ Instagram Likes 👍 // 30k/Hour // Ultra High Speed //  Full Non Drop ♻️ // 365 Day Refill ♻️', NULL, 6.36724, 100, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(96, 1, 4718, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"6.9484\",\"currency\":\"INR\"}', 23, 1, '2', '1', '👍✈️ Instagram Likes 👍 // 50k/Hour // SUPER Ultra High Speed✈️ // Real 😍HQ // Full Non Drop ♻️ // Lifetime Refill ♻️', NULL, 7.64324, 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(97, 1, 4719, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"3.4684\",\"currency\":\"INR\"}', 23, 1, '2', '1', '👍✈️  Instagram LIKES  // 5K Hour 🚀 // Full Non Drop 💧 // Fastest Delivery 🚚', NULL, 3.81524, 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(98, 1, 4720, '2', '{\"min\":\"10\",\"max\":\"400000\",\"rate\":\"7.656\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // Premium qulity 😍 // Instant // 1M Day 🚀 𝐋𝐢𝐟𝐞𝐭𝐢𝐦𝐞 𝐑𝐞𝐟𝐢𝐥𝐥♻️ // 0% Drop ', NULL, 8.4216, 10, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(99, 1, 4721, '2', '{\"min\":\"100\",\"max\":\"25000\",\"rate\":\"3.64994\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // 10k/Hour // Non Drop // Lifetime Refill ♻️', NULL, 4.014934, 100, 25000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(100, 1, 4722, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"4.02752\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes //Real HQ ❤️// Instant // 15k/Hour // No Drop // Lifetime Refill ♻️', NULL, 4.430272, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(101, 1, 4723, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"4.53096\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // Super Real 😍 // Instant // 20k/Hour // No Drop // Lifetime Refill ♻️', NULL, 4.984056, 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(102, 1, 4724, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"5.742\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // Super Real HQ 😍 // 300K Day 🚀 // Instant // 𝐋𝐢𝐟𝐞𝐭𝐢𝐦𝐞 𝐑𝐞𝐟𝐢𝐥𝐥 ♻️ // 0% Drop 🔥 ', NULL, 6.3162, 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(103, 1, 4725, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"6.8585\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // SUPER REAL 😍 // Instant // 700K Day 🚀 // 𝐋𝐢𝐟𝐞𝐭𝐢𝐦𝐞 𝐑𝐞𝐟𝐢𝐥𝐥 ♻️ // 0% Drop ', NULL, 7.54435, 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(104, 1, 4726, '2', '{\"min\":\"10\",\"max\":\"200000\",\"rate\":\"5.104\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes 👍 // Ultra❤️ High Quality // Fully Non Drop 💦 // Lifetime Refill ♻️ // 200K Hour 🚀// Instant Start 🚀', NULL, 5.6144, 10, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(105, 1, 4727, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"6.2205\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // Super Real HQ 😍 // 500K Day 🚀 // Ultra Instant // 𝐋𝐢𝐟𝐞𝐭𝐢𝐦𝐞 𝐑𝐞𝐟𝐢𝐥𝐥 ♻️ // 0% Drop 🔥 ', NULL, 6.84255, 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(106, 1, 4728, '2', '{\"min\":\"100\",\"max\":\"20000\",\"rate\":\"2.825064\",\"currency\":\"INR\"}', 24, 1, '2', '1', '👍♻️ Instagram Likes // 5K Hour // Fastest Delivery 🚚 // Lifetime Reffill ♻️', NULL, 3.1075704, 100, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(107, 1, 4729, '2', '{\"min\":\"20\",\"max\":\"100000\",\"rate\":\"13.92\",\"currency\":\"INR\"}', 25, 1, '2', '1', '💫 Instagram Likes 👍// Premium // Real Stories Accounts 🙀 // No Drop 💧 // 10K /Day 🚀', NULL, 15.312, 20, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(108, 1, 4730, '2', '{\"min\":\"100\",\"max\":\"4000000\",\"rate\":\"0.3944\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Views 👀 // 10M Per Day 🚀 // Ultra Fast 🚀 // One Click Done❤️', NULL, 0.43384, 100, 4000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(109, 1, 4731, '2', '{\"min\":\"100\",\"max\":\"50000000\",\"rate\":\"0.4524\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Views // 10M+ Day 🚀 // Instant // Fastest Delivery 🚚 // Recommended // Lifetime Refill❤️', NULL, 0.49764, 100, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(110, 1, 4732, '2', '{\"min\":\"500\",\"max\":\"1000000\",\"rate\":\"0.10324\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀  Instagram Views 👀 // Reels //  Best Sevices ❤️ // Fast Delivery 🚚', NULL, 0.113564, 500, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(111, 1, 4733, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"0.5684\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀  Instagram Views  Tv  / Reels // 100% indian 🇮🇳 // Ultra Instant 🚀// Fast Delivery 🚚 // 5M Day 🚀', NULL, 0.62524, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(112, 1, 4734, '2', '{\"min\":\"200\",\"max\":\"2000000\",\"rate\":\"0.1392\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Viwes // Fastest Speed 🚅 // Working Fast 🚀', NULL, 0.15312, 200, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(113, 1, 4735, '2', '{\"min\":\"200\",\"max\":\"3000000\",\"rate\":\"0.1856\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Views // 2M Day 🚀 // Fastest 🚀 // Good Speed 🚀', NULL, 0.20416, 200, 3000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(114, 1, 4736, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"0.3364\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Views Tv | Reels // 5/6M Day 🚀 // fastest Sever 🚀 // one click start', NULL, 0.37004, 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(115, 1, 4737, '2', '{\"min\":\"100\",\"max\":\"300000000\",\"rate\":\"0.3016\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Reels / Video / Tv View 👀 // 500K Hour\'s🚀 // Ultra Fast 🚀 // No Stuck Issue 😁', NULL, 0.33176, 100, 300000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(116, 1, 4738, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"0.2204\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Reel Views 👀 // 5M Per Day 🚀 // Own Sever 😁 // Ultra Fast 🚀', NULL, 0.24244, 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(117, 1, 4739, '2', '{\"min\":\"50\",\"max\":\"200000000\",\"rate\":\"0.2552\",\"currency\":\"INR\"}', 26, 1, '2', '1', '👀 Instagram Reels View 👀 // Super Fast 🚀 // Instant // No Stuck Issue 😍', NULL, 0.28072, 50, 200000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(118, 1, 4740, '2', '{\"min\":\"30\",\"max\":\"100000000\",\"rate\":\"1.7284\",\"currency\":\"INR\"}', 27, 1, '2', '1', '👀 Instagram Video / Reels/ IGTV Views 👀 // Instant 🚀// 10M Per Day ✈️  // Lifetime Refill ♻️ ', NULL, 1.90124, 30, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(119, 1, 4741, '2', '{\"min\":\"50\",\"max\":\"100000000\",\"rate\":\"2.3084\",\"currency\":\"INR\"}', 27, 1, '2', '1', '👀 Instagram Video / Reels/ IGTV Views 👀 // 20M Per Day ✈️ // Ultra Instant 🚀// Lifetime Refill ♻️', NULL, 2.53924, 50, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(120, 1, 4742, '2', '{\"min\":\"100\",\"max\":\"1000000000\",\"rate\":\"2.8884\",\"currency\":\"INR\"}', 27, 1, '2', '1', '👀 Instagarm 𝗥𝗘𝗘𝗟 VIEWS // 30M Per Day ✈️ // Lifetime Guratantee ♻️', NULL, 3.17724, 100, 1000000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(121, 1, 4743, '2', '{\"min\":\"100\",\"max\":\"200000000\",\"rate\":\"3.4684\",\"currency\":\"INR\"}', 27, 1, '2', '1', ' 👀 Instagram Reels VIEWS // ALWAYS WORKING SUPERFAST✈️ // 50M Per Day ✈️ // Lifetime Guratantee // No Stuck Issue 😍', NULL, 3.81524, 100, 200000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(122, 1, 4744, '2', '{\"min\":\"50\",\"max\":\"5000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 28, 1, '2', '1', '👩🏻 Instagram Followers [Female] No Refill 🚫', NULL, 24.244, 50, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(123, 1, 4745, '2', '{\"min\":\"50\",\"max\":\"5000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 28, 1, '2', '1', '👩🏻 I͏N͏S͏T͏A͏G͏R͏A͏M͏ F͏O͏L͏L͏O͏W͏E͏R͏ // NO GUARNTEE // 100% FEMALE 👩🏻 // Fast 🚀', NULL, 30.624, 50, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(124, 1, 4746, '2', '{\"min\":\"10\",\"max\":\"150000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 28, 1, '2', '1', '👩🏻 Instagram Followers [Female] R-30 ♻️', NULL, 75.284, 10, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(125, 1, 4747, '2', '{\"min\":\"20\",\"max\":\"20000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 28, 1, '2', '1', '👩🏻 Instagram Likes 👍 [Female] [Non Drop]', NULL, 24.244, 20, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(126, 1, 4748, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"60.32\",\"currency\":\"INR\"}', 29, 1, '2', '1', '💌 Instagram Radoom Comments 💌 // 5K day // Non Drop // Lifetime Reffill', NULL, 66.352, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(127, 1, 4749, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"55.68\",\"currency\":\"INR\"}', 29, 1, '2', '1', '💌 Instagram Random Comments 💌 // Non Drop // Good Speed // Cheapest in all market', NULL, 61.248, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(128, 1, 4750, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"91.64\",\"currency\":\"INR\"}', 29, 1, '2', '1', '💌 Instagram Random Comments 💌 5K /day // Non Drop 💧 // Fast Service // Lifetime Reffill ♻️', NULL, 100.804, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(129, 1, 4751, '2', '{\"min\":\"5\",\"max\":\"200000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 29, 1, '2', '1', '💌 Instagram Comments 👍 Random Positive Emojis // Fast 🚀', NULL, 75.284, 5, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(130, 1, 4752, '2', '{\"min\":\"5\",\"max\":\"200000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 29, 1, '2', '1', '💌 Instagram Comments 👎 Random Negative Emojis // Fast 🚀', NULL, 75.284, 5, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(131, 1, 4753, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 29, 1, '2', '1', '💌 Instagram Radoom Comments 💌 // 10K day // Non Drop💧// Fast Service // Lifetime Reffill', NULL, 75.284, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(132, 1, 4754, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 30, 1, '2', '3', '💌 Instagram Comments // Costum // Good Speed  // Non Drop // 10K Day 🚀', NULL, 75.284, 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(133, 1, 4755, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"62.64\",\"currency\":\"INR\"}', 30, 1, '2', '3', '💌 Instagram Comments // Custom ✍️ //  Real Qulity ❤️// Non Drop 💧', NULL, 68.904, 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(134, 1, 4756, '2', '{\"min\":\"50\",\"max\":\"6000\",\"rate\":\"74.24\",\"currency\":\"INR\"}', 30, 1, '2', '3', '💌 Instagram Comments // Custom ✍️ //  Real Qulity ❤️// Non Drop 💧// Good Speed 🚀', NULL, 81.664, 50, 6000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(135, 1, 4757, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 30, 1, '2', '3', '💌 Instagram Custom ✍️ Comments // Instant Start // Fast 🚀', NULL, 75.284, 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(136, 1, 4758, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"0.6844\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagram Story Views 👀 // All Stories // Non Drop // Fast 🚀', NULL, 0.75284, 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(137, 1, 4759, '2', '{\"min\":\"100\",\"max\":\"30000\",\"rate\":\"0.9164\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagarm Story Views 👀 // All Stories // Super Fast 🚀 // Non Drop', NULL, 1.00804, 100, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(138, 1, 4760, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"2.3084\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagarm Story Views 👀 // All Stories //  fastest 🚀 // Instant // Super Fast 🚀', NULL, 2.53924, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(139, 1, 4761, '2', '{\"min\":\"100\",\"max\":\"350000\",\"rate\":\"18.56\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagarm Story Views 👀 // Female 👱‍♀️ //  50K Day 🚀 // All Story // Instant', NULL, 20.416, 100, 350000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(140, 1, 4762, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagarm Story Question Answer // 1. Answer // 10K/Day // Instant', NULL, 24.244, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(141, 1, 4763, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Story Likes 👍 // Good Qulity ❤️ // 10K/Day // Good Speed ', NULL, 30.624, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(142, 1, 4764, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagran Story Question Answer // 2. Votes on Answer // Fast 🚀 //Story Link', NULL, 24.244, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(143, 1, 4765, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"16.24\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagran Story Poll Votes 🗳️ // 1. Votes on Answer // 5K Day // Story Link', NULL, 17.864, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(144, 1, 4766, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"16.24\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagran Story Poll Votes 🗳️ // 2. Votes on Answer // 5K Day // Story Link', NULL, 17.864, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(145, 1, 4767, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"1.9604\",\"currency\":\"INR\"}', 31, 1, '2', '1', '🤳 Instagarm Story Views 👀 // All Stories // Super Fast 🚀 // Non Drop // No stuck', NULL, 2.15644, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(146, 1, 4768, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"2.958\",\"currency\":\"INR\"}', 32, 1, '2', '1', '✌🏻 Instagram Impressions + Reach // Instant // Fast 🚀// Cheapest Service In The Market ', NULL, 3.2538, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(147, 1, 4769, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"5.7884\",\"currency\":\"INR\"}', 32, 1, '2', '1', '✌🏻 Instagram Reach + Impressions // HQ 😍 // Instant 🔥 ', NULL, 6.36724, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(148, 1, 4770, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"3.4684\",\"currency\":\"INR\"}', 32, 1, '2', '1', '✌🏻 Instagram Impressions + Reach // Instant //  Super Fast 🚀', NULL, 3.81524, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(149, 1, 4771, '2', '{\"min\":\"100\",\"max\":\"1000000000\",\"rate\":\"0.5684\",\"currency\":\"INR\"}', 32, 1, '2', '1', '📈 Instagram Impressions | Cheapest Service In The Market ', NULL, 0.62524, 100, 1000000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(150, 1, 4772, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"0.10324\",\"currency\":\"INR\"}', 33, 1, '2', '1', '📥 Instagram Saves // Fast 🚀', NULL, 0.113564, 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(151, 1, 4773, '2', '{\"min\":\"50\",\"max\":\"200000\",\"rate\":\"1.1484\",\"currency\":\"INR\"}', 33, 1, '2', '1', '📥 Instagram Save // HQ ☺️ // Instant // Fastest 🚀', NULL, 1.26324, 50, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(152, 1, 4774, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"23.01904\",\"currency\":\"INR\"}', 34, 1, '2', '1', '🔹 Facebook Video Views // Instant //  Super Fast // 50-100k Per day ', NULL, 25.320944, 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(153, 1, 4775, '2', '{\"min\":\"100\",\"max\":\"400000\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 35, 1, '2', '1', '🔹 Facebook Post Likes 👍 Real HQ 😍 // 50K Day Super Fast 🚀 // One Click Done ✈️', NULL, 49.764, 100, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(154, 1, 4776, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Likes 👍 // World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill ', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(155, 1, 4777, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Love ❤️// World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill ', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(156, 1, 4778, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Angry 😡// World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill ', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(157, 1, 4779, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Haha 😂// World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill ', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(158, 1, 4780, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Wow 😳 | World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(159, 1, 4781, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Care 🤗 // World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill ', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(160, 1, 4782, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React // Sad 😥// World Wide // Start : 0-24 H // Non Drop // 2k-5k/Day // No Refill', NULL, 43.384, 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(161, 1, 4783, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"33.64\",\"currency\":\"INR\"}', 36, 1, '2', '1', '🔹Facebook Post React | Like👍 | 0-8 H | 500-2k/Day | No Refill', NULL, 37.004, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(162, 1, 4784, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"34.79072\",\"currency\":\"INR\"}', 36, 1, '2', '1', 'Facebook Post React | Love❤️ | 0-8 H | 500-2k/Day | No Refill', NULL, 38.269792, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(163, 1, 4785, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"34.79072\",\"currency\":\"INR\"}', 36, 1, '2', '1', 'Facebook Post React | Wow😲 | 0-8 H | 500-2k/Day | No Refill', NULL, 38.269792, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(164, 1, 4786, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"34.79072\",\"currency\":\"INR\"}', 36, 1, '2', '1', 'Facebook Post React | Haha🤣 | 0-8 H | 500-2k/Day | No Refill', NULL, 38.269792, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL);
INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`) VALUES
(165, 1, 4787, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"34.79072\",\"currency\":\"INR\"}', 36, 1, '2', '1', 'Facebook Post React | Care🤗 | 0-8 H | 500-2k/Day | No Refill', NULL, 38.269792, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(166, 1, 4788, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"34.79072\",\"currency\":\"INR\"}', 36, 1, '2', '1', 'Facebook Post React | Sad😥 | 0-8 H | 500-2k/Day | No Refill', NULL, 38.269792, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(167, 1, 4789, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"34.79072\",\"currency\":\"INR\"}', 36, 1, '2', '1', 'Facebook Post React | Angry🤬 | 0-8 H | 500-2k/Day | No Refill', NULL, 38.269792, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(168, 1, 4790, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"46.371\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Likes👍 | Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 51.0081, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(169, 1, 4791, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"46.371\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Love❤️ Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 51.0081, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(170, 1, 4792, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"46.371\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Haha🤣 | Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 51.0081, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(171, 1, 4793, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"50.4948\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Wow😲 | Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 55.54428, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(172, 1, 4794, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"50.4948\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Care🤗 | Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 55.54428, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(173, 1, 4795, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"50.4948\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Sad😥 | Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 55.54428, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(174, 1, 4796, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"50.4948\",\"currency\":\"INR\"}', 37, 1, '2', '1', '🔹Facebook Post React | Angry🤬 | Instant | Non Drop | 5k/Day | 30 Days Refill 🔥⚡♻️', NULL, 55.54428, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(175, 1, 4797, '2', '{\"min\":\"50\",\"max\":\"5000\",\"rate\":\"19.7084\",\"currency\":\"INR\"}', 38, 1, '2', '1', '🔸Youtube Views 👀 // Good Speed 🚀 ', NULL, 21.67924, 50, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(176, 1, 4798, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 38, 1, '2', '1', '🔸Youtube Views 👀 // Fast // Good Sevice ☺️ // Recommended', NULL, 30.624, 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(177, 1, 4799, '2', '{\"min\":\"100\",\"max\":\"200000\",\"rate\":\"48.72\",\"currency\":\"INR\"}', 39, 1, '2', '1', '🔸 YouTube : Views 👀 5k/DAY // best  // 30 Day Refill ♻️ // Fast 🚀', NULL, 53.592, 100, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(178, 1, 4800, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 39, 1, '2', '1', '🔸 YouTube  : Views 👀 // 2k DAY // 30 Day Refill ♻️ // Good Speed 🚀', NULL, 49.764, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(179, 1, 4801, '2', '{\"min\":\"500000\",\"max\":\"2147483647\",\"rate\":\"62.64\",\"currency\":\"INR\"}', 40, 1, '2', '1', '🔸 Youtube Views 👀 // 5M Day // 100% real and Non drop // Fast complete // 𝐥𝐢𝐟𝐞𝐭𝐢𝐦𝐞 𝐆𝐮𝐚𝐫𝐚𝐧𝐭𝐞𝐞', NULL, 68.904, 500000, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(180, 1, 4802, '2', '{\"min\":\"1000000\",\"max\":\"1000000000\",\"rate\":\"54.288\",\"currency\":\"INR\"}', 40, 1, '2', '1', '🔸 YouTube Adwords Views 👀 // Speed 1M-3M/Day 🚀 // Non Drop // Real Ads Viwes // 𝐥𝐢𝐟𝐞𝐭𝐢𝐦𝐞 𝐆𝐮𝐚𝐫𝐚𝐧𝐭𝐞𝐞', NULL, 59.7168, 1000000, 1000000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(181, 1, 4803, '2', '{\"min\":\"1000000\",\"max\":\"10000000\",\"rate\":\"46.218808\",\"currency\":\"INR\"}', 40, 1, '2', '1', '🔸Youtube Adwords Views // Full Non Drop // 24hr Complete ', NULL, 50.8406888, 1000000, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(182, 1, 4804, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"230.84\",\"currency\":\"INR\"}', 41, 1, '2', '1', '🔸 𝙔𝙊𝙐𝙏𝙐𝘽𝙀 𝙑𝙄𝙀𝙒 | Monetization | 💲 2-4$ CPM | 🚀 Speed  1K Day | ✅ Lifetime Refill', NULL, 253.924, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(183, 1, 4805, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"265.64\",\"currency\":\"INR\"}', 41, 1, '2', '1', '🔸 𝙔𝙊𝙐𝙏𝙐𝘽𝙀  𝙑𝙄𝙀𝙒 | Monetization | 💲 3-5$ CPM | 🚀 Speed  1K Day | ✅ Lifetime Refill', NULL, 292.204, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(184, 1, 4806, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"288.84\",\"currency\":\"INR\"}', 41, 1, '2', '1', '🔸 𝙔𝙊𝙐𝙏𝙐𝘽𝙀  𝙑𝙄𝙀𝙒 | Monetization | 💲 4-6$ CPM | 🚀Speed  1K | ✅ Lifetime Refill', NULL, 317.724, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(185, 1, 4807, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"323.64\",\"currency\":\"INR\"}', 41, 1, '2', '1', '🔸 𝙔𝙊𝙐𝙏𝙐𝘽𝙀  𝙑𝙄𝙀𝙒 | Monetization | 💲 5-8$ CPM | 🚀 Speed  1K | ✅ Lifetime Refill', NULL, 356.004, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(186, 1, 4808, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"346.84\",\"currency\":\"INR\"}', 41, 1, '2', '1', '🔸 𝙔𝙊𝙐𝙏𝙐𝘽𝙀  𝙑𝙄𝙀𝙒 | Monetization | 💲 6-10$ CPM | 🚀 Speed  1K | ✅ Lifetime Refill', NULL, 381.524, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(187, 1, 4809, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"578.84\",\"currency\":\"INR\"}', 41, 1, '2', '1', '🔸 𝙔𝙊𝙐𝙏𝙐𝘽𝙀  𝙑𝙄𝙀𝙒 | Monetization | 💲 7-14$ CPM | 🚀 Speed  1K | ✅ Lifetime Refill', NULL, 636.724, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(188, 1, 4810, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"30.16\",\"currency\":\"INR\"}', 42, 1, '2', '1', '🔸 YouTube Likes 👍 // Non Drop 💧// 50K Day 🚀 // 60 Day Refill ♻️ // Super FAST 🚀 ', NULL, 33.176, 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(189, 1, 4811, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"33.64\",\"currency\":\"INR\"}', 42, 1, '2', '1', '🔸 YouTube Likes 👍 // Non Drop 💧// 60 Day Reffll ♻️ // 100K Day 🚚 // Fastest Delivery 🚚', NULL, 37.004, 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(190, 1, 4812, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"40.3564\",\"currency\":\"INR\"}', 42, 1, '2', '1', '🔸 YouTube Likes 👍 // Super Real 😍 // Non Drop // Lifetime Reffll ♻️ // 200K Day ✈️', NULL, 44.39204, 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(191, 1, 4813, '2', '{\"min\":\"500\",\"max\":\"25000\",\"rate\":\"26.3204\",\"currency\":\"INR\"}', 42, 1, '2', '1', '🔸 Youtube Likes 👍 // Instant // No Drop // Fastest 🚀 // Worlds Best Price', NULL, 28.95244, 500, 25000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(192, 1, 4814, '2', '{\"min\":\"100\",\"max\":\"60000\",\"rate\":\"23.1884\",\"currency\":\"INR\"}', 42, 1, '2', '1', '🔸 Youtube Likes 👍 // Non Drop // Fastest // Best ❤️', NULL, 25.50724, 100, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(193, 1, 4815, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 43, 1, '2', '1', '⏸️ YouTube Dislikes 👎 // Good Qulity // No Refill', NULL, 24.244, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(194, 1, 4816, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"55.66608\",\"currency\":\"INR\"}', 44, 1, '2', '1', '🔸 YouTube Subscribers // 10K Per Day // No Refill  // Fast', NULL, 61.232688, 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(195, 1, 4817, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"43.745688\",\"currency\":\"INR\"}', 44, 1, '2', '1', '🔸 YouTube Subscribers // 20k Per Day // No Refill // Low Drop 💧// Fast 🚀', NULL, 48.1202568, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(196, 1, 4818, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"46.23528\",\"currency\":\"INR\"}', 44, 1, '2', '1', '🔸 YouTube Subscribers // HQ 😍 // Low Drop // 50K Day // Instant Start // Fastest Delivery 🚚', NULL, 50.858808, 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(197, 1, 4819, '2', '{\"min\":\"500\",\"max\":\"50000\",\"rate\":\"34.7884\",\"currency\":\"INR\"}', 44, 1, '2', '1', '🔸 Youtube Subscribes // 5k/day // Fast // Cheapest ', NULL, 38.26724, 500, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(198, 1, 4820, '2', '{\"min\":\"100\",\"max\":\"60000\",\"rate\":\"49.79184\",\"currency\":\"INR\"}', 44, 1, '2', '1', '🔸 YouTube Subscribers // HQ 😍// 50K Day // Instant Start // One Click Delivery 🚚', NULL, 54.771024, 100, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(199, 1, 4821, '2', '{\"min\":\"100\",\"max\":\"25000\",\"rate\":\"680.108\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸YouTube Subscriber // Almost 0% Drop // Lifetime Refill ♻️ // 1K+ Per Day 🚀 // Fast Start ', NULL, 748.1188, 100, 25000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(200, 1, 4822, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"784.74\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscribers // 0% Drop // 30 Day Refill // 1/2K+ Day🚀//  Fast Start 🚀', NULL, 863.214, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(201, 1, 4823, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"856.08\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscribers // 0% Drop // 30 Day Refill ♻️ // 2/3k+ Day 🚀 // Fast 🚀', NULL, 941.688, 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(202, 1, 4824, '2', '{\"min\":\"50\",\"max\":\"60000\",\"rate\":\"913.152\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscribers // 0% Drop // 5K+ Day // 365 Day Refill ♻️ // Fastest Delivery 🚚', NULL, 1004.4672, 50, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(203, 1, 4825, '2', '{\"min\":\"50\",\"max\":\"70000\",\"rate\":\"970.224\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Real Subscribers // 0% Drop // 10K+ Day // Lifetime Refill ♻️ // Fast', NULL, 1067.2464, 50, 70000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(204, 1, 4826, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"572.6224\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscriber // 500/600+ Day // Fast Start // Non Drop // 60 Days Refill Button ♻️', NULL, 629.88464, 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(205, 1, 4827, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"346.84\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscriber // 5/10+ Day // HQ Quality // Non Drop // 30 Days Refill ♻️', NULL, 381.524, 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(206, 1, 4828, '2', '{\"min\":\"50\",\"max\":\"90000\",\"rate\":\"1084.368\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscriber // Super Fast // 20k Per Day // 0% Drop // LifeTime Refill ♻️', NULL, 1192.8048, 50, 90000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(207, 1, 4829, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"653.95\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscribers // Non Drop // Refill 365 Days // 800/1K+ Per Day 🚀', NULL, 719.345, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(208, 1, 4830, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"1158.5616\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸Youtube Subscriber // Super Real😍 // Super Fast // 30k Per Day // 0% Drop // LifeTime Refill ♻️', NULL, 1274.41776, 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(209, 1, 4831, '2', '{\"min\":\"50\",\"max\":\"80000\",\"rate\":\"1027.296\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸Youtube Subscriber // Super Fast // 15k Per Day // 0% Drop // LifeTime Refill ♻️', NULL, 1130.0256, 50, 80000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(210, 1, 4832, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"486.72904\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscribers // High Quality // Refill 30 Day // 200/300+ Day // Non Drop', NULL, 535.401944, 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(211, 1, 4833, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"531.7208\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscribers // High Quality // 500+ Day // 30 Day Refill ♻️// Non Drop', NULL, 584.89288, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(212, 1, 4834, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"490.8192\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscribers // High Quality // 300/500+ Day // 30 Day Refill ♻️ // Non Drop', NULL, 539.90112, 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(213, 1, 4835, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"1274.84\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸Youtube Subscriber // Super Real😍 // 50k Per Day // 0% Drop // LifeTime Refill ♻️', NULL, 1402.324, 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(214, 1, 4836, '2', '{\"min\":\"100\",\"max\":\"20000\",\"rate\":\"460.3808\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscriber // 50/200+ Day // HQ Quality // Non Drop // 60 Days Refill ♻️', NULL, 506.41888, 100, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(215, 1, 4948, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"572.6224\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscriber // 500/600+ Day // Fast Start // Non Drop // 60 Days Refill Button ♻️', NULL, 629.88464, 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(216, 1, 4949, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"346.84\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscriber // 5/10+ Day // HQ Quality // Non Drop // 30 Days Refill ♻️', NULL, 381.524, 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(217, 1, 4950, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"486.72904\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscribers // High Quality // Refill 30 Day // 200/300+ Day // Non Drop', NULL, 535.401944, 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(218, 1, 4951, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"531.7208\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscribers // High Quality // 500+ Day // 30 Day Refill ♻️// Non Drop', NULL, 584.89288, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(219, 1, 4952, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"490.8192\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 Youtube Subscribers // High Quality // 300/500+ Day // 30 Day Refill ♻️ // Non Drop', NULL, 539.90112, 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(220, 1, 4953, '2', '{\"min\":\"100\",\"max\":\"20000\",\"rate\":\"460.3808\",\"currency\":\"INR\"}', 45, 1, '2', '1', '🔸 YouTube Subscriber // 50/200+ Day // HQ Quality // Non Drop // 60 Days Refill ♻️', NULL, 506.41888, 100, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(221, 1, 4837, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"172.84\",\"currency\":\"INR\"}', 46, 1, '2', '3', '⏸️ Youtube Custom Comments 💌 // 1k/day Speed // Non Drop	', NULL, 190.124, 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(222, 1, 4838, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"85.9647\",\"currency\":\"INR\"}', 47, 1, '2', '1', '🔸Youtube Comments Likes // Up Vote // Instant // Fastest ', NULL, 94.56117, 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(223, 1, 4839, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"91.64\",\"currency\":\"INR\"}', 48, 1, '2', '1', '🔸 YouTube Watch time 🕛 // No Refill // 5+ Minutes Video // 500 Hours Day', NULL, 100.804, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(224, 1, 4840, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 48, 1, '2', '1', '🔸 YouTube Watch time 🕛 // No Refill // 10+ Minutes Video // 500 Hours Day ', NULL, 126.324, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(225, 1, 4841, '2', '{\"min\":\"100\",\"max\":\"16000\",\"rate\":\"230.84\",\"currency\":\"INR\"}', 49, 1, '2', '1', '🔸 YouTube Watch Time ⏰ // 15+ minutes // 4000H Day // Full Non Drop // Super Fast 🚀 // 30 Days Refill ♻️', NULL, 253.924, 100, 16000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(226, 1, 4842, '2', '{\"min\":\"100\",\"max\":\"8000\",\"rate\":\"346.84\",\"currency\":\"INR\"}', 49, 1, '2', '1', '🔸 YouTube Watch Time ⏰ // 30+ minutes // 4000H Day // Full Non Drop // Super Fast 🚀 // 30 Days Refill ♻️', NULL, 381.524, 100, 8000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(227, 1, 4843, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"497.64\",\"currency\":\"INR\"}', 49, 1, '2', '1', '🔸 YouTube Watch Time ⏰ // 60+ minutes // 4000H Day // Full Non Drop // Super Fast 🚀 // 30 Days Refill ♻️', NULL, 547.404, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(228, 1, 4844, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"3478.84\",\"currency\":\"INR\"}', 50, 1, '2', '2', '⏸️ YouTube Monetization 💲 Plan // 4K Watch Time + 1K Subscribers // 15 Day Complete ', NULL, 3826.724, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(229, 1, 4845, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"4058.84\",\"currency\":\"INR\"}', 50, 1, '2', '2', '⏸️ YouTube Monetization 💲 Plan // 4K Watch Time + 1K Subscribers // 4/5 Day Complete // Fastest Delivery 🚚', NULL, 4464.724, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(230, 1, 4846, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"18.1888\",\"currency\":\"INR\"}', 51, 1, '2', '1', '📬Telegram Members // Speed 3K Per Day', NULL, 20.00768, 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(231, 1, 4847, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"41.615\",\"currency\":\"INR\"}', 51, 1, '2', '1', '📬Telegram Members // 20K Day // Cheap Sever ', NULL, 45.7765, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(232, 1, 4848, '2', '{\"min\":\"15\",\"max\":\"100000\",\"rate\":\"25.984\",\"currency\":\"INR\"}', 51, 1, '2', '1', '📬Telegram Members // Good Sever 👍', NULL, 28.5824, 15, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(233, 1, 4849, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"41.748168\",\"currency\":\"INR\"}', 52, 1, '2', '1', '📬 Telegram Members // 10K Day 🚀 // Good Qulity // 2 Day Refill ', NULL, 45.9229848, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(234, 1, 4850, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"45.7765\",\"currency\":\"INR\"}', 52, 1, '2', '1', '📬 Telegram : Member // 50K Day // Real HQ 😍 // AR 3 Days // Instant ', NULL, 50.35415, 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(235, 1, 4851, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"51.55968\",\"currency\":\"INR\"}', 52, 1, '2', '1', '📬 Telegram : Member // Non Drop 💧// 10K Day // Real HQ 😍 // FAST 🚀 ', NULL, 56.715648, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(236, 1, 4852, '2', '{\"min\":\"100\",\"max\":\"60000\",\"rate\":\"57.681\",\"currency\":\"INR\"}', 52, 1, '2', '1', '📬 Telegram Members // No Drop // Real HQ 😍 // 30K Per Day 🚀 ', NULL, 63.4491, 100, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(237, 1, 4853, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"64.3365\",\"currency\":\"INR\"}', 52, 1, '2', '1', '📬 Telegram member // HIGH Quality 😍 // 50K Day 🚀 // Non Drop // Fast  ', NULL, 70.77015, 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(238, 1, 4854, '2', '{\"min\":\"500\",\"max\":\"200000\",\"rate\":\"71.92\",\"currency\":\"INR\"}', 53, 1, '2', '1', '📬 Telegram member // HIGH Quality 😍 // Non Drop // 30 Day Refill ♻️ //  // Good Speed 🚅', NULL, 79.112, 500, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(239, 1, 4855, '2', '{\"min\":\"100\",\"max\":\"300000\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 53, 1, '2', '1', '📬 Telegram Member // 0% Drop // 20K Per Day // Lifetime Refill ♻️', NULL, 126.324, 100, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(240, 1, 4856, '2', '{\"min\":\"500\",\"max\":\"5000\",\"rate\":\"75.981392\",\"currency\":\"INR\"}', 53, 1, '2', '1', '📬Telegram Full Non 𝐃𝐫𝐨𝐩 Members // 30 Days Refill // Only Private Link ', NULL, 83.5795312, 500, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(241, 1, 4857, '2', '{\"min\":\"500\",\"max\":\"8000\",\"rate\":\"88.7603\",\"currency\":\"INR\"}', 53, 1, '2', '1', '📬Telegram Full Non 𝐃𝐫𝐨𝐩 Members // 30 Days Refill // instant💥', NULL, 97.63633, 500, 8000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(242, 1, 4858, '2', '{\"min\":\"100\",\"max\":\"75000\",\"rate\":\"94.757616\",\"currency\":\"INR\"}', 53, 1, '2', '1', '📬Telegram 0% 𝐃𝐫𝐨𝐩 Members // 30 Days Refill // 50K/Day // Ultra 𝗦𝘁𝗮𝗯𝗹𝗲 🚀', NULL, 104.2333776, 100, 75000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(243, 1, 4859, '2', '{\"min\":\"100\",\"max\":\"75000\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 53, 1, '2', '1', '📬Telegram 0% 𝐃𝐫𝐨𝐩 Members // 60 Days Refill // 30K/Day // 𝗦𝘁𝗮𝗯𝗹𝗲 🚀', NULL, 113.564, 100, 75000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(244, 1, 4868, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"10.4284\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Negative Mix Reactions [👎😁😢💩🤮] // Non Drop 💧', NULL, 11.47124, 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(245, 1, 4869, '2', '{\"min\":\"20\",\"max\":\"1000000\",\"rate\":\"33.64\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Positive Mix Reactions  [👍🤩🎉🔥❤️]   Views [ 🔮 10 Future Post ]', NULL, 37.004, 20, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(246, 1, 4860, '2', '{\"min\":\"15\",\"max\":\"150000\",\"rate\":\"5.7884\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Like (👍) Reaction // Non Drop 💧', NULL, 6.36724, 15, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(247, 1, 4861, '2', '{\"min\":\"15\",\"max\":\"150000\",\"rate\":\"5.7884\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Dislike (👎) Reaction // Non Drop 💧', NULL, 6.36724, 15, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(248, 1, 4862, '2', '{\"min\":\"15\",\"max\":\"150000\",\"rate\":\"6.9484\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Heart (❤️) Reaction // Non Drop 💧', NULL, 7.64324, 15, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(249, 1, 4863, '2', '{\"min\":\"15\",\"max\":\"150000\",\"rate\":\"6.9484\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Fire (🔥) Reaction // Non Drop 💧', NULL, 7.64324, 15, 150000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(250, 1, 4864, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"6.9484\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Party (🎉) Reaction // Non Drop 💧', NULL, 7.64324, 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(251, 1, 4865, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"6.9484\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Starstruck (🤩) Reaction // Non Drop 💧', NULL, 7.64324, 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(252, 1, 4866, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"6.9484\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Scream (😱) Reaction // Non Drop 💧', NULL, 7.64324, 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(253, 1, 4867, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"10.4284\",\"currency\":\"INR\"}', 54, 1, '2', '1', '📬 Telegram » Positive Mix Reactions [👍🤩🎉🔥❤️] // Non Drop 💧', NULL, 11.47124, 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(254, 1, 4870, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"0.3364\",\"currency\":\"INR\"}', 55, 1, '2', '1', '📬 Telegram » Views // super Fast', NULL, 0.37004, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(255, 1, 4871, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"0.4524\",\"currency\":\"INR\"}', 55, 1, '2', '1', '📬 Telegram » Views // Ultra Fast // Best ❤️', NULL, 0.49764, 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(256, 1, 4874, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"68.44\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers // SuperFast // Instant // Speed 50K/Day // No Refill', NULL, 75.284, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(257, 1, 4875, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"91.64\",\"currency\":\"INR\"}', 56, 1, '2', '1', ' 🌍 Twitter Followers // Fast 🚀  // HQ 😍 // 10K Day 🚀 // 30 day Refill ♻️', NULL, 100.804, 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(258, 1, 4876, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"80.04\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers // Super Real ♥️// 10K/Day // Non Drop 💧// 30 Day Refill ♻️', NULL, 88.044, 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(259, 1, 4877, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"288.84\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers 😍 NFT 😍 // 99 Days Refill // Non Drop // 100K Day 🚀 // 0/10 minutes🚀', NULL, 317.724, 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(260, 1, 4878, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"33.64\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers // Slow // Cheapest in all market', NULL, 37.004, 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(261, 1, 4879, '2', '{\"min\":\"200\",\"max\":\"20000\",\"rate\":\"56.84\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers // Fast 🚀 // Good Qulity', NULL, 62.524, 200, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(262, 1, 4880, '2', '{\"min\":\"100\",\"max\":\"30000\",\"rate\":\"71.92\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter NFT Followers // HQ Accounts // Low Drop // 30 Day Refill // Good Speed', NULL, 79.112, 100, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(263, 1, 4873, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"230.84\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers // 99 Days Refill // Non Drop // 50K Day 🚀 // 0/15 minutes🚀', NULL, 253.924, 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(264, 1, 4872, '2', '{\"min\":\"200\",\"max\":\"40000\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 56, 1, '2', '1', '🌍 Twitter Followers // HQ | 20k/Day 🚀| 45 Day Refill ♻️ // Fast 🚀', NULL, 113.564, 200, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(265, 1, 4881, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 57, 1, '2', '1', '🌍 Twiiter Likes 👍 // Good Quality // Best in Market // Fast ', NULL, 49.764, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(266, 1, 4882, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"39.44\",\"currency\":\"INR\"}', 57, 1, '2', '1', '🌍 Twiiter Likes 👍 // Good Quality //Fastest // Cheapest In Market ', NULL, 43.384, 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(267, 1, 4883, '2', '{\"min\":\"25\",\"max\":\"10000000\",\"rate\":\"0.19488\",\"currency\":\"INR\"}', 58, 1, '2', '1', '🌍 Twitter Video Views 👀 // Super Fast // 🔥Instant	', NULL, 0.214368, 25, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(268, 1, 4884, '2', '{\"min\":\"25\",\"max\":\"6000000\",\"rate\":\"0.2088\",\"currency\":\"INR\"}', 58, 1, '2', '1', ' 🌍 Twitter Video Views // 5M Day ✈️ // Fastest In All Market 🚅', NULL, 0.22968, 25, 6000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(269, 1, 4885, '2', '{\"min\":\"1000\",\"max\":\"5000000\",\"rate\":\"0.92742\",\"currency\":\"INR\"}', 58, 1, '2', '1', '🌍 Twitter Video Views 👀 + Interaction Profile Click // 5M Day ✈️ // Ultra Instant 🚅 // Fastest Delivery Sevices 🚀', NULL, 1.020162, 1000, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(270, 1, 4886, '2', '{\"min\":\"500\",\"max\":\"1000000\",\"rate\":\"1.598016\",\"currency\":\"INR\"}', 58, 1, '2', '1', ' 🌍 Twitter- Video Views/ Impressions/ Profile Click] ~ Max 100k ~- INSTANT	', NULL, 1.7578176, 500, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(271, 1, 4887, '2', '{\"min\":\"25\",\"max\":\"4000000\",\"rate\":\"0.18096\",\"currency\":\"INR\"}', 58, 1, '2', '1', '🌍 Twitter Views // Fastest 🚀 // Sever-1', NULL, 0.199056, 25, 4000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(272, 1, 4890, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 59, 1, '2', '1', '🌍 Twitter Poll Votes 🗳️ // 1-2K Hour\'s // Good Sevice ☺️', NULL, 24.244, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(273, 1, 4888, '2', '{\"min\":\"10\",\"max\":\"1000\",\"rate\":\"80.04\",\"currency\":\"INR\"}', 59, 1, '2', '1', '🌍 Twitter Indian 🇮🇳 Followers // Women 👱‍♀️ Accounts // Non Drop // No Refill // Old Accounts // Cancel Button ', NULL, 88.044, 10, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(274, 1, 4889, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"91.64\",\"currency\":\"INR\"}', 59, 1, '2', '1', '🌍 Twitter Indian 🇮🇳 Followers // Women 👱‍♀️ Accounts // Non Drop // No Refill // Old Accounts 🙀', NULL, 100.804, 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(275, 1, 4891, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"27.84\",\"currency\":\"INR\"}', 59, 1, '2', '1', '🌍 Twitter Poll Votes 🗳️ // 3-5K/ Hour\'s // 30 Day Refill ♻️', NULL, 30.624, 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(276, 1, 4892, '2', '{\"min\":\"100\",\"max\":\"50000000\",\"rate\":\"0.18096\",\"currency\":\"INR\"}', 60, 1, '2', '1', '💃🕺 TikTok Video Views 👁️‍🗨️ // Fastest🚀 // best in market', NULL, 0.199056, 100, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(277, 1, 4893, '2', '{\"min\":\"100\",\"max\":\"50000000\",\"rate\":\"0.233856\",\"currency\":\"INR\"}', 60, 1, '2', '1', '💃🕺 TikTok Video Views 👁️‍🗨️ // Fastest Delivery 🚚 // Super HQ // One Click Done ✈️', NULL, 0.2572416, 100, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(278, 1, 4894, '2', '{\"min\":\"100\",\"max\":\"50000000\",\"rate\":\"0.19488\",\"currency\":\"INR\"}', 60, 1, '2', '1', '💃🕺 TikTok Video Views 👁️‍🗨️ // Fast Delivery 🚚 // Fast Start ', NULL, 0.214368, 100, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(279, 1, 4895, '2', '{\"min\":\"10\",\"max\":\"400000\",\"rate\":\"50.112\",\"currency\":\"INR\"}', 61, 1, '2', '1', '💃🕺 TikTok Likes 👍 // 50K Day // No Refill ♻️ // Super Real ♥️', NULL, 55.1232, 10, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(280, 1, 4896, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"66.20352\",\"currency\":\"INR\"}', 61, 1, '2', '1', '💃🕺 Tiktok Likes // SUPER REAL 😍 // 80K Day // Non Drop // 45 Day Refill ♻️ ', NULL, 72.823872, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(281, 1, 4897, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"18.56\",\"currency\":\"INR\"}', 61, 1, '2', '1', '💃🕺 TikTok Likes 👍 // 20K Day 🚀 // Fast Start 🚀 // ', NULL, 20.416, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(282, 1, 4898, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"22.04\",\"currency\":\"INR\"}', 61, 1, '2', '1', '💃🕺 Tiktok Likes 👍 // Good Quality // Working Always // Fastest ✈️', NULL, 24.244, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(283, 1, 4899, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"71.72048\",\"currency\":\"INR\"}', 61, 1, '2', '1', '💃🕺 TikTok Likes 👍 // Fast Complete // Refill 60 Day // Real Looking // Fastest Delivery 🚚', NULL, 78.892528, 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(284, 1, 4900, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"2318.84\",\"currency\":\"INR\"}', 62, 1, '2', '2', '⚜️ Truecaller [ Number ] verification ✔️ ( Blue tick ☑️ ) 100% Warranty ♻️', NULL, 2550.724, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(285, 1, 4901, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"23198.84\",\"currency\":\"INR\"}', 62, 1, '2', '2', '⚜️ Instagarm Account Verification [ Blue Tick ☑️ ] 100% Genius and Real 💕', NULL, 25518.724, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(286, 1, 4902, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"230.84\",\"currency\":\"INR\"}', 63, 1, '2', '2', '☠️ Whatsapp 📞 Number 💀 Frezz 🥶 100% Genius Work { Contact Support team for price }', NULL, 253.924, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(287, 1, 4903, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"578.84\",\"currency\":\"INR\"}', 63, 1, '2', '2', '☠️ Whatsapp Account Hack ❌ { Read discption }', NULL, 636.724, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(288, 1, 4904, '2', '{\"min\":\"1000\",\"max\":\"0\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Netflix // Monthly // Login Guratantee ( UHD )', NULL, 49.764, 1000, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(289, 1, 4905, '2', '{\"min\":\"1000\",\"max\":\"0\",\"rate\":\"91.64\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Netflix 1 screen UHD { Monthly Warranty }', NULL, 100.804, 1000, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(290, 1, 4906, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"138.04\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Netflix 2 screen UHD ( Monthly Warranty  ) ', NULL, 151.844, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(291, 1, 4907, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"265.64\",\"currency\":\"INR\"}', 64, 1, '2', '1', '📱 Netflix 4 Screen UHD ] [ Monthly Warranty ]', NULL, 292.204, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(292, 1, 4908, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"56.84\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Amazon prime Video [ Monthly ]', NULL, 62.524, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(293, 1, 4909, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"103.24\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Amazon prime Video [ 3 Months ]', NULL, 113.564, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(294, 1, 4910, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"149.64\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Amazon Prime Video [ 6 Month ]', NULL, 164.604, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(295, 1, 4911, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"80.04\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 Amazon prime Video [ Monthly ]  [ 🔒 Private ]', NULL, 88.044, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(296, 1, 4912, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"45.24\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 YouTube Primeum [ 1 Month ]', NULL, 49.764, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(297, 1, 4913, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 YouTube Primeum [ 3 Month ] Individual', NULL, 126.324, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(298, 1, 4914, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 64, 1, '2', '2', '📱 YouTube Primeum [ 3 Month ]', NULL, 126.324, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(299, 1, 4922, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 65, 1, '2', '1', '☠  FACEBOOK ACCOUNT REPORT  [ 100% SATISFACTION ]', NULL, 126.324, 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(300, 1, 4923, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 65, 1, '2', '1', '☠  INSTAGRAM ACCOUNT REPORT  {{ 100% SATISFACTION }}', NULL, 126.324, 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(301, 1, 4924, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 65, 1, '2', '2', '☠ YOUTUBE  ACCOUNT REPORT [ 100% SATISFACTION ]', NULL, 126.324, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(302, 1, 4925, '2', '{\"min\":\"1\",\"max\":\"0\",\"rate\":\"114.84\",\"currency\":\"INR\"}', 66, 1, '2', '2', '📊 Run Your Ads for 24 Hour 🕛 ( Read discption )', NULL, 126.324, 1, 0, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(303, 1, 4926, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"1390.84\",\"currency\":\"INR\"}', 67, 1, '2', '1', '✍️ Article Publishing 👉 Medium.com ', NULL, 1529.924, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(304, 1, 4927, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"2318.84\",\"currency\":\"INR\"}', 67, 1, '2', '1', '✍️ Article Publishing 👉 DailyHunt.in ', NULL, 2550.724, 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(305, 1, 4928, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"346.84\",\"currency\":\"INR\"}', 68, 1, '2', '2', '📄 Digital marketing certificate ', NULL, 381.524, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(306, 1, 4932, '2', '{\"min\":\"1\",\"max\":\"1\",\"rate\":\"10.44\",\"currency\":\"INR\"}', 69, 1, '2', '2', '😂 SMS Booming ✉️✉️✉️ ( Use Only For Prank ) (100 SMS )', NULL, 11.484, 1, 1, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(307, 1, 4933, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"810.84\",\"currency\":\"INR\"}', 70, 1, '2', '1', 'Youtube Subscribe // 20k/day // Full Non Drop // Lifetime Guarantee // Fast 🚀', NULL, 891.924, 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(308, 1, 4934, '2', '{\"min\":\"100\",\"max\":\"20000\",\"rate\":\"3.4684\",\"currency\":\"INR\"}', 70, 1, '2', '1', ' Instagram Likes 👍 // HQ ❤️ // Refill - Lifetime // Instant // Super Fast ✈️ ', NULL, 3.81524, 100, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL),
(309, 1, 4935, '2', '{\"min\":\"200\",\"max\":\"1000000\",\"rate\":\"25.5084\",\"currency\":\"INR\"}', 70, 1, '2', '1', ' Instagram Followers // 50K Day // Lifetime Refill ♻️ // AntiUpdate ❤️', NULL, 28.05924, 200, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_api`
--

INSERT INTO `service_api` (`id`, `api_name`, `api_url`, `api_key`, `api_type`, `api_limit`, `currency`, `api_alert`) VALUES
(1, 'Puffx Smm Panel ', 'https://puffxsmmpanel.in/api/v2', '23a52593b3efc8a967c30b224a73c75b', 1, 0, 'INR', '2');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_newbankpayment` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_newbankpayment`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`) VALUES
(1, 'Insaniyat', 'Insaniyat', 'smm panel, fsp , smm reseller panel, smm provider panel, reseller panel, instagram panel, resellerpanel, abusalehinfotech,social media reseller panel, smmpanel, panelsmm, smm, panel, socialmedia, instagram reseller panel', 'smm panel, fsp , smm reseller panel, smm provider panel, reseller panel, instagram panel, resellerpanel, abusalehinfotech,social media reseller panel, smmpanel, panelsmm, smm, panel, socialmedia, instagram reseller panel', 'public/images/a4300b002bcfb71f291dac175d52df94.png', 'Insaniyat', 'INR', 'public/images/a29e971b5176a9fadde4eb86c851c7d66de8004b.png', 'en', 'eternity-lilac', 'Readable', '1', '', '', '', '', '2', '2', '1', '2', 1, 1, 'puffxsmmpanel', '9826719669aA', 'puffxsmmpanel', '465', 'ssl', '1', '2', '2', '2', '2', '1', 'bizimsms', 'puffxsmmpanel', 'puffxsmmpanel', 'puffxsmmpanel', '1', 'puffx@example.com', '+19177900804', '2', '1', '2', '2', 'desc', 2147483647, 2147483647, 2147483647, 52, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`) VALUES
(20, 'Engaging Black', 'engaging-black', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/black.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(3, 'Eternity Coral', 'eternity-coral', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/coral.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(2, 'Eternity Lilac', 'eternity-lilac', '  {\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/Lilac.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\"]}'),
(1, 'Eternity Cyan', 'eternity-cyan', '  {\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/cyan.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\"]}'),
(4, 'Eternity Azure', 'eternity-azure', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/azure.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(6, 'Eternity Grey', 'eternity-grey', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/grey.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(5, 'Eternity Purple', 'eternity-purple', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/purple.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(7, 'Eternity Lime', 'eternity-lime', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/lime.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(8, 'Eternity navy', 'eternity-navy', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/navy.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(9, 'Eternity Pink', 'eternity-pink', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/pink.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(10, 'Eternity Raspberry', 'eternity-raspberry', '{\"stylesheets\":[\"public/Eternity/bootstrap.css\",\"public/Eternity/raspberry.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Eternity/js/script.js\",\"public/Eternity/js/snowfall.min.js\",\"public/Eternity/js/bundle.js\",\"public/Eternity/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(12, 'Engaging Violet', 'engaging-violet', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/violet.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(13, 'Engaging Cyan', 'engaging-cyan', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/cyan.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(14, 'Engaging Orange', 'engaging-orange', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/orange.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(15, 'Engaging Lime', 'engaging-lime', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/green.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(16, 'Engaging Red', 'engaging-red', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/red.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(19, 'Engaging Blue', 'engaging-blue', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/blue.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(18, 'Engaging Ashgrey', 'engaging-ashgrey', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/ashgrey.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(17, 'Engaging Yellow', 'engaging-yellow', '{\"stylesheets\":[\"public/Engaging/bootstrap.css\",\"public/Engaging/yellow.css\",\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\",\"public/datepicker/css/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https://code.jquery.com/jquery-3.3.1.min.js\",\"public/Engaging/js/script.js\",\"public/Engaging/js/snowfall.min.js\",\"public/Engaging/js/bundle.js\",\"public/Engaging/js/main.js\",\"public/ajax.js\",\"public/datepicker/js/bootstrap-datepicker.min.js\"]}'),
(21, 'Engaging Pink', 'engaging-pink', '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_reply`
--

INSERT INTO `ticket_reply` (`id`, `ticket_id`, `client_id`, `time`, `support`, `message`) VALUES
(1, 1, 0, '2021-10-29 16:42:29', '1', 'I want to create my own smm panel like your . so how can I do that please tell me \r\nAnd also tell me your charges'),
(2, 2, 0, '2021-11-01 15:55:22', '1', 'asajsjasjasjajsajsjajaj'),
(3, 3, 0, '2021-11-01 16:05:23', '1', 'ahasjasjajsajajsjaj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
