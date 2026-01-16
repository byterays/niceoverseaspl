-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2025 at 09:47 PM
-- Server version: 10.6.24-MariaDB
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `niceover_np`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(120) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'FLJ0t03rGyWmuIJJts9KtpJreov86msn', 1, '2024-01-05 02:17:19', '2024-01-05 02:17:19', '2024-01-05 02:17:19'),
(2, 2, 'JVx4RGeWPzAfecf7OLtVaB7L1sqGrNuG', 1, '2024-01-05 02:17:19', '2024-01-05 02:17:19', '2024-01-05 02:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `action_label` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT 0,
  `action_label` varchar(60) DEFAULT NULL,
  `action_url` varchar(400) DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT 0,
  `dismissible` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements_translations`
--

CREATE TABLE `announcements_translations` (
  `lang_code` varchar(191) NOT NULL,
  `announcements_id` bigint(20) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(60) NOT NULL,
  `request` longtext DEFAULT NULL,
  `action` varchar(120) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `reference_user` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bs_packages`
--

CREATE TABLE `bs_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` text NOT NULL,
  `price` varchar(191) NOT NULL,
  `annual_price` varchar(191) DEFAULT NULL,
  `duration` varchar(191) NOT NULL DEFAULT 'monthly',
  `features` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'published',
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bs_packages`
--

INSERT INTO `bs_packages` (`id`, `name`, `description`, `content`, `price`, `annual_price`, `duration`, `features`, `status`, `is_popular`, `created_at`, `updated_at`) VALUES
(1, 'Trial Plan', 'Protect for testing', '<section class=\"package\">\n    <h2>Comprehensive Growth Package</h2>\n    <p class=\"description\">Experience unparalleled business growth with our Comprehensive Growth Package. This package is designed to elevate your business to new heights by providing a range of strategic and creative services.</p>\n\n    <h3>Services Included:</h3>\n    <ul>\n        <li><strong>Custom Branding:</strong> Our team of experts will work closely with you to develop a unique and compelling brand identity that resonates with your target audience.</li>\n        <li><strong>Website Overhaul:</strong> Your existing website will undergo a complete makeover to enhance user experience, improve functionality, and drive conversions.</li>\n        <li><strong>Content Strategy:</strong> We will develop a content strategy that aligns with your business goals, creating engaging and relevant content to attract and retain customers.</li>\n        <li><strong>Search Engine Optimization (SEO):</strong> Our SEO specialists will optimize your website to ensure it ranks high on search engine results pages, driving organic traffic.</li>\n        <li><strong>Social Media Mastery:</strong> We\'ll manage your social media platforms, creating compelling posts, engaging with your audience, and running targeted ad campaigns.</li>\n        <li><strong>Email Marketing Campaigns:</strong> We\'ll design and execute effective email marketing campaigns to nurture leads and keep your customers informed.</li>\n        <li><strong>Performance Analytics:</strong> Gain insights into your business\'s performance through in-depth analytics, helping you make informed decisions.</li>\n    </ul>\n\n    <h3>Package Benefits:</h3>\n    <ul>\n        <li>Strategic business growth tailored to your unique needs.</li>\n        <li>Increased brand visibility and recognition.</li>\n        <li>Higher website traffic and improved user engagement.</li>\n        <li>Effective customer engagement through various channels.</li>\n        <li>Measurable results with data-driven insights.</li>\n    </ul>\n</section>\n', 'FREE', 'FREE', 'monthly', '+ Brand Awareness Ads\n+ Retargeting Ads\n+ Contextual, Demographic\n+ Facebook Advertising\n- Global Certificates\n- Snapchat Advertising\n- TikTok Advertising\n- Advanced List Building', 'published', 0, '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(2, 'Standard', 'Advanced project', '<section class=\"package\">\n    <h2>Comprehensive Growth Package</h2>\n    <p class=\"description\">Experience unparalleled business growth with our Comprehensive Growth Package. This package is designed to elevate your business to new heights by providing a range of strategic and creative services.</p>\n\n    <h3>Services Included:</h3>\n    <ul>\n        <li><strong>Custom Branding:</strong> Our team of experts will work closely with you to develop a unique and compelling brand identity that resonates with your target audience.</li>\n        <li><strong>Website Overhaul:</strong> Your existing website will undergo a complete makeover to enhance user experience, improve functionality, and drive conversions.</li>\n        <li><strong>Content Strategy:</strong> We will develop a content strategy that aligns with your business goals, creating engaging and relevant content to attract and retain customers.</li>\n        <li><strong>Search Engine Optimization (SEO):</strong> Our SEO specialists will optimize your website to ensure it ranks high on search engine results pages, driving organic traffic.</li>\n        <li><strong>Social Media Mastery:</strong> We\'ll manage your social media platforms, creating compelling posts, engaging with your audience, and running targeted ad campaigns.</li>\n        <li><strong>Email Marketing Campaigns:</strong> We\'ll design and execute effective email marketing campaigns to nurture leads and keep your customers informed.</li>\n        <li><strong>Performance Analytics:</strong> Gain insights into your business\'s performance through in-depth analytics, helping you make informed decisions.</li>\n    </ul>\n\n    <h3>Package Benefits:</h3>\n    <ul>\n        <li>Strategic business growth tailored to your unique needs.</li>\n        <li>Increased brand visibility and recognition.</li>\n        <li>Higher website traffic and improved user engagement.</li>\n        <li>Effective customer engagement through various channels.</li>\n        <li>Measurable results with data-driven insights.</li>\n    </ul>\n</section>\n', '$29', '$348', 'monthly', '+ Brand Awareness Ads\n+ Retargeting Ads\n+ Contextual, Demographic\n+ Facebook Advertising\n+ Global Certificates\n- Snapchat Advertising\n- TikTok Advertising\n- Advanced List Building', 'published', 1, '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(3, 'Business', 'Protect for testing', '<section class=\"package\">\n    <h2>Comprehensive Growth Package</h2>\n    <p class=\"description\">Experience unparalleled business growth with our Comprehensive Growth Package. This package is designed to elevate your business to new heights by providing a range of strategic and creative services.</p>\n\n    <h3>Services Included:</h3>\n    <ul>\n        <li><strong>Custom Branding:</strong> Our team of experts will work closely with you to develop a unique and compelling brand identity that resonates with your target audience.</li>\n        <li><strong>Website Overhaul:</strong> Your existing website will undergo a complete makeover to enhance user experience, improve functionality, and drive conversions.</li>\n        <li><strong>Content Strategy:</strong> We will develop a content strategy that aligns with your business goals, creating engaging and relevant content to attract and retain customers.</li>\n        <li><strong>Search Engine Optimization (SEO):</strong> Our SEO specialists will optimize your website to ensure it ranks high on search engine results pages, driving organic traffic.</li>\n        <li><strong>Social Media Mastery:</strong> We\'ll manage your social media platforms, creating compelling posts, engaging with your audience, and running targeted ad campaigns.</li>\n        <li><strong>Email Marketing Campaigns:</strong> We\'ll design and execute effective email marketing campaigns to nurture leads and keep your customers informed.</li>\n        <li><strong>Performance Analytics:</strong> Gain insights into your business\'s performance through in-depth analytics, helping you make informed decisions.</li>\n    </ul>\n\n    <h3>Package Benefits:</h3>\n    <ul>\n        <li>Strategic business growth tailored to your unique needs.</li>\n        <li>Increased brand visibility and recognition.</li>\n        <li>Higher website traffic and improved user engagement.</li>\n        <li>Effective customer engagement through various channels.</li>\n        <li>Measurable results with data-driven insights.</li>\n    </ul>\n</section>\n', '$99', '$1,188', 'monthly', '+ Brand Awareness Ads\n+ Retargeting Ads\n+ Contextual, Demographic\n+ Facebook Advertising\n+ Global Certificates\n+ Snapchat Advertising\n- TikTok Advertising\n- Advanced List Building', 'published', 0, '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(4, 'Enterprise', 'Protect for testing', '<section class=\"package\">\n    <h2>Comprehensive Growth Package</h2>\n    <p class=\"description\">Experience unparalleled business growth with our Comprehensive Growth Package. This package is designed to elevate your business to new heights by providing a range of strategic and creative services.</p>\n\n    <h3>Services Included:</h3>\n    <ul>\n        <li><strong>Custom Branding:</strong> Our team of experts will work closely with you to develop a unique and compelling brand identity that resonates with your target audience.</li>\n        <li><strong>Website Overhaul:</strong> Your existing website will undergo a complete makeover to enhance user experience, improve functionality, and drive conversions.</li>\n        <li><strong>Content Strategy:</strong> We will develop a content strategy that aligns with your business goals, creating engaging and relevant content to attract and retain customers.</li>\n        <li><strong>Search Engine Optimization (SEO):</strong> Our SEO specialists will optimize your website to ensure it ranks high on search engine results pages, driving organic traffic.</li>\n        <li><strong>Social Media Mastery:</strong> We\'ll manage your social media platforms, creating compelling posts, engaging with your audience, and running targeted ad campaigns.</li>\n        <li><strong>Email Marketing Campaigns:</strong> We\'ll design and execute effective email marketing campaigns to nurture leads and keep your customers informed.</li>\n        <li><strong>Performance Analytics:</strong> Gain insights into your business\'s performance through in-depth analytics, helping you make informed decisions.</li>\n    </ul>\n\n    <h3>Package Benefits:</h3>\n    <ul>\n        <li>Strategic business growth tailored to your unique needs.</li>\n        <li>Increased brand visibility and recognition.</li>\n        <li>Higher website traffic and improved user engagement.</li>\n        <li>Effective customer engagement through various channels.</li>\n        <li>Measurable results with data-driven insights.</li>\n    </ul>\n</section>\n', '$299', '$3,588', 'monthly', '+ Brand Awareness Ads\n+ Retargeting Ads\n+ Contextual, Demographic\n+ Facebook Advertising\n+ Global Certificates\n+ Snapchat Advertising\n+ TikTok Advertising\n+ Advanced List Building', 'published', 0, '2024-01-05 02:17:53', '2024-01-05 02:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `bs_packages_translations`
--

CREATE TABLE `bs_packages_translations` (
  `lang_code` varchar(191) NOT NULL,
  `bs_packages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `price` varchar(191) DEFAULT NULL,
  `annual_price` varchar(191) DEFAULT NULL,
  `features` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bs_services`
--

CREATE TABLE `bs_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bs_services`
--

INSERT INTO `bs_services` (`id`, `category_id`, `name`, `description`, `content`, `is_featured`, `image`, `images`, `views`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'HR Consultancy in Japan', 'Delivering tailored recruitment solutions that drive success for businesses across Japan.', '<p>Nice Overseas Pvt. Ltd. is your trusted partner for reliable HR solutions in Japan. With a strong understanding of local market dynamics, regulations, and cultural nuances, we specialize in sourcing various manpower to meet diverse business needs.</p><p>We prioritize professionalism, integrity, and client satisfaction—delivering tailored recruitment solutions that drive success for businesses across Japan.</p>', 1, 'services/hr-consultancy-1.jpg', '[\"general\\/banner-help-center-1.png\"]', 1483, 'published', '2024-01-05 02:17:53', '2025-03-29 08:32:03'),
(2, 1, 'Overseas Recruitment Services', 'Your trusted partner for global recruitment solutions, connecting talent worldwide.', '<p><strong>Nice Overseas Pvt. Ltd.</strong> is your trusted partner for <strong>Overseas Recruitment Services</strong>, offering customized solutions to meet the diverse staffing needs of businesses globally. With our expansive network, industry expertise, and commitment to excellence, we specialize in connecting employers with top-tier talent from across the world.</p><p>Our <strong>Overseas Recruitment Services</strong> cover every stage of the hiring process—from sourcing and screening candidates to visa processing and deployment. We understand the complexities of international recruitment and aim to simplify the experience for our clients, ensuring compliance with local regulations and cultural sensitivities.</p><p>At <strong>Nice Overseas</strong>, we prioritize transparency, integrity, and professionalism in all our interactions. Whether you\'re looking for skilled professionals for short-term projects or long-term placements, we leverage our global reach and resources to find candidates who meet your specific needs and contribute to your organization\'s success.</p><p>Partner with us to unlock new opportunities and build a workforce that drives innovation, growth, and global competitiveness.</p>', 1, 'services/overseas-recruitment-services-1.jpg', '[\"general\\/banner-help-center-2.png\"]', 348, 'published', '2024-01-05 02:17:53', '2025-03-29 10:11:53'),
(3, 1, 'Talent Acquisition', 'We source, screen, and select top professionals, skilled, semi-skilled, and unskilled manpower.', '<h3><strong>Talent Acquisition: Connecting You with Global Talent</strong></h3><p>At <strong>Nice Overseas Pvt. Ltd.</strong>, our <strong>Talent Acquisition</strong> service is designed to meet the unique staffing needs of businesses worldwide. We specialize in sourcing, screening, and selecting top-tier professionals, skilled, semi-skilled, and unskilled manpower from diverse industries.</p><p>🔹 <strong>Comprehensive Sourcing:</strong> Leveraging a vast network and industry expertise to identify the right talent.<br>🔹 <strong>Rigorous Screening:</strong> Conducting detailed assessments to ensure candidates meet role-specific requirements.<br>🔹 <strong>Tailored Solutions:</strong> Customizing hiring strategies based on your organization\'s unique needs.<br>🔹 <strong>Global Reach:</strong> Connecting you with qualified candidates from multiple countries.</p><p>With <strong>Nice Overseas</strong>, you gain access to exceptional talent that drives productivity, growth, and success for your business.</p>', 0, 'services/staffing-solution-10a.jpg', '[\"general\\/box-image-1.png\"]', 6614, 'published', '2024-01-05 02:17:53', '2025-03-29 13:49:58'),
(4, 1, 'Visa Processing & Documentation', 'We manage immigration, work permits, and documentation with efficiency.', '<h3><strong>Visa Processing &amp; Documentation: Streamlined Solutions for Global Mobility</strong></h3><p>At <strong>Nice Overseas Pvt. Ltd.</strong>, our <strong>Visa Processing &amp; Documentation</strong> service ensures a hassle-free and compliant journey for global talent. We handle the complexities of immigration, work permits, and legal documentation with precision and efficiency.</p><p>🔹 <strong>End-to-End Visa Assistance:</strong> Managing applications, permits, and approvals for seamless international employment.<br>🔹 <strong>Compliance &amp; Regulations:</strong> Ensuring adherence to local laws and immigration policies.<br>🔹 <strong>Accurate Documentation:</strong> Preparing and verifying essential documents for smooth processing.<br>🔹 <strong>Timely Updates:</strong> Keeping clients informed at every stage of the process.</p><p>With <strong>Nice Overseas</strong>, you can confidently navigate the complexities of global mobility, enabling your workforce to thrive anywhere.</p>', 0, 'services/global-manpower-solution.jpg', '[\"general\\/box-image-2.png\"]', 8436, 'published', '2024-01-05 02:17:53', '2025-03-29 13:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `bs_services_translations`
--

CREATE TABLE `bs_services_translations` (
  `lang_code` varchar(191) NOT NULL,
  `bs_services_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bs_service_categories`
--

CREATE TABLE `bs_service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bs_service_categories`
--

INSERT INTO `bs_service_categories` (`id`, `parent_id`, `name`, `description`, `image`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Overseas Job Consultancy', NULL, NULL, 1, 'published', '2024-01-05 02:17:53', '2024-03-24 00:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `bs_service_categories_translations`
--

CREATE TABLE `bs_service_categories_translations` (
  `lang_code` varchar(191) NOT NULL,
  `bs_service_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bs_service_industries`
--

CREATE TABLE `bs_service_industries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bs_service_industries`
--

INSERT INTO `bs_service_industries` (`id`, `name`, `image`, `description`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hotel', 'industries/hotel-1.jpg', NULL, '<p>Hotel</p>', 'published', '2024-03-24 09:43:45', '2024-03-24 09:43:45'),
(2, 'Security', 'industries/security-1.jpg', NULL, '<p>Hotel</p>', 'published', '2024-03-24 09:45:24', '2024-03-24 09:45:24'),
(3, 'Construction', 'industries/construction-1.jpg', NULL, '', 'published', '2024-03-24 11:37:15', '2024-03-24 11:37:15'),
(4, 'SPA', 'industries/spa-1.jpg', NULL, '', 'published', '2024-03-24 11:40:21', '2024-03-24 11:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `location` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `careers_translations`
--

CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) NOT NULL,
  `careers_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(8, 'Administration', 0, NULL, 'published', NULL, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2024-04-04 12:59:28', '2024-04-04 12:59:31'),
(9, 'Account', 0, NULL, 'published', NULL, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2024-04-04 13:00:18', '2024-04-04 13:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `record_id` varchar(40) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities_translations`
--

CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) NOT NULL,
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(120) NOT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `logo` varchar(60) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `country_id`, `name`, `state`, `city`, `address`, `phone`, `email`, `logo`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Asia Kitchen', 'Dubai', 'Dubai city', 'Dubai address', '971 154555 phone', 'asia@gmail.com', 'company-logo/uae/asia-kitchen-web.png', 0, 'published', '2024-04-04 07:36:07', '2024-04-04 07:36:07'),
(2, 1, 'Bu Abdullah Realestate', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'asia@gmail.com', 'company-logo/uae/bu-abdullah-real-estate.png', 0, 'published', '2024-04-04 07:44:05', '2024-04-04 07:44:05'),
(3, 1, 'Azmeer Gas', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'company@company.com', 'company-logo/uae/azmeer-gas.jpg', 0, 'published', '2024-04-04 07:46:38', '2024-04-04 07:46:38'),
(4, 1, 'Adnoc', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'dubai@dubai.com', 'company-logo/uae/adnoc-logo-copy.png', 0, 'published', '2024-04-05 12:09:13', '2024-04-05 12:09:13'),
(5, 1, 'Azmeer Gas', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'dubai@dubai.com', 'company-logo/uae/azmeer-gas-copy.png', 0, 'published', '2024-04-05 12:10:29', '2024-04-05 12:10:29'),
(6, 1, 'AsiaKitchen', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'dubai@dubai.com', 'company-logo/uae/asia-kitchen-copy.png', 0, 'published', '2024-04-06 02:00:42', '2024-04-06 02:00:42'),
(7, 1, 'Azmeergas', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'dubai@dubai.com', 'company-logo/uae/azmeer-gas-copy.png', 0, 'published', '2024-04-06 02:02:22', '2024-04-06 02:02:22'),
(8, 1, 'Bu Abdullah Realestates', 'Dubai', 'Dubai', 'Dubai address', '971 154555 phone', 'dubai@dubai.com', 'company-logo/uae/bu-abdullah-real-estate-copy.png', 0, 'published', '2024-04-06 02:03:12', '2024-04-06 02:03:12'),
(9, 1, 'Carrefour', 'Dubai', 'Dubai', 'Dubai', '971 154555', 'info@miraclehrhub.com', 'company-logo/uae/carrefour-uae-copy.png', 0, 'published', '2024-04-06 02:04:28', '2024-04-06 02:04:28'),
(10, 3, 'Red panda', 'Cyprus', 'Cyprus', 'Cyprus', '971 154555', 'Cyprus@cyprus.com', 'company-logo/cyprus/red-panda-copy.png', 0, 'published', '2024-04-06 02:05:33', '2024-04-06 02:05:33'),
(11, 3, 'E G ESTIACYPRUS', 'Cyprus', 'Cyprus', 'Cyprus', '971 154555', 'Cyprus@cyprus.com', 'company-logo/cyprus/e-g-estiacyprus1-copy.png', 0, 'published', '2024-04-06 02:09:23', '2024-04-06 02:09:23'),
(12, 3, 'Ansot', 'Cyprus', 'Cyprus', 'Cyprus', '971 154555', 'Cyprus@cyprus.com', 'company-logo/cyprus/cyprus-ansot-copy.png', 0, 'published', '2024-04-06 02:10:10', '2024-04-06 02:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `subject` varchar(120) DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `status`, `created_at`, `updated_at`) VALUES
(29, 'Gary Charles', 'garycharles@dominatingkeywords.com', '8054002077', NULL, NULL, 'Let me demonstrate to you how you can get guaranteed thousands of clicks to your website without SEO and without Pay Per Click.\nYou will start getting keyword targeted traffic in less than 48 hours.\nJust send us your keywords and we\'ll tell you how much monthly clicks we can guarantee without paying for each click and waiting for SEO results.\nYou will get exclusive ownership of keywords you choose for flat fee (no Pay Per Click)...', 'unread', '2025-04-20 12:09:22', '2025-04-20 12:09:22'),
(30, 'Gary Charles', 'gary-charles@dominatingkeywords.com', '8054002077', NULL, NULL, 'Let me demonstrate to you how you can get guaranteed thousands of clicks to your website without SEO and without Pay Per Click.\nYou will start getting keyword targeted traffic in less than 48 hours.\nJust send us your keywords and we\'ll tell you how much monthly clicks we can guarantee without paying for each click and waiting for SEO results.\nYou will get exclusive ownership of keywords you choose for flat fee (no Pay Per Click)...', 'unread', '2025-05-20 07:55:26', '2025-05-20 07:55:26'),
(31, 'Sean Hicks', 'seanhicks@dominate-keywords.com', '8054002077', NULL, NULL, 'You can get more keyword targeted traffic to your website from Google without paying for each click and PPC bidding competition?\nWith our keyword targeted banner technology you can achieve top position in search engine results in less than 24 hours and get guaranteed monthly visitors to your website.\nYou will save months of waiting for SEO and thousands of dollars on PPC Bidding competition.\nIf you are interested, just let me know. Also, send me list of your keywords and I\'ll send you minimum traffic guarantee on each of them.', 'unread', '2025-06-24 08:13:51', '2025-06-24 08:13:51'),
(32, 'Sean Hicks', 'sean_hicks@dominate-keywords.com', '8054002077', NULL, NULL, 'You can get more keyword targeted traffic to your website from Google without paying for each click and PPC bidding competition?\nWith our keyword targeted banner technology you can achieve top position in search engine results in less than 24 hours and get guaranteed monthly visitors to your website.\nYou will save months of waiting for SEO and thousands of dollars on PPC Bidding competition.\nIf you are interested, just let me know. Also, send me list of your keywords and I\'ll send you minimum traffic guarantee on each of them.', 'unread', '2025-07-04 20:00:06', '2025-07-04 20:00:06'),
(33, 'Devnandan Chaudhary', 'devc1874@gmail.com', '9701114313', NULL, NULL, 'Do you have any demand for bike rider?', 'unread', '2025-08-20 09:21:19', '2025-08-20 09:21:19'),
(34, 'Gary Miller', 'gary_miller@dominatingkeywords.com', '8054002077', NULL, NULL, 'I am not offering SEO or Pay Per Click Advertising services.\nThis is something entirely different.\nLet me demonstrate how it works and you\'ll be pleasantly surprised by the results.\nSimply send us your desired keywords or fill online quote form on our website, and I\'ll send you minimum traffic amount that you can get on each of them with our unique technology without any Pay Per Click charges.', 'unread', '2025-09-20 09:01:39', '2025-09-20 09:01:39'),
(35, 'Arman Ali', 'aliarman1993@gmail.com', '+91 9650465318', NULL, NULL, 'Hello,\n I have 9+ years of experience in HR And recruitment domain, looking for Jobs in UAE.', 'unread', '2025-09-21 08:04:25', '2025-09-21 08:04:25'),
(36, 'Rick Stephens', 'rick.stephens@dominatebanners.com', '8054002077', NULL, NULL, 'We can place your website on top position in search engines without PPC.\nJust fill Online Quote form on our website or send us your keywords and you\'ll get minimum amount of traffic that our technology can guarantee.\nDo online demo on our website and see how your website will appear on top of search engines.', 'unread', '2025-10-10 10:07:01', '2025-10-10 10:07:01'),
(37, 'Eric Warren', 'eric.warren@jmailservice.com', '8054002077', NULL, NULL, 'We\'ve made getting online visibility simple and fast - your ads can go live within 24 hours.\nWhat\'s the best way to reach you for a quick walkthrough?', 'unread', '2025-11-04 09:29:17', '2025-11-04 09:29:17'),
(38, 'Samuel Everett', 'samuel.everett@jmailservice.com', '8054002077', NULL, NULL, 'Your competitors are already getting clicks from search - we can help you capture those same visitors, starting tomorrow.\nCan I give you a quick call?', 'unread', '2025-11-20 14:19:17', '2025-11-20 14:19:17'),
(39, 'David Turner', 'david.turner@jmailservice.com', '8054002077', NULL, NULL, 'We can position your brand above competitors within 24 hours - no waiting, no complicated setup.\nWould you like to see a sample?', 'unread', '2025-12-09 09:50:44', '2025-12-09 09:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `nationality` varchar(120) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `banner` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `content`, `image`, `nationality`, `order`, `is_default`, `status`, `created_at`, `updated_at`, `code`, `banner`) VALUES
(1, 'U.A.E.', NULL, 'flags/united-arab-emirates-640.png', NULL, 0, 0, 'published', '2024-04-04 07:31:11', '2024-04-11 22:27:52', NULL, NULL),
(2, 'Malaysia', NULL, 'flags/malaysia-640.png', NULL, 7, 0, 'published', '2024-04-04 07:33:45', '2024-04-11 22:27:37', NULL, NULL),
(3, 'Cyprus', '<p></p><div class=\"flex flex-grow flex-col max-w-full\"><div class=\"min-h-[20px] text-message flex flex-col items-start gap-3 whitespace-pre-wrap break-words [.text-message+&amp;]:mt-5 overflow-x-auto\"><div class=\"markdown prose w-full break-words dark:prose-invert light\"><p>Bua and Miracle offers comprehensive recruitment solutions to companies in Cyprus. Leveraging our expertise and extensive network, we identify top talent to meet diverse staffing needs. Our tailored approach ensures efficient hiring processes, seamless integration of candidates, and optimal workforce solutions, empowering businesses to thrive in the competitive Cyprus market.</p></div></div></div>', 'flags/cyprus-640.png', NULL, 3, 0, 'published', '2024-04-05 07:13:05', '2024-04-22 11:07:00', NULL, NULL),
(4, 'Oman', NULL, 'flags/oman-round-icon-640.png', NULL, 4, 0, 'published', '2024-04-05 07:17:02', '2024-04-11 22:27:10', NULL, NULL),
(5, 'Qatar', NULL, 'flags/qatar-640.png', NULL, 4, 0, 'published', '2024-04-05 07:19:24', '2024-04-11 22:26:49', NULL, NULL),
(6, 'Kuwait', NULL, 'flags/kuwait-640.png', NULL, 5, 0, 'published', '2024-04-05 07:20:57', '2024-04-11 22:26:27', NULL, NULL),
(7, 'Bahrain', NULL, 'flags/bahrain-640.png', NULL, 6, 0, 'published', '2024-04-05 07:21:33', '2024-04-05 07:26:23', NULL, NULL),
(8, 'Singapore', NULL, 'flags/singapore-round-icon-640.png', NULL, 8, 0, 'published', '2024-04-05 07:26:05', '2024-04-11 22:26:11', NULL, NULL),
(9, 'Japan', NULL, 'flags/japan-round-icon-640.png', NULL, 9, 0, 'published', '2024-04-05 07:56:39', '2024-04-11 22:25:46', NULL, NULL),
(10, 'Hungary', NULL, 'flags/hungary-640.png', NULL, 11, 0, 'published', '2024-04-05 07:57:12', '2024-04-05 07:57:12', NULL, NULL),
(11, 'Portugal', NULL, 'flags/portugal-round-icon-640.png', NULL, 12, 0, 'published', '2024-04-05 07:57:39', '2024-04-11 22:25:28', NULL, NULL),
(12, 'Malta', NULL, 'flags/malta-640.png', NULL, 13, 0, 'published', '2024-04-05 07:58:06', '2024-04-05 07:58:06', NULL, NULL),
(13, 'Greece', NULL, 'flags/greece-round-icon-640.png', NULL, 14, 0, 'published', '2024-04-05 07:58:30', '2024-04-05 07:58:30', NULL, NULL),
(14, 'Poland', NULL, 'flags/poland-640.png', NULL, 15, 0, 'published', '2024-04-05 07:58:51', '2024-04-05 07:58:51', NULL, NULL),
(15, 'Croatia', NULL, 'flags/croatia-640.png', NULL, 16, 0, 'published', '2024-04-05 10:07:34', '2024-04-05 10:07:34', NULL, NULL),
(16, 'Slovakia', NULL, 'flags/slovakia-round-icon-640.png', NULL, 17, 0, 'published', '2024-04-05 10:08:16', '2024-04-11 22:20:37', NULL, NULL),
(17, 'Canada', NULL, 'flags/canada-round-icon-640.png', '', 0, 0, 'published', '2024-04-11 11:55:42', '2024-04-11 22:19:37', '', NULL),
(18, 'Saudi Arabia', NULL, 'flags/saudi-arabia-640.png', '', 0, 0, 'published', '2024-04-11 12:01:52', '2024-04-11 22:16:47', '', NULL),
(19, 'South Korea', '', 'flags/korea-south-round-icon-640.png', NULL, 0, 0, 'published', '2024-04-22 10:14:25', '2024-04-22 10:14:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries_translations`
--

CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) NOT NULL,
  `countries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `nationality` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_1', '2024-03-23 02:53:12', '2024-03-23 02:53:12'),
(2, 'widget_total_2', '2024-03-23 02:53:12', '2024-03-23 02:53:12'),
(3, 'widget_total_3', '2024-03-23 02:53:13', '2024-03-23 02:53:13'),
(4, 'widget_total_4', '2024-03-23 02:53:13', '2024-03-23 02:53:13'),
(5, 'widget_total_themes', '2024-03-23 02:53:13', '2024-03-23 02:53:13'),
(6, 'widget_total_users', '2024-03-23 02:53:13', '2024-03-23 02:53:13'),
(7, 'widget_total_plugins', '2024-03-23 02:53:13', '2024-03-23 02:53:13'),
(8, 'widget_total_pages', '2024-03-23 02:53:13', '2024-03-23 02:53:13'),
(13, 'widget_posts_recent', '2024-03-23 02:53:15', '2024-03-23 02:53:15'),
(14, 'widget_audit_logs', '2024-03-23 02:53:15', '2024-03-23 02:53:15'),
(15, 'widget_ecommerce_report_general', '2024-03-23 02:53:15', '2024-03-23 02:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(12, 'An Ethical Recruitment', '<p>We prioritize fairness, transparency, and integrity in all our recruitment processes. We ensure that both employers and candidates are treated with respect, adhering to ethical standards and compliance with local and international regulations. Our commitment to ethical recruitment fosters long-term trust and successful partnerships.</p>', 5, 'published', '2024-04-04 08:07:17', '2025-03-29 09:08:43'),
(13, 'Zero Cost Service', '<p>We offer Zero Cost Service for businesses, ensuring recruitment solutions without any upfront charges. Our focus is on delivering top talent while keeping costs transparent and competitive, making your hiring process efficient and affordable.</p>', 5, 'published', '2024-04-04 08:07:46', '2025-03-29 09:10:04'),
(14, 'Enhancing Talent Sourcing', '<p>We focus on enhancing talent sourcing through innovative strategies and a vast global network. By leveraging advanced tools and industry insights, we connect businesses with the best candidates, ensuring a seamless and efficient recruitment process.</p>', 5, 'published', '2024-04-04 08:09:02', '2025-03-29 09:11:12'),
(15, 'Great Skilled Consultant', '<p>We provide access to highly skilled consultants with extensive industry experience. Our consultants offer expert guidance and tailored solutions, ensuring businesses find the right talent to meet their unique needs and achieve success.</p>', 5, 'published', '2024-04-04 08:09:25', '2025-03-29 09:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `faqs_translations`
--

CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) NOT NULL,
  `faqs_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `order`, `status`, `created_at`, `updated_at`, `description`) VALUES
(5, 'General', 0, 'published', '2024-04-04 08:05:48', '2024-04-04 08:37:41', 'General');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories_translations`
--

CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) NOT NULL,
  `faq_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Business Partners', 'Gallery', 0, 0, NULL, NULL, 'published', '2024-04-11 11:53:54', '2025-03-29 05:00:00'),
(2, 'Activities', 'Activities', 0, 0, NULL, NULL, 'published', '2024-04-14 11:20:36', '2025-03-29 05:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `galleries_translations`
--

CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) NOT NULL,
  `galleries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_meta`
--

INSERT INTO `gallery_meta` (`id`, `images`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(4, '[{\"img\":\"gallery\\/business-partners\\/nice-overseas-4.jpg\",\"description\":\"\"},{\"img\":\"gallery\\/business-partners\\/nice-overseas-5.jpg\",\"description\":\"\"},{\"img\":\"gallery\\/business-partners\\/nice-overseas-3-1.jpg\",\"description\":\"\"},{\"img\":\"gallery\\/business-partners\\/nice-overseas-3.jpeg\",\"description\":\"\"},{\"img\":\"gallery\\/business-partners\\/nice-overseas-2-1.jpg\",\"description\":\"\"},{\"img\":\"gallery\\/business-partners\\/nice-overseas-2.jpeg\",\"description\":\"\"},{\"img\":\"gallery\\/business-partners\\/nice-overseas-1.jpg\",\"description\":\"\"}]', 2, 'Botble\\Gallery\\Models\\Gallery', '2024-04-14 11:20:36', '2025-03-29 05:01:14'),
(31, NULL, 47, 'Botble\\Page\\Models\\Page', '2024-04-24 21:09:17', '2024-04-24 21:09:17'),
(49, NULL, 42, 'Botble\\Page\\Models\\Page', '2025-03-29 08:35:01', '2025-03-29 08:35:01'),
(69, NULL, 49, 'Botble\\Page\\Models\\Page', '2025-03-29 13:20:21', '2025-03-29 13:20:21'),
(71, NULL, 39, 'Botble\\Page\\Models\\Page', '2025-03-29 13:24:13', '2025-03-29 13:24:13'),
(72, NULL, 50, 'Botble\\Page\\Models\\Page', '2025-03-29 13:25:09', '2025-03-29 13:25:09'),
(73, NULL, 51, 'Botble\\Page\\Models\\Page', '2025-03-29 13:34:58', '2025-03-29 13:34:58'),
(74, NULL, 52, 'Botble\\Page\\Models\\Page', '2025-03-29 13:41:49', '2025-03-29 13:41:49'),
(75, NULL, 43, 'Botble\\Page\\Models\\Page', '2025-03-29 13:50:13', '2025-03-29 13:50:13'),
(76, NULL, 44, 'Botble\\Page\\Models\\Page', '2025-03-29 13:52:54', '2025-03-29 13:52:54'),
(77, NULL, 53, 'Botble\\Page\\Models\\Page', '2025-03-29 14:03:06', '2025-03-29 14:03:06'),
(78, NULL, 54, 'Botble\\Page\\Models\\Page', '2025-03-29 14:04:07', '2025-03-29 14:04:07'),
(79, NULL, 55, 'Botble\\Page\\Models\\Page', '2025-03-29 14:05:08', '2025-03-29 14:05:08'),
(81, NULL, 56, 'Botble\\Page\\Models\\Page', '2025-03-29 14:12:09', '2025-03-29 14:12:09'),
(84, NULL, 58, 'Botble\\Page\\Models\\Page', '2025-03-29 14:19:14', '2025-03-29 14:19:14'),
(85, NULL, 59, 'Botble\\Page\\Models\\Page', '2025-03-29 14:22:14', '2025-03-29 14:22:14'),
(89, NULL, 46, 'Botble\\Page\\Models\\Page', '2025-04-06 16:33:03', '2025-04-06 16:33:03'),
(94, NULL, 60, 'Botble\\Page\\Models\\Page', '2025-04-06 23:10:03', '2025-04-06 23:10:03'),
(98, NULL, 1, 'Botble\\Page\\Models\\Page', '2025-06-11 22:57:31', '2025-06-11 22:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta_translations`
--

CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) NOT NULL,
  `gallery_meta_id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `image` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_accounts`
--

CREATE TABLE `jb_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(120) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'job-seeker',
  `credits` int(10) UNSIGNED DEFAULT NULL,
  `resume` varchar(200) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `bio` mediumtext DEFAULT NULL,
  `is_public_profile` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hide_cv` tinyint(1) NOT NULL DEFAULT 0,
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_for_hiring` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cover_letter` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_activity_logs`
--

CREATE TABLE `jb_account_activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `reference_url` varchar(255) DEFAULT NULL,
  `reference_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_educations`
--

CREATE TABLE `jb_account_educations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school` varchar(255) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `specialized` varchar(255) DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_experiences`
--

CREATE TABLE `jb_account_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_favorite_skills`
--

CREATE TABLE `jb_account_favorite_skills` (
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_favorite_tags`
--

CREATE TABLE `jb_account_favorite_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_packages`
--

CREATE TABLE `jb_account_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_password_resets`
--

CREATE TABLE `jb_account_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_analytics`
--

CREATE TABLE `jb_analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(10) DEFAULT NULL,
  `country_full` varchar(50) DEFAULT NULL,
  `referer` varchar(300) DEFAULT NULL,
  `ip_address` varchar(300) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_analytics`
--

INSERT INTO `jb_analytics` (`id`, `job_id`, `country`, `country_full`, `referer`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs', '162.241.85.139', '2024-04-16 03:57:57', '2024-04-16 03:57:57'),
(2, 9, 'N/A', 'Unknown', 'https://miraclehrhub.com/companies/red-panda', '162.241.85.139', '2024-04-16 04:28:06', '2024-04-16 04:28:06'),
(3, 6, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs/domestic-worker', '162.241.85.139', '2024-04-16 04:28:19', '2024-04-16 04:28:19'),
(4, 9, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs', '162.241.85.139', '2024-04-16 04:34:34', '2024-04-16 04:34:34'),
(6, 9, 'N/A', 'Unknown', 'https://miraclehrhub.com/companies/red-panda', '162.241.85.139', '2024-04-16 20:51:46', '2024-04-16 20:51:46'),
(7, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs?layout=grid', '162.241.85.139', '2024-04-16 20:52:51', '2024-04-16 20:52:51'),
(8, 5, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs?layout=grid', '162.241.85.139', '2024-04-16 21:55:54', '2024-04-16 21:55:54'),
(9, 7, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs/waiterwaitress', '162.241.85.139', '2024-04-16 21:56:08', '2024-04-16 21:56:08'),
(10, 15, 'N/A', 'Unknown', 'http://miraclehrhub.com/jobs?layout=grid', '162.241.85.139', '2024-04-17 03:17:41', '2024-04-17 03:17:41'),
(11, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs?layout=grid', '162.241.85.139', '2024-04-17 03:19:23', '2024-04-17 03:19:23'),
(12, 13, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs?layout=grid', '162.241.85.139', '2024-04-17 03:19:42', '2024-04-17 03:19:42'),
(13, 9, 'N/A', 'Unknown', 'https://miraclehrhub.com/countries/cyprus', '162.241.85.139', '2024-04-20 20:52:18', '2024-04-20 20:52:18'),
(14, 13, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '162.241.85.139', '2024-04-20 20:55:38', '2024-04-20 20:55:38'),
(15, 13, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs', '162.241.85.139', '2024-04-20 21:16:49', '2024-04-20 21:16:49'),
(16, 12, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs', '162.241.85.139', '2024-04-20 21:17:01', '2024-04-20 21:17:01'),
(17, 11, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs', '162.241.85.139', '2024-04-20 21:17:15', '2024-04-20 21:17:15'),
(18, 10, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs', '162.241.85.139', '2024-04-20 21:17:20', '2024-04-20 21:17:20'),
(19, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '162.241.85.139', '2024-04-21 22:10:00', '2024-04-21 22:10:00'),
(20, 9, 'N/A', 'Unknown', 'https://miraclehrhub.com/job-categories/domestic-worker', '162.241.85.139', '2024-04-21 22:28:54', '2024-04-21 22:28:54'),
(21, 9, 'N/A', 'Unknown', 'https://miraclehrhub.com/countries/cyprus', '162.241.85.139', '2024-04-22 00:30:59', '2024-04-22 00:30:59'),
(22, 5, 'N/A', 'Unknown', 'https://miraclehrhub.com/companies/ansot', '162.241.85.139', '2024-04-22 00:32:01', '2024-04-22 00:32:01'),
(23, 7, 'N/A', 'Unknown', 'https://miraclehrhub.com/countries/cyprus', '162.241.85.139', '2024-04-22 00:33:11', '2024-04-22 00:33:11'),
(24, 11, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '162.241.85.139', '2024-04-22 03:27:09', '2024-04-22 03:27:09'),
(25, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '162.241.85.139', '2024-04-22 10:39:58', '2024-04-22 10:39:58'),
(26, 11, 'N/A', 'Unknown', 'https://miraclehrhub.com/countries/u.a.e.', '162.241.85.139', '2024-04-22 11:17:23', '2024-04-22 11:17:23'),
(27, 12, 'N/A', 'Unknown', 'https://www.miraclehrhub.com/', '23.94.181.5', '2024-04-22 22:45:42', '2024-04-22 22:45:42'),
(28, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 05:40:49', '2024-04-25 05:40:49'),
(29, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 05:41:00', '2024-04-25 05:41:00'),
(30, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 05:41:11', '2024-04-25 05:41:11'),
(31, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 05:48:33', '2024-04-25 05:48:33'),
(32, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 05:48:47', '2024-04-25 05:48:47'),
(33, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 05:49:00', '2024-04-25 05:49:00'),
(34, 5, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:12:42', '2024-04-25 06:12:42'),
(35, 6, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:12:51', '2024-04-25 06:12:51'),
(36, 4, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:13:00', '2024-04-25 06:13:00'),
(38, 1, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:13:27', '2024-04-25 06:13:27'),
(39, 7, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:13:48', '2024-04-25 06:13:48'),
(40, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:14:11', '2024-04-25 06:14:11'),
(41, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:14:22', '2024-04-25 06:14:22'),
(42, 9, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:15:05', '2024-04-25 06:15:05'),
(43, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:57:15', '2024-04-25 06:57:15'),
(44, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:57:19', '2024-04-25 06:57:19'),
(45, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:57:19', '2024-04-25 06:57:19'),
(46, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:57:20', '2024-04-25 06:57:20'),
(47, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:57:21', '2024-04-25 06:57:21'),
(48, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:57:21', '2024-04-25 06:57:21'),
(49, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:58:11', '2024-04-25 06:58:11'),
(50, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:58:11', '2024-04-25 06:58:11'),
(51, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:58:13', '2024-04-25 06:58:13'),
(52, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:58:13', '2024-04-25 06:58:13'),
(53, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:58:14', '2024-04-25 06:58:14'),
(54, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-25 06:58:14', '2024-04-25 06:58:14'),
(55, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '23.94.181.5', '2024-04-26 19:01:51', '2024-04-26 19:01:51'),
(56, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-28 05:00:46', '2024-04-28 05:00:46'),
(57, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-28 08:00:20', '2024-04-28 08:00:20'),
(58, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-28 08:56:35', '2024-04-28 08:56:35'),
(59, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-28 10:02:40', '2024-04-28 10:02:40'),
(60, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-28 15:42:24', '2024-04-28 15:42:24'),
(61, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-28 21:50:34', '2024-04-28 21:50:34'),
(62, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-30 20:47:50', '2024-04-30 20:47:50'),
(63, 7, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-04-30 21:20:03', '2024-04-30 21:20:03'),
(64, 4, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-01 02:29:04', '2024-05-01 02:29:04'),
(65, 5, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-01 04:50:40', '2024-05-01 04:50:40'),
(66, 9, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-01 05:24:31', '2024-05-01 05:24:31'),
(67, 6, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-01 07:25:21', '2024-05-01 07:25:21'),
(69, 1, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-01 09:57:13', '2024-05-01 09:57:13'),
(70, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-01 11:36:50', '2024-05-01 11:36:50'),
(71, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '23.94.181.5', '2024-05-05 04:51:04', '2024-05-05 04:51:04'),
(72, 13, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '23.94.181.5', '2024-05-05 04:51:17', '2024-05-05 04:51:17'),
(73, 14, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs?layout=grid', '23.94.181.5', '2024-05-05 04:57:15', '2024-05-05 04:57:15'),
(74, 11, 'N/A', 'Unknown', 'https://miraclehrhub.com/countries/u.a.e.', '23.94.181.5', '2024-05-05 05:00:47', '2024-05-05 05:00:47'),
(75, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/jobs?layout=grid', '23.94.181.5', '2024-05-05 08:40:42', '2024-05-05 08:40:42'),
(76, 15, 'N/A', 'Unknown', 'https://miraclehrhub.com/', '23.94.181.5', '2024-05-05 08:56:48', '2024-05-05 08:56:48'),
(77, 15, 'N/A', 'Unknown', 'https://www.miraclehrhub.com/', '23.94.181.5', '2024-05-05 08:57:23', '2024-05-05 08:57:23'),
(78, 14, 'N/A', 'Unknown', 'https://www.miraclehrhub.com/', '23.94.181.5', '2024-05-05 08:59:28', '2024-05-05 08:59:28'),
(79, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-05 16:30:19', '2024-05-05 16:30:19'),
(80, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-05 16:30:23', '2024-05-05 16:30:23'),
(81, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 12:19:09', '2024-05-06 12:19:09'),
(82, 6, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 12:25:28', '2024-05-06 12:25:28'),
(83, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 13:23:45', '2024-05-06 13:23:45'),
(84, 1, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 13:49:38', '2024-05-06 13:49:38'),
(85, 9, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 14:57:10', '2024-05-06 14:57:10'),
(86, 5, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 15:45:13', '2024-05-06 15:45:13'),
(87, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 17:35:38', '2024-05-06 17:35:38'),
(88, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 17:57:24', '2024-05-06 17:57:24'),
(89, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 18:18:00', '2024-05-06 18:18:00'),
(90, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 19:02:29', '2024-05-06 19:02:29'),
(91, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-06 20:32:21', '2024-05-06 20:32:21'),
(93, 4, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-07 04:09:38', '2024-05-07 04:09:38'),
(94, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-07 15:04:25', '2024-05-07 15:04:25'),
(95, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-08 00:58:05', '2024-05-08 00:58:05'),
(96, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-08 21:30:56', '2024-05-08 21:30:56'),
(97, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-10 20:07:26', '2024-05-10 20:07:26'),
(98, 5, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-10 21:48:05', '2024-05-10 21:48:05'),
(99, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 02:48:57', '2024-05-11 02:48:57'),
(100, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 06:09:35', '2024-05-11 06:09:35'),
(101, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 07:04:46', '2024-05-11 07:04:46'),
(102, 7, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 07:26:59', '2024-05-11 07:26:59'),
(103, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 12:45:48', '2024-05-11 12:45:48'),
(104, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 14:28:56', '2024-05-11 14:28:56'),
(105, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 16:28:15', '2024-05-11 16:28:15'),
(106, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 18:29:31', '2024-05-11 18:29:31'),
(107, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 19:22:13', '2024-05-11 19:22:13'),
(108, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 21:16:18', '2024-05-11 21:16:18'),
(109, 1, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 21:33:41', '2024-05-11 21:33:41'),
(110, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-11 21:49:27', '2024-05-11 21:49:27'),
(111, 6, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-12 05:07:50', '2024-05-12 05:07:50'),
(112, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-12 09:31:24', '2024-05-12 09:31:24'),
(113, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-13 00:34:31', '2024-05-13 00:34:31'),
(114, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-14 05:13:22', '2024-05-14 05:13:22'),
(115, 6, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-14 06:27:34', '2024-05-14 06:27:34'),
(116, 1, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-14 07:20:27', '2024-05-14 07:20:27'),
(117, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-14 10:30:42', '2024-05-14 10:30:42'),
(118, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-14 10:47:49', '2024-05-14 10:47:49'),
(119, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-14 22:58:31', '2024-05-14 22:58:31'),
(120, 5, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-15 00:40:55', '2024-05-15 00:40:55'),
(121, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-15 08:19:23', '2024-05-15 08:19:23'),
(122, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-15 09:50:55', '2024-05-15 09:50:55'),
(123, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-15 14:07:01', '2024-05-15 14:07:01'),
(124, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-16 07:46:43', '2024-05-16 07:46:43'),
(125, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-16 14:22:53', '2024-05-16 14:22:53'),
(126, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-21 07:55:54', '2024-05-21 07:55:54'),
(127, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-22 17:17:04', '2024-05-22 17:17:04'),
(128, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-23 05:50:39', '2024-05-23 05:50:39'),
(129, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 07:20:14', '2024-05-24 07:20:14'),
(130, 3, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 09:30:42', '2024-05-24 09:30:42'),
(131, 14, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 11:42:58', '2024-05-24 11:42:58'),
(132, 13, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 17:52:17', '2024-05-24 17:52:17'),
(133, 7, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 18:03:29', '2024-05-24 18:03:29'),
(134, 10, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 20:42:49', '2024-05-24 20:42:49'),
(135, 2, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 21:51:29', '2024-05-24 21:51:29'),
(136, 15, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 23:36:41', '2024-05-24 23:36:41'),
(137, 12, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-24 23:46:22', '2024-05-24 23:46:22'),
(138, 11, 'N/A', 'Unknown', NULL, '23.94.181.5', '2024-05-25 00:36:42', '2024-05-25 00:36:42'),
(139, 16, 'N/A', 'Unknown', 'https://nicenp.appolooverseas.com/', '23.94.181.5', '2025-03-29 10:22:16', '2025-03-29 10:22:16'),
(140, 16, 'N/A', 'Unknown', 'https://nicenp.appolooverseas.com/', '23.94.181.5', '2025-03-29 10:22:51', '2025-03-29 10:22:51'),
(141, 17, 'N/A', 'Unknown', 'https://nicenp.appolooverseas.com/', '23.94.181.5', '2025-03-29 10:52:12', '2025-03-29 10:52:12'),
(142, 18, 'N/A', 'Unknown', 'https://nicenp.appolooverseas.com/', '23.94.181.5', '2025-03-29 11:06:33', '2025-03-29 11:06:33'),
(143, 19, 'N/A', 'Unknown', 'https://nicenp.appolooverseas.com/', '23.94.181.5', '2025-03-29 11:19:13', '2025-03-29 11:19:13'),
(144, 16, 'N/A', 'Unknown', NULL, '23.94.181.5', '2025-03-29 11:31:40', '2025-03-29 11:31:40'),
(145, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-03-31 00:10:58', '2025-03-31 00:10:58'),
(146, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 00:17:44', '2025-03-31 00:17:44'),
(147, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 00:17:51', '2025-03-31 00:17:51'),
(148, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 00:17:53', '2025-03-31 00:17:53'),
(149, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 00:18:00', '2025-03-31 00:18:00'),
(150, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-03-31 00:25:44', '2025-03-31 00:25:44'),
(151, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 06:44:17', '2025-03-31 06:44:17'),
(152, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 06:44:22', '2025-03-31 06:44:22'),
(153, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 06:44:28', '2025-03-31 06:44:28'),
(154, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 06:44:30', '2025-03-31 06:44:30'),
(155, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-03-31 16:44:43', '2025-03-31 16:44:43'),
(156, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-03-31 17:12:14', '2025-03-31 17:12:14'),
(157, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-03-31 17:13:25', '2025-03-31 17:13:25'),
(158, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-03-31 17:13:39', '2025-03-31 17:13:39'),
(159, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 17:19:17', '2025-03-31 17:19:17'),
(160, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 17:19:18', '2025-03-31 17:19:18'),
(161, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 17:19:51', '2025-03-31 17:19:51'),
(162, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-03-31 17:19:53', '2025-03-31 17:19:53'),
(163, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-03-31 17:23:58', '2025-03-31 17:23:58'),
(164, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-03-31 17:24:54', '2025-03-31 17:24:54'),
(165, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-02 05:37:17', '2025-04-02 05:37:17'),
(166, 18, 'N/A', 'Unknown', 'https://google.com', '192.110.160.66', '2025-04-02 07:24:31', '2025-04-02 07:24:31'),
(167, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-02 17:11:13', '2025-04-02 17:11:13'),
(168, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-02 20:38:12', '2025-04-02 20:38:12'),
(169, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 02:58:10', '2025-04-03 02:58:10'),
(170, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 03:38:36', '2025-04-03 03:38:36'),
(171, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 06:32:39', '2025-04-03 06:32:39'),
(172, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 08:20:50', '2025-04-03 08:20:50'),
(173, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 09:51:19', '2025-04-03 09:51:19'),
(174, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 11:21:08', '2025-04-03 11:21:08'),
(175, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 11:21:09', '2025-04-03 11:21:09'),
(176, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 11:29:26', '2025-04-03 11:29:26'),
(177, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 18:06:21', '2025-04-03 18:06:21'),
(178, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-03 19:07:21', '2025-04-03 19:07:21'),
(179, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 03:12:14', '2025-04-04 03:12:14'),
(180, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 05:37:48', '2025-04-04 05:37:48'),
(181, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 08:34:42', '2025-04-04 08:34:42'),
(182, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '192.110.160.66', '2025-04-04 09:15:20', '2025-04-04 09:15:20'),
(183, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 11:28:29', '2025-04-04 11:28:29'),
(184, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 12:59:29', '2025-04-04 12:59:29'),
(185, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 13:35:31', '2025-04-04 13:35:31'),
(186, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 17:06:32', '2025-04-04 17:06:32'),
(187, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 18:16:20', '2025-04-04 18:16:20'),
(188, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 18:39:33', '2025-04-04 18:39:33'),
(189, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '192.110.160.66', '2025-04-04 20:32:55', '2025-04-04 20:32:55'),
(190, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '192.110.160.66', '2025-04-04 21:57:44', '2025-04-04 21:57:44'),
(191, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-04 23:08:50', '2025-04-04 23:08:50'),
(192, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 00:27:07', '2025-04-05 00:27:07'),
(193, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 00:39:52', '2025-04-05 00:39:52'),
(194, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 02:38:48', '2025-04-05 02:38:48'),
(195, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 03:05:56', '2025-04-05 03:05:56'),
(196, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 04:50:55', '2025-04-05 04:50:55'),
(197, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 04:52:04', '2025-04-05 04:52:04'),
(198, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 04:53:04', '2025-04-05 04:53:04'),
(199, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 04:54:09', '2025-04-05 04:54:09'),
(200, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 07:32:02', '2025-04-05 07:32:02'),
(201, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 09:02:00', '2025-04-05 09:02:00'),
(202, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '192.110.160.66', '2025-04-05 10:32:49', '2025-04-05 10:32:49'),
(203, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 14:57:17', '2025-04-05 14:57:17'),
(204, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 16:27:14', '2025-04-05 16:27:14'),
(205, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 17:59:16', '2025-04-05 17:59:16'),
(206, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-05 23:32:24', '2025-04-05 23:32:24'),
(207, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 01:04:23', '2025-04-06 01:04:23'),
(208, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 01:15:33', '2025-04-06 01:15:33'),
(209, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 02:37:51', '2025-04-06 02:37:51'),
(210, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 07:16:45', '2025-04-06 07:16:45'),
(211, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 08:48:45', '2025-04-06 08:48:45'),
(212, 17, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs', '192.110.160.66', '2025-04-06 15:03:53', '2025-04-06 15:03:53'),
(213, 19, 'N/A', 'Unknown', 'http://niceoverseaspl.com/', '192.110.160.66', '2025-04-06 15:05:52', '2025-04-06 15:05:52'),
(214, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 15:19:58', '2025-04-06 15:19:58'),
(215, 18, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 16:33:33', '2025-04-06 16:33:33'),
(216, 16, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 16:33:44', '2025-04-06 16:33:44'),
(217, 17, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 16:33:49', '2025-04-06 16:33:49'),
(218, 19, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 16:33:55', '2025-04-06 16:33:55'),
(219, 18, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 16:34:04', '2025-04-06 16:34:04'),
(220, 19, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 16:34:15', '2025-04-06 16:34:15'),
(221, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 16:49:58', '2025-04-06 16:49:58'),
(222, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 18:19:58', '2025-04-06 18:19:58'),
(223, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 20:01:05', '2025-04-06 20:01:05'),
(224, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 20:01:08', '2025-04-06 20:01:08'),
(225, 19, 'N/A', 'Unknown', 'http://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-04-06 22:17:53', '2025-04-06 22:17:53'),
(226, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-04-06 22:19:44', '2025-04-06 22:19:44'),
(227, 19, 'N/A', 'Unknown', 'http://niceoverseaspl.com/', '192.110.160.66', '2025-04-06 22:25:36', '2025-04-06 22:25:36'),
(228, 19, 'N/A', 'Unknown', 'http://niceoverseaspl.com/', '192.110.160.66', '2025-04-06 22:27:40', '2025-04-06 22:27:40'),
(229, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-06 22:54:13', '2025-04-06 22:54:13'),
(230, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 00:24:15', '2025-04-07 00:24:15'),
(231, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 02:39:49', '2025-04-07 02:39:49'),
(232, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 07:00:32', '2025-04-07 07:00:32'),
(233, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 08:37:49', '2025-04-07 08:37:49'),
(234, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 11:39:49', '2025-04-07 11:39:49'),
(235, 16, 'N/A', 'Unknown', 'https://www.google.com/', '192.110.160.66', '2025-04-07 12:01:44', '2025-04-07 12:01:44'),
(236, 19, 'N/A', 'Unknown', 'https://www.google.com/', '192.110.160.66', '2025-04-07 14:11:32', '2025-04-07 14:11:32'),
(237, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 15:11:47', '2025-04-07 15:11:47'),
(238, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 17:46:52', '2025-04-07 17:46:52'),
(239, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 20:42:51', '2025-04-07 20:42:51'),
(240, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-07 23:37:49', '2025-04-07 23:37:49'),
(241, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 01:00:07', '2025-04-08 01:00:07'),
(242, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 02:22:19', '2025-04-08 02:22:19'),
(243, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 07:20:12', '2025-04-08 07:20:12'),
(244, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 08:50:14', '2025-04-08 08:50:14'),
(245, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 11:22:19', '2025-04-08 11:22:19'),
(246, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 15:15:18', '2025-04-08 15:15:18'),
(247, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 17:22:19', '2025-04-08 17:22:19'),
(248, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-08 23:06:39', '2025-04-08 23:06:39'),
(249, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 00:37:37', '2025-04-09 00:37:37'),
(250, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 02:22:19', '2025-04-09 02:22:19'),
(251, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 07:06:48', '2025-04-09 07:06:48'),
(252, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 08:37:50', '2025-04-09 08:37:50'),
(253, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 15:31:58', '2025-04-09 15:31:58'),
(254, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 17:02:00', '2025-04-09 17:02:00'),
(255, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 18:32:01', '2025-04-09 18:32:01'),
(256, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-09 18:38:12', '2025-04-09 18:38:12'),
(257, 17, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-09 23:05:15', '2025-04-09 23:05:15'),
(258, 18, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-10 00:35:15', '2025-04-10 00:35:15'),
(259, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=recruitment-procedures', '114.119.149.92', '2025-04-10 00:51:24', '2025-04-10 00:51:24'),
(260, 19, 'N/A', 'Unknown', NULL, '66.249.77.163', '2025-04-10 02:23:18', '2025-04-10 02:23:18'),
(261, 17, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-10 07:28:25', '2025-04-10 07:28:25'),
(262, 18, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-10 08:58:22', '2025-04-10 08:58:22'),
(263, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/countries/japan', '106.179.236.117', '2025-04-10 10:40:32', '2025-04-10 10:40:32'),
(264, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '106.179.236.117', '2025-04-10 10:40:42', '2025-04-10 10:40:42'),
(265, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=recruitment-procedures', '114.119.153.104', '2025-04-10 11:59:28', '2025-04-10 11:59:28'),
(266, 17, 'N/A', 'Unknown', NULL, '106.179.236.117', '2025-04-10 14:05:46', '2025-04-10 14:05:46'),
(267, 17, 'N/A', 'Unknown', NULL, '66.249.77.162', '2025-04-10 15:04:42', '2025-04-10 15:04:42'),
(268, 18, 'N/A', 'Unknown', NULL, '66.249.77.163', '2025-04-10 16:39:42', '2025-04-10 16:39:42'),
(269, 19, 'N/A', 'Unknown', NULL, '66.249.77.162', '2025-04-10 18:09:41', '2025-04-10 18:09:41'),
(270, 17, 'N/A', 'Unknown', NULL, '66.249.77.163', '2025-04-10 23:01:52', '2025-04-10 23:01:52'),
(271, 18, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-11 00:31:52', '2025-04-11 00:31:52'),
(272, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '114.119.152.5', '2025-04-11 01:31:37', '2025-04-11 01:31:37'),
(273, 19, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-11 02:23:21', '2025-04-11 02:23:21'),
(274, 17, 'N/A', 'Unknown', NULL, '51.222.253.11', '2025-04-11 04:20:06', '2025-04-11 04:20:06'),
(275, 19, 'N/A', 'Unknown', NULL, '51.222.253.1', '2025-04-11 05:04:41', '2025-04-11 05:04:41'),
(276, 18, 'N/A', 'Unknown', NULL, '85.208.96.204', '2025-04-11 06:08:48', '2025-04-11 06:08:48'),
(277, 16, 'N/A', 'Unknown', NULL, '51.222.253.17', '2025-04-11 06:58:00', '2025-04-11 06:58:00'),
(278, 17, 'N/A', 'Unknown', NULL, '66.249.77.163', '2025-04-11 06:59:57', '2025-04-11 06:59:57'),
(279, 19, 'N/A', 'Unknown', NULL, '85.208.96.203', '2025-04-11 07:31:21', '2025-04-11 07:31:21'),
(280, 18, 'N/A', 'Unknown', NULL, '66.249.77.163', '2025-04-11 08:29:57', '2025-04-11 08:29:57'),
(281, 18, 'N/A', 'Unknown', NULL, '51.222.253.13', '2025-04-11 09:30:04', '2025-04-11 09:30:04'),
(282, 16, 'N/A', 'Unknown', NULL, '85.208.96.207', '2025-04-11 10:28:40', '2025-04-11 10:28:40'),
(283, 17, 'N/A', 'Unknown', NULL, '185.191.171.17', '2025-04-11 11:28:39', '2025-04-11 11:28:39'),
(284, 17, 'N/A', 'Unknown', NULL, '66.249.77.162', '2025-04-11 15:08:04', '2025-04-11 15:08:04'),
(285, 18, 'N/A', 'Unknown', NULL, '66.249.77.163', '2025-04-11 16:38:03', '2025-04-11 16:38:03'),
(286, 16, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-11 18:09:03', '2025-04-11 18:09:03'),
(287, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs?layout=grid', '114.119.150.6', '2025-04-11 20:49:59', '2025-04-11 20:49:59'),
(288, 17, 'N/A', 'Unknown', NULL, '66.249.77.162', '2025-04-11 23:07:07', '2025-04-11 23:07:07'),
(289, 16, 'N/A', 'Unknown', NULL, '40.77.167.0', '2025-04-12 00:08:49', '2025-04-12 00:08:49'),
(290, 18, 'N/A', 'Unknown', NULL, '66.249.77.162', '2025-04-12 00:37:07', '2025-04-12 00:37:07'),
(291, 16, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-12 02:22:20', '2025-04-12 02:22:20'),
(292, 17, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-12 07:10:21', '2025-04-12 07:10:21'),
(293, 18, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-12 08:40:21', '2025-04-12 08:40:21'),
(294, 16, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-12 13:05:13', '2025-04-12 13:05:13'),
(295, 17, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-12 14:35:11', '2025-04-12 14:35:11'),
(296, 18, 'N/A', 'Unknown', NULL, '66.249.77.161', '2025-04-12 17:22:19', '2025-04-12 17:22:19'),
(297, 16, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-12 20:55:14', '2025-04-12 20:55:14'),
(298, 17, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-12 23:22:22', '2025-04-12 23:22:22'),
(299, 18, 'N/A', 'Unknown', NULL, '66.249.74.130', '2025-04-13 02:23:22', '2025-04-13 02:23:22'),
(300, 19, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-13 06:58:20', '2025-04-13 06:58:20'),
(301, 17, 'N/A', 'Unknown', NULL, '66.249.74.131', '2025-04-13 08:28:20', '2025-04-13 08:28:20'),
(302, 19, 'N/A', 'Unknown', NULL, '51.222.253.2', '2025-04-13 10:12:31', '2025-04-13 10:12:31'),
(303, 18, 'N/A', 'Unknown', NULL, '51.222.253.12', '2025-04-13 10:26:00', '2025-04-13 10:26:00'),
(304, 17, 'N/A', 'Unknown', NULL, '51.222.253.2', '2025-04-13 10:37:15', '2025-04-13 10:37:15'),
(305, 16, 'N/A', 'Unknown', NULL, '51.222.253.4', '2025-04-13 10:50:10', '2025-04-13 10:50:10'),
(306, 18, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-13 11:24:19', '2025-04-13 11:24:19'),
(307, 16, 'N/A', 'Unknown', NULL, '66.249.74.130', '2025-04-13 17:07:35', '2025-04-13 17:07:35'),
(308, 17, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-13 18:38:35', '2025-04-13 18:38:35'),
(309, 18, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-13 19:26:41', '2025-04-13 19:26:41'),
(310, 19, 'N/A', 'Unknown', NULL, '66.249.74.131', '2025-04-13 21:52:22', '2025-04-13 21:52:22'),
(311, 16, 'N/A', 'Unknown', NULL, '52.167.144.163', '2025-04-14 00:42:47', '2025-04-14 00:42:47'),
(312, 17, 'N/A', 'Unknown', NULL, '66.249.74.130', '2025-04-14 03:04:55', '2025-04-14 03:04:55'),
(313, 18, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-14 03:53:55', '2025-04-14 03:53:55'),
(314, 16, 'N/A', 'Unknown', NULL, '66.249.74.131', '2025-04-14 04:38:55', '2025-04-14 04:38:55'),
(315, 17, 'N/A', 'Unknown', NULL, '66.249.74.131', '2025-04-14 10:08:57', '2025-04-14 10:08:57'),
(316, 18, 'N/A', 'Unknown', NULL, '66.249.74.129', '2025-04-14 11:39:58', '2025-04-14 11:39:58'),
(317, 16, 'N/A', 'Unknown', NULL, '66.249.74.130', '2025-04-14 13:09:58', '2025-04-14 13:09:58'),
(318, 17, 'N/A', 'Unknown', NULL, '66.249.74.130', '2025-04-14 18:08:06', '2025-04-14 18:08:06'),
(319, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-14 19:42:08', '2025-04-14 19:42:08'),
(320, 16, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-14 21:12:06', '2025-04-14 21:12:06'),
(321, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-15 04:03:34', '2025-04-15 04:03:34'),
(322, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-15 05:33:32', '2025-04-15 05:33:32'),
(323, 17, 'N/A', 'Unknown', NULL, '52.167.144.189', '2025-04-15 06:26:46', '2025-04-15 06:26:46'),
(324, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=isocertification', '114.119.152.5', '2025-04-15 09:41:39', '2025-04-15 09:41:39'),
(325, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-15 11:57:40', '2025-04-15 11:57:40'),
(326, 18, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-15 13:32:38', '2025-04-15 13:32:38'),
(327, 19, 'N/A', 'Unknown', NULL, '52.167.144.179', '2025-04-15 14:47:38', '2025-04-15 14:47:38'),
(328, 16, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-15 15:05:41', '2025-04-15 15:05:41'),
(329, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=isocertification', '114.119.157.36', '2025-04-15 17:41:22', '2025-04-15 17:41:22'),
(330, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-15 20:11:53', '2025-04-15 20:11:53'),
(331, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-15 21:42:52', '2025-04-15 21:42:52'),
(332, 16, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-15 23:33:32', '2025-04-15 23:33:32'),
(333, 17, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-16 04:05:01', '2025-04-16 04:05:01'),
(334, 17, 'N/A', 'Unknown', NULL, '40.77.167.235', '2025-04-16 05:07:36', '2025-04-16 05:07:36'),
(335, 18, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-16 07:05:01', '2025-04-16 07:05:01'),
(336, 16, 'N/A', 'Unknown', NULL, '52.167.144.162', '2025-04-16 09:39:22', '2025-04-16 09:39:22'),
(337, 17, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-16 10:07:03', '2025-04-16 10:07:03'),
(338, 17, 'N/A', 'Unknown', NULL, '51.222.253.1', '2025-04-16 10:48:21', '2025-04-16 10:48:21'),
(339, 19, 'N/A', 'Unknown', NULL, '51.222.253.7', '2025-04-16 12:13:21', '2025-04-16 12:13:21'),
(340, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-16 13:56:32', '2025-04-16 13:56:32'),
(341, 16, 'N/A', 'Unknown', NULL, '51.222.253.10', '2025-04-16 15:37:30', '2025-04-16 15:37:30'),
(342, 17, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-16 16:50:34', '2025-04-16 16:50:34'),
(343, 18, 'N/A', 'Unknown', NULL, '51.222.253.13', '2025-04-16 19:08:41', '2025-04-16 19:08:41'),
(344, 17, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-17 01:31:09', '2025-04-17 01:31:09'),
(345, 17, 'N/A', 'Unknown', NULL, '167.99.39.27', '2025-04-17 02:50:37', '2025-04-17 02:50:37'),
(346, 18, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-17 03:01:09', '2025-04-17 03:01:09'),
(347, 17, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-17 10:00:57', '2025-04-17 10:00:57'),
(348, 17, 'N/A', 'Unknown', NULL, '52.167.144.233', '2025-04-17 10:12:57', '2025-04-17 10:12:57'),
(349, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-17 10:45:56', '2025-04-17 10:45:56'),
(350, 16, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-17 11:30:56', '2025-04-17 11:30:56'),
(351, 19, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-17 13:03:58', '2025-04-17 13:03:58'),
(352, 18, 'N/A', 'Unknown', NULL, '51.222.253.4', '2025-04-17 17:11:46', '2025-04-17 17:11:46'),
(353, 19, 'N/A', 'Unknown', NULL, '51.222.253.13', '2025-04-17 17:14:07', '2025-04-17 17:14:07'),
(354, 17, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-17 18:08:08', '2025-04-17 18:08:08'),
(355, 17, 'N/A', 'Unknown', NULL, '51.222.253.19', '2025-04-17 18:08:20', '2025-04-17 18:08:20'),
(356, 16, 'N/A', 'Unknown', NULL, '51.222.253.16', '2025-04-17 18:13:36', '2025-04-17 18:13:36'),
(357, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-17 18:53:08', '2025-04-17 18:53:08'),
(358, 19, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-17 19:38:07', '2025-04-17 19:38:07'),
(359, 17, 'N/A', 'Unknown', NULL, '157.55.39.60', '2025-04-17 23:42:50', '2025-04-17 23:42:50'),
(360, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-18 01:26:09', '2025-04-18 01:26:09'),
(361, 17, 'N/A', 'Unknown', NULL, '207.46.13.52', '2025-04-18 01:41:52', '2025-04-18 01:41:52'),
(362, 18, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-18 02:57:10', '2025-04-18 02:57:10'),
(363, 16, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-18 03:56:10', '2025-04-18 03:56:10'),
(364, 19, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-18 04:56:09', '2025-04-18 04:56:09'),
(365, 17, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-18 07:56:07', '2025-04-18 07:56:07'),
(366, 18, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-18 10:55:25', '2025-04-18 10:55:25'),
(367, 16, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-18 11:40:24', '2025-04-18 11:40:24'),
(368, 19, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-18 12:26:09', '2025-04-18 12:26:09'),
(369, 18, 'N/A', 'Unknown', NULL, '157.55.39.196', '2025-04-18 12:36:33', '2025-04-18 12:36:33'),
(370, 17, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-18 15:26:09', '2025-04-18 15:26:09'),
(371, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/companies/kyushu-air-tech', '114.119.149.92', '2025-04-18 18:17:54', '2025-04-18 18:17:54'),
(372, 18, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-18 18:27:09', '2025-04-18 18:27:09'),
(373, 16, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-18 19:56:07', '2025-04-18 19:56:07'),
(374, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-18 21:26:07', '2025-04-18 21:26:07'),
(375, 19, 'N/A', 'Unknown', NULL, '51.222.253.9', '2025-04-18 22:16:01', '2025-04-18 22:16:01'),
(376, 17, 'N/A', 'Unknown', NULL, '51.222.253.10', '2025-04-18 23:03:13', '2025-04-18 23:03:13'),
(377, 18, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-19 00:26:10', '2025-04-19 00:26:10'),
(378, 18, 'N/A', 'Unknown', NULL, '51.222.253.15', '2025-04-19 01:03:05', '2025-04-19 01:03:05'),
(379, 16, 'N/A', 'Unknown', NULL, '51.222.253.4', '2025-04-19 02:18:40', '2025-04-19 02:18:40'),
(380, 16, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-19 02:58:36', '2025-04-19 02:58:36'),
(381, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-19 03:47:35', '2025-04-19 03:47:35'),
(382, 19, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-19 06:00:40', '2025-04-19 06:00:40'),
(383, 18, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-19 06:45:38', '2025-04-19 06:45:38'),
(384, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/companies/afra-services', '114.119.153.104', '2025-04-19 09:23:12', '2025-04-19 09:23:12'),
(385, 16, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-19 09:26:07', '2025-04-19 09:26:07'),
(386, 19, 'N/A', 'Unknown', NULL, '149.50.218.37', '2025-04-19 10:19:42', '2025-04-19 10:19:42'),
(387, 16, 'N/A', 'Unknown', NULL, '149.50.218.37', '2025-04-19 10:19:42', '2025-04-19 10:19:42'),
(388, 18, 'N/A', 'Unknown', NULL, '149.50.218.37', '2025-04-19 10:19:42', '2025-04-19 10:19:42'),
(389, 17, 'N/A', 'Unknown', NULL, '149.50.218.37', '2025-04-19 10:19:42', '2025-04-19 10:19:42'),
(390, 17, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-19 12:26:09', '2025-04-19 12:26:09'),
(391, 18, 'N/A', 'Unknown', NULL, '66.249.79.160', '2025-04-19 13:59:44', '2025-04-19 13:59:44'),
(392, 16, 'N/A', 'Unknown', NULL, '66.249.79.161', '2025-04-19 15:26:09', '2025-04-19 15:26:09'),
(393, 17, 'N/A', 'Unknown', NULL, '66.249.79.173', '2025-04-19 18:26:08', '2025-04-19 18:26:08'),
(394, 19, 'N/A', 'Unknown', NULL, '185.191.171.17', '2025-04-19 19:10:32', '2025-04-19 19:10:32'),
(395, 18, 'N/A', 'Unknown', NULL, '85.208.96.206', '2025-04-19 20:42:12', '2025-04-19 20:42:12'),
(396, 18, 'N/A', 'Unknown', NULL, '66.249.65.202', '2025-04-19 21:12:52', '2025-04-19 21:12:52'),
(397, 16, 'N/A', 'Unknown', NULL, '66.249.65.203', '2025-04-19 21:57:51', '2025-04-19 21:57:51'),
(398, 19, 'N/A', 'Unknown', NULL, '66.249.65.203', '2025-04-19 22:56:10', '2025-04-19 22:56:10'),
(399, 17, 'N/A', 'Unknown', NULL, '85.208.96.195', '2025-04-19 23:41:57', '2025-04-19 23:41:57'),
(400, 16, 'N/A', 'Unknown', NULL, '185.191.171.19', '2025-04-20 00:10:42', '2025-04-20 00:10:42'),
(401, 17, 'N/A', 'Unknown', NULL, '66.249.65.204', '2025-04-20 00:27:10', '2025-04-20 00:27:10'),
(402, 18, 'N/A', 'Unknown', NULL, '66.249.65.202', '2025-04-20 03:26:10', '2025-04-20 03:26:10'),
(403, 16, 'N/A', 'Unknown', NULL, '66.249.65.203', '2025-04-20 05:58:09', '2025-04-20 05:58:09'),
(404, 17, 'N/A', 'Unknown', NULL, '66.249.65.202', '2025-04-20 06:43:09', '2025-04-20 06:43:09'),
(405, 19, 'N/A', 'Unknown', NULL, '66.249.65.202', '2025-04-20 07:57:11', '2025-04-20 07:57:11'),
(406, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 10:56:07', '2025-04-20 10:56:07'),
(407, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 13:54:11', '2025-04-20 13:54:11'),
(408, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 14:39:11', '2025-04-20 14:39:11'),
(409, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 15:09:11', '2025-04-20 15:09:11'),
(410, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 17:56:09', '2025-04-20 17:56:09'),
(411, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit-2', '192.110.160.66', '2025-04-20 20:27:29', '2025-04-20 20:27:29'),
(412, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 20:56:09', '2025-04-20 20:56:09'),
(413, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit-2', '192.110.160.66', '2025-04-20 21:57:17', '2025-04-20 21:57:17'),
(414, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:06:14', '2025-04-20 22:06:14'),
(415, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:10:00', '2025-04-20 22:10:00'),
(416, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:10:00', '2025-04-20 22:10:00'),
(417, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:10:01', '2025-04-20 22:10:01'),
(418, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:10:01', '2025-04-20 22:10:01'),
(419, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:25:03', '2025-04-20 22:25:03'),
(420, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-20 22:57:09', '2025-04-20 22:57:09'),
(421, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 01:01:36', '2025-04-21 01:01:36'),
(422, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 01:30:49', '2025-04-21 01:30:49'),
(423, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit-2', '192.110.160.66', '2025-04-21 01:47:56', '2025-04-21 01:47:56'),
(424, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 01:56:09', '2025-04-21 01:56:09'),
(425, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 04:56:09', '2025-04-21 04:56:09'),
(426, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 06:26:07', '2025-04-21 06:26:07'),
(427, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 10:04:29', '2025-04-21 10:04:29'),
(428, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 10:49:31', '2025-04-21 10:49:31'),
(429, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 11:34:31', '2025-04-21 11:34:31'),
(430, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 11:36:17', '2025-04-21 11:36:17'),
(431, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 12:26:07', '2025-04-21 12:26:07'),
(432, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 12:46:57', '2025-04-21 12:46:57'),
(433, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 14:56:55', '2025-04-21 14:56:55'),
(434, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 15:47:44', '2025-04-21 15:47:44'),
(435, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 18:27:10', '2025-04-21 18:27:10'),
(436, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 19:56:09', '2025-04-21 19:56:09'),
(437, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 20:27:22', '2025-04-21 20:27:22'),
(438, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 21:28:09', '2025-04-21 21:28:09'),
(439, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-21 22:48:23', '2025-04-21 22:48:23'),
(440, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 00:26:09', '2025-04-22 00:26:09'),
(441, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 02:22:28', '2025-04-22 02:22:28'),
(442, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 02:22:29', '2025-04-22 02:22:29'),
(443, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 02:22:29', '2025-04-22 02:22:29'),
(444, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 02:22:29', '2025-04-22 02:22:29'),
(445, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 03:06:03', '2025-04-22 03:06:03'),
(446, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 03:06:03', '2025-04-22 03:06:03'),
(447, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 03:06:04', '2025-04-22 03:06:04'),
(448, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 03:06:04', '2025-04-22 03:06:04'),
(449, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 03:15:52', '2025-04-22 03:15:52'),
(450, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 04:47:52', '2025-04-22 04:47:52'),
(451, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 06:18:53', '2025-04-22 06:18:53'),
(452, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 07:47:52', '2025-04-22 07:47:52'),
(453, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 09:39:02', '2025-04-22 09:39:02'),
(454, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 09:39:02', '2025-04-22 09:39:02'),
(455, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 09:39:03', '2025-04-22 09:39:03'),
(456, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 09:39:03', '2025-04-22 09:39:03'),
(457, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 10:18:30', '2025-04-22 10:18:30'),
(458, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 10:18:30', '2025-04-22 10:18:30'),
(459, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 10:18:30', '2025-04-22 10:18:30'),
(460, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 10:18:31', '2025-04-22 10:18:31'),
(461, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 12:06:01', '2025-04-22 12:06:01'),
(462, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 13:38:01', '2025-04-22 13:38:01'),
(463, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 15:07:59', '2025-04-22 15:07:59'),
(464, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 16:36:02', '2025-04-22 16:36:02'),
(465, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 19:36:02', '2025-04-22 19:36:02'),
(466, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 22:37:02', '2025-04-22 22:37:02'),
(467, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 23:03:43', '2025-04-22 23:03:43'),
(468, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 23:21:24', '2025-04-22 23:21:24'),
(469, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 23:38:22', '2025-04-22 23:38:22'),
(470, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-22 23:54:14', '2025-04-22 23:54:14'),
(471, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 00:08:01', '2025-04-23 00:08:01'),
(472, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 01:31:39', '2025-04-23 01:31:39'),
(473, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 01:37:59', '2025-04-23 01:37:59'),
(474, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 03:20:17', '2025-04-23 03:20:17'),
(475, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 03:47:18', '2025-04-23 03:47:18'),
(476, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 03:47:18', '2025-04-23 03:47:18'),
(477, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 03:47:19', '2025-04-23 03:47:19'),
(478, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 03:47:19', '2025-04-23 03:47:19'),
(479, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 05:30:16', '2025-04-23 05:30:16'),
(480, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 07:00:19', '2025-04-23 07:00:19'),
(481, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 08:30:18', '2025-04-23 08:30:18'),
(482, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 11:30:18', '2025-04-23 11:30:18'),
(483, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 14:05:29', '2025-04-23 14:05:29'),
(484, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 14:50:29', '2025-04-23 14:50:29'),
(485, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 16:00:18', '2025-04-23 16:00:18'),
(486, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 17:30:19', '2025-04-23 17:30:19'),
(487, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 17:48:51', '2025-04-23 17:48:51'),
(488, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 20:30:19', '2025-04-23 20:30:19'),
(489, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-23 22:59:35', '2025-04-23 22:59:35'),
(490, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 01:17:00', '2025-04-24 01:17:00'),
(491, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 02:40:30', '2025-04-24 02:40:30'),
(492, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 02:47:00', '2025-04-24 02:47:00'),
(493, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 03:38:16', '2025-04-24 03:38:16'),
(494, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 05:46:58', '2025-04-24 05:46:58');
INSERT INTO `jb_analytics` (`id`, `job_id`, `country`, `country_full`, `referer`, `ip_address`, `created_at`, `updated_at`) VALUES
(495, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 06:51:56', '2025-04-24 06:51:56'),
(496, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 07:21:02', '2025-04-24 07:21:02'),
(497, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 07:42:59', '2025-04-24 07:42:59'),
(498, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 10:12:56', '2025-04-24 10:12:56'),
(499, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 11:09:56', '2025-04-24 11:09:56'),
(500, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 11:54:56', '2025-04-24 11:54:56'),
(501, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 12:28:48', '2025-04-24 12:28:48'),
(502, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 14:47:58', '2025-04-24 14:47:58'),
(503, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 16:16:14', '2025-04-24 16:16:14'),
(504, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 17:46:58', '2025-04-24 17:46:58'),
(505, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 19:17:01', '2025-04-24 19:17:01'),
(506, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 20:47:00', '2025-04-24 20:47:00'),
(507, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-24 23:52:58', '2025-04-24 23:52:58'),
(508, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 02:52:01', '2025-04-25 02:52:01'),
(509, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 03:53:11', '2025-04-25 03:53:11'),
(510, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 04:17:01', '2025-04-25 04:17:01'),
(511, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 05:46:58', '2025-04-25 05:46:58'),
(512, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 07:18:01', '2025-04-25 07:18:01'),
(513, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 08:49:01', '2025-04-25 08:49:01'),
(514, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 11:48:01', '2025-04-25 11:48:01'),
(515, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 13:21:01', '2025-04-25 13:21:01'),
(516, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 14:48:00', '2025-04-25 14:48:00'),
(517, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/', '192.110.160.66', '2025-04-25 17:39:20', '2025-04-25 17:39:20'),
(518, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 17:53:11', '2025-04-25 17:53:11'),
(519, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 19:16:52', '2025-04-25 19:16:52'),
(520, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 19:16:58', '2025-04-25 19:16:58'),
(521, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 20:47:59', '2025-04-25 20:47:59'),
(522, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/companies/afra-services', '192.110.160.66', '2025-04-25 21:17:40', '2025-04-25 21:17:40'),
(523, 19, 'N/A', 'Unknown', 'https://google.com', '192.110.160.66', '2025-04-25 21:34:49', '2025-04-25 21:34:49'),
(524, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs', '192.110.160.66', '2025-04-25 22:04:13', '2025-04-25 22:04:13'),
(525, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-25 23:47:00', '2025-04-25 23:47:00'),
(526, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/companies/afra-services', '192.110.160.66', '2025-04-26 00:41:52', '2025-04-26 00:41:52'),
(527, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 02:47:01', '2025-04-26 02:47:01'),
(528, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 04:14:07', '2025-04-26 04:14:07'),
(529, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 04:14:07', '2025-04-26 04:14:07'),
(530, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 04:14:07', '2025-04-26 04:14:07'),
(531, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 04:14:08', '2025-04-26 04:14:08'),
(532, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 04:19:01', '2025-04-26 04:19:01'),
(533, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 05:24:36', '2025-04-26 05:24:36'),
(534, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 05:24:36', '2025-04-26 05:24:36'),
(535, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 05:24:37', '2025-04-26 05:24:37'),
(536, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 05:47:19', '2025-04-26 05:47:19'),
(537, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 07:17:01', '2025-04-26 07:17:01'),
(538, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 08:47:07', '2025-04-26 08:47:07'),
(539, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 11:47:01', '2025-04-26 11:47:01'),
(540, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 13:22:11', '2025-04-26 13:22:11'),
(541, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 13:37:36', '2025-04-26 13:37:36'),
(542, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 14:50:01', '2025-04-26 14:50:01'),
(543, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 15:04:49', '2025-04-26 15:04:49'),
(544, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 17:46:59', '2025-04-26 17:46:59'),
(545, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/job-categories/general-worker', '192.110.160.66', '2025-04-26 18:24:21', '2025-04-26 18:24:21'),
(546, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 20:45:21', '2025-04-26 20:45:21'),
(547, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 21:30:23', '2025-04-26 21:30:23'),
(548, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 22:11:21', '2025-04-26 22:11:21'),
(549, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 22:11:21', '2025-04-26 22:11:21'),
(550, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 22:11:21', '2025-04-26 22:11:21'),
(551, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 22:11:22', '2025-04-26 22:11:22'),
(552, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-26 22:16:59', '2025-04-26 22:16:59'),
(553, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 00:04:05', '2025-04-27 00:04:05'),
(554, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 01:17:01', '2025-04-27 01:17:01'),
(555, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 02:50:05', '2025-04-27 02:50:05'),
(556, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 02:50:05', '2025-04-27 02:50:05'),
(557, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 02:50:05', '2025-04-27 02:50:05'),
(558, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 02:50:06', '2025-04-27 02:50:06'),
(559, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 03:02:37', '2025-04-27 03:02:37'),
(560, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 04:17:01', '2025-04-27 04:17:01'),
(561, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 04:22:36', '2025-04-27 04:22:36'),
(562, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 04:22:36', '2025-04-27 04:22:36'),
(563, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 04:22:36', '2025-04-27 04:22:36'),
(564, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 05:54:04', '2025-04-27 05:54:04'),
(565, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 07:16:59', '2025-04-27 07:16:59'),
(566, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 11:37:30', '2025-04-27 11:37:30'),
(567, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 12:26:30', '2025-04-27 12:26:30'),
(568, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 13:16:32', '2025-04-27 13:16:32'),
(569, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 14:01:32', '2025-04-27 14:01:32'),
(570, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 17:21:47', '2025-04-27 17:21:47'),
(571, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 18:29:32', '2025-04-27 18:29:32'),
(572, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 19:47:48', '2025-04-27 19:47:48'),
(573, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 20:58:52', '2025-04-27 20:58:52'),
(574, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 21:47:30', '2025-04-27 21:47:30'),
(575, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-27 23:08:47', '2025-04-27 23:08:47'),
(576, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 00:18:50', '2025-04-28 00:18:50'),
(577, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 00:47:32', '2025-04-28 00:47:32'),
(578, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 01:30:40', '2025-04-28 01:30:40'),
(579, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 02:31:41', '2025-04-28 02:31:41'),
(580, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 03:35:12', '2025-04-28 03:35:12'),
(581, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 03:47:34', '2025-04-28 03:47:34'),
(582, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 05:05:41', '2025-04-28 05:05:41'),
(583, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 05:48:30', '2025-04-28 05:48:30'),
(584, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 06:47:30', '2025-04-28 06:47:30'),
(585, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 08:04:41', '2025-04-28 08:04:41'),
(586, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 09:47:32', '2025-04-28 09:47:32'),
(587, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 11:22:35', '2025-04-28 11:22:35'),
(588, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 12:48:32', '2025-04-28 12:48:32'),
(589, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 14:17:30', '2025-04-28 14:17:30'),
(590, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 15:48:31', '2025-04-28 15:48:31'),
(591, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/job-categories/general-worker', '192.110.160.66', '2025-04-28 16:31:09', '2025-04-28 16:31:09'),
(592, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 18:49:53', '2025-04-28 18:49:53'),
(593, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 20:23:31', '2025-04-28 20:23:31'),
(594, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 21:51:56', '2025-04-28 21:51:56'),
(595, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-28 23:59:47', '2025-04-28 23:59:47'),
(596, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 00:47:30', '2025-04-29 00:47:30'),
(597, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 03:48:56', '2025-04-29 03:48:56'),
(598, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 03:57:33', '2025-04-29 03:57:33'),
(599, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 04:28:15', '2025-04-29 04:28:15'),
(600, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 05:17:30', '2025-04-29 05:17:30'),
(601, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 06:51:30', '2025-04-29 06:51:30'),
(602, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 07:15:15', '2025-04-29 07:15:15'),
(603, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 08:19:30', '2025-04-29 08:19:30'),
(604, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 09:06:22', '2025-04-29 09:06:22'),
(605, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 12:06:24', '2025-04-29 12:06:24'),
(606, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 13:37:24', '2025-04-29 13:37:24'),
(607, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 15:06:25', '2025-04-29 15:06:25'),
(608, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 16:37:24', '2025-04-29 16:37:24'),
(609, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 18:07:24', '2025-04-29 18:07:24'),
(610, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 20:15:31', '2025-04-29 20:15:31'),
(611, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 21:07:22', '2025-04-29 21:07:22'),
(612, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-29 22:36:25', '2025-04-29 22:36:25'),
(613, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 00:07:22', '2025-04-30 00:07:22'),
(614, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 02:48:36', '2025-04-30 02:48:36'),
(615, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 03:04:02', '2025-04-30 03:04:02'),
(616, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 03:06:22', '2025-04-30 03:06:22'),
(617, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 03:37:22', '2025-04-30 03:37:22'),
(618, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 03:44:02', '2025-04-30 03:44:02'),
(619, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 04:36:22', '2025-04-30 04:36:22'),
(620, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 06:08:24', '2025-04-30 06:08:24'),
(621, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 08:39:52', '2025-04-30 08:39:52'),
(622, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 09:06:22', '2025-04-30 09:06:22'),
(623, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 10:26:51', '2025-04-30 10:26:51'),
(624, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 10:36:22', '2025-04-30 10:36:22'),
(625, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 10:42:03', '2025-04-30 10:42:03'),
(626, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 11:12:52', '2025-04-30 11:12:52'),
(627, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 12:06:24', '2025-04-30 12:06:24'),
(628, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 14:44:57', '2025-04-30 14:44:57'),
(629, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 15:06:22', '2025-04-30 15:06:22'),
(630, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 16:36:22', '2025-04-30 16:36:22'),
(631, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 18:06:25', '2025-04-30 18:06:25'),
(632, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 18:56:31', '2025-04-30 18:56:31'),
(633, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 21:06:22', '2025-04-30 21:06:22'),
(634, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 22:38:25', '2025-04-30 22:38:25'),
(635, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 22:42:24', '2025-04-30 22:42:24'),
(636, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-04-30 23:08:26', '2025-04-30 23:08:26'),
(637, 18, 'N/A', 'Unknown', 'http://www.niceoverseaspl.com', '192.110.160.66', '2025-05-01 00:32:35', '2025-05-01 00:32:35'),
(638, 19, 'N/A', 'Unknown', 'http://www.niceoverseaspl.com', '192.110.160.66', '2025-05-01 00:32:35', '2025-05-01 00:32:35'),
(639, 17, 'N/A', 'Unknown', 'http://www.niceoverseaspl.com', '192.110.160.66', '2025-05-01 00:32:35', '2025-05-01 00:32:35'),
(640, 16, 'N/A', 'Unknown', 'http://www.niceoverseaspl.com', '192.110.160.66', '2025-05-01 00:32:35', '2025-05-01 00:32:35'),
(641, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 01:36:22', '2025-05-01 01:36:22'),
(642, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 03:06:24', '2025-05-01 03:06:24'),
(643, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 04:30:59', '2025-05-01 04:30:59'),
(644, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 04:30:59', '2025-05-01 04:30:59'),
(645, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 04:31:00', '2025-05-01 04:31:00'),
(646, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 04:31:00', '2025-05-01 04:31:00'),
(647, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 04:36:22', '2025-05-01 04:36:22'),
(648, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 06:06:22', '2025-05-01 06:06:22'),
(649, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 09:06:25', '2025-05-01 09:06:25'),
(650, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 10:36:22', '2025-05-01 10:36:22'),
(651, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 12:06:25', '2025-05-01 12:06:25'),
(652, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 15:07:25', '2025-05-01 15:07:25'),
(653, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 15:59:02', '2025-05-01 15:59:02'),
(654, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 16:36:22', '2025-05-01 16:36:22'),
(655, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 18:03:24', '2025-05-01 18:03:24'),
(656, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 18:06:22', '2025-05-01 18:06:22'),
(657, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 18:42:08', '2025-05-01 18:42:08'),
(658, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 21:06:23', '2025-05-01 21:06:23'),
(659, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 22:36:25', '2025-05-01 22:36:25'),
(660, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-01 23:04:32', '2025-05-01 23:04:32'),
(661, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 00:07:23', '2025-05-02 00:07:23'),
(662, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/job-categories/general-worker', '192.110.160.66', '2025-05-02 00:22:55', '2025-05-02 00:22:55'),
(663, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 00:38:49', '2025-05-02 00:38:49'),
(664, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 00:38:49', '2025-05-02 00:38:49'),
(665, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 00:38:49', '2025-05-02 00:38:49'),
(666, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 00:38:50', '2025-05-02 00:38:50'),
(667, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 02:11:52', '2025-05-02 02:11:52'),
(668, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 02:19:27', '2025-05-02 02:19:27'),
(669, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 03:06:23', '2025-05-02 03:06:23'),
(670, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '192.110.160.66', '2025-05-02 03:17:08', '2025-05-02 03:17:08'),
(671, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 04:38:23', '2025-05-02 04:38:23'),
(672, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 05:07:07', '2025-05-02 05:07:07'),
(673, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 05:07:07', '2025-05-02 05:07:07'),
(674, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 05:07:07', '2025-05-02 05:07:07'),
(675, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 05:07:08', '2025-05-02 05:07:08'),
(676, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 06:06:23', '2025-05-02 06:06:23'),
(677, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 06:07:05', '2025-05-02 06:07:05'),
(678, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 08:46:59', '2025-05-02 08:46:59'),
(679, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 09:06:23', '2025-05-02 09:06:23'),
(680, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 10:36:23', '2025-05-02 10:36:23'),
(681, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 11:13:56', '2025-05-02 11:13:56'),
(682, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 11:42:44', '2025-05-02 11:42:44'),
(683, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 12:07:25', '2025-05-02 12:07:25'),
(684, 18, 'N/A', 'Unknown', 'https://www.google.com/', '192.110.160.66', '2025-05-02 14:32:25', '2025-05-02 14:32:25'),
(685, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 15:06:26', '2025-05-02 15:06:26'),
(686, 19, 'N/A', 'Unknown', 'https://www.google.com/', '192.110.160.66', '2025-05-02 15:32:14', '2025-05-02 15:32:14'),
(687, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 16:36:25', '2025-05-02 16:36:25'),
(688, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 19:36:25', '2025-05-02 19:36:25'),
(689, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 21:07:23', '2025-05-02 21:07:23'),
(690, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 21:56:22', '2025-05-02 21:56:22'),
(691, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 22:37:23', '2025-05-02 22:37:23'),
(692, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 23:11:46', '2025-05-02 23:11:46'),
(693, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-02 23:11:54', '2025-05-02 23:11:54'),
(694, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 00:07:23', '2025-05-03 00:07:23'),
(695, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 03:06:25', '2025-05-03 03:06:25'),
(696, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 04:37:25', '2025-05-03 04:37:25'),
(697, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 06:01:58', '2025-05-03 06:01:58'),
(698, 16, 'N/A', 'Unknown', 'https://www.google.com/', '192.110.160.66', '2025-05-03 07:00:31', '2025-05-03 07:00:31'),
(699, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 07:38:25', '2025-05-03 07:38:25'),
(700, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 07:53:17', '2025-05-03 07:53:17'),
(701, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 10:24:50', '2025-05-03 10:24:50'),
(702, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 11:11:53', '2025-05-03 11:11:53'),
(703, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 12:06:25', '2025-05-03 12:06:25'),
(704, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 13:37:23', '2025-05-03 13:37:23'),
(705, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 15:10:37', '2025-05-03 15:10:37'),
(706, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 15:10:37', '2025-05-03 15:10:37'),
(707, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 15:10:37', '2025-05-03 15:10:37'),
(708, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 15:10:38', '2025-05-03 15:10:38'),
(709, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 16:40:24', '2025-05-03 16:40:24'),
(710, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=recruitment-procedures', '192.110.160.66', '2025-05-03 19:07:27', '2025-05-03 19:07:27'),
(711, 17, 'N/A', 'Unknown', 'https://www.google.com/', '192.110.160.66', '2025-05-03 19:21:38', '2025-05-03 19:21:38'),
(712, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 19:41:23', '2025-05-03 19:41:23'),
(713, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 21:08:23', '2025-05-03 21:08:23'),
(714, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-03 22:36:25', '2025-05-03 22:36:25'),
(715, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 00:07:23', '2025-05-04 00:07:23'),
(716, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=recruitment-procedures', '192.110.160.66', '2025-05-04 01:48:09', '2025-05-04 01:48:09'),
(717, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 03:09:24', '2025-05-04 03:09:24'),
(718, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 04:40:23', '2025-05-04 04:40:23'),
(719, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 06:06:26', '2025-05-04 06:06:26'),
(720, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 06:59:10', '2025-05-04 06:59:10'),
(721, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=recruitment-procedures', '192.110.160.66', '2025-05-04 08:21:04', '2025-05-04 08:21:04'),
(722, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 08:41:28', '2025-05-04 08:41:28'),
(723, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 09:12:26', '2025-05-04 09:12:26'),
(724, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 10:36:26', '2025-05-04 10:36:26'),
(725, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 12:07:25', '2025-05-04 12:07:25'),
(726, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 15:06:26', '2025-05-04 15:06:26'),
(727, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 16:36:26', '2025-05-04 16:36:26'),
(728, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 18:07:26', '2025-05-04 18:07:26'),
(729, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 20:29:33', '2025-05-04 20:29:33'),
(730, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 21:06:25', '2025-05-04 21:06:25'),
(731, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-04 22:41:24', '2025-05-04 22:41:24'),
(732, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 00:06:26', '2025-05-05 00:06:26'),
(733, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 03:06:26', '2025-05-05 03:06:26'),
(734, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 04:37:26', '2025-05-05 04:37:26'),
(735, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 07:37:24', '2025-05-05 07:37:24'),
(736, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 09:07:26', '2025-05-05 09:07:26'),
(737, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 10:36:26', '2025-05-05 10:36:26'),
(738, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs', '192.110.160.66', '2025-05-05 11:17:38', '2025-05-05 11:17:38'),
(739, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs', '192.110.160.66', '2025-05-05 12:48:11', '2025-05-05 12:48:11'),
(740, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 13:36:26', '2025-05-05 13:36:26'),
(741, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 16:08:19', '2025-05-05 16:08:19'),
(742, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 16:53:19', '2025-05-05 16:53:19'),
(743, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 18:06:24', '2025-05-05 18:06:24'),
(744, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 19:36:26', '2025-05-05 19:36:26'),
(745, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-05 22:39:24', '2025-05-05 22:39:24'),
(746, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 00:41:02', '2025-05-06 00:41:02'),
(747, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 00:41:03', '2025-05-06 00:41:03'),
(748, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 00:41:03', '2025-05-06 00:41:03'),
(749, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 00:41:03', '2025-05-06 00:41:03'),
(750, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 01:36:26', '2025-05-06 01:36:26'),
(751, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 03:06:26', '2025-05-06 03:06:26'),
(752, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 04:43:27', '2025-05-06 04:43:27'),
(753, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 05:55:09', '2025-05-06 05:55:09'),
(754, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 06:06:24', '2025-05-06 06:06:24'),
(755, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 09:07:26', '2025-05-06 09:07:26'),
(756, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 10:36:26', '2025-05-06 10:36:26'),
(757, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 12:11:24', '2025-05-06 12:11:24'),
(758, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 13:53:10', '2025-05-06 13:53:10'),
(759, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 13:53:10', '2025-05-06 13:53:10'),
(760, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 13:53:10', '2025-05-06 13:53:10'),
(761, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 13:53:10', '2025-05-06 13:53:10'),
(762, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 15:07:24', '2025-05-06 15:07:24'),
(763, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 16:36:27', '2025-05-06 16:36:27'),
(764, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 17:35:16', '2025-05-06 17:35:16'),
(765, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/companies/helistrom-sdn-bhd', '192.110.160.66', '2025-05-06 18:19:55', '2025-05-06 18:19:55'),
(766, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 19:40:13', '2025-05-06 19:40:13'),
(767, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 20:13:33', '2025-05-06 20:13:33'),
(768, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 21:44:36', '2025-05-06 21:44:36'),
(769, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-06 23:14:39', '2025-05-06 23:14:39'),
(770, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 03:58:36', '2025-05-07 03:58:36'),
(771, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 04:00:39', '2025-05-07 04:00:39'),
(772, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 05:39:37', '2025-05-07 05:39:37'),
(773, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 06:58:35', '2025-05-07 06:58:35'),
(774, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 09:58:35', '2025-05-07 09:58:35'),
(775, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 14:06:43', '2025-05-07 14:06:43'),
(776, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 15:09:43', '2025-05-07 15:09:43'),
(777, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 16:06:41', '2025-05-07 16:06:41'),
(778, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 17:36:41', '2025-05-07 17:36:41'),
(779, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs?layout=grid', '192.110.160.66', '2025-05-07 19:43:14', '2025-05-07 19:43:14'),
(780, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 20:41:44', '2025-05-07 20:41:44'),
(781, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-07 23:37:41', '2025-05-07 23:37:41'),
(782, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 01:47:58', '2025-05-08 01:47:58'),
(783, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 03:10:03', '2025-05-08 03:10:03'),
(784, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 03:52:55', '2025-05-08 03:52:55'),
(785, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 06:08:04', '2025-05-08 06:08:04'),
(786, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 09:52:35', '2025-05-08 09:52:35'),
(787, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 11:22:34', '2025-05-08 11:22:34'),
(788, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 12:52:32', '2025-05-08 12:52:32'),
(789, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 14:22:34', '2025-05-08 14:22:34'),
(790, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 14:52:26', '2025-05-08 14:52:26'),
(791, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 15:52:34', '2025-05-08 15:52:34'),
(792, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 18:52:32', '2025-05-08 18:52:32'),
(793, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 20:22:34', '2025-05-08 20:22:34'),
(794, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-08 21:52:32', '2025-05-08 21:52:32'),
(795, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 00:53:32', '2025-05-09 00:53:32'),
(796, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 02:22:32', '2025-05-09 02:22:32'),
(797, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 03:52:32', '2025-05-09 03:52:32'),
(798, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 05:49:45', '2025-05-09 05:49:45'),
(799, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 07:16:03', '2025-05-09 07:16:03'),
(800, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 10:52:30', '2025-05-09 10:52:30'),
(801, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 12:22:29', '2025-05-09 12:22:29'),
(802, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 13:52:30', '2025-05-09 13:52:30'),
(803, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 15:23:29', '2025-05-09 15:23:29'),
(804, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 15:53:02', '2025-05-09 15:53:02'),
(805, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/security-guard-2', '192.110.160.66', '2025-05-09 17:13:09', '2025-05-09 17:13:09'),
(806, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/factory-workers-1', '192.110.160.66', '2025-05-09 17:13:12', '2025-05-09 17:13:12'),
(807, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/general-worker-1', '192.110.160.66', '2025-05-09 17:14:07', '2025-05-09 17:14:07'),
(808, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 18:23:30', '2025-05-09 18:23:30'),
(809, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 21:22:30', '2025-05-09 21:22:30'),
(810, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-09 22:52:30', '2025-05-09 22:52:30'),
(811, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 00:22:30', '2025-05-10 00:22:30'),
(812, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 01:52:28', '2025-05-10 01:52:28'),
(813, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/factory-workers', '192.110.160.66', '2025-05-10 05:31:36', '2025-05-10 05:31:36'),
(814, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/factory-workers-1', '192.110.160.66', '2025-05-10 05:58:57', '2025-05-10 05:58:57'),
(815, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 06:29:48', '2025-05-10 06:29:48'),
(816, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 08:11:47', '2025-05-10 08:11:47'),
(817, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 09:21:30', '2025-05-10 09:21:30'),
(818, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 09:31:47', '2025-05-10 09:31:47'),
(819, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 11:00:47', '2025-05-10 11:00:47'),
(820, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/companies/helistrom-sdn-bhd', '192.110.160.66', '2025-05-10 11:32:24', '2025-05-10 11:32:24'),
(821, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 14:01:47', '2025-05-10 14:01:47'),
(822, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 17:03:47', '2025-05-10 17:03:47'),
(823, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 18:29:45', '2025-05-10 18:29:45'),
(824, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 20:07:47', '2025-05-10 20:07:47'),
(825, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-10 21:31:45', '2025-05-10 21:31:45'),
(826, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 00:30:45', '2025-05-11 00:30:45'),
(827, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 02:56:11', '2025-05-11 02:56:11'),
(828, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 03:41:13', '2025-05-11 03:41:13'),
(829, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 05:00:47', '2025-05-11 05:00:47'),
(830, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/factory-workers', '192.110.160.66', '2025-05-11 06:32:00', '2025-05-11 06:32:00'),
(831, 19, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/factory-workers-1', '192.110.160.66', '2025-05-11 06:34:53', '2025-05-11 06:34:53'),
(832, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 06:41:01', '2025-05-11 06:41:01'),
(833, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 08:51:08', '2025-05-11 08:51:08'),
(834, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 08:56:04', '2025-05-11 08:56:04'),
(835, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 09:20:10', '2025-05-11 09:20:10'),
(836, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 09:36:24', '2025-05-11 09:36:24'),
(837, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 09:36:24', '2025-05-11 09:36:24'),
(838, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 09:36:24', '2025-05-11 09:36:24'),
(839, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 09:36:24', '2025-05-11 09:36:24'),
(840, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 09:55:17', '2025-05-11 09:55:17'),
(841, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 11:03:48', '2025-05-11 11:03:48'),
(842, 17, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/general-worker-1', '192.110.160.66', '2025-05-11 12:16:25', '2025-05-11 12:16:25'),
(843, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 14:51:13', '2025-05-11 14:51:13'),
(844, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 16:07:18', '2025-05-11 16:07:18'),
(845, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 16:30:07', '2025-05-11 16:30:07'),
(846, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 16:30:08', '2025-05-11 16:30:08'),
(847, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 16:30:08', '2025-05-11 16:30:08'),
(848, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 16:30:08', '2025-05-11 16:30:08'),
(849, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 16:35:14', '2025-05-11 16:35:14'),
(850, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 17:00:45', '2025-05-11 17:00:45'),
(851, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 18:33:48', '2025-05-11 18:33:48'),
(852, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-11 21:29:47', '2025-05-11 21:29:47'),
(853, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 00:07:19', '2025-05-12 00:07:19'),
(854, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 00:52:19', '2025-05-12 00:52:19'),
(855, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 01:29:31', '2025-05-12 01:29:31'),
(856, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 01:29:31', '2025-05-12 01:29:31'),
(857, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 01:29:32', '2025-05-12 01:29:32'),
(858, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 01:29:32', '2025-05-12 01:29:32'),
(859, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 02:13:47', '2025-05-12 02:13:47'),
(860, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 03:30:48', '2025-05-12 03:30:48'),
(861, 16, 'N/A', 'Unknown', 'https://niceoverseaspl.com/?elementor_library=default-kit', '192.110.160.66', '2025-05-12 04:26:17', '2025-05-12 04:26:17'),
(862, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 06:29:46', '2025-05-12 06:29:46'),
(863, 18, 'N/A', 'Unknown', 'https://niceoverseaspl.com/jobs/factory-workers', '192.110.160.66', '2025-05-12 07:12:13', '2025-05-12 07:12:13'),
(864, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 09:14:23', '2025-05-12 09:14:23'),
(865, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 09:55:04', '2025-05-12 09:55:04'),
(866, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 10:08:36', '2025-05-12 10:08:36'),
(867, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 10:08:36', '2025-05-12 10:08:36'),
(868, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 10:08:36', '2025-05-12 10:08:36'),
(869, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 10:08:36', '2025-05-12 10:08:36'),
(870, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 10:52:55', '2025-05-12 10:52:55'),
(871, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 12:21:55', '2025-05-12 12:21:55'),
(872, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 15:21:55', '2025-05-12 15:21:55'),
(873, 18, 'N/A', 'Unknown', 'https://www.google.com/url?q=https://www.niceoverseaspl.com/jobs/factory-workers&sa=U&ved=2ahUKEwj14c3V3Z2NAxV1SmwGHSszF_QQjBB6BAgyEAg&usg=AOvVaw1CNTU9xbNgFoadl55xCuW1', '192.110.160.66', '2025-05-12 17:34:16', '2025-05-12 17:34:16'),
(874, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 18:26:52', '2025-05-12 18:26:52'),
(875, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 19:54:52', '2025-05-12 19:54:52'),
(876, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 21:21:54', '2025-05-12 21:21:54'),
(877, 19, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-12 22:54:52', '2025-05-12 22:54:52'),
(878, 17, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-13 01:53:52', '2025-05-13 01:53:52'),
(879, 18, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-13 03:21:57', '2025-05-13 03:21:57'),
(880, 16, 'N/A', 'Unknown', NULL, '192.110.160.66', '2025-05-13 04:53:52', '2025-05-13 04:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `jb_applications`
--

CREATE TABLE `jb_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `message` text DEFAULT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `cover_letter` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_external_apply` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_career_levels`
--

CREATE TABLE `jb_career_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_career_levels_translations`
--

CREATE TABLE `jb_career_levels_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_career_levels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_categories`
--

CREATE TABLE `jb_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_categories`
--

INSERT INTO `jb_categories` (`id`, `name`, `description`, `order`, `is_default`, `is_featured`, `status`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Human Resources', '', 7, 0, 0, 'published', '2024-04-11 10:39:31', '2024-04-11 11:07:29', 0),
(2, 'Administration', '', 6, 0, 0, 'published', '2024-04-11 10:40:36', '2024-04-11 11:07:29', 0),
(3, 'Accounting', '', 5, 0, 0, 'published', '2024-04-11 10:41:21', '2024-04-11 11:07:29', 0),
(4, 'Finance', '', 4, 0, 0, 'published', '2024-04-11 10:41:51', '2024-04-11 11:07:29', 0),
(6, 'Operator', '', 2, 0, 0, 'published', '2024-04-11 10:43:06', '2024-04-11 11:07:29', 0),
(7, 'Food and Beverage', '', 1, 0, 0, 'published', '2024-04-11 10:44:00', '2024-04-11 11:07:29', 0),
(8, 'Production Worker', '', 0, 0, 0, 'published', '2024-04-11 10:46:11', '2024-04-11 11:07:29', 0),
(9, 'Therapist', '', 0, 0, 0, 'published', '2024-04-11 11:08:55', '2024-04-11 11:08:55', 0),
(10, 'Beautician', '', 0, 0, 0, 'published', '2024-04-11 12:54:59', '2024-04-11 12:54:59', 0),
(12, 'Driver', '', 0, 0, 0, 'published', '2024-04-11 13:07:30', '2024-04-11 13:07:30', 0),
(13, 'Housekeeping', '', 0, 0, 0, 'published', '2024-04-11 13:15:00', '2024-04-11 13:15:00', 0),
(14, 'General Worker', '', 0, 0, 0, 'published', '2024-04-11 13:16:56', '2024-04-11 13:16:56', 0),
(15, 'Domestic Worker', '', 0, 0, 0, 'published', '2024-04-11 13:23:11', '2024-04-11 13:23:11', 0),
(16, 'Security Service', '', 0, 0, 0, 'published', '2024-04-11 13:30:59', '2024-04-11 13:30:59', 0),
(17, 'Salesman', '', 0, 0, 0, 'published', '2024-04-11 13:34:14', '2024-04-11 13:34:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jb_categories_translations`
--

CREATE TABLE `jb_categories_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_companies`
--

CREATE TABLE `jb_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `website` varchar(120) DEFAULT NULL,
  `logo` varchar(120) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `postal_code` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `year_founded` int(10) UNSIGNED DEFAULT NULL,
  `ceo` varchar(120) DEFAULT NULL,
  `number_of_offices` int(10) UNSIGNED DEFAULT NULL,
  `number_of_employees` varchar(60) DEFAULT NULL,
  `annual_revenue` varchar(60) DEFAULT NULL,
  `cover_image` varchar(120) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_companies`
--

INSERT INTO `jb_companies` (`id`, `name`, `email`, `description`, `content`, `website`, `logo`, `latitude`, `longitude`, `address`, `country_id`, `state_id`, `city_id`, `postal_code`, `phone`, `year_founded`, `ceo`, `number_of_offices`, `number_of_employees`, `annual_revenue`, `cover_image`, `facebook`, `twitter`, `linkedin`, `instagram`, `is_featured`, `status`, `views`, `created_at`, `updated_at`, `tax_id`) VALUES
(11, 'Afra Services', NULL, '', '', '', 'logo-client/afra-services.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 248, '2024-04-11 13:19:27', '2025-03-29 10:13:56', NULL),
(12, 'Felda', NULL, '', '', '', 'logo-client/felda-1.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 141, '2025-03-29 10:31:41', '2025-03-29 10:31:41', NULL),
(13, 'Foxconn', NULL, '', '', '', 'logo-client/foxconn-2.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 171, '2025-03-29 10:32:11', '2025-03-29 11:23:38', NULL),
(14, 'Inno Wangsa', NULL, '', '', '', 'logo-client/inno-wangsa.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 141, '2025-03-29 10:33:08', '2025-03-29 10:33:08', NULL),
(15, 'INTRETECH (MALAYSIA) SDN BHD', NULL, '', '', '', 'logo-client/intretech-malaysia-sdn-bhd-1.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 151, '2025-03-29 10:33:40', '2025-03-29 10:33:40', NULL),
(16, 'KM Uniform Manufacturing', NULL, '', '', '', 'logo-client/km-uniform-manufacturing.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 129, '2025-03-29 10:34:08', '2025-03-29 10:34:08', NULL),
(17, 'Marujou', NULL, '', '', '', 'logo-client/marujou-1.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 149, '2025-03-29 10:35:10', '2025-03-29 10:35:10', NULL),
(18, 'Maruyama', NULL, '', '', '', 'logo-client/maruyama-1.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 126, '2025-03-29 10:36:02', '2025-03-29 10:36:02', NULL),
(19, 'Minebea Mitsumi', NULL, '', '', '', 'logo-client/minebea-mitsumi-1.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 140, '2025-03-29 10:38:16', '2025-03-29 10:38:16', NULL),
(20, 'Nakayama Khase', NULL, '', '', '', 'logo-client/nakayama-khase-1.png', NULL, NULL, '', 9, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 141, '2025-03-29 10:38:52', '2025-03-29 10:38:52', NULL),
(21, 'SANUBARI', NULL, '', '', '', 'logo-client/sanubari-2.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 107, '2025-03-29 10:39:17', '2025-03-29 10:43:17', NULL),
(22, 'Sime Darby', NULL, '', '', '', 'logo-client/sime-darby.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 137, '2025-03-29 10:39:49', '2025-03-29 10:39:49', NULL),
(23, 'Southern lion', NULL, '', '', '', 'logo-client/southern-lion-1.jpg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 108, '2025-03-29 10:40:19', '2025-03-29 10:40:19', NULL),
(24, 'Subway', NULL, '', '', '', 'logo-client/subway.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 171, '2025-03-29 10:41:00', '2025-03-29 10:41:00', NULL),
(25, 'TONG HEER FASTENERS CO. SDN BHD', NULL, '', '', '', 'logo-client/tong-heer-fasteners-co-sdn-bhd-1.jpeg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 170, '2025-03-29 10:41:23', '2025-03-29 10:41:23', NULL),
(26, 'TWP', NULL, '', '', '', 'logo-client/twp.png', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 158, '2025-03-29 10:41:46', '2025-03-29 10:41:46', NULL),
(27, 'HELISTROM SDN BHD', NULL, '', '', '', 'logo-client/helistrom-sdn-bhd.jpeg', NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 167, '2025-03-29 11:00:54', '2025-03-29 11:00:54', NULL),
(28, 'Kyushu Air Tech', NULL, '', '', '', 'logo-client/kyushu-air-tech-1.png', NULL, NULL, '', 9, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 146, '2025-03-29 11:14:47', '2025-03-29 11:14:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jb_companies_accounts`
--

CREATE TABLE `jb_companies_accounts` (
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_coupons`
--

CREATE TABLE `jb_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_currencies`
--

CREATE TABLE `jb_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_fields`
--

CREATE TABLE `jb_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 999,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `authorable_type` varchar(255) DEFAULT NULL,
  `authorable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_fields_translations`
--

CREATE TABLE `jb_custom_fields_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_custom_fields_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_options`
--

CREATE TABLE `jb_custom_field_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 999,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_options_translations`
--

CREATE TABLE `jb_custom_field_options_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_custom_field_options_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_values`
--

CREATE TABLE `jb_custom_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `reference_type` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_values_translations`
--

CREATE TABLE `jb_custom_field_values_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_custom_field_values_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_levels`
--

CREATE TABLE `jb_degree_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_levels_translations`
--

CREATE TABLE `jb_degree_levels_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_degree_levels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_types`
--

CREATE TABLE `jb_degree_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `degree_level_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_types_translations`
--

CREATE TABLE `jb_degree_types_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_degree_types_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_functional_areas`
--

CREATE TABLE `jb_functional_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_functional_areas`
--

INSERT INTO `jb_functional_areas` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hotel and Restaurants', 0, 0, 'published', '2024-04-11 10:12:27', '2024-04-11 10:12:27'),
(2, 'Manufacturing', 0, 0, 'published', '2024-04-11 10:12:50', '2024-04-11 10:12:50'),
(3, 'Security Service', 0, 0, 'published', '2024-04-11 10:13:16', '2024-04-11 10:13:16'),
(4, 'Healthcare', 0, 0, 'published', '2024-04-11 10:13:29', '2024-04-11 10:32:26'),
(5, 'Government', 0, 0, 'published', '2024-04-11 10:13:45', '2024-04-11 10:13:45'),
(6, 'Information Technology', 0, 0, 'published', '2024-04-11 10:14:00', '2024-04-11 10:14:00'),
(7, 'Construction and Engineering', 0, 0, 'published', '2024-04-11 10:14:32', '2024-04-11 10:28:27'),
(9, 'Hospitality and Tourism', 0, 0, 'published', '2024-04-11 10:29:29', '2024-04-11 10:29:29'),
(14, 'Transportation and Logistics', 0, 0, 'published', '2024-04-11 10:30:41', '2024-04-11 10:30:41'),
(15, 'Facility Services', 0, 0, 'published', '2024-04-11 10:30:57', '2024-04-11 10:30:57'),
(16, 'Property Services', 0, 0, 'published', '2024-04-11 10:31:19', '2024-04-11 10:31:19'),
(17, 'Marketing and Advertising', 0, 0, 'published', '2024-04-11 10:31:28', '2024-04-11 10:31:28'),
(18, 'Education', 0, 0, 'published', '2024-04-11 10:31:37', '2024-04-11 10:31:37'),
(19, 'Wellness and Personal Care', 0, 0, 'published', '2024-04-11 10:33:08', '2024-04-11 10:33:08');

-- --------------------------------------------------------

--
-- Table structure for table `jb_functional_areas_translations`
--

CREATE TABLE `jb_functional_areas_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_functional_areas_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_invoices`
--

CREATE TABLE `jb_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_invoice_items`
--

CREATE TABLE `jb_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `metadata` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs`
--

CREATE TABLE `jb_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `apply_url` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `is_freelance` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `career_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `salary_from` decimal(15,2) UNSIGNED DEFAULT NULL,
  `salary_to` decimal(15,2) UNSIGNED DEFAULT NULL,
  `salary_range` varchar(30) NOT NULL DEFAULT 'hour',
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `degree_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job_shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job_experience_id` bigint(20) UNSIGNED DEFAULT NULL,
  `functional_area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hide_salary` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_positions` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `expire_date` date DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_of_applied` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hide_company` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT 0,
  `external_apply_clicks` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `never_expired` tinyint(1) DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `moderation_status` varchar(60) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employer_colleagues` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `application_closing_date` date DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs`
--

INSERT INTO `jb_jobs` (`id`, `name`, `description`, `content`, `apply_url`, `company_id`, `address`, `country_id`, `state_id`, `city_id`, `city`, `is_freelance`, `career_level_id`, `salary_from`, `salary_to`, `salary_range`, `currency_id`, `degree_level_id`, `job_shift_id`, `job_experience_id`, `functional_area_id`, `hide_salary`, `number_of_positions`, `expire_date`, `author_id`, `author_type`, `views`, `number_of_applied`, `hide_company`, `latitude`, `longitude`, `auto_renew`, `external_apply_clicks`, `never_expired`, `is_featured`, `status`, `moderation_status`, `created_at`, `updated_at`, `employer_colleagues`, `start_date`, `application_closing_date`, `zip_code`) VALUES
(16, 'Security Guard', '', '', NULL, 11, '', 2, NULL, NULL, '[]', 0, NULL, 1500.00, NULL, 'hour', NULL, NULL, NULL, NULL, 0, 0, 150, '2025-05-13', NULL, 'Botble\\JobBoard\\Models\\Account', 143, 0, 0, NULL, NULL, 0, 0, NULL, 0, 'published', 'approved', '2025-03-29 10:22:00', '2025-03-29 10:55:24', '', '2025-03-01', '2025-05-15', NULL),
(17, 'General Worker', '', '', NULL, 13, '', 2, NULL, NULL, '[]', 0, NULL, NULL, NULL, 'hour', NULL, NULL, NULL, NULL, 0, 0, 75, '2025-05-13', NULL, 'Botble\\JobBoard\\Models\\Account', 207, 0, 0, NULL, NULL, 0, 0, NULL, 0, 'published', 'approved', '2025-03-29 10:46:00', '2025-03-29 10:46:00', '', '2025-03-18', '2025-04-30', NULL),
(18, 'Factory Workers', '', '', NULL, 27, '', 2, NULL, NULL, '[]', 0, NULL, 1500.00, NULL, 'hour', NULL, NULL, NULL, NULL, 2, 0, 10, '2025-05-13', NULL, 'Botble\\JobBoard\\Models\\Account', 215, 0, 0, NULL, NULL, 0, 0, NULL, 0, 'published', 'approved', '2025-03-29 11:05:20', '2025-03-29 11:12:08', '', '2025-03-28', '2025-05-29', NULL),
(19, 'Factory Workers', '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(12,41,87);font-size:16px;\"><span style=\"font-family:Barlow, sans-serif;font-style:normal;font-weight:400;text-align:left;word-spacing:0px;\">Country: Malaysia, Taman</span>  </span>  <br><span style=\"background-color:rgb(255,255,255);color:rgb(12,41,87);font-size:16px;\"><span style=\"font-family:Barlow, sans-serif;font-style:normal;font-weight:400;text-align:left;word-spacing:0px;\">Lot No: 296770</span>  </span>  <br><span style=\"background-color:rgb(255,255,255);color:rgb(12,41,87);font-size:16px;\"><span style=\"font-family:Barlow, sans-serif;font-style:normal;font-weight:400;text-align:left;word-spacing:0px;\">Interview Date: Dec 28, 2023</span>  </span>  <br><span style=\"background-color:rgb(255,255,255);color:rgb(12,41,87);font-size:16px;\"><span style=\"font-family:Barlow, sans-serif;font-style:normal;font-weight:400;text-align:left;word-spacing:0px;\">Quantity: 20</span>  </span></p><p><img class=\"image_resized\" style=\"width:75%;\" src=\"https://niceoverseaspl.com/storage/job-demand/whatsapp-image-2025-03-30-at-225528-71e1c602.jpg\" alt=\"WhatsApp Image 2025-03-30 at 22.55.28_71e1c602\" loading=\"lazy\" width=\"700\" height=\"1200\"><br> </p>', NULL, 28, '', 9, NULL, NULL, 'Kualalumpur', 0, NULL, 1500.00, NULL, 'hour', NULL, NULL, NULL, NULL, 0, 0, 20, '2025-05-13', NULL, 'Botble\\JobBoard\\Models\\Account', 177, 0, 0, NULL, NULL, 0, 0, NULL, 0, 'published', 'approved', '2025-03-29 11:17:38', '2025-04-06 22:27:37', '', '2025-03-23', '2025-05-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_categories`
--

CREATE TABLE `jb_jobs_categories` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs_categories`
--

INSERT INTO `jb_jobs_categories` (`job_id`, `category_id`) VALUES
(1, 7),
(2, 7),
(3, 10),
(5, 7),
(6, 7),
(9, 15),
(10, 7),
(11, 14),
(12, 7),
(13, 16),
(14, 17),
(15, 16),
(15, 2),
(17, 14),
(19, 14);

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_skills`
--

CREATE TABLE `jb_jobs_skills` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `job_skill_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_tags`
--

CREATE TABLE `jb_jobs_tags` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_translations`
--

CREATE TABLE `jb_jobs_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_jobs_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_types`
--

CREATE TABLE `jb_jobs_types` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `job_type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs_types`
--

INSERT INTO `jb_jobs_types` (`job_id`, `job_type_id`) VALUES
(1, 3),
(2, 5),
(15, 15),
(15, 16),
(19, 31);

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_experiences`
--

CREATE TABLE `jb_job_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_experiences_translations`
--

CREATE TABLE `jb_job_experiences_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_job_experiences_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_shifts`
--

CREATE TABLE `jb_job_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_shifts_translations`
--

CREATE TABLE `jb_job_shifts_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_job_shifts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_skills`
--

CREATE TABLE `jb_job_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_skills_translations`
--

CREATE TABLE `jb_job_skills_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_job_skills_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_types`
--

CREATE TABLE `jb_job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_job_types`
--

INSERT INTO `jb_job_types` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sous Chef', 0, 0, 'published', '2024-04-11 10:53:01', '2024-04-11 10:53:01'),
(2, 'Chef', 0, 0, 'published', '2024-04-11 10:53:14', '2024-04-11 10:53:14'),
(3, 'Cook', 0, 0, 'published', '2024-04-11 10:53:31', '2024-04-11 10:53:31'),
(4, 'Server', 0, 0, 'published', '2024-04-11 10:54:07', '2024-04-11 10:54:07'),
(5, 'Bartender', 0, 0, 'published', '2024-04-11 10:54:19', '2024-04-11 10:54:19'),
(6, 'Waiter/Waitress', 0, 0, 'published', '2024-04-11 10:54:29', '2024-04-11 10:54:29'),
(7, 'Dishwasher', 0, 0, 'published', '2024-04-11 10:54:38', '2024-04-11 10:54:38'),
(8, 'Housekeeping Supervisor', 0, 0, 'published', '2024-04-11 10:55:17', '2024-04-11 10:55:17'),
(9, 'Housekeeper', 0, 0, 'published', '2024-04-11 10:55:27', '2024-04-11 10:55:27'),
(10, 'Maintenance Technician', 0, 0, 'published', '2024-04-11 10:55:51', '2024-04-11 10:55:51'),
(11, 'Manager', 0, 0, 'published', '2024-04-11 10:56:03', '2024-04-11 10:56:03'),
(12, 'Supervisor', 0, 0, 'published', '2024-04-11 10:56:13', '2024-04-11 10:56:13'),
(13, 'Coordinator', 0, 0, 'published', '2024-04-11 10:56:26', '2024-04-11 10:56:26'),
(14, 'Officer', 0, 0, 'published', '2024-04-11 10:56:38', '2024-04-11 10:56:38'),
(15, 'Security Officer', 0, 0, 'published', '2024-04-11 10:57:16', '2024-04-11 10:57:16'),
(16, 'Security Guard', 0, 0, 'published', '2024-04-11 10:57:30', '2024-04-11 10:57:30'),
(17, 'Store Manager', 0, 0, 'published', '2024-04-11 10:58:50', '2024-04-11 10:58:50'),
(18, 'Store Keeper', 0, 0, 'published', '2024-04-11 10:59:02', '2024-04-11 10:59:02'),
(19, 'Sales Girl', 0, 0, 'published', '2024-04-11 10:59:54', '2024-04-11 10:59:54'),
(20, 'Sales Boy', 0, 0, 'published', '2024-04-11 11:00:07', '2024-04-11 11:00:07'),
(21, 'Sales Person', 0, 0, 'published', '2024-04-11 11:00:21', '2024-04-11 11:00:21'),
(22, 'Foreman', 0, 0, 'published', '2024-04-11 11:01:45', '2024-04-11 11:01:45'),
(23, 'Mason', 0, 0, 'published', '2024-04-11 11:01:57', '2024-04-11 11:01:57'),
(24, 'Plumber', 0, 0, 'published', '2024-04-11 11:02:07', '2024-04-11 11:02:07'),
(25, 'Welder', 0, 0, 'published', '2024-04-11 11:02:15', '2024-04-11 11:02:15'),
(26, 'Heavy Equipment Operator', 0, 0, 'published', '2024-04-11 11:02:25', '2024-04-11 11:02:25'),
(27, 'Laborer', 0, 0, 'published', '2024-04-11 11:02:34', '2024-04-11 11:02:34'),
(28, 'Landscaper', 0, 0, 'published', '2024-04-11 11:02:47', '2024-04-11 11:02:47'),
(29, 'Scaffolder', 0, 0, 'published', '2024-04-11 11:03:48', '2024-04-11 11:03:48'),
(30, 'Construction Worker', 0, 0, 'published', '2024-04-11 11:04:08', '2024-04-11 11:04:08'),
(31, 'General Worker', 0, 0, 'published', '2024-04-11 11:04:21', '2024-04-11 11:04:21'),
(32, 'Cleaner', 0, 0, 'published', '2024-04-11 11:04:33', '2024-04-11 11:04:33'),
(33, 'Spa Therapist', 0, 0, 'published', '2024-04-11 11:05:03', '2024-04-11 11:05:03'),
(34, 'Beautician', 0, 0, 'published', '2024-04-11 11:05:21', '2024-04-11 11:05:21'),
(35, 'Chambermaid', 0, 0, 'published', '2024-04-11 13:10:52', '2024-04-11 13:10:52'),
(36, 'Lorry Driver', 0, 0, 'published', '2024-04-11 13:11:14', '2024-04-11 13:11:14'),
(37, 'Gardener', 0, 0, 'published', '2024-04-11 13:11:46', '2024-04-11 13:11:46'),
(38, 'Domestic Worker', 0, 0, 'published', '2024-04-11 13:12:01', '2024-04-11 13:12:01'),
(39, 'Truck Driver', 0, 0, 'published', '2024-04-11 13:12:15', '2024-04-11 13:12:15'),
(40, 'Chef', 0, 0, 'published', '2024-04-11 13:12:33', '2024-04-11 13:12:33'),
(41, 'Domestic Worker', 0, 0, 'published', '2024-04-11 13:22:07', '2024-04-11 13:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_types_translations`
--

CREATE TABLE `jb_job_types_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_job_types_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_language_levels`
--

CREATE TABLE `jb_language_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_language_levels_translations`
--

CREATE TABLE `jb_language_levels_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_language_levels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_major_subjects`
--

CREATE TABLE `jb_major_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_packages`
--

CREATE TABLE `jb_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` double(15,2) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `percent_save` int(10) UNSIGNED DEFAULT 0,
  `number_of_listings` int(10) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `account_limit` int(10) UNSIGNED DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_packages_translations`
--

CREATE TABLE `jb_packages_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_packages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_reviews`
--

CREATE TABLE `jb_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reviewable_type` varchar(255) NOT NULL,
  `reviewable_id` bigint(20) UNSIGNED NOT NULL,
  `created_by_type` varchar(255) NOT NULL,
  `created_by_id` bigint(20) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `review` text NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_saved_jobs`
--

CREATE TABLE `jb_saved_jobs` (
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_tags`
--

CREATE TABLE `jb_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_tags_translations`
--

CREATE TABLE `jb_tags_translations` (
  `lang_code` varchar(255) NOT NULL,
  `jb_tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_transactions`
--

CREATE TABLE `jb_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `credits` int(10) UNSIGNED NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'add',
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `industry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `positions` int(11) DEFAULT NULL,
  `salary` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `image` varchar(60) DEFAULT NULL,
  `status` varchar(60) DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs_translations`
--

CREATE TABLE `jobs_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jobs_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `image` varchar(60) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_posts`
--

CREATE TABLE `job_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `location` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(120) NOT NULL,
  `lang_locale` varchar(20) NOT NULL,
  `lang_code` varchar(20) NOT NULL,
  `lang_flag` varchar(20) DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` bigint(20) UNSIGNED NOT NULL,
  `lang_meta_code` varchar(20) DEFAULT NULL,
  `lang_meta_origin` varchar(32) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `folder_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(348, 0, '1', '1', 8, 'image/png', 9730, 'testimonials/1.png', '[]', '2024-01-05 02:17:51', '2024-01-05 02:17:51', NULL),
(349, 0, '2', '2', 8, 'image/png', 9730, 'testimonials/2.png', '[]', '2024-01-05 02:17:51', '2024-01-05 02:17:51', NULL),
(350, 0, '3', '3', 8, 'image/png', 9730, 'testimonials/3.png', '[]', '2024-01-05 02:17:51', '2024-01-05 02:17:51', NULL),
(351, 0, '4', '4', 8, 'image/png', 9730, 'testimonials/4.png', '[]', '2024-01-05 02:17:51', '2024-01-05 02:17:51', NULL),
(387, 1, 'bCMS fav-01', 'bCMS fav-01', 4, 'image/png', 1053, 'logo/bcms-fav-01.png', '[]', '2024-03-23 03:26:32', '2024-03-23 03:26:32', NULL),
(388, 1, 'bCMS5454-02', 'bCMS5454-02', 4, 'image/jpeg', 213594, 'logo/bcms5454-02.jpg', '[]', '2024-03-23 03:27:22', '2024-03-23 03:27:22', NULL),
(389, 1, 'miraclehub-slider-1', 'miraclehub-slider-1', 13, 'image/jpeg', 463595, 'banners/miraclehub-slider-1.jpg', '[]', '2024-03-23 21:55:59', '2024-03-23 21:55:59', NULL),
(390, 1, 'miraclehub-slider-2', 'miraclehub-slider-2', 13, 'image/jpeg', 656610, 'banners/miraclehub-slider-2.jpg', '[]', '2024-03-23 21:56:04', '2024-03-23 21:56:04', NULL),
(392, 1, 'project-bg-1', 'project-bg-1', 13, 'image/jpeg', 55318, 'banners/project-bg-1.jpg', '[]', '2024-03-23 22:11:15', '2024-03-23 22:11:15', NULL),
(393, 1, 'Dr Bu-01', 'Dr Bu-01', 1, 'image/png', 351067, 'general/dr-bu-01.png', '[]', '2024-03-23 23:34:38', '2025-03-29 13:06:49', '2025-03-29 13:06:49'),
(394, 1, 'hr-consultancy-in-uae', 'hr-consultancy-in-uae', 14, 'image/jpeg', 204988, 'services/hr-consultancy-in-uae.jpg', '[]', '2024-03-24 00:36:35', '2024-03-24 00:36:35', NULL),
(396, 1, 'overseas-recruitment-services', 'overseas-recruitment-services', 14, 'image/jpeg', 283973, 'services/overseas-recruitment-services.jpg', '[]', '2024-03-24 00:36:44', '2024-03-24 00:36:44', NULL),
(397, 1, 'staffing-solutions', 'staffing-solutions', 14, 'image/jpeg', 312755, 'services/staffing-solutions.jpg', '[]', '2024-03-24 00:36:49', '2024-03-24 00:36:49', NULL),
(398, 1, 'sv-2-1', 'sv-2-1', 14, 'image/jpeg', 98710, 'services/sv-2-1.jpg', '[]', '2024-03-24 00:36:53', '2024-03-24 00:36:53', NULL),
(399, 1, 'sv-2-2', 'sv-2-2', 14, 'image/jpeg', 107378, 'services/sv-2-2.jpg', '[]', '2024-03-24 00:36:57', '2024-03-24 00:36:57', NULL),
(400, 1, 'sv-2-3', 'sv-2-3', 14, 'image/jpeg', 136765, 'services/sv-2-3.jpg', '[]', '2024-03-24 00:37:01', '2024-03-24 00:37:01', NULL),
(401, 1, 'sv-2-4', 'sv-2-4', 14, 'image/jpeg', 93913, 'services/sv-2-4.jpg', '[]', '2024-03-24 00:37:05', '2024-03-24 00:37:05', NULL),
(402, 1, 'footer-bg', 'footer-bg', 15, 'image/jpeg', 48335, 'backgrounds/footer-bg.jpg', '[]', '2024-03-24 00:54:36', '2024-03-24 00:54:36', NULL),
(403, 1, 'service-bg-1', 'service-bg-1', 15, 'image/png', 306231, 'backgrounds/service-bg-1.png', '[]', '2024-03-24 00:54:41', '2024-03-24 00:54:41', NULL),
(404, 1, 'overseas-recruitment-services', 'overseas-recruitment-services', 0, 'image/jpeg', 283973, 'overseas-recruitment-services.jpg', '[]', '2024-03-24 01:02:07', '2024-03-24 01:02:07', NULL),
(405, 1, 'manpower-supply-to-different-countries', 'manpower-supply-to-different-countries', 0, 'image/jpeg', 281112, 'manpower-supply-to-different-countries.jpg', '[]', '2024-03-24 01:20:35', '2024-03-24 01:20:35', NULL),
(406, 1, 'staffing-solutions', 'staffing-solutions', 0, 'image/jpeg', 312755, 'staffing-solutions.jpg', '[]', '2024-03-24 01:22:35', '2024-03-24 01:22:35', NULL),
(407, 1, 'team-1-1', 'team-1-1', 16, 'image/jpeg', 71819, 'team/team-1-1.jpg', '[]', '2024-03-24 01:40:00', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(408, 1, 'team-1-2', 'team-1-2', 16, 'image/jpeg', 70294, 'team/team-1-2.jpg', '[]', '2024-03-24 01:40:04', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(409, 1, 'team-1-3', 'team-1-3', 16, 'image/jpeg', 72487, 'team/team-1-3.jpg', '[]', '2024-03-24 01:40:08', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(410, 1, 'bua-miracle150-1', 'bua-miracle150-1', 1, 'image/png', 50958, 'general/bua-miracle150-1.png', '[]', '2024-03-24 01:54:49', '2025-03-29 13:06:49', '2025-03-29 13:06:49'),
(411, 1, 'about', 'about', 1, 'image/jpeg', 231646, 'general/about.jpg', '[]', '2024-03-24 01:54:54', '2025-03-29 13:06:49', '2025-03-29 13:06:49'),
(412, 1, 'mission-vision', 'mission-vision', 1, 'image/jpeg', 237531, 'general/mission-vision.jpg', '[]', '2024-03-24 01:54:59', '2025-03-29 13:08:28', '2025-03-29 13:08:28'),
(415, 1, 'bua-miracle150-1-1', 'bua-miracle150-1-1', 1, 'image/png', 50958, 'general/bua-miracle150-1-1.png', '[]', '2024-03-24 01:59:36', '2025-03-29 13:06:49', '2025-03-29 13:06:49'),
(416, 1, 'about-1', 'about-1', 1, 'image/jpeg', 231646, 'general/about-1.jpg', '[]', '2024-03-24 01:59:40', '2025-03-29 13:06:49', '2025-03-29 13:06:49'),
(432, 1, 'bua n miracle', 'bua n miracle', 4, 'image/png', 21613, 'logo/bua-n-miracle.png', '[]', '2024-03-29 02:18:24', '2025-04-06 15:39:42', '2025-04-06 15:39:42'),
(433, 1, 'bua n miracle fav 150', 'bua n miracle fav 150', 4, 'image/png', 16526, 'logo/bua-n-miracle-fav-150.png', '[]', '2024-03-29 02:18:43', '2025-04-06 15:39:42', '2025-04-06 15:39:42'),
(435, 1, 'miraclehub-slider-05', 'miraclehub-slider-05', 13, 'image/png', 1134733, 'banners/miraclehub-slider-05.png', '[]', '2024-03-31 04:37:50', '2024-03-31 04:37:50', NULL),
(436, 1, 'dr-bu-770', 'dr-bu-770', 20, 'image/jpeg', 275052, 'photos/dr-bu/dr-bu-770.jpg', '[]', '2024-03-31 04:50:06', '2025-06-11 22:50:54', '2025-06-11 22:50:54'),
(437, 1, 'bijay-md', 'bijay-md', 19, 'image/jpeg', 292271, 'photos/bijay-md.jpg', '[]', '2024-03-31 04:57:36', '2025-06-11 22:50:54', '2025-06-11 22:50:54'),
(438, 1, 'why-bua', 'why-bua', 21, 'image/jpeg', 276959, 'pages/why-bua.jpg', '[]', '2024-03-31 05:04:55', '2025-03-29 05:37:10', '2025-03-29 05:37:10'),
(439, 1, 'hr-consultancy-in-uae', 'hr-consultancy-in-uae', 21, 'image/jpeg', 204988, 'pages/hr-consultancy-in-uae.jpg', '[]', '2024-03-31 05:07:21', '2024-03-31 05:07:21', NULL),
(440, 1, 'overseas-recruitment-services', 'overseas-recruitment-services', 21, 'image/jpeg', 283973, 'pages/overseas-recruitment-services.jpg', '[]', '2024-03-31 05:10:21', '2024-03-31 05:10:21', NULL),
(441, 1, 'manpower-supply-to-different-countries', 'manpower-supply-to-different-countries', 21, 'image/jpeg', 281112, 'pages/manpower-supply-to-different-countries.jpg', '[]', '2024-03-31 05:11:38', '2024-03-31 05:11:38', NULL),
(442, 1, 'staffing-solutions', 'staffing-solutions', 21, 'image/jpeg', 312755, 'pages/staffing-solutions.jpg', '[]', '2024-03-31 05:12:56', '2024-03-31 05:12:56', NULL),
(463, 1, 'bua-miracle150-1', 'bua-miracle150-1', 4, 'image/png', 50958, 'logo/bua-miracle150-1.png', '[]', '2024-04-04 07:55:27', '2025-04-06 15:39:42', '2025-04-06 15:39:42'),
(464, 1, 'miracle-manpower150-1', 'miracle-manpower150-1', 4, 'image/png', 39701, 'logo/miracle-manpower150-1.png', '[]', '2024-04-04 07:55:28', '2025-04-06 15:39:42', '2025-04-06 15:39:42'),
(465, 1, 'bua-miracle-profile', 'bua-miracle-profile', 4, 'image/png', 73636, 'logo/bua-miracle-profile.png', '[]', '2024-04-04 07:56:34', '2025-04-06 15:39:42', '2025-04-06 15:39:42'),
(466, 1, 'miracle-nepal-profile', 'miracle-nepal-profile', 4, 'image/png', 71888, 'logo/miracle-nepal-profile.png', '[]', '2024-04-04 07:56:35', '2025-04-06 15:39:42', '2025-04-06 15:39:42'),
(473, 1, 'Cleaning-1', 'Cleaning-1', 18, 'image/jpeg', 186337, 'industries/cleaning-1.jpg', '[]', '2024-04-04 08:32:28', '2024-04-04 08:32:28', NULL),
(474, 1, 'Construction-1', 'Construction-1', 18, 'image/jpeg', 215609, 'industries/construction-1.jpg', '[]', '2024-04-04 08:32:29', '2024-04-04 08:32:29', NULL),
(475, 1, 'Hotel-1', 'Hotel-1', 18, 'image/jpeg', 213318, 'industries/hotel-1.jpg', '[]', '2024-04-04 08:32:31', '2024-04-04 08:32:31', NULL),
(476, 1, 'Operator-1', 'Operator-1', 18, 'image/jpeg', 289099, 'industries/operator-1.jpg', '[]', '2024-04-04 08:32:33', '2024-04-04 08:32:33', NULL),
(477, 1, 'Security-1', 'Security-1', 18, 'image/jpeg', 252460, 'industries/security-1.jpg', '[]', '2024-04-04 08:32:34', '2024-04-04 08:32:34', NULL),
(478, 1, 'Spa-1', 'Spa-1', 18, 'image/jpeg', 179771, 'industries/spa-1.jpg', '[]', '2024-04-04 08:32:35', '2024-04-04 08:32:35', NULL),
(480, 1, 'kitchen__cooking__restaurant__fork__chef__knife__hotel-512', 'kitchen__cooking__restaurant__fork__chef__knife__hotel-512', 3, 'image/png', 29484, 'icons/kitchen-cooking-restaurant-fork-chef-knife-hotel-512.png', '[]', '2024-04-04 23:16:36', '2024-04-04 23:16:36', NULL),
(560, 1, 'Kudu res1 copy', 'Kudu res1 copy', 28, 'image/png', 8945, 'company-logo/saudi/kudu-res1-copy.png', '[]', '2024-04-05 04:26:46', '2024-04-05 04:26:46', NULL),
(561, 1, '1216962 copy', '1216962 copy', 28, 'image/png', 20233, 'company-logo/saudi/1216962-copy.png', '[]', '2024-04-05 04:26:47', '2024-04-05 04:26:47', NULL),
(562, 1, 'Kudu res copy', 'Kudu res copy', 28, 'image/png', 18490, 'company-logo/saudi/kudu-res-copy.png', '[]', '2024-04-05 04:26:48', '2024-04-05 04:26:48', NULL),
(563, 1, 'agrifresh copy', 'agrifresh copy', 29, 'image/png', 77131, 'company-logo/canada/agrifresh-copy.png', '[]', '2024-04-05 04:27:00', '2024-04-05 04:27:00', NULL),
(570, 1, '2560px-Zara_Logo.svg copy', '2560px-Zara_Logo.svg copy', 30, 'image/png', 8477, 'company-logo/cyprus/2560px-zara-logosvg-copy.png', '[]', '2024-04-05 04:35:39', '2024-04-05 04:35:39', NULL),
(571, 1, 'Cyprus_ansot copy', 'Cyprus_ansot copy', 30, 'image/png', 34843, 'company-logo/cyprus/cyprus-ansot-copy.png', '[]', '2024-04-05 04:35:40', '2024-04-05 04:35:40', NULL),
(572, 1, 'E G ESTIACYPRUS1 copy', 'E G ESTIACYPRUS1 copy', 30, 'image/png', 17608, 'company-logo/cyprus/e-g-estiacyprus1-copy.png', '[]', '2024-04-05 04:35:41', '2024-04-05 04:35:41', NULL),
(573, 1, 'McDonald\'s_square_2020.svg copy', 'McDonald\'s_square_2020.svg copy', 30, 'image/png', 8383, 'company-logo/cyprus/mcdonalds-square-2020svg-copy.png', '[]', '2024-04-05 04:35:42', '2024-04-05 04:35:42', NULL),
(574, 1, 'orthodoxouemployment_03 copy', 'orthodoxouemployment_03 copy', 30, 'image/png', 47730, 'company-logo/cyprus/orthodoxouemployment-03-copy.png', '[]', '2024-04-05 04:35:43', '2024-04-05 04:35:43', NULL),
(575, 1, 'Red panda copy', 'Red panda copy', 30, 'image/png', 11040, 'company-logo/cyprus/red-panda-copy.png', '[]', '2024-04-05 04:35:44', '2024-04-05 04:35:44', NULL),
(576, 1, 'ADNOC-Logo copy', 'ADNOC-Logo copy', 31, 'image/png', 7935, 'company-logo/uae/adnoc-logo-copy.png', '[]', '2024-04-05 04:37:20', '2024-04-05 04:37:20', NULL),
(578, 1, 'albaida group-01 copy', 'albaida group-01 copy', 31, 'image/png', 8999, 'company-logo/uae/albaida-group-01-copy.png', '[]', '2024-04-05 04:37:22', '2024-04-05 04:37:22', NULL),
(579, 1, 'Asia Kitchen copy', 'Asia Kitchen copy', 31, 'image/png', 18867, 'company-logo/uae/asia-kitchen-copy.png', '[]', '2024-04-05 04:37:23', '2024-04-05 04:37:23', NULL),
(580, 1, 'Azmeer gas copy', 'Azmeer gas copy', 31, 'image/png', 84598, 'company-logo/uae/azmeer-gas-copy.png', '[]', '2024-04-05 04:37:24', '2024-04-05 04:37:24', NULL),
(581, 1, 'Bu Abdullah real estate copy', 'Bu Abdullah real estate copy', 31, 'image/png', 9391, 'company-logo/uae/bu-abdullah-real-estate-copy.png', '[]', '2024-04-05 04:37:25', '2024-04-05 04:37:25', NULL),
(582, 1, 'carrefour-uae copy', 'carrefour-uae copy', 31, 'image/png', 20502, 'company-logo/uae/carrefour-uae-copy.png', '[]', '2024-04-05 04:37:26', '2024-04-05 04:37:26', NULL),
(583, 1, 'etisalat copy', 'etisalat copy', 31, 'image/png', 12557, 'company-logo/uae/etisalat-copy.png', '[]', '2024-04-05 04:37:27', '2024-04-05 04:37:27', NULL),
(584, 1, 'ftyh4e5 copy', 'ftyh4e5 copy', 31, 'image/png', 18196, 'company-logo/uae/ftyh4e5-copy.png', '[]', '2024-04-05 04:37:28', '2024-04-05 04:37:28', NULL),
(585, 1, 'LuLu copy', 'LuLu copy', 31, 'image/png', 25680, 'company-logo/uae/lulu-copy.png', '[]', '2024-04-05 04:37:28', '2024-04-05 04:37:28', NULL),
(586, 1, 'nesto-hypermarket_ukch8b copy', 'nesto-hypermarket_ukch8b copy', 31, 'image/png', 24334, 'company-logo/uae/nesto-hypermarket-ukch8b-copy.png', '[]', '2024-04-05 04:37:29', '2024-04-05 04:37:29', NULL),
(587, 1, 'palm-hospitality-group-logo-new copy', 'palm-hospitality-group-logo-new copy', 31, 'image/png', 11517, 'company-logo/uae/palm-hospitality-group-logo-new-copy.png', '[]', '2024-04-05 04:37:30', '2024-04-05 04:37:30', NULL),
(588, 1, 'Royal falcon copy', 'Royal falcon copy', 31, 'image/png', 47964, 'company-logo/uae/royal-falcon-copy.png', '[]', '2024-04-05 04:37:31', '2024-04-05 04:37:31', NULL),
(589, 1, 'Baharain_INTERNATIONAL SECURITY copy', 'Baharain_INTERNATIONAL SECURITY copy', 27, 'image/png', 35763, 'company-logo/bahrain/baharain-international-security-copy.png', '[]', '2024-04-05 04:38:13', '2024-04-05 04:38:13', NULL),
(590, 1, 'my bakery copy', 'my bakery copy', 27, 'image/png', 21977, 'company-logo/bahrain/my-bakery-copy.png', '[]', '2024-04-05 04:38:13', '2024-04-05 04:38:13', NULL),
(591, 1, 'AL JAZEERA BAHRAIN copy', 'AL JAZEERA BAHRAIN copy', 27, 'image/png', 31480, 'company-logo/bahrain/al-jazeera-bahrain-copy.png', '[]', '2024-04-05 04:38:14', '2024-04-05 04:38:14', NULL),
(592, 1, 'Baharain_batsco', 'Baharain_batsco', 27, 'image/png', 22228, 'company-logo/bahrain/baharain-batsco.png', '[]', '2024-04-05 04:38:15', '2024-04-05 04:38:15', NULL),
(669, 1, 'australia_round_icon_640', 'australia_round_icon_640', 109, 'image/png', 14888, 'flags/australia-round-icon-640.png', '[]', '2024-04-05 07:48:02', '2024-04-05 07:48:02', NULL),
(670, 1, 'bahrain_640', 'bahrain_640', 109, 'image/png', 12874, 'flags/bahrain-640.png', '[]', '2024-04-05 07:48:03', '2024-04-05 07:48:03', NULL),
(671, 1, 'bulgaria_round_icon_640', 'bulgaria_round_icon_640', 109, 'image/png', 11223, 'flags/bulgaria-round-icon-640.png', '[]', '2024-04-05 07:48:03', '2024-04-05 07:48:03', NULL),
(672, 1, 'canada_round_icon_640', 'canada_round_icon_640', 109, 'image/png', 10505, 'flags/canada-round-icon-640.png', '[]', '2024-04-05 07:48:04', '2024-04-05 07:48:04', NULL),
(673, 1, 'croatia_640', 'croatia_640', 109, 'image/png', 15864, 'flags/croatia-640.png', '[]', '2024-04-05 07:48:05', '2024-04-05 07:48:05', NULL),
(674, 1, 'cyprus_640', 'cyprus_640', 109, 'image/png', 11022, 'flags/cyprus-640.png', '[]', '2024-04-05 07:48:06', '2024-04-05 07:48:06', NULL),
(675, 1, 'czech_republic_640', 'czech_republic_640', 109, 'image/png', 12286, 'flags/czech-republic-640.png', '[]', '2024-04-05 07:48:07', '2024-04-05 07:48:07', NULL),
(676, 1, 'european_union_640', 'european_union_640', 109, 'image/png', 15972, 'flags/european-union-640.png', '[]', '2024-04-05 07:48:08', '2024-04-05 07:48:08', NULL),
(677, 1, 'finland_round_icon_640', 'finland_round_icon_640', 109, 'image/png', 11251, 'flags/finland-round-icon-640.png', '[]', '2024-04-05 07:48:08', '2024-04-05 07:48:08', NULL),
(678, 1, 'france_round_icon_640', 'france_round_icon_640', 109, 'image/png', 11625, 'flags/france-round-icon-640.png', '[]', '2024-04-05 07:48:09', '2024-04-05 07:48:09', NULL),
(679, 1, 'germany_round_icon_640', 'germany_round_icon_640', 109, 'image/png', 11261, 'flags/germany-round-icon-640.png', '[]', '2024-04-05 07:48:10', '2024-04-05 07:48:10', NULL),
(680, 1, 'greece_round_icon_640', 'greece_round_icon_640', 109, 'image/png', 10702, 'flags/greece-round-icon-640.png', '[]', '2024-04-05 07:48:11', '2024-04-05 07:48:11', NULL),
(681, 1, 'hungary_640', 'hungary_640', 109, 'image/png', 10841, 'flags/hungary-640.png', '[]', '2024-04-05 07:48:12', '2024-04-05 07:48:12', NULL),
(682, 1, 'ireland_round_icon_640', 'ireland_round_icon_640', 109, 'image/png', 11494, 'flags/ireland-round-icon-640.png', '[]', '2024-04-05 07:48:13', '2024-04-05 07:48:13', NULL),
(683, 1, 'israel_round_icon_640', 'israel_round_icon_640', 109, 'image/png', 12079, 'flags/israel-round-icon-640.png', '[]', '2024-04-05 07:48:13', '2024-04-05 07:48:13', NULL),
(684, 1, 'japan_round_icon_640', 'japan_round_icon_640', 109, 'image/png', 9759, 'flags/japan-round-icon-640.png', '[]', '2024-04-05 07:48:14', '2024-04-05 07:48:14', NULL),
(685, 1, 'korea_south_round_icon_640', 'korea_south_round_icon_640', 109, 'image/png', 13138, 'flags/korea-south-round-icon-640.png', '[]', '2024-04-05 07:48:15', '2024-04-05 07:48:15', NULL),
(686, 1, 'kuwait_640', 'kuwait_640', 109, 'image/png', 11282, 'flags/kuwait-640.png', '[]', '2024-04-05 07:48:16', '2024-04-05 07:48:16', NULL),
(687, 1, 'luxembourg_round_icon_640', 'luxembourg_round_icon_640', 109, 'image/png', 10557, 'flags/luxembourg-round-icon-640.png', '[]', '2024-04-05 07:48:17', '2024-04-05 07:48:17', NULL),
(688, 1, 'macao_round_icon_640', 'macao_round_icon_640', 109, 'image/png', 16941, 'flags/macao-round-icon-640.png', '[]', '2024-04-05 07:48:17', '2024-04-05 07:48:17', NULL),
(689, 1, 'malaysia_640', 'malaysia_640', 109, 'image/png', 14714, 'flags/malaysia-640.png', '[]', '2024-04-05 07:48:18', '2024-04-05 07:48:18', NULL),
(690, 1, 'malta_640', 'malta_640', 109, 'image/png', 11747, 'flags/malta-640.png', '[]', '2024-04-05 07:48:19', '2024-04-05 07:48:19', NULL),
(691, 1, 'nepal_640', 'nepal_640', 109, 'image/png', 14366, 'flags/nepal-640.png', '[]', '2024-04-05 07:48:20', '2024-04-05 07:48:20', NULL),
(692, 1, 'new_zealand_round_icon_640', 'new_zealand_round_icon_640', 109, 'image/png', 15761, 'flags/new-zealand-round-icon-640.png', '[]', '2024-04-05 07:48:21', '2024-04-05 07:48:21', NULL),
(693, 1, 'norway_round_icon_640', 'norway_round_icon_640', 109, 'image/png', 13168, 'flags/norway-round-icon-640.png', '[]', '2024-04-05 07:48:22', '2024-04-05 07:48:22', NULL),
(694, 1, 'oman_round_icon_640', 'oman_round_icon_640', 109, 'image/png', 12672, 'flags/oman-round-icon-640.png', '[]', '2024-04-05 07:48:23', '2024-04-05 07:48:23', NULL),
(695, 1, 'poland_640', 'poland_640', 109, 'image/png', 10350, 'flags/poland-640.png', '[]', '2024-04-05 07:48:23', '2024-04-05 07:48:23', NULL),
(696, 1, 'portugal_round_icon_640', 'portugal_round_icon_640', 109, 'image/png', 17510, 'flags/portugal-round-icon-640.png', '[]', '2024-04-05 07:48:24', '2024-04-05 07:48:24', NULL),
(697, 1, 'qatar_640', 'qatar_640', 109, 'image/png', 13427, 'flags/qatar-640.png', '[]', '2024-04-05 07:48:25', '2024-04-05 07:48:25', NULL),
(698, 1, 'romania_640', 'romania_640', 109, 'image/png', 12997, 'flags/romania-640.png', '[]', '2024-04-05 07:48:26', '2024-04-05 07:48:26', NULL),
(699, 1, 'saudi_arabia_640', 'saudi_arabia_640', 109, 'image/png', 18029, 'flags/saudi-arabia-640.png', '[]', '2024-04-05 07:48:26', '2024-04-05 07:48:26', NULL),
(700, 1, 'singapore_round_icon_640', 'singapore_round_icon_640', 109, 'image/png', 11517, 'flags/singapore-round-icon-640.png', '[]', '2024-04-05 07:48:27', '2024-04-05 07:48:27', NULL),
(701, 1, 'slovakia_round_icon_640', 'slovakia_round_icon_640', 109, 'image/png', 14596, 'flags/slovakia-round-icon-640.png', '[]', '2024-04-05 07:48:28', '2024-04-05 07:48:28', NULL),
(702, 1, 'spain_round_icon_640', 'spain_round_icon_640', 109, 'image/png', 15426, 'flags/spain-round-icon-640.png', '[]', '2024-04-05 07:48:29', '2024-04-05 07:48:29', NULL),
(703, 1, 'switzerland_round_icon_640', 'switzerland_round_icon_640', 109, 'image/png', 11806, 'flags/switzerland-round-icon-640.png', '[]', '2024-04-05 07:48:29', '2024-04-05 07:48:29', NULL),
(704, 1, 'turkey_round_icon_640', 'turkey_round_icon_640', 109, 'image/png', 14027, 'flags/turkey-round-icon-640.png', '[]', '2024-04-05 07:48:30', '2024-04-05 07:48:30', NULL),
(705, 1, 'united_arab_emirates_640', 'united_arab_emirates_640', 109, 'image/png', 10990, 'flags/united-arab-emirates-640.png', '[]', '2024-04-05 07:48:31', '2024-04-05 07:48:31', NULL),
(706, 1, 'united_kingdom_round_icon_640', 'united_kingdom_round_icon_640', 109, 'image/png', 16109, 'flags/united-kingdom-round-icon-640.png', '[]', '2024-04-05 07:48:32', '2024-04-05 07:48:32', NULL),
(707, 1, 'Asia Kitchen copy', 'Asia Kitchen copy', 110, 'image/png', 18867, 'company-logo-1/asia-kitchen-copy.png', '[]', '2024-04-06 01:58:11', '2024-04-06 01:58:11', NULL),
(708, 1, 'Azmeer gas copy', 'Azmeer gas copy', 110, 'image/png', 84598, 'company-logo-1/azmeer-gas-copy.png', '[]', '2024-04-06 01:58:13', '2024-04-06 01:58:13', NULL),
(709, 1, 'Bu Abdullah real estate copy', 'Bu Abdullah real estate copy', 110, 'image/png', 9391, 'company-logo-1/bu-abdullah-real-estate-copy.png', '[]', '2024-04-06 01:58:13', '2024-04-06 01:58:13', NULL),
(712, 1, 'Company profile', 'Company profile', 25, 'image/jpeg', 236153, 'company-profile/company-profile.jpg', '[]', '2024-04-06 03:23:57', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(713, 1, 'miracle employers', 'miracle employers', 25, 'image/jpeg', 260553, 'company-profile/miracle-employers.jpg', '[]', '2024-04-06 03:23:59', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(714, 1, 'miracle job seekers', 'miracle job seekers', 25, 'image/jpeg', 216012, 'company-profile/miracle-job-seekers.jpg', '[]', '2024-04-06 03:28:53', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(715, 1, 'Global Manpower Solution', 'Global Manpower Solution', 14, 'image/jpeg', 73902, 'services/global-manpower-solution.jpg', '[]', '2024-04-06 09:33:51', '2024-04-06 09:33:51', NULL),
(716, 1, 'HR consultancy (1)', 'HR consultancy (1)', 14, 'image/jpeg', 65371, 'services/hr-consultancy-1.jpg', '[]', '2024-04-06 09:33:53', '2024-04-06 09:33:53', NULL),
(717, 1, 'Overseas Recruitment Services', 'Overseas Recruitment Services', 14, 'image/jpeg', 72409, 'services/overseas-recruitment-services.jpg', '[]', '2024-04-06 09:33:54', '2024-04-06 09:33:54', NULL),
(718, 1, 'Staffing Solution (8)', 'Staffing Solution (8)', 14, 'image/jpeg', 46180, 'services/staffing-solution-8.jpg', '[]', '2024-04-06 09:33:55', '2024-04-06 09:33:55', NULL),
(719, 1, 'Overseas Recruitment Services-1', 'Overseas Recruitment Services-1', 14, 'image/jpeg', 72409, 'services/overseas-recruitment-services-1.jpg', '[]', '2024-04-06 09:41:58', '2024-04-06 09:41:58', NULL),
(720, 1, 'Staffing Solution (10)', 'Staffing Solution (10)', 14, 'image/jpeg', 59348, 'services/staffing-solution-10.jpg', '[]', '2024-04-06 09:55:46', '2024-04-06 09:55:46', NULL),
(721, 1, 'Staffing Solution (10)a', 'Staffing Solution (10)a', 14, 'image/jpeg', 60200, 'services/staffing-solution-10a.jpg', '[]', '2024-04-06 09:55:47', '2024-04-06 09:55:47', NULL),
(722, 1, 'BMiracle employer', 'BMiracle employer', 3, 'image/png', 7542, 'icons/bmiracle-employer.png', '[]', '2024-04-06 10:55:00', '2024-04-06 10:55:00', NULL),
(723, 1, 'BMiracle Job seeker', 'BMiracle Job seeker', 3, 'image/png', 9723, 'icons/bmiracle-job-seeker.png', '[]', '2024-04-06 10:55:01', '2024-04-06 10:55:01', NULL),
(724, 1, 'BMiracle profile', 'BMiracle profile', 3, 'image/png', 6630, 'icons/bmiracle-profile.png', '[]', '2024-04-06 10:55:02', '2024-04-06 10:55:02', NULL),
(726, 1, 'Pravin Tandan', 'Pravin Tandan', 16, 'image/png', 59598, 'team/pravin-tandan.png', '[]', '2024-04-10 12:18:12', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(727, 1, 'miracle-gallery 12', 'miracle-gallery 12', 112, 'image/jpeg', 74654, 'gallery/business-partners/miracle-gallery-12.jpg', '[]', '2024-04-14 11:19:21', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(728, 1, 'miracle-gallery8', 'miracle-gallery8', 112, 'image/jpeg', 86435, 'gallery/business-partners/miracle-gallery8.jpg', '[]', '2024-04-14 11:19:22', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(729, 1, 'miracle-gallery7', 'miracle-gallery7', 112, 'image/jpeg', 84735, 'gallery/business-partners/miracle-gallery7.jpg', '[]', '2024-04-14 11:19:24', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(730, 1, 'miracle-gallery6', 'miracle-gallery6', 112, 'image/jpeg', 94613, 'gallery/business-partners/miracle-gallery6.jpg', '[]', '2024-04-14 11:19:26', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(731, 1, 'miracle-gallery5', 'miracle-gallery5', 112, 'image/jpeg', 73515, 'gallery/business-partners/miracle-gallery5.jpg', '[]', '2024-04-14 11:19:27', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(732, 1, 'miracle-gallery4', 'miracle-gallery4', 112, 'image/jpeg', 76237, 'gallery/business-partners/miracle-gallery4.jpg', '[]', '2024-04-14 11:19:28', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(733, 1, 'miracle-gallery3', 'miracle-gallery3', 112, 'image/jpeg', 77241, 'gallery/business-partners/miracle-gallery3.jpg', '[]', '2024-04-14 11:19:29', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(734, 1, 'miracle-gallery2', 'miracle-gallery2', 112, 'image/jpeg', 85599, 'gallery/business-partners/miracle-gallery2.jpg', '[]', '2024-04-14 11:19:30', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(735, 1, 'miracle-gallery1', 'miracle-gallery1', 112, 'image/jpeg', 63683, 'gallery/business-partners/miracle-gallery1.jpg', '[]', '2024-04-14 11:19:31', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(736, 1, 'miracle-gallery 14', 'miracle-gallery 14', 112, 'image/jpeg', 78677, 'gallery/business-partners/miracle-gallery-14.jpg', '[]', '2024-04-14 11:19:32', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(737, 1, 'miracle-gallery 13', 'miracle-gallery 13', 112, 'image/jpeg', 106074, 'gallery/business-partners/miracle-gallery-13.jpg', '[]', '2024-04-14 11:19:33', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(738, 1, 'miracle-gallery9', 'miracle-gallery9', 113, 'image/jpeg', 102752, 'gallery/activities/miracle-gallery9.jpg', '[]', '2024-04-14 11:19:57', '2025-03-29 05:11:58', '2025-03-29 05:11:58'),
(739, 1, 'miracle-gallery10', 'miracle-gallery10', 113, 'image/jpeg', 75374, 'gallery/activities/miracle-gallery10.jpg', '[]', '2024-04-14 11:19:59', '2025-03-29 05:11:58', '2025-03-29 05:11:58'),
(740, 1, 'miracle-gallery 11', 'miracle-gallery 11', 113, 'image/jpeg', 85151, 'gallery/activities/miracle-gallery-11.jpg', '[]', '2024-04-14 11:20:00', '2025-03-29 05:11:58', '2025-03-29 05:11:58'),
(741, 1, '454545', '454545', 111, 'image/jpeg', 775220, 'gallery/454545.jpg', '[]', '2024-04-14 11:24:04', '2024-05-03 02:59:37', '2024-05-03 02:59:37'),
(742, 1, 'Dipendra-Airi-2', 'Dipendra-Airi-2', 111, 'image/jpeg', 35123, 'gallery/dipendra-airi-2.jpg', '[]', '2024-04-14 11:24:04', '2024-05-03 02:59:37', '2024-05-03 02:59:37'),
(743, 1, 'manager g', 'manager g', 16, 'image/png', 9259, 'team/manager-g.png', '[]', '2024-04-17 08:05:23', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(744, 1, 'manager b-07', 'manager b-07', 16, 'image/png', 24646, 'team/manager-b-07.png', '[]', '2024-04-17 08:16:22', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(745, 1, 'Pravin Tandan-06', 'Pravin Tandan-06', 16, 'image/png', 61670, 'team/pravin-tandan-06.png', '[]', '2024-04-17 10:21:21', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(746, 1, 'Naresh Bohara-05', 'Naresh Bohara-05', 16, 'image/png', 56755, 'team/naresh-bohara-05.png', '[]', '2024-04-17 10:21:22', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(747, 1, 'Dr Bu', 'Dr Bu', 20, 'image/jpeg', 30757, 'photos/dr-bu/dr-bu.jpg', '[]', '2024-04-18 10:05:31', '2025-06-11 22:50:54', '2025-06-11 22:50:54'),
(748, 1, 'Bua and Miracle_Profile', 'Bua and Miracle_Profile', 25, 'application/pdf', 28962071, 'company-profile/bua-and-miracle-profile.pdf', '[]', '2024-04-22 11:32:02', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(750, 1, 'Miracle Manpower Profile-2', 'Miracle Manpower Profile-2', 25, 'application/pdf', 36033801, 'company-profile/miracle-manpower-profile-2.pdf', '[]', '2024-04-22 11:48:06', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(751, 1, 'bua and miracle at a glance', 'bua and miracle at a glance', 25, 'image/jpeg', 294142, 'company-profile/bua-and-miracle-at-a-glance.jpg', '[]', '2024-04-24 21:22:06', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(752, 1, 'Pro Hire Team', 'Pro Hire Team', 112, 'image/jpeg', 748069, 'gallery/business-partners/pro-hire-team.jpg', '[]', '2024-05-03 02:57:52', '2025-03-29 04:58:43', '2025-03-29 04:58:43'),
(753, 1, 'miracle pic (5)', 'miracle pic (5)', 113, 'image/jpeg', 96332, 'gallery/activities/miracle-pic-5.jpg', '[]', '2024-05-03 03:06:31', '2025-03-29 05:11:58', '2025-03-29 05:11:58'),
(754, 1, 'miracle pic (3)', 'miracle pic (3)', 113, 'image/jpeg', 83862, 'gallery/activities/miracle-pic-3.jpg', '[]', '2024-05-03 03:06:32', '2025-03-29 05:11:58', '2025-03-29 05:11:58'),
(755, 1, 'miracle pic (4)', 'miracle pic (4)', 113, 'image/jpeg', 81797, 'gallery/activities/miracle-pic-4.jpg', '[]', '2024-05-03 03:06:34', '2025-03-29 05:11:58', '2025-03-29 05:11:58'),
(756, 1, 'Sujan basnet', 'Sujan basnet', 16, 'image/jpeg', 12011, 'team/sujan-basnet.jpg', '[]', '2024-08-07 19:36:48', '2025-03-29 05:41:03', '2025-03-29 05:41:03'),
(757, 1, 'nice-iso-certificate-712x1024-1', 'nice-iso-certificate-712x1024-1', 114, 'image/jpeg', 83216, 'legal-docs/nice-iso-certificate-712x1024-1.jpg', '[]', '2025-03-29 04:52:22', '2025-03-29 04:52:22', NULL),
(758, 1, 'rba-training-1', 'rba-training-1', 114, 'image/jpeg', 69707, 'legal-docs/rba-training-1.jpg', '[]', '2025-03-29 04:52:22', '2025-03-29 04:52:22', NULL),
(759, 1, 'rba-training-certificates-2-682x1024-1', 'rba-training-certificates-2-682x1024-1', 114, 'image/jpeg', 89293, 'legal-docs/rba-training-certificates-2-682x1024-1.jpg', '[]', '2025-03-29 04:52:23', '2025-03-29 04:52:23', NULL),
(760, 1, 'rba-training-certificates-3', 'rba-training-certificates-3', 114, 'image/jpeg', 99804, 'legal-docs/rba-training-certificates-3.jpg', '[]', '2025-03-29 04:52:24', '2025-03-29 04:52:24', NULL),
(761, 1, 'intro-employers', 'intro-employers', 115, 'image/jpeg', 51782, 'intro-block/intro-employers.jpg', '[]', '2025-03-29 04:54:46', '2025-03-29 04:54:46', NULL),
(762, 1, 'intro-jobseekers', 'intro-jobseekers', 115, 'image/jpeg', 37341, 'intro-block/intro-jobseekers.jpg', '[]', '2025-03-29 04:54:48', '2025-03-29 04:54:48', NULL),
(763, 1, 'intro-profile1', 'intro-profile1', 115, 'image/jpeg', 22204, 'intro-block/intro-profile1.jpg', '[]', '2025-03-29 04:54:49', '2025-03-29 04:54:49', NULL),
(764, 1, 'nice-overseas-2025', 'nice-overseas-2025', 115, 'application/pdf', 8318835, 'intro-block/nice-overseas-2025.pdf', '[]', '2025-03-29 04:55:02', '2025-04-11 13:55:14', '2025-04-11 13:55:14'),
(765, 1, 'Nice Overseas (1)', 'Nice Overseas (1)', 112, 'image/jpeg', 149378, 'gallery/business-partners/nice-overseas-1.jpg', '[]', '2025-03-29 04:59:00', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(766, 1, 'Nice Overseas (2)', 'Nice Overseas (2)', 112, 'image/jpeg', 167490, 'gallery/business-partners/nice-overseas-2.jpeg', '[]', '2025-03-29 04:59:01', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(767, 1, 'Nice Overseas (2)-1', 'Nice Overseas (2)-1', 112, 'image/jpeg', 114802, 'gallery/business-partners/nice-overseas-2-1.jpg', '[]', '2025-03-29 04:59:02', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(768, 1, 'Nice Overseas (3)', 'Nice Overseas (3)', 112, 'image/jpeg', 167573, 'gallery/business-partners/nice-overseas-3.jpeg', '[]', '2025-03-29 04:59:04', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(769, 1, 'Nice Overseas (3)-1', 'Nice Overseas (3)-1', 112, 'image/jpeg', 167282, 'gallery/business-partners/nice-overseas-3-1.jpg', '[]', '2025-03-29 04:59:05', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(770, 1, 'Nice Overseas (4)', 'Nice Overseas (4)', 112, 'image/jpeg', 155588, 'gallery/business-partners/nice-overseas-4.jpg', '[]', '2025-03-29 04:59:06', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(771, 1, 'Nice Overseas (5)', 'Nice Overseas (5)', 112, 'image/jpeg', 162499, 'gallery/business-partners/nice-overseas-5.jpg', '[]', '2025-03-29 04:59:06', '2025-03-29 05:02:47', '2025-03-29 05:02:47'),
(772, 1, 'Nice Overseas (1)', 'Nice Overseas (1)', 116, 'image/jpeg', 149378, 'gallery/activities-1/nice-overseas-1.jpg', '[]', '2025-03-29 05:03:16', '2025-03-29 05:03:16', NULL),
(773, 1, 'Nice Overseas (2)', 'Nice Overseas (2)', 116, 'image/jpeg', 167490, 'gallery/activities-1/nice-overseas-2.jpeg', '[]', '2025-03-29 05:03:17', '2025-03-29 05:03:17', NULL),
(774, 1, 'Nice Overseas (2)-1', 'Nice Overseas (2)-1', 116, 'image/jpeg', 114802, 'gallery/activities-1/nice-overseas-2-1.jpg', '[]', '2025-03-29 05:03:17', '2025-03-29 05:03:17', NULL),
(775, 1, 'Nice Overseas (3)', 'Nice Overseas (3)', 116, 'image/jpeg', 167573, 'gallery/activities-1/nice-overseas-3.jpeg', '[]', '2025-03-29 05:03:19', '2025-03-29 05:03:19', NULL),
(776, 1, 'Nice Overseas (3)-1', 'Nice Overseas (3)-1', 116, 'image/jpeg', 167282, 'gallery/activities-1/nice-overseas-3-1.jpg', '[]', '2025-03-29 05:03:20', '2025-03-29 05:03:20', NULL),
(777, 1, 'Nice Overseas (4)', 'Nice Overseas (4)', 116, 'image/jpeg', 155588, 'gallery/activities-1/nice-overseas-4.jpg', '[]', '2025-03-29 05:03:21', '2025-03-29 05:03:21', NULL),
(778, 1, 'Nice Overseas (5)', 'Nice Overseas (5)', 116, 'image/jpeg', 162499, 'gallery/activities-1/nice-overseas-5.jpg', '[]', '2025-03-29 05:03:22', '2025-03-29 05:03:22', NULL),
(779, 1, 'nice-fav', 'nice-fav', 117, 'image/png', 3904, 'logo-nice/nice-fav.png', '[]', '2025-03-29 05:06:36', '2025-03-29 05:06:36', NULL),
(780, 1, 'nicelogo', 'nicelogo', 117, 'image/jpeg', 6100, 'logo-nice/nicelogo.jpg', '[]', '2025-03-29 05:06:37', '2025-03-29 05:06:37', NULL),
(781, 1, 'nice-teams-karan', 'nice-teams-karan', 16, 'image/jpeg', 31197, 'team/nice-teams-karan.jpg', '[]', '2025-03-29 05:41:58', '2025-03-29 05:41:58', NULL),
(782, 1, 'nice-teams-krishna', 'nice-teams-krishna', 16, 'image/jpeg', 27742, 'team/nice-teams-krishna.jpg', '[]', '2025-03-29 05:41:58', '2025-03-29 05:41:58', NULL),
(783, 1, 'nice-teams-suresh', 'nice-teams-suresh', 16, 'image/jpeg', 30255, 'team/nice-teams-suresh.jpg', '[]', '2025-03-29 05:42:00', '2025-03-29 05:42:00', NULL),
(784, 1, 'nice banner1', 'nice banner1', 119, 'image/jpeg', 170457, 'banner/nice-banner1.jpg', '[]', '2025-03-29 05:58:08', '2025-03-29 05:58:08', NULL),
(785, 1, 'nice banner2', 'nice banner2', 119, 'image/jpeg', 282140, 'banner/nice-banner2.jpg', '[]', '2025-03-29 05:58:11', '2025-03-29 05:58:11', NULL),
(786, 1, 'Overseas-Recruitment', 'Overseas-Recruitment', 119, 'image/jpeg', 250034, 'banner/overseas-recruitment.jpeg', '[]', '2025-03-29 05:58:19', '2025-03-29 05:58:19', NULL),
(787, 1, 'karan2', 'karan2', 16, 'image/png', 1350562, 'team/karan2.png', '[]', '2025-03-29 07:52:23', '2025-03-29 07:52:23', NULL),
(788, 1, 'mdkaran', 'mdkaran', 16, 'image/png', 232604, 'team/mdkaran.png', '[]', '2025-03-29 07:52:24', '2025-03-29 12:52:05', '2025-03-29 12:52:05'),
(789, 1, '140836-tm140836', '140836-tm140836', 118, 'image/jpeg', 4418, 'logo-client/140836-tm140836.jpg', '[]', '2025-03-29 09:53:00', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(790, 1, '1467089733_logo-innowangsa', '1467089733_logo-innowangsa', 118, 'image/png', 22401, 'logo-client/1467089733-logo-innowangsa.png', '[]', '2025-03-29 09:53:01', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(791, 1, 'afra', 'afra', 118, 'image/jpeg', 12890, 'logo-client/afra.jpg', '[]', '2025-03-29 09:53:02', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(792, 1, 'dnp logo', 'dnp logo', 118, 'image/png', 15239, 'logo-client/dnp-logo.png', '[]', '2025-03-29 09:53:03', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(793, 1, 'felda', 'felda', 118, 'image/jpeg', 4474, 'logo-client/felda.jpg', '[]', '2025-03-29 09:53:03', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(794, 1, 'foxconn', 'foxconn', 118, 'image/jpeg', 10918, 'logo-client/foxconn.jpg', '[]', '2025-03-29 09:53:04', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(795, 1, 'INTRETECH (MALAYSIA) SDN BHD', 'INTRETECH (MALAYSIA) SDN BHD', 118, 'image/png', 68200, 'logo-client/intretech-malaysia-sdn-bhd.png', '[]', '2025-03-29 09:53:05', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(796, 1, 'KDN', 'KDN', 118, 'image/jpeg', 10631, 'logo-client/kdn.jpg', '[]', '2025-03-29 09:53:06', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(797, 1, 'Marujou', 'Marujou', 118, 'image/png', 5063, 'logo-client/marujou.png', '[]', '2025-03-29 09:53:07', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(798, 1, 'maruyama', 'maruyama', 118, 'image/jpeg', 34637, 'logo-client/maruyama.jpg', '[]', '2025-03-29 09:53:07', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(799, 1, 'mitsumi', 'mitsumi', 118, 'image/png', 20569, 'logo-client/mitsumi.png', '[]', '2025-03-29 09:53:08', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(800, 1, 'Nakayama Khase', 'Nakayama Khase', 118, 'image/png', 3636, 'logo-client/nakayama-khase.png', '[]', '2025-03-29 09:53:09', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(801, 1, 'SANUBARI', 'SANUBARI', 118, 'image/gif', 18825, 'logo-client/sanubari.gif', '[]', '2025-03-29 09:53:10', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(802, 1, 'southern lion', 'southern lion', 118, 'image/jpeg', 12414, 'logo-client/southern-lion.jpg', '[]', '2025-03-29 09:53:10', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(803, 1, 'Subway_Logo', 'Subway_Logo', 118, 'image/png', 388109, 'logo-client/subway-logo.png', '[]', '2025-03-29 09:53:12', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(804, 1, 'TONG HEER FASTENERS CO. SDN BHD', 'TONG HEER FASTENERS CO. SDN BHD', 118, 'image/jpeg', 11153, 'logo-client/tong-heer-fasteners-co-sdn-bhd.jpeg', '[]', '2025-03-29 09:53:12', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(805, 1, 'twp logo', 'twp logo', 118, 'image/png', 23943, 'logo-client/twp-logo.png', '[]', '2025-03-29 09:53:13', '2025-03-29 09:57:46', '2025-03-29 09:57:46'),
(806, 1, 'Afra Services', 'Afra Services', 118, 'image/jpeg', 12890, 'logo-client/afra-services.jpg', '[]', '2025-03-29 09:57:57', '2025-03-29 09:57:57', NULL),
(807, 1, 'Felda-1', 'Felda-1', 118, 'image/jpeg', 4474, 'logo-client/felda-1.jpg', '[]', '2025-03-29 09:57:58', '2025-03-29 09:57:58', NULL),
(808, 1, 'Foxconn-1', 'Foxconn-1', 118, 'image/jpeg', 10918, 'logo-client/foxconn-1.jpg', '[]', '2025-03-29 09:57:59', '2025-03-29 11:23:08', '2025-03-29 11:23:08'),
(809, 1, 'Inno Wangsa', 'Inno Wangsa', 118, 'image/png', 22401, 'logo-client/inno-wangsa.png', '[]', '2025-03-29 09:58:00', '2025-03-29 09:58:00', NULL),
(810, 1, 'INTRETECH (MALAYSIA) SDN BHD-1', 'INTRETECH (MALAYSIA) SDN BHD-1', 118, 'image/png', 68200, 'logo-client/intretech-malaysia-sdn-bhd-1.png', '[]', '2025-03-29 09:58:00', '2025-03-29 09:58:00', NULL),
(811, 1, 'KM Uniform Manufacturing', 'KM Uniform Manufacturing', 118, 'image/jpeg', 4418, 'logo-client/km-uniform-manufacturing.jpg', '[]', '2025-03-29 09:58:01', '2025-03-29 09:58:01', NULL),
(812, 1, 'Marujou-1', 'Marujou-1', 118, 'image/png', 5063, 'logo-client/marujou-1.png', '[]', '2025-03-29 09:58:02', '2025-03-29 09:58:02', NULL),
(813, 1, 'Maruyama-1', 'Maruyama-1', 118, 'image/jpeg', 34637, 'logo-client/maruyama-1.jpg', '[]', '2025-03-29 09:58:03', '2025-03-29 09:58:03', NULL),
(814, 1, 'Minebea Mitsumi', 'Minebea Mitsumi', 118, 'image/png', 20569, 'logo-client/minebea-mitsumi.png', '[]', '2025-03-29 09:58:03', '2025-03-29 10:37:44', '2025-03-29 10:37:44'),
(815, 1, 'Nakayama Khase-1', 'Nakayama Khase-1', 118, 'image/png', 3636, 'logo-client/nakayama-khase-1.png', '[]', '2025-03-29 09:58:04', '2025-03-29 09:58:04', NULL),
(816, 1, 'SANUBARI-1', 'SANUBARI-1', 118, 'image/gif', 18825, 'logo-client/sanubari-1.gif', '[]', '2025-03-29 09:58:05', '2025-03-29 10:42:55', '2025-03-29 10:42:55'),
(817, 1, 'Sime Darby', 'Sime Darby', 118, 'image/jpeg', 10631, 'logo-client/sime-darby.jpg', '[]', '2025-03-29 09:58:05', '2025-03-29 09:58:05', NULL),
(818, 1, 'Southern lion-1', 'Southern lion-1', 118, 'image/jpeg', 12414, 'logo-client/southern-lion-1.jpg', '[]', '2025-03-29 09:58:06', '2025-03-29 09:58:06', NULL),
(819, 1, 'Subway', 'Subway', 118, 'image/png', 388109, 'logo-client/subway.png', '[]', '2025-03-29 09:58:07', '2025-03-29 09:58:07', NULL),
(820, 1, 'TONG HEER FASTENERS CO. SDN BHD-1', 'TONG HEER FASTENERS CO. SDN BHD-1', 118, 'image/jpeg', 11153, 'logo-client/tong-heer-fasteners-co-sdn-bhd-1.jpeg', '[]', '2025-03-29 09:58:08', '2025-03-29 09:58:08', NULL),
(821, 1, 'TWP', 'TWP', 118, 'image/png', 23943, 'logo-client/twp.png', '[]', '2025-03-29 09:58:09', '2025-03-29 09:58:09', NULL),
(822, 1, 'Minebea Mitsumi-1', 'Minebea Mitsumi-1', 118, 'image/png', 15875, 'logo-client/minebea-mitsumi-1.png', '[]', '2025-03-29 10:37:51', '2025-03-29 10:37:51', NULL),
(823, 1, 'SANUBARI-2', 'SANUBARI-2', 118, 'image/png', 53638, 'logo-client/sanubari-2.png', '[]', '2025-03-29 10:42:59', '2025-03-29 10:42:59', NULL),
(824, 1, 'Kyushu Air Tech', 'Kyushu Air Tech', 118, 'image/png', 21704, 'logo-client/kyushu-air-tech.png', '[]', '2025-03-29 10:56:54', '2025-03-29 10:56:54', NULL),
(825, 1, 'HELISTROM SDN BHD', 'HELISTROM SDN BHD', 118, 'image/jpeg', 3682, 'logo-client/helistrom-sdn-bhd.jpeg', '[]', '2025-03-29 11:00:14', '2025-03-29 11:00:14', NULL),
(826, 1, 'Helistrom march', 'Helistrom march', 120, 'image/jpeg', 285237, 'job-demand/helistrom-march.jpg', '[]', '2025-03-29 11:08:22', '2025-03-29 11:08:22', NULL),
(827, 1, 'Kyushu Air Tech-1', 'Kyushu Air Tech-1', 118, 'image/png', 21704, 'logo-client/kyushu-air-tech-1.png', '[]', '2025-03-29 11:13:12', '2025-03-29 11:13:12', NULL),
(828, 1, 'Foxconn-2', 'Foxconn-2', 118, 'image/jpeg', 8958, 'logo-client/foxconn-2.jpg', '[]', '2025-03-29 11:23:13', '2025-03-29 11:23:13', NULL),
(829, 1, 'job search', 'job search', 121, 'image/jpeg', 65509, 'banner-sub/job-search.jpg', '[]', '2025-03-29 11:34:51', '2025-03-29 11:34:51', NULL),
(830, 1, 'job search1', 'job search1', 121, 'image/jpeg', 60078, 'banner-sub/job-search1.jpg', '[]', '2025-03-29 11:39:23', '2025-03-29 11:39:23', NULL),
(831, 1, 'banner sub', 'banner sub', 121, 'image/jpeg', 10436, 'banner-sub/banner-sub.jpg', '[]', '2025-03-29 12:08:27', '2025-03-29 12:09:29', '2025-03-29 12:09:29'),
(832, 1, 'banner sub-1', 'banner sub-1', 121, 'image/jpeg', 11180, 'banner-sub/banner-sub-1.jpg', '[]', '2025-03-29 12:09:33', '2025-03-29 12:09:33', NULL),
(833, 1, 'mdkaran bist', 'mdkaran bist', 16, 'image/jpeg', 63985, 'team/mdkaran-bist.jpg', '[]', '2025-03-29 12:52:15', '2025-03-29 12:55:01', '2025-03-29 12:55:01'),
(834, 1, 'mdkaran bist-1', 'mdkaran bist-1', 16, 'image/jpeg', 82423, 'team/mdkaran-bist-1.JPG', '[]', '2025-03-29 12:55:07', '2025-03-29 12:55:07', NULL),
(835, 1, 'mission visio', 'mission visio', 1, 'image/jpeg', 94239, 'general/mission-visio.jpg', '[]', '2025-03-29 13:09:15', '2025-03-29 13:09:15', NULL),
(836, 1, 'Corporate Values', 'Corporate Values', 1, 'image/jpeg', 28176, 'general/corporate-values.jpg', '[]', '2025-03-29 13:09:48', '2025-03-29 13:09:48', NULL),
(837, 1, 'core values2', 'core values2', 1, 'image/jpeg', 31108, 'general/core-values2.jpg', '[]', '2025-03-29 13:20:09', '2025-03-29 13:20:09', NULL),
(838, 1, 'nice_org chart', 'nice_org chart', 1, 'image/jpeg', 102447, 'general/nice-org-chart.jpg', '[]', '2025-03-29 13:33:30', '2025-03-29 13:33:30', NULL),
(839, 1, 'nice-iso-certificate-712x1024-1', 'nice-iso-certificate-712x1024-1', 122, 'image/jpeg', 83216, 'docs-legal/nice-iso-certificate-712x1024-1.jpg', '[]', '2025-03-29 14:14:44', '2025-03-29 14:14:44', NULL),
(840, 1, 'rba-training-1', 'rba-training-1', 122, 'image/jpeg', 69707, 'docs-legal/rba-training-1.jpg', '[]', '2025-03-29 14:14:45', '2025-03-29 14:14:45', NULL),
(841, 1, 'rba-training-certificates-2-682x1024-1', 'rba-training-certificates-2-682x1024-1', 122, 'image/jpeg', 89293, 'docs-legal/rba-training-certificates-2-682x1024-1.jpg', '[]', '2025-03-29 14:14:46', '2025-03-29 14:14:46', NULL),
(842, 1, 'rba-training-certificates-3', 'rba-training-certificates-3', 122, 'image/jpeg', 99804, 'docs-legal/rba-training-certificates-3.jpg', '[]', '2025-03-29 14:14:46', '2025-03-29 14:14:46', NULL),
(843, 1, 'WhatsApp Image 2025-03-30 at 22.55.28_71e1c602', 'WhatsApp Image 2025-03-30 at 22.55.28_71e1c602', 120, 'image/jpeg', 285610, 'job-demand/whatsapp-image-2025-03-30-at-225528-71e1c602.jpg', '[]', '2025-03-31 00:26:53', '2025-03-31 00:26:53', NULL),
(844, 1, 'nicelogo-03', 'nicelogo-03', 117, 'image/png', 7226, 'logo-nice/nicelogo-03.png', '[]', '2025-04-06 15:40:11', '2025-04-06 15:40:11', NULL),
(845, 1, 'nicelogo-04', 'nicelogo-04', 117, 'image/png', 6091, 'logo-nice/nicelogo-04.png', '[]', '2025-04-06 15:40:12', '2025-04-06 15:40:12', NULL),
(846, 1, 'Nice_Recruitment Solutions!', 'Nice_Recruitment Solutions!', 121, 'image/jpeg', 83648, 'banner-sub/nice-recruitment-solutions.jpg', '[]', '2025-04-06 16:22:35', '2025-04-06 16:22:35', NULL),
(847, 1, 'wondering-thinking-happy-thoughts-ideas-daydreaming-looking-copy-space-side_1194-632430', 'wondering-thinking-happy-thoughts-ideas-daydreaming-looking-copy-space-side_1194-632430', 0, 'image/jpeg', 40629, 'wondering-thinking-happy-thoughts-ideas-daydreaming-looking-copy-space-side-1194-632430.jpg', '[]', '2025-04-06 23:27:46', '2025-04-06 23:28:58', '2025-04-06 23:28:58'),
(848, 1, 'Nice Profile 2025', 'Nice Profile 2025', 115, 'application/pdf', 9892666, 'intro-block/nice-profile-2025.pdf', '[]', '2025-04-11 13:56:13', '2025-04-11 13:56:20', '2025-04-11 13:56:20'),
(849, 1, 'Nice Profile 2025-1', 'Nice Profile 2025-1', 115, 'application/pdf', 9892666, 'intro-block/nice-profile-2025-1.pdf', '[]', '2025-04-11 13:56:58', '2025-04-11 13:56:58', NULL),
(850, 1, 'Nice Profile 2025-2', 'Nice Profile 2025-2', 115, 'application/pdf', 9961568, 'intro-block/nice-profile-2025-2.pdf', '[]', '2025-06-11 22:44:43', '2025-06-11 22:44:43', NULL),
(851, 1, 'Karan singh1', 'Karan singh1', 16, 'image/jpeg', 124191, 'team/karan-singh1.jpg', '[]', '2025-06-11 22:51:12', '2025-06-11 22:51:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `color`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'general', NULL, 'general', 0, '2024-01-05 02:17:19', '2024-01-05 02:17:19', NULL),
(3, 0, 'icons', NULL, 'icons', 0, '2024-01-05 02:17:28', '2024-01-05 02:17:28', NULL),
(4, 0, 'logo', NULL, 'logo', 0, '2024-01-05 02:17:31', '2024-01-05 02:17:31', NULL),
(8, 0, 'testimonials', NULL, 'testimonials', 0, '2024-01-05 02:17:51', '2024-01-05 02:17:51', NULL),
(13, 1, 'banners', NULL, 'banners', 0, '2024-03-23 21:55:23', '2024-03-23 21:55:23', NULL),
(14, 1, 'services', NULL, 'services', 0, '2024-03-24 00:35:58', '2024-03-24 00:35:58', NULL),
(15, 1, 'backgrounds', NULL, 'backgrounds', 0, '2024-03-24 00:53:44', '2024-03-24 00:53:44', NULL),
(16, 1, 'team', NULL, 'team', 0, '2024-03-24 01:39:29', '2024-03-24 01:39:29', NULL),
(18, 1, 'industries', NULL, 'industries', 0, '2024-03-24 09:36:16', '2024-03-24 09:36:16', NULL),
(19, 1, 'Photos', NULL, 'photos', 0, '2024-03-31 04:49:19', '2025-06-11 22:50:54', '2025-06-11 22:50:54'),
(20, 1, 'dr-bu', NULL, 'dr-bu', 19, '2024-03-31 04:49:42', '2025-06-11 22:50:54', '2025-06-11 22:50:54'),
(21, 1, 'Pages', NULL, 'pages', 0, '2024-03-31 05:04:33', '2024-03-31 05:04:33', NULL),
(23, 1, 'Client Logo', NULL, 'company-logo', 0, '2024-04-04 07:36:37', '2024-04-05 03:59:38', NULL),
(25, 1, 'Profile', NULL, 'company-profile', 0, '2024-04-04 08:56:28', '2025-03-29 05:31:56', '2025-03-29 05:31:56'),
(27, 1, 'Bahrain', NULL, 'bahrain', 23, '2024-04-05 04:05:51', '2024-04-05 04:05:51', NULL),
(28, 1, 'Saudi', NULL, 'saudi', 23, '2024-04-05 04:06:06', '2024-04-05 04:06:06', NULL),
(29, 1, 'Canada', NULL, 'canada', 23, '2024-04-05 04:27:00', '2024-04-05 04:27:00', NULL),
(30, 1, 'Cyprus', NULL, 'cyprus', 23, '2024-04-05 04:35:39', '2024-04-05 04:35:39', NULL),
(31, 1, 'UAE', NULL, 'uae', 23, '2024-04-05 04:37:20', '2024-04-05 04:37:20', NULL),
(109, 1, 'Flags', NULL, 'flags', 0, '2024-04-05 07:48:01', '2024-04-05 07:48:01', NULL),
(110, 1, 'Company Logo', NULL, 'company-logo-1', 0, '2024-04-06 01:56:49', '2024-04-06 01:56:49', NULL),
(111, 1, 'Gallery', NULL, 'gallery', 0, '2024-04-14 11:18:07', '2024-04-14 11:18:07', NULL),
(112, 1, 'Business Partners', NULL, 'business-partners', 111, '2024-04-14 11:18:42', '2024-04-14 11:18:42', NULL),
(113, 1, 'General', NULL, 'activities', 111, '2024-04-14 11:18:50', '2024-05-03 03:00:07', NULL),
(114, 1, 'Legal Docs', NULL, 'legal-docs', 0, '2025-03-29 04:52:08', '2025-03-29 04:52:08', NULL),
(115, 1, 'Intro Block', NULL, 'intro-block', 0, '2025-03-29 04:53:54', '2025-03-29 04:53:54', NULL),
(116, 1, 'Activities', NULL, 'activities-1', 111, '2025-03-29 05:02:57', '2025-03-29 05:02:57', NULL),
(117, 1, 'Logo_nice', NULL, 'logo-nice', 0, '2025-03-29 05:06:24', '2025-03-29 05:06:24', NULL),
(118, 1, 'Logo_client', NULL, 'logo-client', 0, '2025-03-29 05:37:49', '2025-03-29 05:37:49', NULL),
(119, 1, 'Banner', NULL, 'banner', 0, '2025-03-29 05:57:53', '2025-03-29 05:57:53', NULL),
(120, 1, 'Job Demand', NULL, 'job-demand', 0, '2025-03-29 11:08:09', '2025-03-29 11:08:09', NULL),
(121, 1, 'Banner sub', NULL, 'banner-sub', 0, '2025-03-29 11:34:43', '2025-03-29 11:34:43', NULL),
(122, 1, 'Docs_Legal', NULL, 'docs-legal', 0, '2025-03-29 14:14:20', '2025-03-29 14:14:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) NOT NULL,
  `value` text DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main Menu', 'main-menu', 'published', '2024-01-05 02:17:53', '2025-04-06 14:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2024-01-05 02:17:53', '2024-01-05 02:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `icon_font` varchar(50) DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) DEFAULT NULL,
  `css_class` varchar(120) DEFAULT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(24, 1, 78, 13, 'Botble\\Page\\Models\\Page', '/about-us', '', 1, 'Introduction', '', '_self', 0, '2024-01-05 02:17:53', '2025-04-06 14:24:51'),
(64, 1, 0, 1, 'Botble\\Page\\Models\\Page', '', '', 0, 'Home', '', '_self', 0, '2024-03-29 02:23:53', '2025-04-06 14:24:51'),
(65, 1, 0, 15, 'Botble\\Page\\Models\\Page', '/contact', '', 4, 'Contact', '', '_self', 0, '2024-03-29 02:25:25', '2025-04-06 14:24:51'),
(69, 1, 77, 41, 'Botble\\Page\\Models\\Page', '/hr-consultancy-in-japan', '', 0, 'HR Consultancy in Japan', '', '_self', 0, '2024-03-31 05:45:17', '2025-04-06 14:24:51'),
(71, 1, 77, 44, 'Botble\\Page\\Models\\Page', '/visa-processing-documentation', '', 2, 'Visa Processing & Documentation', '', '_self', 0, '2024-03-31 05:45:17', '2025-04-06 14:24:51'),
(72, 1, 78, 38, 'Botble\\Page\\Models\\Page', '/our-mission-and-vision', '', 3, 'Our Mission and Vision', '', '_self', 0, '2024-03-31 05:45:17', '2025-04-06 14:24:51'),
(73, 1, 77, 42, 'Botble\\Page\\Models\\Page', '/overseas-recruitment-services', '', 1, 'Overseas Recruitment Services', '', '_self', 0, '2024-03-31 05:45:17', '2025-04-06 14:24:51'),
(74, 1, 78, 37, 'Botble\\Page\\Models\\Page', '/message-from-managing-director', '', 2, 'Message from Managing Director', '', '_self', 0, '2024-03-31 05:45:17', '2025-04-06 14:24:51'),
(75, 1, 78, 39, 'Botble\\Page\\Models\\Page', '/why-bua-miracle-hr-consultancy', '', 5, 'Why Nice Overseas?', '', '_self', 0, '2024-03-31 05:45:19', '2025-04-06 14:24:51'),
(77, 1, 97, 0, NULL, 'javascript:void()', '', 1, 'Services', '', '_self', 1, '2024-03-31 11:10:43', '2025-04-06 14:24:51'),
(78, 1, 0, 0, NULL, 'javascript:void()', '', 1, 'About us', '', '_self', 1, '2024-03-31 11:11:46', '2025-04-06 14:24:51'),
(82, 1, 78, 48, 'Botble\\Page\\Models\\Page', '/corporate-profile', '', 0, 'Corporate Profile', '', '_self', 0, '2025-03-29 12:21:17', '2025-04-06 14:24:51'),
(83, 1, 78, 49, 'Botble\\Page\\Models\\Page', '/core-values', '', 4, 'Core Values', '', '_self', 0, '2025-03-29 13:14:31', '2025-04-06 14:24:51'),
(84, 1, 78, 50, 'Botble\\Page\\Models\\Page', '/why-nepalese-workers', '', 6, 'Why Nepalese Workers?', '', '_self', 0, '2025-03-29 13:25:32', '2025-04-06 14:24:51'),
(85, 1, 78, 51, 'Botble\\Page\\Models\\Page', '/organization-chart', '', 7, 'Organization Chart', '', '_self', 0, '2025-03-29 13:35:25', '2025-04-06 14:24:51'),
(86, 1, 77, 43, 'Botble\\Page\\Models\\Page', '/talent-acquisition', '', 3, 'Talent Acquisition', '', '_self', 0, '2025-03-29 13:47:23', '2025-04-06 14:24:51'),
(88, 1, 98, 53, 'Botble\\Page\\Models\\Page', '/code-of-conduct', '', 0, 'Code Of Conduct', '', '_self', 0, '2025-03-29 14:06:19', '2025-04-06 14:24:51'),
(89, 1, 98, 54, 'Botble\\Page\\Models\\Page', '/policy-and-procedure', '', 1, 'Policy and Procedure', '', '_self', 0, '2025-03-29 14:06:20', '2025-04-06 14:24:51'),
(90, 1, 98, 55, 'Botble\\Page\\Models\\Page', '/recruitment-procedures', '', 2, 'Recruitment Procedures', '', '_self', 0, '2025-03-29 14:06:20', '2025-04-06 14:24:51'),
(91, 1, 99, 57, 'Botble\\Page\\Models\\Page', '/legal-certificates', '', 0, 'Legal Certificates', '', '_self', 0, '2025-03-29 14:16:01', '2025-04-06 14:24:51'),
(96, 1, 99, 58, 'Botble\\Page\\Models\\Page', '/demand-documents', '', 1, 'Demand Documents', '', '_self', 0, '2025-03-29 14:24:02', '2025-04-06 14:24:51'),
(97, 1, 0, 0, NULL, 'javascript:void()', '', 3, 'More', '', '_self', 1, '2025-03-31 01:58:18', '2025-04-06 14:24:51'),
(98, 1, 0, 0, NULL, 'javascript:void()', '', 2, 'Company Spirit', '', '_self', 1, '2025-03-31 01:59:57', '2025-04-06 14:24:51'),
(99, 1, 97, 0, NULL, 'javascript:void()', '', 0, 'Documents', '', '_self', 1, '2025-04-06 14:21:32', '2025-04-06 14:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(3, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 1, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(4, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 2, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(5, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 3, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(6, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 4, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(7, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 5, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(8, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 6, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(9, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 7, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(10, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 8, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(11, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 9, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(12, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 10, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(13, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 11, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(14, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 12, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(15, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 13, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(16, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 14, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(17, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 15, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(18, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 16, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(19, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 17, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(20, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 18, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(21, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 19, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(22, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 20, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(23, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 21, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(24, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 22, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(25, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 23, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(26, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 24, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(27, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 25, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(28, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 26, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(29, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 27, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45');
INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(30, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 28, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(31, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 29, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(32, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 30, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(33, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 31, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(34, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 32, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(35, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 33, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(36, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 34, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(37, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 35, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(38, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 36, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(39, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 37, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(40, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 38, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(41, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 39, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(42, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 40, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(43, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 41, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(44, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 42, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(45, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 43, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(46, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 44, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(47, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 45, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(48, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 46, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(49, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 47, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(50, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 48, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(51, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 49, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(52, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 50, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(53, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 51, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(54, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 52, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(55, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 53, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(56, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 54, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46');
INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(57, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 55, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(58, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 56, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(59, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 57, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(60, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 58, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(61, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 59, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(62, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 60, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(63, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 61, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(64, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 62, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(65, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 63, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(66, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 64, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(67, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 65, 'Botble\\Ecommerce\\Models\\Product', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(72, 'description', '[\"Itaque ut voluptatibus expedita labore non molestiae dicta. Incidunt praesentium nisi delectus eum soluta.\"]', 1, 'Botble\\Team\\Models\\Team', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(84, 'image', '[\"general\\/job-details-thumb.png\"]', 1, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(85, 'icon', '[\"icons\\/icon1.png\"]', 1, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(86, 'apply_url', '[\"\\/contact\"]', 1, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(87, 'image', '[\"general\\/job-details-thumb.png\"]', 2, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(88, 'icon', '[\"icons\\/icon2.png\"]', 2, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(89, 'apply_url', '[\"\\/contact\"]', 2, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(90, 'image', '[\"general\\/job-details-thumb.png\"]', 3, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(91, 'icon', '[\"icons\\/icon3.png\"]', 3, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(92, 'apply_url', '[\"\\/contact\"]', 3, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(93, 'image', '[\"general\\/job-details-thumb.png\"]', 4, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(94, 'icon', '[\"icons\\/icon4.png\"]', 4, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(95, 'apply_url', '[\"\\/contact\"]', 4, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(96, 'image', '[\"general\\/job-details-thumb.png\"]', 5, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(97, 'icon', '[\"icons\\/icon5.png\"]', 5, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(98, 'apply_url', '[\"\\/contact\"]', 5, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(99, 'image', '[\"general\\/job-details-thumb.png\"]', 6, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(100, 'icon', '[\"icons\\/icon6.png\"]', 6, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(101, 'apply_url', '[\"\\/contact\"]', 6, 'ArchiElite\\Career\\Models\\Career', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(102, 'icon', '[\"icons\\/cross-platform.png\"]', 1, 'Botble\\BusinessService\\Models\\ServiceCategory', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(107, 'icon', '[\"business-services\\/free.png\"]', 1, 'Botble\\BusinessService\\Models\\Package', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(108, 'icon', '[\"business-services\\/standard.png\"]', 2, 'Botble\\BusinessService\\Models\\Package', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(109, 'icon', '[\"business-services\\/business.png\"]', 3, 'Botble\\BusinessService\\Models\\Package', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(110, 'icon', '[\"business-services\\/enterprise.png\"]', 4, 'Botble\\BusinessService\\Models\\Package', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(111, 'child_style', '[\"two_col\"]', 1, 'Botble\\Menu\\Models\\MenuNode', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(112, 'child_style', '[\"hr_per_2_child\"]', 14, 'Botble\\Menu\\Models\\MenuNode', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(114, 'seo_meta', '[{\"index\":\"index\"}]', 13, 'Botble\\Page\\Models\\Page', '2024-03-23 21:10:38', '2024-03-23 21:10:38'),
(115, 'seo_meta', '[{\"index\":\"index\"}]', 1, 'Botble\\BusinessService\\Models\\Service', '2024-03-24 00:38:31', '2024-03-24 00:38:31'),
(116, 'seo_meta', '[{\"index\":\"index\"}]', 2, 'Botble\\BusinessService\\Models\\Service', '2024-03-24 01:03:05', '2024-03-24 01:03:05'),
(117, 'seo_meta', '[{\"seo_title\":\"Manpower Supply to Different Countries, Global Reach\",\"seo_description\":\"Manpower Supply to Different Countries\\r\\nGlobal Reach\",\"index\":\"index\"}]', 3, 'Botble\\BusinessService\\Models\\Service', '2024-03-24 01:20:47', '2024-03-24 01:20:47'),
(118, 'seo_meta', '[{\"index\":\"index\"}]', 4, 'Botble\\BusinessService\\Models\\Service', '2024-03-24 01:22:50', '2024-03-24 01:22:50'),
(119, 'seo_meta', '[{\"index\":\"index\"}]', 1, 'Botble\\BusinessService\\Models\\ServiceIndustry', '2024-03-24 09:43:45', '2024-03-24 09:43:45'),
(120, 'seo_meta', '[{\"index\":\"index\"}]', 2, 'Botble\\BusinessService\\Models\\ServiceIndustry', '2024-03-24 09:45:25', '2024-03-24 09:45:25'),
(121, 'seo_meta', '[{\"index\":\"index\"}]', 3, 'Botble\\BusinessService\\Models\\ServiceIndustry', '2024-03-24 11:37:16', '2024-03-24 11:37:16'),
(122, 'seo_meta', '[{\"index\":\"index\"}]', 4, 'Botble\\BusinessService\\Models\\ServiceIndustry', '2024-03-24 11:40:22', '2024-03-24 11:40:22'),
(123, 'seo_meta', '[{\"index\":\"index\"}]', 5, 'Botble\\BusinessService\\Models\\ServiceIndustry', '2024-03-24 11:43:12', '2024-03-24 11:43:12'),
(124, 'seo_meta', '[{\"index\":\"index\"}]', 17, 'Botble\\Page\\Models\\Page', '2024-03-24 12:04:18', '2024-03-24 12:04:18'),
(125, 'seo_meta', '[{\"index\":\"index\"}]', 15, 'Botble\\Page\\Models\\Page', '2024-03-29 02:26:00', '2024-03-29 02:26:00'),
(126, 'seo_meta', '[{\"index\":\"index\"}]', 35, 'Botble\\Page\\Models\\Page', '2024-03-31 02:14:41', '2024-03-31 02:14:41'),
(127, 'seo_meta', '[{\"index\":\"index\"}]', 36, 'Botble\\Page\\Models\\Page', '2024-03-31 04:50:24', '2024-03-31 04:50:24'),
(128, 'seo_meta', '[{\"index\":\"index\"}]', 37, 'Botble\\Page\\Models\\Page', '2024-03-31 04:57:46', '2024-03-31 04:57:46'),
(129, 'seo_meta', '[{\"index\":\"index\"}]', 38, 'Botble\\Page\\Models\\Page', '2024-03-31 04:59:50', '2024-03-31 04:59:50'),
(130, 'seo_meta', '[{\"index\":\"index\"}]', 39, 'Botble\\Page\\Models\\Page', '2024-03-31 05:05:03', '2024-03-31 05:05:03'),
(131, 'seo_meta', '[{\"index\":\"index\"}]', 40, 'Botble\\Page\\Models\\Page', '2024-03-31 05:06:05', '2024-03-31 05:06:05'),
(132, 'seo_meta', '[{\"index\":\"index\"}]', 41, 'Botble\\Page\\Models\\Page', '2024-03-31 05:07:30', '2024-03-31 05:07:30'),
(133, 'seo_meta', '[{\"index\":\"index\"}]', 42, 'Botble\\Page\\Models\\Page', '2024-03-31 05:10:32', '2024-03-31 05:10:32'),
(134, 'seo_meta', '[{\"index\":\"index\"}]', 43, 'Botble\\Page\\Models\\Page', '2024-03-31 05:11:46', '2024-03-31 05:11:46'),
(135, 'seo_meta', '[{\"index\":\"index\"}]', 44, 'Botble\\Page\\Models\\Page', '2024-03-31 05:14:24', '2024-03-31 05:14:24'),
(136, 'seo_meta', '[{\"index\":\"index\"}]', 45, 'Botble\\Page\\Models\\Page', '2024-03-31 05:15:00', '2024-03-31 05:15:00'),
(140, 'job_category_image', '[null]', 1, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:39:31', '2024-04-11 10:39:31'),
(141, 'icon_image', '[null]', 1, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:39:31', '2024-04-11 10:39:31'),
(142, 'seo_meta', '[{\"index\":\"index\"}]', 1, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:39:31', '2024-04-11 10:39:31'),
(143, 'job_category_image', '[null]', 2, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:40:36', '2024-04-11 10:40:36'),
(144, 'icon_image', '[null]', 2, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:40:36', '2024-04-11 10:40:36'),
(145, 'seo_meta', '[{\"index\":\"index\"}]', 2, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:40:36', '2024-04-11 10:40:36'),
(146, 'job_category_image', '[null]', 3, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:41:21', '2024-04-11 10:41:21'),
(147, 'icon_image', '[null]', 3, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:41:21', '2024-04-11 10:41:21'),
(148, 'seo_meta', '[{\"index\":\"index\"}]', 3, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:41:21', '2024-04-11 10:41:21'),
(149, 'job_category_image', '[null]', 4, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:41:51', '2024-04-11 10:41:51'),
(150, 'icon_image', '[null]', 4, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:41:51', '2024-04-11 10:41:51'),
(151, 'seo_meta', '[{\"index\":\"index\"}]', 4, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:41:51', '2024-04-11 10:41:51'),
(155, 'job_category_image', '[null]', 6, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:43:06', '2024-04-11 10:43:06'),
(156, 'icon_image', '[null]', 6, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:43:06', '2024-04-11 10:43:06'),
(157, 'seo_meta', '[{\"index\":\"index\"}]', 6, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:43:06', '2024-04-11 10:43:06'),
(158, 'job_category_image', '[null]', 7, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:44:00', '2024-04-11 10:44:00'),
(159, 'icon_image', '[null]', 7, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:44:00', '2024-04-11 10:44:00'),
(160, 'seo_meta', '[{\"index\":\"index\"}]', 7, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:44:00', '2024-04-11 10:44:00'),
(161, 'job_category_image', '[null]', 8, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:46:11', '2024-04-11 10:46:11'),
(162, 'icon_image', '[null]', 8, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:46:11', '2024-04-11 10:46:11'),
(163, 'seo_meta', '[{\"index\":\"index\"}]', 8, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 10:46:11', '2024-04-11 10:46:11'),
(164, 'job_category_image', '[null]', 9, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 11:08:55', '2024-04-11 11:08:55'),
(165, 'icon_image', '[null]', 9, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 11:08:55', '2024-04-11 11:08:55'),
(166, 'seo_meta', '[{\"index\":\"index\"}]', 9, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 11:08:55', '2024-04-11 11:08:55'),
(167, 'featured_image', '[null]', 1, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 11:23:12', '2024-04-11 11:23:12'),
(168, 'seo_meta', '[{\"index\":\"index\"}]', 1, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 11:23:12', '2024-04-11 11:23:12'),
(169, 'featured_image', '[null]', 2, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 11:43:31', '2024-04-11 11:43:31'),
(170, 'seo_meta', '[{\"index\":\"index\"}]', 2, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 11:43:31', '2024-04-11 11:43:31'),
(176, 'seo_meta', '[{\"index\":\"index\"}]', 1, 'Botble\\Gallery\\Models\\Gallery', '2024-04-11 11:53:54', '2024-04-11 11:53:54'),
(179, 'job_category_image', '[null]', 10, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 12:54:59', '2024-04-11 12:54:59'),
(180, 'icon_image', '[null]', 10, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 12:54:59', '2024-04-11 12:54:59'),
(181, 'seo_meta', '[{\"index\":\"index\"}]', 10, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 12:54:59', '2024-04-11 12:54:59'),
(182, 'featured_image', '[null]', 3, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 12:57:13', '2024-04-11 12:57:13'),
(183, 'seo_meta', '[{\"index\":\"index\"}]', 3, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 12:57:13', '2024-04-11 12:57:13'),
(187, 'featured_image', '[null]', 4, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:04:32', '2024-04-11 13:04:32'),
(188, 'seo_meta', '[{\"index\":\"index\"}]', 4, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:04:32', '2024-04-11 13:04:32'),
(189, 'featured_image', '[null]', 5, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:05:58', '2024-04-11 13:05:58'),
(190, 'seo_meta', '[{\"index\":\"index\"}]', 5, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:05:58', '2024-04-11 13:05:58'),
(191, 'job_category_image', '[null]', 12, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:07:30', '2024-04-11 13:07:30'),
(192, 'icon_image', '[null]', 12, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:07:30', '2024-04-11 13:07:30'),
(193, 'seo_meta', '[{\"index\":\"index\"}]', 12, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:07:30', '2024-04-11 13:07:30'),
(194, 'featured_image', '[null]', 6, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:09:45', '2024-04-11 13:09:45'),
(195, 'seo_meta', '[{\"index\":\"index\"}]', 6, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:09:45', '2024-04-11 13:09:45'),
(196, 'job_category_image', '[null]', 13, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:15:00', '2024-04-11 13:15:00'),
(197, 'icon_image', '[null]', 13, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:15:00', '2024-04-11 13:15:00'),
(198, 'seo_meta', '[{\"index\":\"index\"}]', 13, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:15:00', '2024-04-11 13:15:00'),
(199, 'featured_image', '[null]', 7, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:15:53', '2024-04-11 13:15:53'),
(200, 'seo_meta', '[{\"index\":\"index\"}]', 7, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:15:53', '2024-04-11 13:15:53'),
(201, 'job_category_image', '[null]', 14, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:16:56', '2024-04-11 13:16:56'),
(202, 'icon_image', '[null]', 14, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:16:56', '2024-04-11 13:16:56'),
(203, 'seo_meta', '[{\"index\":\"index\"}]', 14, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:16:56', '2024-04-11 13:16:56'),
(204, 'seo_meta', '[{\"index\":\"index\"}]', 11, 'Botble\\JobBoard\\Models\\Company', '2024-04-11 13:19:27', '2024-04-11 13:19:27'),
(207, 'job_category_image', '[null]', 15, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:23:11', '2024-04-11 13:23:11'),
(208, 'icon_image', '[null]', 15, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:23:11', '2024-04-11 13:23:11'),
(209, 'seo_meta', '[{\"index\":\"index\"}]', 15, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:23:11', '2024-04-11 13:23:11'),
(210, 'featured_image', '[null]', 9, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:24:38', '2024-04-11 13:24:38'),
(211, 'seo_meta', '[{\"index\":\"index\"}]', 9, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:24:38', '2024-04-11 13:24:38'),
(212, 'featured_image', '[null]', 10, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:25:50', '2024-04-11 13:25:50'),
(213, 'seo_meta', '[{\"index\":\"index\"}]', 10, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:25:50', '2024-04-11 13:25:50'),
(214, 'featured_image', '[null]', 11, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:27:24', '2024-04-11 13:27:24'),
(215, 'seo_meta', '[{\"index\":\"index\"}]', 11, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:27:24', '2024-04-11 13:27:24'),
(216, 'featured_image', '[null]', 12, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:29:46', '2024-04-11 13:29:46'),
(217, 'seo_meta', '[{\"index\":\"index\"}]', 12, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:29:46', '2024-04-11 13:29:46'),
(218, 'job_category_image', '[null]', 16, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:30:59', '2024-04-11 13:30:59'),
(219, 'icon_image', '[null]', 16, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:30:59', '2024-04-11 13:30:59'),
(220, 'seo_meta', '[{\"index\":\"index\"}]', 16, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:30:59', '2024-04-11 13:30:59'),
(221, 'featured_image', '[null]', 13, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:32:22', '2024-04-11 13:32:22'),
(222, 'seo_meta', '[{\"index\":\"index\"}]', 13, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:32:22', '2024-04-11 13:32:22'),
(223, 'job_category_image', '[null]', 17, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:34:14', '2024-04-11 13:34:14'),
(224, 'icon_image', '[null]', 17, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:34:14', '2024-04-11 13:34:14'),
(225, 'seo_meta', '[{\"index\":\"index\"}]', 17, 'Botble\\JobBoard\\Models\\Category', '2024-04-11 13:34:14', '2024-04-11 13:34:14'),
(226, 'featured_image', '[null]', 14, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:36:54', '2024-04-11 13:36:54'),
(227, 'seo_meta', '[{\"index\":\"index\"}]', 14, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:36:54', '2024-04-11 13:36:54'),
(228, 'featured_image', '[null]', 15, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:38:31', '2024-04-11 13:38:31'),
(229, 'seo_meta', '[{\"index\":\"index\"}]', 15, 'Botble\\JobBoard\\Models\\Job', '2024-04-11 13:38:31', '2024-04-11 13:38:31'),
(230, 'background_breadcrumb', '[null]', 1, 'Botble\\Page\\Models\\Page', '2024-04-11 21:21:10', '2024-04-11 21:21:10'),
(231, 'seo_meta', '[{\"index\":\"index\"}]', 2, 'Botble\\Gallery\\Models\\Gallery', '2024-04-14 11:20:36', '2024-04-14 11:20:36'),
(232, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 46, 'Botble\\Page\\Models\\Page', '2024-04-16 03:54:04', '2025-04-06 16:33:03'),
(233, 'seo_meta', '[{\"index\":\"index\"}]', 46, 'Botble\\Page\\Models\\Page', '2024-04-16 03:54:04', '2024-04-16 03:54:04'),
(234, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 38, 'Botble\\Page\\Models\\Page', '2024-04-17 03:46:10', '2025-03-29 13:10:41'),
(235, 'background_breadcrumb', '[null]', 41, 'Botble\\Page\\Models\\Page', '2024-04-17 04:08:25', '2024-04-17 04:08:25'),
(236, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 39, 'Botble\\Page\\Models\\Page', '2024-04-17 04:08:44', '2025-03-29 13:22:34'),
(237, 'background_breadcrumb', '[null]', 36, 'Botble\\Page\\Models\\Page', '2024-04-18 10:06:50', '2024-04-18 10:06:50'),
(238, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 13, 'Botble\\Page\\Models\\Page', '2024-04-21 10:44:19', '2025-03-29 12:09:46'),
(239, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 37, 'Botble\\Page\\Models\\Page', '2024-04-22 12:11:32', '2025-03-29 12:55:46'),
(240, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 15, 'Botble\\Page\\Models\\Page', '2024-04-24 20:37:15', '2025-04-06 14:50:55'),
(241, 'background_breadcrumb', '[null]', 47, 'Botble\\Page\\Models\\Page', '2024-04-24 21:09:17', '2024-04-24 21:09:17'),
(242, 'seo_meta', '[{\"index\":\"index\"}]', 47, 'Botble\\Page\\Models\\Page', '2024-04-24 21:09:17', '2024-04-24 21:09:17'),
(243, 'background_breadcrumb', '[null]', 42, 'Botble\\Page\\Models\\Page', '2024-04-28 01:41:26', '2024-04-28 01:41:26'),
(244, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 43, 'Botble\\Page\\Models\\Page', '2025-03-29 08:40:47', '2025-03-29 13:46:25'),
(245, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 44, 'Botble\\Page\\Models\\Page', '2025-03-29 08:55:49', '2025-03-29 13:44:43'),
(246, 'featured_image', '[null]', 16, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 10:22:00', '2025-03-29 10:22:00'),
(247, 'seo_meta', '[{\"index\":\"index\"}]', 16, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 10:22:00', '2025-03-29 10:22:00'),
(248, 'seo_meta', '[{\"index\":\"index\"}]', 12, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:31:41', '2025-03-29 10:31:41'),
(249, 'seo_meta', '[{\"index\":\"index\"}]', 13, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:32:11', '2025-03-29 10:32:11'),
(250, 'seo_meta', '[{\"index\":\"index\"}]', 14, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:33:08', '2025-03-29 10:33:08'),
(251, 'seo_meta', '[{\"index\":\"index\"}]', 15, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:33:40', '2025-03-29 10:33:40'),
(252, 'seo_meta', '[{\"index\":\"index\"}]', 16, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:34:08', '2025-03-29 10:34:08'),
(253, 'seo_meta', '[{\"index\":\"index\"}]', 17, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:35:10', '2025-03-29 10:35:10'),
(254, 'seo_meta', '[{\"index\":\"index\"}]', 18, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:36:02', '2025-03-29 10:36:02'),
(255, 'seo_meta', '[{\"index\":\"index\"}]', 19, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:38:16', '2025-03-29 10:38:16'),
(256, 'seo_meta', '[{\"index\":\"index\"}]', 20, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:38:52', '2025-03-29 10:38:52'),
(257, 'seo_meta', '[{\"index\":\"index\"}]', 21, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:39:17', '2025-03-29 10:39:17'),
(258, 'seo_meta', '[{\"index\":\"index\"}]', 22, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:39:49', '2025-03-29 10:39:49'),
(259, 'seo_meta', '[{\"index\":\"index\"}]', 23, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:40:19', '2025-03-29 10:40:19'),
(260, 'seo_meta', '[{\"index\":\"index\"}]', 24, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:41:00', '2025-03-29 10:41:00'),
(261, 'seo_meta', '[{\"index\":\"index\"}]', 25, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:41:23', '2025-03-29 10:41:23'),
(262, 'seo_meta', '[{\"index\":\"index\"}]', 26, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 10:41:46', '2025-03-29 10:41:46'),
(263, 'featured_image', '[null]', 17, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 10:46:00', '2025-03-29 10:46:00'),
(264, 'seo_meta', '[{\"index\":\"index\"}]', 17, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 10:46:00', '2025-03-29 10:46:00'),
(265, 'seo_meta', '[{\"index\":\"index\"}]', 27, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 11:00:54', '2025-03-29 11:00:54'),
(266, 'featured_image', '[\"job-demand\\/helistrom-march.jpg\"]', 18, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 11:05:20', '2025-03-29 11:08:58'),
(267, 'seo_meta', '[{\"index\":\"index\"}]', 18, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 11:05:20', '2025-03-29 11:05:20'),
(268, 'seo_meta', '[{\"index\":\"index\"}]', 28, 'Botble\\JobBoard\\Models\\Company', '2025-03-29 11:14:47', '2025-03-29 11:14:47'),
(269, 'featured_image', '[\"job-demand\\/whatsapp-image-2025-03-30-at-225528-71e1c602.jpg\"]', 19, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 11:17:38', '2025-03-31 00:27:13'),
(270, 'seo_meta', '[{\"index\":\"index\"}]', 19, 'Botble\\JobBoard\\Models\\Job', '2025-03-29 11:17:38', '2025-03-29 11:17:38'),
(271, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 48, 'Botble\\Page\\Models\\Page', '2025-03-29 12:20:24', '2025-03-29 12:26:03'),
(272, 'seo_meta', '[{\"index\":\"index\"}]', 48, 'Botble\\Page\\Models\\Page', '2025-03-29 12:20:24', '2025-03-29 12:20:24'),
(273, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 49, 'Botble\\Page\\Models\\Page', '2025-03-29 13:13:48', '2025-03-29 13:13:48'),
(274, 'seo_meta', '[{\"index\":\"index\"}]', 49, 'Botble\\Page\\Models\\Page', '2025-03-29 13:13:48', '2025-03-29 13:13:48'),
(275, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 50, 'Botble\\Page\\Models\\Page', '2025-03-29 13:25:09', '2025-03-29 13:25:09'),
(276, 'seo_meta', '[{\"index\":\"index\"}]', 50, 'Botble\\Page\\Models\\Page', '2025-03-29 13:25:09', '2025-03-29 13:25:09'),
(277, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 51, 'Botble\\Page\\Models\\Page', '2025-03-29 13:34:58', '2025-03-29 13:34:58'),
(278, 'seo_meta', '[{\"index\":\"index\"}]', 51, 'Botble\\Page\\Models\\Page', '2025-03-29 13:34:58', '2025-03-29 13:34:58'),
(279, 'background_breadcrumb', '[null]', 52, 'Botble\\Page\\Models\\Page', '2025-03-29 13:41:49', '2025-03-29 13:41:49'),
(280, 'seo_meta', '[{\"index\":\"index\"}]', 52, 'Botble\\Page\\Models\\Page', '2025-03-29 13:41:49', '2025-03-29 13:41:49'),
(281, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 53, 'Botble\\Page\\Models\\Page', '2025-03-29 14:03:06', '2025-03-29 14:03:06'),
(282, 'seo_meta', '[{\"index\":\"index\"}]', 53, 'Botble\\Page\\Models\\Page', '2025-03-29 14:03:06', '2025-03-29 14:03:06'),
(283, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 54, 'Botble\\Page\\Models\\Page', '2025-03-29 14:04:07', '2025-03-29 14:04:07'),
(284, 'seo_meta', '[{\"index\":\"index\"}]', 54, 'Botble\\Page\\Models\\Page', '2025-03-29 14:04:07', '2025-03-29 14:04:07'),
(285, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 55, 'Botble\\Page\\Models\\Page', '2025-03-29 14:05:07', '2025-03-29 14:05:07'),
(286, 'seo_meta', '[{\"index\":\"index\"}]', 55, 'Botble\\Page\\Models\\Page', '2025-03-29 14:05:07', '2025-03-29 14:05:07'),
(287, 'background_breadcrumb', '[null]', 56, 'Botble\\Page\\Models\\Page', '2025-03-29 14:11:55', '2025-03-29 14:11:55'),
(288, 'seo_meta', '[{\"index\":\"index\"}]', 56, 'Botble\\Page\\Models\\Page', '2025-03-29 14:11:55', '2025-03-29 14:11:55'),
(289, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 57, 'Botble\\Page\\Models\\Page', '2025-03-29 14:15:21', '2025-03-29 14:15:21'),
(290, 'seo_meta', '[{\"index\":\"index\"}]', 57, 'Botble\\Page\\Models\\Page', '2025-03-29 14:15:21', '2025-03-29 14:15:21'),
(291, 'background_breadcrumb', '[\"banner-sub\\/banner-sub-1.jpg\"]', 58, 'Botble\\Page\\Models\\Page', '2025-03-29 14:19:14', '2025-03-29 14:19:14'),
(292, 'seo_meta', '[{\"index\":\"index\"}]', 58, 'Botble\\Page\\Models\\Page', '2025-03-29 14:19:14', '2025-03-29 14:19:14'),
(293, 'background_breadcrumb', '[null]', 59, 'Botble\\Page\\Models\\Page', '2025-03-29 14:22:14', '2025-03-29 14:22:14'),
(294, 'seo_meta', '[{\"index\":\"index\"}]', 59, 'Botble\\Page\\Models\\Page', '2025-03-29 14:22:14', '2025-03-29 14:22:14'),
(295, 'background_breadcrumb', '[null]', 60, 'Botble\\Page\\Models\\Page', '2025-04-06 23:03:54', '2025-04-06 23:03:54'),
(296, 'seo_meta', '[{\"index\":\"index\"}]', 60, 'Botble\\Page\\Models\\Page', '2025-04-06 23:03:54', '2025-04-06 23:03:54'),
(299, 'background_breadcrumb', '[\"manpower-supply-to-different-countries.jpg\"]', 62, 'Botble\\Page\\Models\\Page', '2025-04-06 23:17:09', '2025-04-06 23:18:07'),
(300, 'seo_meta', '[{\"index\":\"index\"}]', 62, 'Botble\\Page\\Models\\Page', '2025-04-06 23:17:09', '2025-04-06 23:17:09');

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
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2022_04_20_100851_add_index_to_media_table', 1),
(17, '2022_04_20_101046_add_index_to_menu_table', 1),
(18, '2022_07_10_034813_move_lang_folder_to_root', 1),
(19, '2022_08_04_051940_add_missing_column_expires_at', 1),
(20, '2022_09_01_000001_create_admin_notifications_tables', 1),
(21, '2022_10_14_024629_drop_column_is_featured', 1),
(22, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
(23, '2022_12_02_093615_update_slug_index_columns', 1),
(24, '2023_01_30_024431_add_alt_to_media_table', 1),
(25, '2023_02_16_042611_drop_table_password_resets', 1),
(26, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
(27, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
(28, '2023_08_03_041207_remove_unused_plugins', 1),
(29, '2023_08_06_070140_fix_shortcode_name', 1),
(33, '2023_07_25_072632_create_business_services_tables', 3),
(34, '2023_08_09_035520_activate_business_services_plugin', 1),
(35, '2023_08_10_030324_migrate_old_shortcodes', 1),
(36, '2023_08_21_090810_make_page_content_nullable', 1),
(37, '2023_09_14_021936_update_index_for_slugs_table', 1),
(38, '2023_12_06_100448_change_random_hash_for_media', 1),
(39, '2023_12_07_095130_add_color_column_to_media_folders_table', 1),
(40, '2023_12_17_162208_make_sure_column_color_in_media_folders_nullable', 1),
(41, '2023_08_11_060908_create_announcements_table', 4),
(44, '2015_06_18_033822_create_blog_table', 6),
(45, '2021_02_16_092633_remove_default_value_for_author_type', 6),
(46, '2021_12_03_030600_create_blog_translations', 6),
(47, '2022_04_19_113923_add_index_to_table_posts', 6),
(48, '2023_08_29_074620_make_column_author_id_nullable', 6),
(49, '2016_06_17_091537_create_contacts_table', 7),
(50, '2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core', 7),
(125, '2018_07_09_221238_create_faq_table', 9),
(126, '2021_12_03_082134_create_faq_translations', 9),
(127, '2023_11_17_063408_add_description_column_to_faq_categories_table', 9),
(133, '2019_11_18_061011_create_country_table', 12),
(134, '2021_12_03_084118_create_location_translations', 12),
(135, '2021_12_03_094518_migrate_old_location_data', 12),
(136, '2021_12_10_034440_switch_plugin_location_to_use_language_advanced', 12),
(137, '2022_01_16_085908_improve_plugin_location', 12),
(138, '2022_08_04_052122_delete_location_backup_tables', 12),
(139, '2023_04_23_061847_increase_state_translations_abbreviation_column', 12),
(140, '2023_07_26_041451_add_more_columns_to_location_table', 12),
(141, '2023_07_27_041451_add_more_columns_to_location_translation_table', 12),
(142, '2023_08_15_073307_drop_unique_in_states_cities_translations', 12),
(143, '2023_10_21_065016_make_state_id_in_table_cities_nullable', 12),
(144, '2017_10_24_154832_create_newsletter_table', 13),
(152, '2022_11_02_092723_team_create_team_table', 15),
(153, '2023_08_11_094574_update_team_table', 15),
(154, '2023_11_30_085354_add_missing_description_to_team', 15),
(155, '2018_07_09_214610_create_testimonial_table', 16),
(156, '2021_12_03_083642_create_testimonials_translations', 16),
(160, '2024_03_24_133451_create_industries_table', 18),
(165, '2016_10_13_150201_create_galleries_table', 21),
(166, '2021_12_03_082953_create_gallery_translations', 21),
(167, '2022_04_30_034048_create_gallery_meta_translations_table', 21),
(168, '2023_08_29_075308_make_column_user_id_nullable', 21),
(169, '2022_06_20_093259_create_job_board_tables', 22),
(170, '2022_09_12_061845_update_table_activity_logs', 22),
(171, '2022_09_13_042407_create_table_jb_jobs_types', 22),
(172, '2022_09_15_030017_update_jb_jobs_table', 22),
(173, '2022_09_15_094840_add_job_employer_colleagues', 22),
(174, '2022_09_27_000001_create_jb_invoices_tables', 22),
(175, '2022_09_30_144924_update_jobs_table', 22),
(176, '2022_10_04_085631_add_company_logo_to_jb_invoices', 22),
(177, '2022_10_10_030606_create_reviews_table', 22),
(178, '2022_11_09_065056_add_missing_jobs_page', 22),
(179, '2022_11_10_065056_add_columns_to_accounts', 22),
(180, '2022_11_16_034756_add_column_cover_letter_to_accounts', 22),
(181, '2022_11_29_304756_create_jb_account_favorite_skills_table', 22),
(182, '2022_11_29_304757_create_jb_account_favorite_tags', 22),
(183, '2022_12_26_304758_create_table_jb_experiences', 22),
(184, '2022_12_26_304759_create_table_jb_education', 22),
(185, '2023_01_31_023233_create_jb_custom_fields_table', 22),
(186, '2023_02_06_024257_add_package_translations', 22),
(187, '2023_02_08_062457_add_custom_fields_translation_table', 22),
(188, '2023_04_03_126927_add_parent_id_to_jb_categories_table', 22),
(189, '2023_05_04_000001_add_hide_cv_to_jb_accounts_table', 22),
(190, '2023_05_09_062031_unique_reviews_table', 22),
(191, '2023_05_13_180010_make_jb_reviews_table_morphable', 22),
(192, '2023_05_16_113126_fix_account_confirmed_at', 22),
(193, '2023_07_03_135746_add_zip_code_to_jb_jobs_table', 22),
(194, '2023_07_06_022808_create_jb_coupons_table', 22),
(195, '2023_07_14_045213_add_coupon_code_column_to_jb_invoices_table', 22),
(196, '2024_01_31_022842_add_description_to_jb_packages_table', 22),
(197, '2024_02_01_080657_add_tax_id_column_to_jb_companies_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `template` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage', '<shortcode class=\"bb-shortcode\">[hero-banner style=\"style-1\" quantity=\"3\" title_1=\"HR CONSULTANCY, RECRUITING AND PLACEMENT\" subtitle_1=\"Connecting Talent with Opportunity\" button_label_1=\"Discover More\" button_link_1=\"about-us\" image_1=\"banner/overseas-recruitment.jpeg\" title_2=\"YOUR PARTNER FOR OVERSEAS RECRUITMENT\" subtitle_2=\"Empowering Your Global Workforce\" button_label_2=\"Discover More\" button_link_2=\"about-us\" image_2=\"banner/nice-banner1.jpg\" title_3=\"UNDERSTANDING YOUR UNIQUE NEEDS\" subtitle_3=\"Tailored Solutions for Your Success Journey\" button_label_3=\"DISCOVER MORE\" button_link_3=\"About-us\" image_3=\"banner/nice-banner2.jpg\"][/hero-banner]</shortcode><p>&nbsp;</p><shortcode class=\"bb-shortcode\">[intro-block style=\"style-1\" quantity=\"3\" icon_1=\"icon-mission\" image_1=\"intro-block/intro-employers.jpg\" title_1=\"Sourcing Best Talents\" description_1=\"Source top talents efficiently with Nice Overseas\" link_text_1=\"Connect Now\" link_url_1=\"contact\" icon_2=\"icon-creative-idea\" image_2=\"intro-block/intro-jobseekers.jpg\" title_2=\"Explore Opportunities\" description_2=\"Discover Your Ideal Career Opportunity Today\" link_text_2=\"Explore Jobs\" link_url_2=\"jobs?layout=grid\" icon_3=\"icon-mission\" image_3=\"intro-block/intro-profile1.jpg\" title_3=\"Company Profile\" link_text_3=\"Download Profile\" link_url_3=\"https://niceoverseaspl.com/storage/intro-block/nice-profile-2025-2.pdf\"][/intro-block]</shortcode><p>&nbsp;</p><shortcode class=\"bb-shortcode\">[about-block title=\"Welcome &amp; Namaste To Nice Overseas \" subtitle=\"Your Trusted Partner for Recruitment Solutions!\" description=\"Welcome to Nice Overseas Pvt. Ltd.—your trusted partner for exceptional recruitment and staffing solutions from the heart of Kathmandu, Nepal. As a licensed foreign employment recruiting company, we are committed to delivering ethical, fair, and standard HR solutions to our esteemed clients worldwide. With a legacy of excellence, NICE OVERSEAS stands as a premier manpower recruitment agency, renowned for sourcing top-tier professionals, skilled, semi-skilled, and unskilled manpower. Trusted by leading global companies across diverse industries, we excel in meeting manpower needs with precision, integrity, and dedication—ensuring mutual success for employers and job seekers alike.\" display_image=\"banner-sub/nice-recruitment-solutions.jpg\" cta_text=\"Call to Questions\" cta_phone=\"(+977) 9800655008 \" cta_link_text=\"DISCOVER MORE\" cta_link_url=\"about-us\" quantity=\"4\"][/about-block]</shortcode><p>&nbsp;</p><shortcode class=\"bb-shortcode\">[services title=\"OUR SERVICE AREA\" subtitle=\"Defining excellence through our comprehensive service area scope\" background_image=\"backgrounds/service-bg-1.png\" service_ids=\"1,2,3,4\" style=\"style-1\"][/services]</shortcode><p>&nbsp;</p><p>&nbsp;</p><shortcode class=\"bb-shortcode\">[job-categories title=\"Jobs By Category\" limit_category=\"5000\"][/job-categories]</shortcode><shortcode class=\"bb-shortcode\">[job-posts title=\"Latest Jobs\"][/job-posts]</shortcode><shortcode class=\"bb-shortcode\">[faq title=\"Why choose us\" subtitle=\"The Benefits of Choosing Nice Overseas\" years=\"10\" tag_line=\"Years of Working Experience\" hero_title=\"Unlocking your success\" hero_content=\"Choosing Nice Overseas for your recruitment needs provides several benefits for your organizational success\" category_ids=\"5\" style=\"style-1\"][/faq]</shortcode><p>&nbsp;</p><shortcode class=\"bb-shortcode\">[clients-carousel][/clients-carousel]</shortcode><p>&nbsp;</p><shortcode class=\"bb-shortcode\">[gallery-scroller title=\"Gallery\" gallery_id=\"2\" style=\"style-1\"][/gallery-scroller]</shortcode><shortcode class=\"bb-shortcode\">[footer-map title=\"Nice Overseas Location\" embed_url=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3533.414155893523!2d85.31178671093826!3d27.673591726880336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19f453032d57%3A0xc99afee97a2ba29a!2sNice%20Overseas%20Pvt.%20Ltd.!5e0!3m2!1sen!2snp!4v1712808885312!5m2!1sen!2snp\"][/footer-map]</shortcode>', 1, NULL, 'fullwidth-page', '', 'published', '2024-01-05 02:17:30', '2025-06-11 22:57:31'),
(13, 'About Us', '<p>&nbsp;</p><p><br><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>About Us</strong></span></p><figure class=\"image image-style-side image_resized\" style=\"width:50%;\"><img style=\"aspect-ratio:1080/1080;\" src=\"http://niceoverseaspl.com/storage/banner-sub/nice-recruitment-solutions.jpg\" alt=\"Nice_Recruitment Solutions!\" width=\"1080\" height=\"1080\" loading=\"lazy\"></figure><p>NICE OVERSEAS, headquartered in Lalitpur, Nepal, stands as a premier manpower recruitment company. With a broad spectrum of clientele across diverse disciplines, we specialize in sourcing professionals, skilled, semi-skilled, and unskilled manpower. Renowned globally, we are trusted by reputable companies to fulfill their manpower requirements. Our commitment to surpassing client expectations underpins every recruitment endeavor, fostering enduring partnerships grounded in trust, professionalism, and service satisfaction. Many of our esteemed clients attest to the benefits of our professionalism and integrity, enabling us to secure top-quality talent from renowned companies and industries worldwide.</p><p>Recognizing the uniqueness of each recruitment project, we are fully cognizant of our role in aiding clients to achieve their organizational objectives. Understanding that employees form the cornerstone of any business, we approach the selection of new staff as one of the most critical management tasks. Moreover, we are mindful of the positive impact we have on the lives and careers of the candidates we deploy. Founded by highly experienced professionals in the recruitment industry, NICE OVERSEAS is dedicated to providing comprehensive staffing solutions and quality manpower to international companies.</p>', 1, NULL, 'default', '', 'published', '2024-01-05 02:17:31', '2025-06-11 22:46:54'),
(14, 'Blog', '<div>[hero-banner title=\"All the important insights, guidance and news you need to know.\" subtitle=\"Keep up-to-date with all our latest company news and business content. The latest news, tips and advice to help you run your business with less fuss\" banner_primary=\"general/banner-blog.png\" style=\"style-4\"][/hero-banner]</div><div>[featured-post title=\"Latest Articles\" category_ids=\"1,2,3,4,5,6\"][/featured-post]</div><div>[post-category title=\"E-Commerce\" category_id=\"1\" limit=\"5\"][/post-category]</div><div>[post-category title=\"Industry Use Cases\" category_id=\"6\" limit=\"5\" style=\"style-2\"][/post-category]</div><div>[post-category title=\"Marketing Strategy\" category_id=\"7\" limit=\"5\"][/post-category]</div>', 1, NULL, 'full-width', NULL, 'published', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(15, 'Contact', '<shortcode class=\"bb-shortcode\">[contact-form title=\"Contact Us\" subtitle=\"Feel Free to Get in Touch with Us\"][/contact-form]</shortcode>', 1, NULL, 'default', '', 'published', '2024-01-05 02:17:31', '2025-04-06 14:50:55'),
(17, 'Services', '<shortcode class=\"bb-shortcode\">[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design &amp; technology.\" button_primary_label=\"Download App\" button_primary_url=\"https://www.apple.com/sg/app-store/\" button_secondary_label=\"Learn more\" button_secondary_url=\"contact\" service_ids=\"1,2,3,4,5,6\" style=\"style-3\"][/services]</shortcode><p>&nbsp;</p>', 1, NULL, 'default', NULL, 'published', '2024-01-05 02:17:31', '2024-03-24 12:20:29'),
(20, 'Teams', '<div>[banner-hero-with-teams title=\"Customers Love Our Creative Team, and So Will You\" description=\"“Highly recommend Iori Agency! They guide us on marketing initiatives and develop great strategies to increase our return on investment. The agency is excellent at being cooperative and responding quickly.”\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\" team_ids=\"1,2,3,4,5\" style=\"style-2\"][/banner-hero-with-teams]</div><div>[featured-brands quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-3\"][/featured-brands]</div><div>[teams title=\"Meet the amazing team behind Iori\" subtitle=\"Our leadership team\" team_ids=\"1,2,3,5\"][/teams]</div><div>[board-members title=\"Together we are strong\" subtitle=\"Board members\" team_ids=\"6,7,8,9\"][/board-members]</div><div>[have-a-question title=\"Have a question? Our team is happy to help you\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" image_1=\"general/question1.png\" image_2=\"general/question2.png\" image_3=\"general/question3.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\"][/have-a-question]</div><div>[step-block title=\"Core values\" subtitle=\"We break down barriers so teams can focus on what matters – working together to create products their customers love.\" button_label=\"JOIN OUR TEAM TODAY\" button_url=\"/contact\" quantity=\"6\" title_1=\"Customers First\" description_1=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers\" title_2=\"Act With Integrity\" description_2=\"We’re honest, transparent and committed to doing what’s best for our customers and our company. We openly collaborate in pursuit of the truth. We have no tolerance for politics, hidden agendas or passive-aggressive behavior.\" title_3=\"Make a Difference Every Day\" description_3=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_4=\"Think Big\" description_4=\"Being the world’s leading commerce platform requires unrivaled vision, innovation and execution. We never settle. We challenge our ideas of what’s possible in order to better meet the needs of our customers.\" title_5=\" Do the right thing\" description_5=\"Integrity is the foundation for everything we do. We are admired and respected for our commitment to honesty, trust, and transparency.\" title_6=\"Stronger united\" description_6=\"We’ve created a positive and inclusive culture that fosters open, honest, and meaningful relationships.\"][/step-block]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(24, 'Career Listing', '<div>[career-banner title=&quot;We&rsquo;re Always Searching For &lt;br&gt; Amazing People to Join Our Team.&quot; subtitle=&quot;Take a look at our current openings&quot; image=&quot;general/banner-career.png&quot; logo=&quot;general/certify.png&quot;][/career-banner]</div><div>[featured-services title=\"Why You Should Consider Applying\" subtitle=\"We`re lively, not corporate. We have the energy and boldness of a startup and the expertise and pragmatism of a scale-up. All in one place.\" quantity=\"4\" title_1=\"Connected\" description_1=\"We come together wherever we are – across time zones, regions, offices and screens. You will receive support from your teammates anytime and anywhere.\" image_1=\"icons/free.png\" action_1=\"/contact\" title_2=\"Inclusive\" description_2=\"Our teams reflect the rich diversity of our world, with equitable access to opportunity for everyone. No matter where you come from\" image_2=\"icons/cross-platform.png\" action_2=\"/contact\" title_3=\"Flexible\" description_3=\"We believe in your freedom to work when and how you work best, to help us all thrive. Only freedom and independent work can bring out the best in you.\" image_3=\"icons/identity.png\" action_3=\"/contact\" title_4=\"Persuasion\" description_4=\"Knowing that there is real value to be gained from helping people to simplify whatever it is that they do and bring.\" image_4=\"icons/persuasion.png\" action_4=\"/contact\" style=\"style-3\"][/featured-services]</div><div>[career-list title=&quot;Career Opportunities&quot; subtitle=&quot;Explore our open roles for working totally remotely, from the &lt;br&gt; office or somewhere in between.&quot; button_primary_label=&quot;Contact Us&quot; button_primary_url=&quot;/contact&quot; button_secondary_label=&quot;Learn More&quot; button_secondary_url=&quot;/job-listing&quot; career_ids=&quot;1,2,3,4,5,6&quot;][/career-list]</div><div>[step-block title=\"Core values\" subtitle=\"We break down barriers so teams can focus on what matters – working together to create products their customers love.\" button_label=\"Get Started Now\" button_url=\"/contact\" quantity=\"6\" title_1=\"Customers First\" description_1=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers\" title_2=\"Act With Integrity\" description_2=\"We’re honest, transparent and committed to doing what’s best for our customers and our company. We openly collaborate in pursuit of the truth. We have no tolerance for politics, hidden agendas or passive-aggressive behavior.\" title_3=\"Make a Difference Every Day\" description_3=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_4=\"Think Big\" description_4=\"Being the world’s leading commerce platform requires unrivaled vision, innovation and execution. We never settle. We challenge our ideas of what’s possible in order to better meet the needs of our customers.\" title_5=\" Do the right thing\" description_5=\"Integrity is the foundation for everything we do. We are admired and respected for our commitment to honesty, trust, and transparency.\" title_6=\"Stronger united\" description_6=\"We’ve created a positive and inclusive culture that fosters open, honest, and meaningful relationships.\"][/step-block]</div><div>[featured-brands title=\"Loved By Developers Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-4\"][/featured-brands]</div><div>[get-in-touch title=\"Want to talk to a marketing expert?\" subtitle=\"Get In Touch\" description=\"You need to create an account to find the best and preferred job. lorem Ipsum is simply dummy text of the printing and typesetting industry the standard dummy text ever took.\" image=\"general/img-marketing.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(27, 'Testimonials', '<section>\n    <h4>What Our Clients Say</h4>\n\n    <div class=\"testimonial\">\n        <blockquote>\n            <p>\"Working with Your Company has been an absolute pleasure. They exceeded our expectations and delivered outstanding results. Highly recommended!\"</p>\n        </blockquote>\n        <p>- John Doe, CEO of XYZ Company</p>\n    </div>\n\n    <div class=\"testimonial\">\n        <blockquote>\n            <p>\"The team at Your Company is truly professional and dedicated. Their attention to detail and commitment to excellence set them apart. We look forward to future collaborations.\"</p>\n        </blockquote>\n        <p>- Jane Smith, Marketing Director</p>\n    </div>\n</section>\n\n<section>\n    <h4>Share Your Experience</h4>\n    <p>We value feedback from our clients. If you have worked with us, we would love to hear about your experience. Please share your testimonial with us by contacting <a href=\"mailto:feedback@example.com\">feedback@example.com</a>.</p>\n</section>\n', 1, NULL, 'page-detail', NULL, 'published', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(35, 'Company', '<p>Company ContentContentContentContentContent</p>', 1, NULL, 'default', 'Company', 'published', '2024-03-31 02:14:41', '2024-03-31 02:14:41'),
(36, 'Message from Chairman', '<p>Dear Valued Clients,</p><p>It is my utmost pleasure to extend a warm welcome to you on behalf of Bua &amp; Miracle HR Consultancy. As the Chairman of our esteemed organization, I am committed to providing exceptional HR solutions and fostering mutually beneficial partnerships.</p><p>At Bua &amp; Miracle HR Consultancy, we believe in the power of human capital and its profound impact on organizational success. Our mission is to bridge talents with opportunities, enabling businesses to thrive and flourish in today\'s competitive landscape.</p><p>We strive to deliver excellence in all aspects of our services. From recruitment to HR consultancy, our dedicated team of professionals works tirelessly to meet your specific needs and exceed your expectations. Our goal is to provide you with the highest level of service, professionalism, and integrity.</p><p>We understand the challenges faced by businesses in attracting, recruiting, and retaining top talent. Through our expertise and extensive network, we aim to connect you with the best candidates who not only possess the required skills and qualifications but also align with your company\'s culture and values.</p><p>I firmly believe in building long-term relationships based on trust, transparency, and mutual respect. We value your trust in us and assure you that we will always act in your best interests. Your success is our success, and we are committed to supporting your growth and prosperity.</p><p>I invite you to experience the Bua &amp; Miracle HR Consultancy difference. Allow us to be your trusted partner in talent acquisition and human resource management. Together, we can navigate the dynamic business landscape and shape a brighter future for your organization.</p><p>Thank you for considering Bua &amp; Miracle HR Consultancy. I look forward to the opportunity to serve you and contribute to your continued success.</p><p>Warm regards,</p><p>H.E. Dr. Bu Abdullah<br>Chairman, Bua &amp; Miracle HR Consultancy</p>', 1, 'photos/dr-bu/dr-bu.jpg', 'default', '', 'published', '2024-03-31 04:50:23', '2024-04-28 01:37:00'),
(37, 'Message from Managing Director', '<p><br>Dear Clients,<br>Greetings!</p><p>We, Nice Overseas Pvt. Ltd. understand that meeting our customer’s requirements are essential to the success for our organization. Nice Overseas is committed to providing prompt, courteous, and quality customer service to our valued customers and stakeholders. Our goal is to enhance our processes and services delivery efficiency.</p><p>On the behalf of the Board of Directors, I would like to thank our valued customers and stakeholders. We believe that people make us what we are. We strive to provide an environment to people that is professional where they could grow personally and professionally with our organization. We are now in an ever-changing market environment. In such a situation, we firmly believe that trust and transparency are the key elements in persuading customers to choose our quality services. We accept that trust and transparency can create a win-win situation for a long deeper relationship through open approach.</p><p>We in a group represent unity and diversity for the people from different backgrounds and cultures with a single-minded purpose to grow along with others. Further, everyone is welcome to express their thoughts and proposals. I invite you to contact Nice Overseas and get to know us and take benefit of our services. We believe that to whom much is given, much is required and are committed to embrace challenges to channeling the right man at the right place.</p><p><strong>Sincerely</strong><br><strong>Karan Singh Bista</strong><br><strong>Managing Director</strong></p>', 1, 'team/karan-singh1.jpg', 'default', '', 'published', '2024-03-31 04:57:46', '2025-06-11 22:52:11'),
(38, 'Our Mission and Vision', '<h3 class=\"service-details__lighlight\" style=\"text-align:center;\">&nbsp;</h3><h3 class=\"service-details__lighlight\" style=\"text-align:center;\"><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Our Mission and Vision</strong></span></h3><h3 class=\"service-details__lighlight\" style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\">Mission</span></h3><p style=\"text-align:center;\">To cultivate and strengthen strategic partnerships by consistently enhancing the workforce, thereby elevating individual and organizational efficiencies.</p><h3 class=\"service-details__lighlight\" style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\">Vision</span></h3><p class=\"service-details__text\" style=\"text-align:center;\"><span>To emerge as the premier recruitment service provider, setting the benchmark for quality employment opportunities and excellence in service delivery.</span></p>', 1, 'general/mission-visio.jpg', 'default', '', 'published', '2024-03-31 04:59:50', '2025-03-29 13:12:03'),
(39, 'Why Nice Overseas?', '<p>&nbsp;</p><p><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Why Nice Overseas?</strong></span></p><p><span style=\"color:hsl(30,75%,60%);\"><strong>Choosing Nice Overseas for your recruitment needs provides several benefits for your organizational success:</strong></span></p><ul><li><strong>Access to Top Talent:</strong> Our extensive network and strategic partnerships connect you with high-caliber professionals from around the world, ensuring a diverse pool of skilled candidates.</li><li><strong>Streamlined Recruitment Process:</strong> We handle the entire recruitment process, saving you time and resources. Our expertise in international hiring ensures a smooth and efficient process.</li><li><strong>Industry Expertise:</strong> With years of experience, we understand the specific requirements and challenges of different sectors, enabling us to provide tailored recruitment solutions.</li><li><strong>Cost and Time Efficiency:</strong> Our efficient process and wide talent pool result in cost and time savings. We expedite the recruitment timeline and minimize costs associated with prolonged vacancies.</li><li><strong>Cultural Fit and Diversity:</strong> We assess candidates for compatibility with your company\'s culture, promoting a harmonious integration. Embracing diversity enhances innovation and brings fresh perspectives.</li><li><strong>Long-Term Partnerships:</strong> We prioritize building enduring relationships. Understanding your unique needs, we provide ongoing support to help you achieve long-term success. We adapt our strategies to your changing requirements.</li></ul><p>Choose Nice Overseas to attract top talent, streamline hiring, and gain a competitive edge. Let us help you build a strong and talented workforce that drives growth. Contact us today to explore the benefits of our services.</p><p>&nbsp;</p>', 1, NULL, 'default', '', 'published', '2024-03-31 05:05:03', '2025-03-29 13:24:13'),
(40, 'Company Profile', '<h2 class=\"page-header__title\">Company Profile</h2>', 1, NULL, 'default', NULL, 'published', '2024-03-31 05:06:05', '2024-03-31 05:06:08'),
(41, 'HR Consultancy in Japan', '<p>Nice Overseas Pvt. Ltd. is your trusted partner for reliable HR solutions in Japan. With a strong understanding of local market dynamics, regulations, and cultural nuances, we specialize in sourcing various manpower to meet diverse business needs.</p><p>We prioritize professionalism, integrity, and client satisfaction—delivering tailored recruitment solutions that drive success for businesses across Japan.</p>', 1, 'services/hr-consultancy-1.jpg', 'default', '', 'published', '2024-03-31 05:07:30', '2025-03-29 08:25:23'),
(42, 'Overseas Recruitment Services', '<p>Nice Overseas Pvt. Ltd. is your trusted partner for <strong>Overseas Recruitment Services</strong>, connecting businesses worldwide with top-tier talent. With a vast network, deep industry expertise, and a commitment to excellence, we provide customized staffing solutions across various sectors.</p><p>Our end-to-end services include candidate sourcing, screening, visa processing, and deployment, ensuring a smooth and compliant hiring process. We simplify international recruitment, helping companies navigate labor market complexities and cultural differences with ease.</p><p>At <strong>Nice Overseas</strong>, we prioritize transparency, integrity, and professionalism. Whether you need skilled professionals for short-term projects or long-term placements, we deliver workforce solutions that drive innovation, efficiency, and business success on a global scale.</p>', 1, 'services/overseas-recruitment-services-1.jpg', 'default', '', 'published', '2024-03-31 05:10:32', '2025-03-29 08:35:01'),
(43, 'Talent Acquisition', '<h3><strong>Talent Acquisition: Connecting You with Global Talent</strong></h3><p>At <strong>Nice Overseas Pvt. Ltd.</strong>, our <strong>Talent Acquisition</strong> service is designed to meet the unique staffing needs of businesses worldwide. We specialize in sourcing, screening, and selecting top-tier professionals, skilled, semi-skilled, and unskilled manpower from diverse industries.</p><p>🔹 <strong>Comprehensive Sourcing:</strong> Leveraging a vast network and industry expertise to identify the right talent.<br>🔹 <strong>Rigorous Screening:</strong> Conducting detailed assessments to ensure candidates meet role-specific requirements.<br>🔹 <strong>Tailored Solutions:</strong> Customizing hiring strategies based on your organization\'s unique needs.<br>🔹 <strong>Global Reach:</strong> Connecting you with qualified candidates from multiple countries.</p><p>With <strong>Nice Overseas</strong>, you gain access to exceptional talent that drives productivity, growth, and success for your business.</p>', 1, 'services/staffing-solution-10a.jpg', 'default', '', 'published', '2024-03-31 05:11:46', '2025-03-29 13:50:13'),
(44, 'Visa Processing &amp; Documentation', '<h3><strong>Visa Processing &amp; Documentation: Streamlined Solutions for Global Mobility</strong></h3><p>At <strong>Nice Overseas Pvt. Ltd.</strong>, our <strong>Visa Processing &amp; Documentation</strong> service ensures a hassle-free and compliant journey for global talent. We handle the complexities of immigration, work permits, and legal documentation with precision and efficiency.</p><p>🔹 <strong>End-to-End Visa Assistance:</strong> Managing applications, permits, and approvals for seamless international employment.<br>🔹 <strong>Compliance &amp; Regulations:</strong> Ensuring adherence to local laws and immigration policies.<br>🔹 <strong>Accurate Documentation:</strong> Preparing and verifying essential documents for smooth processing.<br>🔹 <strong>Timely Updates:</strong> Keeping clients informed at every stage of the process.</p><p>With <strong>Nice Overseas</strong>, you can confidently navigate the complexities of global mobility, enabling your workforce to thrive anywhere.</p>', 1, 'services/staffing-solution-10a.jpg', 'default', '', 'published', '2024-03-31 05:14:24', '2025-03-29 13:52:54'),
(45, 'Industries', NULL, 1, NULL, 'default', NULL, 'published', '2024-03-31 05:15:00', '2024-03-31 05:15:00'),
(46, 'Jobs', '<p><span style=\"color:hsl(210,75%,60%);font-size:18px;\"><strong>Connecting The Best Employees With The Best Companies</strong></span></p><p><strong>Nice Overseas Pvt. Ltd.</strong> is a leading HR consultancy firm specializing in comprehensive recruitment solutions worldwide. With a focus on excellence and efficiency, we connect businesses with top talent across various industries, ensuring their staffing needs are met effectively.</p><p><strong>For Employers:</strong><br>We offer customized recruitment solutions to meet your staffing needs across unskilled, semi-skilled, and professional job categories. Whether you require entry-level workers or specialized professionals, we provide efficient, tailored workforce solutions across sectors like Hospitality, Construction, Health, Security, and more.</p><p><strong>For Job Seekers:</strong><br>At <strong>Nice Overseas</strong>, we empower job seekers to explore career opportunities across diverse industries. Our expertise ensures access to employment options tailored to your skills and career goals. Whether you\'re in Hospitality, Construction, Health, or other sectors, we provide support to help you achieve professional success.</p><shortcode class=\"bb-shortcode\">[job-list jobs_per_page=\"12\" jobs_per_page_options=\"12,24,36\"][/job-list]</shortcode>', 1, NULL, 'default', '', 'published', '2024-04-07 19:11:57', '2025-04-06 16:33:03'),
(47, 'Connect with us', NULL, 1, NULL, 'default', '', 'published', '2024-04-24 21:09:17', '2024-04-24 21:09:17'),
(48, 'Corporate Profile', '<div class=\"row\"><div class=\"col-md-6\"><h3 class=\"title animated fadeIn\" style=\"text-align:center;\"><span style=\"color:hsl(210,75%,60%);font-size:18px;\"><strong>Corporate Profile</strong></span></h3><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Name of Company:</strong></span> &nbsp;<br>Nice Overseas Pvt. Ltd.</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Company Reg. No.:</strong></span> &nbsp;<br>16163710731074</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Govt. Lic. No.:</strong></span> &nbsp;<br>Govt. of Nepal, Ministry of Labor<br>License No. 10891073/074</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>PAN No. (Tax):</strong></span> &nbsp;<br>304585423</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Chairman:</strong></span> &nbsp;<br>Mr. Krishna Bahadur Bist<br>Nepal Mobile: (+977)9851242561<br>Email: krishna@niceoverseaspl.com<br>kbist1978@gmail.com</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Managing Director:</strong></span> &nbsp;<br>Karan Singh Bista<br>Malaysia Mobile: (+60) 189170121<br>Nepal Mobile : (+977) 9843363144 9808646586<br>Email : karan@niceoverseaspl.com; ksbista22@gmail.com</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>General Manager:</strong></span> &nbsp;<br>Suresh Singh Airee<br>Nepal Mobile : (+977) 9864329263<br>Email: suresh@niceoverseaspl.com<br>sureshairee77@gmail.com</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>International Business Coordinator (Japan):</strong></span> &nbsp;<br>Arogya Khanal<br>Japan Mobile : (+81) 80 4282 8353<br>Email : khanal@millefeuille-jp.com</p></div><div class=\"col-md-6\"><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Company Address:</strong></span> &nbsp;<br>Jawalakhel Chowk, Lalitpur, Nepal<br>Telephone Numbers (+977) 1 5435529 5423629<br>Email:info@niceoverseaspl.com; admin@niceoverseaspl.com;<br>hr@niceoverseaspl.com; niceoverseas5@gmail.com</p><p style=\"text-align:center;\"><span style=\"color:hsl(210,75%,60%);\"><strong>Website: www.niceovenseaspl.com</strong></span></p><p style=\"text-align:center;\"><span style=\"color:hsl(210,75%,60%);\"><strong>Whatsapp: (+977) 9800655008</strong></span></p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Nature of Business Manpower Supplying:</strong></span> &nbsp;<br>Professionals/Skilled/ Semi-Skilled/Un-Skilled</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);\"><strong>Affiliation/Certification:</strong></span> &nbsp;<br><strong>Nepal Association of Foreign Employment Agencies (NAFEA)</strong><br><strong>JITCO (License for Japan) Lic. No. : 565</strong><br><strong>ISO 9001.2015 Certification</strong><br>(Certification Number 121854/A/0001/LIK/En)</p><p style=\"text-align:center;\"><strong>Mille FeuIlle Co., Ltd., Japan:</strong><br>SSW Registered Support Organisation<br>Reg. No. 21 – 006677<br><strong>Paid Employment Placement Services</strong><br>License No.: 01-300320</p></div></div>', 1, NULL, 'default', '', 'published', '2025-03-29 12:20:24', '2025-04-06 22:57:31'),
(49, 'Core Values', '<h3 class=\"title animated fadeIn\"><span style=\"color:hsl(210,75%,60%);font-size:19px;\">Core Values</span></h3><p><strong>Promote Ethics:</strong><br>We honor our commitments and conduct business in a manner that promotes fairness, respect, honesty, and trustworthiness</p><p><strong>Encourage Communication:</strong><br>We promote all the voices to be loud and clear for better and effective transmission of information around our workplace.</p><p><strong>Celebrate Teamwork:</strong><br>We praise the diversity of thoughts, attitudes, experiences, and backgrounds and celebrate togetherness and partnership in all of our endeavors.</p><p><strong>Embrace Change and Innovation:</strong><br>We are open to new possibilities and foster creativity and boldness to cope with the ever-increasing need for improvements and changes.</p><p><strong>Focus on Our Customers:</strong><br>We are passionate about offering better customer service and satisfaction and are committed to knowing our customers’ every concern, anticipating their needs, and exceeding their expectations.</p>', 1, 'general/core-values2.jpg', 'default', '', 'published', '2025-03-29 13:13:48', '2025-03-29 13:20:21'),
(50, 'Why Nepalese Workers?', '<h3 class=\"title animated fadeIn\">&nbsp;</h3><h3 class=\"title animated fadeIn\">Why Nepalese Workers ?</h3><p>Through the experience gained over the year in the foreign employment, it has been seen that many countries have shown their interest in hiring the Nepalese professional, skilled, semi-skilled and unskilled manpower because of the following reasons.</p><p>• Nepalese workers are well known for their hard work, dedication, and possess a strong will to succeed.<br>• The employers could get the advantage of wider choice.<br>• Every categories of manpower are readily available.<br>• Legal Formalities and procedures for the recruitment at Labour Department of Nepal are simple.<br>• Nepalese workers are comparatively cost effective and their hiring cost is lower as compared to other labour exporting countries.<br>• Competent and many with skills and overseas experience.<br>• Loyal to employers, caring and compassionate to fellow workers.<br>• Nepalese workers are experienced in working in the extreme climatic conditions.</p>', 1, NULL, 'default', '', 'published', '2025-03-29 13:25:09', '2025-03-29 13:25:09'),
(51, 'Organization Chart', NULL, 1, 'general/nice-org-chart.jpg', 'default', '', 'published', '2025-03-29 13:34:58', '2025-03-29 13:34:58'),
(52, 'Company Spirit', NULL, 1, NULL, 'default', '', 'published', '2025-03-29 13:41:49', '2025-03-29 13:41:49'),
(53, 'Code Of Conduct', '<p>&nbsp;</p><p><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Code Of Conduct</strong></span></p><p>Nice Overseas Pvt. Ltd. is committed for fair, ethical and professional conduct to enhance and success in its recruitment business, and expects the same from all business clients, employees and Job seekers. All business clients, employees and Job seekers to Nice Overseas Pvt. Ltd. are expected to follow its Code of Conduct, for which the standards are placed below. The Code of Conduct will form part of our Recruitment Agreement or such other agreement forming the basis of the relationship between the Nice Overseas and the relevant clients/bodies. We believe ethics is at the major priority of everything we conduct. We are honest, ethical and want to be upfront because trust is at the foundation of our relationships with every direct &amp; indirect correspondent and each other.</p><p><strong>Standards:&nbsp;</strong><br>• Adherence to law<br>• Freely Chosen Employment<br>• Ensure Wages and Benefits<br>• Ensure Humane Treatment<br>• Fair Business Integrity<br>• Management &amp; Communication<br>• Confidentiality and privacy</p><p>Nice Overseas Pvt. Ltd. undertakes to ensure that this Code of Conduct is provided to its business clients, employees and job seekers who work with Nice Overseas Pvt. Ltd and urge to maintain and comply. In addition, Employees must abide internal rules and regulations in operations for efficient teamwork and services. A breach of this Code of Conduct by any person working for Nice Overseas Pvt. Ltd. or on its behalf shall constitute a material breach of its business relationship never be tolerated.</p>', 1, NULL, 'default', '', 'published', '2025-03-29 14:03:06', '2025-03-29 14:03:06'),
(54, 'Policy and Procedure', '<p>&nbsp;</p><p><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Policy and Procedure</strong></span></p><p>Nice Overseas Pvt. Ltd. is determining to maneuver its service by endorsing countless sustainable practices to achieve a balance of economic, environmental and social imperatives with prioritizing the interests of the stakeholders. Promoting consistency, transparency, social compliance, and adherence to statutory labor laws and regulation in our operation is the best quality of our continued success.<br><br><strong>We enact following procedure to ensure its quality:</strong></p><p>• Our top priorities are understanding customer requirements and satisfaction.<br>• Emphasizing for open competition in recruitment and selection based on its code of conduct.<br>• Upholding adequate transparency and accountability to enhance responsible and sustainable recruitment practices.<br>• Ensuring treat all candidates fairly (without any discrimination), equitably and efficiently with respect and courtesy.<br>• Emphasizing applicants’ selection based on suitability concerning the customer and regulatory requirements.<br>• Responsible Business Alliance (RBA) code of conduct and guidelines add more fuel in our continuous improvement and operational efficiencies. We would encourage and support our valued stakeholders to comply as well.</p>', 1, NULL, 'default', '', 'published', '2025-03-29 14:04:07', '2025-03-29 14:04:07'),
(55, 'Recruitment Procedures', '<p>&nbsp;</p><p><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Recruitment Procedures</strong></span></p><p><strong>1. Initial Agreement:</strong><br>On receipt of any authenticated demand from overseas employer, The Employer &amp; Nice Overseas Pvt. Ltd. should execute an initial agreement on the terms and conditions of hiring workers from Nepal, then agreement should be signed by both parities (Employer &amp; Nice Overseas Pvt. Ltd).</p><p><strong>2. Embassy Endorsement:</strong><br>Authorized employer who wishes to recruit Nepali workers should submit Demand Documents for Embassy attestation and need to fill up online application form to get appointments.</p><p><strong>3. Legal Documents:</strong><br>Once initial agreement made between both parties, employer (1st Party) should repare and submit all required documents to Nepal Embassy as mention below:<br>• Application letter to the Embassy of Nepal, Kualalumpur [Specific Format]<br>• Copy of KDN quota approval (Bahasa Malay) valid for more than 30 days.<br>• Copy of English translation of KDN quota approval letter (by Dewan Bahasa dan Pustaka /Court interpreter or translator) attested by Consular Division of the Ministry of the Foreign Affairs, Malaysia<br>• Demand letter signed by the employer and attested by the Department of abour of Malaysia and the Consular Division of the Ministry of the Foreign Affairs, Malaysia. [Specific Format]<br>• Employment Contract signed by the Employer [Specific Format]<br>• Power of Attorney [Specific Format]<br>• Demand letter, employment contract and related documents should be strictly signed by the Chief Executive Officer,company director or manager authorised by the company. The documents should be submitted to the Embassy by the CEO or company director or authorised manager.</p><p>The following documents of the authorised person should be submitted for submission and collection of the documents:<br>• Authorization letter<br>• Form 9- Company Registration Certificate (SSM)<br>• Form 49 – Register of Company Directors<br>• Copy of the EPF contribution receipt<br>• Copy of NRIC/Passport<br>• List of currently working Nepali nationals with their passport number and contact numbers<br>Other relevant documents / Information</p><p>• Salary slips of latest three months of existing Nepalese workers<br>• List of client/s where the Nepalese workers are to be deployed by the company (for the service sectors like<br>• security &amp; cleaning)</p><p><strong>4. Pre-approval:</strong><br>After demand attested by Nepal Embassy, Malaysia, demand will be uploaded to FEIMS(Foreign Employment Information Management System) and Nice Overseas will add in for pre approval through online. Employer collects the hard copy of Demand attestation and courier to Nice Overseas.</p><p><strong>5. Manpower Pooling:</strong><br>Advertisement, Screening and short listing. Once The Department of Labor is satisfied about the credibility of the demand, attestation and terms and conditions offered are conformity with the government regulation. The Government grants the permission to recruiting agency for advertise the requirement in local and national newspapers and start of recruitment process. Recruitment Company starts screening and short listing candidates before final interview.</p><p><strong>The process includes:</strong><br>1. Print and Broadcast Media Advertisement<br>2. On-the-spot-sourcing (City and Provincial)<br>3. Company referral candidates<br>4. Internal Candidate Bank</p><p><strong>6. Selection :</strong><br>The mode of selection of contract workers may be executed under the following procedures:</p><p><strong>a. Preliminary Interview:</strong><br>We maintain up to date data bank of potential candidate with full information on their skill and education, technical know how and experience as per the employer criterion. Nice Overseas will short list the candidate for pre-interview and determine the capabilities of each applicant via one-on-one interviews to ascertain who are most qualified and fit for the employer’s final selection.</p><p><strong>b. Final Interview/Selection:</strong><br>Selection by Employer’s Authorized Representative, Recruitment Company Personnel.Direct Interview (by Employer):<br>Many employers visit Nepal for final interview. We make all necessary preparations for interview.<br>We call short listed candidates for the particular day.</p><p><strong>Interview on behalf of Employer:</strong><br>Sometimes manpower importing agencies give full authority to manpower consultant<br>for entire selection procedures. In such case, we carry out interviews on behalf of employers abroad and make all dispatching arrangements to the employment destination. The selection is made purely merit basis and finally select the most competent workers from our manpower reserve.</p><p><strong>Interview through Skype:</strong><br>Sometimes manpower importing agencies select the candidate through interview via online<br>(Skype). We have all the necessary arrangements for this process.</p><p><strong>Transmittal of Resumes:</strong><br>Employer may select the candidates from the Resumes of all Prospective candidates. We<br>forward the resumes of candidates of who pass the pre-qualification interview and testing conducted at our end. In such cases, the name of the successful candidates may be relayed to us via phone, fax, or email.</p><p><strong>7. Full Documentation Assistance:</strong><br>We provide the selected applicants’ assistance in securing the travel documents required by both Labour Office and Embassy, like Trade Test, Passport, Police Clearance, Medical Certificate, Orientation and Exit Pass.</p><p><strong>8. Medical Checkup:</strong><br>The selected candidates are sent to an authorized hospital or clinics for a full medical examination (and vaccination where required).The candidates who are medically and physically fit for employment are forwarded for recruitment process such as contract signing,visa processing.</p><p><strong>9. Employment Visa Process:</strong><br>Once selected candidates are medically and physically fit, employer has to process their employment visa. The Visa system varies country to country. Where paper visa system available, employer has to make copy of issued visa available to recruitment companies as soon as visa is issued for individuals for government clearance for mobilization. Where visa has to be endorsed onto a passport, employing company has provided all necessary documents to assist visa endorsement from embassy of employing country.</p><p><strong>10. Orientation:</strong><br>Nepal labor law requires all new candidates traveling overseas for employment take orientation class to familiarize local laws &amp; orders,labor laws and immigration policy, environment and tradition and culture of employing country. Candidates should also understand their responsibilities, terms and conditions and benefits of employment prior to submitting for final approval for mobilization.</p><p><strong>11. Final Labour Approval: (Government Clearance)</strong><br>All the necessary documents like original passport, visa copy (original if not issued online), medical report, orientation certificate,insurance policy are submitted in Labor Department of Nepal for final approval and immigration clearance. The Department of Labor analyzes the documents and provides final approval.</p><p><strong>12. Travel Arrangement:</strong><br>Once paper visa is received or visa is endorsed from embassy of employing country, Employer may process for the flight (E-Ticket) or Nice Overseas will make necessary arrangement for flight ticket and departure.</p><p><strong>13. Reception from Employer:</strong><br>After the flight is confirmed we send flight details to our employer. Representative from employer will receive the candidate from airport and arrange hostel for them. Employer will provide the respective job duties to the candidates as per the employment agreement.</p>', 1, NULL, 'default', '', 'published', '2025-03-29 14:05:07', '2025-03-29 14:05:07'),
(56, 'Documents', NULL, 1, NULL, 'default', '', 'published', '2025-03-29 14:11:55', '2025-03-29 14:12:09');
INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(57, 'Legal Certificates', '<p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\"><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Legal Certificates</strong></span></p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);font-size:16px;\"><strong>ISO Certificate</strong></span></p><p style=\"text-align:center;\"><img class=\"image_resized\" style=\"aspect-ratio:712/1024;width:75%;\" src=\"http://niceoverseaspl.com/storage/docs-legal/nice-iso-certificate-712x1024-1.jpg\" alt=\"nice-iso-certificate-712x1024-1\" loading=\"lazy\" width=\"712\" height=\"1024\"><br>&nbsp;</p><p style=\"text-align:center;\"><span style=\"color:hsl(30,75%,60%);font-size:16px;\"><strong>RBA Training</strong></span></p><p style=\"text-align:center;\"><img class=\"image_resized\" style=\"aspect-ratio:682/1024;width:75%;\" src=\"http://niceoverseaspl.com/storage/docs-legal/rba-training-certificates-2-682x1024-1.jpg\" alt=\"rba-training-certificates-2-682x1024-1\" loading=\"lazy\" width=\"682\" height=\"1024\"><br><br><br>&nbsp;<span style=\"color:hsl(30,75%,60%);font-size:16px;\"><strong>RBA Training</strong></span></p><p style=\"text-align:center;\"><img class=\"image_resized\" style=\"aspect-ratio:679/1024;width:75%;\" src=\"http://niceoverseaspl.com/storage/docs-legal/rba-training-certificates-3.jpg\" alt=\"rba-training-certificates-3\" loading=\"lazy\" width=\"679\" height=\"1024\"><br><br><span style=\"color:hsl(30,75%,60%);font-size:16px;\"><strong>RBA Training</strong></span></p><p style=\"text-align:center;\"><img class=\"image_resized\" style=\"aspect-ratio:689/1024;width:75%;\" src=\"http://niceoverseaspl.com/storage/docs-legal/rba-training-1.jpg\" alt=\"rba-training-1\" loading=\"lazy\" width=\"689\" height=\"1024\"><br><br>&nbsp;</p>', 1, NULL, 'default', '', 'published', '2025-03-29 14:15:21', '2025-04-06 22:14:58'),
(58, 'Demand Documents', '<h3 class=\"title animated fadeIn\">&nbsp;</h3><h3 class=\"title animated fadeIn\"><span style=\"color:hsl(210,75%,60%);font-size:22px;\"><strong>Demand Documents</strong></span></h3><p><strong>MALAYSIA</strong></p><p>1. Demand Letter<br>2. Power of Attorney<br>3. Agency Agreement<br>4. Employment Contract<br>5. Guarantee Letter<br>(Above documents must be attested by Notary Public<br>and Nepalese Embassy )<br><br><strong>U.A.E., QATAR, OMAN, BAHRAIN</strong></p><p>1. Demand Letter<br>2. Power of Attorney<br>3. Agency Agreement<br>4. Employment Contract<br>5. Guarantee Letter<br>(Above documents must be attested by Chamber of<br>Commerce and Nepalese Embassy)</p>', 1, NULL, 'default', '', 'published', '2025-03-29 14:19:14', '2025-03-29 14:19:14'),
(59, 'More', NULL, 1, NULL, 'default', '', 'published', '2025-03-29 14:22:14', '2025-03-29 14:22:14'),
(60, 'aaaaaaaaaa', '<shortcode class=\"bb-shortcode\">[gallery image_1=\"banner/overseas-recruitment.jpeg\"][/gallery]</shortcode>', 1, NULL, 'default', '', 'published', '2025-04-06 23:03:54', '2025-04-06 23:10:03'),
(62, 'abcd dance', '<p>a fasdfasdf sdf asdf asfa sdf asdf asdf asdfa sdf</p>', 1, 'manpower-supply-to-different-countries.jpg', 'default', 'a sfasfasdfsf', 'published', '2025-04-06 23:17:09', '2025-04-06 23:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) NOT NULL,
  `pages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(120) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `charge_id` varchar(255) DEFAULT NULL,
  `payment_channel` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) DEFAULT 'pending',
  `payment_type` varchar(255) DEFAULT 'confirm',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL
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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) NOT NULL,
  `posts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(255) NOT NULL,
  `revisionable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `key` varchar(120) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\Page\\Models\\Page', 34, 1, 'template', 'default', 'info-page', '2024-03-23 10:47:10', '2024-03-23 10:47:10'),
(2, 'Botble\\Page\\Models\\Page', 13, 1, 'template', 'full-width', 'info-page', '2024-03-23 21:10:38', '2024-03-23 21:10:38'),
(3, 'Botble\\Page\\Models\\Page', 1, 1, 'template', 'full-width', 'default', '2024-03-23 21:14:46', '2024-03-23 21:14:46'),
(4, 'Botble\\Page\\Models\\Page', 1, 1, 'template', 'default', 'fullwidth-page', '2024-03-23 22:26:54', '2024-03-23 22:26:54'),
(5, 'Botble\\Page\\Models\\Page', 1, 1, 'name', 'Homepage 1', 'Homepage', '2024-03-24 01:26:42', '2024-03-24 01:26:42'),
(6, 'Botble\\Page\\Models\\Page', 13, 1, 'image', NULL, 'general/about.jpg', '2024-03-24 03:04:10', '2024-03-24 03:04:10'),
(7, 'Botble\\Page\\Models\\Page', 17, 1, 'template', 'full-width', 'default', '2024-03-24 12:04:18', '2024-03-24 12:04:18'),
(8, 'Botble\\Page\\Models\\Page', 15, 1, 'template', 'full-width', 'default', '2024-03-29 02:26:00', '2024-03-29 02:26:00'),
(9, 'Botble\\Page\\Models\\Page', 38, 1, 'template', 'default', 'info-page', '2024-03-31 10:52:03', '2024-03-31 10:52:03'),
(10, 'Botble\\Page\\Models\\Page', 39, 1, 'template', 'default', 'info-page', '2024-03-31 11:20:45', '2024-03-31 11:20:45'),
(11, 'Botble\\Page\\Models\\Page', 41, 1, 'template', 'default', 'info-page', '2024-04-06 09:37:27', '2024-04-06 09:37:27'),
(12, 'Botble\\Page\\Models\\Page', 43, 1, 'name', 'Global Reach', 'Global Manpower Solution', '2024-04-06 10:06:25', '2024-04-06 10:06:25'),
(13, 'Botble\\Page\\Models\\Page', 43, 1, 'template', 'default', 'info-page', '2024-04-06 10:06:44', '2024-04-06 10:06:44'),
(14, 'Botble\\Page\\Models\\Page', 43, 1, 'template', 'info-page', 'fullwidth-page', '2024-04-06 10:07:03', '2024-04-06 10:07:03'),
(15, 'Botble\\Page\\Models\\Page', 43, 1, 'template', 'fullwidth-page', 'default', '2024-04-06 10:07:15', '2024-04-06 10:07:15'),
(16, 'Botble\\Page\\Models\\Page', 44, 1, 'image', 'pages/staffing-solutions.jpg', 'services/staffing-solution-10a.jpg', '2024-04-06 10:08:45', '2024-04-06 10:08:45'),
(17, 'Botble\\Page\\Models\\Page', 43, 1, 'image', 'pages/manpower-supply-to-different-countries.jpg', 'services/global-manpower-solution.jpg', '2024-04-06 10:10:59', '2024-04-06 10:10:59'),
(18, 'Botble\\Page\\Models\\Page', 42, 1, 'image', 'pages/overseas-recruitment-services.jpg', 'services/overseas-recruitment-services-1.jpg', '2024-04-06 10:11:40', '2024-04-06 10:11:40'),
(19, 'Botble\\Page\\Models\\Page', 41, 1, 'image', 'pages/hr-consultancy-in-uae.jpg', 'services/hr-consultancy-1.jpg', '2024-04-06 10:17:07', '2024-04-06 10:17:07'),
(20, 'Botble\\Page\\Models\\Page', 13, 1, 'template', 'info-page', 'default', '2024-04-06 10:52:57', '2024-04-06 10:52:57'),
(21, 'Botble\\Page\\Models\\Page', 1, 1, 'description', NULL, '', '2024-04-08 17:40:52', '2024-04-08 17:40:52'),
(22, 'Botble\\Page\\Models\\Page', 46, 1, 'description', NULL, '', '2024-04-16 03:54:04', '2024-04-16 03:54:04'),
(23, 'Botble\\Page\\Models\\Page', 46, 1, 'template', 'default', 'info-page', '2024-04-16 03:54:43', '2024-04-16 03:54:43'),
(24, 'Botble\\Page\\Models\\Page', 46, 1, 'template', 'info-page', 'fullwidth-page', '2024-04-16 03:54:57', '2024-04-16 03:54:57'),
(25, 'Botble\\Page\\Models\\Page', 46, 1, 'template', 'fullwidth-page', 'default', '2024-04-16 03:55:08', '2024-04-16 03:55:08'),
(26, 'Botble\\Page\\Models\\Page', 38, 1, 'template', 'info-page', 'default', '2024-04-17 03:46:10', '2024-04-17 03:46:10'),
(27, 'Botble\\Page\\Models\\Page', 38, 1, 'description', NULL, '', '2024-04-17 03:46:10', '2024-04-17 03:46:10'),
(28, 'Botble\\Page\\Models\\Page', 41, 1, 'template', 'info-page', 'default', '2024-04-17 04:08:25', '2024-04-17 04:08:25'),
(29, 'Botble\\Page\\Models\\Page', 41, 1, 'description', NULL, '', '2024-04-17 04:08:25', '2024-04-17 04:08:25'),
(30, 'Botble\\Page\\Models\\Page', 39, 1, 'name', 'Why Bua & Miracle HR Consultancy?', 'Why Bua &amp; Miracle HR Consultancy?', '2024-04-17 04:08:44', '2024-04-17 04:08:44'),
(31, 'Botble\\Page\\Models\\Page', 39, 1, 'template', 'info-page', 'default', '2024-04-17 04:08:44', '2024-04-17 04:08:44'),
(32, 'Botble\\Page\\Models\\Page', 39, 1, 'description', NULL, '', '2024-04-17 04:08:44', '2024-04-17 04:08:44'),
(33, 'Botble\\Page\\Models\\Page', 36, 1, 'description', NULL, '', '2024-04-18 10:06:50', '2024-04-18 10:06:50'),
(34, 'Botble\\Page\\Models\\Page', 36, 1, 'image', 'photos/dr-bu/dr-bu-770.jpg', 'photos/dr-bu/dr-bu.jpg', '2024-04-18 10:07:23', '2024-04-18 10:07:23'),
(35, 'Botble\\Page\\Models\\Page', 13, 1, 'description', NULL, '', '2024-04-21 10:44:19', '2024-04-21 10:44:19'),
(36, 'Botble\\Page\\Models\\Page', 37, 1, 'description', NULL, '', '2024-04-22 12:11:32', '2024-04-22 12:11:32'),
(37, 'Botble\\Page\\Models\\Page', 15, 1, 'description', NULL, '', '2024-04-24 20:37:15', '2024-04-24 20:37:15'),
(38, 'Botble\\Page\\Models\\Page', 42, 1, 'description', NULL, '', '2024-04-28 01:41:26', '2024-04-28 01:41:26'),
(39, 'Botble\\Page\\Models\\Page', 42, 1, 'template', 'default', 'info-page', '2024-04-28 01:41:54', '2024-04-28 01:41:54'),
(40, 'Botble\\Page\\Models\\Page', 42, 1, 'template', 'info-page', 'default', '2024-04-28 01:42:07', '2024-04-28 01:42:07'),
(41, 'Botble\\Page\\Models\\Page', 41, 1, 'name', 'HR Consultancy in UAE', 'HR Consultancy in Japan', '2025-03-29 08:21:39', '2025-03-29 08:21:39'),
(42, 'Botble\\Page\\Models\\Page', 43, 1, 'description', NULL, '', '2025-03-29 08:40:47', '2025-03-29 08:40:47'),
(43, 'Botble\\Page\\Models\\Page', 43, 1, 'name', 'Global Manpower Solution', 'Global Manpower Solution - Talent Acquisition', '2025-03-29 08:41:51', '2025-03-29 08:41:51'),
(44, 'Botble\\Page\\Models\\Page', 43, 1, 'name', 'Global Manpower Solution - Talent Acquisition', 'Talent Acquisition', '2025-03-29 08:43:13', '2025-03-29 08:43:13'),
(45, 'Botble\\Page\\Models\\Page', 44, 1, 'name', 'Staffing Solution', 'Visa Processing &amp; Documentation', '2025-03-29 08:55:49', '2025-03-29 08:55:49'),
(46, 'Botble\\Page\\Models\\Page', 44, 1, 'description', NULL, '', '2025-03-29 08:55:49', '2025-03-29 08:55:49'),
(47, 'Botble\\Page\\Models\\Page', 46, 1, 'image', NULL, 'banner-sub/job-search.jpg', '2025-03-29 11:35:25', '2025-03-29 11:35:25'),
(48, 'Botble\\Page\\Models\\Page', 46, 1, 'image', 'banner-sub/job-search.jpg', NULL, '2025-03-29 11:38:29', '2025-03-29 11:38:29'),
(49, 'Botble\\Page\\Models\\Page', 13, 1, 'image', 'general/about.jpg', NULL, '2025-03-29 12:04:12', '2025-03-29 12:04:12'),
(50, 'Botble\\Page\\Models\\Page', 37, 1, 'image', 'photos/bijay-md.jpg', 'team/mdkaran.png', '2025-03-29 12:47:44', '2025-03-29 12:47:44'),
(51, 'Botble\\Page\\Models\\Page', 37, 1, 'image', 'team/mdkaran.png', 'team/mdkaran-bist.jpg', '2025-03-29 12:52:28', '2025-03-29 12:52:28'),
(52, 'Botble\\Page\\Models\\Page', 37, 1, 'image', 'team/mdkaran-bist.jpg', 'team/mdkaran-bist-1.JPG', '2025-03-29 12:55:19', '2025-03-29 12:55:19'),
(53, 'Botble\\Page\\Models\\Page', 38, 1, 'image', 'general/mission-vision.jpg', 'general/mission-visio.jpg', '2025-03-29 13:10:08', '2025-03-29 13:10:08'),
(54, 'Botble\\Page\\Models\\Page', 49, 1, 'image', 'general/corporate-values.jpg', 'general/core-values2.jpg', '2025-03-29 13:20:21', '2025-03-29 13:20:21'),
(55, 'Botble\\Page\\Models\\Page', 39, 1, 'name', 'Why Bua &amp; Miracle HR Consultancy?', 'Why Nice Overseas?', '2025-03-29 13:22:34', '2025-03-29 13:22:34'),
(56, 'Botble\\Page\\Models\\Page', 39, 1, 'image', 'pages/why-bua.jpg', NULL, '2025-03-29 13:22:34', '2025-03-29 13:22:34'),
(57, 'Botble\\Page\\Models\\Page', 43, 1, 'image', 'services/global-manpower-solution.jpg', 'services/staffing-solution-10a.jpg', '2025-03-29 13:46:25', '2025-03-29 13:46:25'),
(58, 'Botble\\Page\\Models\\Page', 60, 1, 'name', 'aaaaaaaaaa', 'Gallery', '2025-04-06 23:07:37', '2025-04-06 23:07:37'),
(59, 'Botble\\Page\\Models\\Page', 60, 1, 'name', 'Gallery', 'aaaaaaaaaa', '2025-04-06 23:10:03', '2025-04-06 23:10:03'),
(60, 'Botble\\Page\\Models\\Page', 62, 1, 'image', NULL, 'manpower-supply-to-different-countries.jpg', '2025-04-06 23:18:07', '2025-04-06 23:18:07'),
(61, 'Botble\\Page\\Models\\Page', 37, 1, 'image', 'team/mdkaran-bist-1.JPG', 'team/karan-singh1.jpg', '2025-06-11 22:52:12', '2025-06-11 22:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `permissions` text DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\r\n  \"users.index\": true,\r\n  \"users.create\": true,\r\n  \"users.edit\": true,\r\n  \"users.destroy\": true,\r\n  \"roles.index\": true,\r\n  \"roles.create\": true,\r\n  \"roles.edit\": true,\r\n  \"roles.destroy\": true,\r\n  \"core.system\": true,\r\n  \"core.manage.license\": true,\r\n  \"extensions.index\": true,\r\n  \"media.index\": true,\r\n  \"files.index\": true,\r\n  \"files.create\": true,\r\n  \"files.edit\": true,\r\n  \"files.trash\": true,\r\n  \"files.destroy\": true,\r\n  \"folders.index\": true,\r\n  \"folders.create\": true,\r\n  \"folders.edit\": true,\r\n  \"folders.trash\": true,\r\n  \"folders.destroy\": true,\r\n  \"settings.index\": true,\r\n  \"settings.options\": true,\r\n  \"settings.email\": true,\r\n  \"settings.media\": true,\r\n  \"settings.cronjob\": true,\r\n  \"settings.admin-appearance\": true,\r\n  \"settings.cache\": true,\r\n  \"settings.datatables\": true,\r\n  \"settings.email.rules\": true,\r\n  \"menus.index\": true,\r\n  \"menus.create\": true,\r\n  \"menus.edit\": true,\r\n  \"menus.destroy\": true,\r\n  \"optimize.settings\": true,\r\n  \"pages.index\": true,\r\n  \"pages.create\": true,\r\n  \"pages.edit\": true,\r\n  \"pages.destroy\": true,\r\n  \"plugins.index\": true,\r\n  \"plugins.edit\": true,\r\n  \"plugins.remove\": true,\r\n  \"plugins.marketplace\": true,\r\n  \"core.appearance\": true,\r\n  \"theme.index\": true,\r\n  \"theme.activate\": true,\r\n  \"theme.remove\": true,\r\n  \"theme.options\": true,\r\n  \"theme.custom-css\": true,\r\n  \"theme.custom-js\": true,\r\n  \"theme.custom-html\": true,\r\n  \"widgets.index\": true,\r\n  \"analytics.general\": true,\r\n  \"analytics.page\": true,\r\n  \"analytics.browser\": true,\r\n  \"analytics.referrer\": true,\r\n  \"analytics.settings\": true,\r\n  \"announcements.index\": true,\r\n  \"announcements.create\": true,\r\n  \"announcements.edit\": true,\r\n  \"announcements.destroy\": true,\r\n  \"announcements.settings\": true,\r\n  \"audit-log.index\": true,\r\n  \"audit-log.destroy\": true,\r\n  \"backups.index\": true,\r\n  \"backups.create\": true,\r\n  \"backups.restore\": true,\r\n  \"backups.destroy\": true,\r\n  \"plugins.blog\": true,\r\n  \"posts.index\": true,\r\n  \"posts.create\": true,\r\n  \"posts.edit\": true,\r\n  \"posts.destroy\": true,\r\n  \"categories.index\": true,\r\n  \"categories.create\": true,\r\n  \"categories.edit\": true,\r\n  \"categories.destroy\": true,\r\n  \"tags.index\": true,\r\n  \"tags.create\": true,\r\n  \"tags.edit\": true,\r\n  \"tags.destroy\": true,\r\n  \"blog.settings\": true,\r\n  \"plugins.business-services\": true,\r\n  \"business-services.service-categories.index\": true,\r\n  \"business-services.service-categories.create\": true,\r\n  \"business-services.service-categories.edit\": true,\r\n  \"business-services.service-categories.destroy\": true,\r\n  \"business-services.services.index\": true,\r\n  \"business-services.services.create\": true,\r\n  \"business-services.services.edit\": true,\r\n  \"business-services.services.destroy\": true,\r\n  \"business-services.packages.index\": true,\r\n  \"business-services.packages.create\": true,\r\n  \"business-services.packages.edit\": true,\r\n  \"business-services.packages.destroy\": true,\r\n  \"business-services.service-industries.index\": true,\r\n  \"business-services.service-industries.create\": true,\r\n  \"business-services.service-industries.edit\": true,\r\n  \"business-services.service-industries.destroy\": true,\r\n  \"plugins.captcha\": true,\r\n  \"captcha.settings\": true,\r\n  \"careers.index\": true,\r\n  \"careers.create\": true,\r\n  \"careers.edit\": true,\r\n  \"careers.destroy\": true,\r\n  \"contacts.index\": true,\r\n  \"contacts.edit\": true,\r\n  \"contacts.destroy\": true,\r\n  \"contact.settings\": true,\r\n  \"plugins.ecommerce\": true,\r\n  \"ecommerce.settings\": true,\r\n  \"ecommerce.report.index\": true,\r\n  \"products.index\": true,\r\n  \"products.create\": true,\r\n  \"products.edit\": true,\r\n  \"products.destroy\": true,\r\n  \"products.duplicate\": true,\r\n  \"product-categories.index\": true,\r\n  \"product-categories.create\": true,\r\n  \"product-categories.edit\": true,\r\n  \"product-categories.destroy\": true,\r\n  \"product-tag.index\": true,\r\n  \"product-tag.create\": true,\r\n  \"product-tag.edit\": true,\r\n  \"product-tag.destroy\": true,\r\n  \"brands.index\": true,\r\n  \"brands.create\": true,\r\n  \"brands.edit\": true,\r\n  \"brands.destroy\": true,\r\n  \"product-collections.index\": true,\r\n  \"product-collections.create\": true,\r\n  \"product-collections.edit\": true,\r\n  \"product-collections.destroy\": true,\r\n  \"product-attribute-sets.index\": true,\r\n  \"product-attribute-sets.create\": true,\r\n  \"product-attribute-sets.edit\": true,\r\n  \"product-attribute-sets.destroy\": true,\r\n  \"product-attributes.index\": true,\r\n  \"product-attributes.create\": true,\r\n  \"product-attributes.edit\": true,\r\n  \"product-attributes.destroy\": true,\r\n  \"tax.index\": true,\r\n  \"tax.create\": true,\r\n  \"tax.edit\": true,\r\n  \"tax.destroy\": true,\r\n  \"reviews.index\": true,\r\n  \"reviews.create\": true,\r\n  \"reviews.destroy\": true,\r\n  \"reviews.publish\": true,\r\n  \"reviews.reply\": true,\r\n  \"shipping_methods.index\": true,\r\n  \"ecommerce.shipping-rule-items.index\": true,\r\n  \"ecommerce.shipping-rule-items.create\": true,\r\n  \"ecommerce.shipping-rule-items.edit\": true,\r\n  \"ecommerce.shipping-rule-items.destroy\": true,\r\n  \"ecommerce.shipping-rule-items.bulk-import\": true,\r\n  \"ecommerce.shipments.index\": true,\r\n  \"ecommerce.shipments.create\": true,\r\n  \"ecommerce.shipments.edit\": true,\r\n  \"ecommerce.shipments.destroy\": true,\r\n  \"orders.index\": true,\r\n  \"orders.create\": true,\r\n  \"orders.edit\": true,\r\n  \"orders.destroy\": true,\r\n  \"discounts.index\": true,\r\n  \"discounts.create\": true,\r\n  \"discounts.edit\": true,\r\n  \"discounts.destroy\": true,\r\n  \"customers.index\": true,\r\n  \"customers.create\": true,\r\n  \"customers.edit\": true,\r\n  \"customers.destroy\": true,\r\n  \"flash-sale.index\": true,\r\n  \"flash-sale.create\": true,\r\n  \"flash-sale.edit\": true,\r\n  \"flash-sale.destroy\": true,\r\n  \"product-label.index\": true,\r\n  \"product-label.create\": true,\r\n  \"product-label.edit\": true,\r\n  \"product-label.destroy\": true,\r\n  \"ecommerce.import.products.index\": true,\r\n  \"ecommerce.export.products.index\": true,\r\n  \"order_returns.index\": true,\r\n  \"order_returns.edit\": true,\r\n  \"order_returns.destroy\": true,\r\n  \"global-option.index\": true,\r\n  \"global-option.create\": true,\r\n  \"global-option.edit\": true,\r\n  \"global-option.destroy\": true,\r\n  \"ecommerce.invoice.index\": true,\r\n  \"ecommerce.invoice.edit\": true,\r\n  \"ecommerce.invoice.destroy\": true,\r\n  \"ecommerce.invoice-template.index\": true,\r\n  \"ecommerce.settings.general\": true,\r\n  \"ecommerce.settings.currencies\": true,\r\n  \"ecommerce.settings.products\": true,\r\n  \"ecommerce.settings.product-search\": true,\r\n  \"ecommerce.settings.digital-products\": true,\r\n  \"ecommerce.settings.store-locators\": true,\r\n  \"ecommerce.settings.invoices\": true,\r\n  \"ecommerce.settings.product-reviews\": true,\r\n  \"ecommerce.settings.customers\": true,\r\n  \"ecommerce.settings.shopping\": true,\r\n  \"ecommerce.settings.taxes\": true,\r\n  \"ecommerce.settings.shipping\": true,\r\n  \"ecommerce.settings.tracking\": true,\r\n  \"ecommerce.settings.standard-and-format\": true,\r\n  \"ecommerce.settings.checkout\": true,\r\n  \"ecommerce.settings.return\": true,\r\n  \"ecommerce.settings.flash-sale\": true,\r\n  \"plugin.faq\": true,\r\n  \"faq.index\": true,\r\n  \"faq.create\": true,\r\n  \"faq.edit\": true,\r\n  \"faq.destroy\": true,\r\n  \"faq_category.index\": true,\r\n  \"faq_category.create\": true,\r\n  \"faq_category.edit\": true,\r\n  \"faq_category.destroy\": true,\r\n  \"faqs.settings\": true,\r\n  \"languages.index\": true,\r\n  \"languages.create\": true,\r\n  \"languages.edit\": true,\r\n  \"languages.destroy\": true,\r\n  \"plugin.location\": true,\r\n  \"country.index\": true,\r\n  \"country.create\": true,\r\n  \"country.edit\": true,\r\n  \"country.destroy\": true,\r\n  \"state.index\": true,\r\n  \"state.create\": true,\r\n  \"state.edit\": true,\r\n  \"state.destroy\": true,\r\n  \"city.index\": true,\r\n  \"city.create\": true,\r\n  \"city.edit\": true,\r\n  \"city.destroy\": true,\r\n  \"location.bulk-import.index\": true,\r\n  \"location.export.index\": true,\r\n  \"newsletter.index\": true,\r\n  \"newsletter.destroy\": true,\r\n  \"newsletter.settings\": true,\r\n  \"payment.index\": true,\r\n  \"payments.settings\": true,\r\n  \"payment.destroy\": true,\r\n  \"social-login.settings\": true,\r\n  \"team.index\": true,\r\n  \"team.create\": true,\r\n  \"team.edit\": true,\r\n  \"team.destroy\": true,\r\n  \"testimonial.index\": true,\r\n  \"testimonial.create\": true,\r\n  \"testimonial.edit\": true,\r\n  \"testimonial.destroy\": true,\r\n  \"plugins.translation\": true,\r\n  \"translations.locales\": true,\r\n  \"translations.theme-translations\": true,\r\n  \"translations.index\": true\r\n}', 'Admin users role', 1, 2, 2, '2024-01-05 02:17:19', '2024-01-05 02:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'media_random_hash', 'b331ba541a2125f43a988688d5109a60', NULL, '2025-04-06 15:41:56'),
(2, 'api_enabled', '0', NULL, '2025-04-06 15:41:56'),
(3, 'activated_plugins', '[\"announcement\",\"business-services\",\"contact\",\"cookie-consent\",\"faq\",\"location\",\"newsletter\",\"team\",\"testimonial\",\"gallery\",\"job-board\"]', NULL, '2025-04-06 15:41:56'),
(4, 'ai_writer_proxy_enable', '0', NULL, '2025-04-06 15:41:56'),
(5, 'ai_writer_proxy_protocol', NULL, NULL, '2025-04-06 15:41:56'),
(6, 'ai_writer_proxy_ip', NULL, NULL, '2025-04-06 15:41:56'),
(7, 'ai_writer_proxy_port', NULL, NULL, '2025-04-06 15:41:56'),
(8, 'ai_writer_proxy_username', NULL, NULL, '2025-04-06 15:41:56'),
(9, 'ai_writer_proxy_password', NULL, NULL, '2025-04-06 15:41:56'),
(10, 'ai_writer_prompt_template', '[{\"title\":\"Product Content\",\"content\":\"You will be a marketer. I will give the information of the product, you will write an introductory article about that product, the article requires google seo standards and is highly persuasive to increase the rate of users closing orders.\\nParameters product:\"},{\"title\":\"Post Content\",\"content\":\"You will be a marketer. Articles about:\"}]', NULL, '2025-04-06 15:41:56'),
(11, 'ai_writer_openai_key', NULL, NULL, '2025-04-06 15:41:56'),
(12, 'ai_writer_openai_temperature', '1', NULL, '2025-04-06 15:41:56'),
(13, 'ai_writer_openai_max_tokens', '2000', NULL, '2025-04-06 15:41:56'),
(14, 'ai_writer_openai_frequency_penalty', '0', NULL, '2025-04-06 15:41:56'),
(15, 'ai_writer_openai_presence_penalty', '0', NULL, '2025-04-06 15:41:56'),
(16, 'ai_writer_openai_models', '[\"gpt-3.5-turbo\"]', NULL, '2025-04-06 15:41:56'),
(17, 'ai_writer_openai_default_model', 'gpt-3.5-turbo', NULL, '2025-04-06 15:41:56'),
(18, 'ai_writer_spin_template', '[]', NULL, '2025-04-06 15:41:56'),
(21, 'theme', 'miraclehrhub', NULL, '2025-04-06 15:41:56'),
(22, 'show_admin_bar', '0', NULL, '2025-04-06 15:41:56'),
(30, 'admin_favicon', 'logo/bcms-fav-01.png', NULL, '2025-04-06 15:41:56'),
(31, 'admin_logo', 'logo/bcms5454-02.jpg', NULL, '2025-04-06 15:41:56'),
(32, 'permalink-botble-blog-models-post', 'blog', NULL, '2025-04-06 15:41:56'),
(33, 'permalink-botble-blog-models-category', 'blog', NULL, '2025-04-06 15:41:56'),
(37, 'plugins_ecommerce_customer_new_order_status', '0', NULL, '2025-04-06 15:41:56'),
(38, 'plugins_ecommerce_admin_new_order_status', '0', NULL, '2025-04-06 15:41:56'),
(39, 'ecommerce_is_enabled_support_digital_products', '1', NULL, '2025-04-06 15:41:56'),
(40, 'ecommerce_load_countries_states_cities_from_location_plugin', '0', NULL, '2025-04-06 15:41:56'),
(41, 'payment_bank_transfer_display_bank_info_at_the_checkout_success_page', '1', NULL, '2025-04-06 15:41:56'),
(42, 'ecommerce_product_sku_format', 'IO-2443-[%S]', NULL, '2025-04-06 15:41:56'),
(68, 'announcement_max_width', '1390', NULL, '2025-04-06 15:41:56'),
(69, 'announcement_text_color', '#024430', NULL, '2025-04-06 15:41:56'),
(70, 'announcement_background_color', '#FFE7BB', NULL, '2025-04-06 15:41:56'),
(71, 'announcement_text_alignment', 'start', NULL, '2025-04-06 15:41:56'),
(72, 'announcement_dismissible', '1', NULL, '2025-04-06 15:41:56'),
(75, 'is_completed_get_started', '1', NULL, '2025-04-06 15:41:56'),
(100, 'login_screen_backgrounds', '[]', NULL, '2025-04-06 15:41:56'),
(101, 'admin_title', 'ByteCMS', NULL, '2025-04-06 15:41:56'),
(102, 'rich_editor', 'ckeditor', NULL, '2025-04-06 15:41:56'),
(103, 'admin_appearance_layout', 'vertical', NULL, '2025-04-06 15:41:56'),
(104, 'admin_appearance_show_menu_item_icon', '0', NULL, '2025-04-06 15:41:56'),
(105, 'admin_appearance_container_width', 'container-fluid', NULL, '2025-04-06 15:41:56'),
(106, 'show_theme_guideline_link', '1', NULL, '2025-04-06 15:41:56'),
(107, 'admin_primary_font', 'Inter', NULL, '2025-04-06 15:41:56'),
(108, 'admin_primary_color', '#206bc4', NULL, '2025-04-06 15:41:56'),
(109, 'admin_secondary_color', '#6c7a91', NULL, '2025-04-06 15:41:56'),
(110, 'admin_heading_color', 'inherit', NULL, '2025-04-06 15:41:56'),
(111, 'admin_text_color', '#182433', NULL, '2025-04-06 15:41:56'),
(112, 'admin_link_color', '#206bc4', NULL, '2025-04-06 15:41:56'),
(113, 'admin_link_hover_color', '#1a569d', NULL, '2025-04-06 15:41:56'),
(114, 'admin_appearance_locale_direction', 'ltr', NULL, '2025-04-06 15:41:56'),
(115, 'membership_authorization_at', '2025-04-06 06:19:28', NULL, '2025-04-06 15:41:56'),
(116, 'licensed_to', 'Byterays Technology', NULL, '2025-04-06 15:41:56'),
(117, 'media_driver', 'public', NULL, '2025-04-06 15:41:56'),
(118, 'media_aws_access_key_id', '', NULL, '2025-04-06 15:41:56'),
(119, 'media_aws_secret_key', '', NULL, '2025-04-06 15:41:56'),
(120, 'media_aws_default_region', '', NULL, '2025-04-06 15:41:56'),
(121, 'media_aws_bucket', '', NULL, '2025-04-06 15:41:56'),
(122, 'media_aws_url', '', NULL, '2025-04-06 15:41:56'),
(123, 'media_r2_access_key_id', '', NULL, '2025-04-06 15:41:56'),
(124, 'media_r2_secret_key', '', NULL, '2025-04-06 15:41:56'),
(125, 'media_r2_bucket', '', NULL, '2025-04-06 15:41:56'),
(126, 'media_r2_endpoint', '', NULL, '2025-04-06 15:41:56'),
(127, 'media_r2_url', '', NULL, '2025-04-06 15:41:56'),
(128, 'media_wasabi_access_key_id', '', NULL, '2025-04-06 15:41:56'),
(129, 'media_wasabi_secret_key', '', NULL, '2025-04-06 15:41:56'),
(130, 'media_wasabi_default_region', '', NULL, '2025-04-06 15:41:56'),
(131, 'media_wasabi_bucket', '', NULL, '2025-04-06 15:41:56'),
(132, 'media_wasabi_root', '', NULL, '2025-04-06 15:41:56'),
(133, 'media_do_spaces_access_key_id', '', NULL, '2025-04-06 15:41:56'),
(134, 'media_do_spaces_secret_key', '', NULL, '2025-04-06 15:41:56'),
(135, 'media_do_spaces_default_region', '', NULL, '2025-04-06 15:41:56'),
(136, 'media_do_spaces_bucket', '', NULL, '2025-04-06 15:41:56'),
(137, 'media_do_spaces_endpoint', '', NULL, '2025-04-06 15:41:56'),
(138, 'media_bunnycdn_hostname', '', NULL, '2025-04-06 15:41:56'),
(139, 'media_bunnycdn_zone', '', NULL, '2025-04-06 15:41:56'),
(140, 'media_bunnycdn_key', '', NULL, '2025-04-06 15:41:56'),
(141, 'media_bunnycdn_region', '', NULL, '2025-04-06 15:41:56'),
(142, 'media_turn_off_automatic_url_translation_into_latin', '0', NULL, '2025-04-06 15:41:56'),
(143, 'media_use_original_name_for_file_path', '0', NULL, '2025-04-06 15:41:56'),
(144, 'media_default_placeholder_image', '', NULL, '2025-04-06 15:41:56'),
(145, 'max_upload_filesize', '', NULL, '2025-04-06 15:41:56'),
(146, 'media_chunk_enabled', '0', NULL, '2025-04-06 15:41:56'),
(147, 'media_chunk_size', '1048576', NULL, '2025-04-06 15:41:56'),
(148, 'media_max_file_size', '1048576', NULL, '2025-04-06 15:41:56'),
(149, 'media_watermark_enabled', '0', NULL, '2025-04-06 15:41:56'),
(150, 'media_image_processing_library', 'gd', NULL, '2025-04-06 15:41:56'),
(151, 'media_watermark_source', '', NULL, '2025-04-06 15:41:56'),
(152, 'media_watermark_size', '10', NULL, '2025-04-06 15:41:56'),
(153, 'watermark_opacity', '70', NULL, '2025-04-06 15:41:56'),
(154, 'media_watermark_position', 'bottom-right', NULL, '2025-04-06 15:41:56'),
(155, 'watermark_position_x', '10', NULL, '2025-04-06 15:41:56'),
(156, 'watermark_position_y', '10', NULL, '2025-04-06 15:41:56'),
(157, 'media_sizes_thumb_width', '150', NULL, '2025-04-06 15:41:56'),
(158, 'media_sizes_thumb_height', '150', NULL, '2025-04-06 15:41:56'),
(159, 'media_folders_can_add_watermark', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]', NULL, '2025-04-06 15:41:56'),
(160, 'theme-miraclehrhub-copyright', '© 2025 Nice Overseas Pvt. Ltd. All right reserved.', NULL, '2025-04-06 15:41:56'),
(161, 'theme-miraclehrhub-primary_font', 'Roboto', NULL, '2025-04-06 15:41:56'),
(162, 'theme-miraclehrhub-primary_color', '#ff2b4a', NULL, '2025-04-06 15:41:56'),
(163, 'theme-miraclehrhub-site_title', '', NULL, '2025-04-06 15:41:56'),
(164, 'theme-miraclehrhub-show_site_name', '0', NULL, '2025-04-06 15:41:56'),
(165, 'theme-miraclehrhub-seo_title', '', NULL, '2025-04-06 15:41:56'),
(166, 'theme-miraclehrhub-seo_description', '', NULL, '2025-04-06 15:41:56'),
(167, 'theme-miraclehrhub-seo_og_image', '', NULL, '2025-04-06 15:41:56'),
(168, 'theme-miraclehrhub-theme_breadcrumb_enabled', '1', NULL, '2025-04-06 15:41:56'),
(169, 'theme-miraclehrhub-homepage_id', '1', NULL, '2025-04-06 15:41:56'),
(170, 'theme-miraclehrhub-favicon', 'logo-nice/nice-fav.png', NULL, '2025-04-06 15:41:56'),
(171, 'theme-miraclehrhub-logo', 'logo-nice/nicelogo-03.png', NULL, '2025-04-06 15:41:56'),
(172, 'theme-miraclehrhub-blog_page_id', '0', NULL, '2025-04-06 15:41:56'),
(173, 'theme-miraclehrhub-number_of_posts_in_a_category', '12', NULL, '2025-04-06 15:41:56'),
(174, 'theme-miraclehrhub-number_of_posts_in_a_tag', '12', NULL, '2025-04-06 15:41:56'),
(175, 'theme-miraclehrhub-cookie_consent_enable', 'no', NULL, '2025-04-06 15:41:56'),
(176, 'theme-miraclehrhub-cookie_consent_style', 'full-width', NULL, '2025-04-06 15:41:56'),
(177, 'theme-miraclehrhub-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies.', NULL, '2025-04-06 15:41:56'),
(178, 'theme-miraclehrhub-cookie_consent_button_text', 'Allow cookies', NULL, '2025-04-06 15:41:56'),
(179, 'theme-miraclehrhub-cookie_consent_learn_more_url', '', NULL, '2025-04-06 15:41:56'),
(180, 'theme-miraclehrhub-cookie_consent_learn_more_text', '', NULL, '2025-04-06 15:41:56'),
(181, 'theme-miraclehrhub-cookie_consent_background_color', '#000', NULL, '2025-04-06 15:41:56'),
(182, 'theme-miraclehrhub-cookie_consent_text_color', '#fff', NULL, '2025-04-06 15:41:56'),
(183, 'theme-miraclehrhub-cookie_consent_max_width', '1170', NULL, '2025-04-06 15:41:56'),
(184, 'theme-miraclehrhub-job_list_page_id', '46', NULL, '2025-04-06 15:41:56'),
(185, 'admin_appearance_custom_css', '', NULL, '2025-04-06 15:41:56'),
(186, 'admin_appearance_custom_header_js', '', NULL, '2025-04-06 15:41:56'),
(187, 'admin_appearance_custom_body_js', '', NULL, '2025-04-06 15:41:56'),
(188, 'admin_appearance_custom_footer_js', '', NULL, '2025-04-06 15:41:56'),
(189, 'contact_phone', '+(977) 1543-5529', NULL, '2025-04-06 15:41:56'),
(190, 'email_address', 'info@niceoverseaspl.com', NULL, '2025-04-06 15:41:56'),
(191, 'office_address', 'Nice Overseas Pvt. Ltd\r\nJawalakhel, Lalitpur,\r\nNepal', NULL, '2025-04-06 15:41:56'),
(192, 'google_map_location', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3533.414155893523!2d85.31178671093826!3d27.673591726880336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19f453032d57%3A0xc99afee97a2ba29a!2sNice%20Overseas%20Pvt.%20Ltd.!5e0!3m2!1sen!2snp!4v1712808885312!5m2!1sen!2snp', NULL, '2025-04-06 15:41:56'),
(193, 'theme-miraclehrhub-galleries_page_id', NULL, NULL, '2025-04-06 15:41:56'),
(194, 'theme-miraclehrhub-logo_employer_dashboard', NULL, NULL, '2025-04-06 15:41:56'),
(195, 'theme-miraclehrhub-default_company_cover_image', NULL, NULL, '2025-04-06 15:41:56'),
(196, 'theme-miraclehrhub-default_company_logo', NULL, NULL, '2025-04-06 15:41:56'),
(197, 'theme-miraclehrhub-job_companies_page_id', NULL, NULL, '2025-04-06 15:41:56'),
(198, 'theme-miraclehrhub-job_categories_page_id', NULL, NULL, '2025-04-06 15:41:56'),
(199, 'theme-miraclehrhub-job_candidates_page_id', NULL, NULL, '2025-04-06 15:41:56'),
(200, 'theme-miraclehrhub-show_map_on_jobs_page', 'yes', NULL, '2025-04-06 15:41:56'),
(201, 'theme-miraclehrhub-latitude_longitude_center_on_jobs_page', '43.615134, -76.393186', NULL, '2025-04-06 15:41:56'),
(202, '_method', 'PUT', NULL, '2025-04-06 15:41:56'),
(203, '_token', 'AiBWX6kH5g1VuoObQh3yIxOCIg0ro15rX02kxKh4', NULL, '2025-04-06 15:41:56'),
(204, 'job_board_enable_auto_detect_visitor_currency', '0', NULL, '2025-04-06 15:41:56'),
(205, 'job_board_add_space_between_price_and_currency', '0', NULL, '2025-04-06 15:41:56'),
(206, 'job_board_thousands_separator', ',', NULL, '2025-04-06 15:41:56'),
(207, 'job_board_decimal_separator', ',', NULL, '2025-04-06 15:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) NOT NULL,
  `prefix` varchar(120) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'homepage-1', 1, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:30', '2024-01-05 02:17:30'),
(13, 'about-us', 13, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(14, 'blog', 14, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(15, 'contact', 15, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(17, 'services', 17, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(20, 'teams', 20, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(24, 'career-listing', 24, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(27, 'testimonials', 27, 'Botble\\Page\\Models\\Page', '', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(34, 'desktop-pc', 1, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(35, 'headphone', 2, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(36, 'laptop', 3, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(37, 'mobile-phone', 4, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(38, 'printer', 5, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(39, 'books', 6, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(40, 'tablet', 7, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(41, 'usb-flash', 8, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(42, 'game-mouse', 9, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(43, 'security', 10, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(44, 'watch', 11, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(45, 'scanner', 12, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-05 02:17:31', '2024-01-05 02:17:31'),
(46, 'foodpound', 1, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-05 02:17:32', '2024-01-05 02:17:32'),
(47, 'itea-jsc', 2, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-05 02:17:32', '2024-01-05 02:17:32'),
(48, 'soda-brand', 3, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-05 02:17:32', '2024-01-05 02:17:32'),
(49, 'farmart', 4, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-05 02:17:32', '2024-01-05 02:17:32'),
(50, 'dual-camera-20mp-digital', 1, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(51, 'smart-watches', 2, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(52, 'beat-headphone', 3, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(53, 'red-black-headphone', 4, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(54, 'smart-watch-external-digital', 5, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(55, 'nikon-hd-camera', 6, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(56, 'audio-equipment', 7, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(57, 'smart-televisions', 8, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(58, 'samsung-smart-phone-digital', 9, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(59, 'herschel-leather-duffle-bag-in-brown-color', 10, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(60, 'xbox-one-wireless-controller-black-color', 11, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(61, 'epsion-plaster-printer', 12, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:44', '2024-01-05 02:17:44'),
(62, 'sound-intone-i65-earphone-white-version-digital', 13, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(63, 'bo-play-mini-bluetooth-speaker', 14, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(64, 'apple-macbook-air-retina-133-inch-laptop', 15, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(65, 'apple-macbook-air-retina-12-inch-laptop', 16, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(66, 'samsung-gear-vr-virtual-reality-headset-digital', 17, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(67, 'aveeno-moisturizing-body-shower-450ml', 18, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(68, 'nyx-beauty-couton-pallete-makeup-12', 19, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(69, 'nyx-beauty-couton-pallete-makeup-12', 20, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(70, 'mvmth-classical-leather-watch-in-black-digital', 21, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(71, 'baxter-care-hair-kit-for-bearded-mens', 22, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(72, 'ciate-palemore-lipstick-bold-red-color', 23, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(73, 'vimto-squash-remix-apple-15-litres', 24, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(74, 'crock-pot-slow-cooker-digital', 25, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(75, 'taylors-of-harrogate-yorkshire-coffee', 26, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(76, 'soft-mochi-galeto-ice-cream', 27, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(77, 'naked-noodle-egg-noodles-singapore', 28, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(78, 'saute-pan-silver-digital', 29, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(79, 'bar-s-classic-bun-length-franks', 30, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(80, 'broccoli-crowns', 31, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(81, 'slimming-world-vegan-mac-greens', 32, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(82, 'haagen-dazs-salted-caramel-digital', 33, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(83, 'iceland-3-solo-exotic-burst', 34, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(84, 'extreme-budweiser-light-can', 35, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(85, 'iceland-macaroni-cheese-traybake', 36, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(86, 'dolmio-bolognese-pasta-sauce-digital', 37, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(87, 'sitema-bakeit-plastic-box', 38, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(88, 'wayfair-basics-dinner-plate-storage', 39, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(89, 'miko-the-panda-water-bottle', 40, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(90, 'sesame-seed-bread-digital', 41, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(91, 'morrisons-the-best-beef', 42, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(92, 'avocado-hass-large', 43, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:45', '2024-01-05 02:17:45'),
(93, 'italia-beef-lasagne', 44, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(94, 'maxwell-house-classic-roast-mocha-digital', 45, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(95, 'bottled-pure-water-500ml', 46, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(96, 'famart-farmhouse-soft-white', 47, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(97, 'coca-cola-original-taste', 48, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(98, 'casillero-diablo-cabernet-sauvignon-digital', 49, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(99, 'arla-organic-free-range-milk', 50, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(100, 'aptamil-follow-on-baby-milk', 51, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(101, 'cuisinart-chefs-classic-hard-anodized', 52, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(102, 'corn-yellow-sweet-digital', 53, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(103, 'hobnobs-the-nobbly-biscuit', 54, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(104, 'honest-organic-still-lemonade', 55, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(105, 'ice-becks-beer-350ml-x-24-pieces', 56, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(106, 'iceland-6-hot-cross-buns-digital', 57, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(107, 'iceland-luxury-4-panini-rolls', 58, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(108, 'iceland-soft-scoop-vanilla', 59, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(109, 'iceland-spaghetti-bolognese', 60, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(110, 'kelloggs-coco-pops-cereal-digital', 61, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(111, 'kit-kat-chunky-milk-chocolate', 62, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(112, 'large-green-bell-pepper', 63, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(113, 'pice-94w-beasley-journal', 64, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(114, 'province-piece-glass-drinking-glass-digital', 65, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:46', '2024-01-05 02:17:46'),
(115, 'electronic', 1, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-05 02:17:51', '2024-01-05 02:17:51'),
(116, 'mobile', 2, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-05 02:17:51', '2024-01-05 02:17:51'),
(117, 'iphone', 3, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-05 02:17:51', '2024-01-05 02:17:51'),
(118, 'printer', 4, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-05 02:17:51', '2024-01-05 02:17:51'),
(119, 'office', 5, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-05 02:17:51', '2024-01-05 02:17:51'),
(120, 'it', 6, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-05 02:17:51', '2024-01-05 02:17:51'),
(123, 'travel-tips', 3, 'Botble\\Blog\\Models\\Category', 'blog', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(127, 'nature', 7, 'Botble\\Blog\\Models\\Category', 'blog', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(128, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(129, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(130, 'fashion', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(131, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(132, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(149, 'senior-full-stack-engineer-creator-success-full-time', 1, 'ArchiElite\\Career\\Models\\Career', 'careers', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(150, 'data-science-specialist-analytics-division', 2, 'ArchiElite\\Career\\Models\\Career', 'careers', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(151, 'product-marketing-manager-growth-team', 3, 'ArchiElite\\Career\\Models\\Career', 'careers', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(152, 'uxui-designer-user-experience-team', 4, 'ArchiElite\\Career\\Models\\Career', 'careers', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(153, 'operations-manager-supply-chain-division', 5, 'ArchiElite\\Career\\Models\\Career', 'careers', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(154, 'financial-analyst-investment-group', 6, 'ArchiElite\\Career\\Models\\Career', 'careers', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(155, 'hr-consultancy-in-japan', 1, 'Botble\\BusinessService\\Models\\Service', 'services', '2024-01-05 02:17:53', '2025-03-29 08:24:41'),
(156, 'overseas-recruitment-services', 2, 'Botble\\BusinessService\\Models\\Service', 'services', '2024-01-05 02:17:53', '2024-03-24 01:03:31'),
(157, 'talent-acquisition', 3, 'Botble\\BusinessService\\Models\\Service', 'services', '2024-01-05 02:17:53', '2025-03-29 08:43:29'),
(158, 'visa-processing-documentation', 4, 'Botble\\BusinessService\\Models\\Service', 'services', '2024-01-05 02:17:53', '2025-03-29 08:52:07'),
(161, 'trial-plan', 1, 'Botble\\BusinessService\\Models\\Package', 'packages', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(162, 'standard', 2, 'Botble\\BusinessService\\Models\\Package', 'packages', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(163, 'business', 3, 'Botble\\BusinessService\\Models\\Package', 'packages', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(164, 'enterprise', 4, 'Botble\\BusinessService\\Models\\Package', 'packages', '2024-01-05 02:17:53', '2024-01-05 02:17:53'),
(165, 'dual-camera-20mp-digital', 66, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(166, 'smart-watches', 67, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(167, 'smart-watches', 68, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(168, 'beat-headphone', 69, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(169, 'red-black-headphone', 70, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(170, 'red-black-headphone', 71, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(171, 'smart-watch-external-digital', 72, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(172, 'smart-watch-external-digital', 73, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(173, 'smart-watch-external-digital', 74, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(174, 'smart-watch-external-digital', 75, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(175, 'nikon-hd-camera', 76, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(176, 'nikon-hd-camera', 77, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(177, 'audio-equipment', 78, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(178, 'audio-equipment', 79, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(179, 'audio-equipment', 80, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(180, 'smart-televisions', 81, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(181, 'smart-televisions', 82, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(182, 'samsung-smart-phone-digital', 83, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(183, 'samsung-smart-phone-digital', 84, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(184, 'samsung-smart-phone-digital', 85, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(185, 'herschel-leather-duffle-bag-in-brown-color', 86, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(186, 'herschel-leather-duffle-bag-in-brown-color', 87, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(187, 'herschel-leather-duffle-bag-in-brown-color', 88, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(188, 'herschel-leather-duffle-bag-in-brown-color', 89, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(189, 'xbox-one-wireless-controller-black-color', 90, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(190, 'epsion-plaster-printer', 91, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(191, 'epsion-plaster-printer', 92, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(192, 'epsion-plaster-printer', 93, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(193, 'epsion-plaster-printer', 94, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(194, 'sound-intone-i65-earphone-white-version-digital', 95, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(195, 'sound-intone-i65-earphone-white-version-digital', 96, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(196, 'bo-play-mini-bluetooth-speaker', 97, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(197, 'bo-play-mini-bluetooth-speaker', 98, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(198, 'apple-macbook-air-retina-133-inch-laptop', 99, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(199, 'apple-macbook-air-retina-133-inch-laptop', 100, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(200, 'apple-macbook-air-retina-133-inch-laptop', 101, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(201, 'apple-macbook-air-retina-133-inch-laptop', 102, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(202, 'apple-macbook-air-retina-12-inch-laptop', 103, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(203, 'apple-macbook-air-retina-12-inch-laptop', 104, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(204, 'samsung-gear-vr-virtual-reality-headset-digital', 105, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(205, 'samsung-gear-vr-virtual-reality-headset-digital', 106, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(206, 'samsung-gear-vr-virtual-reality-headset-digital', 107, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(207, 'samsung-gear-vr-virtual-reality-headset-digital', 108, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(208, 'aveeno-moisturizing-body-shower-450ml', 109, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(209, 'aveeno-moisturizing-body-shower-450ml', 110, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(210, 'nyx-beauty-couton-pallete-makeup-12', 111, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(211, 'nyx-beauty-couton-pallete-makeup-12', 112, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(212, 'mvmth-classical-leather-watch-in-black-digital', 113, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(213, 'mvmth-classical-leather-watch-in-black-digital', 114, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(214, 'baxter-care-hair-kit-for-bearded-mens', 115, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(215, 'baxter-care-hair-kit-for-bearded-mens', 116, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(216, 'ciate-palemore-lipstick-bold-red-color', 117, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(217, 'ciate-palemore-lipstick-bold-red-color', 118, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(218, 'vimto-squash-remix-apple-15-litres', 119, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(219, 'vimto-squash-remix-apple-15-litres', 120, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(220, 'crock-pot-slow-cooker-digital', 121, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(221, 'crock-pot-slow-cooker-digital', 122, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(222, 'crock-pot-slow-cooker-digital', 123, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(223, 'taylors-of-harrogate-yorkshire-coffee', 124, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(224, 'soft-mochi-galeto-ice-cream', 125, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(225, 'soft-mochi-galeto-ice-cream', 126, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(226, 'soft-mochi-galeto-ice-cream', 127, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(227, 'naked-noodle-egg-noodles-singapore', 128, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(228, 'naked-noodle-egg-noodles-singapore', 129, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(229, 'naked-noodle-egg-noodles-singapore', 130, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:57', '2024-01-05 02:17:57'),
(230, 'saute-pan-silver-digital', 131, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(231, 'bar-s-classic-bun-length-franks', 132, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(232, 'bar-s-classic-bun-length-franks', 133, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(233, 'broccoli-crowns', 134, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(234, 'slimming-world-vegan-mac-greens', 135, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(235, 'slimming-world-vegan-mac-greens', 136, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(236, 'slimming-world-vegan-mac-greens', 137, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(237, 'haagen-dazs-salted-caramel-digital', 138, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(238, 'haagen-dazs-salted-caramel-digital', 139, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(239, 'haagen-dazs-salted-caramel-digital', 140, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(240, 'iceland-3-solo-exotic-burst', 141, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(241, 'iceland-3-solo-exotic-burst', 142, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(242, 'extreme-budweiser-light-can', 143, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(243, 'extreme-budweiser-light-can', 144, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(244, 'extreme-budweiser-light-can', 145, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(245, 'iceland-macaroni-cheese-traybake', 146, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(246, 'dolmio-bolognese-pasta-sauce-digital', 147, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(247, 'dolmio-bolognese-pasta-sauce-digital', 148, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(248, 'sitema-bakeit-plastic-box', 149, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(249, 'sitema-bakeit-plastic-box', 150, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(250, 'sitema-bakeit-plastic-box', 151, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(251, 'sitema-bakeit-plastic-box', 152, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(252, 'wayfair-basics-dinner-plate-storage', 153, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(253, 'wayfair-basics-dinner-plate-storage', 154, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(254, 'miko-the-panda-water-bottle', 155, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(255, 'miko-the-panda-water-bottle', 156, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(256, 'miko-the-panda-water-bottle', 157, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(257, 'sesame-seed-bread-digital', 158, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(258, 'morrisons-the-best-beef', 159, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(259, 'morrisons-the-best-beef', 160, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(260, 'morrisons-the-best-beef', 161, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(261, 'avocado-hass-large', 162, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(262, 'avocado-hass-large', 163, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(263, 'italia-beef-lasagne', 164, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(264, 'italia-beef-lasagne', 165, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(265, 'italia-beef-lasagne', 166, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(266, 'maxwell-house-classic-roast-mocha-digital', 167, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(267, 'maxwell-house-classic-roast-mocha-digital', 168, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(268, 'bottled-pure-water-500ml', 169, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(269, 'famart-farmhouse-soft-white', 170, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(270, 'famart-farmhouse-soft-white', 171, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(271, 'famart-farmhouse-soft-white', 172, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(272, 'coca-cola-original-taste', 173, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(273, 'coca-cola-original-taste', 174, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(274, 'casillero-diablo-cabernet-sauvignon-digital', 175, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(275, 'casillero-diablo-cabernet-sauvignon-digital', 176, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(276, 'casillero-diablo-cabernet-sauvignon-digital', 177, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(277, 'casillero-diablo-cabernet-sauvignon-digital', 178, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(278, 'arla-organic-free-range-milk', 179, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(279, 'arla-organic-free-range-milk', 180, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(280, 'arla-organic-free-range-milk', 181, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(281, 'arla-organic-free-range-milk', 182, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(282, 'aptamil-follow-on-baby-milk', 183, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(283, 'aptamil-follow-on-baby-milk', 184, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(284, 'cuisinart-chefs-classic-hard-anodized', 185, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(285, 'cuisinart-chefs-classic-hard-anodized', 186, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(286, 'cuisinart-chefs-classic-hard-anodized', 187, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(287, 'corn-yellow-sweet-digital', 188, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(288, 'corn-yellow-sweet-digital', 189, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(289, 'corn-yellow-sweet-digital', 190, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(290, 'hobnobs-the-nobbly-biscuit', 191, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(291, 'hobnobs-the-nobbly-biscuit', 192, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(292, 'hobnobs-the-nobbly-biscuit', 193, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(293, 'hobnobs-the-nobbly-biscuit', 194, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(294, 'honest-organic-still-lemonade', 195, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(295, 'honest-organic-still-lemonade', 196, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(296, 'honest-organic-still-lemonade', 197, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(297, 'ice-becks-beer-350ml-x-24-pieces', 198, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(298, 'ice-becks-beer-350ml-x-24-pieces', 199, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(299, 'ice-becks-beer-350ml-x-24-pieces', 200, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(300, 'ice-becks-beer-350ml-x-24-pieces', 201, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(301, 'ice-becks-beer-350ml-x-24-pieces', 202, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(302, 'iceland-6-hot-cross-buns-digital', 203, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(303, 'iceland-luxury-4-panini-rolls', 204, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(304, 'iceland-luxury-4-panini-rolls', 205, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(305, 'iceland-luxury-4-panini-rolls', 206, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(306, 'iceland-soft-scoop-vanilla', 207, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(307, 'iceland-soft-scoop-vanilla', 208, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(308, 'iceland-spaghetti-bolognese', 209, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(309, 'kelloggs-coco-pops-cereal-digital', 210, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(310, 'kit-kat-chunky-milk-chocolate', 211, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(311, 'kit-kat-chunky-milk-chocolate', 212, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(312, 'large-green-bell-pepper', 213, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(313, 'large-green-bell-pepper', 214, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(314, 'large-green-bell-pepper', 215, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(315, 'pice-94w-beasley-journal', 216, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(316, 'pice-94w-beasley-journal', 217, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(317, 'province-piece-glass-drinking-glass-digital', 218, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-05 02:17:58', '2024-01-05 02:17:58'),
(319, 'krishna-bist', 1, 'Botble\\Team\\Models\\Team', 'teams', '2024-03-24 01:40:33', '2025-03-29 05:43:36'),
(320, '1711293226', 1, 'Botble\\BusinessService\\Models\\ServiceIndustry', 'industries', '2024-03-24 09:43:46', '2024-03-24 09:43:46'),
(321, '1711293325', 2, 'Botble\\BusinessService\\Models\\ServiceIndustry', 'industries', '2024-03-24 09:45:25', '2024-03-24 09:45:25'),
(322, 'construction', 3, 'Botble\\BusinessService\\Models\\ServiceIndustry', 'industries', '2024-03-24 11:37:16', '2024-03-24 11:37:16'),
(323, 'spa', 4, 'Botble\\BusinessService\\Models\\ServiceIndustry', 'industries', '2024-03-24 11:40:22', '2024-03-24 11:40:22'),
(324, 'vz-dsfdfsdfd-dfsd-f', 5, 'Botble\\BusinessService\\Models\\ServiceIndustry', 'industries', '2024-03-24 11:43:13', '2024-03-24 11:43:13'),
(325, 'company', 35, 'Botble\\Page\\Models\\Page', '', '2024-03-31 02:14:41', '2024-03-31 02:14:41'),
(326, 'message-from-chairman', 36, 'Botble\\Page\\Models\\Page', '', '2024-03-31 04:50:24', '2024-03-31 04:50:24'),
(327, 'message-from-managing-director', 37, 'Botble\\Page\\Models\\Page', '', '2024-03-31 04:57:46', '2024-03-31 04:57:46'),
(328, 'our-mission-and-vision', 38, 'Botble\\Page\\Models\\Page', '', '2024-03-31 04:59:50', '2024-03-31 04:59:50'),
(329, 'why-bua-miracle-hr-consultancy', 39, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:05:03', '2024-03-31 05:05:03'),
(330, 'company-profile', 40, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:06:05', '2024-03-31 05:06:05'),
(331, 'hr-consultancy-in-japan', 41, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:07:30', '2025-03-29 08:21:39'),
(332, 'overseas-recruitment-services', 42, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:10:32', '2024-03-31 05:10:32'),
(333, 'talent-acquisition', 43, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:11:46', '2025-03-29 08:43:33'),
(334, 'visa-processing-documentation', 44, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:14:24', '2025-03-29 08:55:49'),
(335, 'industries', 45, 'Botble\\Page\\Models\\Page', '', '2024-03-31 05:15:00', '2024-03-31 05:15:00'),
(336, 'karan-bist', 13, 'Botble\\Team\\Models\\Team', 'teams', '2024-04-04 08:02:29', '2025-03-29 05:44:20'),
(337, 'suresh-airee', 14, 'Botble\\Team\\Models\\Team', 'teams', '2024-04-04 08:03:20', '2025-03-29 05:45:03'),
(338, 'jobs', 46, 'Botble\\Page\\Models\\Page', '', '2024-04-07 19:11:57', '2024-04-07 19:11:57'),
(343, 'human-resources', 1, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:39:31', '2024-04-11 10:39:31'),
(344, 'administration', 2, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:40:36', '2024-04-11 10:40:36'),
(345, 'accounting', 3, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:41:21', '2024-04-11 10:41:37'),
(346, 'finance', 4, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:41:51', '2024-04-11 10:41:51'),
(348, 'operator', 6, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:43:06', '2024-04-11 10:43:06'),
(349, 'food-and-beverage', 7, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:44:00', '2024-04-11 10:44:00'),
(350, 'production-worker', 8, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 10:46:11', '2024-04-11 10:46:11'),
(351, 'therapist', 9, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 11:08:55', '2024-04-11 11:08:55'),
(352, 'cook', 1, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 11:23:12', '2024-04-11 11:23:12'),
(353, 'bartender', 2, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 11:43:31', '2024-04-11 11:43:31'),
(359, 'gallery', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-04-11 11:53:54', '2024-04-11 11:53:54'),
(362, 'beautician', 10, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 12:54:59', '2024-04-11 12:54:59'),
(363, 'beautician', 3, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 12:57:13', '2024-04-11 12:57:13'),
(365, 'lorry-driver', 4, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:04:32', '2024-04-11 13:04:32'),
(366, 'waiterwaitress', 5, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:05:58', '2024-04-11 13:05:58'),
(367, 'driver', 12, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 13:07:30', '2024-04-11 13:07:30'),
(368, 'sous-chef', 6, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:09:45', '2024-04-11 13:09:45'),
(369, 'housekeeping', 13, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 13:15:00', '2024-04-11 13:15:00'),
(370, 'chambermaid', 7, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:15:53', '2024-04-11 13:15:53'),
(371, 'general-worker', 14, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 13:16:56', '2024-04-11 13:16:56'),
(372, 'afra-services', 11, 'Botble\\JobBoard\\Models\\Company', 'companies', '2024-04-11 13:19:27', '2025-03-29 10:13:47'),
(374, 'domestic-worker', 15, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 13:23:11', '2024-04-11 13:23:11'),
(375, 'domestic-worker', 9, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:24:38', '2024-04-11 13:24:38'),
(376, 'chef', 10, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:25:50', '2024-04-11 13:25:50'),
(377, 'general-worker', 11, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:27:24', '2024-04-11 13:27:24'),
(378, 'waiterwaitress-1', 12, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:29:46', '2024-04-11 13:29:46'),
(379, 'security-service', 16, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 13:30:59', '2024-04-11 13:30:59'),
(380, 'security-guard', 13, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:32:22', '2024-04-11 13:32:22'),
(381, 'salesman', 17, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2024-04-11 13:34:14', '2024-04-11 13:34:14'),
(382, 'salesman', 14, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:36:54', '2024-04-11 13:36:54'),
(383, 'security-guard-1', 15, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2024-04-11 13:38:31', '2024-04-17 08:39:02'),
(384, 'gallery2', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-04-14 11:20:36', '2024-04-14 11:20:36'),
(386, 'connect-with-us', 47, 'Botble\\Page\\Models\\Page', '', '2024-04-24 21:09:17', '2024-04-24 21:09:17'),
(387, 'security-guard-2', 16, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2025-03-29 10:22:00', '2025-03-29 10:22:00'),
(388, 'felda', 12, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:31:41', '2025-03-29 10:31:41'),
(389, 'foxconn', 13, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:32:11', '2025-03-29 10:32:11'),
(390, 'inno-wangsa', 14, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:33:08', '2025-03-29 10:33:08'),
(391, 'intretech-malaysia-sdn-bhd', 15, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:33:40', '2025-03-29 10:33:40'),
(392, 'km-uniform-manufacturing', 16, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:34:08', '2025-03-29 10:34:08'),
(393, 'marujou', 17, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:35:10', '2025-03-29 10:35:10'),
(394, 'maruyama', 18, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:36:02', '2025-03-29 10:36:02'),
(395, 'minebea-mitsumi', 19, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:38:16', '2025-03-29 10:38:16'),
(396, 'nakayama-khase', 20, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:38:52', '2025-03-29 10:38:52'),
(397, 'sanubari', 21, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:39:17', '2025-03-29 10:39:17'),
(398, 'sime-darby', 22, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:39:49', '2025-03-29 10:39:49'),
(399, 'southern-lion', 23, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:40:19', '2025-03-29 10:40:19'),
(400, 'subway', 24, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:41:00', '2025-03-29 10:41:00'),
(401, 'tong-heer-fasteners-co-sdn-bhd', 25, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:41:23', '2025-03-29 10:41:23'),
(402, 'twp', 26, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 10:41:46', '2025-03-29 10:41:46'),
(403, 'general-worker-1', 17, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2025-03-29 10:46:00', '2025-03-29 10:46:00'),
(404, 'helistrom-sdn-bhd', 27, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 11:00:54', '2025-03-29 11:00:54'),
(405, 'factory-workers', 18, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2025-03-29 11:05:20', '2025-03-29 11:05:20'),
(406, 'kyushu-air-tech', 28, 'Botble\\JobBoard\\Models\\Company', 'companies', '2025-03-29 11:14:47', '2025-03-29 11:14:47'),
(407, 'factory-workers-1', 19, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2025-03-29 11:17:38', '2025-03-29 11:17:38'),
(408, 'corporate-profile', 48, 'Botble\\Page\\Models\\Page', '', '2025-03-29 12:20:24', '2025-03-29 12:20:24'),
(409, 'core-values', 49, 'Botble\\Page\\Models\\Page', '', '2025-03-29 13:13:48', '2025-03-29 13:13:48'),
(410, 'why-nepalese-workers', 50, 'Botble\\Page\\Models\\Page', '', '2025-03-29 13:25:09', '2025-03-29 13:25:09'),
(411, 'organization-chart', 51, 'Botble\\Page\\Models\\Page', '', '2025-03-29 13:34:58', '2025-03-29 13:34:58'),
(412, 'company-spirit', 52, 'Botble\\Page\\Models\\Page', '', '2025-03-29 13:41:49', '2025-03-29 13:41:49'),
(413, 'code-of-conduct', 53, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:03:06', '2025-03-29 14:03:06'),
(414, 'policy-and-procedure', 54, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:04:07', '2025-03-29 14:04:07'),
(415, 'recruitment-procedures', 55, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:05:07', '2025-03-29 14:05:07'),
(416, 'documents', 56, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:11:55', '2025-03-29 14:12:09'),
(417, 'legal-certificates', 57, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:15:21', '2025-03-29 14:15:21'),
(418, 'demand-documents', 58, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:19:14', '2025-03-29 14:19:14'),
(419, 'more', 59, 'Botble\\Page\\Models\\Page', '', '2025-03-29 14:22:14', '2025-03-29 14:22:14'),
(420, 'aaaaaaaaaa', 60, 'Botble\\Page\\Models\\Page', '', '2025-04-06 23:03:54', '2025-04-06 23:03:54'),
(422, 'abcd-dance', 62, 'Botble\\Page\\Models\\Page', '', '2025-04-06 23:17:09', '2025-04-06 23:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `slugs_translations`
--

CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) NOT NULL,
  `slugs_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `prefix` varchar(120) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states_translations`
--

CREATE TABLE `states_translations` (
  `lang_code` varchar(20) NOT NULL,
  `states_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(2, 'Design', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(3, 'Fashion', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(4, 'Branding', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-05 02:17:52', '2024-01-05 02:17:52'),
(5, 'Modern', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-05 02:17:52', '2024-01-05 02:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `socials` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `photo`, `title`, `location`, `socials`, `status`, `created_at`, `updated_at`, `content`, `phone`, `email`, `address`, `website`, `description`) VALUES
(1, 'Krishna Bist', 'team/nice-teams-krishna.jpg', 'Chairman', '', '{\"facebook\":null,\"twitter\":null,\"instagram\":null}', 'published', '2024-01-05 02:17:53', '2025-03-29 05:44:32', '<h3 class=\"team-card__title\"><a href=\"https://np.niceoverseaspl.com/#\">Krishna Bist</a></h3><p>Chairman</p>', NULL, NULL, NULL, NULL, ''),
(13, 'Karan Bist', 'team/nice-teams-karan.jpg', 'Managing Director', '', '{\"facebook\":null,\"twitter\":null,\"instagram\":null}', 'published', '2024-04-04 08:02:29', '2025-03-29 05:44:41', NULL, NULL, NULL, NULL, NULL, ''),
(14, 'Suresh Airee', 'team/nice-teams-suresh.jpg', 'Admin Director', '', '{\"facebook\":null,\"twitter\":null,\"instagram\":null}', 'published', '2024-04-04 08:03:20', '2025-03-29 05:45:03', NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `teams_translations`
--

CREATE TABLE `teams_translations` (
  `lang_code` varchar(255) NOT NULL,
  `teams_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials_translations`
--

CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) NOT NULL,
  `testimonials_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'admin@admin.com', NULL, '$2y$12$nN5jNipgjk1G9DJNygaq1uwGkmRffRTusZ8CTqbgz.WfIpkgJGUbW', 'SYcBJdF4BPcUGDc3IaZDdkXQmos2w54RIZqb8s7TIrAjIRT6tvfUq0Dpv19v', '2024-03-23 02:51:55', '2025-03-31 00:33:49', 'Admin', 'User', 'admin', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) NOT NULL,
  `sidebar_id` varchar(120) NOT NULL,
  `theme` varchar(120) NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(15, 'Botble\\Widget\\Widgets\\CoreSimpleMenu', 'sidebar_menu', 'miraclehrhub', 0, '{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Simple Menu\",\"items\":[[{\"key\":\"label\",\"value\":\"Test\"},{\"key\":\"url\",\"value\":\"#\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}', '2024-04-28 01:43:42', '2024-04-28 01:43:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements_translations`
--
ALTER TABLE `announcements_translations`
  ADD PRIMARY KEY (`lang_code`,`announcements_id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `bs_packages`
--
ALTER TABLE `bs_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bs_packages_translations`
--
ALTER TABLE `bs_packages_translations`
  ADD PRIMARY KEY (`lang_code`,`bs_packages_id`);

--
-- Indexes for table `bs_services`
--
ALTER TABLE `bs_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bs_services_category_id_index` (`category_id`);

--
-- Indexes for table `bs_services_translations`
--
ALTER TABLE `bs_services_translations`
  ADD PRIMARY KEY (`lang_code`,`bs_services_id`);

--
-- Indexes for table `bs_service_categories`
--
ALTER TABLE `bs_service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bs_service_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `bs_service_categories_translations`
--
ALTER TABLE `bs_service_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`bs_service_categories_id`);

--
-- Indexes for table `bs_service_industries`
--
ALTER TABLE `bs_service_industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers_translations`
--
ALTER TABLE `careers_translations`
  ADD PRIMARY KEY (`lang_code`,`careers_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_status_index` (`status`),
  ADD KEY `categories_created_at_index` (`created_at`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_slug_unique` (`slug`);

--
-- Indexes for table `cities_translations`
--
ALTER TABLE `cities_translations`
  ADD PRIMARY KEY (`lang_code`,`cities_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_country_id_foreign` (`country_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries_translations`
--
ALTER TABLE `countries_translations`
  ADD PRIMARY KEY (`lang_code`,`countries_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs_translations`
--
ALTER TABLE `faqs_translations`
  ADD PRIMARY KEY (`lang_code`,`faqs_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories_translations`
--
ALTER TABLE `faq_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`faq_categories_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `galleries_translations`
--
ALTER TABLE `galleries_translations`
  ADD PRIMARY KEY (`lang_code`,`galleries_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `gallery_meta_translations`
--
ALTER TABLE `gallery_meta_translations`
  ADD PRIMARY KEY (`lang_code`,`gallery_meta_id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_accounts`
--
ALTER TABLE `jb_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jb_accounts_email_unique` (`email`);

--
-- Indexes for table `jb_account_activity_logs`
--
ALTER TABLE `jb_account_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_account_activity_logs_account_id_index` (`account_id`);

--
-- Indexes for table `jb_account_educations`
--
ALTER TABLE `jb_account_educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_account_experiences`
--
ALTER TABLE `jb_account_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_account_favorite_skills`
--
ALTER TABLE `jb_account_favorite_skills`
  ADD PRIMARY KEY (`skill_id`,`account_id`);

--
-- Indexes for table `jb_account_favorite_tags`
--
ALTER TABLE `jb_account_favorite_tags`
  ADD PRIMARY KEY (`tag_id`,`account_id`);

--
-- Indexes for table `jb_account_packages`
--
ALTER TABLE `jb_account_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_account_password_resets`
--
ALTER TABLE `jb_account_password_resets`
  ADD KEY `jb_account_password_resets_email_index` (`email`),
  ADD KEY `jb_account_password_resets_token_index` (`token`);

--
-- Indexes for table `jb_analytics`
--
ALTER TABLE `jb_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_applications`
--
ALTER TABLE `jb_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_career_levels`
--
ALTER TABLE `jb_career_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_career_levels_translations`
--
ALTER TABLE `jb_career_levels_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_career_levels_id`);

--
-- Indexes for table `jb_categories`
--
ALTER TABLE `jb_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_categories_translations`
--
ALTER TABLE `jb_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_categories_id`);

--
-- Indexes for table `jb_companies`
--
ALTER TABLE `jb_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_coupons`
--
ALTER TABLE `jb_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jb_coupons_code_unique` (`code`);

--
-- Indexes for table `jb_currencies`
--
ALTER TABLE `jb_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_custom_fields`
--
ALTER TABLE `jb_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`);

--
-- Indexes for table `jb_custom_fields_translations`
--
ALTER TABLE `jb_custom_fields_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_custom_fields_id`);

--
-- Indexes for table `jb_custom_field_options`
--
ALTER TABLE `jb_custom_field_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_custom_field_options_translations`
--
ALTER TABLE `jb_custom_field_options_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_custom_field_options_id`);

--
-- Indexes for table `jb_custom_field_values`
--
ALTER TABLE `jb_custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `jb_custom_field_values_translations`
--
ALTER TABLE `jb_custom_field_values_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_custom_field_values_id`);

--
-- Indexes for table `jb_degree_levels`
--
ALTER TABLE `jb_degree_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_degree_levels_translations`
--
ALTER TABLE `jb_degree_levels_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_degree_levels_id`);

--
-- Indexes for table `jb_degree_types`
--
ALTER TABLE `jb_degree_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_degree_types_translations`
--
ALTER TABLE `jb_degree_types_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_degree_types_id`);

--
-- Indexes for table `jb_functional_areas`
--
ALTER TABLE `jb_functional_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_functional_areas_translations`
--
ALTER TABLE `jb_functional_areas_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_functional_areas_id`);

--
-- Indexes for table `jb_invoices`
--
ALTER TABLE `jb_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jb_invoices_code_unique` (`code`),
  ADD KEY `jb_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `jb_invoices_payment_id_index` (`payment_id`),
  ADD KEY `jb_invoices_status_index` (`status`);

--
-- Indexes for table `jb_invoice_items`
--
ALTER TABLE `jb_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `jb_jobs`
--
ALTER TABLE `jb_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_jobs_tags`
--
ALTER TABLE `jb_jobs_tags`
  ADD PRIMARY KEY (`job_id`,`tag_id`),
  ADD KEY `jb_jobs_tags_job_id_index` (`job_id`),
  ADD KEY `jb_jobs_tags_tag_id_index` (`tag_id`);

--
-- Indexes for table `jb_jobs_translations`
--
ALTER TABLE `jb_jobs_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_jobs_id`);

--
-- Indexes for table `jb_job_experiences`
--
ALTER TABLE `jb_job_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_experiences_translations`
--
ALTER TABLE `jb_job_experiences_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_experiences_id`);

--
-- Indexes for table `jb_job_shifts`
--
ALTER TABLE `jb_job_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_shifts_translations`
--
ALTER TABLE `jb_job_shifts_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_shifts_id`);

--
-- Indexes for table `jb_job_skills`
--
ALTER TABLE `jb_job_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_skills_translations`
--
ALTER TABLE `jb_job_skills_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_skills_id`);

--
-- Indexes for table `jb_job_types`
--
ALTER TABLE `jb_job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_types_translations`
--
ALTER TABLE `jb_job_types_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_types_id`);

--
-- Indexes for table `jb_language_levels`
--
ALTER TABLE `jb_language_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_language_levels_translations`
--
ALTER TABLE `jb_language_levels_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_language_levels_id`);

--
-- Indexes for table `jb_major_subjects`
--
ALTER TABLE `jb_major_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_packages`
--
ALTER TABLE `jb_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_packages_translations`
--
ALTER TABLE `jb_packages_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_packages_id`);

--
-- Indexes for table `jb_reviews`
--
ALTER TABLE `jb_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_unique` (`reviewable_id`,`reviewable_type`,`created_by_id`,`created_by_type`),
  ADD KEY `jb_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  ADD KEY `jb_reviews_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  ADD KEY `jb_reviews_reviewable_id_reviewable_type_status_index` (`reviewable_id`,`reviewable_type`,`status`);

--
-- Indexes for table `jb_saved_jobs`
--
ALTER TABLE `jb_saved_jobs`
  ADD PRIMARY KEY (`account_id`,`job_id`);

--
-- Indexes for table `jb_tags`
--
ALTER TABLE `jb_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_tags_translations`
--
ALTER TABLE `jb_tags_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_tags_id`);

--
-- Indexes for table `jb_transactions`
--
ALTER TABLE `jb_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_category_id` (`category_id`),
  ADD KEY `job_company_id` (`company_id`),
  ADD KEY `job_country_id` (`country_id`);

--
-- Indexes for table `jobs_translations`
--
ALTER TABLE `jobs_translations`
  ADD PRIMARY KEY (`lang_code`,`jobs_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD KEY `lang_locale_index` (`lang_locale`),
  ADD KEY `lang_code_index` (`lang_code`),
  ADD KEY `lang_is_default_index` (`lang_is_default`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`),
  ADD KEY `meta_code_index` (`lang_meta_code`),
  ADD KEY `meta_origin_index` (`lang_meta_origin`),
  ADD KEY `meta_reference_type_index` (`reference_type`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`),
  ADD KEY `media_files_index` (`folder_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`),
  ADD KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_type` (`reference_type`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_index` (`user_id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_status_index` (`status`),
  ADD KEY `posts_author_id_index` (`author_id`),
  ADD KEY `posts_author_type_index` (`author_type`),
  ADD KEY `posts_created_at_index` (`created_at`);

--
-- Indexes for table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD KEY `post_categories_category_id_index` (`category_id`),
  ADD KEY `post_categories_post_id_index` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_tag_id_index` (`tag_id`),
  ADD KEY `post_tags_post_id_index` (`post_id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slugs_reference_id_index` (`reference_id`),
  ADD KEY `slugs_key_index` (`key`),
  ADD KEY `slugs_prefix_index` (`prefix`),
  ADD KEY `slugs_reference_index` (`reference_id`,`reference_type`);

--
-- Indexes for table `slugs_translations`
--
ALTER TABLE `slugs_translations`
  ADD PRIMARY KEY (`lang_code`,`slugs_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `states_slug_unique` (`slug`);

--
-- Indexes for table `states_translations`
--
ALTER TABLE `states_translations`
  ADD PRIMARY KEY (`lang_code`,`states_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams_translations`
--
ALTER TABLE `teams_translations`
  ADD PRIMARY KEY (`lang_code`,`teams_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials_translations`
--
ALTER TABLE `testimonials_translations`
  ADD PRIMARY KEY (`lang_code`,`testimonials_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bs_packages`
--
ALTER TABLE `bs_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bs_services`
--
ALTER TABLE `bs_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bs_service_categories`
--
ALTER TABLE `bs_service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bs_service_industries`
--
ALTER TABLE `bs_service_industries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_accounts`
--
ALTER TABLE `jb_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_account_activity_logs`
--
ALTER TABLE `jb_account_activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_account_educations`
--
ALTER TABLE `jb_account_educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_account_experiences`
--
ALTER TABLE `jb_account_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_account_packages`
--
ALTER TABLE `jb_account_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_analytics`
--
ALTER TABLE `jb_analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=881;

--
-- AUTO_INCREMENT for table `jb_applications`
--
ALTER TABLE `jb_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_career_levels`
--
ALTER TABLE `jb_career_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_categories`
--
ALTER TABLE `jb_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jb_companies`
--
ALTER TABLE `jb_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jb_coupons`
--
ALTER TABLE `jb_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_currencies`
--
ALTER TABLE `jb_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_custom_fields`
--
ALTER TABLE `jb_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_custom_field_options`
--
ALTER TABLE `jb_custom_field_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_custom_field_values`
--
ALTER TABLE `jb_custom_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_degree_levels`
--
ALTER TABLE `jb_degree_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_degree_types`
--
ALTER TABLE `jb_degree_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_functional_areas`
--
ALTER TABLE `jb_functional_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jb_invoices`
--
ALTER TABLE `jb_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_invoice_items`
--
ALTER TABLE `jb_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_jobs`
--
ALTER TABLE `jb_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jb_job_experiences`
--
ALTER TABLE `jb_job_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_job_shifts`
--
ALTER TABLE `jb_job_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_job_skills`
--
ALTER TABLE `jb_job_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_job_types`
--
ALTER TABLE `jb_job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `jb_language_levels`
--
ALTER TABLE `jb_language_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_major_subjects`
--
ALTER TABLE `jb_major_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_packages`
--
ALTER TABLE `jb_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_reviews`
--
ALTER TABLE `jb_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_tags`
--
ALTER TABLE `jb_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_transactions`
--
ALTER TABLE `jb_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_posts`
--
ALTER TABLE `job_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=852;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `job_category_id` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`),
  ADD CONSTRAINT `job_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `job_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
