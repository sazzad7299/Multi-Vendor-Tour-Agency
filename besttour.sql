-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2021 at 08:04 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `besttour`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `email`, `phone`, `password`, `role`, `photo`, `created_at`, `updated_at`, `remember_token`, `status`) VALUES
(1, 'Md. Sazzadur Rahman', 'admin', 'sazzadurrahman580@gmail.com', '01786740107', '$2y$10$DozM30vRGMY9aDIh2EKxROmvuJRtBMimO2ox/rF8uXjMBYBjLvVRe', 'Administrator', '1510211044icon.jpg', '2017-01-24 03:21:40', '2021-05-31 06:13:21', 'rAadtqaELj13ya9Cx1ERoD10nbTm2kbe9K2N5vs5wHbi5i2QlKDvzBXoLRgD', 1),
(2, 'S Zaman', 'genius', 'genius@gmail.com', '000 000 000', '$2y$10$DozM30vRGMY9aDIh2EKxROmvuJRtBMimO2ox/rF8uXjMBYBjLvVRe', 'Administrator', '11822730_1619598781649385_5506560502405630990_n.jpg', '2017-01-27 22:35:17', '2017-03-06 11:02:08', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('script','banner') NOT NULL,
  `advertiser_name` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `banner_size` varchar(255) NOT NULL,
  `banner_file` varchar(255) DEFAULT NULL,
  `script` text,
  `clicks` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `featured_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `details`, `featured_image`, `source`, `views`, `created_at`, `updated_at`, `status`) VALUES
(5, 'Cycling-Mountain Biking', '<span style=\"color: rgb(255, 255, 255); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: center; background-color: rgb(33, 33, 33);\">A movement office is a private retailer or open administration that gives travel and the travel industry related administrations to the general population. Furthermore, providers, for example, exercises, carriers, vehicle rentals, voyage lines, inns, railroads, travel protection and bundle visits. Here you can think about the Top 10 Travel Agency in Bangladesh.</span>', 'jdu1620324042Jhaudia-Shahi-Mosque-Kushtia-5.jpg', 'www.facebook.com', 2, '2021-05-21 13:52:16', '2021-08-16 10:20:25', 1),
(6, 'GET A better travel 7', '<span style=\"color: rgb(0, 0, 0); font-family: Montserrat, Helvetica, Arial, Lucida, sans-serif; text-align: center;\">We arrange air tickets at cheaper rates to any destination worldwide. Being an authorized visa agent and we process tourist Visa of almost all common countries. We process and provide exclusive visa services to valued clients. We can offer very reasonable hotel rates as we have tied up with many offline and online suppliers worldwide.–Bangladesh is a land of natural beauty, beaches, hills, and many historical places. Every year foreigners from different countries like China, the USA, UAE, Bangkok, Australia, etc come to see Bangladesh through us.</span><br>', 'OKi1619721968nilgiri-slide_1-2020-06-08-5eddca6e0e9dc.jpeg', 'www.facebook.com', 5, '2021-05-21 13:58:18', '2021-08-16 10:20:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brand_banner`
--

DROP TABLE IF EXISTS `brand_banner`;
CREATE TABLE IF NOT EXISTS `brand_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('brand','banner') NOT NULL DEFAULT 'brand',
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand_banner`
--

INSERT INTO `brand_banner` (`id`, `type`, `image`, `link`, `status`) VALUES
(5, 'banner', '1510213233b1.jpg', '#', 1),
(7, 'banner', '1510213249b1.jpg', '#', 1),
(8, 'banner', '1510213270b1.jpg', '#', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(255) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `infant` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `uniqueid`, `product`, `title`, `quantity`, `children`, `infant`, `size`, `cost`) VALUES
(64, 'MROnuou', 37, 'Shilaidaha Kuthibari of Rabindranath – Kushtia', 1, NULL, NULL, NULL, 5000),
(67, 'YqiuBUu', 37, 'Shilaidaha Kuthibari of Rabindranath – Kushtia', 1, NULL, NULL, NULL, 5000),
(68, 'YqiuBUu', 36, 'River Padma', 1, NULL, NULL, NULL, 2000),
(69, 'YqiuBUu', 38, 'Amiakum Waterfall', 1, NULL, NULL, NULL, 5000),
(74, 'cyFjLat', 37, 'Shilaidaha Kuthibari of Rabindranath – Kushtia', 1, 1, 1, NULL, 7500),
(75, 'GvAW2NQ', 38, 'Amiakum Waterfall', 1, NULL, NULL, NULL, 5000),
(76, 'GvAW2NQ', 37, 'Shilaidaha Kuthibari of Rabindranath – Kushtia', 1, NULL, NULL, NULL, 5000),
(77, 'GvAW2NQ', 34, 'Gorai river beside the town', 1, NULL, NULL, NULL, 3500),
(78, 'GvAW2NQ', 33, 'Chapai Gachhi Beel – Kushtia', 1, NULL, NULL, NULL, 5000),
(79, 'A6NZsG5', 34, 'Gorai river beside the town', 1, 0, 0, NULL, 3500),
(80, 'ZNdroCj', 34, 'Gorai river beside the town', 1, NULL, NULL, NULL, 3500),
(81, '7jTWtyh', 38, 'Amiakum Waterfall', 1, NULL, NULL, NULL, 5000),
(83, 'WkDhLQi', 38, 'Amiakum Waterfall', 1, NULL, NULL, NULL, 5000),
(84, 'WkDhLQi', 36, 'River Padma', 1, NULL, NULL, NULL, 2000),
(85, 'WkDhLQi', 33, 'Chapai Gachhi Beel – Kushtia', 1, NULL, NULL, NULL, 5000),
(87, 'VRb2azT', 36, 'River Padma', 1, NULL, NULL, NULL, 2000),
(88, 'VRb2azT', 33, 'Chapai Gachhi Beel – Kushtia', 1, NULL, NULL, NULL, 5000),
(89, '24Y81Je', 33, 'Chapai Gachhi Beel – Kushtia', 1, 4, 3, NULL, 14000);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainid` int(11) DEFAULT NULL,
  `subid` int(11) DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET latin1 NOT NULL,
  `feature_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `mainid`, `subid`, `role`, `name`, `slug`, `feature_image`, `featured`, `status`) VALUES
(49, NULL, NULL, 'main', 'Places', 'places', '1622624643Jhaudia-Shahi-Mosque-Kushtia-5.jpg', 1, 1),
(50, 49, NULL, 'sub', 'Dhaka', 'dhaka', NULL, 0, 1),
(51, 49, 50, 'child', 'Rajbari', 'rajbari', NULL, 0, 1),
(52, 49, 50, 'child', 'Norshingdi', 'norshingdi', NULL, 0, 1),
(53, 49, NULL, 'sub', 'Khulna', 'khulna', '16226273754.jpg', 1, 1),
(54, 49, 53, 'child', 'Kushtia', 'kushtia', NULL, 0, 1),
(56, 49, NULL, 'sub', 'Chittagong', 'Chittagong', NULL, 0, 1),
(57, 49, NULL, 'sub', 'Barisal', 'barisal', NULL, 0, 1),
(58, 49, NULL, 'sub', 'Mymensingh', 'mymensingh', NULL, 0, 1),
(59, 49, NULL, 'sub', 'Rangpur', 'rangpur', NULL, 0, 1),
(60, 49, NULL, 'sub', 'Rajshahi', 'rajshahi', NULL, 0, 1),
(61, 49, NULL, 'sub', 'Sylhet', 'sylhet', NULL, 0, 1),
(62, 49, 53, 'child', 'Bagerhat', 'bagerhat', NULL, 0, 1),
(63, 49, 53, 'child', 'Chuadanga', 'chuadanga', NULL, 0, 1),
(64, 49, 53, 'child', 'Jashore', 'jashore', '', 0, 1),
(65, 49, 53, 'child', 'Jhenaidah', 'jhenaidah', '', 0, 1),
(66, 49, 53, 'child', 'Magura', 'magura', NULL, 0, 1),
(67, 49, 53, 'child', 'Meherpur', 'meherpur', NULL, 0, 1),
(68, 49, 53, 'child', 'Narail', 'narail', NULL, 0, 1),
(69, 49, 53, 'child', 'Satkhira', 'satkhira', NULL, 0, 1),
(70, 49, 56, 'child', 'Bandarban', 'bandarban', NULL, 0, 1),
(71, 49, 56, 'child', 'Brahmanbaria', 'brahmanbaria', NULL, 0, 1),
(72, 49, 56, 'child', 'Chandpur', 'chandpur', NULL, 0, 1),
(73, 49, 56, 'child', 'Cox’s Bazar', 'cox’s-bazar', NULL, 0, 1),
(74, 49, 56, 'child', 'Cumilla', 'cumilla', NULL, 0, 1),
(75, 49, 56, 'child', 'Feni', 'feni', NULL, 0, 1),
(76, 49, 56, 'child', 'Khagrachhari', 'khagrachhari', NULL, 0, 1),
(77, 49, 56, 'child', 'lakshmipur', 'lakshmipur', NULL, 0, 1),
(78, 49, 56, 'child', 'Noakhali', 'noakhali', NULL, 0, 1),
(79, 49, 56, 'child', 'Rangamati', 'rangamati', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `code_scripts`
--

DROP TABLE IF EXISTS `code_scripts`;
CREATE TABLE IF NOT EXISTS `code_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `google_analytics` text NOT NULL,
  `meta_keys` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `code_scripts`
--

INSERT INTO `code_scripts` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<!-- Google Analytics -->\r\n<script>\r\nwindow.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;\r\nga(\'create\', \'UA-XXXXX-Y\', \'auto\');\r\nga(\'send\', \'pageview\');\r\n</script>\r\n<script async src=\'https://www.google-analytics.com/analytics.js\'></script>\r\n<!-- End Google Analytics -->', 'smile world, bootiqo, chicnshop, deals, promotiel, chaussures, vetemens, coutures, homme, femme, fashion, pagne, baoule, traditionnelle');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
CREATE TABLE IF NOT EXISTS `counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `todays_count` int(11) NOT NULL DEFAULT '0',
  `today` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'browser', 'Windows 10', 227, 0, NULL),
(2, 'browser', 'Android', 6, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`) VALUES
(1, 'First FAQ Question?', '<font color=\"#111111\" face=\"Roboto, Arial, sans-serif\"><span style=\"white-space: pre-wrap;\">Welcome to Our Website. It\'s based on tour Agencies. Find you best place and book now.</span></font><span style=\"color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"></span>', 1),
(2, 'First FAQ Question 2?', '<span style=\"color: rgb(17, 17, 17); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap;\">Welcome to Our Website. It\'s based on tour Agencies. Find you best place and book now.</span><br>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_01_212242_create_orders_table', 1),
(5, '2021_07_09_161846_create_tour_programs_table', 2),
(6, '2021_07_28_113606_create_verify_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

DROP TABLE IF EXISTS `ordered_products`;
CREATE TABLE IF NOT EXISTS `ordered_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `owner` enum('vendor','admin') DEFAULT NULL,
  `vendorid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `infant` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `payment` varchar(255) NOT NULL DEFAULT 'completed',
  `paid` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','processing','completed') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordered_products`
--

INSERT INTO `ordered_products` (`id`, `orderid`, `owner`, `vendorid`, `productid`, `quantity`, `children`, `infant`, `cost`, `size`, `payment`, `paid`, `created_at`, `updated_at`, `status`) VALUES
(67, '225', 'admin', NULL, 38, 1, 3, 9, 18500, NULL, 'Pendding', 'no', '2021-07-23 15:51:55', '2021-07-23 15:51:55', 'pending'),
(68, '226', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-07-23 15:54:26', '2021-07-23 15:54:26', 'pending'),
(69, '227', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-07-23 15:55:43', '2021-07-23 15:55:43', 'pending'),
(70, '228', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-23 15:57:29', '2021-07-23 15:57:29', 'pending'),
(71, '228', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-23 15:57:29', '2021-07-23 15:57:29', 'pending'),
(72, '228', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-23 15:57:29', '2021-07-24 13:36:03', 'completed'),
(73, '229', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-23 16:02:35', '2021-07-24 13:37:00', 'completed'),
(74, '229', 'admin', NULL, 36, 1, 3, 4, 10500, NULL, 'completed', 'yes', '2021-07-23 16:02:35', '2021-07-24 13:37:00', 'completed'),
(75, '230', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-23 17:48:35', '2021-07-24 13:36:54', 'completed'),
(76, '231', 'vendor', 14, 33, 1, 2, 3, 11000, NULL, 'completed', 'yes', '2021-07-23 17:51:43', '2021-07-24 13:35:52', 'completed'),
(77, '231', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-23 17:51:43', '2021-07-24 13:36:46', 'completed'),
(78, '232', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-24 13:28:43', '2021-07-24 13:36:36', 'completed'),
(79, '232', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-24 13:28:43', '2021-07-24 13:36:36', 'completed'),
(80, '232', 'vendor', 14, 32, 7, 7, 7, 35000, NULL, 'completed', 'yes', '2021-07-24 13:28:43', '2021-07-24 13:35:33', 'completed'),
(81, '233', 'admin', NULL, 37, 1, 2, 0, 8000, NULL, 'Pendding', 'no', '2021-07-25 09:13:54', '2021-07-25 09:13:54', 'pending'),
(82, '234', 'admin', NULL, 37, 1, 2, 0, 8000, NULL, 'completed', 'yes', '2021-07-25 09:14:55', '2021-07-25 09:14:55', 'pending'),
(83, '235', 'admin', NULL, 36, 1, 0, 0, 2000, NULL, 'Pendding', 'no', '2021-07-25 09:45:29', '2021-07-25 09:45:29', 'pending'),
(84, '236', 'admin', NULL, 36, 1, 0, 0, 2000, NULL, 'Pendding', 'no', '2021-07-25 09:51:59', '2021-07-25 09:51:59', 'pending'),
(85, '237', 'admin', NULL, 36, 1, 0, 0, 2000, NULL, 'completed', 'yes', '2021-07-25 09:56:33', '2021-07-25 09:56:33', 'pending'),
(86, '237', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-25 09:56:33', '2021-07-25 09:56:33', 'pending'),
(87, '238', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-07-25 10:02:05', '2021-07-25 10:02:05', 'pending'),
(88, '239', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-25 10:05:54', '2021-07-25 10:05:54', 'pending'),
(89, '240', 'vendor', 14, 34, 4, 3, 7, 20500, NULL, 'completed', 'yes', '2021-07-25 10:11:57', '2021-07-25 10:11:57', 'pending'),
(90, '241', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-25 10:15:24', '2021-07-25 10:15:24', 'pending'),
(91, '241', 'admin', NULL, 36, 1, 0, 0, 2000, NULL, 'completed', 'yes', '2021-07-25 10:15:24', '2021-07-25 10:15:24', 'pending'),
(92, '241', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-25 10:15:24', '2021-07-25 10:15:24', 'pending'),
(93, '242', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-25 10:23:06', '2021-07-25 10:23:06', 'pending'),
(94, '243', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-25 10:27:06', '2021-07-25 10:27:06', 'pending'),
(95, '244', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-25 11:06:43', '2021-07-25 11:06:43', 'pending'),
(96, '245', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-25 11:13:53', '2021-07-25 11:13:53', 'pending'),
(97, '246', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-07-28 07:22:12', '2021-07-28 07:22:12', 'pending'),
(98, '246', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-07-28 07:22:12', '2021-07-28 07:22:12', 'pending'),
(99, '246', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'Pendding', 'no', '2021-07-28 07:22:12', '2021-07-28 07:22:12', 'pending'),
(100, '246', 'vendor', 14, 33, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-07-28 07:22:12', '2021-07-28 07:22:12', 'pending'),
(101, '247', 'admin', NULL, 37, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-07-28 12:47:14', '2021-07-28 12:47:14', 'pending'),
(102, '248', 'vendor', 14, 34, 1, 1, 2, 5500, NULL, 'Pendding', 'no', '2021-07-28 12:51:51', '2021-07-28 12:51:51', 'pending'),
(103, '249', 'vendor', 14, 34, 1, 1, 2, 5500, NULL, 'completed', 'yes', '2021-07-28 12:51:53', '2021-07-28 12:51:53', 'pending'),
(104, '250', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 04:43:37', '2021-07-30 04:43:37', 'pending'),
(105, '251', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 04:50:03', '2021-07-30 04:50:03', 'pending'),
(106, '252', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 04:51:30', '2021-07-30 04:51:30', 'pending'),
(107, '253', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 05:05:29', '2021-07-30 05:05:29', 'pending'),
(108, '254', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 05:07:32', '2021-07-30 05:07:32', 'pending'),
(109, '255', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'Pendding', 'no', '2021-07-30 05:37:13', '2021-07-30 05:37:13', 'pending'),
(110, '256', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 05:39:12', '2021-07-30 05:39:12', 'pending'),
(111, '257', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 05:39:52', '2021-07-30 05:39:52', 'pending'),
(112, '258', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'Pendding', 'no', '2021-07-30 05:41:39', '2021-07-30 05:41:39', 'pending'),
(113, '259', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'Pendding', 'no', '2021-07-30 05:51:06', '2021-07-30 05:51:06', 'pending'),
(114, '260', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 05:52:22', '2021-07-30 05:52:22', 'pending'),
(115, '261', 'vendor', 14, 34, 1, 0, 0, 3500, NULL, 'completed', 'yes', '2021-07-30 05:55:39', '2021-07-30 05:55:39', 'pending'),
(116, '262', 'admin', NULL, 38, 1, 0, 0, 5000, NULL, 'completed', 'yes', '2021-08-19 16:58:21', '2021-08-19 16:58:21', 'pending'),
(117, '263', 'admin', NULL, 36, 1, 0, 0, 2000, NULL, 'Pendding', 'no', '2021-08-19 17:00:20', '2021-08-19 17:00:20', 'pending'),
(118, '263', 'vendor', 14, 33, 1, 0, 0, 5000, NULL, 'Pendding', 'no', '2021-08-19 17:00:20', '2021-08-19 17:00:20', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NOT NULL,
  `products` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `quantities` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `childs` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `infants` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `customer_zip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET latin1 NOT NULL,
  `txnid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','completed','declined') CHARACTER SET latin1 NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customerid`, `products`, `quantities`, `childs`, `infants`, `customer_city`, `customer_zip`, `customer_name`, `customer_email`, `customer_phone`, `pay_amount`, `payment_status`, `txnid`, `method`, `customer_address`, `currency`, `booking_date`, `status`, `created_at`, `updated_at`) VALUES
(254, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '61038914d52d5', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:07:32', 'pending', NULL, NULL),
(253, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '61038899e7452', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:05:29', 'pending', NULL, NULL),
(252, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '6103855230f15', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 10:51:30', 'pending', NULL, NULL),
(251, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '610384fb18953', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 10:50:03', 'pending', NULL, NULL),
(250, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '61038379085af', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 10:43:37', 'pending', NULL, NULL),
(249, 5, '34', '1', '1,', '2,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '5500', 'completed', '610152e947418', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-28 18:51:53', 'pending', NULL, NULL),
(248, 5, '34', '1', '1,', '2,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '5500', 'Pending', '610152e7c2948', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-28 18:51:51', 'pending', NULL, NULL),
(247, 5, '37', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '5000', 'completed', '610151d20eb6c', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-28 18:47:14', 'pending', NULL, NULL),
(246, 5, '38,37,34,33', '1,1,1,1', '0,0,0,0,', '0,0,0,0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '18500', 'Pending', '610105a49314a', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-28 13:22:12', 'pending', NULL, NULL),
(245, 5, '37', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '5000', 'completed', '60fd4771104f0', 'BKash Mobile Banking', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 17:13:53', 'pending', NULL, NULL),
(244, 6, '34', '1', '0,', '0,', 'mmbm', '6768', 'Md. Sazzadur Rahman', 'saz580@gmail.com', '01786740107', '3500', 'completed', '60fd45c366331', 'Islami Bank Bangladesh Limited', 'jhgjhgjhk', 'BDT', '2021-07-25 17:06:43', 'pending', NULL, NULL),
(243, 6, '37', '1', '0,', '0,', 'mmbm', '6768', 'Md. Sazzadur Rahman', 'saz580@gmail.com', '01786740107', '5000', 'completed', '60fd3c7a5fdaa', 'Nagad', 'jhgjhgjhk', 'BDT', '2021-07-25 16:27:06', 'pending', NULL, NULL),
(242, 6, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'saz580@gmail.com', '01786740107', '3500', 'completed', '60fd3b8a2f1c7', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 16:23:06', 'pending', NULL, NULL),
(241, 6, '37,36,38', '1,1,1', '0,0,0,', '0,0,0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'saz580@gmail.com', '01786740107', '12000', 'completed', '60fd39bc14b76', 'Mutual Trust Banking Limited', 'Sazzadur', 'BDT', '2021-07-25 16:15:24', 'pending', NULL, NULL),
(240, 5, '34', '4', '3,', '7,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '20500', 'completed', '60fd38eda63bd', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 16:11:57', 'pending', NULL, NULL),
(239, 0, '37', '1', '0,', '0,', 'Dhaka', '3480', 'Mehdi Hasan', '12123123@gmail.com', '01786740107', '5000', 'completed', '60fd37820718f', 'Mutual Trust Banking Limited', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 16:05:54', 'pending', NULL, NULL),
(238, 5, '37', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '5000', 'Pending', '60fd369dcb67e', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 16:02:05', 'pending', NULL, NULL),
(237, 5, '36,37', '1,1', '0,0,', '0,0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '7000', 'completed', '60fd35519aa9b', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 15:56:33', 'pending', NULL, NULL),
(236, 5, '36', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '2000', 'Pending', '60fd343f9db48', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 15:51:59', 'pending', NULL, NULL),
(233, 5, '37', '1', '2,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '8000', 'Pending', '60fd2b5260d16', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 15:13:54', 'pending', NULL, NULL),
(234, 5, '37', '1', '2,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '8000', 'completed', '60fd2b8f19959', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 15:14:55', 'pending', NULL, NULL),
(229, 5, '38,36', '1,1', '0,3,', '0,4,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '15500', 'completed', '60fae81bd875f', 'Islami Bank Bangladesh Limited', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-23 22:02:35', 'completed', NULL, NULL),
(235, 5, '36', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '2000', 'Pending', '60fd32b900d1e', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-25 15:45:29', 'pending', NULL, NULL),
(232, 5, '38,37,32', '1,1,7', '0,0,7,', '0,0,7,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '45000', 'completed', '60fc158b512c6', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-24 19:28:43', 'completed', NULL, NULL),
(231, 5, '33,37', '1,1', '2,0,', '3,0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '16000', 'completed', '60fb01af0fd34', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-23 23:51:43', 'completed', NULL, NULL),
(230, 5, '37', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'user@gmail.com', '01786740107', '5000', 'completed', '60fb00f30160a', 'Mutual Trust Banking Limited', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-23 23:48:35', 'completed', NULL, NULL),
(255, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Mehdi Hasan', '12123123@gmail.com', '01786740107', '3500', 'Failed', '61039009d2dc2', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:37:13', 'pending', NULL, NULL),
(256, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Mehdi Hasan', '12123123@gmail.com', '01786740107', '3500', 'completed', '6103908012d87', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:39:12', 'pending', NULL, NULL),
(257, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Mehdi Hasan', '12123123@gmail.com', '01786740107', '3500', 'completed', '610390a85dc23', 'City Bank', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:39:52', 'pending', NULL, NULL),
(258, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Mehdi Hasan', '12123123@gmail.com', '01786740107', '3500', 'Failed', '61039113e8f61', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:41:39', 'pending', NULL, NULL),
(259, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'Failed', '6103934a91e6d', NULL, '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:51:06', 'pending', NULL, NULL),
(260, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '61039396bbb0c', 'Nagad', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:52:22', 'pending', NULL, NULL),
(261, 61, '34', '1', '0,', '0,', 'Dhaka', '3480', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '3500', 'completed', '6103945b65a00', 'Mutual Trust Banking Limited', '97/8 Chairman Goli, Shankar', 'BDT', '2021-07-30 11:55:39', 'pending', NULL, NULL),
(262, 98, '38', '1', '0,', '0,', 'jhjkgjk', 'jhgjhgj', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '5000', 'completed', '611e8dad1c520', 'Nagad', 'jhjkhk', 'BDT', '2021-08-19 22:58:21', 'pending', NULL, NULL),
(263, 98, '36,33', '1,1', '0,0,', '0,0,', 'jhjkgjk', 'jhgjhgj', 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', '01786740107', '7000', 'Failed', '611e8e248260c', NULL, 'jhjkhk', 'BDT', '2021-08-19 23:00:20', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_settings`
--

DROP TABLE IF EXISTS `page_settings`;
CREATE TABLE IF NOT EXISTS `page_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` text CHARACTER SET latin1 NOT NULL,
  `contact_email` text CHARACTER SET latin1 NOT NULL,
  `about` text CHARACTER SET latin1 NOT NULL,
  `faq` text CHARACTER SET latin1 NOT NULL,
  `large_banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_link` text COLLATE utf8_unicode_ci,
  `c_status` int(11) NOT NULL,
  `a_status` int(11) NOT NULL,
  `f_status` int(11) NOT NULL,
  `slider_status` int(11) NOT NULL DEFAULT '1',
  `category_status` int(11) NOT NULL DEFAULT '1',
  `sbanner_status` int(11) NOT NULL DEFAULT '1',
  `latestpro_status` int(11) NOT NULL DEFAULT '1',
  `featuredpro_status` int(11) NOT NULL DEFAULT '1',
  `lbanner_status` int(11) NOT NULL DEFAULT '1',
  `popularpro_status` int(11) NOT NULL DEFAULT '1',
  `blogs_status` int(11) NOT NULL DEFAULT '1',
  `brands_status` int(11) NOT NULL DEFAULT '1',
  `testimonial_status` int(11) NOT NULL DEFAULT '1',
  `subscribe_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `page_settings`
--

INSERT INTO `page_settings` (`id`, `contact`, `contact_email`, `about`, `faq`, `large_banner`, `banner_link`, `c_status`, `a_status`, `f_status`, `slider_status`, `category_status`, `sbanner_status`, `latestpro_status`, `featuredpro_status`, `lbanner_status`, `popularpro_status`, `blogs_status`, `brands_status`, `testimonial_status`, `subscribe_status`) VALUES
(1, 'Thanks for visiting our Bestours. Have you any question?\r\nContact with Us..', 'sazzadurrahman580@gmail.com', '<h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px; color: rgb(0, 0, 0);\">What is Lorem Ipsum?</h2><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\"><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><br></p></h2><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px; color: rgb(0, 0, 0);\">Where does it come from?</h2><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\"><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></h2>', '<h2>Contact US</h2>', '16215090841619721968nilgiri-slide_1-2020-06-08-5eddca6e0e9dc.jpeg', 'https://www.facebook.com/GeniusOcean/', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_locations`
--

DROP TABLE IF EXISTS `pickup_locations`;
CREATE TABLE IF NOT EXISTS `pickup_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickup_locations`
--

INSERT INTO `pickup_locations` (`id`, `address`, `status`) VALUES
(2, 'Test Pickup Addresss', 1),
(3, 'Another Address', 1),
(4, 'Another address 2', 1),
(5, 'Test Pickup Addresss 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorid` int(11) DEFAULT NULL,
  `owner` enum('admin','vendor') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` float NOT NULL,
  `CHprice` int(11) NOT NULL,
  `INprice` int(11) NOT NULL,
  `previous_price` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `feature_image` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `policy` text COLLATE utf8_unicode_ci,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `approved` enum('no','yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendorid`, `owner`, `title`, `category`, `description`, `price`, `CHprice`, `INprice`, `previous_price`, `stock`, `feature_image`, `policy`, `tags`, `featured`, `views`, `approved`, `created_at`, `updated_at`, `status`, `startDate`, `endDate`) VALUES
(31, 14, 'vendor', 'A Christian Cemetery in Kushtia', '49,53,54', '<div>This Christian cemetery is a different kind of place which wasn’t in my list during visiting Kushtia. After returning from the Jhaudia Shahi Mosque I found this christian cemetery just before the Mojompur bus stoppage. I like to be around the old graves. So decided to peep inside for a while. I don’t know much detail about this cemetery.</div><div><br></div><div>The main entrance of the cemetery was locked from inside. There was a small house inside the cemetery premise where the caretaker uses to live with his family (my guess). I saw a lady aged 20-22 was inside the house. She came out when I knocked the door. I requested her to allow me to enter inside the cemetery. At first she wasn’t interested to do so, but couldn’t resist my persistent request.</div><div><br></div><div>This Christin cemetery is not that much large, but still this one is profound with some collection of old graves. For example a grave of Jone Elizabeth Cowley, which is around 106 years of old. There are two graves where two young men buried. One of them who died at the age of 25, around 140 years back, and another one died at 36, which is around 125 years back. There were nice writing on the epitaph of those graves which are really heart touching. People left their beloved person here, and din’t know what would happen few hundred years after. Will there be anyone who would put a bunch of flowers over the grave then? I don’t know. No one knows.</div><div><br></div><div>Christian Cemetery,</div><div>Kushtia Sadar,</div><div>District: Kushtia,</div><div>Country: Bangladesh,</div><div>GPS coordinate (23°54’21.4″N, 89°07’12.8″E).</div>', 3000, 1500, 1000, NULL, 49, '1622645914Chapai-Gachhi-Beel-Kushtia-1.jpg', '<ol><li>National ID Card</li></ol>', 'One,Tow', 0, 2, 'yes', '2021-06-02 14:58:34', '2021-07-16 13:47:20', 1, '2021-06-11', '2021-06-14'),
(32, 14, 'vendor', 'A Mughal style mosque in Jhaudia', '49,53,54', '<div>Jhaudia Shahi Mosque (also Jhaudiya Mosque) is an old mosque that is located in Kushtia district of Bangladesh. It is unknown about when the mosque was built. But from the structure of the mosque which gives similarity with other known mosques from Bangladesh gives a hint that it would be more than 250 years of old mosque. Although the mosque had gone through several renovations and lost most of its antiquity. This is mainly a rectangular shaped mosque having a dimension approximately 16m x 6m. The mosque has a three dome atop and having three entrances from the eastern side. Read more about the mosque from Banglapedia.</div><div><br></div><div>Jhaudia Shahi Mosque,</div><div>Jhaudia,</div><div>District: Kushtia,</div><div>Country: Bangladesh,</div><div>GPS Coordinate (23°46’29.7″N, 89°03’18.7″E).</div>', 3500, 1000, 500, 5000, 41, '1622646109Jhaudia-Shahi-Mosque-Kushtia-1.jpg', '<ol><li>National ID Card</li></ol>', NULL, 0, 5, 'yes', '2021-06-02 15:01:49', '2021-07-24 13:28:43', 1, '2021-06-23', '2021-06-26'),
(33, 14, 'vendor', 'Chapai Gachhi Beel – Kushtia', '49,53,54', '<div>Jhaudia is an attractive place for the travelers if they want to do something different. There is a wetlands named Chapai Gachhi Beel (not sure may be this one known as Jhaudia beel) located there. Local people also call this wetland as Nainda Majhi Para Beel (or Nandia). This is just around 5-10 minutes of rickshaw rides from Jhaudia Shahi mosque. This is a nice natural place to explore during winter, rainy season, or summer. It is a nice meeting point of several rivers and canals</div><div><br></div><div>This is not listed at anywhere for the travelers. But this spot caught my eyes when I saw the map. I found an arc shaped area inside the map where 5 river or something like that joined together. So I planned to visit the place to see and know what actually the place is. You can find the map in above image, and I have marked the area with a black rectangle.</div><div><br></div><div>Chapai Gachhi Beel (or Jhaudia Beel),</div><div>Jhaudia,</div><div>District: Kushtia,</div><div>Country: Bangladesh,</div><div>GPS coordinate (23°47’21.5″N, 89°02’28.1″E).</div>', 5000, 1500, 1000, 5500, 14, '1622646261Chapai-Gachhi-Beel-Kushtia-1 (1).jpg', '<ol><li>National ID Card</li></ol>', NULL, 1, 20, 'yes', '2021-06-02 15:04:22', '2021-10-05 10:05:50', 1, '2021-06-10', '2021-06-11'),
(34, 14, 'vendor', 'Gorai river beside the town', '49,53,54', '<div>Gorai is the second biggest river from Kushtia district after river Padma. The main town of the Kushtia district is situated by this river Gorai. This river originated from the Padma river in Kushtia. Throughout the Kushtia this is known as Gorai river. But after that this is known as Madhumati river for a while and then before falling into Bay of Bengal it is Baleswar river. In current days the condition of the river is not good as during dry season you could see barely any water in it. In fact anyone could cross the river by walking and even without wetting their feet</div><div>After visiting the Lalon Akhra and the house of Mir Mosharraf Hossain I was heading towards the Kuthi bari mela of Shelaidah, which was arranged to commemorate the 149th birthday of the royal poet Rabindranath tagore. On my way I took a pause near the Gorai bridge, which is also known as Mir Mosharaf Hossain Birdge. There are two bridges over the Gorai river, one for the train and another one for the buses and other vehicles. This bridge connects the Kumarkhali upazela with the main district town.</div><div>It was very dry season and I found it was really hard to find any sign of water in Gorai river. After the river Padma, Gorai is the second largest river in the Kushtia district. During the rainy season river Gorai is a ferocious one. This is noticeably wide to proclaim as a giant river. Instead of the water I had to explore a river full of white sand at the middle of the river. I wandered around the river for a while. But it was quite a difficult task due to the hot Bangladeshi summer weather. Later I walked over the Gorai bridge to cross it on foot.</div><div>I’m not sure about the length of the bridge. But it took several minutes to cross the bridge. Also after exploring the sandy river I was almost tired. People were moving towards the Kuthi bari mela of Shelaidah, and every single vehicle was packed with tons of people. So I found it hard to manage any public vehicle for a while, until a Nosimon (a fancy local name) came and rescued me from the odd situation.</div>', 3500, 1000, 500, 5000, 4, '1622646549river-gorai-and-bridge-1.jpg', '<ol><li>National ID Card</li></ol>', 'One,Two', 1, 31, 'yes', '2021-06-02 15:09:10', '2021-07-30 05:55:39', 1, '2021-06-09', '2021-06-11'),
(35, NULL, 'admin', 'Jugia Tati Para – Kushtia', '49,53,54', '<div>In Bangladesh we have several districts which are famous for producing cloths using handlooms. Kushtia is one of those. This district is famous for producing finely knitted Gamchha, Lungi, and Shari using handlooms. Jugia is a village near from the Kushtia town which still has several families are using handloom to produce cloths. This unique craft work is diminishing after having a vie with the mechanical industries. That’s why wanted to visit how they do it before it vanishes for ever.</div><div><br></div><div>How to Go:</div><div>The village name is Jugia. It took around 20 Taka van fare (a three wheeler similar to rickshaw) from the Mojompur bus station. It took around 20-30 minutes to reach that village. The villagers were interested to know why I was there. I explained them about my purpose of visit. They were really surprised and happy to know that someone could come to their village to see this.</div><div><br></div><div>Jugia Tati Para (Jugia Tat Palli),</div><div>Village: Jugia,</div><div>District: Kushtia,</div><div>Country: Bangladesh,</div><div>GPS Coordinate (23°55’53.8″N, 89°06’12.3″E).</div>', 5000, 1500, 1000, 5500, 0, '1622646776Jugia-Tati-Para-Kushtia-3.jpg', '<div><br></div>', NULL, 1, 19, 'yes', '2021-06-02 15:12:57', '2021-07-18 17:07:18', 1, '2021-06-03', '2021-06-04'),
(36, NULL, 'admin', 'River Padma', '49,53,54', '<div>Padma is a giant river from Bangladesh. This river is flowing beside several districts in Bangladesh like Rajshahi, Pabna, Kushtia, Faridpur, etc. Since I was in Kushtia and the river was just few kilometers from the Kuthibari Mela, that’s why I didn’t miss the chance to visit the river again. After the first phase of the Mela at Kuthibari of Shilaidaho, I visited the river Padma. And then returned back to the Mela area for second phase.</div><div><br></div><div>It took only 5 Taka fare of three-wheeler van ride to reach near the river bank of the Padma. It was during the month of May, at the peak of the summer. The river was very calm and lacked of water. In fact at the middle of the river it had several submerged islands which created due to lack of flow in dry season. Other side of the river is Pabna district. There were several boats at the bank of the river which would sail for that in shortly.</div><div><br></div><div>Lot of fishing boats were moving in the river to catch fish. This river is famous for the national fish Ilish. Although it in current days it is rare to catch Ilish in river Padma. During the dry season this river lost its beauty as well as strength. But still it’s wide enough but there are noticeable number of islands under the water can easily be seen where people were standing.</div><div><br></div><div>There were a lot of people at the bank of the river for the afternoon shower. The bank was a straight one like a mini beach. Only thing was missing the waves. I had a short swim and bath in the river there. The water was very shallow there. Water level went barely above my chest height. After a long day of hot summer it was really a nice experience to do swimming in a river. Although during rainy season I wouldn’t dare to do that in the same river as it would be much ferocious that time.</div>', 2000, 1500, 1000, 5500, 27, '1622647114023f3b634e39bfc1b6ed8a1a840c01c2.0.jpg', '<ol><li>National ID Card</li></ol>', NULL, 1, 10, 'yes', '2021-06-02 15:18:34', '2021-08-19 17:00:20', 1, '2021-06-03', '2021-06-03'),
(37, NULL, 'admin', 'Shilaidaha Kuthibari of Rabindranath – Kushtia', '49,53,54', '<div>Padma is a giant river from Bangladesh. This river is flowing beside several districts in Bangladesh like Rajshahi, Pabna, Kushtia, Faridpur, etc. Since I was in Kushtia and the river was just few kilometers from the Kuthibari Mela, that’s why I didn’t miss the chance to visit the river again. After the first phase of the Mela at Kuthibari of Shilaidaho, I visited the river Padma. And then returned back to the Mela area for second phase.</div><div><br></div><div>It took only 5 Taka fare of three-wheeler van ride to reach near the river bank of the Padma. It was during the month of May, at the peak of the summer. The river was very calm and lacked of water. In fact at the middle of the river it had several submerged islands which created due to lack of flow in dry season. Other side of the river is Pabna district. There were several boats at the bank of the river which would sail for that in shortly.</div><div><br></div><div>Lot of fishing boats were moving in the river to catch fish. This river is famous for the national fish Ilish. Although it in current days it is rare to catch Ilish in river Padma. During the dry season this river lost its beauty as well as strength. But still it’s wide enough but there are noticeable number of islands under the water can easily be seen where people were standing.</div><div><br></div><div>There were a lot of people at the bank of the river for the afternoon shower. The bank was a straight one like a mini beach. Only thing was missing the waves. I had a short swim and bath in the river there. The water was very shallow there. Water level went barely above my chest height. After a long day of hot summer it was really a nice experience to do swimming in a river. Although during rainy season I wouldn’t dare to do that in the same river as it would be much ferocious that time.</div>', 5000, 1500, 1000, NULL, 0, '1622647249Shilaidaha-Kuthibari-kushtia-2.jpg', '<br>', NULL, 1, 21, 'yes', '2021-06-02 15:20:49', '2021-10-05 10:05:20', 1, '2021-06-04', '2021-06-04'),
(38, NULL, 'admin', 'Amiakum Waterfall', '49,56,70', 'hello', 5000, 1500, 1000, 5500, 15, '16227007471.jpg', '<ol><li><u><i>National Id Card</i></u></li></ol>', NULL, 1, 44, 'yes', '2021-06-03 06:12:29', '2021-08-19 16:58:21', 1, '2021-06-04', '2021-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

DROP TABLE IF EXISTS `product_gallery`;
CREATE TABLE IF NOT EXISTS `product_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`id`, `productid`, `image`) VALUES
(1, 26, 'br150028710072d783df472ec91220ca7714adf113c6.jpg'),
(2, 26, 'tq1500287100E1F.jpg'),
(3, 25, 'B71510210868demo (1).jpg'),
(4, 25, '3t1510210868demo (2).jpg'),
(5, 25, '0W1510210868demo (3).jpg'),
(6, 25, 'ol1510210868demo (4).jpg'),
(7, 22, 'P91510210887demo (1).jpg'),
(8, 22, 'JB1510210887demo (2).jpg'),
(9, 22, '5I1510210887demo (3).jpg'),
(10, 22, 'hO1510210887demo (4).jpg'),
(11, 20, 'sx15102115136.jpg'),
(12, 20, 'jc1510211513demo (1).jpg'),
(13, 20, 'Lb1510211513demo (2).jpg'),
(14, 20, 'LD1510211513demo (3).jpg'),
(15, 28, 'jT1619466884pexels-osama-alzubaidi-3811441.jpg'),
(16, 28, 'tb1619466884pexels-ruvim-miksanskiy-1438761.jpg'),
(17, 28, 'YE1619466884pexels-skitterphoto-735787.jpg'),
(18, 28, 'rg1619466884pexels-zakaria-boumliha-2827374.jpg'),
(24, 30, 'vw1619764430pexels-osama-alzubaidi-3811441 - Copy.jpg'),
(25, 30, 'Q41619764430pexels-ruvim-miksanskiy-1438761 - Copy.jpg'),
(26, 30, '831619764431pexels-skitterphoto-735787.jpg'),
(27, 29, 'x81620246630Chapai-Gachhi-Beel-Kushtia-1.jpg'),
(28, 29, 'TQ1620246630Christian-Cemetery-Kushtia-1.jpg'),
(29, 29, 'd71620246631Christian-Cemetery-Kushtia-2.jpg'),
(30, 29, 'fN1620246631Christian-Cemetery-Kushtia-3.jpg'),
(31, 29, '8l1620246632Christian-Cemetery-Kushtia-4.jpg'),
(32, 32, 'P016208086861619721968nilgiri-slide_1-2020-06-08-5eddca6e0e9dc.jpeg'),
(33, 32, 'UY16208086861619722829nafakhum-slide_3-2020-06-15-5ee779d852f1f.jpg'),
(34, 32, 'aT16208086861620246629Christian-Cemetery-Kushtia-1.jpg'),
(35, 32, 'SO16208086861620324042Jhaudia-Shahi-Mosque-Kushtia-5.jpg'),
(36, 31, '5R1622645914Christian-Cemetery-Kushtia-1.jpg'),
(37, 31, 'qw1622645915Christian-Cemetery-Kushtia-2.jpg'),
(38, 31, 'QC1622645915Christian-Cemetery-Kushtia-3.jpg'),
(39, 31, '4p1622645916Christian-Cemetery-Kushtia-4.jpg'),
(40, 32, 'aY1622646109Jhaudia-Shahi-Mosque-Kushtia-1.jpg'),
(41, 32, 'Mv1622646110Jhaudia-Shahi-Mosque-Kushtia-2.jpg'),
(42, 32, 'fw1622646110Jhaudia-Shahi-Mosque-Kushtia-4.jpg'),
(43, 32, 'Z41622646111Jhaudia-Shahi-Mosque-Kushtia-5.jpg'),
(44, 33, 'R21622646262Chapai-Gachhi-Beel-Kushtia-1 (1).jpg'),
(45, 33, 'VC1622646262Chapai-Gachhi-Beel-Kushtia-2.jpg'),
(46, 33, 'hx1622646262Chapai-Gachhi-Beel-Kushtia-3.jpg'),
(47, 33, 'iG1622646263Chapai-Gachhi-Beel-Kushtia-4.jpg'),
(48, 33, 'BU1622646263Chapai-Gachhi-Beel-Kushtia-5.jpg'),
(49, 34, 'RE1622646550river-gorai-and-bridge-1.jpg'),
(50, 34, '9N1622646550river-gorai-and-bridge-2.jpg'),
(51, 34, 'xq1622646551river-gorai-and-bridge-3.jpg'),
(52, 34, 'Gz1622646551river-gorai-and-bridge-4.jpg'),
(53, 34, 'z11622646551river-gorai-and-bridge-5.jpg'),
(54, 34, '591622646552river-gorai-and-bridge-6.jpg'),
(55, 34, 'aX1622646552river-gorai-and-bridge-7.jpg'),
(56, 34, 'F31622646553river-gorai-and-bridge-8.jpg'),
(57, 35, '2s1622646777Jugia-Tati-Para-Kushtia-1.jpg'),
(58, 35, 'oP1622646777Jugia-Tati-Para-Kushtia-2.jpg'),
(59, 35, '7R1622646778Jugia-Tati-Para-Kushtia-3.jpg'),
(60, 35, '711622646778Jugia-Tati-Para-Kushtia-5.jpg'),
(61, 36, 'l81622647114023f3b634e39bfc1b6ed8a1a840c01c2.0.jpg'),
(62, 36, 'O21622647115bangladesh-3673378_1920-1140x470.jpg'),
(63, 36, '8x1622647115IMG_3169-725x483.jpg'),
(64, 36, 'fQ1622647116Padma-River-bank1.jpg'),
(65, 36, '2s1622647116padma-river-bank-now-attractive-tourist-spot-in-rajshahi-1613308297804.jpg'),
(66, 36, 'zP1622647117xesd2ci7fr961.jpg'),
(67, 37, 'eP1622647250Shilaidaha-Kuthibari-kushtia-1.jpg'),
(68, 37, '871622647250Shilaidaha-Kuthibari-kushtia-2.jpg'),
(69, 37, 'ug1622647250Shilaidaha-Kuthibari-kushtia-4.jpg'),
(70, 37, 'JB1622647251Shilaidaha-Kuthibari-kushtia-8.jpg'),
(71, 37, '0v1622647251Shilaidaha-Kuthibari-kushtia-9.jpg'),
(72, 38, 'wU16227007491.jpg'),
(73, 38, 'o716227007502.jpg'),
(74, 38, 'Zq16227007503.jpg'),
(75, 38, 'cx16227007504.jpg'),
(76, 38, '3Z16227007515.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `review` text,
  `rating` int(11) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `productid`, `name`, `email`, `review`, `rating`, `review_date`) VALUES
(1, 28, 'Md. Sazzadur Rahman', 'webhunterbds@gmail.com', '12345667', 5, '2021-04-27 18:49:55'),
(2, 28, 'Md. Sazzadur Rahman', 'demo@example.com', 'hello', 5, '2021-04-27 18:50:25'),
(3, 28, 'Md. Sazzadur Rahman', 'saz@gmail.com', 'erfwef', NULL, '2021-04-27 19:08:58'),
(4, 29, 'Md. Sazzadur Rahman', 'admin@gmail.com', 'Awesoem', 5, '2021-04-30 06:03:50'),
(5, 29, 'Mountain Biking', 'vendor@gmail.com', 'wewr', 3, '2021-04-30 06:04:09'),
(6, 29, 'WE', 'user@gmail.com', 'edsfrwewerw', 1, '2021-04-30 06:04:35'),
(7, 30, 'dfd', 'demo@example.com', 'dssd', 5, '2021-04-30 07:07:11'),
(8, 30, 'Md. Sazzadur Rahman', 'webhunterbds@gmail.com', 'fdgdfgdfgf', 3, '2021-04-30 07:10:20'),
(9, 30, 'Md. Sazzadur Rahman', 'saz@gmail.com', 'Very Good', 2, '2021-04-30 09:21:52'),
(10, 33, 'Md. Sazzadur Rahman', 'sazzadurrahman580@gmail.com', 'khlhlkhkhkl', 5, '2021-05-21 03:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `section_titles`
--

DROP TABLE IF EXISTS `section_titles`;
CREATE TABLE IF NOT EXISTS `section_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_text` mediumtext COLLATE utf8_unicode_ci,
  `pricing_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pricing_text` mediumtext COLLATE utf8_unicode_ci,
  `portfolio_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portfolio_text` mediumtext COLLATE utf8_unicode_ci,
  `testimonial_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `testimonial_text` mediumtext COLLATE utf8_unicode_ci,
  `team_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_text` text COLLATE utf8_unicode_ci,
  `blog_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `section_titles`
--

INSERT INTO `section_titles` (`id`, `service_title`, `service_text`, `pricing_title`, `pricing_text`, `portfolio_title`, `portfolio_text`, `testimonial_title`, `testimonial_text`, `team_title`, `team_text`, `blog_title`, `blog_text`) VALUES
(1, 'Our Services', 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'Pricing Plans', 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'Latest Projects', 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'Customer Reviews', 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'Our Team', 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'Our Recent Blog', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_section`
--

DROP TABLE IF EXISTS `service_section`;
CREATE TABLE IF NOT EXISTS `service_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `text` text CHARACTER SET latin1 NOT NULL,
  `icon` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_section`
--

INSERT INTO `service_section` (`id`, `title`, `text`, `icon`, `status`) VALUES
(2, 'Service Name Here', 'Lorem Ipsum is simply dummy text of the printing and typeseatting industry. Lorem Ipsum has been the industry\'s', 'jz52.jpg', 1),
(3, 'Service Name Here', 'Lorem Ipsum is simply dummy text of the printing and typeseatting industry. Lorem Ipsum has been the industry\'s', '4rY3.jpg', 1),
(4, 'Service Name Here', 'Lorem Ipsum is simply dummy text of the printing and typeseatting industry. Lorem Ipsum has been the industry\'s', 'BfMUntitled-1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `about` text CHARACTER SET latin1 NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(50) CHARACTER SET latin1 NOT NULL,
  `fax` varchar(50) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `footer` varchar(255) CHARACTER SET latin1 NOT NULL,
  `background` varchar(255) CHARACTER SET latin1 NOT NULL,
  `theme_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `withdraw_fee` float NOT NULL DEFAULT '0',
  `withdraw_charge` float NOT NULL DEFAULT '0',
  `paypal_business` varchar(255) CHARACTER SET latin1 NOT NULL,
  `shipping_cost` float DEFAULT '0',
  `stripe_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_money` text COLLATE utf8_unicode_ci,
  `bank_wire` text COLLATE utf8_unicode_ci,
  `dynamic_commission` float NOT NULL DEFAULT '0',
  `tax` float NOT NULL DEFAULT '0',
  `fixed_commission` float NOT NULL DEFAULT '0',
  `currency_sign` varchar(255) COLLATE utf8_unicode_ci DEFAULT '$',
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `popular_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_file` varchar(255) CHARACTER SET latin1 NOT NULL,
  `stripe_status` int(11) NOT NULL DEFAULT '1',
  `paypal_status` int(11) NOT NULL DEFAULT '1',
  `mobile_status` int(11) NOT NULL DEFAULT '1',
  `bank_status` int(11) NOT NULL DEFAULT '1',
  `cash_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `title`, `url`, `about`, `address`, `phone`, `fax`, `email`, `footer`, `background`, `theme_color`, `withdraw_fee`, `withdraw_charge`, `paypal_business`, `shipping_cost`, `stripe_key`, `stripe_secret`, `mobile_money`, `bank_wire`, `dynamic_commission`, `tax`, `fixed_commission`, `currency_sign`, `currency_code`, `popular_tags`, `css_file`, `stripe_status`, `paypal_status`, `mobile_status`, `bank_status`, `cash_status`) VALUES
(1, '209975818_139263631626936_1.png', 'wrd only 1.png', 'StromTravel-The Multivendor Tour Booking', 'Fuckcccccc', 'Bootiqo est un produit de Smile World International, entreprise basee en Cote D\'Ivoire et specialise dans le e-commerce, solution de paiement en et le Multi-Level Marketing', '97/8 Chairman Goli, Shankar', '01786740107', '455656446646', 'sazzadurrahman580@gmail.com', '<font face=\"impact\">COPYRIGHT 2021 Md.SazzadurRahman</font><a href=\"http://geniusocean.com\"><br></a>', 'smm-min2.jpg', '#3d96ba', 0, 10, '', 0, 'pk_test_bD5Si0msHNV75sd5R71jSJFb', 'sk_test_r7zxASOuYYCiuT3svkUtuh6W', 'Faites vos depots sur les numero suivant 42784249 / 78939896 / 04835863', 'Compte Bancaire', 0, 0, 0, 'TK', 'tk', 'Adventure Travel,Business Travel,Solo Travel,Travel With Friends,Family Travel,Luxury Travel', 'genius1.css', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_language`
--

DROP TABLE IF EXISTS `site_language`;
CREATE TABLE IF NOT EXISTS `site_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_us` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_us` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `faq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `my_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `my_cart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_cart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `continue_shopping` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proceed_to_checkout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `empty_cart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtotal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_to_cart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_of_stock` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviews` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_products` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_policy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_review` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `write_a_review` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscribe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_to_cart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `share_in_social` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_products` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latest_products` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `popular_products` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_us_today` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_option` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `all_categories` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `load_more` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_by_latest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_by_oldest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_by_highest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_by_lowest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enter_shipping` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_now` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dashboard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_as` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_in` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `popular_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latest_blogs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_links` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quick_review` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_another` text COLLATE utf8_unicode_ci,
  `pickup_details` text COLLATE utf8_unicode_ci,
  `logout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `site_language`
--

INSERT INTO `site_language` (`id`, `home`, `about_us`, `contact_us`, `faq`, `search`, `vendor`, `my_account`, `my_cart`, `view_cart`, `checkout`, `continue_shopping`, `proceed_to_checkout`, `empty_cart`, `product_name`, `unit_price`, `subtotal`, `total`, `quantity`, `add_to_cart`, `out_of_stock`, `available`, `reviews`, `related_products`, `return_policy`, `no_review`, `write_a_review`, `subscription`, `subscribe`, `address`, `added_to_cart`, `description`, `share_in_social`, `top_category`, `featured_products`, `latest_products`, `popular_products`, `search_result`, `no_result`, `contact_us_today`, `filter_option`, `all_categories`, `load_more`, `sort_by_latest`, `sort_by_oldest`, `sort_by_highest`, `sort_by_lowest`, `street_address`, `phone`, `email`, `fax`, `submit`, `name`, `review_details`, `enter_shipping`, `order_details`, `shipping_cost`, `order_now`, `dashboard`, `update_profile`, `change_password`, `login_as`, `sign_in`, `popular_tags`, `latest_blogs`, `footer_links`, `view_details`, `quick_review`, `blog`, `ship_to_another`, `pickup_details`, `logout`) VALUES
(1, 'Home', 'About Us', 'Contact Us', 'FAQ', 'Search', 'Vendor', 'My Account', 'My Cart', 'View Cart', 'Checkout', 'Continue Shopping', 'Proceed To Checkout', 'Your Cart is Empty.', 'Tour Name', 'Price Per Person', 'SubTotal', 'Total', 'Quantity', 'Add To Cart', 'No Seat Available', 'Available Seat', 'Reviews', 'You May Also Like', 'Requirements', 'No Review', 'Write A Review', 'Subscription', 'Subscribe', 'Address', 'Successfully Added To Cart', 'Description', 'Share in Social', 'TOP LOCATIONS', 'OUR TOP FEATURED TOURS', 'OUR LEATEST TOURS', 'POPULAR TOURS', 'Search Result', 'No Tour Found', 'Contact Us Today!', 'Filter Option', 'All LOCATIONS', 'Load More', 'Sort By Latest TOURS', 'Sort By Oldest TOURS', 'Sort By Highest Price', 'Sort By Lowest Price', 'Street Address', 'Phone', 'E-mail', 'Fax', 'SEND', 'Name', 'Review Details', 'Enter Shipping Details', 'Booking Details', 'Shipping Cost', 'Book Now', NULL, NULL, NULL, NULL, 'Sign In', 'Popular Tags', 'Latest Blogs', 'Footer Links', 'View Details', 'Quick Review', 'Blog', 'Ship to a Different Address?', 'Pickup From The Location you Selected', 'Logout');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `text_position` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `text`, `image`, `text_position`, `status`) VALUES
(3, 'This is Slider 1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'pZBpexels-osama-alzubaidi-3811441 - Copy.jpg', 'slide_style_left', 1),
(4, 'Guided Tours to Fit Any Time or Budget', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'pev1619721968nilgiri-slide_1-2020-06-08-5eddca6e0e9dc.jpeg', 'slide_style_center', 1),
(5, 'Explore a history, person, time or place', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'UgU1620324042Jhaudia-Shahi-Mosque-Kushtia-5.jpg', 'slide_style_right', 1),
(6, 'Travel With BesTours Across the Globe', 'Travel With BesTours Across the Globe', 'Etspexels-ekrulila-2418672.jpg', 'slide_style_center', 1),
(7, 'GET A better travel', 'hello there is the best travel site', '6Dvpexels-skitterphoto-735787 - Copy.jpg', 'slide_style_center', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
CREATE TABLE IF NOT EXISTS `social_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(255) NOT NULL,
  `twiter` varchar(255) NOT NULL,
  `g_plus` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `f_status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `t_status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `g_status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `link_status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `facebook`, `twiter`, `g_plus`, `linkedin`, `f_status`, `t_status`, `g_status`, `link_status`) VALUES
(1, 'http://facebook.com/ebangladesh', 'http://twitter.com/', 'http://google.com/', 'http://linkedin.com/', 'enable', 'enable', 'enable', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `email`) VALUES
(1, 'webhunterbds@gmail.com'),
(2, 'admin@gmail.com'),
(3, 'saz@gmail.com'),
(4, 'sazzadurrahman580@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review` text CHARACTER SET latin1 NOT NULL,
  `client` varchar(255) CHARACTER SET latin1 NOT NULL,
  `designation` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `review`, `client`, `designation`) VALUES
(1, 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'eBangladesh', 'Project Manager'),
(2, 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'The Usual Suspects', 'Owner'),
(3, 'In publishing and graphic design, lorem ipsum is a filler text commonly used to demonstrate the graphic elements of a document or visual presentation.', 'The Usual Suspects', 'Owner');

-- --------------------------------------------------------

--
-- Table structure for table `tour_programs`
--

DROP TABLE IF EXISTS `tour_programs`;
CREATE TABLE IF NOT EXISTS `tour_programs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `describe` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tour_programs`
--

INSERT INTO `tour_programs` (`id`, `title`, `product_id`, `time`, `duration`, `describe`, `created_at`, `updated_at`) VALUES
(19, '', 35, 'asla', 'kf', '<i><b>dif&nbsp;</b></i>', '2021-07-10 04:15:14', '2021-07-10 04:15:14'),
(21, '', 35, 'sd', 'sd', 'sd', '2021-07-13 01:16:42', '2021-07-13 01:16:42'),
(29, 'Sonar Ga', 38, 'Day 1', '3hours', 'Sonargaon (Bengali: সোনারগাঁও; pronounced as Show-naar-gaa;[1] meaning Golden Hamlet) is a historic city in central Bangladesh. It corresponds to the Sonargaon Upazila of Narayanganj District in Dhaka Division.\r\n\r\nSonargaon is one of the old capitals of the historic region of Bengal and was an administrative center of eastern Bengal. It was also a river port. Its hinterland was the center of the muslin trade in Bengal, with a large population of weavers and artisans. According to ancient Greek and Roman accounts, an emporium was located in this hinterland, which archaeologists have identified with the Wari-Bateshwar ruins. The area was a base for the Vanga, Samatata, Sena, and Deva dynasties.', '2021-07-13 09:20:47', '2021-07-13 09:20:47'),
(30, 'Savar City Univercity', 38, 'Day 2', '3 hours', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo cupiditate cum sint, dicta id modi voluptatem aut temporibus perferendis assumenda optio accusantium incidunt error laudantium nihil possimus nostrum aliquam vel.', '2021-07-13 10:05:41', '2021-07-13 10:05:41'),
(31, 'Pantho path city cumpas', 38, 'Day 3', '3 hours', 'dfmnm,dfnm,ndf,mg', '2021-07-13 10:15:34', '2021-07-13 10:15:34'),
(37, 'Pantho path city cumpas', 33, 'Day 3', '1hours', 'HTML Reference\r\nCSS Reference\r\nJavaScript Reference\r\nSQL Reference\r\nPython Reference\r\nW3.CSS Reference\r\nBootstrap Reference\r\nPHP Reference\r\nHTML Colors\r\nJava Reference\r\nAngular Reference\r\njQuery Reference', '2021-07-13 14:07:07', '2021-07-13 14:07:07'),
(35, 'Savar City Univercity', 33, 'Day 1', '3 hours', 'HTML Reference\r\nCSS Reference\r\nJavaScript Reference\r\nSQL Reference\r\nPython Reference\r\nW3.CSS Reference\r\nBootstrap Reference\r\nPHP Reference\r\nHTML Colors\r\nJava Reference\r\nAngular Reference\r\njQuery Reference', '2021-07-13 14:05:35', '2021-07-13 14:05:35'),
(36, 'Dj party', 33, '9.30pm', '5hours', 'HTML Reference\r\nCSS Reference\r\nJavaScript Reference\r\nSQL Reference\r\nPython Reference\r\nW3.CSS Reference\r\nBootstrap Reference\r\nPHP Reference\r\nHTML Colors\r\nJava Reference\r\nAngular Reference\r\njQuery Reference', '2021-07-13 14:07:07', '2021-07-13 14:07:07'),
(38, 'Savar City Univercity', 34, 'Day 1', '3hours', 'dlallak', '2021-07-14 07:45:24', '2021-07-14 07:45:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `email_verified_at` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `name`, `gender`, `phone`, `fax`, `email`, `password`, `address`, `city`, `zip`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(98, 'Md. Sazzadur Rahman', NULL, '01786740107', NULL, 'sazzadurrahman580@gmail.com', '$2y$10$DozM30vRGMY9aDIh2EKxROmvuJRtBMimO2ox/rF8uXjMBYBjLvVRe', NULL, NULL, NULL, NULL, NULL, '2021-08-01 03:54:32', '2021-08-01 03:54:32', 1),
(99, 'Md. Sazzadur Rahman', NULL, '01786740111', NULL, 'sazzadurrahman5801@gmail.com', '1234', NULL, NULL, NULL, NULL, NULL, '2021-08-01 03:55:19', '2021-08-01 03:55:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_profiles`
--

DROP TABLE IF EXISTS `vendor_profiles`;
CREATE TABLE IF NOT EXISTS `vendor_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `current_balance` float NOT NULL DEFAULT '0',
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_profiles`
--

INSERT INTO `vendor_profiles` (`id`, `name`, `shop_name`, `photo`, `gender`, `phone`, `fax`, `email`, `password`, `address`, `city`, `zip`, `current_balance`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(18, 'your-number', 'Daraz Brand12', NULL, NULL, '+8801514545841', NULL, 'sazzadurrahman580@12gmail.com', '$2y$10$kWpM2V3Kw8neTYe47utNRe/YiPN8KsFHNQYdlbBnJu8pHHgNP/IJm', NULL, NULL, NULL, 0, NULL, '2021-07-31 15:30:55', '2021-07-31 15:30:55', 0),
(17, 'Md. Sazzadur Rahman', 'Daraz Brand1', NULL, NULL, '+8801314545834', NULL, 'khansazzad368@gmail.com', '$2y$10$ZRrv9iW8lj7LICsxg65U3.uWnS8I6T1r7DIP3jXRHfyleo28A7gam', NULL, NULL, NULL, 0, NULL, '2021-07-31 15:15:20', '2021-07-31 15:15:20', 0),
(16, 'Md. Sazzadur Rahman', 'Daraz Brand', NULL, NULL, '+8801314158541', NULL, 'sazzadurrahman580@gmail.com', '$2y$10$GfYmb2WNfxpZnX7.8Hn6MuTBakbJECx4/HdKcZvwV86qqgicHpMwe', NULL, NULL, NULL, 0, NULL, '2021-07-30 03:09:19', '2021-07-30 03:09:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;
CREATE TABLE IF NOT EXISTS `withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorid` int(11) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `acc_email` varchar(255) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `acc_name` varchar(255) DEFAULT NULL,
  `address` text,
  `swift` varchar(255) DEFAULT NULL,
  `reference` text,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `vendorid`, `method`, `acc_email`, `iban`, `country`, `acc_name`, `address`, `swift`, `reference`, `amount`, `fee`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Paypal', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'sssssssssssssssss', 2063.5, 63.5, '2017-07-25 10:29:33', '2017-07-25 10:32:58', 'rejected'),
(2, 1, 'Paypal', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'ssss', 2063.5, 63.5, '2017-07-25 10:34:32', '2017-07-25 10:35:58', 'rejected'),
(3, 1, 'Paypal', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'sssss', 2000, 63.5, '2017-07-25 10:36:14', '2017-07-25 10:36:57', 'rejected'),
(4, 1, 'Skrill', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'sssssssss', 1936.5, 63.5, '2017-07-25 10:37:08', '2017-07-25 10:37:42', 'rejected'),
(5, 1, 'Paypal', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'sss', 2000, 0, '2017-07-25 10:38:27', '2017-07-25 10:38:48', 'rejected'),
(6, 1, 'Paypal', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'ssss', 1936.5, 63.5, '2017-07-25 10:39:52', '2017-07-25 10:40:03', 'rejected'),
(7, 1, 'Paypal', 'shaoneel@gmail.com', NULL, NULL, NULL, NULL, NULL, 'sssssssssss', 1936.5, 63.5, '2017-07-25 10:59:39', '2017-07-25 10:59:49', 'completed'),
(8, 14, 'Paypal', 'sazzadurrahman580@gmail.com', NULL, NULL, NULL, NULL, NULL, 'dsd', 1000, 0, '2021-07-14 05:53:12', '2021-07-14 05:53:55', 'completed'),
(9, 14, 'Bank', NULL, '81789809138', NULL, '9898137', '97/8 Chairman Goli, Shankar', '13323', '13', 100, 0, '2021-07-14 06:01:50', '2021-07-14 06:02:23', 'rejected'),
(10, 14, 'Paypal', 'sazzadurrahman580@gmail.com', NULL, NULL, NULL, NULL, NULL, 'eww', 90, 10, '2021-07-14 06:11:46', '2021-07-14 06:12:00', 'completed'),
(11, 14, 'Nagad', 'sazzadurrahman580@gmail.com', NULL, NULL, NULL, NULL, NULL, '124', 90, 10, '2021-07-14 06:26:27', '2021-07-14 07:51:51', 'completed'),
(12, 14, 'Nagad', '01786710101', NULL, NULL, NULL, NULL, NULL, '1', 90, 10, '2021-07-14 07:53:24', '2021-07-14 07:53:24', 'pending'),
(13, 14, 'Nagad', '01786740107', NULL, NULL, NULL, NULL, NULL, '12', 27000, 3000, '2021-07-14 16:01:37', '2021-07-14 16:02:26', 'completed');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
