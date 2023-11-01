-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2023 at 06:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_categoriesuser`
--

CREATE TABLE `adminapp_categoriesuser` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminapp_categoriesuser`
--

INSERT INTO `adminapp_categoriesuser` (`id`, `category_name`, `status`) VALUES
(1, 'electronics', 'AVAILABLE'),
(2, 'footwear', 'UNAVAILABLE'),
(7, 'HouseHolds', 'AVAILABLE'),
(8, 'Petfood', 'AVAILABLE'),
(9, 'Frozen Food Snacks', 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_product`
--

CREATE TABLE `adminapp_product` (
  `id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subCategory_id` int(11) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_price` varchar(30) NOT NULL,
  `product_discount` int(11) NOT NULL,
  `product_discountPrice` varchar(30) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_discription` longtext NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminapp_product`
--

INSERT INTO `adminapp_product` (`id`, `category_id`, `subCategory_id`, `product_name`, `product_price`, `product_discount`, `product_discountPrice`, `product_image`, `product_discription`, `status`) VALUES
(1, 1, 1, 'fan', '1000', 10, '100', 'product/product_image/fan_6X903TR.webp', 'good product', 'AVAILABLE'),
(6, 1, 1, 'Fan56b', '30000', 19, '3000', 'product/product_image/fan_u2KQsSJ.webp', 'Excelent fan', 'AVAILABLE'),
(7, 7, 5, 'Fortune Sunflower Oil', '7.99', 7, '5.54', 'product/product_image/con3img1.png', 'This is better sunflower oil', 'AVAILABLE'),
(8, 7, 5, 'Basmati Rise (5 Kg)', '11.99', 10, '10.79', 'product/product_image/con3img2.png', 'This is better basmati rice', 'AVAILABLE'),
(9, 7, 5, 'Soft Drink (2 Ltr)', '8.00', 12, '7.04', 'product/product_image/con3img3.png', 'This is good softdrink', 'AVAILABLE'),
(10, 8, 9, 'Dogs Food (4 Kg)', '300', 10, '270', 'product/product_image/con3img4.png', 'This is good dog food', 'AVAILABLE'),
(11, 7, 5, 'Meat', '200', 28, '144', 'product/product_image/meat.jpg', 'This is very good meat', 'AVAILABLE'),
(12, 1, 10, 'Asus Vivobook k15 Oled', '50000', 23, '38500', 'product/product_image/laptop_EUrGZ2G.webp', 'The theme of vivid colours is extended underneath the lid with a colour-blocked Enter key, highlighting the attractiveness of the Asus K15 OLED laptop.', 'AVAILABLE'),
(13, 1, 10, 'Macbook pro m1 (13 Inch) Grey', '70000', 13, '60900', 'product/product_image/macbook.jfif', 'With the brilliant Retina display, images take on an incredible level of detail and realism. Text is sharp and clear. Bright LED backlighting delivers deep blacks and bright whites. P3 wide colour brings even more vibrant greens and reds than sRGB. And MacBook Pro features True Tone technology, so the white balance automatically adjusts to match the colour temperature of the light around you — for a more natural viewing experience.', 'AVAILABLE'),
(14, 1, 11, ' iPhone 15 Pro Max Titanium', '120000', 8, '110000', 'product/product_image/iphone_gp1b9Q5.jfif', 'As part of our efforts to reach carbon neutrality by 2030, iPhone 15 Pro and iPhone 15 Pro Max do not include a power adapter or EarPods. Included in the box is a USB‑C Charge Cable that supports fast charging and is compatible with USB‑C power adapters and computer ports.  We encourage you to use any compatible USB‑C power adapter. If you need a new Apple power adapter or headphones, they are available for purchase.', 'AVAILABLE'),
(15, 1, 11, 'Nothing Phone 2', '40000', 11, '35600', 'product/product_image/nothing.webp', 'Taking inspiration from the phone’s iconic hardware design, we’ve given our software a new visual identity that feels unmistakably Nothing.  With an emphasis on functional customisation, Nothing OS 2.0 allows interactions with your smartphone to be more intentional and mindful. Powerfully efficient. Refreshingly simple.', 'AVAILABLE'),
(16, 7, 5, 'Paneer', '130', 8, '119.6', 'product/product_image/paneer.jpg', 'aneer, also known as ponir, is a fresh acid-set cheese common in cuisine of the Indian subcontinent made from full-fat buffalo milk or cow milk. It is a non-aged, non-melting soft cheese made by curdling milk with a fruit- or vegetable-derived acid, such as lemon juice. ', 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_subcategory`
--

CREATE TABLE `adminapp_subcategory` (
  `id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subCategory_name` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminapp_subcategory`
--

INSERT INTO `adminapp_subcategory` (`id`, `category_id`, `subCategory_name`, `status`) VALUES
(1, 1, 'fan', 'UNAVAILABLE'),
(2, 2, 'paragon', 'AVAILABLE'),
(5, 7, 'Grocery', 'AVAILABLE'),
(9, 8, 'dog', 'AVAILABLE'),
(10, 1, 'Computers', 'AVAILABLE'),
(11, 1, 'Mobiles', 'AVAILABLE');

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
  `id` bigint(20) NOT NULL,
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categories user', 7, 'add_categoriesuser'),
(26, 'Can change categories user', 7, 'change_categoriesuser'),
(27, 'Can delete categories user', 7, 'delete_categoriesuser'),
(28, 'Can view categories user', 7, 'view_categoriesuser'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add sub category', 9, 'add_subcategory'),
(34, 'Can change sub category', 9, 'change_subcategory'),
(35, 'Can delete sub category', 9, 'delete_subcategory'),
(36, 'Can view sub category', 9, 'view_subcategory'),
(37, 'Can add sign up user', 10, 'add_signupuser'),
(38, 'Can change sign up user', 10, 'change_signupuser'),
(39, 'Can delete sign up user', 10, 'delete_signupuser'),
(40, 'Can view sign up user', 10, 'view_signupuser'),
(41, 'Can add whishlist', 11, 'add_whishlist'),
(42, 'Can change whishlist', 11, 'change_whishlist'),
(43, 'Can delete whishlist', 11, 'delete_whishlist'),
(44, 'Can view whishlist', 11, 'view_whishlist'),
(45, 'Can add contact', 12, 'add_contact'),
(46, 'Can change contact', 12, 'change_contact'),
(47, 'Can delete contact', 12, 'delete_contact'),
(48, 'Can view contact', 12, 'view_contact'),
(49, 'Can add cart', 13, 'add_cart'),
(50, 'Can change cart', 13, 'change_cart'),
(51, 'Can delete cart', 13, 'delete_cart'),
(52, 'Can view cart', 13, 'view_cart'),
(53, 'Can add user', 14, 'add_user'),
(54, 'Can change user', 14, 'change_user'),
(55, 'Can delete user', 14, 'delete_user'),
(56, 'Can view user', 14, 'view_user'),
(57, 'Can add wishlist', 15, 'add_wishlist'),
(58, 'Can change wishlist', 15, 'change_wishlist'),
(59, 'Can delete wishlist', 15, 'delete_wishlist'),
(60, 'Can view wishlist', 15, 'view_wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$7rDtPdZu4gKeFsukKz4Kwn$VGPAz3xm6A3R5MruQzh8DuAhY9txj6feCayHa0sUb0U=', '2023-09-26 04:39:35.466774', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-04-04 11:07:36.747863'),
(2, 'pbkdf2_sha256$390000$TaNkIT9ltXXQjsx3hpMrJY$5W9L+2inlIVdJn+mYUae65f9t6OoUlGHKBiqvawqFLA=', NULL, 1, 'dhiraj', '', '', '', 1, 1, '2023-09-24 02:27:58.552955');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `user_id` int(11) NOT NULL
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
(7, 'adminapp', 'categoriesuser'),
(8, 'adminapp', 'product'),
(9, 'adminapp', 'subcategory'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(13, 'userapp', 'cart'),
(12, 'userapp', 'contact'),
(10, 'userapp', 'signupuser'),
(14, 'userapp', 'user'),
(11, 'userapp', 'whishlist'),
(15, 'userapp', 'wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-04 11:06:24.229973'),
(2, 'auth', '0001_initial', '2023-04-04 11:06:30.742520'),
(3, 'admin', '0001_initial', '2023-04-04 11:06:32.017922'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-04-04 11:06:32.042799'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-04 11:06:32.081239'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-04-04 11:06:32.793300'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-04-04 11:06:33.915774'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-04-04 11:06:34.085605'),
(9, 'auth', '0004_alter_user_username_opts', '2023-04-04 11:06:34.124605'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-04-04 11:06:34.797467'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-04-04 11:06:34.838237'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-04-04 11:06:34.880527'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-04-04 11:06:34.970359'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-04-04 11:06:35.069280'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-04-04 11:06:35.181439'),
(16, 'auth', '0011_update_proxy_permissions', '2023-04-04 11:06:35.234411'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-04-04 11:06:35.336349'),
(18, 'sessions', '0001_initial', '2023-04-04 11:06:35.701273'),
(19, 'adminapp', '0001_initial', '2023-04-11 08:18:14.984118'),
(20, 'adminapp', '0002_product_subcategory_and_more', '2023-05-16 11:14:46.773130'),
(21, 'adminapp', '0003_alter_product_status', '2023-09-02 06:26:24.084709'),
(22, 'adminapp', '0004_alter_product_product_image', '2023-09-06 11:07:16.912657'),
(23, 'userapp', '0001_initial', '2023-09-16 08:58:22.351425'),
(24, 'userapp', '0002_whishlist', '2023-09-16 11:48:58.419651'),
(25, 'userapp', '0003_contact_signupuser_phoneno', '2023-09-24 07:02:30.463466'),
(26, 'userapp', '0004_alter_contact_email', '2023-09-24 07:16:44.048643'),
(27, 'userapp', '0005_cart', '2023-09-24 10:12:46.100144'),
(28, 'userapp', '0006_alter_cart_pid_alter_cart_user_id', '2023-09-24 10:18:35.363406'),
(29, 'userapp', '0007_user_delete_signupuser', '2023-09-24 14:23:27.573152'),
(30, 'userapp', '0008_cart_status', '2023-09-25 02:03:37.585357'),
(31, 'adminapp', '0005_alter_product_product_discription', '2023-09-25 07:57:06.645416'),
(32, 'adminapp', '0006_alter_product_product_name', '2023-09-26 02:00:01.827953'),
(33, 'userapp', '0009_wishlist_delete_whishlist', '2023-09-26 02:00:01.946602');

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
('2h4o5gz2k41zp4ojf42bwekbffzbqvfe', '.eJxVjEEOwiAQRe_C2hAGmCF16d4zkIGhUjU0Ke3KeHdt0oVu_3vvv1Tkba1x62WJk6izAnX63RLnR2k7kDu326zz3NZlSnpX9EG7vs5SnpfD_Tuo3Ou3HlBKZgmGcyam0Vi0RN6lkMkBoRExMEjxGMA5GhEtBhSfAhsAy-r9AeEiNyw:1pmqwQ:2OG0ukw8HTf1DDJS2dkqyOkheRmQaC1bdcYO628V7Vs', '2023-04-27 07:00:22.047702'),
('3efba0ecclvtavyi8ya25yefrdhq90al', 'eyJ1c2VybmFtZSI6ImRoaXJhajEyMzQiLCJ1aWQiOjJ9:1ql9tc:fEXIpBs9S4HZd_gQGYsij2d150LB9OlyKEPW337aklU', '2023-10-10 15:22:44.785684'),
('rdxcpw5bu0onc1a3zid05qrnkb5jc1o8', '.eJxVjEEOwiAQRe_C2hAGmCF16d4zkIGhUjU0Ke3KeHdt0oVu_3vvv1Tkba1x62WJk6izAnX63RLnR2k7kDu326zz3NZlSnpX9EG7vs5SnpfD_Tuo3Ou3HlBKZgmGcyam0Vi0RN6lkMkBoRExMEjxGMA5GhEtBhSfAhsAy-r9AeEiNyw:1q2ste:eIU3ffNrWVntXsXp3AIvh3lYgBtMrURuWb5A75JLpxE', '2023-06-10 12:19:46.906038'),
('rvxo6563sq5ja9qjfzuerv9lh9hwggz1', '.eJxVjEEOwiAQRe_C2hAGmCF16d4zkIGhUjU0Ke3KeHdt0oVu_3vvv1Tkba1x62WJk6izAnX63RLnR2k7kDu326zz3NZlSnpX9EG7vs5SnpfD_Tuo3Ou3HlBKZgmGcyam0Vi0RN6lkMkBoRExMEjxGMA5GhEtBhSfAhsAy-r9AeEiNyw:1qdqNe:E-TlciB4KChVDvMSdCUwYfZoZs3A4z7dYrDqO_hp77k', '2023-09-20 11:07:30.323451'),
('vp0bgjhi2kev07qadenhboz6uj1y9b5n', '.eJxVjEEOwiAQRe_C2hAGmCF16d4zkIGhUjU0Ke3KeHdt0oVu_3vvv1Tkba1x62WJk6izAnX63RLnR2k7kDu326zz3NZlSnpX9EG7vs5SnpfD_Tuo3Ou3HlBKZgmGcyam0Vi0RN6lkMkBoRExMEjxGMA5GhEtBhSfAhsAy-r9AeEiNyw:1q7DTt:Kh1kNZ2ECU8A0EKvRrvCEYc3mtwxH-pJFJeCGx21xcs', '2023-06-22 11:07:05.447170');

-- --------------------------------------------------------

--
-- Table structure for table `userapp_cart`
--

CREATE TABLE `userapp_cart` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapp_cart`
--

INSERT INTO `userapp_cart` (`id`, `user_id`, `pid`, `status`) VALUES
(17, 2, 11, 'cart'),
(19, 2, 8, 'save later'),
(22, 2, 14, 'cart'),
(23, 2, 13, 'cart'),
(24, 2, 15, 'cart'),
(25, 2, 12, 'cart'),
(28, 2, 6, 'save later');

-- --------------------------------------------------------

--
-- Table structure for table `userapp_contact`
--

CREATE TABLE `userapp_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `comment` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapp_contact`
--

INSERT INTO `userapp_contact` (`id`, `name`, `subject`, `email`, `phone`, `comment`) VALUES
(3, 'DHIRAJ SUDHAKAR MOKAL', 'x', 'dhirajmokal14@gmail.com', '08668893166', 'sxdsxds'),
(4, 'DHIRAJ SUDHAKAR MOKAL', 'x', 'dhirajmokal14@gmail.com', '08668893166', 'sxdsxds'),
(5, 'DHIRAJ SUDHAKAR MOKAL', 'x', 'dhirajmokal14@gmail.com', '08668893166', 'sxdsxds');

-- --------------------------------------------------------

--
-- Table structure for table `userapp_user`
--

CREATE TABLE `userapp_user` (
  `id` bigint(20) NOT NULL,
  `uname` varchar(40) NOT NULL,
  `password` varchar(300) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapp_user`
--

INSERT INTO `userapp_user` (`id`, `uname`, `password`, `email`, `phone`) VALUES
(2, 'dhiraj1234', 'pbkdf2_sha256$390000$Szd6x1ut5Qv9hN5XXuDs6i$nWWRJqruyrmj9naekIhQF5xTHpu926VddwFjoAWxR5M=', 'dhirajmokal13@gmail.com', '8668893166');

-- --------------------------------------------------------

--
-- Table structure for table `userapp_wishlist`
--

CREATE TABLE `userapp_wishlist` (
  `id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userapp_wishlist`
--

INSERT INTO `userapp_wishlist` (`id`, `product_id_id`, `user_id_id`) VALUES
(11, 13, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminapp_categoriesuser`
--
ALTER TABLE `adminapp_categoriesuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indexes for table `userapp_cart`
--
ALTER TABLE `userapp_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userapp_contact`
--
ALTER TABLE `userapp_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userapp_user`
--
ALTER TABLE `userapp_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userapp_wishlist`
--
ALTER TABLE `userapp_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userapp_wishlist_product_id_id_27ae4bed_fk_adminapp_product_id` (`product_id_id`),
  ADD KEY `userapp_wishlist_user_id_id_c75156c6_fk_userapp_user_id` (`user_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminapp_categoriesuser`
--
ALTER TABLE `adminapp_categoriesuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `userapp_cart`
--
ALTER TABLE `userapp_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `userapp_contact`
--
ALTER TABLE `userapp_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userapp_user`
--
ALTER TABLE `userapp_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userapp_wishlist`
--
ALTER TABLE `userapp_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userapp_wishlist`
--
ALTER TABLE `userapp_wishlist`
  ADD CONSTRAINT `userapp_wishlist_product_id_id_27ae4bed_fk_adminapp_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `adminapp_product` (`id`),
  ADD CONSTRAINT `userapp_wishlist_user_id_id_c75156c6_fk_userapp_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `userapp_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
