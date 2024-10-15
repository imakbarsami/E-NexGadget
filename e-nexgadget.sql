-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2024 at 07:29 PM
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
-- Database: `e-nexgadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Samsung', 'samsung', 1, '2024-10-12 00:17:43', '2024-10-12 00:17:43'),
(3, 'MSI', 'msi', 1, '2024-10-12 01:47:40', '2024-10-12 01:47:40'),
(4, 'BenQ', 'benq', 1, '2024-10-12 04:57:41', '2024-10-12 04:57:41'),
(5, 'Apple', 'apple', 1, '2024-10-12 05:36:13', '2024-10-12 05:36:13'),
(6, 'Acer', 'acer', 1, '2024-10-12 06:42:19', '2024-10-12 06:42:19'),
(7, 'Meta', 'meta', 1, '2024-10-12 10:54:55', '2024-10-12 10:54:55'),
(8, 'Epson', 'epson', 1, '2024-10-12 11:24:41', '2024-10-12 11:24:41'),
(9, 'D-Link', 'd-link', 1, '2024-10-12 11:53:38', '2024-10-12 11:53:38'),
(10, 'Logitech', 'logitech', 1, '2024-10-13 01:09:52', '2024-10-13 01:09:52'),
(11, 'Transcend', 'transcend', 1, '2024-10-13 01:59:28', '2024-10-13 01:59:28'),
(12, 'maono', 'maono', 1, '2024-10-13 02:08:02', '2024-10-13 02:08:02'),
(13, 'MaxGreen', 'maxgreen', 1, '2024-10-13 07:10:23', '2024-10-13 07:10:23'),
(14, 'MARSRIVA', 'marsriva', 1, '2024-10-13 07:20:13', '2024-10-13 07:20:13'),
(15, 'AWEI', 'awei', 1, '2024-10-13 07:33:24', '2024-10-13 07:33:24'),
(16, 'ViewSonic', 'viewsonic', 1, '2024-10-13 07:46:53', '2024-10-13 07:46:53'),
(17, 'Tp-Link', 'tp-link', 1, '2024-10-13 07:58:38', '2024-10-13 07:58:38'),
(18, 'Amazfit', 'amazfit', 1, '2024-10-13 08:08:15', '2024-10-13 08:08:15'),
(19, 'Motorola', 'motorola', 1, '2024-10-13 08:19:46', '2024-10-13 08:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `showHome`, `created_at`, `updated_at`) VALUES
(33, 'Mobile Phone', 'mobile-phone', '33.png', 1, 'Yes', '2024-10-12 00:14:40', '2024-10-12 00:14:41'),
(35, 'Monitors', 'monitors', '35.png', 1, 'Yes', '2024-10-12 00:56:55', '2024-10-12 00:56:55'),
(37, 'Laptop', 'laptop', '37.png', 1, 'Yes', '2024-10-12 01:31:53', '2024-10-12 01:31:53'),
(38, 'Projectors', 'projectors', '38.png', 1, 'Yes', '2024-10-12 04:13:00', '2024-10-12 04:16:00'),
(39, 'Virtual Reality', 'virtual-reality', '39.png', 1, 'Yes', '2024-10-12 10:22:49', '2024-10-13 07:50:27'),
(40, 'Samrt Watch', 'samrt-watch', '40.png', 1, 'Yes', '2024-10-12 11:31:48', '2024-10-12 11:31:49'),
(41, 'Networking', 'networking', '41.png', 1, 'Yes', '2024-10-12 11:51:36', '2024-10-13 07:56:01'),
(42, 'Accessiories', 'accessiories', '42.png', 1, 'Yes', '2024-10-12 12:04:15', '2024-10-12 12:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'US', NULL, NULL),
(2, 'Canada', 'CA', NULL, NULL),
(3, 'Afghanistan', 'AF', NULL, NULL),
(4, 'Albania', 'AL', NULL, NULL),
(5, 'Algeria', 'DZ', NULL, NULL),
(6, 'American Samoa', 'AS', NULL, NULL),
(7, 'Andorra', 'AD', NULL, NULL),
(8, 'Angola', 'AO', NULL, NULL),
(9, 'Anguilla', 'AI', NULL, NULL),
(10, 'Antarctica', 'AQ', NULL, NULL),
(11, 'Antigua and/or Barbuda', 'AG', NULL, NULL),
(12, 'Argentina', 'AR', NULL, NULL),
(13, 'Armenia', 'AM', NULL, NULL),
(14, 'Aruba', 'AW', NULL, NULL),
(15, 'Australia', 'AU', NULL, NULL),
(16, 'Austria', 'AT', NULL, NULL),
(17, 'Azerbaijan', 'AZ', NULL, NULL),
(18, 'Bahamas', 'BS', NULL, NULL),
(19, 'Bahrain', 'BH', NULL, NULL),
(20, 'Bangladesh', 'BD', NULL, NULL),
(21, 'Barbados', 'BB', NULL, NULL),
(22, 'Belarus', 'BY', NULL, NULL),
(23, 'Belgium', 'BE', NULL, NULL),
(24, 'Belize', 'BZ', NULL, NULL),
(25, 'Benin', 'BJ', NULL, NULL),
(26, 'Bermuda', 'BM', NULL, NULL),
(27, 'Bhutan', 'BT', NULL, NULL),
(28, 'Bolivia', 'BO', NULL, NULL),
(29, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(30, 'Botswana', 'BW', NULL, NULL),
(31, 'Bouvet Island', 'BV', NULL, NULL),
(32, 'Brazil', 'BR', NULL, NULL),
(33, 'British lndian Ocean Territory', 'IO', NULL, NULL),
(34, 'Brunei Darussalam', 'BN', NULL, NULL),
(35, 'Bulgaria', 'BG', NULL, NULL),
(36, 'Burkina Faso', 'BF', NULL, NULL),
(37, 'Burundi', 'BI', NULL, NULL),
(38, 'Cambodia', 'KH', NULL, NULL),
(39, 'Cameroon', 'CM', NULL, NULL),
(40, 'Cape Verde', 'CV', NULL, NULL),
(41, 'Cayman Islands', 'KY', NULL, NULL),
(42, 'Central African Republic', 'CF', NULL, NULL),
(43, 'Chad', 'TD', NULL, NULL),
(44, 'Chile', 'CL', NULL, NULL),
(45, 'China', 'CN', NULL, NULL),
(46, 'Christmas Island', 'CX', NULL, NULL),
(47, 'Cocos (Keeling) Islands', 'CC', NULL, NULL),
(48, 'Colombia', 'CO', NULL, NULL),
(49, 'Comoros', 'KM', NULL, NULL),
(50, 'Congo', 'CG', NULL, NULL),
(51, 'Cook Islands', 'CK', NULL, NULL),
(52, 'Costa Rica', 'CR', NULL, NULL),
(53, 'Croatia (Hrvatska)', 'HR', NULL, NULL),
(54, 'Cuba', 'CU', NULL, NULL),
(55, 'Cyprus', 'CY', NULL, NULL),
(56, 'Czech Republic', 'CZ', NULL, NULL),
(57, 'Democratic Republic of Congo', 'CD', NULL, NULL),
(58, 'Denmark', 'DK', NULL, NULL),
(59, 'Djibouti', 'DJ', NULL, NULL),
(60, 'Dominica', 'DM', NULL, NULL),
(61, 'Dominican Republic', 'DO', NULL, NULL),
(62, 'East Timor', 'TP', NULL, NULL),
(63, 'Ecudaor', 'EC', NULL, NULL),
(64, 'Egypt', 'EG', NULL, NULL),
(65, 'El Salvador', 'SV', NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', NULL, NULL),
(67, 'Eritrea', 'ER', NULL, NULL),
(68, 'Estonia', 'EE', NULL, NULL),
(69, 'Ethiopia', 'ET', NULL, NULL),
(70, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL),
(71, 'Faroe Islands', 'FO', NULL, NULL),
(72, 'Fiji', 'FJ', NULL, NULL),
(73, 'Finland', 'FI', NULL, NULL),
(74, 'France', 'FR', NULL, NULL),
(75, 'France, Metropolitan', 'FX', NULL, NULL),
(76, 'French Guiana', 'GF', NULL, NULL),
(77, 'French Polynesia', 'PF', NULL, NULL),
(78, 'French Southern Territories', 'TF', NULL, NULL),
(79, 'Gabon', 'GA', NULL, NULL),
(80, 'Gambia', 'GM', NULL, NULL),
(81, 'Georgia', 'GE', NULL, NULL),
(82, 'Germany', 'DE', NULL, NULL),
(83, 'Ghana', 'GH', NULL, NULL),
(84, 'Gibraltar', 'GI', NULL, NULL),
(85, 'Greece', 'GR', NULL, NULL),
(86, 'Greenland', 'GL', NULL, NULL),
(87, 'Grenada', 'GD', NULL, NULL),
(88, 'Guadeloupe', 'GP', NULL, NULL),
(89, 'Guam', 'GU', NULL, NULL),
(90, 'Guatemala', 'GT', NULL, NULL),
(91, 'Guinea', 'GN', NULL, NULL),
(92, 'Guinea-Bissau', 'GW', NULL, NULL),
(93, 'Guyana', 'GY', NULL, NULL),
(94, 'Haiti', 'HT', NULL, NULL),
(95, 'Heard and Mc Donald Islands', 'HM', NULL, NULL),
(96, 'Honduras', 'HN', NULL, NULL),
(97, 'Hong Kong', 'HK', NULL, NULL),
(98, 'Hungary', 'HU', NULL, NULL),
(99, 'Iceland', 'IS', NULL, NULL),
(100, 'India', 'IN', NULL, NULL),
(101, 'Indonesia', 'ID', NULL, NULL),
(102, 'Iran (Islamic Republic of)', 'IR', NULL, NULL),
(103, 'Iraq', 'IQ', NULL, NULL),
(104, 'Ireland', 'IE', NULL, NULL),
(105, 'Israel', 'IL', NULL, NULL),
(106, 'Italy', 'IT', NULL, NULL),
(107, 'Ivory Coast', 'CI', NULL, NULL),
(108, 'Jamaica', 'JM', NULL, NULL),
(109, 'Japan', 'JP', NULL, NULL),
(110, 'Jordan', 'JO', NULL, NULL),
(111, 'Kazakhstan', 'KZ', NULL, NULL),
(112, 'Kenya', 'KE', NULL, NULL),
(113, 'Kiribati', 'KI', NULL, NULL),
(114, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL),
(115, 'Korea, Republic of', 'KR', NULL, NULL),
(116, 'Kuwait', 'KW', NULL, NULL),
(117, 'Kyrgyzstan', 'KG', NULL, NULL),
(118, 'Lao People\'s Democratic Republic', 'LA', NULL, NULL),
(119, 'Latvia', 'LV', NULL, NULL),
(120, 'Lebanon', 'LB', NULL, NULL),
(121, 'Lesotho', 'LS', NULL, NULL),
(122, 'Liberia', 'LR', NULL, NULL),
(123, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL),
(124, 'Liechtenstein', 'LI', NULL, NULL),
(125, 'Lithuania', 'LT', NULL, NULL),
(126, 'Luxembourg', 'LU', NULL, NULL),
(127, 'Macau', 'MO', NULL, NULL),
(128, 'Macedonia', 'MK', NULL, NULL),
(129, 'Madagascar', 'MG', NULL, NULL),
(130, 'Malawi', 'MW', NULL, NULL),
(131, 'Malaysia', 'MY', NULL, NULL),
(132, 'Maldives', 'MV', NULL, NULL),
(133, 'Mali', 'ML', NULL, NULL),
(134, 'Malta', 'MT', NULL, NULL),
(135, 'Marshall Islands', 'MH', NULL, NULL),
(136, 'Martinique', 'MQ', NULL, NULL),
(137, 'Mauritania', 'MR', NULL, NULL),
(138, 'Mauritius', 'MU', NULL, NULL),
(139, 'Mayotte', 'TY', NULL, NULL),
(140, 'Mexico', 'MX', NULL, NULL),
(141, 'Micronesia, Federated States of', 'FM', NULL, NULL),
(142, 'Moldova, Republic of', 'MD', NULL, NULL),
(143, 'Monaco', 'MC', NULL, NULL),
(144, 'Mongolia', 'MN', NULL, NULL),
(145, 'Montserrat', 'MS', NULL, NULL),
(146, 'Morocco', 'MA', NULL, NULL),
(147, 'Mozambique', 'MZ', NULL, NULL),
(148, 'Myanmar', 'MM', NULL, NULL),
(149, 'Namibia', 'NA', NULL, NULL),
(150, 'Nauru', 'NR', NULL, NULL),
(151, 'Nepal', 'NP', NULL, NULL),
(152, 'Netherlands', 'NL', NULL, NULL),
(153, 'Netherlands Antilles', 'AN', NULL, NULL),
(154, 'New Caledonia', 'NC', NULL, NULL),
(155, 'New Zealand', 'NZ', NULL, NULL),
(156, 'Nicaragua', 'NI', NULL, NULL),
(157, 'Niger', 'NE', NULL, NULL),
(158, 'Nigeria', 'NG', NULL, NULL),
(159, 'Niue', 'NU', NULL, NULL),
(160, 'Norfork Island', 'NF', NULL, NULL),
(161, 'Northern Mariana Islands', 'MP', NULL, NULL),
(162, 'Norway', 'NO', NULL, NULL),
(163, 'Oman', 'OM', NULL, NULL),
(164, 'Pakistan', 'PK', NULL, NULL),
(165, 'Palau', 'PW', NULL, NULL),
(166, 'Panama', 'PA', NULL, NULL),
(167, 'Papua New Guinea', 'PG', NULL, NULL),
(168, 'Paraguay', 'PY', NULL, NULL),
(169, 'Peru', 'PE', NULL, NULL),
(170, 'Philippines', 'PH', NULL, NULL),
(171, 'Pitcairn', 'PN', NULL, NULL),
(172, 'Poland', 'PL', NULL, NULL),
(173, 'Portugal', 'PT', NULL, NULL),
(174, 'Puerto Rico', 'PR', NULL, NULL),
(175, 'Qatar', 'QA', NULL, NULL),
(176, 'Republic of South Sudan', 'SS', NULL, NULL),
(177, 'Reunion', 'RE', NULL, NULL),
(178, 'Romania', 'RO', NULL, NULL),
(179, 'Russian Federation', 'RU', NULL, NULL),
(180, 'Rwanda', 'RW', NULL, NULL),
(181, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(182, 'Saint Lucia', 'LC', NULL, NULL),
(183, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(184, 'Samoa', 'WS', NULL, NULL),
(185, 'San Marino', 'SM', NULL, NULL),
(186, 'Sao Tome and Principe', 'ST', NULL, NULL),
(187, 'Saudi Arabia', 'SA', NULL, NULL),
(188, 'Senegal', 'SN', NULL, NULL),
(189, 'Serbia', 'RS', NULL, NULL),
(190, 'Seychelles', 'SC', NULL, NULL),
(191, 'Sierra Leone', 'SL', NULL, NULL),
(192, 'Singapore', 'SG', NULL, NULL),
(193, 'Slovakia', 'SK', NULL, NULL),
(194, 'Slovenia', 'SI', NULL, NULL),
(195, 'Solomon Islands', 'SB', NULL, NULL),
(196, 'Somalia', 'SO', NULL, NULL),
(197, 'South Africa', 'ZA', NULL, NULL),
(198, 'South Georgia South Sandwich Islands', 'GS', NULL, NULL),
(199, 'Spain', 'ES', NULL, NULL),
(200, 'Sri Lanka', 'LK', NULL, NULL),
(201, 'St. Helena', 'SH', NULL, NULL),
(202, 'St. Pierre and Miquelon', 'PM', NULL, NULL),
(203, 'Sudan', 'SD', NULL, NULL),
(204, 'Suriname', 'SR', NULL, NULL),
(205, 'Svalbarn and Jan Mayen Islands', 'SJ', NULL, NULL),
(206, 'Swaziland', 'SZ', NULL, NULL),
(207, 'Sweden', 'SE', NULL, NULL),
(208, 'Switzerland', 'CH', NULL, NULL),
(209, 'Syrian Arab Republic', 'SY', NULL, NULL),
(210, 'Taiwan', 'TW', NULL, NULL),
(211, 'Tajikistan', 'TJ', NULL, NULL),
(212, 'Tanzania, United Republic of', 'TZ', NULL, NULL),
(213, 'Thailand', 'TH', NULL, NULL),
(214, 'Togo', 'TG', NULL, NULL),
(215, 'Tokelau', 'TK', NULL, NULL),
(216, 'Tonga', 'TO', NULL, NULL),
(217, 'Trinidad and Tobago', 'TT', NULL, NULL),
(218, 'Tunisia', 'TN', NULL, NULL),
(219, 'Turkey', 'TR', NULL, NULL),
(220, 'Turkmenistan', 'TM', NULL, NULL),
(221, 'Turks and Caicos Islands', 'TC', NULL, NULL),
(222, 'Tuvalu', 'TV', NULL, NULL),
(223, 'Uganda', 'UG', NULL, NULL),
(224, 'Ukraine', 'UA', NULL, NULL),
(225, 'United Arab Emirates', 'AE', NULL, NULL),
(226, 'United Kingdom', 'GB', NULL, NULL),
(227, 'United States minor outlying islands', 'UM', NULL, NULL),
(228, 'Uruguay', 'UY', NULL, NULL),
(229, 'Uzbekistan', 'UZ', NULL, NULL),
(230, 'Vanuatu', 'VU', NULL, NULL),
(231, 'Vatican City State', 'VA', NULL, NULL),
(232, 'Venezuela', 'VE', NULL, NULL),
(233, 'Vietnam', 'VN', NULL, NULL),
(234, 'Virgin Islands (British)', 'VG', NULL, NULL),
(235, 'Virgin Islands (U.S.)', 'VI', NULL, NULL),
(236, 'Wallis and Futuna Islands', 'WF', NULL, NULL),
(237, 'Western Sahara', 'EH', NULL, NULL),
(238, 'Yemen', 'YE', NULL, NULL),
(239, 'Yugoslavia', 'YU', NULL, NULL),
(240, 'Zaire', 'ZR', NULL, NULL),
(241, 'Zambia', 'ZM', NULL, NULL),
(242, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `created_at`, `updated_at`) VALUES
(1, 2, 'Deontae', 'Prohaska', 'your.email+fakedata15343@gmail.com', 'Dynamic Directives Assistant', 20, '4351 Bartell Roads', 'Repudiandae laborum rerum sequi soluta accusamus nemo ipsa hic illum.', 'Lubbock', 'North Carolina', '42902', '2024-10-15 11:27:58', '2024-10-15 11:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `discount_coupons`
--

CREATE TABLE `discount_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_uses` int(11) DEFAULT NULL,
  `max_uses_user` int(11) DEFAULT NULL,
  `type` enum('percent','fixed') NOT NULL DEFAULT 'fixed',
  `discount_amount` double(10,2) NOT NULL,
  `min_amount` double(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `starts_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_coupons`
--

INSERT INTO `discount_coupons` (`id`, `code`, `name`, `description`, `max_uses`, `max_uses_user`, `type`, `discount_amount`, `min_amount`, `status`, `starts_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'hmk', 'kukiching', 'HMK MGP', 5, 1, 'fixed', 500.00, 2000.00, 1, '2024-10-12 18:00:19', '2024-10-15 15:46:25', '2024-10-11 09:46:46', '2024-10-13 12:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_07_27_050207_alter_users_table', 1),
(6, '2024_07_27_091055_create_categories_table', 1),
(7, '2024_07_28_050951_create_temp_images_table', 1),
(8, '2024_07_28_103158_create_sub_categories_table', 1),
(9, '2024_07_29_050802_create_brands_table', 1),
(10, '2024_07_29_083519_create_products_table', 1),
(11, '2024_07_30_085405_create_product_images_table', 1),
(12, '2024_07_31_062219_alter_categories_table', 1),
(13, '2024_07_31_063704_alter_products_table', 1),
(14, '2024_07_31_064802_alter_sub_categories_table', 1),
(15, '2024_08_01_071301_alter_products_table', 1),
(16, '2024_08_02_131146_alter_users_table', 1),
(17, '2024_08_03_060742_create_countries_table', 1),
(18, '2024_08_03_130814_create_orders_table', 1),
(19, '2024_08_03_130902_create_order_items_table', 1),
(20, '2024_08_03_131000_create_customer_addresses_table', 1),
(21, '2024_08_07_092506_create_shipping_charges_table', 1),
(22, '2024_08_07_123309_create_discount_coupons_table', 1),
(23, '2024_08_08_133601_add_coupon_code_id_to_orders_table', 1),
(24, '2024_08_08_153023_alter_orders_table', 1),
(25, '2024_08_09_111503_alter_orders_table', 1),
(26, '2024_08_09_162057_create_wishlists_table', 1),
(27, '2024_08_10_160026_alter_users_table', 1),
(28, '2024_08_11_102333_create_pages_table', 1),
(29, '2024_08_13_091134_create_product_ratings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `shipping` double(10,2) NOT NULL,
  `cupon_code` varchar(255) DEFAULT NULL,
  `coupon_code_id` int(11) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) NOT NULL,
  `payment_status` enum('paid','not paid') NOT NULL DEFAULT 'not paid',
  `status` enum('pending','shipped','delivered','canceled') NOT NULL DEFAULT 'pending',
  `shipped_date` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Terms and Condition', 'terms-and-condition', '<p><strong>Terms and Conditions</strong></p><p>Welcome to E-NexGadget! By accessing or using our website, [E-NexGadget URL], you agree to be bound by these Terms and Conditions. Please read them carefully before engaging with our platform. If you do not agree with any part of these terms, you may not use our services.</p><h3>1. <strong>General Use</strong></h3><ul><li>By using E-NexGadget, you confirm that you are at least 18 years of age or have parental consent.</li><li>You agree to use our website and services only for lawful purposes and in a way that does not infringe the rights of others or restrict their use and enjoyment.</li></ul><h3>2. <strong>Account Registration</strong></h3><ul><li>To make purchases, you may be required to create an account. You are responsible for maintaining the confidentiality of your account details.</li><li>All information provided must be accurate, complete, and current. E-NexGadget reserves the right to suspend or terminate accounts with false or misleading information.</li></ul><h3>3. <strong>Product Information and Pricing</strong></h3><ul><li>We strive to display product details, prices, and availability accurately. However, errors may occur. E-NexGadget reserves the right to correct any errors, update information, or cancel orders if any product details are incorrect.</li><li>All prices are listed in [Currency] and do not include applicable taxes, shipping, and handling charges unless otherwise specified.</li></ul><h3>4. <strong>Payment Terms</strong></h3><ul><li>Payment must be made through approved payment methods as indicated on our website.</li><li>By placing an order, you agree to pay the listed price for each product and any additional charges associated with the purchase, such as shipping and handling.</li></ul><h3>5. <strong>Order Cancellation and Modifications</strong></h3><ul><li>You may request to cancel or modify your order within [specify hours, e.g., 24 hours] of purchase, subject to approval. Once processed, orders cannot be canceled or modified.</li></ul><h3>6. <strong>Shipping and Delivery</strong></h3><ul><li>E-NexGadget provides estimated delivery times based on your location and chosen shipping method. We are not liable for delays due to factors beyond our control, such as customs delays or courier issues.</li><li>Shipping fees are non-refundable, and any applicable import duties or taxes are the responsibility of the customer.</li></ul><h3>7. <strong>Return and Refund Policy</strong></h3><ul><li>Returns and refunds are accepted under specific conditions, such as defective or incorrect items. To initiate a return, contact customer support within [specify time, e.g., 14 days] of receiving the item.</li><li>Items must be returned in original packaging, unused, and in resaleable condition. Refunds will be processed to the original payment method.</li></ul><h3>8. <strong>Intellectual Property Rights</strong></h3><ul><li>All content on this website, including text, graphics, logos, images, and software, is the property of E-NexGadget or its licensors. Unauthorized use, reproduction, or distribution is strictly prohibited.</li></ul><h3>9. <strong>Limitation of Liability</strong></h3><ul><li>E-NexGadget is not liable for any indirect, incidental, or consequential damages resulting from the use of our website or services.</li><li>Our total liability for any claim arising from these terms shall not exceed the amount paid by you for the product purchased.</li></ul><h3>10. <strong>Modifications to Terms and Conditions</strong></h3><ul><li>E-NexGadget reserves the right to update or modify these Terms and Conditions at any time without prior notice. By continuing to use our website, you agree to be bound by any revised terms.</li></ul><h3>11. <strong>Governing Law</strong></h3><ul><li>These terms are governed by the laws of [Your Jurisdiction]. Any disputes shall be resolved in the courts of [Your Location].</li></ul><p>For questions or concerns regarding these Terms and Conditions, please contact us at [Your Support Email].</p>', '2024-10-11 10:33:18', '2024-10-11 10:33:18'),
(2, 'About Us', 'about-us', '<p>Welcome to <strong>E-NexGadget</strong> – your go-to destination for the latest, high-quality gadgets and tech accessories. Founded with a passion for innovation and customer satisfaction, E-NexGadget brings you a wide selection of products designed to enhance your everyday life, from cutting-edge electronics to essential accessories for work, home, and play.</p><p>At <strong>E-NexGadget</strong>, we believe in combining technology with convenience. Our curated selection ensures that each product meets our standards for quality, functionality, and durability. We work closely with trusted suppliers and stay up-to-date with the latest advancements to provide our customers with the best the tech world has to offer.</p><h3>Why Choose Us?</h3><ul><li><strong>Quality Products</strong>: We prioritize offering only reliable and well-reviewed products.</li><li><strong>Customer Satisfaction</strong>: Our team is committed to providing a seamless shopping experience, from browsing to checkout and beyond.</li><li><strong>Secure Shopping</strong>: Your privacy and security are of utmost importance. We use secure payment methods and keep your personal information safe.</li><li><strong>Excellent Support</strong>: Our dedicated customer support team is here to help, whether you have a question about a product, need assistance with an order, or require post-purchase support.</li></ul><p>Explore our collection today and find the perfect gadget to elevate your lifestyle. At E-NexGadget, we’re not just selling products – we’re enhancing the way you connect with the world.</p>', '2024-10-11 10:35:39', '2024-10-11 10:35:39'),
(3, 'Privacy', 'privacy', '<p>Your privacy is important to us at E-NexGadget. This Privacy Policy outlines how we collect, use, and safeguard your personal information when you visit our website, [E-NexGadget URL]. By using our services, you consent to the data practices described in this policy.</p><h3>1. <strong>Information We Collect</strong></h3><ul><li><strong>Personal Information</strong>: When you register, place an order, or subscribe to our newsletter, we may collect personal details such as your name, email address, billing/shipping address, and payment information.</li><li><strong>Usage Data</strong>: We may also collect information about your interactions with our site, including your IP address, browser type, pages visited, and time spent on our website, to help improve our services.</li></ul><h3>2. <strong>How We Use Your Information</strong></h3><ul><li><strong>Order Processing</strong>: Personal information is primarily used to process and fulfill your orders, provide customer support, and manage your account.</li><li><strong>Communication</strong>: We use your email address to send order confirmations, updates, promotional offers, and newsletters (if you have opted in).</li><li><strong>Improvement of Services</strong>: Usage data helps us analyze website trends, improve user experience, and tailor content to your preferences.</li></ul><h3>3. <strong>How We Protect Your Information</strong></h3><ul><li>E-NexGadget uses industry-standard security measures to protect your personal information from unauthorized access, disclosure, or misuse.</li><li>Sensitive data, such as payment details, is encrypted and processed through secure payment gateways. We do not store full credit card information on our servers.</li></ul><h3>4. <strong>Sharing Your Information</strong></h3><ul><li><strong>Third-Party Services</strong>: We may share your data with trusted third-party service providers who assist us with payment processing, shipping, marketing, or analytics. These providers are obligated to keep your information confidential and use it only for the purposes for which it was shared.</li><li><strong>Legal Requirements</strong>: We may disclose your personal information if required to comply with legal obligations, protect our rights, or ensure user safety.</li></ul><h3>5. <strong>Cookies and Tracking Technologies</strong></h3><ul><li>E-NexGadget uses cookies and similar technologies to enhance site functionality, personalize your experience, and gather analytical information. You can manage your cookie preferences through your browser settings, although this may impact your experience on our site.</li></ul><h3>6. <strong>Third-Party Links</strong></h3><ul><li>Our website may contain links to third-party sites. E-NexGadget is not responsible for the privacy practices or content of external websites, and we encourage you to review their privacy policies.</li></ul><h3>7. <strong>Your Rights</strong></h3><ul><li><strong>Access and Correction</strong>: You may request access to, correction of, or deletion of your personal information at any time by contacting us at [Your Support Email].</li><li><strong>Opt-Out</strong>: If you wish to unsubscribe from marketing communications, you can opt out by following the instructions in the email or updating your preferences in your account settings.</li></ul><h3>8. <strong>Changes to Our Privacy Policy</strong></h3><ul><li>E-NexGadget may update this Privacy Policy periodically. We encourage you to review it occasionally to stay informed of any changes. Continued use of our site after modifications implies acceptance of the updated terms.</li></ul><h3>9. <strong>Contact Us</strong></h3><ul><li>If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at [Your Support Email].</li></ul>', '2024-10-11 10:40:23', '2024-10-11 10:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `shipping_returns` text DEFAULT NULL,
  `related_products` text DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_featured` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `track_qty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_returns`, `related_products`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Samsung Galaxy S24 Ultra – 5G Smartphone, 256GB', 'samsung-galaxy-s24-ultra-5g-smartphone-256gb', '<h5 style=\"text-align: justify; \" class=\"\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Samsung Galaxy S24 Ultra offers a perfect fusion of performance and style. Its robust Snapdragon 8 Gen 3 processor ensures fast and smooth operations, while the expansive 6.8-inch Dynamic AMOLED 2X display brings stunning clarity and color. Equipped with a 200MP main camera, the S24 Ultra captures every moment with breathtaking detail, even in low light. Additional features like 5G connectivity, a 5,000mAh battery for all-day usage, and up to 256GB of internal storage make this device the ideal choice for tech enthusiasts who demand the best in mobile technology. Available in Phantom Black, this sleek and durable smartphone exudes sophistication.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience cutting-edge performance and premium design with the Samsung Galaxy S24 Ultra. Packed with advanced features, including a pro-grade camera system, large storage capacity, and ultra-smooth display, this smartphone redefines mobile innovation.</span></h5>', '<h5 class=\"\"><li><strong><span style=\"font-family: &quot;Times New Roman&quot;;\">Shipping:</span></strong><span style=\"font-family: &quot;Times New Roman&quot;;\"> Enjoy free standard shipping within the continental U.S. Expedited options are available at checkout. Orders typically ship within 1-3 business days.</span></li><li><strong><span style=\"font-family: &quot;Times New Roman&quot;;\">Returns:</span></strong><span style=\"font-family: &quot;Times New Roman&quot;;\"> We offer a 30-day return policy on this product. Items must be returned in their original packaging and condition for a full refund. Please refer to our returns policy for detailed instructions.</span></li></h5>', '', 190900.00, 200000.00, 33, 4, 2, 'Yes', '60', '1010', 'Yes', 30, 1, '2024-10-12 00:22:28', '2024-10-12 00:22:28'),
(4, 'Samsung Galaxy Z Fold6 – Revolutionary Foldable Design', 'samsung-galaxy-z-fold6-revolutionary-foldable-design', '<p>The Samsung Galaxy Z Fold6 redefines smartphone technology with its revolutionary foldable design, offering seamless switching between a compact smartphone mode and a large, immersive tablet experience. Powered by the latest processor, it ensures lightning-fast performance and efficient multi-tasking. The enhanced 7.6-inch foldable display brings colors to life with incredible clarity and vibrancy, making it ideal for entertainment, productivity, and creativity. With its intuitive interface and robust multi-window functionality, the Galaxy Z Fold6 allows you to run multiple apps simultaneously, enhancing productivity on the go. The phone’s durable build and Samsung’s Flex Mode technology allow for smooth transitions and a sturdy foldable experience. Featuring a powerful camera system, 5G connectivity, and a long-lasting battery, the Galaxy Z Fold6 is engineered to take you into the future of mobile technology.<br></p>', '<p>Unfold endless possibilities with the Samsung Galaxy Z Fold6. This cutting-edge foldable smartphone combines power and versatility with an expansive, immersive display, multi-tasking capabilities, and a sleek design. Revolutionize your mobile experience with Samsung’s latest innovation in foldable technology.<br></p>', '<h5 class=\"\" style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">We offer free standard shipping on all Samsung Galaxy Z Fold6 orders. Orders typically ship within 2-3 business days. Express and expedited shipping options are available at checkout for an additional fee. Returns are accepted within 30 days of delivery for a full refund, provided the device is returned in its original packaging and condition.</span></h5>', '3', 200000.00, 210000.00, 33, 4, 2, 'Yes', '50', '1020', 'Yes', 25, 1, '2024-10-12 01:46:29', '2024-10-12 01:46:29'),
(5, 'MPG 321URX QD-OLED Gaming Monitor', 'mpg-321urx-qd-oled-gaming-monitor', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The MPG 321URX QD-OLED is a 32-inch 4K monitor that combines Quantum Dot and OLED technology to deliver unparalleled color vibrancy, deep blacks, and a broader range of colors. With its 1ms response time and up to 144Hz refresh rate, the monitor ensures ultra-smooth, tear-free gameplay and motion clarity, ideal for competitive gaming and immersive visuals. Designed with an anti-glare display, adjustable stand, and VESA compatibility, the MPG 321URX is customizable for any setup. Additionally, HDR technology provides realistic contrast and brightness, making this monitor perfect for intense gaming and detailed creative work. With USB-C connectivity, HDMI 2.1, and DisplayPort 1.4 support, you’ll stay connected with top-tier performance.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience unmatched color accuracy and performance with the MPG 321URX QD-OLED gaming monitor. Engineered for gamers and creators alike, this monitor offers stunning visuals, ultra-fast refresh rates, and next-level contrast, ensuring every frame comes to life.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free shipping on all MPG 321URX QD-OLED orders. Orders typically ship within 2-4 business days. We offer express and expedited shipping options for an additional fee at checkout. Returns are accepted within 30 days of delivery for a full refund if the product is returned in its original condition and packaging.</span></h5>', '', 65000.00, 70000.00, 35, 9, 3, 'Yes', '58', '1030', 'Yes', 18, 1, '2024-10-12 01:59:14', '2024-10-12 01:59:14'),
(6, 'Modern AM272P 1M – All-in-One (Performance & Style)', 'modern-am272p-1m-all-in-one-performance-style', '<h5 style=\"text-align: justify; margin-left: 25px;\" class=\"\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Modern AM272P 1M is engineered for those who value both functionality and aesthetics. This all-in-one desktop combines a powerful processor with a Full HD display, delivering sharp visuals and smooth performance for daily tasks, multimedia, and light creative work. Its compact design maximizes desk space, while a minimalistic yet elegant appearance complements any modern setup. With built-in Wi-Fi, Bluetooth, and an advanced array of ports, connectivity is seamless, whether you’re video conferencing, streaming, or connecting external devices. The Modern AM272P 1M is perfect for professionals, students, or home users who demand a reliable, space-saving solution without compromising performance.</span></h5>', '<h5 style=\"text-align: justify; margin-left: 25px;\" class=\"\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Modern AM272P 1M is a sleek all-in-one desktop designed for high performance and productivity. Perfect for work or leisure, this stylish system offers powerful computing with minimal space requirements, fitting seamlessly into any workspace.</span></h5>', '<h5 style=\"text-align: justify; margin-left: 25px;\" class=\"\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Modern AM272P 1M purchases, with most orders shipping within 2-3 business days. For faster delivery, express shipping options are available at checkout. We accept returns within 30 days of delivery for a full refund, provided the product is returned in its original packaging and pristine condition.</span></h5>', '5', 90000.00, NULL, 35, 10, 3, 'Yes', '61', '1030', 'Yes', 35, 1, '2024-10-12 02:10:20', '2024-10-12 03:16:05'),
(7, 'MSI Prestige A16 AI+ A3HM; Copilot+ PC', 'msi-prestige-a16-ai-a3hm-copilot-pc', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The MSI Prestige A16 AI+ A3HM Copilot+ PC is a cutting-edge machine designed for users who demand power and sophistication. With AI-driven enhancements and robust hardware, this PC is built for seamless multitasking, advanced creative projects, and high-efficiency workflows. The integrated Copilot+ AI assists with optimized resource allocation, helping accelerate rendering, processing, and content creation tasks. Featuring a sleek, modern chassis, it brings elegance to any workspace while offering versatile connectivity, high-speed data transfer, and substantial storage for large projects. This powerhouse device ensures high performance, efficient power use, and reliability, making it ideal for professionals and enthusiasts.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The MSI Prestige A16 AI+ A3HM is an advanced PC featuring the powerful Copilot+ AI, designed for creative professionals and multitaskers. Experience superior AI-enhanced computing with style and efficiency tailored for the modern user.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">We offer free standard shipping on the MSI Prestige A16 AI+ A3HM Copilot+ PC, with dispatch typically within 2-3 business days. Express shipping options are available for an additional charge. Returns are accepted within 30 days of delivery for a full refund, provided the PC is in its original condition and packaging.</span></h5>', '', 185000.00, NULL, 37, 11, 3, 'Yes', '62', '1040', 'Yes', 45, 1, '2024-10-12 03:01:50', '2024-10-12 03:13:59'),
(8, 'Titan 18 HX A14V – Unmatched Gaming Power & Precision', 'titan-18-hx-a14v-unmatched-gaming-power-precision', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Titan 18 HX A14V is a high-performance laptop engineered for intense gaming and demanding applications. Featuring the latest Intel Core processor and NVIDIA GeForce graphics, this powerhouse ensures smooth gameplay, fast processing, and exceptional multitasking abilities. The 18-inch display with high refresh rates and NVIDIA G-SYNC technology offers an immersive, tear-free experience ideal for both gaming and content creation. Built with advanced cooling technology, the Titan 18 HX A14V can handle extended sessions while maintaining peak performance. This laptop’s durable build, customizable RGB keyboard, and precision-engineered components make it a top choice for enthusiasts seeking uncompromising power and aesthetics.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Titan 18 HX A14V combines powerful performance with cutting-edge technology, designed for gamers and professionals who demand the very best. With elite hardware and advanced cooling, it delivers smooth, immersive gaming and top-notch productivity.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Titan 18 HX A14V orders, with dispatch usually within 2-3 business days. For faster delivery, express shipping options are available at checkout. Returns are accepted within 30 days of delivery for a full refund, provided the product is returned in its original condition and packaging.</span></h5>', '7', 320000.00, NULL, 37, 12, 3, 'Yes', '53', '1040', 'Yes', 15, 1, '2024-10-12 03:12:43', '2024-10-12 03:12:43'),
(9, 'BenQ W4000i – 4K Smart Home Cinema Projector', 'benq-w4000i-4k-smart-home-cinema-projector', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The BenQ W4000i is a state-of-the-art 4K UHD projector that transforms your living space into a personal cinema. Its ultra-high-definition display, complemented by HDR-PRO technology, delivers vibrant colors, deep contrasts, and incredibly sharp images for an immersive viewing experience. Equipped with Android TV, the W4000i allows seamless access to your favorite streaming services, so you can watch movies, series, or sports without the need for extra devices. This projector also offers easy wireless casting and advanced picture modes, ensuring optimal settings for various types of content. Built with a sleek and compact design, it fits effortlessly into any home theater setup.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The BenQ W4000i 4K projector brings the immersive experience of a cinema directly to your home. With stunning 4K UHD visuals, HDR support, and built-in smart streaming, it’s designed for movie lovers and entertainment enthusiasts.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on the BenQ W4000i projector, with orders typically processed within 2-3 business days. Expedited shipping options are available at checkout. We accept returns within 30 days of delivery for a full refund, provided the product is returned in its original packaging and pristine condition.</span></h5>', '', 98000.00, NULL, 38, 14, 4, 'Yes', '63', '1050', 'Yes', 35, 1, '2024-10-12 05:01:10', '2024-10-12 07:16:21'),
(10, 'BenQ TK860i – 4K Smart Home Projector with Stunning Clarity', 'benq-tk860i-4k-smart-home-projector-with-stunning-clarity', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience breathtaking visuals with the BenQ TK860i 4K Smart Home Projector, engineered for ultimate picture quality and immersive sound. Boasting 4K UHD resolution with 8.3 million distinct pixels, it delivers sharp, detailed images ideal for movies, sports, and gaming. The high brightness and HDR support ensure vibrant colors and deep contrast, even in well-lit rooms. Built-in Android TV brings you easy access to streaming platforms, while wireless casting lets you share content from any device. With its advanced audio and sleek, modern design, the BenQ TK860i makes an impressive addition to any home entertainment setup.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The BenQ TK860i is a premium 4K projector designed to transform your home viewing experience. With true-to-life colors, high brightness, and smart connectivity, it’s perfect for creating a cinematic experience right at home.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all BenQ TK860i projector orders, typically shipped within 2-3 business days. Expedited shipping is available at checkout for faster delivery. Returns are accepted within 30 days of delivery for a full refund, provided the projector is returned in original packaging and condition.</span></h5>', '9', 92000.00, NULL, 38, 14, 4, 'Yes', '64', '1050', 'Yes', 45, 1, '2024-10-12 05:27:51', '2024-10-12 07:16:11'),
(11, 'iPhone 16 Pro Max – Innovation Beyond Boundaries', 'iphone-16-pro-max-innovation-beyond-boundaries', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The iPhone 16 Pro Max sets new standards in mobile technology with its groundbreaking AI-powered features, incredible battery life, and unmatched performance. The 6.7-inch Super Retina XDR display delivers vivid colors and sharp details, perfect for everything from streaming to photo editing. Equipped with a top-tier A18 Bionic chip and an enhanced triple-lens camera, the iPhone 16 Pro Max captures professional-quality photos and videos in any lighting. Experience seamless multitasking and fast performance, whether gaming, working, or exploring advanced AR applications. With robust 5G connectivity and iOS\'s latest enhancements, this phone provides an efficient, smooth experience for every task. Its sleek design and durability make it as stylish as it is powerful.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Discover the next level of mobile technology with the iPhone 16 Pro Max. Featuring advanced AI capabilities, a stunning display, and powerful performance, this device is crafted for those who want the ultimate smartphone experience.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is available on all iPhone 16 Pro Max orders, typically shipping within 2-3 business days. Express delivery options are available at checkout for faster arrival. We offer a 30-day return policy from the delivery date for a full refund, provided the phone is returned in its original packaging and condition.</span></h5>', '3', 210000.00, 220000.00, 33, 8, 5, 'Yes', '65', '1010', 'Yes', 52, 1, '2024-10-12 05:35:51', '2024-10-12 05:37:19'),
(12, 'Apple iPad mini (2021) – Compact Power, Big Possibilities', 'apple-ipad-mini-2021-compact-power-big-possibilities', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The 2021 Apple iPad mini is a portable powerhouse, combining the advanced A15 Bionic chip with an immersive 8.3-inch Liquid Retina display for stunning visuals and smooth performance. Its compact size makes it easy to carry, while 5G connectivity and a 12MP Ultra Wide front camera support seamless video calls, streaming, and online gaming. The iPad mini supports the second-generation Apple Pencil, transforming it into a versatile tool for note-taking, creative work, and productivity on the go. With Touch ID for secure authentication, up to 10 hours of battery life, and a range of accessories available, the iPad mini is built for endless possibilities in a compact design.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Apple iPad mini (2021) packs impressive power and versatility into a sleek, compact design. With an 8.3-inch Liquid Retina display, powerful A15 Bionic chip, and 5G capabilities, it’s ideal for work, play, and everything in between.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on the Apple iPad mini (2021), with orders usually dispatched within 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery for a full refund if the product is returned in its original condition and packaging.</span></h5>', '4', 64900.00, 70000.00, 33, 13, 5, 'Yes', '67', '1010', 'Yes', 39, 1, '2024-10-12 06:10:56', '2024-10-12 06:10:56'),
(13, 'Samsung Galaxy Tab S10 Ultra – The Ultimate Tablet Experience', 'samsung-galaxy-tab-s10-ultra-the-ultimate-tablet-experience', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience the pinnacle of tablet technology with the Samsung Galaxy Tab S10 Ultra. Featuring a stunning, large Super AMOLED display with vibrant colors and sharp detail, the Tab S10 Ultra offers an unparalleled viewing experience. Powered by a high-performance processor and ample RAM, this tablet is designed for smooth multitasking, immersive gaming, and professional-grade productivity. Its sleek design and lightweight build make it easy to carry, while its powerful battery ensures long-lasting performance. Equipped with a versatile camera system, it’s perfect for capturing high-quality photos and videos, and the included S Pen elevates creativity and productivity, allowing for precise note-taking, drawing, and more.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Samsung Galaxy Tab S10 Ultra redefines what a tablet can do with its expansive display, high-powered performance, and advanced features. Perfect for entertainment, productivity, and creativity on the go.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Samsung Galaxy Tab S10 Ultra orders, with a typical dispatch time of 2-3 business days. Expedited shipping is available for an additional fee. Returns are accepted within 30 days of delivery for a full refund, provided the tablet is returned in its original condition and packaging.</span></h5>', '4,12', 130000.00, 135000.00, 33, 13, 2, 'Yes', '66', '1010', 'Yes', 40, 1, '2024-10-12 06:24:14', '2024-10-12 06:24:14'),
(14, 'Acer Predator Helios Neo16 PHN16-72-74W1', 'acer-predator-helios-neo16-phn16-72-74w1', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Unleash your gaming potential with the Acer Predator Helios Neo16 PHN16-72-74W1, crafted for the ultimate gaming experience. Equipped with a powerful Intel Core processor and NVIDIA GeForce RTX graphics, this gaming laptop delivers smooth, ultra-fast performance for the most demanding games and applications. Its 16-inch display boasts a high refresh rate and stunning color accuracy, allowing for a fully immersive visual experience. Advanced cooling technology ensures that the Helios Neo16 remains cool even during intense gaming sessions, while its durable, sleek design makes it a stylish addition to any setup. Built for gamers, creators, and professionals alike, the Helios Neo16 provides seamless multitasking and unbeatable performance.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Acer Predator Helios Neo16 PHN16-72-74W1 is a high-performance gaming laptop designed for serious gamers. With advanced graphics, powerful processing, and a stunning display, it offers an immersive gaming experience like no other.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is available on all Acer Predator Helios Neo16 PHN16-72-74W1 orders, with most shipments dispatched within 2-3 business days. Expedited shipping options are also offered at checkout. Returns are accepted within 30 days of delivery, provided the laptop is in its original condition and packaging.</span></h5>', '8', 200000.00, 210000.00, 37, 12, 6, 'Yes', '68', '1040', 'Yes', 18, 1, '2024-10-12 06:45:27', '2024-10-12 10:16:12'),
(15, 'Meta Quest 3 128GB – Next-Gen Immersive VR Experience', 'meta-quest-3-128gb-next-gen-immersive-vr-experience', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Meta Quest 3 128GB redefines virtual reality with cutting-edge technology and user-focused design. Equipped with a powerful processor and high-resolution display, it brings immersive VR experiences to life with incredible clarity and realism. With enhanced motion tracking and ergonomic controls, navigating virtual worlds feels natural and intuitive. The standalone design eliminates the need for cables, providing complete freedom to move and explore. Lightweight and comfortable, the Meta Quest 3 is perfect for extended sessions, whether gaming, watching VR videos, or exploring new environments. With access to a wide array of apps and games, it offers endless entertainment possibilities in a single device.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Step into a new reality with the Meta Quest 3 128GB. This advanced VR headset delivers high-resolution visuals, enhanced tracking, and intuitive controls for a truly immersive experience.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">We provide free standard shipping on Meta Quest 3 128GB orders, with most items shipped within 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery for a full refund, as long as the headset is returned in its original packaging and condition.</span></h5>', '', 75000.00, NULL, 39, 15, 7, 'Yes', '69', '1060', 'Yes', 27, 1, '2024-10-12 10:58:33', '2024-10-12 10:58:33'),
(16, 'Meta Quest Pro 256 – Advanced All-in-One VR Headset', 'meta-quest-pro-256-advanced-all-in-one-vr-headset', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Meta Quest Pro 256 redefines virtual reality with its high-performance capabilities, offering an all-in-one VR experience designed for both professional and personal use. With its sharp, high-resolution display, advanced optics, and powerful Snapdragon processor, the Quest Pro provides incredibly immersive visuals and smooth performance. The ergonomic design ensures comfort during extended use, while adjustable straps and balanced weight distribution enhance stability. Whether you’re collaborating in a virtual workspace, diving into games, or exploring immersive applications, the Quest Pro 256 delivers precision and a truly captivating experience. It comes with intuitive controllers and inside-out tracking, eliminating the need for external sensors and providing a seamless setup.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Step into a new reality with the Meta Quest Pro 256. Featuring powerful processing, crystal-clear visuals, and enhanced comfort, this VR headset offers a premium experience for work, play, and exploration.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is available on all Meta Quest Pro 256 orders, typically dispatching within 2-3 business days. Expedited shipping options are also available for a fee. Returns are accepted within 30 days of delivery, provided the product is returned in its original condition and packaging.</span></h5>', '15', 180000.00, NULL, 39, 15, 7, 'Yes', '70', '1060', 'Yes', 26, 1, '2024-10-12 11:10:30', '2024-10-12 11:10:30'),
(17, 'Epson V11HA47020MB Pro – High-Performance Projector', 'epson-v11ha47020mb-pro-high-performance-projector', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Epson V11HA47020MB Pro projector is engineered for excellence, providing bright, crisp, and true-to-life visuals that are perfect for professional and personal use. Equipped with Epson\'s advanced projection technology, it offers impressive brightness, contrast, and color accuracy, even in well-lit environments. Its compact design and easy setup make it versatile for any space, while multiple connectivity options allow for seamless integration with various devices. With energy-efficient features and long-lasting lamp life, the Epson V11HA47020MB Pro is built for reliability and longevity, making it a top choice for business presentations, educational purposes, and home theater experiences.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Epson V11HA47020MB Pro projector delivers outstanding image quality, brightness, and reliability. Ideal for presentations, classrooms, and home theaters, this projector ensures vivid visuals in any setting.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Standard shipping is free on all Epson V11HA47020MB Pro orders, typically dispatched within 2-3 business days. Expedited shipping is available for an additional charge at checkout. Returns are accepted within 30 days of delivery for a full refund, as long as the projector is in its original packaging and condition.</span></h5>', '9,10', 85000.00, 90000.00, 38, 14, 8, 'Yes', '71', '1050', 'Yes', 32, 1, '2024-10-12 11:27:43', '2024-10-12 11:27:43'),
(18, 'Apple Watch Series 10 Aluminum – Smart, Stylish, and Advanced', 'apple-watch-series-10-aluminum-smart-stylish-and-advanced', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Apple Watch Series 10 Aluminum combines elegance and functionality to bring you a smartwatch that keeps up with your active life. Equipped with a vivid Retina display, the Series 10 provides clear visibility in any lighting. It features advanced health and fitness tracking, including heart rate monitoring, blood oxygen measurement, ECG, and more, empowering you to keep track of your wellness goals. With updated GPS, faster processing, and enhanced battery life, this watch makes it easy to stay connected on the go. Designed with lightweight yet durable aluminum, the Apple Watch Series 10 is water-resistant and built to handle your day-to-day activities, making it a perfect blend of style, durability, and innovation.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Stay connected and motivated with the Apple Watch Series 10 Aluminum. This sleek smartwatch offers advanced health features, enhanced connectivity, and a durable aluminum design that fits any lifestyle.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">We offer free standard shipping on all Apple Watch Series 10 Aluminum orders, typically dispatched within 2-3 business days. Expedited shipping options are available for an additional fee. Returns are accepted within 30 days of delivery, provided the watch is returned in its original packaging and condition.</span></h5>', '', 45000.00, 50000.00, 40, 16, 5, 'Yes', '72', '1070', 'Yes', 37, 1, '2024-10-12 11:39:46', '2024-10-12 11:39:46'),
(19, 'D-Link R15 AX1500 Wi-Fi 6 Smart Router', 'd-link-r15-ax1500-wi-fi-6-smart-router', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The D-Link R15 AX1500 Wi-Fi 6 Smart Router brings the latest in wireless technology to your home or office, delivering next-generation speed and stability. Powered by Wi-Fi 6, it offers faster speeds and increased capacity to support multiple devices without lag or interruptions. This smart router features MU-MIMO and OFDMA technology, ensuring efficient data distribution for gaming, streaming, and browsing across all connected devices. With enhanced security features and intelligent network management, the D-Link R15 keeps your network safe while offering seamless control through its user-friendly app. Ideal for smart homes and offices, the AX1500 provides extended coverage and a reliable connection, transforming your internet experience.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Upgrade to the D-Link R15 AX1500 Wi-Fi 6 Smart Router for faster speeds, greater capacity, and improved efficiency. Perfect for high-speed browsing, streaming, and gaming with enhanced coverage and seamless connectivity.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all D-Link R15 AX1500 Wi-Fi 6 Smart Router orders, with most shipments dispatched within 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery, provided the router is returned in its original packaging and condition.</span></h5>', '', 4500.00, 5500.00, 41, 17, 9, 'Yes', '73', '1070', 'Yes', 40, 1, '2024-10-12 11:58:33', '2024-10-12 11:58:33'),
(20, 'Samsung Galaxy Watch7 – Redefine Your Fitness and Style', 'samsung-galaxy-watch7-redefine-your-fitness-and-style', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Stay connected and motivated with the Samsung Galaxy Watch7, designed for those who prioritize health, style, and productivity. Featuring a crisp, high-resolution display, the Watch7 makes it easy to check notifications, track workouts, and monitor your health stats at a glance. Its advanced fitness and health features include heart rate monitoring, SpO2 tracking, and sleep analysis, helping you reach your wellness goals with ease. The sleek design and customizable watch faces allow you to match your watch to any outfit or occasion, and the durable build ensures it can handle everyday wear. With up to several days of battery life, this watch is designed to keep up with you all day and night.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Samsung Galaxy Watch7 is the ultimate smartwatch for those who value fitness and connectivity. Packed with advanced health tracking, a stylish design, and long-lasting battery life, it’s the perfect companion for any lifestyle.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Samsung Galaxy Watch7 purchases, with orders typically dispatched within 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery, provided the watch is returned in its original condition and packaging.</span></h5>', '18', 35000.00, NULL, 40, 16, 2, 'Yes', '74', '1020', 'Yes', 28, 1, '2024-10-12 12:09:24', '2024-10-12 12:09:24'),
(21, 'PRO X SUPERLIGHT 2 – Precision at the Speed of Light', 'pro-x-superlight-2-precision-at-the-speed-of-light', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience the ultimate in precision and speed with the PRO X SUPERLIGHT 2 gaming mouse. Weighing under 63 grams, this mouse is one of the lightest on the market, allowing for swift, effortless movement with zero drag. Equipped with an advanced HERO sensor, it offers pixel-perfect tracking at speeds up to 25,600 DPI, ensuring peak performance in even the most intense gaming scenarios. The wireless, lag-free connectivity guarantees seamless gameplay, while its ergonomic design is crafted for maximum comfort over long sessions. Built for eSports professionals and enthusiasts alike, the PRO X SUPERLIGHT 2 provides the reliability, speed, and control you need to dominate the competition.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The PRO X SUPERLIGHT 2 is an ultra-lightweight, high-precision gaming mouse built for competitive gaming. With a sleek, wireless design and advanced sensor technology, it offers unmatched accuracy and responsiveness for serious gamers.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is available for the PRO X SUPERLIGHT 2, with orders generally dispatched within 2-3 business days. Expedited shipping options are also available at checkout. We accept returns within 30 days of delivery for a full refund, provided the mouse is in its original condition and packaging.</span></h5>', '', 14500.00, 15000.00, 42, 18, 10, 'Yes', '75', '1070', 'Yes', 33, 1, '2024-10-13 01:20:55', '2024-10-13 01:20:55'),
(22, 'PRO X TKL – Compact and High-Performance Gaming Keyboard', 'pro-x-tkl-compact-and-high-performance-gaming-keyboard', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The PRO X TKL gaming keyboard delivers a powerful performance in a compact form factor, ideal for gamers looking for speed and accuracy. Its tenkeyless design saves space without sacrificing functionality, giving you more room for mouse movement. Equipped with swappable mechanical switches, the PRO X TKL allows you to customize your keystrokes for an optimal gaming experience. With vibrant RGB backlighting, you can personalize each key and create immersive lighting effects that sync with your gameplay. Durable and reliable, the PRO X TKL is built to withstand intense gaming sessions, making it a perfect choice for competitive players.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The PRO X TKL is a top-tier tenkeyless gaming keyboard designed for performance and precision. Featuring swappable switches, customizable RGB lighting, and a compact design, it’s crafted for competitive gaming.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is available on all PRO X TKL keyboard orders, with most shipments dispatched within 2-3 business days. Expedited shipping options are available at checkout for faster delivery. Returns are accepted within 30 days of delivery, provided the keyboard is in its original packaging and pristine condition.</span></h5>', '21', 15000.00, NULL, 42, 19, 10, 'Yes', '76', '1070', 'Yes', 28, 1, '2024-10-13 01:39:18', '2024-10-13 01:39:18'),
(23, 'G840 The Return of the Jedi™ Collection Gaming Mouse Pad', 'g840-the-return-of-the-jedi-collection-gaming-mouse-pad', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The G840 The Return of the Jedi™ Collection XL Gaming Mouse Pad combines premium performance with the iconic Star Wars™ universe. Designed with an oversized surface, it provides ample space for both your mouse and keyboard, allowing for unrestricted movement and precision. The smooth, low-friction surface enhances tracking accuracy, making it ideal for fast-paced gaming. Crafted from durable materials, this mouse pad is built to withstand intense gaming sessions, while its anti-slip rubber base keeps it firmly in place. The unique Return of the Jedi™ design makes it a must-have collectible for Star Wars™ enthusiasts, bringing a piece of the galaxy far, far away to your desk.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Celebrate the legendary Star Wars™ saga with the G840 The Return of the Jedi™ Collection XL Gaming Mouse Pad. With an expansive surface and smooth glide, it’s perfect for gamers and fans alike.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\">We offer free standard shipping on all G840 The Return of the Jedi™ Collection XL Gaming Mouse Pad orders, with dispatch typically within 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery, provided the mouse pad is in its original condition and packaging.</h5>', '', 7000.00, NULL, 42, 23, 10, 'Yes', '70', '1070', 'Yes', 10, 1, '2024-10-13 01:50:17', '2024-10-13 07:15:02'),
(24, 'Transcend 256GB JetFlash 790C USB Type-C 3.2 Gen 1 Flash Drive', 'transcend-256gb-jetflash-790c-usb-type-c-32-gen-1-flash-drive', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Compact and powerful, the Transcend 256GB JetFlash 790C USB Type-C 3.2 Gen 1 Flash Drive is engineered for quick data transfer and robust storage capacity. Featuring a USB Type-C 3.2 Gen 1 interface, this flash drive offers transfer speeds that significantly reduce waiting time for file backups and sharing. With a generous 256GB storage, it’s ideal for students, professionals, and anyone needing reliable storage for documents, photos, videos, and more. Its retractable design protects the connector, enhancing durability and portability, while its lightweight build ensures convenience wherever you go. The JetFlash 790C is compatible with various devices, from laptops to mobile devices, making it an essential tool for those who value speed, security, and space.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Transcend 256GB JetFlash 790C offers reliable, high-speed data transfer with a USB Type-C interface, making it perfect for quick backups, file sharing, and storing large files on the go.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Transcend 256GB JetFlash 790C orders, with most items shipped within 2-3 business days. Expedited shipping options are available at checkout. We offer returns within 30 days of delivery for a full refund, provided the item is returned in its original packaging and condition.</span></h5>', '', 2700.00, 3000.00, 42, 21, 11, 'Yes', '77', '1070', 'Yes', 50, 1, '2024-10-13 02:01:32', '2024-10-13 02:01:32'),
(25, 'DM50 USB Condenser Microphone – Studio-Quality Sound', 'dm50-usb-condenser-microphone-studio-quality-sound', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Achieve studio-quality audio with the DM50 USB Condenser Microphone, designed for creators who prioritize sound clarity and ease of use. This plug-and-play USB microphone features a high-sensitivity condenser capsule that captures nuanced vocals and sounds with exceptional detail, making it ideal for podcasts, streaming, gaming, and music recording. Its cardioid polar pattern reduces background noise, focusing on your voice for clear, precise sound. The durable design and compact build make it versatile for any desk setup, while onboard controls let you easily adjust volume and mute. Compatible with both Windows and Mac, the DM50 USB Condenser Microphone is the perfect choice for professional-level recording without the need for complicated equipment.</span><span style=\"font-family: &quot;Times New Roman&quot;;\">﻿</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The DM50 USB Condenser Microphone is perfect for streamers, podcasters, and content creators seeking professional audio quality. With easy USB connectivity, it delivers crystal-clear sound for any setup.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is provided on all DM50 USB Condenser Microphone orders, with most orders shipping within 2-3 business days. Expedited shipping options are available for an additional fee. Returns are accepted within 30 days of delivery, provided the microphone is returned in its original packaging and pristine condition.</span></h5>', '', 5000.00, NULL, 42, 24, 12, 'Yes', '79', '1070', 'Yes', 47, 1, '2024-10-13 02:10:13', '2024-10-14 05:16:15'),
(26, 'MaxGreen MG-LI-EAP-2000VA 2000VA UPS', 'maxgreen-mg-li-eap-2000va-2000va-ups', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The MaxGreen MG-LI-EAP-2000VA 2000VA UPS is designed to deliver consistent power backup for your essential devices, preventing data loss and hardware damage during power outages. With a 2000VA capacity, this UPS can support multiple devices simultaneously, making it ideal for home offices, small businesses, and personal setups. Equipped with advanced surge protection, it defends against sudden voltage spikes, ensuring your sensitive electronics stay protected. The MaxGreen UPS also features an efficient charging system, which helps maintain battery health and extends its lifespan. With its compact design and easy setup, the MG-LI-EAP-2000VA UPS provides peace of mind and essential protection for your valuable equipment.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">The MaxGreen MG-LI-EAP-2000VA 2000VA UPS provides stable and reliable power backup to safeguard your devices from unexpected power interruptions, ensuring uninterrupted productivity and protection for your electronics.</span><span style=\"font-family: &quot;Times New Roman&quot;;\">﻿</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all MaxGreen MG-LI-EAP-2000VA 2000VA UPS orders, with dispatch typically within 2-3 business days. Expedited shipping is available at checkout. Returns are accepted within 30 days of delivery, provided the UPS is returned in its original packaging and pristine condition.</span></h5>', '', 11000.00, 12000.00, 42, 22, 13, 'Yes', '78', '1070', 'Yes', 18, 1, '2024-10-13 07:13:37', '2024-10-13 07:13:37'),
(27, 'Marsriva KP1 EC Mini DC UPS – Reliable Backup Power', 'marsriva-kp1-ec-mini-dc-ups-reliable-backup-power', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Marsriva KP1 EC 18W 8000mAh Mini DC UPS is a compact and powerful solution to keep your essential devices running during power interruptions. Designed with an 8000mAh battery capacity and delivering 18W of power, this mini UPS is perfect for routers, modems, cameras, and other small electronics. It ensures stable power output to prevent device reset or disruption, making it ideal for home and office environments. Its portable design makes it easy to install and operate, while built-in overcharge and over-discharge protection extends battery life, ensuring safe and reliable operation for years to come.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Marsriva KP1 EC Mini DC UPS offers 18W power and an 8000mAh battery, ensuring uninterrupted power for your devices. Ideal for routers, modems, and other electronics during power outages.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is provided on all Marsriva KP1 EC 18W 8000mAh Mini DC UPS orders, typically dispatched within 2-3 business days. Expedited shipping options are available for a fee. Returns are accepted within 30 days of delivery, provided the item is in its original condition and packaging.</span></h5>', '26', 3500.00, 4000.00, 42, 22, 14, 'Yes', '80', '1070', 'Yes', 50, 1, '2024-10-13 07:23:20', '2024-10-13 07:26:48'),
(28, 'Awei A997 Pro ANC Wireless Bluetooth Headphones', 'awei-a997-pro-anc-wireless-bluetooth-headphones', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Awei A997 Pro ANC Wireless Bluetooth Headphones offer a premium listening experience with powerful sound and effective Active Noise Cancellation (ANC) technology. Equipped with advanced Bluetooth connectivity, these headphones provide seamless audio transmission with minimal latency, ideal for both music and calls. The over-ear design with soft cushioning ensures long-lasting comfort, while the ANC feature blocks out background noise, allowing for an uninterrupted, immersive audio experience. With a long-lasting battery life, the A997 Pro can handle extended listening sessions and comes with on-ear controls for easy access to volume, track changes, and calls. These headphones are designed for convenience and style, making them a perfect travel companion.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience high-quality sound and active noise cancellation with the Awei A997 Pro ANC Wireless Bluetooth Headphones. Designed for immersive audio and comfort, these headphones are perfect for music lovers and travelers alike.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Awei A997 Pro ANC Wireless Bluetooth Headphones orders, typically dispatched within 2-3 business days. Expedited shipping options are available at checkout. We accept returns within 30 days of delivery for a full refund, provided the headphones are returned in their original packaging and pristine condition.</span></h5>', '', 6000.00, 7500.00, 42, 20, 15, 'Yes', '81', '1070', 'Yes', 65, 1, '2024-10-13 07:35:34', '2024-10-13 07:35:34');
INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_returns`, `related_products`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(29, 'ViewSonic VX3219-PC-MHD – Immersive 32-Inch Curved Gaming Monitor', 'viewsonic-vx3219-pc-mhd-immersive-32-inch-curved-gaming-monitor', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The ViewSonic VX3219-PC-MHD offers gamers an immersive viewing experience with its 32-inch curved Full HD display. Built with a 240Hz refresh rate and 1ms response time, this monitor provides smooth, lag-free visuals for fast-paced games, ensuring every detail is clear and vibrant. Its 1500R curvature wraps around your field of vision, pulling you deeper into the game. AMD FreeSync technology further enhances gameplay by reducing screen tearing and stuttering, allowing for fluid movement during intense gaming sessions. With flexible connectivity options and a sleek, minimalistic design, the VX3219-PC-MHD fits seamlessly into any gaming setup, making it the perfect choice for both casual and competitive gamers.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">The ViewSonic VX3219-PC-MHD is a 32-inch curved gaming monitor with Full HD resolution, ultra-fast refresh rate, and stunning visuals. Designed for immersive gameplay, it delivers smooth performance and vivid colors for an enhanced gaming experience.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">We offer free standard shipping on all ViewSonic VX3219-PC-MHD orders, with a typical dispatch time of 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery, provided the monitor is returned in its original packaging and condition.</span></h5>', '6,5', 45000.00, 48000.00, 35, 9, 16, 'Yes', '82', '1030', 'Yes', 38, 1, '2024-10-13 07:49:15', '2024-10-13 07:49:15'),
(30, 'TP-Link EAP610-Outdoor AX1800 –WiFi 6 Access Poin', 'tp-link-eap610-outdoor-ax1800-wifi-6-access-poin', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The TP-Link EAP610-Outdoor AX1800 is a high-performance WiFi 6 access point designed to extend robust, high-speed WiFi coverage indoors and outdoors. Supporting speeds up to 1800 Mbps, it’s perfect for large outdoor areas, commercial spaces, and events requiring reliable connectivity. Equipped with MU-MIMO and OFDMA technology, this access point efficiently manages numerous devices at once, minimizing latency and ensuring seamless streaming, gaming, and data transfers. Its rugged, weatherproof design is built to withstand harsh outdoor conditions, while easy installation and centralized cloud management through Omada ensure simple deployment and control. Whether for residential or commercial use, the TP-Link EAP610-Outdoor delivers a seamless, next-generation network experience.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">The TP-Link EAP610-Outdoor AX1800 WiFi 6 Access Point delivers high-speed, reliable connectivity for both indoor and outdoor spaces. With advanced WiFi 6 technology, this access point ensures fast and stable network performance for multiple devices, even in large areas.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">We provide free standard shipping for the TP-Link EAP610-Outdoor AX1800 orders, typically dispatched within 2-3 business days. Expedited shipping options are available during checkout. Returns are accepted within 30 days of delivery, provided the access point is in its original condition and packaging.</span></h5>', '19', 13000.00, NULL, 41, 25, 17, 'Yes', '83', '1060', 'Yes', 24, 1, '2024-10-13 08:00:51', '2024-10-14 05:20:34'),
(31, 'Amazfit GTS 4 Mini Smart Watch Global Version', 'amazfit-gts-4-mini-smart-watch-global-version', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Amazfit GTS 4 Mini Smart Watch Global Version combines a sleek, lightweight design with powerful functionality, making it a perfect companion for any lifestyle. Featuring a vibrant AMOLED display, this smartwatch offers an impressive array of health and fitness tracking features, including heart rate monitoring, sleep tracking, blood oxygen measurement, and over 120 sports modes. Its water-resistant build ensures durability, while the built-in GPS allows for accurate outdoor activity tracking. With extended battery life, the GTS 4 Mini provides up to two weeks of use on a single charge, keeping you connected without frequent recharges. Compatible with Android and iOS, it’s ideal for those seeking a compact, all-in-one device for health, fitness, and convenience.</span></h5>', '<h5 class=\"\" style=\"text-align: justify;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Amazfit GTS 4 Mini Smart Watch Global Version is a feature-packed smartwatch with a compact design, offering comprehensive health tracking, fitness monitoring, and essential smart features for your daily needs.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Free standard shipping is available on all Amazfit GTS 4 Mini Smart Watch Global Version orders, with dispatch usually within 2-3 business days. Expedited shipping options are available at checkout. Returns are accepted within 30 days of delivery, provided the watch is in its original packaging and unused condition</span></h5>', '20,18', 10000.00, 12000.00, 40, 16, 18, 'Yes', '84', '1040', 'Yes', 59, 1, '2024-10-13 08:12:09', '2024-10-15 11:27:58'),
(32, 'Motorola Edge 50 Ultra – Speed, Power, and Elegance', 'motorola-edge-50-ultra-speed-power-and-elegance', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Experience the pinnacle of mobile technology with the Motorola Edge 50 Ultra. Powered by a state-of-the-art processor, this smartphone ensures smooth, fast performance, perfect for multitasking, gaming, and high-definition streaming. The 6.8-inch OLED display with an ultra-high refresh rate delivers vibrant colors and sharp details, bringing visuals to life with incredible fluidity. Its triple-camera system, featuring advanced sensors, allows for breathtaking photos and videos, even in low light. With a robust battery and fast-charging capabilities, the Edge 50 Ultra keeps you connected throughout the day. Encased in a sleek, durable design, this phone combines modern elegance with powerful functionality, making it a top choice for tech enthusiasts.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; \"><span style=\"font-family: &quot;Times New Roman&quot;;\">The Motorola Edge 50 Ultra delivers cutting-edge performance and stunning visuals with its powerful processor, high-refresh-rate display, and sleek design. Engineered for those who demand both style and substance.</span></h5>', '<h5 class=\"\" style=\"text-align: justify; margin-left: 25px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Enjoy free standard shipping on all Motorola Edge 50 Ultra orders, dispatched within 2-3 business days. Expedited shipping options are available at checkout. We accept returns within 30 days of delivery for a full refund, provided the device is returned in its original condition and packaging.</span></h5>', '3,11', 120000.00, 125000.00, 33, 4, 19, 'Yes', '85', '1010', 'Yes', 5, 1, '2024-10-13 08:22:32', '2024-10-13 12:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(9, 3, '3-9-1728714148.png', NULL, '2024-10-12 00:22:28', '2024-10-12 00:22:28'),
(10, 3, '3-10-1728714150.png', NULL, '2024-10-12 00:22:30', '2024-10-12 00:22:30'),
(11, 3, '3-11-1728714151.png', NULL, '2024-10-12 00:22:31', '2024-10-12 00:22:31'),
(12, 3, '3-12-1728714152.png', NULL, '2024-10-12 00:22:32', '2024-10-12 00:22:32'),
(13, 4, '4-13-1728719189.png', NULL, '2024-10-12 01:46:29', '2024-10-12 01:46:29'),
(14, 4, '4-14-1728719190.png', NULL, '2024-10-12 01:46:30', '2024-10-12 01:46:30'),
(15, 4, '4-15-1728719190.png', NULL, '2024-10-12 01:46:30', '2024-10-12 01:46:30'),
(16, 4, '4-16-1728719191.png', NULL, '2024-10-12 01:46:31', '2024-10-12 01:46:31'),
(17, 5, '5-17-1728719954.png', NULL, '2024-10-12 01:59:14', '2024-10-12 01:59:14'),
(18, 5, '5-18-1728719955.png', NULL, '2024-10-12 01:59:15', '2024-10-12 01:59:15'),
(19, 5, '5-19-1728719956.png', NULL, '2024-10-12 01:59:16', '2024-10-12 01:59:16'),
(20, 5, '5-20-1728719956.png', NULL, '2024-10-12 01:59:16', '2024-10-12 01:59:16'),
(21, 6, '6-21-1728720620.png', NULL, '2024-10-12 02:10:20', '2024-10-12 02:10:20'),
(22, 6, '6-22-1728720620.png', NULL, '2024-10-12 02:10:20', '2024-10-12 02:10:20'),
(23, 6, '6-23-1728720621.png', NULL, '2024-10-12 02:10:21', '2024-10-12 02:10:21'),
(24, 6, '6-24-1728720621.png', NULL, '2024-10-12 02:10:21', '2024-10-12 02:10:21'),
(25, 7, '7-25-1728723710.png', NULL, '2024-10-12 03:01:50', '2024-10-12 03:01:50'),
(26, 7, '7-26-1728723710.png', NULL, '2024-10-12 03:01:50', '2024-10-12 03:01:50'),
(27, 7, '7-27-1728723711.png', NULL, '2024-10-12 03:01:50', '2024-10-12 03:01:51'),
(28, 7, '7-28-1728723711.png', NULL, '2024-10-12 03:01:51', '2024-10-12 03:01:51'),
(29, 8, '8-29-1728724363.png', NULL, '2024-10-12 03:12:43', '2024-10-12 03:12:43'),
(30, 8, '8-30-1728724363.png', NULL, '2024-10-12 03:12:43', '2024-10-12 03:12:43'),
(31, 8, '8-31-1728724364.png', NULL, '2024-10-12 03:12:44', '2024-10-12 03:12:44'),
(32, 8, '8-32-1728724364.png', NULL, '2024-10-12 03:12:44', '2024-10-12 03:12:44'),
(33, 9, '9-33-1728730870.png', NULL, '2024-10-12 05:01:10', '2024-10-12 05:01:10'),
(34, 9, '9-34-1728730870.png', NULL, '2024-10-12 05:01:10', '2024-10-12 05:01:10'),
(35, 9, '9-35-1728730871.png', NULL, '2024-10-12 05:01:11', '2024-10-12 05:01:11'),
(36, 9, '9-36-1728730871.png', NULL, '2024-10-12 05:01:11', '2024-10-12 05:01:11'),
(37, 10, '10-37-1728732471.png', NULL, '2024-10-12 05:27:51', '2024-10-12 05:27:51'),
(38, 10, '10-38-1728732472.png', NULL, '2024-10-12 05:27:52', '2024-10-12 05:27:52'),
(39, 10, '10-39-1728732474.png', NULL, '2024-10-12 05:27:54', '2024-10-12 05:27:54'),
(40, 10, '10-40-1728732475.png', NULL, '2024-10-12 05:27:55', '2024-10-12 05:27:55'),
(45, 11, '11-45-1728732996.png', NULL, '2024-10-12 05:36:36', '2024-10-12 05:36:36'),
(46, 11, '11-46-1728733000.png', NULL, '2024-10-12 05:36:40', '2024-10-12 05:36:40'),
(47, 11, '11-47-1728733002.png', NULL, '2024-10-12 05:36:42', '2024-10-12 05:36:42'),
(48, 11, '11-48-1728733004.png', NULL, '2024-10-12 05:36:44', '2024-10-12 05:36:44'),
(49, 12, '12-49-1728735056.png', NULL, '2024-10-12 06:10:56', '2024-10-12 06:10:56'),
(50, 12, '12-50-1728735058.png', NULL, '2024-10-12 06:10:58', '2024-10-12 06:10:58'),
(51, 12, '12-51-1728735060.png', NULL, '2024-10-12 06:11:00', '2024-10-12 06:11:00'),
(52, 13, '13-52-1728735854.png', NULL, '2024-10-12 06:24:14', '2024-10-12 06:24:14'),
(53, 13, '13-53-1728735857.png', NULL, '2024-10-12 06:24:17', '2024-10-12 06:24:17'),
(54, 13, '13-54-1728735859.png', NULL, '2024-10-12 06:24:19', '2024-10-12 06:24:19'),
(55, 14, '14-55-1728737127.png', NULL, '2024-10-12 06:45:27', '2024-10-12 06:45:27'),
(56, 14, '14-56-1728737127.png', NULL, '2024-10-12 06:45:27', '2024-10-12 06:45:27'),
(57, 14, '14-57-1728737128.png', NULL, '2024-10-12 06:45:28', '2024-10-12 06:45:28'),
(58, 14, '14-58-1728737128.png', NULL, '2024-10-12 06:45:28', '2024-10-12 06:45:28'),
(59, 15, '15-59-1728752313.png', NULL, '2024-10-12 10:58:33', '2024-10-12 10:58:33'),
(60, 15, '15-60-1728752314.png', NULL, '2024-10-12 10:58:34', '2024-10-12 10:58:34'),
(61, 15, '15-61-1728752316.png', NULL, '2024-10-12 10:58:36', '2024-10-12 10:58:36'),
(62, 16, '16-62-1728753030.png', NULL, '2024-10-12 11:10:30', '2024-10-12 11:10:30'),
(63, 16, '16-63-1728753032.png', NULL, '2024-10-12 11:10:32', '2024-10-12 11:10:32'),
(64, 16, '16-64-1728753033.png', NULL, '2024-10-12 11:10:33', '2024-10-12 11:10:33'),
(65, 16, '16-65-1728753035.png', NULL, '2024-10-12 11:10:35', '2024-10-12 11:10:35'),
(66, 17, '17-66-1728754063.png', NULL, '2024-10-12 11:27:43', '2024-10-12 11:27:43'),
(67, 17, '17-67-1728754067.png', NULL, '2024-10-12 11:27:47', '2024-10-12 11:27:47'),
(68, 17, '17-68-1728754069.png', NULL, '2024-10-12 11:27:49', '2024-10-12 11:27:49'),
(69, 17, '17-69-1728754071.png', NULL, '2024-10-12 11:27:51', '2024-10-12 11:27:51'),
(70, 18, '18-70-1728754786.png', NULL, '2024-10-12 11:39:46', '2024-10-12 11:39:46'),
(71, 18, '18-71-1728754788.png', NULL, '2024-10-12 11:39:48', '2024-10-12 11:39:48'),
(72, 18, '18-72-1728754789.png', NULL, '2024-10-12 11:39:49', '2024-10-12 11:39:49'),
(73, 18, '18-73-1728754790.png', NULL, '2024-10-12 11:39:50', '2024-10-12 11:39:50'),
(74, 19, '19-74-1728755913.png', NULL, '2024-10-12 11:58:33', '2024-10-12 11:58:33'),
(75, 19, '19-75-1728755913.png', NULL, '2024-10-12 11:58:33', '2024-10-12 11:58:33'),
(76, 19, '19-76-1728755913.png', NULL, '2024-10-12 11:58:33', '2024-10-12 11:58:33'),
(77, 19, '19-77-1728755914.png', NULL, '2024-10-12 11:58:34', '2024-10-12 11:58:34'),
(78, 20, '20-78-1728756564.png', NULL, '2024-10-12 12:09:24', '2024-10-12 12:09:24'),
(79, 20, '20-79-1728756565.png', NULL, '2024-10-12 12:09:25', '2024-10-12 12:09:25'),
(80, 20, '20-80-1728756565.png', NULL, '2024-10-12 12:09:25', '2024-10-12 12:09:25'),
(81, 20, '20-81-1728756566.png', NULL, '2024-10-12 12:09:26', '2024-10-12 12:09:26'),
(86, 21, '21-86-1728804095.png', NULL, '2024-10-13 01:21:35', '2024-10-13 01:21:35'),
(87, 21, '21-87-1728804104.png', NULL, '2024-10-13 01:21:44', '2024-10-13 01:21:44'),
(88, 21, '21-88-1728804106.png', NULL, '2024-10-13 01:21:46', '2024-10-13 01:21:46'),
(89, 21, '21-89-1728804108.png', NULL, '2024-10-13 01:21:48', '2024-10-13 01:21:48'),
(90, 22, '22-90-1728805158.png', NULL, '2024-10-13 01:39:18', '2024-10-13 01:39:18'),
(91, 22, '22-91-1728805158.png', NULL, '2024-10-13 01:39:18', '2024-10-13 01:39:18'),
(92, 22, '22-92-1728805159.png', NULL, '2024-10-13 01:39:19', '2024-10-13 01:39:19'),
(93, 22, '22-93-1728805159.png', NULL, '2024-10-13 01:39:19', '2024-10-13 01:39:19'),
(94, 23, '23-94-1728805817.png', NULL, '2024-10-13 01:50:17', '2024-10-13 01:50:17'),
(95, 23, '23-95-1728805818.png', NULL, '2024-10-13 01:50:18', '2024-10-13 01:50:18'),
(96, 23, '23-96-1728805818.png', NULL, '2024-10-13 01:50:18', '2024-10-13 01:50:18'),
(97, 24, '24-97-1728806492.png', NULL, '2024-10-13 02:01:32', '2024-10-13 02:01:32'),
(98, 24, '24-98-1728806492.png', NULL, '2024-10-13 02:01:32', '2024-10-13 02:01:32'),
(99, 24, '24-99-1728806493.png', NULL, '2024-10-13 02:01:33', '2024-10-13 02:01:33'),
(100, 25, '25-100-1728807013.png', NULL, '2024-10-13 02:10:13', '2024-10-13 02:10:13'),
(101, 25, '25-101-1728807013.png', NULL, '2024-10-13 02:10:13', '2024-10-13 02:10:13'),
(102, 25, '25-102-1728807014.png', NULL, '2024-10-13 02:10:14', '2024-10-13 02:10:14'),
(103, 25, '25-103-1728807014.png', NULL, '2024-10-13 02:10:14', '2024-10-13 02:10:14'),
(104, 26, '26-104-1728825217.png', NULL, '2024-10-13 07:13:37', '2024-10-13 07:13:37'),
(105, 27, '27-105-1728825800.png', NULL, '2024-10-13 07:23:20', '2024-10-13 07:23:20'),
(106, 27, '27-106-1728825801.png', NULL, '2024-10-13 07:23:21', '2024-10-13 07:23:21'),
(107, 27, '27-107-1728825801.png', NULL, '2024-10-13 07:23:21', '2024-10-13 07:23:21'),
(108, 28, '28-108-1728826534.png', NULL, '2024-10-13 07:35:34', '2024-10-13 07:35:34'),
(109, 28, '28-109-1728826535.png', NULL, '2024-10-13 07:35:35', '2024-10-13 07:35:35'),
(110, 29, '29-110-1728827355.png', NULL, '2024-10-13 07:49:15', '2024-10-13 07:49:15'),
(111, 29, '29-111-1728827356.png', NULL, '2024-10-13 07:49:16', '2024-10-13 07:49:16'),
(112, 29, '29-112-1728827357.png', NULL, '2024-10-13 07:49:17', '2024-10-13 07:49:17'),
(113, 29, '29-113-1728827357.png', NULL, '2024-10-13 07:49:17', '2024-10-13 07:49:17'),
(114, 30, '30-114-1728828051.png', NULL, '2024-10-13 08:00:51', '2024-10-13 08:00:51'),
(115, 30, '30-115-1728828052.png', NULL, '2024-10-13 08:00:52', '2024-10-13 08:00:52'),
(116, 30, '30-116-1728828052.png', NULL, '2024-10-13 08:00:52', '2024-10-13 08:00:52'),
(117, 31, '31-117-1728828729.png', NULL, '2024-10-13 08:12:09', '2024-10-13 08:12:09'),
(118, 31, '31-118-1728828730.png', NULL, '2024-10-13 08:12:10', '2024-10-13 08:12:10'),
(119, 31, '31-119-1728828730.png', NULL, '2024-10-13 08:12:10', '2024-10-13 08:12:10'),
(120, 31, '31-120-1728828731.png', NULL, '2024-10-13 08:12:11', '2024-10-13 08:12:11'),
(121, 32, '32-121-1728829352.png', NULL, '2024-10-13 08:22:32', '2024-10-13 08:22:32'),
(122, 32, '32-122-1728829353.png', NULL, '2024-10-13 08:22:33', '2024-10-13 08:22:33'),
(123, 32, '32-123-1728829354.png', NULL, '2024-10-13 08:22:34', '2024-10-13 08:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rating` double(3,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `username`, `email`, `comment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(7, 6, 'skip', 'sakibchy.bban.puc@gmail.com', 'gg', 4.00, 0, '2024-10-12 05:09:05', '2024-10-12 05:09:05'),
(8, 16, 'skip', 'sakibchy.bban.puc@gmail.com', 'a nice experience.', 5.00, 1, '2024-10-13 02:51:21', '2024-10-13 02:51:36'),
(9, 24, 'Afifa', 'sakibchy.bban.puc@gmail.com', 'Setisfied.', 4.00, 1, '2024-10-13 04:03:10', '2024-10-13 04:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `country_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, '20', 20.00, '2024-10-10 11:51:55', '2024-10-10 11:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `slug`, `status`, `showHome`, `category_id`, `created_at`, `updated_at`) VALUES
(4, 'Smartphone', 'smartphone', 1, 'Yes', 33, '2024-10-12 00:16:46', '2024-10-12 02:19:15'),
(8, 'iPhone', 'iphone', 1, 'Yes', 33, '2024-10-12 00:47:53', '2024-10-13 02:44:57'),
(9, 'Gaming Monitor', 'monitors-gaming-monitor', 1, 'Yes', 35, '2024-10-12 01:49:20', '2024-10-12 02:17:11'),
(10, 'Entertainment Monitor', 'monitors-entertainment-monitor', 1, 'Yes', 35, '2024-10-12 02:01:29', '2024-10-12 02:16:48'),
(11, 'Business & Productivity Series', 'laptop-business-productivity-series', 1, 'Yes', 37, '2024-10-12 02:16:16', '2024-10-12 02:16:16'),
(12, 'Gaming Laptop', 'gaming-laptop', 1, 'Yes', 37, '2024-10-12 03:03:16', '2024-10-12 03:03:16'),
(13, 'Tablat', 'tablat', 1, 'Yes', 33, '2024-10-12 06:05:52', '2024-10-12 06:05:52'),
(14, 'Projector Devices', 'projector-devices', 1, 'Yes', 38, '2024-10-12 07:15:59', '2024-10-12 07:15:59'),
(15, 'VR headsets', 'vr-headsets', 1, 'Yes', 39, '2024-10-12 10:54:14', '2024-10-12 10:54:14'),
(16, 'Smart Watch', 'smart-watch', 1, 'Yes', 40, '2024-10-12 11:36:55', '2024-10-12 11:36:55'),
(17, 'Routers', 'routers', 1, 'Yes', 41, '2024-10-12 11:53:18', '2024-10-12 11:53:18'),
(18, 'Mouse', 'mouse', 1, 'Yes', 42, '2024-10-13 00:46:33', '2024-10-13 00:46:33'),
(19, 'Keyboard', 'keyboard', 1, 'Yes', 42, '2024-10-13 00:47:09', '2024-10-13 00:47:09'),
(20, 'Headphone', 'headphone', 1, 'Yes', 42, '2024-10-13 00:47:57', '2024-10-13 00:47:57'),
(21, 'PenDrive', 'pendrive', 1, 'Yes', 42, '2024-10-13 00:48:41', '2024-10-13 00:48:58'),
(22, 'UPS', 'ups', 1, 'Yes', 42, '2024-10-13 00:49:58', '2024-10-13 00:49:58'),
(23, 'Mouse Pad', 'mouse-pad', 1, 'Yes', 42, '2024-10-13 00:50:35', '2024-10-13 00:50:35'),
(24, 'Microphone', 'microphone', 1, 'Yes', 42, '2024-10-13 00:57:04', '2024-10-13 00:57:04'),
(25, 'Access Point & Range Extender', 'access-point-range-extender', 1, 'Yes', 41, '2024-10-13 07:55:45', '2024-10-13 07:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '1-1728578390.png', '2024-10-10 10:39:50', '2024-10-10 10:39:50'),
(2, '2-1728578749.png', '2024-10-10 10:45:49', '2024-10-10 10:45:49'),
(3, '3-1728579029.png', '2024-10-10 10:50:28', '2024-10-10 10:50:29'),
(4, '4-1728580508.png', '2024-10-10 11:15:08', '2024-10-10 11:15:08'),
(5, '5-1728580510.png', '2024-10-10 11:15:10', '2024-10-10 11:15:10'),
(6, '6-1728580513.png', '2024-10-10 11:15:13', '2024-10-10 11:15:13'),
(7, '7-1728580515.png', '2024-10-10 11:15:15', '2024-10-10 11:15:15'),
(8, '8-1728580775.png', '2024-10-10 11:19:35', '2024-10-10 11:19:35'),
(9, '9-1728580777.png', '2024-10-10 11:19:37', '2024-10-10 11:19:37'),
(10, '10-1728580779.png', '2024-10-10 11:19:39', '2024-10-10 11:19:39'),
(11, '11-1728580781.png', '2024-10-10 11:19:41', '2024-10-10 11:19:41'),
(12, '12-1728581368.png', '2024-10-10 11:29:28', '2024-10-10 11:29:28'),
(13, '13-1728581370.png', '2024-10-10 11:29:30', '2024-10-10 11:29:30'),
(14, '14-1728581371.png', '2024-10-10 11:29:31', '2024-10-10 11:29:31'),
(15, '15-1728581372.png', '2024-10-10 11:29:32', '2024-10-10 11:29:32'),
(16, '16-1728711829.png', '2024-10-11 23:43:49', '2024-10-11 23:43:49'),
(17, '17-1728712521.png', '2024-10-11 23:55:21', '2024-10-11 23:55:21'),
(18, '18-1728713527.png', '2024-10-12 00:12:07', '2024-10-12 00:12:07'),
(19, '19-1728713678.png', '2024-10-12 00:14:37', '2024-10-12 00:14:38'),
(20, '20-1728714090.png', '2024-10-12 00:21:30', '2024-10-12 00:21:30'),
(21, '21-1728714091.png', '2024-10-12 00:21:31', '2024-10-12 00:21:31'),
(22, '22-1728714093.png', '2024-10-12 00:21:33', '2024-10-12 00:21:33'),
(23, '23-1728714094.png', '2024-10-12 00:21:34', '2024-10-12 00:21:34'),
(24, '24-1728715069.png', '2024-10-12 00:37:49', '2024-10-12 00:37:49'),
(25, '25-1728716212.png', '2024-10-12 00:56:52', '2024-10-12 00:56:52'),
(26, '26-1728717779.png', '2024-10-12 01:22:59', '2024-10-12 01:22:59'),
(27, '27-1728718096.png', '2024-10-12 01:28:16', '2024-10-12 01:28:16'),
(28, '28-1728718101.png', '2024-10-12 01:28:21', '2024-10-12 01:28:21'),
(29, '29-1728718141.png', '2024-10-12 01:29:01', '2024-10-12 01:29:01'),
(30, '30-1728718274.png', '2024-10-12 01:31:14', '2024-10-12 01:31:14'),
(31, '31-1728718312.png', '2024-10-12 01:31:52', '2024-10-12 01:31:52'),
(32, '32-1728719145.png', '2024-10-12 01:45:45', '2024-10-12 01:45:45'),
(33, '33-1728719145.png', '2024-10-12 01:45:45', '2024-10-12 01:45:45'),
(34, '34-1728719146.png', '2024-10-12 01:45:46', '2024-10-12 01:45:46'),
(35, '35-1728719146.png', '2024-10-12 01:45:46', '2024-10-12 01:45:46'),
(36, '36-1728719718.png', '2024-10-12 01:55:18', '2024-10-12 01:55:18'),
(37, '37-1728719719.png', '2024-10-12 01:55:19', '2024-10-12 01:55:19'),
(38, '38-1728719719.png', '2024-10-12 01:55:19', '2024-10-12 01:55:19'),
(39, '39-1728719719.png', '2024-10-12 01:55:19', '2024-10-12 01:55:19'),
(40, '40-1728720361.png', '2024-10-12 02:06:01', '2024-10-12 02:06:01'),
(41, '41-1728720361.png', '2024-10-12 02:06:01', '2024-10-12 02:06:01'),
(42, '42-1728720362.png', '2024-10-12 02:06:02', '2024-10-12 02:06:02'),
(43, '43-1728720362.png', '2024-10-12 02:06:02', '2024-10-12 02:06:02'),
(44, '44-1728720378.png', '2024-10-12 02:06:18', '2024-10-12 02:06:18'),
(45, '45-1728720401.png', '2024-10-12 02:06:41', '2024-10-12 02:06:41'),
(46, '46-1728720401.png', '2024-10-12 02:06:41', '2024-10-12 02:06:41'),
(47, '47-1728720402.png', '2024-10-12 02:06:42', '2024-10-12 02:06:42'),
(48, '48-1728720402.png', '2024-10-12 02:06:42', '2024-10-12 02:06:42'),
(49, '49-1728720410.png', '2024-10-12 02:06:50', '2024-10-12 02:06:50'),
(50, '50-1728720421.png', '2024-10-12 02:07:01', '2024-10-12 02:07:01'),
(51, '51-1728720422.png', '2024-10-12 02:07:02', '2024-10-12 02:07:02'),
(52, '52-1728720424.png', '2024-10-12 02:07:04', '2024-10-12 02:07:04'),
(53, '53-1728723641.png', '2024-10-12 03:00:41', '2024-10-12 03:00:41'),
(54, '54-1728723641.png', '2024-10-12 03:00:41', '2024-10-12 03:00:41'),
(55, '55-1728723641.png', '2024-10-12 03:00:41', '2024-10-12 03:00:41'),
(56, '56-1728723642.png', '2024-10-12 03:00:42', '2024-10-12 03:00:42'),
(57, '57-1728723649.png', '2024-10-12 03:00:49', '2024-10-12 03:00:49'),
(58, '58-1728723658.png', '2024-10-12 03:00:57', '2024-10-12 03:00:58'),
(59, '59-1728723659.png', '2024-10-12 03:00:59', '2024-10-12 03:00:59'),
(60, '60-1728723660.png', '2024-10-12 03:01:00', '2024-10-12 03:01:00'),
(61, '61-1728724284.png', '2024-10-12 03:11:24', '2024-10-12 03:11:24'),
(62, '62-1728724285.png', '2024-10-12 03:11:25', '2024-10-12 03:11:25'),
(63, '63-1728724285.png', '2024-10-12 03:11:25', '2024-10-12 03:11:25'),
(64, '64-1728724285.png', '2024-10-12 03:11:25', '2024-10-12 03:11:25'),
(65, '65-1728724289.png', '2024-10-12 03:11:29', '2024-10-12 03:11:29'),
(66, '66-1728724296.png', '2024-10-12 03:11:36', '2024-10-12 03:11:36'),
(67, '67-1728724297.png', '2024-10-12 03:11:37', '2024-10-12 03:11:37'),
(68, '68-1728724298.png', '2024-10-12 03:11:38', '2024-10-12 03:11:38'),
(69, '69-1728727975.png', '2024-10-12 04:12:55', '2024-10-12 04:12:55'),
(70, '70-1728728008.png', '2024-10-12 04:13:28', '2024-10-12 04:13:28'),
(71, '71-1728728155.png', '2024-10-12 04:15:55', '2024-10-12 04:15:55'),
(72, '72-1728730790.png', '2024-10-12 04:59:50', '2024-10-12 04:59:50'),
(73, '73-1728730790.png', '2024-10-12 04:59:50', '2024-10-12 04:59:50'),
(74, '74-1728730791.png', '2024-10-12 04:59:51', '2024-10-12 04:59:51'),
(75, '75-1728730791.png', '2024-10-12 04:59:51', '2024-10-12 04:59:51'),
(76, '76-1728730799.png', '2024-10-12 04:59:59', '2024-10-12 04:59:59'),
(77, '77-1728730802.png', '2024-10-12 05:00:02', '2024-10-12 05:00:02'),
(78, '78-1728730803.png', '2024-10-12 05:00:03', '2024-10-12 05:00:03'),
(79, '79-1728730805.png', '2024-10-12 05:00:05', '2024-10-12 05:00:05'),
(80, '80-1728731942.png', '2024-10-12 05:19:02', '2024-10-12 05:19:02'),
(81, '81-1728732408.png', '2024-10-12 05:26:48', '2024-10-12 05:26:48'),
(82, '82-1728732410.png', '2024-10-12 05:26:49', '2024-10-12 05:26:50'),
(83, '83-1728732411.png', '2024-10-12 05:26:51', '2024-10-12 05:26:51'),
(84, '84-1728732412.png', '2024-10-12 05:26:52', '2024-10-12 05:26:52'),
(85, '85-1728732417.png', '2024-10-12 05:26:57', '2024-10-12 05:26:57'),
(86, '86-1728732419.png', '2024-10-12 05:26:59', '2024-10-12 05:26:59'),
(87, '87-1728732419.png', '2024-10-12 05:26:59', '2024-10-12 05:26:59'),
(88, '88-1728732420.png', '2024-10-12 05:27:00', '2024-10-12 05:27:00'),
(89, '89-1728732858.png', '2024-10-12 05:34:18', '2024-10-12 05:34:18'),
(90, '90-1728732859.png', '2024-10-12 05:34:19', '2024-10-12 05:34:19'),
(91, '91-1728732860.png', '2024-10-12 05:34:20', '2024-10-12 05:34:20'),
(92, '92-1728732861.png', '2024-10-12 05:34:21', '2024-10-12 05:34:21'),
(93, '93-1728734863.png', '2024-10-12 06:07:43', '2024-10-12 06:07:43'),
(94, '94-1728734864.png', '2024-10-12 06:07:44', '2024-10-12 06:07:44'),
(95, '95-1728734865.png', '2024-10-12 06:07:45', '2024-10-12 06:07:45'),
(96, '96-1728735754.png', '2024-10-12 06:22:34', '2024-10-12 06:22:34'),
(97, '97-1728735757.png', '2024-10-12 06:22:36', '2024-10-12 06:22:37'),
(98, '98-1728735758.png', '2024-10-12 06:22:38', '2024-10-12 06:22:38'),
(99, '99-1728737018.png', '2024-10-12 06:43:38', '2024-10-12 06:43:38'),
(100, '100-1728737019.png', '2024-10-12 06:43:39', '2024-10-12 06:43:39'),
(101, '101-1728737019.png', '2024-10-12 06:43:39', '2024-10-12 06:43:39'),
(102, '102-1728737019.png', '2024-10-12 06:43:39', '2024-10-12 06:43:39'),
(103, '103-1728737023.png', '2024-10-12 06:43:43', '2024-10-12 06:43:43'),
(104, '104-1728737025.png', '2024-10-12 06:43:45', '2024-10-12 06:43:45'),
(105, '105-1728737026.png', '2024-10-12 06:43:46', '2024-10-12 06:43:46'),
(106, '106-1728737027.png', '2024-10-12 06:43:47', '2024-10-12 06:43:47'),
(107, '107-1728750166.png', '2024-10-12 10:22:46', '2024-10-12 10:22:46'),
(108, '108-1728752215.png', '2024-10-12 10:56:55', '2024-10-12 10:56:55'),
(109, '109-1728752217.png', '2024-10-12 10:56:57', '2024-10-12 10:56:57'),
(110, '110-1728752218.png', '2024-10-12 10:56:58', '2024-10-12 10:56:58'),
(111, '111-1728752300.png', '2024-10-12 10:58:20', '2024-10-12 10:58:20'),
(112, '112-1728752305.png', '2024-10-12 10:58:25', '2024-10-12 10:58:25'),
(113, '113-1728752307.png', '2024-10-12 10:58:27', '2024-10-12 10:58:27'),
(114, '114-1728752948.png', '2024-10-12 11:09:08', '2024-10-12 11:09:08'),
(115, '115-1728752949.png', '2024-10-12 11:09:09', '2024-10-12 11:09:09'),
(116, '116-1728752951.png', '2024-10-12 11:09:11', '2024-10-12 11:09:11'),
(117, '117-1728752952.png', '2024-10-12 11:09:12', '2024-10-12 11:09:12'),
(118, '118-1728752957.png', '2024-10-12 11:09:17', '2024-10-12 11:09:17'),
(119, '119-1728752958.png', '2024-10-12 11:09:18', '2024-10-12 11:09:18'),
(120, '120-1728752959.png', '2024-10-12 11:09:19', '2024-10-12 11:09:19'),
(121, '121-1728752960.png', '2024-10-12 11:09:20', '2024-10-12 11:09:20'),
(122, '122-1728753744.png', '2024-10-12 11:22:24', '2024-10-12 11:22:24'),
(123, '123-1728753746.png', '2024-10-12 11:22:26', '2024-10-12 11:22:26'),
(124, '124-1728753748.png', '2024-10-12 11:22:28', '2024-10-12 11:22:28'),
(125, '125-1728753749.png', '2024-10-12 11:22:29', '2024-10-12 11:22:29'),
(126, '126-1728753773.png', '2024-10-12 11:22:53', '2024-10-12 11:22:53'),
(127, '127-1728753776.png', '2024-10-12 11:22:56', '2024-10-12 11:22:56'),
(128, '128-1728753778.png', '2024-10-12 11:22:58', '2024-10-12 11:22:58'),
(129, '129-1728753780.png', '2024-10-12 11:23:00', '2024-10-12 11:23:00'),
(130, '130-1728753953.png', '2024-10-12 11:25:53', '2024-10-12 11:25:53'),
(131, '131-1728753956.png', '2024-10-12 11:25:56', '2024-10-12 11:25:56'),
(132, '132-1728753958.png', '2024-10-12 11:25:58', '2024-10-12 11:25:58'),
(133, '133-1728753961.png', '2024-10-12 11:26:00', '2024-10-12 11:26:01'),
(134, '134-1728754000.png', '2024-10-12 11:26:40', '2024-10-12 11:26:40'),
(135, '135-1728754012.png', '2024-10-12 11:26:52', '2024-10-12 11:26:52'),
(136, '136-1728754014.png', '2024-10-12 11:26:54', '2024-10-12 11:26:54'),
(137, '137-1728754305.png', '2024-10-12 11:31:45', '2024-10-12 11:31:45'),
(138, '138-1728754354.png', '2024-10-12 11:32:34', '2024-10-12 11:32:34'),
(139, '139-1728754683.png', '2024-10-12 11:38:03', '2024-10-12 11:38:03'),
(140, '140-1728754684.png', '2024-10-12 11:38:04', '2024-10-12 11:38:04'),
(141, '141-1728754685.png', '2024-10-12 11:38:05', '2024-10-12 11:38:05'),
(142, '142-1728754686.png', '2024-10-12 11:38:06', '2024-10-12 11:38:06'),
(143, '143-1728754712.png', '2024-10-12 11:38:32', '2024-10-12 11:38:32'),
(144, '144-1728754714.png', '2024-10-12 11:38:34', '2024-10-12 11:38:34'),
(145, '145-1728755493.png', '2024-10-12 11:51:33', '2024-10-12 11:51:33'),
(146, '146-1728755522.png', '2024-10-12 11:52:02', '2024-10-12 11:52:02'),
(147, '147-1728755562.png', '2024-10-12 11:52:42', '2024-10-12 11:52:42'),
(148, '148-1728755839.png', '2024-10-12 11:57:19', '2024-10-12 11:57:19'),
(149, '149-1728755839.png', '2024-10-12 11:57:19', '2024-10-12 11:57:19'),
(150, '150-1728755839.png', '2024-10-12 11:57:19', '2024-10-12 11:57:19'),
(151, '151-1728755839.png', '2024-10-12 11:57:19', '2024-10-12 11:57:19'),
(152, '152-1728755847.png', '2024-10-12 11:57:27', '2024-10-12 11:57:27'),
(153, '153-1728755857.png', '2024-10-12 11:57:37', '2024-10-12 11:57:37'),
(154, '154-1728755858.png', '2024-10-12 11:57:38', '2024-10-12 11:57:38'),
(155, '155-1728755860.png', '2024-10-12 11:57:40', '2024-10-12 11:57:40'),
(156, '156-1728756252.png', '2024-10-12 12:04:12', '2024-10-12 12:04:12'),
(157, '157-1728756496.png', '2024-10-12 12:08:16', '2024-10-12 12:08:16'),
(158, '158-1728756496.png', '2024-10-12 12:08:16', '2024-10-12 12:08:16'),
(159, '159-1728756496.png', '2024-10-12 12:08:16', '2024-10-12 12:08:16'),
(160, '160-1728756497.png', '2024-10-12 12:08:17', '2024-10-12 12:08:17'),
(161, '161-1728756508.png', '2024-10-12 12:08:28', '2024-10-12 12:08:28'),
(162, '162-1728756509.png', '2024-10-12 12:08:29', '2024-10-12 12:08:29'),
(163, '163-1728756511.png', '2024-10-12 12:08:31', '2024-10-12 12:08:31'),
(164, '164-1728803462.png', '2024-10-13 01:11:02', '2024-10-13 01:11:02'),
(165, '165-1728803464.png', '2024-10-13 01:11:04', '2024-10-13 01:11:04'),
(166, '166-1728803464.png', '2024-10-13 01:11:04', '2024-10-13 01:11:04'),
(167, '167-1728803465.png', '2024-10-13 01:11:05', '2024-10-13 01:11:05'),
(168, '168-1728804007.png', '2024-10-13 01:20:07', '2024-10-13 01:20:07'),
(169, '169-1728804008.png', '2024-10-13 01:20:08', '2024-10-13 01:20:08'),
(170, '170-1728804009.png', '2024-10-13 01:20:09', '2024-10-13 01:20:09'),
(171, '171-1728804009.png', '2024-10-13 01:20:09', '2024-10-13 01:20:09'),
(172, '172-1728804015.png', '2024-10-13 01:20:15', '2024-10-13 01:20:15'),
(173, '173-1728804023.png', '2024-10-13 01:20:23', '2024-10-13 01:20:23'),
(174, '174-1728804024.png', '2024-10-13 01:20:24', '2024-10-13 01:20:24'),
(175, '175-1728804026.png', '2024-10-13 01:20:26', '2024-10-13 01:20:26'),
(176, '176-1728804911.png', '2024-10-13 01:35:11', '2024-10-13 01:35:11'),
(177, '177-1728804912.png', '2024-10-13 01:35:12', '2024-10-13 01:35:12'),
(178, '178-1728804913.png', '2024-10-13 01:35:13', '2024-10-13 01:35:13'),
(179, '179-1728804913.png', '2024-10-13 01:35:13', '2024-10-13 01:35:13'),
(180, '180-1728805015.png', '2024-10-13 01:36:55', '2024-10-13 01:36:55'),
(181, '181-1728805027.png', '2024-10-13 01:37:07', '2024-10-13 01:37:07'),
(182, '182-1728805027.png', '2024-10-13 01:37:07', '2024-10-13 01:37:07'),
(183, '183-1728805028.png', '2024-10-13 01:37:08', '2024-10-13 01:37:08'),
(184, '184-1728805028.png', '2024-10-13 01:37:08', '2024-10-13 01:37:08'),
(185, '185-1728805087.png', '2024-10-13 01:38:07', '2024-10-13 01:38:07'),
(186, '186-1728805087.png', '2024-10-13 01:38:07', '2024-10-13 01:38:07'),
(187, '187-1728805088.png', '2024-10-13 01:38:08', '2024-10-13 01:38:08'),
(188, '188-1728805088.png', '2024-10-13 01:38:08', '2024-10-13 01:38:08'),
(189, '189-1728805094.png', '2024-10-13 01:38:14', '2024-10-13 01:38:14'),
(190, '190-1728805097.png', '2024-10-13 01:38:17', '2024-10-13 01:38:17'),
(191, '191-1728805098.png', '2024-10-13 01:38:18', '2024-10-13 01:38:18'),
(192, '192-1728805099.png', '2024-10-13 01:38:19', '2024-10-13 01:38:19'),
(193, '193-1728805518.png', '2024-10-13 01:45:18', '2024-10-13 01:45:18'),
(194, '194-1728805519.png', '2024-10-13 01:45:19', '2024-10-13 01:45:19'),
(195, '195-1728805519.png', '2024-10-13 01:45:19', '2024-10-13 01:45:19'),
(196, '196-1728805521.png', '2024-10-13 01:45:21', '2024-10-13 01:45:21'),
(197, '197-1728805522.png', '2024-10-13 01:45:22', '2024-10-13 01:45:22'),
(198, '198-1728805523.png', '2024-10-13 01:45:23', '2024-10-13 01:45:23'),
(199, '199-1728806435.png', '2024-10-13 02:00:35', '2024-10-13 02:00:35'),
(200, '200-1728806435.png', '2024-10-13 02:00:35', '2024-10-13 02:00:35'),
(201, '201-1728806435.png', '2024-10-13 02:00:35', '2024-10-13 02:00:35'),
(202, '202-1728806437.png', '2024-10-13 02:00:37', '2024-10-13 02:00:37'),
(203, '203-1728806438.png', '2024-10-13 02:00:38', '2024-10-13 02:00:38'),
(204, '204-1728806439.png', '2024-10-13 02:00:39', '2024-10-13 02:00:39'),
(205, '205-1728806957.png', '2024-10-13 02:09:17', '2024-10-13 02:09:17'),
(206, '206-1728806957.png', '2024-10-13 02:09:17', '2024-10-13 02:09:17'),
(207, '207-1728806958.png', '2024-10-13 02:09:18', '2024-10-13 02:09:18'),
(208, '208-1728806958.png', '2024-10-13 02:09:18', '2024-10-13 02:09:18'),
(209, '209-1728806961.png', '2024-10-13 02:09:21', '2024-10-13 02:09:21'),
(210, '210-1728806966.png', '2024-10-13 02:09:26', '2024-10-13 02:09:26'),
(211, '211-1728806967.png', '2024-10-13 02:09:27', '2024-10-13 02:09:27'),
(212, '212-1728806968.png', '2024-10-13 02:09:28', '2024-10-13 02:09:28'),
(213, '213-1728825102.png', '2024-10-13 07:11:42', '2024-10-13 07:11:42'),
(214, '214-1728825737.png', '2024-10-13 07:22:17', '2024-10-13 07:22:17'),
(215, '215-1728825737.png', '2024-10-13 07:22:17', '2024-10-13 07:22:17'),
(216, '216-1728825737.png', '2024-10-13 07:22:17', '2024-10-13 07:22:17'),
(217, '217-1728825778.png', '2024-10-13 07:22:57', '2024-10-13 07:22:58'),
(218, '218-1728825784.png', '2024-10-13 07:23:04', '2024-10-13 07:23:04'),
(219, '219-1728825785.png', '2024-10-13 07:23:05', '2024-10-13 07:23:05'),
(220, '220-1728826471.png', '2024-10-13 07:34:31', '2024-10-13 07:34:31'),
(221, '221-1728826472.png', '2024-10-13 07:34:32', '2024-10-13 07:34:32'),
(222, '222-1728826478.png', '2024-10-13 07:34:38', '2024-10-13 07:34:38'),
(223, '223-1728827273.png', '2024-10-13 07:47:53', '2024-10-13 07:47:53'),
(224, '224-1728827273.png', '2024-10-13 07:47:53', '2024-10-13 07:47:53'),
(225, '225-1728827273.png', '2024-10-13 07:47:53', '2024-10-13 07:47:53'),
(226, '226-1728827274.png', '2024-10-13 07:47:54', '2024-10-13 07:47:54'),
(227, '227-1728827285.png', '2024-10-13 07:48:05', '2024-10-13 07:48:05'),
(228, '228-1728827286.png', '2024-10-13 07:48:06', '2024-10-13 07:48:06'),
(229, '229-1728827974.png', '2024-10-13 07:59:34', '2024-10-13 07:59:34'),
(230, '230-1728827975.png', '2024-10-13 07:59:35', '2024-10-13 07:59:35'),
(231, '231-1728827975.png', '2024-10-13 07:59:35', '2024-10-13 07:59:35'),
(232, '232-1728827977.png', '2024-10-13 07:59:37', '2024-10-13 07:59:37'),
(233, '233-1728827978.png', '2024-10-13 07:59:38', '2024-10-13 07:59:38'),
(234, '234-1728827979.png', '2024-10-13 07:59:39', '2024-10-13 07:59:39'),
(235, '235-1728828558.png', '2024-10-13 08:09:18', '2024-10-13 08:09:18'),
(236, '236-1728828558.png', '2024-10-13 08:09:18', '2024-10-13 08:09:18'),
(237, '237-1728828558.png', '2024-10-13 08:09:18', '2024-10-13 08:09:18'),
(238, '238-1728828559.png', '2024-10-13 08:09:19', '2024-10-13 08:09:19'),
(239, '239-1728828566.png', '2024-10-13 08:09:26', '2024-10-13 08:09:26'),
(240, '240-1728828644.png', '2024-10-13 08:10:44', '2024-10-13 08:10:44'),
(241, '241-1728828666.png', '2024-10-13 08:11:06', '2024-10-13 08:11:06'),
(242, '242-1728828668.png', '2024-10-13 08:11:08', '2024-10-13 08:11:08'),
(243, '243-1728828669.png', '2024-10-13 08:11:09', '2024-10-13 08:11:09'),
(244, '244-1728829242.png', '2024-10-13 08:20:42', '2024-10-13 08:20:42'),
(245, '245-1728829243.png', '2024-10-13 08:20:43', '2024-10-13 08:20:43'),
(246, '246-1728829243.png', '2024-10-13 08:20:43', '2024-10-13 08:20:43'),
(247, '247-1728829272.png', '2024-10-13 08:21:12', '2024-10-13 08:21:12'),
(248, '248-1728829280.png', '2024-10-13 08:21:20', '2024-10-13 08:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@gmail.com', '01818141271', 2, 1, NULL, '$2y$12$fBUCa9H7TwQfVcWDc0pGCuSZl2fjPWJlcBowLgvjLxAvOf7ZNJgNe', NULL, '2024-10-10 10:31:12', '2024-10-14 05:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_user_id_foreign` (`user_id`),
  ADD KEY `customer_addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `discount_coupons`
--
ALTER TABLE `discount_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_country_id_foreign` (`country_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `temp_images`
--
ALTER TABLE `temp_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_coupons`
--
ALTER TABLE `discount_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
