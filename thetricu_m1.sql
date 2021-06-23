-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2021 at 12:41 PM
-- Server version: 10.3.22-MariaDB-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thetricu_m1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(28) NOT NULL,
  `permissions` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `forgot_password_code` varchar(255) DEFAULT NULL,
  `fcm_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `role`, `permissions`, `created_by`, `forgot_password_code`, `fcm_id`, `date_created`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'support@ekart.in', 'super admin', '{\"orders\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"categories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"subcategories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products_order\":{\"read\":\"1\",\"update\":\"1\"},\"featured\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"customers\":{\"read\":\"1\"},\"payment\":{\"read\":\"1\",\"update\":\"1\"},\"notifications\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"transactions\":{\"read\":\"1\"},\"settings\":{\"read\":\"1\",\"update\":\"1\"},\"locations\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"reports\":{\"create\":\"1\",\"read\":\"1\"},\"faqs\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"home_sliders\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"new_offers\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"promo_codes\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"delivery_boys\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"return_requests\":{\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}}', 0, '', 'd1nOGcd0QdqFGJRrn5UoJa:APA91bF4DJEzOd-rB-dIBuh_CCH7uC3Phbtzzvj9RUDaNCyMTucYh_Wo6GfXpi6e18BsIJRssheKSM5Z-12PuNLlze8iGvQj8NQ70dpAqEVCwRHBC247zbuv5saH4TbF-iqFDvOHh-rZ', '2020-06-22 16:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `minimum_free_delivery_order_amount` int(20) NOT NULL DEFAULT 0,
  `delivery_charges` int(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `name`, `city_id`, `minimum_free_delivery_order_amount`, `delivery_charges`) VALUES
(1, 'Maninagar', 1, 200, 10);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `product_variant_id`, `qty`, `date_created`) VALUES
(10, 3, 3, 6, 1, '2021-02-16 10:06:17'),
(11, 3, 4, 4, 1, '2021-02-16 10:06:25'),
(12, 2, 9, 12, 1, '2021-02-16 10:09:24'),
(14, 4, 37, 53, 1, '2021-03-25 14:46:52'),
(20, 4, 33, 49, 1, '2021-03-26 10:46:05'),
(28, 4, 35, 51, 1, '2021-03-31 05:58:14'),
(29, 1, 33, 49, 1, '2021-03-31 10:56:13'),
(30, 5, 37, 53, 1, '2021-04-08 12:58:25'),
(31, 6, 43, 59, 1, '2021-06-04 11:05:28'),
(32, 10, 40, 56, 1, '2021-06-21 16:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `web_image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `row_order`, `name`, `subtitle`, `image`, `status`, `web_image`) VALUES
(12, 0, 'Laptop', 'Branded Laptop', 'upload/images/7124-2021-06-01.jpg', NULL, ''),
(13, 0, ' Desktops', 'Desktops & Workstations', 'upload/images/2586-2021-06-01.jpg', NULL, ''),
(14, 0, 'Accessories', 'Best Accessories', 'upload/images/3428-2021-06-01.jpg', NULL, ''),
(15, 0, 'Tablets & Phones', 'Latest Smartphones', 'upload/images/4744-2021-06-01.jpeg', NULL, ''),
(16, 0, 'Gaming', 'Latest Processor', 'upload/images/9476-2021-06-01.jpg', NULL, ''),
(17, 0, 'Ipad & Macbook', 'Workstations', 'upload/images/8891-2021-06-01.jpg', NULL, ''),
(18, 0, 'Demo New Category', 'Demo', 'upload/images/5226-2021-06-04.jpg', NULL, ''),
(19, 0, 'Mobile', 'Mobile', 'upload/images/5729-2021-06-22.png', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Ahmedabad'),
(2, 'Baroda');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `address` text NOT NULL,
  `bonus` int(11) NOT NULL,
  `balance` double DEFAULT 0,
  `driving_license` text DEFAULT NULL,
  `national_identity_card` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bank_account_number` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `ifsc_code` text DEFAULT NULL,
  `other_payment_information` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `fcm_id` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_notifications`
--

CREATE TABLE `delivery_boy_notifications` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `date_created`) VALUES
(1, 1, 37, '2021-03-26 13:15:33'),
(3, 1, 31, '2021-03-26 13:15:36'),
(4, 1, 30, '2021-03-28 09:03:09'),
(5, 1, 34, '2021-03-28 09:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) NOT NULL,
  `message` varchar(512) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `order_date` datetime NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `order_list` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `discount` varchar(6) NOT NULL,
  `total_sale` varchar(10) NOT NULL,
  `shipping_charge` varchar(100) NOT NULL,
  `payment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `extension` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL,
  `sub_directory` text CHARACTER SET utf8 NOT NULL,
  `size` text CHARACTER SET utf8 NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT 0,
  `otp` int(10) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_note` text DEFAULT NULL,
  `total` float NOT NULL,
  `delivery_charge` float NOT NULL,
  `tax_amount` float NOT NULL DEFAULT 0,
  `tax_percentage` float NOT NULL DEFAULT 0,
  `wallet_balance` float NOT NULL,
  `discount` float NOT NULL,
  `promo_code` varchar(28) DEFAULT NULL,
  `promo_discount` float NOT NULL DEFAULT 0,
  `final_total` float DEFAULT NULL,
  `payment_method` varchar(16) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL,
  `delivery_time` varchar(128) NOT NULL,
  `status` varchar(1024) NOT NULL,
  `active_status` varchar(16) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_from` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `delivery_boy_id`, `otp`, `mobile`, `order_note`, `total`, `delivery_charge`, `tax_amount`, `tax_percentage`, `wallet_balance`, `discount`, `promo_code`, `promo_discount`, `final_total`, `payment_method`, `address`, `latitude`, `longitude`, `delivery_time`, `status`, `active_status`, `date_added`, `order_from`) VALUES
(1, 1, 0, 547524, '7016724053', '', 1, 100, 0, 0, 0, 0, '', 0, 101, 'cod', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '13-02-2021 Night 9 PM to 12 PM', '[[\"received\",\"13-02-2021 04:40:03pm\"],[\"processed\",\"13-02-2021 04:41:00pm\"]]', 'processed', '2021-02-13 11:10:03', 1),
(2, 1, 0, 255322, '7016724053', '', 1, 100, 0, 0, 0, 0, '', 0, 101, 'payumoney-bolt', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"13-02-2021 04:44:35pm\"]]', 'received', '2021-02-13 11:14:35', 1),
(3, 2, 0, 382307, '9898751216', '', 1, 100, 0, 0, 0, 0, '', 0, 101, 'cod', 'vivan parmar, 48 Ashapuri nagar near swstick cross road Gujarat, Ahmedabad, Maninagar, Ahmedabad, Select a State, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"15-02-2021 08:15:00am\"]]', 'received', '2021-02-15 02:45:00', 1),
(4, 2, 0, 710898, '9898751216', '', 99, 100, 0, 0, 0, 0, '', 0, 199, 'cod', 'vivan parmar, 48 Ashapuri nagar near swstick cross road Gujarat, Ahmedabad, Maninagar, Ahmedabad, Select a State, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"15-02-2021 08:15:58am\"],[\"processed\",\"15-02-2021 08:19:25am\"],[\"shipped\",\"15-02-2021 08:19:47am\"],[\"delivered\",\"15-02-2021 01:09:41pm\"]]', 'delivered', '2021-02-15 02:45:58', 1),
(5, 2, 0, 673539, '9898751216', '', 55, 100, 0, 0, 0, 0, '', 0, 155, 'cod', 'vivan parmar, 48 Ashapuri nagar near swstick cross road Gujarat, Ahmedabad, Maninagar, Ahmedabad, Select a State, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"15-02-2021 01:11:02pm\"]]', 'received', '2021-02-15 07:41:02', 1),
(6, 2, 0, 266832, '9898751216', '', 99, 100, 0, 0, 0, 0, '', 0, 199, 'razorpay', 'vivan parmar, 48 Ashapuri nagar near swstick cross road Gujarat, Ahmedabad, Maninagar, Ahmedabad, Select a State, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"15-02-2021 08:01:22pm\"]]', 'received', '2021-02-15 14:31:22', 1),
(7, 1, 0, 634750, '7016724053', '', 70, 100, 0, 0, 0, 0, '', 0, 170, 'razorpay', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"15-02-2021 08:09:52pm\"]]', 'received', '2021-02-15 14:39:52', 1),
(8, 4, 0, 310228, '9429812012', '', 999, 0, 0, 0, 0, 0, '', 0, 999, 'cod', 'Niktech Solution, TF-9-A Lotus Aura 1, vadodara, Maninagar, Ahmedabad, Gujarat, India, 389001, Deliver to Home', '0', '0', '', '[[\"received\",\"25-03-2021 07:12:01pm\"]]', 'received', '2021-03-25 13:42:01', 1),
(9, 1, 0, 394199, '7016724053', '', 5998, 0, 0, 0, 0, 0, '', 0, 5998, 'payumoney-bolt', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"26-03-2021 06:09:01pm\"]]', 'received', '2021-03-26 12:39:01', 1),
(10, 1, 0, 366588, '7016724053', '', 3999, 0, 0, 0, 0, 0, '', 0, 3999, 'payumoney-bolt', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"27-03-2021 11:14:10am\"]]', 'received', '2021-03-27 05:44:10', 1),
(11, 1, 0, 748289, '7016724053', '', 12495, 0, 0, 0, 0, 0, '', 0, 12495, 'payumoney-bolt', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"27-03-2021 11:57:14am\"]]', 'received', '2021-03-27 06:27:14', 1),
(12, 1, 0, 876860, '7016724053', '', 14995, 0, 0, 0, 0, 0, '', 0, 14995, 'payumoney-bolt', 'vivan, vivan, Ahmedabad, Maninagar, Ahmedabad, gujrat, India, 380026, Deliver to Home', '0', '0', '', '[[\"received\",\"28-03-2021 02:35:18pm\"]]', 'received', '2021-03-28 09:05:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `discounted_price` double NOT NULL,
  `tax_amount` float DEFAULT 0,
  `tax_percentage` float DEFAULT 0,
  `discount` float NOT NULL,
  `sub_total` float NOT NULL,
  `deliver_by` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `active_status` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `product_variant_id`, `quantity`, `price`, `discounted_price`, `tax_amount`, `tax_percentage`, `discount`, `sub_total`, `deliver_by`, `status`, `active_status`, `date_added`) VALUES
(1, 1, 1, 1, 1, 12, 1, 0, 0, 0, 1, NULL, '[[\"received\",\"13-02-2021 04:40:03pm\"],[\"processed\",\"13-02-2021 04:41:00pm\"]]', 'processed', '2021-02-13 11:10:03'),
(2, 1, 2, 1, 1, 12, 1, 0, 0, 0, 1, NULL, '[[\"received\",\"13-02-2021 04:44:35pm\"]]', 'received', '2021-02-13 11:14:35'),
(3, 2, 4, 6, 1, 99, 0, 0, 0, 0, 99, NULL, '[[\"received\",\"15-02-2021 08:15:58am\"],[\"processed\",\"15-02-2021 08:19:25am\"],[\"shipped\",\"15-02-2021 08:19:47am\"],[\"delivered\",\"15-02-2021 01:09:41pm\"]]', 'delivered', '2021-02-15 02:45:58'),
(4, 2, 5, 16, 1, 55, 0, 0, 0, 0, 55, NULL, '[[\"received\",\"15-02-2021 01:11:02pm\"]]', 'received', '2021-02-15 07:41:02'),
(5, 2, 6, 6, 1, 99, 0, 0, 0, 0, 99, NULL, '[[\"received\",\"15-02-2021 08:01:22pm\"]]', 'received', '2021-02-15 14:31:22'),
(6, 1, 7, 13, 1, 89, 69, 0, 0, 0, 69, NULL, '[[\"received\",\"15-02-2021 08:09:52pm\"]]', 'received', '2021-02-15 14:39:52'),
(7, 4, 8, 53, 1, 999, 0, 0, 0, 0, 999, NULL, '[[\"received\",\"25-03-2021 07:12:01pm\"]]', 'received', '2021-03-25 13:42:01'),
(8, 1, 9, 49, 1, 2999, 0, 0, 0, 0, 2999, NULL, '[[\"received\",\"26-03-2021 06:09:01pm\"]]', 'received', '2021-03-26 12:39:01'),
(9, 1, 9, 50, 1, 2999, 0, 0, 0, 0, 2999, NULL, '[[\"received\",\"26-03-2021 06:09:01pm\"]]', 'received', '2021-03-26 12:39:01'),
(10, 1, 10, 46, 1, 3999, 0, 0, 0, 0, 3999, NULL, '[[\"received\",\"27-03-2021 11:14:10am\"]]', 'received', '2021-03-27 05:44:10'),
(11, 1, 11, 51, 1, 1499, 0, 0, 0, 0, 1499, NULL, '[[\"received\",\"27-03-2021 11:57:14am\"]]', 'received', '2021-03-27 06:27:14'),
(12, 1, 11, 52, 1, 2499, 0, 0, 0, 0, 2499, NULL, '[[\"received\",\"27-03-2021 11:57:14am\"]]', 'received', '2021-03-27 06:27:14'),
(13, 1, 11, 50, 1, 2999, 0, 0, 0, 0, 2999, NULL, '[[\"received\",\"27-03-2021 11:57:14am\"]]', 'received', '2021-03-27 06:27:14'),
(14, 1, 11, 48, 1, 4499, 0, 0, 0, 0, 4499, NULL, '[[\"received\",\"27-03-2021 11:57:14am\"]]', 'received', '2021-03-27 06:27:14'),
(15, 1, 11, 53, 1, 999, 0, 0, 0, 0, 999, NULL, '[[\"received\",\"27-03-2021 11:57:14am\"]]', 'received', '2021-03-27 06:27:14'),
(16, 1, 12, 50, 5, 2999, 0, 0, 0, 0, 14995, NULL, '[[\"received\",\"28-03-2021 02:35:18pm\"]]', 'received', '2021-03-28 09:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(6) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `itemid` varchar(25) NOT NULL,
  `createdtime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) NOT NULL,
  `payment_address` varchar(1024) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(500) NOT NULL,
  `tax_id` tinyint(4) DEFAULT 0,
  `slug` varchar(120) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `indicator` tinyint(4) DEFAULT 0 COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `manufacturer` varchar(512) DEFAULT NULL,
  `made_in` varchar(512) DEFAULT NULL,
  `return_status` tinyint(4) DEFAULT NULL,
  `cancelable_status` tinyint(4) DEFAULT NULL,
  `till_status` varchar(28) DEFAULT NULL,
  `image` text NOT NULL,
  `other_images` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(2) DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `row_order`, `name`, `tax_id`, `slug`, `category_id`, `subcategory_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `date_added`) VALUES
(43, 0, 'HP Laptop', 0, 'hp-laptop', 12, 17, 0, '', '', 0, 0, '', 'upload/images/7311-2021-06-01.jpg', '[\"upload/other_images/1622542079.4242-759.jpg\"]', '<p>tets</p>', 1, '2021-06-01 10:07:59'),
(42, 0, 'Asus Laptop', 0, 'asus-laptop', 12, 16, 0, '', '', 0, 0, '', 'upload/images/4467-2021-06-01.png', '[\"upload/other_images/1622541722.9407-445.png\"]', '<p>test</p>', 1, '2021-06-01 10:02:05'),
(40, 0, 'Dell Laptop', 0, 'dell-laptop', 12, 14, 0, '', '', 0, 0, '', 'upload/images/4197-2021-06-01.jpg', '[\"upload/other_images/1622541412.556-287.jpg\"]', '<p>test</p>', 1, '2021-06-01 09:56:52'),
(41, 0, 'Lenovo Laptop', 0, 'lenovo-laptop', 12, 15, 0, '', '', 0, 0, '', 'upload/images/5816-2021-06-01.jpg', '[\"upload/other_images/1622541554.9357-357.jpg\"]', '<p>test</p>', 1, '2021-06-01 09:59:14'),
(44, 0, 'samsung x pro', 0, 'samsung-x-pro', 19, 19, 0, 'india', 'chaina', 1, 0, '', 'upload/images/8058-2021-06-22.png', '', '<p>teetststs</p>', 1, '2021-06-22 07:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `measurement` float NOT NULL,
  `measurement_unit_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `discounted_price` float NOT NULL,
  `serve_for` varchar(16) NOT NULL,
  `stock` float NOT NULL,
  `stock_unit_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`id`, `product_id`, `type`, `measurement`, `measurement_unit_id`, `price`, `discounted_price`, `serve_for`, `stock`, `stock_unit_id`) VALUES
(1, 1, 'packet', 12, 1, 12, 1, 'Sold Out', 5, 2),
(2, 2, 'packet', 123, 2, 120, 100, 'Available', 100, 2),
(3, 3, 'packet', 300, 2, 190, 0, 'Available', 100, 2),
(4, 4, 'packet', 300, 2, 190, 0, 'Available', 100, 2),
(5, 5, 'packet', 300, 2, 190, 0, 'Available', 100, 2),
(6, 3, 'packet', 150, 2, 99, 0, 'Available', 98, 2),
(7, 4, 'packet', 150, 2, 99, 0, 'Available', 100, 2),
(8, 5, 'packet', 150, 1, 99, 0, 'Available', 100, 2),
(9, 6, 'packet', 100, 2, 89, 0, 'Available', 100, 2),
(10, 7, 'packet', 100, 2, 89, 0, 'Available', 100, 2),
(11, 8, 'packet', 100, 2, 89, 0, 'Available', 100, 2),
(12, 9, 'packet', 100, 2, 89, 0, 'Available', 100, 2),
(13, 10, 'packet', 100, 1, 89, 69, 'Available', 99, 2),
(14, 6, 'packet', 50, 2, 55, 0, 'Available', 100, 2),
(15, 7, 'packet', 50, 2, 55, 0, 'Available', 100, 2),
(16, 8, 'packet', 50, 2, 55, 0, 'Available', 99, 2),
(17, 9, 'packet', 50, 1, 55, 0, 'Available', 100, 2),
(18, 10, 'packet', 50, 2, 55, 39, 'Available', 100, 2),
(22, 12, 'packet', 150, 2, 99, 0, 'Available', 20, 2),
(21, 12, 'packet', 300, 2, 190, 0, 'Available', 20, 2),
(23, 13, 'packet', 100, 2, 89, 0, 'Available', 20, 2),
(24, 13, 'packet', 50, 2, 55, 0, 'Available', 20, 2),
(25, 14, 'packet', 300, 2, 190, 0, 'Available', 20, 2),
(26, 14, 'packet', 150, 2, 99, 0, 'Available', 20, 2),
(27, 15, 'packet', 100, 2, 89, 0, 'Available', 20, 2),
(28, 15, 'packet', 50, 2, 55, 0, 'Available', 20, 2),
(29, 16, 'packet', 100, 2, 89, 0, 'Available', 20, 2),
(30, 16, 'packet', 50, 2, 55, 0, 'Available', 20, 2),
(31, 17, 'packet', 100, 2, 89, 0, 'Available', 20, 2),
(32, 17, 'packet', 50, 2, 55, 0, 'Available', 20, 2),
(33, 18, 'packet', 100, 2, 89, 0, 'Available', 20, 2),
(34, 18, 'packet', 50, 2, 55, 0, 'Available', 20, 2),
(35, 19, 'packet', 32, 1, 499, 0, 'Available', 10, 1),
(36, 20, 'packet', 32, 1, 899, 0, 'Available', 10, 1),
(37, 21, 'packet', 34, 1, 1499, 99, 'Available', 10, 1),
(38, 22, 'packet', 32, 1, 1799, 0, 'Available', 10, 1),
(39, 23, 'packet', 32, 1, 999, 0, 'Available', 10, 1),
(40, 24, 'packet', 32, 6, 998, 0, 'Available', 10, 1),
(41, 25, 'packet', 32, 6, 1499, 0, 'Available', 10, 6),
(42, 26, 'packet', 32, 6, 1499, 0, 'Available', 10, 6),
(43, 27, 'packet', 32, 6, 2499, 0, 'Available', 10, 6),
(44, 28, 'packet', 32, 6, 4999, 0, 'Available', 10, 6),
(45, 29, 'packet', 32, 6, 4499, 0, 'Available', 10, 6),
(46, 30, 'packet', 32, 6, 3999, 0, 'Available', 9, 6),
(47, 31, 'packet', 32, 6, 4999, 0, 'Available', 10, 6),
(48, 32, 'packet', 32, 6, 4499, 0, 'Available', 9, 6),
(49, 33, 'packet', 32, 6, 2999, 0, 'Available', 9, 6),
(50, 34, 'packet', 32, 6, 2999, 0, 'Available', 3, 6),
(51, 35, 'packet', 32, 6, 1499, 0, 'Available', 9, 6),
(52, 36, 'packet', 32, 6, 2499, 0, 'Available', 9, 6),
(53, 37, 'packet', 32, 6, 999, 0, 'Available', 8, 6),
(56, 40, 'packet', 1.5, 1, 49990, 45990, 'Available', 50, 1),
(57, 41, 'packet', 1.5, 1, 49990, 45990, 'Available', 50, 1),
(58, 42, 'packet', 1.5, 1, 49990, 45990, 'Available', 50, 1),
(59, 43, 'packet', 1.5, 1, 45990, 45449, 'Available', 50, 1),
(60, 44, 'packet', 1, 1, 5000, 400, 'Available', 250, 1),
(61, 44, 'packet', 2, 1, 6000, 500, 'Available', 250, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) NOT NULL,
  `start_date` varchar(28) NOT NULL,
  `end_date` varchar(28) NOT NULL,
  `no_of_users` int(11) NOT NULL,
  `minimum_order_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_type` varchar(28) NOT NULL,
  `max_discount_amount` int(11) NOT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `return_requests`
--

CREATE TABLE `return_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 NOT NULL,
  `short_description` varchar(64) CHARACTER SET utf8 NOT NULL,
  `style` varchar(16) NOT NULL,
  `product_ids` varchar(1024) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `short_description`, `style`, `product_ids`, `date_added`) VALUES
(12, 'Leptops', 'New Product', 'style_1', '43,42,41,40', '2021-06-01 12:17:28'),
(15, 'New Arrivals', 'New Arrivals', 'style_3', '43,42,41,40', '2021-06-22 07:08:07'),
(14, 'Hottest Offers/Deals', 'Hottest Offers/Deals', 'style_2', '43,42,41,40', '2021-06-22 07:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(32) NOT NULL,
  `company_name` varchar(64) NOT NULL,
  `personal_address` text NOT NULL,
  `company_address` text NOT NULL,
  `dob` date NOT NULL,
  `account_details` text NOT NULL,
  `password` varchar(32) NOT NULL,
  `gst_no` varchar(16) NOT NULL,
  `pan_no` varchar(16) NOT NULL,
  `status` varchar(8) NOT NULL,
  `commission` varchar(8) DEFAULT NULL,
  `balance` int(11) NOT NULL,
  `last_login_ip` varchar(32) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` text NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(6, 'logo', 'logo.png'),
(9, 'privacy_policy', '<p><strong>Demo</strong></p>'),
(10, 'terms_conditions', '<p><strong>Demo</strong></p>'),
(11, 'fcm_server_key', ''),
(12, 'contact_us', '<h2>Demo text</h2>'),
(13, 'system_timezone', '{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"Marvel Tech\",\"support_number\":\"+91 9876543210\",\"support_email\":\"demo@gmail.com\",\"current_version\":\"1.0.0\",\"minimum_version_required\":\"1.0.0\",\"is-version-system-on\":\"1\",\"store_address\":\"Baroda\",\"map_latitude\":\"\",\"map_longitude\":\"\",\"currency\":\"u20b9\",\"delivery_charge\":\"0\",\"system_timezone\":\"Asia/Kolkata\",\"min_amount\":\"500\",\"min_order_amount\":\"1\",\"max_cart_items_count\":\"12\",\"area-wise-delivery-charge\":\"1\",\"is-refer-earn-on\":\"1\",\"min-refer-earn-order-amount\":\"100\",\"refer-earn-bonus\":\"2\",\"refer-earn-method\":\"percentage\",\"max-refer-earn-amount\":\"5000\",\"minimum-withdrawal-amount\":\"10000\",\"max-product-return-days\":\"10\",\"delivery-boy-bonus-percentage\":\"10\",\"low-stock-limit\":\"10\",\"user-wallet-refill-limit\":\"1000\",\"from_mail\":\"info@ecart.com\",\"reply_to\":\"info@ecart.com\",\"generate-otp\":\"1\",\"smtp-from-mail\":\"mail@gmail.com\",\"smtp-reply-to\":\"mail@gmail.com\",\"smtp-email-password\":\"password\",\"smtp-host\":\"mail.gmail.com\",\"smtp-port\":\"465\",\"smtp-content-type\":\"html\",\"smtp-encryption-type\":\"ssl\"}'),
(15, 'about_us', '<h2>The food world has changed a lot with the COVID situation. We understand now you are scared to step out with your loved ones. But you want to enjoy some restaurant style authentic foods at the comfort of your home - Presenting Ready to cook- Perfectly blended- Authentic Masala Kits. With our range of Ready to cook Masala Kits - Cook all of your favourite dishes while enjoying family time at you home.</h2>'),
(80, 'currency', '₹'),
(81, 'delivery_boy_privacy_policy', '<p><strong>Demo</strong></p>'),
(82, 'delivery_boy_terms_conditions', '<p><strong>Demo</strong></p>'),
(92, 'payment_methods', '{\"payment_method_settings\":\"1\",\"cod_payment_method\":\"1\",\"paypal_payment_method\":\"0\",\"paypal_mode\":\"production\",\"paypal_currency_code\":\"INR\",\"paypal_business_email\":\"seller@somedomain.com\",\"payumoney_payment_method\":\"1\",\"payumoney_mode\":\"sandbox\",\"payumoney_merchant_key\":\"Q9zIXaco\",\"payumoney_merchant_id\":\"7401315\",\"payumoney_salt\":\"u3dODEvwdy\",\"razorpay_payment_method\":\"0\",\"razorpay_key\":\"rzp_test_5C2xAlmPLusefe\",\"razorpay_secret_key\":\"w2mbZK4vvwqAUeoN3W1jbVuV\",\"paystack_payment_method\":\"0\",\"paystack_public_key\":\"pk_test_fd8f8d9c548cbd143c83a4bdf6cee5c11f8e6c66\",\"paystack_secret_key\":\"sk_test_dcc02e93797953bb933b6d4c0dec928f1f7e0118\",\"flutterwave_payment_method\":\"0\",\"flutterwave_public_key\":\"FLWPUBK_TEST-1ffbaed6ee3788cd2bcbb898d3b90c59-X\",\"flutterwave_secret_key\":\"FLWSECK_TEST-c659ffd76304fff90fc4b67ae735b126-X\",\"flutterwave_encryption_key\":\"FLWSECK_TEST25c36edcfcaa\",\"flutterwave_currency_code\":\"KES\",\"midtrans_payment_method\":\"0\",\"is_production\":\"1\",\"midtrans_merchant_id\":\"G282367496\",\"midtrans_client_key\":\"SB-Mid-client-roooHrl0UI6xDJ7-\",\"midtrans_server_key\":\"SB-Mid-server-3SMP6XVmklsN2sRGrbGUfdal\",\"stripe_payment_method\":\"0\",\"stripe_publishable_key\":\"pk_test_51Hh90WLYfObhNTTwooBHwynrlfiPo2uwxyCVqGNNCWGmpdOHuaW4rYS9cDldKJ1hxV5ik52UXUDSYgEM66OX45550065US7tRX\",\"stripe_secret_key\":\"sk_test_51Hh90WLYfObhNTTwO8kCsbdnMdmLxiGHEpiQPGBkYlahlBAQ3RnXPIKGn3YsGIEMoIQ5bNfxye4kzE6wfLiINzNk00xOYprnZt\",\"stripe_webhook_secret_key\":\"whsec_c9XIsxcWEweL0J3DNtDH8YEBzcsVw8Ol\",\"stripe_currency_code\":\"INR\",\"paytm_payment_method\":\"0\",\"paytm_mode\":\"production\",\"paytm_merchant_key\":\"eIcrB!DTHJlQ5DN8\",\"paytm_merchant_id\":\"PpGeMd34849525540215\"}'),
(83, 'time_slot_config', '{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"1\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"7\"}'),
(95, 'manager_app_privacy_policy', '<p><strong>demo</strong></p>'),
(96, 'manager_app_terms_conditions', '<p><strong>demo</strong></p>'),
(99, 'categories_settings', '{\"add_category_settings\":\"1\",\"cat_style\":\"style_2\",\"max_visible_categories\":\"2\",\"max_col_in_single_row\":\"3\"}'),
(97, 'front_end_settings', '{\"front_end_settings\":\"1\",\"android_app_url\":\"Marvel Tech\",\"call_back_url\":\"https://marvel.niktechsolution.com/\",\"common_meta_keywords\":\"\",\"common_meta_description\":\"\",\"favicon\":\"1622538163.713.png\",\"web_logo\":\"1622541313.5507.png\",\"screenshots\":\"1608552564.1753.png\",\"google_play\":\"1608552564.1758.png\"}'),
(100, 'doctor_brown', '{\"code_bravo\":\"ed292da2-03d8-4711-bffc-6a8b712a7dac\",\"time_check\":\"019b3a68f1254027037d415b6f2ef7eb4279189dfa9f1058099a1fcfb20dae36\",\"code_adam\":\"vivanvz\",\"dr_firestone\":\"29260418\",\"add_dr_gold\":\"1\"} ');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `type_id` varchar(16) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `type`, `type_id`, `image`, `date_added`) VALUES
(26, 'default', '0', 'upload/slider/1622542678778.jpg', '2021-06-01 10:17:58'),
(27, 'default', '0', 'upload/slider/1622544320307.jpg', '2021-06-01 10:45:20'),
(25, 'default', '0', 'upload/slider/1622542155032.jpg', '2021-06-01 10:09:15'),
(28, 'default', '0', 'upload/slider/1624345407532.jpg', '2021-06-22 07:03:27');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(11) NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `category_id`, `name`, `slug`, `subtitle`, `image`) VALUES
(17, 12, 'HP', 'hp', 'HP', 'upload/images/8164-2021-06-01.jpg'),
(16, 12, 'Asus', 'asus', 'Asus', 'upload/images/2944-2021-06-01.png'),
(15, 12, 'Lenovo', 'lenovo', 'lenovo', 'upload/images/3420-2021-06-01.jpg'),
(14, 12, 'Dell', 'dell', 'Dell', 'upload/images/6529-2021-06-01.jpg'),
(18, 19, 'Iphone', 'iphone', 'Iphone', 'upload/images/0255-2021-06-22.png'),
(19, 19, 'Samsung', 'samsung', 'Samsung', 'upload/images/8355-2021-06-22.png');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 DEFAULT NULL,
  `percentage` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `type` varchar(12) NOT NULL,
  `txn_id` varchar(256) NOT NULL,
  `payu_txn_id` varchar(512) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(8) NOT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `type`, `txn_id`, `payu_txn_id`, `amount`, `status`, `message`, `transaction_date`, `date_created`) VALUES
(1, 1, '2', 'payumoney', 'dbc049bcc5570e2f5bba', NULL, 1, 'Success', 'Order Placed Successfully', '2021-02-13 16:44:36', '2021-02-13 11:14:36'),
(2, 2, '6', 'razorpay', 'pay_GbspmTlxVmPRWT', NULL, 199, 'Success', 'Order Placed Successfully', '2021-02-15 20:01:23', '2021-02-15 14:31:23'),
(3, 1, '7', 'razorpay', 'pay_GbsylQYWUed3oc', NULL, 170, 'Success', 'Order Placed Successfully', '2021-02-15 20:09:52', '2021-02-15 14:39:52'),
(4, 1, '9', 'payumoney', '589026d4a7e901a65362', NULL, 5998, 'Success', 'Order Placed Successfully', '2021-03-26 18:09:01', '2021-03-26 12:39:01'),
(5, 1, '10', 'payumoney', 'c2009240944e9706e7bd', NULL, 3999, 'Success', 'Order Placed Successfully', '2021-03-27 11:14:10', '2021-03-27 05:44:10'),
(6, 1, '11', 'payumoney', '91c0bbf6e7411f58f84e', NULL, 12495, 'Success', 'Order Placed Successfully', '2021-03-27 11:57:14', '2021-03-27 06:27:14'),
(7, 1, '12', 'payumoney', '957d02015b58f745d6fd', NULL, 14995, 'Success', 'Order Placed Successfully', '2021-03-28 14:35:19', '2021-03-28 09:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `short_code`, `parent_id`, `conversion`) VALUES
(1, 'Kilo Gram', 'kg', NULL, NULL),
(2, 'Gram', 'gm', 1, 1000),
(3, 'Liter', 'ltr', NULL, NULL),
(4, 'Milliliter', 'ml', 3, 1000),
(5, 'Pack', 'pack', NULL, NULL),
(6, 'Piece', 'pc', NULL, NULL),
(7, 'Meter', 'm', NULL, NULL),
(8, 'M', 'M', NULL, NULL),
(9, 'L', 'L', NULL, NULL),
(10, 'XL', 'XL', NULL, NULL),
(11, 'XXL', 'XXL', NULL, NULL),
(12, 'S', 'S', NULL, NULL),
(13, 'XXXL', 'XXXL', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, 'v2.0.8'),
(2, 'v2.0.8.1'),
(3, 'v2.0.8.2'),
(4, 'v2.0.9');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 NOT NULL,
  `profile` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '91',
  `mobile` varchar(14) CHARACTER SET utf8 NOT NULL,
  `dob` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` text CHARACTER SET utf8 NOT NULL,
  `area` text CHARACTER SET utf8 NOT NULL,
  `street` text CHARACTER SET utf8 NOT NULL,
  `pincode` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `apikey` varchar(32) CHARACTER SET utf8 NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `referral_code` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `friends_code` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `profile`, `country_code`, `mobile`, `dob`, `city`, `area`, `street`, `pincode`, `apikey`, `balance`, `referral_code`, `friends_code`, `fcm_id`, `latitude`, `longitude`, `password`, `status`, `created_at`) VALUES
(2, 'Manubhai', 'meonwork999@gmail.com', 'default_user_profile.png', '+91', '9898751216', '', '', '', '', '', '', 0, 'PCNZN2LCBY', '', '', '0', '0', '30bf3450d793c0a47f919ff74db06c3b', 1, '2021-02-13 09:46:11'),
(3, 'Mathew Varghese', 'iecnatural@gmail.com', 'default_user_profile.png', '+91', '9265024179', '', '', '', '', '', '', 0, 'LIX3JZ2EVR', '', '', '0', '0', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-02-16 10:03:35'),
(4, 'nikunj', 'info@niktechsolution.com', 'default_user_profile.png', '+91', '9429812012', '', '', '', '', '', '', 0, 'RU0ZD3E1YJ', '', '', '0', '0', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-03-25 13:40:06'),
(5, 'Manisha', 'manisha@thetricube.com', 'default_user_profile.png', '+91', '8460461278', '', '', '', '', '', '', 0, 'E6O923INWG', '', '', '0', '0', '25f9e794323b453885f5181f1b624d0b', 1, '2021-04-08 12:57:48'),
(6, 'Ali', 'mktg@niktechsolution.com', 'default_user_profile.png', '+91', '9998148314', '', '', '', '', '', '', 0, 'DS0GB1FUXH', '', '', '0', '0', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-06-04 11:05:13'),
(7, 'riya', 'mktg@niktechsolution.com', 'default_user_profile.png', '+91', '8155925891', '', '', '', '', '', '', 0, 'G3GBQMGUZF', '', '', '0', '0', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-06-04 13:25:45'),
(8, 'ppshah', 'pshah@gmail.com', 'default_user_profile.png', '+91', '9723840340', '', '', '', '', '', '', 0, 'XEBTHX85SF', '', '', '0', '0', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-06-15 13:44:15'),
(9, 'krunal', 'pkrunal77@gmail.com', 'default_user_profile.png', '+91', '9904547719', '', '', '', '', '', '', 0, '4GT2G7M5LR', '', '', '0', '0', '02f7037d8e36abd6005d456a2107a0a0', 1, '2021-06-18 07:22:58'),
(10, 'sarthak', 'info@niktechsolution.com', 'default_user_profile.png', '+91', '8469598777', '', '', '', '', '', '', 0, '9OB18XRTKM', '', '', '0', '0', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-06-21 16:53:21'),
(11, 'margrate', 'mktg@niktechsolution.com', 'default_user_profile.png', '+254', '721308538', '', '', '', '', '', '', 0, 'GZ9Z3A79YT', '', '', '0', '0', '25f9e794323b453885f5181f1b624d0b', 1, '2021-06-22 07:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `alternate_mobile` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8_unicode_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `pincode` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `type`, `name`, `country_code`, `mobile`, `alternate_mobile`, `address`, `landmark`, `area_id`, `city_id`, `pincode`, `state`, `country`, `latitude`, `longitude`, `is_default`, `date_created`) VALUES
(1, 1, 'Home', 'vivan', '+91', '7016724053', '9898751216', 'vivan', 'Ahmedabad', 1, 1, '380026', 'gujrat', 'India', '0', '0', 1, '2021-02-13 09:37:23'),
(2, 2, 'Home', 'vivan parmar', '+1', '07016724053', '', '48 Ashapuri nagar near swstick cross road Gujarat', 'Ahmedabad', 1, 1, '380026', 'Select a State', 'India', '0', '0', 0, '2021-02-13 09:47:15'),
(3, 4, 'Home', 'Niktech Solution', '+91', '09429812012', '09429812012', 'TF-9-A Lotus Aura 1', 'vadodara', 1, 1, '389001', 'Gujarat', 'India', '0', '0', 1, '2021-03-25 13:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` int(11) NOT NULL,
  `type` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `message` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_requests`
--
ALTER TABLE `return_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_requests`
--
ALTER TABLE `return_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
