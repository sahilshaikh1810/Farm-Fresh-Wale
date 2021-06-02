-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 02, 2021 at 08:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fresh_farm`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `landmark` varchar(25) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `instruction` varchar(1000) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL COMMENT '1=>Home,2=>Work',
  `phone_number` varchar(15) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `contact_name` varchar(20) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `address`, `landmark`, `latitude`, `instruction`, `longitude`, `type`, `phone_number`, `CreatedDate`, `UpdatedDate`, `contact_name`, `deleted`) VALUES
(1, 1, 'Kadi, samar app, Near star bazar', 'Star Bazar', '23.2887849', 'Come fast', '72.3194254', 1, '1234567890', '2021-05-14 13:51:05', '2021-05-14 13:51:05', 'Kaju', 0),
(2, 2, 'gohilvas,nagarasan,kadi,Gujarat,india', NULL, '23.3502293', NULL, '72.3022787', 1, '8758410436', '2021-05-14 16:09:44', '2021-05-14 16:09:44', 'pravinsinh', 0),
(3, 2, 'Unnamed Road, Nagarasan, Gujarat 382705, India', NULL, '23.3502289', NULL, '72.302281', 1, '8758410436', '2021-05-14 16:19:09', '2021-05-14 16:19:09', 'pravinsinh Gohil', 0),
(4, 3, 'Unnamed Road, Kasba, Kadi, Gujarat 382715, India', NULL, '23.302823059656514', NULL, '72.33068324625492', 1, '9408730079', '2021-05-15 04:35:36', '2021-05-15 04:35:36', 'Yash', 0),
(5, 2, 'Kadi - Jotana Rd, Suraj, Gujarat 382705, India', NULL, '23.350133', NULL, '72.3050273', 1, '8758410436', '2021-05-27 10:13:38', '2021-05-27 10:13:38', 'pravinsinh', 0),
(6, 2, 'Unnamed Road, Nagarasan, Gujarat 382705, India', NULL, '23.3501363', NULL, '72.3012886', 1, '8758410436', '2021-05-27 16:26:39', '2021-05-27 16:26:39', 'pravinsinh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  `user_type` tinyint(4) DEFAULT NULL COMMENT '1=>admin 2=>shopper',
  `is_user_approve` tinyint(4) NOT NULL COMMENT '0=>Inactive , 1=>Active',
  `is_first_login` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=> Yes 1=> No',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>inactive 1=>active ',
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `display_name`, `profile_image`, `user_type`, `is_user_approve`, `is_first_login`, `status`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Super Admin', 'assets/uploads/services/1589027912_default_user.jpg', 1, 1, '1', 1, '2021-05-10 10:18:30', '2021-05-10 10:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `auth_table`
--

CREATE TABLE `auth_table` (
  `auth_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `unique_id` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `banner_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `banner_image`, `CreatedDate`, `UpdatedDate`, `status`) VALUES
(1, '1620651774_20210507_224214.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `v_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `customer_id`, `product_id`, `quantity`, `v_id`, `status`, `CreatedDate`, `UpdatedDate`) VALUES
(11, 3, 1, 1, 1, NULL, '2021-05-27 10:41:46', '2021-05-27 10:41:46'),
(12, 3, 1, 1, 70, NULL, '2021-05-27 10:41:46', '2021-05-27 10:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`, `CreatedDate`, `UpdatedDate`, `status`) VALUES
(1, 'FRESH VEGETABLES', '1620929581_20210504_143850.jpg', '2021-05-10 13:07:18', '2021-05-13 18:13:04', 1),
(2, 'LEAFY VEGETABLES', '1620929625_20210507_223452.jpg', '2021-05-10 13:09:28', '2021-05-13 18:13:45', 1),
(3, 'EXOTIC VEGETABLES', '1620929653_20210507_224214.jpg', '2021-05-10 13:10:17', '2021-05-13 18:14:13', 1),
(4, 'ALL FRUITS', '1620929671_20210507_224800.jpg', '2021-05-10 13:10:46', '2021-05-13 18:14:31', 1),
(5, 'MILK & MILK PRODUCTS', '1620742975_1589425693_1585292471_milma.jpg', '2021-05-10 13:13:24', '2021-05-11 14:22:55', 1),
(6, 'SWEET MART', '1622114259_20210527_164453.jpg', '2021-05-10 13:16:23', '2021-05-27 11:17:39', 1),
(8, 'Testing cat', '1621243818_94480968-hourglass-sunrise-outside.jpg', '2021-05-17 09:30:18', '2021-05-27 10:23:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_data`
--

CREATE TABLE `cms_data` (
  `cms_id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `data` longtext NOT NULL,
  `status` tinyint(3) NOT NULL COMMENT '0=>inactive 1=>active '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_data`
--

INSERT INTO `cms_data` (`cms_id`, `identifier`, `data`, `status`) VALUES
(1, 'TERMS AND CONDITIONS', '<p><strong>Kindly check the FAQ below if you are not very familiar with the functioning of this App. If your query is of urgent nature and is different from the set of questions then do write to us at support@clickart.com&nbsp;</strong></p>\r\n', 1),
(2, 'About', '<p>Refer our site</p>\r\n\r\n<p><em><a href=\"http://www.techware.co.in\">www.techware.co.in</a></em></p>\r\n', 1),
(3, 'Privacy Policy', '<p>Follow the rules and regulations.</p>\r\n', 1),
(73, 'Registration', '<p><strong>How do I register?</strong></p>\r\n\r\n<p><strong>You can register by clicking on the &quot;Sign Up&quot; link at the top right corner of the homepage. Please provide the information in the form that appears. You can review the terms and conditions, provide your payment mode details and submit the registration information.</strong></p>\r\n\r\n<p><strong>Are there any charges for registration?</strong></p>\r\n\r\n<p><strong>No. Registration on Clickart.com is absolutely free.</strong></p>\r\n\r\n<p><strong>Do I have to necessarily register to shop on Clickart?</strong></p>\r\n\r\n<p><strong>You can surf and add products to the cart without registration but only registered shoppers will be able to checkout and place orders. Registered members have to be logged in at the time of checking out the cart, they will be prompted to do so if they are not logged in.</strong></p>\r\n\r\n<p><strong>Can I have multiple registrations?</strong></p>\r\n\r\n<p><strong>Each email address and phone number can only be associated with one Clickart account.</strong></p>\r\n\r\n<p><strong>Can I add more than one delivery address in an account?</strong></p>\r\n\r\n<p><strong>Yes, you can add multiple delivery addresses in your Clickart account. However, remember that all items placed in a single order can only be delivered to one address. If you want different products delivered to different address you need to place them as separate orders.</strong></p>\r\n\r\n<p><strong>Can I have multiple accounts with same mobile number and email id?</strong></p>\r\n\r\n<p><strong>Each email address and phone number can be associated with one Clickart account only.</strong></p>\r\n\r\n<p><strong>Can I have multiple accounts for members in my family with different mobile number and email address but same or common delivery address?</strong></p>\r\n\r\n<p><strong>Yes, we do understand the importance of time and the toil involved in shopping for groceries. Up to three members in a family can have the same address provided the email address and phone number associated with the accounts are unique.</strong></p>\r\n\r\n<p><strong>Can I have different city addresses under one account and still place orders for multiple cities?</strong></p>\r\n\r\n<p><strong>Yes, you can place orders for multiple cities.</strong></p>\r\n\r\n<h2><br />\r\n&nbsp;</h2>\r\n', 1),
(131, 'Order Related', '<p><strong>How do I add or remove products after placing my order?</strong></p>\r\n\r\n<p><strong>Once you have placed your order you will not be able to make modifications on the website. Please contact our customer support team for any modification of order.</strong></p>\r\n\r\n<p><strong>Is it possible to order an item which is out of stock?</strong></p>\r\n\r\n<p><strong>No you can only order products which are in stock. We try to ensure availability of all products on our website however due to supply chain issues sometimes this is not possible</strong></p>\r\n\r\n<p><strong>How do I check the current status of my order?</strong></p>\r\n\r\n<p><strong>The only way you can check the status of your order is by contacting our customer support team.</strong></p>\r\n\r\n<p><strong>How do I check which items were not available from my order? Will someone inform me about the items unavailable in my order before delivery?</strong></p>\r\n\r\n<p><strong>You will receive an email as well as an sms about unavailable items before the delivery of your order.</strong></p>\r\n\r\n<p><strong>Why is there an order cancellation fee?</strong></p>\r\n\r\n<p><strong>We charge an order cancellation fee to compensate for the slot, time and effort incurred towards processing an order.</strong></p>\r\n\r\n<p><strong>Every order placed has to undergo a system driven process as well as a manual process in order to make sure the order reaches our customers on time, every time. For this purpose, a slot is booked for every order that gets placed in our system and the order picking process happens seamlessly. In this entire process we incur labor as well as an opportunity cost on the booked slot. During the event of a cancellation the entire process has to be stopped and reset. This takes up considerable processing time to open the slot yet again for another customer to order.</strong></p>\r\n\r\n<p><strong>What You Receive Is What You Pay For</strong></p>\r\n\r\n<p><strong>At the time of delivery, we advise you to kindly check every item as in the invoice. Please report any missing item that is invoiced. As a benefit to our customers, if you are not available at the time of order delivery or you haven&rsquo;t checked the list at the time of delivery we provide a window of 48hrs to report missing items. This is applicable only for items that are invoiced.</strong></p>\r\n\r\n<p><strong>When and how can I cancel an order?</strong></p>\r\n\r\n<p><strong>you can also cancel your order from the Customer Service section on the Clickart app.</strong></p>\r\n', 1),
(132, 'Account Related', '<p><strong>What is My Account</strong></p>\r\n\r\n<p><strong>My Account is the section you reach after you log in at bigbasket.com. My Account allows you to track your active orders, credit note details as well as see your order history and update your contact details.</strong></p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>How do I reset my password?</strong></p>\r\n\r\n<p><strong>You need to enter your email address on the Login page and click on forgot password. An email with a reset password will be sent to your email address. With this, you can change your password. In case of any further issues please contact our customer support team</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1),
(133, 'Safety Tips', '<h1><strong>Dating Safety Tips</strong></h1>\r\n\r\n<p><strong>Meeting new people is exciting, but you should always be cautious when interacting with someone you don&rsquo;t know. Use your best judgment and put your safety first, whether you are exchanging initial messages or meeting in person. While you can&rsquo;t control the actions of others, there are things you can do to help you stay safe during your Rapport experience.</strong></p>\r\n\r\n<h2><strong>Online Safety</strong></h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Never Send Money or Share Financial Information<br />\r\n	Never send money, especially over wire transfer, even if the person claims to be in an emergency. Wiring money is like sending cash &mdash; it&rsquo;s nearly impossible to reverse the transaction or trace where the money went. Never share information that could be used to access your financial accounts. If another user asks you for money, report it to us immediately.<br />\r\n	Check out&nbsp; <a href=\"https://en.wikipedia.org/wiki/Romance_scam\">romance scams</a>.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Protect Your Personal Information<br />\r\n	Never share personal information, such as your social security number, home or work address, or details about your daily routine (e.g., that you go to a certain gym every Monday) with people you don&rsquo;t know. If you are a parent, limit the information that you share about your children on your profile and in early communications. Avoid sharing details such as your children&rsquo;s names, where they go to school, or their ages or genders.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Stay on the Platform<br />\r\n	Keep conversations on the Rapport platform while you&rsquo;re getting to know someone. Users with bad intentions often try to move the conversation to text, messaging apps, email, or phone right away.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Be Wary of Long Distance and Overseas Relationships<br />\r\n	Watch out for scammers who claim to be from your country but stuck somewhere else, especially if they ask for financial help to return home. Be wary of anyone who will not meet in person or talk on a phone/video call&mdash;they may not be who they say they are. If someone is avoiding your questions or pushing for a serious relationship without meeting or getting to know you first &mdash; that&rsquo;s a red flag.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Report All Suspicious and Offensive Behavior<br />\r\n	You know when someone&rsquo;s crossed the line and when they do, we want to know about it. Block and report anyone that violates our terms. Here are some examples of violations:</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p><strong>Requests for money or donations</strong></p>\r\n		</li>\r\n		<li>\r\n		<p><strong>Underage users</strong></p>\r\n		</li>\r\n		<li>\r\n		<p><strong>Harassment, threats, and offensive messages</strong></p>\r\n		</li>\r\n		<li>\r\n		<p><strong>Inappropriate or harmful behavior during or after meeting in person</strong></p>\r\n		</li>\r\n		<li>\r\n		<p><strong>Fraudulent profiles</strong></p>\r\n		</li>\r\n		<li>\r\n		<p><strong>Spam or solicitation including links to commercial websites or attempts to sell products or services</strong></p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>You can report any concerns about suspicious behavior from any profile page.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Protect Your Account<br />\r\n	Be sure to pick a strong password, and always be careful when logging into your account from a public or shared computer. Rapport will never send you an email asking for your username and password information &mdash; if you receive an email asking for account information, report it immediately.</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<h2><strong>Meeting in Person</strong></h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Don&rsquo;t Be In A Rush<br />\r\n	Take your time and get to know the other person before agreeing to meet or chat off Rapport. Don&rsquo;t be afraid to ask questions to screen for any red flags or personal dealbreakers. A phone or video call can be a useful screening tool before meeting.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Meet in Public and Stay in Public<br />\r\n	Meet for the first few times in a populated, public place &mdash; never at your home, your date&rsquo;s home, or any other private location. If your date pressures you to go to a private location, end the date.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tell Friends and Family About Your Plans<br />\r\n	Tell a friend or family member of your plans, including when and where you&rsquo;re going. Have your cell phone charged and with you at all times.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Be in Control of Your Transportation<br />\r\n	We want you to be in control of how you get to and from your date so that you can leave whenever you want. If you&rsquo;re driving yourself, it&rsquo;s a good idea to have a backup plan such as a ride-share app or a friend to pick you up.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Know Your Limits<br />\r\n	Be aware of the effects of drugs or alcohol on you specifically &mdash; they can impair your judgment and your alertness. If your date tries to pressure you to use drugs or drink more than you&rsquo;re comfortable with, hold your ground and end the date.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Don&rsquo;t Leave Drinks or Personal Items Unattended<br />\r\n	Know where your drink comes from and know where it is at all times &mdash; only accept drinks poured or served directly from the bartender or server. Many substances that are slipped into drinks to facilitate sexual assault are odorless, colorless, and tasteless. Also, keep your phone, purse, wallet, and anything containing personal information on you at all times.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>If You Feel Uncomfortable, Leave<br />\r\n	It&rsquo;s okay to end the date early if you&rsquo;re feeling uncomfortable. In fact, it&rsquo;s encouraged. And if your instincts are telling you something is off or you feel unsafe, ask the bartender or server for help.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>LGBTQ+ Travel<br />\r\n	Be careful while traveling<br />\r\n	We recognize and believe in the importance of being inclusive of all gender identities and sexual orientations, but the reality is this: nowhere in the world is without potential risk, and some countries have specific laws that target LGBTQ+ people.<br />\r\n	Check out the laws around you when you travel to a new place and research what types of legal protection, if any, are available to you based on sexual orientation. In the event that you&rsquo;re in unsafe territory, we suggest toggling off &ldquo;Show me on Rapport&rdquo; which you can find under the settings page.<br />\r\n	If you have added a sexual orientation to your profile and choose to be shown on Rapport, we will hide your sexual orientation from your profile until you leave that area.<br />\r\n	It&rsquo;s important to exercise extra caution if you choose to connect with new people in these countries - as some law enforcement have been known to use dating apps as tools for potential entrapment. Some countries have also recently introduced laws that criminalize communications between individuals on same-sex dating applications or websites and even aggravate penalties if that communication leads to sexual encounters.<br />\r\n	Visit <a href=\"https://ilga.org/maps-sexual-orientation-laws\">ILGA World</a> to see the latest sexual orientation laws by country, and consider donating to support their research.<br />\r\n	Source: ILGA World, Updated March 2019</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<h2><strong>Sexual Health &amp; Consent</strong></h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Protect Yourself<br />\r\n	When used correctly and consistently, condoms can significantly reduce the risk of contracting and passing on STI&rsquo;s like HIV. But, be aware of STIs like herpes or HPV that can be passed on through skin-to-skin contact. The risk of contracting some STIs can be reduced through <a href=\"http://www.ashasexualhealth.org/stdsstis/vaccines/\">vaccination.</a></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Know Your Status<br />\r\n	Not all STIs show symptoms, and you don&rsquo;t want to be in the dark about your status. Stay on top of your health and prevent the spread of STIs by getting tested regularly. .</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Talk About It<br />\r\n	Communication is everything: Before you get physically intimate with a partner, talk about sexual health and STI testing. And be aware &mdash; in some places, it&rsquo;s actually a crime to knowingly pass on an STI. Need help starting the conversation? <a href=\"https://www.plannedparenthood.org/learn/stds-hiv-safer-sex/get-tested/how-do-i-talk-my-partner-about-std-testing\">Here are some tips.</a></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Consent<br />\r\n	All sexual activity must start with consent and should include ongoing check-ins with your partner. Verbal communication can help you and your partner ensure that you respect each other&rsquo;s boundaries. Consent can be withdrawn at any time, and sex is never owed to anyone. Do not proceed if your partner seems uncomfortable or unsure, or if your partner is unable to consent due to the effects of drugs or alcohol. Read more about it <a href=\"https://www.rainn.org/articles/what-is-consent\">here.</a></strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<h2><strong>Resources for Help, Support, or Advice</strong></h2>\r\n\r\n<p><strong>Remember &mdash; even if you follow these tips, no method of risk reduction is perfect. If you have a negative experience, please know that it is not your fault and help is available. Report any incidents Rapport, and consider reaching out to one of the resources below. If you feel you are in immediate danger or need emergency assistance, call 911 (U.S. or Canada) or your local law enforcement agency.</strong></p>\r\n\r\n<p><strong>RAINN&rsquo;s National Sexual Assault Hotline</strong></p>\r\n\r\n<p><strong>1-800-656-HOPE (4673) | <a href=\"https://online.rainn.org/\">online.rainn.org</a> | <a href=\"https://www.rainn.org/\">www.rainn.org</a></strong></p>\r\n\r\n<p><strong>Planned Parenthood</strong></p>\r\n\r\n<p><strong>1-800-230-7526 | <a href=\"https://www.plannedparenthood.org/\">www.plannedparenthood.org</a></strong></p>\r\n\r\n<p><strong>National Domestic Violence Hotline</strong></p>\r\n\r\n<p><strong>1-800-799-SAFE (7233) or 1-800-787-3224 | <a href=\"https://www.thehotline.org/\">www.thehotline.org</a></strong></p>\r\n\r\n<p><strong>National Human Trafficking Hotline</strong></p>\r\n\r\n<p><strong>1-888-373-7888 or text 233733 | <a href=\"https://www.humantraffickinghotline.org/\">www.humantraffickinghotline.org</a></strong></p>\r\n\r\n<p><strong>National Sexual Violence Resource Center</strong></p>\r\n\r\n<p><strong>1-877-739-3895 | <a href=\"https://www.nsvrc.org/\">www.nsvrc.org</a></strong></p>\r\n\r\n<p><strong>National Center for Missing &amp; Exploited Children</strong></p>\r\n\r\n<p><strong>1-800-THE-LOST (843-5678) | <a href=\"https://www.cybertipline.com/\">www.cybertipline.com</a></strong></p>\r\n\r\n<p><strong>Cyber Civil Rights Initiative</strong></p>\r\n\r\n<p><strong>1-844-878-2274 | <a href=\"https://www.cybercivilrights.org/\">www.cybercivilrights.org</a></strong></p>\r\n\r\n<p><strong>VictimConnect - Crime Victim Resource Center</strong></p>\r\n\r\n<p><strong>1-855-4VICTIM (855-484-2846) | <a href=\"https://www.victimconnect.org/\">www.victimconnect.org</a></strong></p>\r\n\r\n<p><strong>FBI Internet Crime Complaint Center</strong></p>\r\n\r\n<p><strong><a href=\"https://www.ic3.gov/\">www.ic3.gov</a></strong></p>\r\n\r\n<p><strong>LGBT National Help Center</strong></p>\r\n\r\n<p><strong>1-888-843-4564 | <a href=\"https://www.glbtnationalhelpcenter.org/\">www.glbtnationalhelpcenter.org</a></strong></p>\r\n\r\n<p><strong>Trans Lifeline</strong></p>\r\n\r\n<p><strong>1-877-565-8860 (US) or 1-877-330-6366 (CA) | <a href=\"https://www.translifeline.org/\">www.translifeline.org</a></strong></p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1),
(134, 'Terms and Condition', '<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>TERMS OF USE</strong></p>\r\n\r\n<p><strong>Last revised on October 22, 2019</strong></p>\r\n\r\n<p><strong>Welcome to Rapport , operated by Techware Software Solutions (&ldquo;us,&rdquo; &ldquo;we,&rdquo; the &ldquo;Company&rdquo; or &ldquo;Techware&rdquo;).</strong></p>\r\n\r\n<p><strong>1. Acceptance of Terms of Use Agreement.</strong></p>\r\n\r\n<p><strong>By creating a&nbsp; Rapport account or by using any&nbsp; Rapport service, whether through a mobile device, mobile application or computer (collectively, the &ldquo;Service&rdquo;) you agree to be bound by (i) these Terms of Use, (ii) our <a href=\"https://docs.google.com/document/d/18CslhH_4AFxkmZ9z5iTLJqX9Xbh37SCpGHm8cZnFmjg/edit\">Privacy Policy</a> , each of which is incorporated by reference into this Agreement, and (iii) any terms disclosed to you if you purchase or have purchased additional features, products or services we offer on the Service (collectively, this &ldquo;Agreement&rdquo;). If you do not accept and agree to be bound by all of the terms of this Agreement (other than the limited one-time opt out right for certain users provided for in Section 15), you should not use the Service.</strong></p>\r\n\r\n<p><strong>We may make changes to this Agreement and to the Service from time to time. We may do this for a variety of reasons including to reflect changes in or requirements of the law, new features, or changes in business practices. The most recent version of this Agreement will be posted on the Service under Settings and also on&nbsp; Rapport.com, and you should regularly check for the most recent version. The most recent version is the version that applies. If the changes include material changes that affect your rights or obligations, we will notify you in advance of the changes by reasonable means, which could include notification through the Service or via email. If you continue to use the Service after the changes become effective, you agree to the revised Agreement. You agree that this Agreement shall supersede any prior agreements (except as specifically stated herein), and shall govern your entire relationship with&nbsp; Rapport, including but not limited to events, agreements, and conduct preceding your acceptance of this Agreement.</strong></p>\r\n\r\n<p><strong>2. Eligibility.</strong></p>\r\n\r\n<p><strong>You must be at least 18 years of age to create an account on&nbsp; Rapport and use the Service. By creating an account and using the Service, you represent and warrant that:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>you can form a binding contract with&nbsp; Rapport,</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>you are not a person who is barred from using the Service under the laws of India&nbsp;</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>you will comply with this Agreement and all applicable local, state, national and international laws, rules and regulations, and</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>you have never been convicted of or pled no contest to a felony, a sex crime, or any crime involving violence, and that you are not required to register as a sex offender with any state, local sex offender registry.</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>3. Your Account.</strong></p>\r\n\r\n<p><strong>In order to use&nbsp; Rapport, you may sign in using your Facebook login.&nbsp; If you do so, you authorize us to access and use certain Facebook account information, including but not limited to your public Facebook profile and information about Facebook friends you share in common with other&nbsp; Rapport users. For more information regarding the information we collect from you and how we use it, please consult our <a href=\"https://docs.google.com/document/d/18CslhH_4AFxkmZ9z5iTLJqX9Xbh37SCpGHm8cZnFmjg/edit\">Privacy Policy</a> .</strong></p>\r\n\r\n<p><strong>You are responsible for maintaining the confidentiality of your login credentials you use to sign up for&nbsp; Rapport, and you are solely responsible for all activities that occur under those credentials. If you think someone has gained access to your account, please immediately contact us.</strong></p>\r\n\r\n<p><strong>4. Modifying the Service and Termination.</strong></p>\r\n\r\n<p><strong>&nbsp;Rapport is always striving to improve the Service and bring you additional functionality that you will find engaging and useful. This means we may add new product features or enhancements from time to time as well as remove some features, and if these actions do not materially affect your rights or obligations, we may not provide you with notice before taking them. We may even suspend the Service entirely, in which event we will notify you in advance unless extenuating circumstances, such as safety or security concerns, prevent us from doing so.</strong></p>\r\n\r\n<p><strong>You may terminate your account at any time, for any reason, by following the instructions in &ldquo;Settings&rdquo; in the Service.</strong></p>\r\n\r\n<p><strong>&nbsp;Rapport may terminate your account at any time without notice if it believes that you have violated this Agreement. Upon such termination, you will not be entitled to any refund for purchases. After your account is terminated, this Agreement will terminate, except that the following provisions will still apply to you and&nbsp; Rapport: Section 4, Section 5, and Sections 12 through 19.</strong></p>\r\n\r\n<p><strong>5. Safety; Your Interactions with Other Users.</strong></p>\r\n\r\n<p><strong>Though&nbsp; Rapport strives to encourage a respectful user experience through features like the double opt-in that only allows users to communicate if they have both indicated an interest in one another, it is not responsible for the conduct of any user on or off of the Service. You agree to use caution in all interactions with other users, particularly if you decide to communicate off the Service or meet in person. In addition, you agree to review and follow&nbsp; Rapport&rsquo;s Safety Tips prior to using the Service. You agree that you will not provide your financial information (for example, your credit card or bank account information), or wire or otherwise send money to other users .</strong></p>\r\n\r\n<p><strong>YOU ARE SOLELY RESPONSIBLE FOR YOUR INTERACTIONS WITH OTHER USERS. YOU UNDERSTAND THAT&nbsp; Rapport DOES NOT CONDUCT CRIMINAL BACKGROUND CHECKS ON ITS USERS OR OTHERWISE INQUIRE INTO THE BACKGROUND OF ITS USERS.&nbsp; Rapport MAKES NO REPRESENTATIONS OR WARRANTIES AS TO THE CONDUCT OF USERS.&nbsp; Rapport RESERVES THE RIGHT TO CONDUCT &ndash; AND YOU AGREE THAT&nbsp; Rapport MAY CONDUCT - ANY CRIMINAL BACKGROUND CHECK OR OTHER SCREENINGS (SUCH AS SEX OFFENDER REGISTER SEARCHES) AT ANY TIME USING AVAILABLE PUBLIC RECORDS.</strong></p>\r\n\r\n<p><strong>6. Rights&nbsp; Rapport Grants You.</strong></p>\r\n\r\n<p><strong>&nbsp;Rapport grants you a personal, worldwide, royalty-free, non-assignable, nonexclusive, revocable, and non-sublicensable license to access and use the Service. This license is for the sole purpose of letting you use and enjoy the Service&rsquo;s benefits as intended by&nbsp; Rapport and permitted by this Agreement. Therefore, you agree not to:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>use the Service or any content contained in the Service for any commercial purposes without our written consent.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>copy, modify, transmit, create any derivative works from, make use of, or reproduce in any way any copyrighted material, images, trademarks, trade names, service marks, or other intellectual property, content or proprietary information accessible through the Service without&nbsp; Rapport&rsquo;s prior written consent.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>express or imply that any statements you make are endorsed by&nbsp; Rapport.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use any robot, bot, spider, crawler, scraper, site search/retrieval application, proxy or other manual or automatic device, method or process to access, retrieve, index, &ldquo;data mine,&rdquo; or in any way reproduce or circumvent the navigational structure or presentation of the Service or its contents.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use the Service in any way that could interfere with, disrupt or negatively affect the Service or the servers or networks connected to the Service.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>upload viruses or other malicious code or otherwise compromise the security of the Service.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>forge headers or otherwise manipulate identifiers in order to disguise the origin of any information transmitted to or through the Service.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>&ldquo;frame&rdquo; or &ldquo;mirror&rdquo; any part of the Service without&nbsp; Rapport&rsquo;s prior written authorization.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use meta tags or code or other devices containing any reference to&nbsp; Rapport or the Service (or any trademark, trade name, service mark, logo or slogan of&nbsp; Rapport) to direct any person to any other website for any purpose.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>modify, adapt, sublicense, translate, sell, reverse engineer, decipher, decompile or otherwise disassemble any portion of the Service, or cause others to do so.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use or develop any third-party applications that interact with the Service or other users&rsquo; Content or information without our written consent.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use, access, or publish the&nbsp; Rapport application programming interface without our written consent.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>probe, scan or test the vulnerability of our Service or any system or network.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>encourage or promote any activity that violates this Agreement.</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>The Company may investigate and take any available legal action in response to illegal and/ or unauthorized uses of the Service, including termination of your account.</strong></p>\r\n\r\n<p><strong>Any software that we provide you may automatically download and install upgrades, updates, or other new features. You may be able to adjust these automatic downloads through your device&rsquo;s settings.</strong></p>\r\n\r\n<p><strong>7. Rights you Grant&nbsp; Rapport.</strong></p>\r\n\r\n<p><strong>By creating an account, you grant to&nbsp; Rapport a worldwide, transferable, sub-licensable, royalty-free right and license to host, store, use, copy, display, reproduce, adapt, edit, publish, modify and distribute information you authorize us to access from Facebook, as well as any information you post, upload, display or otherwise make available (collectively, &ldquo;post&rdquo;) on the Service or transmit to other users (collectively, &ldquo;Content&rdquo;).&nbsp; Rapport&rsquo;s license to your Content shall be non-exclusive, except that Rapport&rsquo;s license shall be exclusive with respect to derivative works created through the use of the Service. For example, Rapport would have an exclusive license to screenshots of the Service, including your Content. In addition, so that Rapport can prevent the use of your Content outside of the Service, you authorize Rapport to act on your behalf with respect to infringing uses of your Content taken from the Service by other users or third parties. Our license to your Content is subject to your rights under applicable law (for example laws regarding personal data protection to the extent any Content contains personal information as defined by those laws) and is for the limited purpose of operating, developing, providing, and improving the Service and researching and developing new ones. You agree that any Content you place or that you authorize us to place on the Service may be viewed by other users and may be viewed by any person visiting or participating in the Service (such as individuals who may receive shared Content from other&nbsp; Rapport users).</strong></p>\r\n\r\n<p><strong>You agree that all information that you submit upon creation of your account, including information submitted from your Facebook account, is accurate and truthful and you have the right to post the Content on the Service and grant the license to&nbsp; Rapport above.</strong></p>\r\n\r\n<p><strong>You understand and agree that we may monitor or review any Content you post as part of a Service. We may delete any Content, in whole or in part, that in our sole judgment violates this Agreement or may harm the reputation of the Service.</strong></p>\r\n\r\n<p><strong>When communicating with our customer care representatives, you agree to be respectful and kind. If we feel that your behavior towards any of our customer care representatives or other employees is at any time threatening or offensive, we reserve the right to immediately terminate your account.</strong></p>\r\n\r\n<p><strong>In consideration for&nbsp; Rapport allowing you to use the Service, you agree that we, our affiliates, and our third-party partners may place advertising on the Service. By submitting suggestions or feedback to&nbsp; Rapport regarding our Service, you agree that Rapport may use and share such feedback for any purpose without compensating you.</strong></p>\r\n\r\n<p><strong>You agree that&nbsp; Rapport may access, preserve and disclose your account information and Content if required to do so by law or in a good faith belief that such access, preservation or disclosure is reasonably necessary, such as to: (i) comply with legal process; (ii) enforce this Agreement; (iii) respond to claims that any Content violates the rights of third parties; (iv) respond to your requests for customer service; or (v) protect the rights, property or personal safety of the Company or any other person.</strong></p>\r\n\r\n<p><strong>8. Community Rules.</strong></p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>By using the Service, you agree that you will not:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>use the Service for any purpose that is illegal or prohibited by this Agreement.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use the Service for any harmful or nefarious purpose.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use the Service in order to damage&nbsp; Rapport.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>violate our Community Guidelines , as updated from time to time.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>spam, solicit money from or defraud any users.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>impersonate any person or entity or post any images of another person without his or her permission.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>bully, &ldquo;stalk,&rdquo; intimidate, assault, harass, mistreat or defame any person.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>post any Content that violates or infringes anyone&rsquo;s rights, including rights of publicity, privacy, copyright, trademark or other intellectual property or contract right.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>post any Content that is hate speech, threatening, sexually explicit or pornographic; incites violence; or contains nudity or graphic or gratuitous violence.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>post any Content that promotes racism, bigotry, hatred or physical harm of any kind against any group or individual.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>solicit passwords for any purpose, or personal identifying information for commercial or unlawful purposes from other users or disseminate another person&rsquo;s personal information without his or her permission.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>use another user&rsquo;s account, share an account with another user, or maintain more than one account.</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>create another account if we have already terminated your account, unless you have our permission.</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp;Rapport reserves the right to investigate and/ or terminate your account without a refund of any purchases if you have violated this Agreement, misused the Service or behaved in a way that&nbsp; Rapport regards as inappropriate or unlawful, including actions or communications that occur on or off the Service.</strong></p>\r\n\r\n<p><strong>9. Other Users&rsquo; Content.</strong></p>\r\n\r\n<p><strong>Although&nbsp; Rapport reserves the right to review and remove Content that violates this Agreement, such Content is the sole responsibility of the user who posts it, and&nbsp; Rapport cannot guarantee that all Content will comply with this Agreement. If you see Content on the Service that violates this Agreement, please report it within the Service or via our contact form.</strong></p>\r\n\r\n<p><strong>10. Notice and Procedure for Making Claims of Copyright Infringement.</strong></p>\r\n\r\n<p><strong>If you believe that your work has been copied and posted on the Service in a way that constitutes copyright infringement, please provide our Copyright Agent with the following information:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright interest;</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>a description of the copyrighted work that you claim has been infringed;</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>a description of where the material that you claim is infringing is located on the Service (and such description must be reasonably sufficient to enable us to find the alleged infringing material);</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>your contact information, including address, telephone number and email address;</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>a written statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law; and</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner&rsquo;s behalf.</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp;Rapport will terminate the accounts of repeat infringers.</strong></p>\r\n\r\n<p><strong>11. Disclaimers.</strong></p>\r\n\r\n<p><strong>&nbsp;Rapport PROVIDES THE SERVICE ON AN &ldquo;AS IS&rdquo; AND &ldquo;AS AVAILABLE&rdquo; BASIS AND TO THE EXTENT PERMITTED BY APPLICABLE LAW, GRANTS NO WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED, STATUTORY OR OTHERWISE WITH RESPECT TO THE SERVICE (INCLUDING ALL CONTENT CONTAINED THEREIN), INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES OF SATISFACTORY QUALITY, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.&nbsp; Rapport DOES NOT REPRESENT OR WARRANT THAT (A) THE SERVICE WILL BE UNINTERRUPTED, SECURE OR ERROR FREE, (B) ANY DEFECTS OR ERRORS IN THE SERVICE WILL BE CORRECTED, OR (C) THAT ANY CONTENT OR INFORMATION YOU OBTAIN ON OR THROUGH THE SERVICE WILL BE ACCURATE.</strong></p>\r\n\r\n<p><strong>&nbsp;Rapport TAKES NO RESPONSIBILITY FOR ANY CONTENT THAT YOU OR ANOTHER USER OR THIRD PARTY POSTS, SENDS OR RECEIVES THROUGH THE SERVICE. ANY MATERIAL DOWNLOADED OR OTHERWISE OBTAINED THROUGH THE USE OF THE SERVICE IS ACCESSED AT YOUR OWN DISCRETION AND RISK.</strong></p>\r\n\r\n<p><strong>&nbsp;Rapport DISCLAIMS AND TAKES NO RESPONSIBILITY FOR ANY CONDUCT OF YOU OR ANY OTHER USER, ON OR OFF THE SERVICE.</strong></p>\r\n\r\n<p><strong>12. Third Party Services.</strong></p>\r\n\r\n<p><strong>The Service may contain advertisements and promotions offered by third parties and links to other web sites or resources.&nbsp; Rapport is not responsible for the availability (or lack of availability) of such external websites or resources. If you choose to interact with the third parties made available through our Service, such party&rsquo;s terms will govern their relationship with you.&nbsp; Rapport is not responsible or liable for such third parties&rsquo; terms or actions.</strong></p>\r\n\r\n<p><strong>13. Limitation of Liability.</strong></p>\r\n\r\n<p><strong>TO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL&nbsp; Rapport, ITS AFFILIATES, EMPLOYEES, LICENSORS OR SERVICE PROVIDERS BE LIABLE FOR ANY INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL, PUNITIVE, OR ENHANCED DAMAGES, INCLUDING, WITHOUT LIMITATION, LOSS OF PROFITS, WHETHER INCURRED DIRECTLY OR INDIRECTLY, OR ANY LOSS OF DATA, USE, GOODWILL, OR OTHER INTANGIBLE LOSSES, RESULTING FROM: (I) YOUR ACCESS TO OR USE OF OR INABILITY TO ACCESS OR USE THE SERVICE; (II) THE CONDUCT OR CONTENT OF OTHER USERS OR THIRD PARTIES ON, THROUGH OR FOLLOWING USE OF THE SERVICE; OR (III) UNAUTHORIZED ACCESS, USE OR ALTERATION OF YOUR CONTENT, EVEN IF&nbsp; Rapport HAS BEEN ADVISED AT ANY TIME OF THE POSSIBILITY OF SUCH DAMAGES. NOTWITHSTANDING THE FOREGOING, IN NO EVENT SHALL Rapport&rsquo;S AGGREGATE LIABILITY TO YOU FOR ANY AND ALL CLAIMS ARISING OUT OF OR RELATING TO THE SERVICE OR THIS AGREEMENT EXCEED THE AMOUNT PAID, IF ANY, BY YOU TO Rapport DURING THE TWENTY-FOUR (24) MONTH PERIOD IMMEDIATELY PRECEDING THE DATE THAT YOU FIRST FILE A LAWSUIT, ARBITRATION OR ANY OTHER LEGAL PROCEEDING AGAINST Rapport, WHETHER IN LAW OR IN EQUITY, IN ANY TRIBUNAL. THE DAMAGES LIMITATION SET FORTH IN THE IMMEDIATELY PRECEDING SENTENCE APPLIES (i) REGARDLESS OF THE GROUND UPON WHICH LIABILITY IS BASED (WHETHER DEFAULT, CONTRACT, TORT, STATUTE, OR OTHERWISE), (ii) IRRESPECTIVE OF THE TYPE OF BREACH OF OBLIGATIONS, AND (iii) WITH RESPECT TO ALL EVENTS, THE SERVICE, AND THIS AGREEMENT.</strong></p>\r\n\r\n<p><strong>THE LIMITATION OF LIABILITY PROVISIONS SET FORTH IN THIS SECTION 14 SHALL APPLY EVEN IF YOUR REMEDIES UNDER THIS AGREEMENT FAIL WITH RESPECT TO THEIR ESSENTIAL PURPOSE.</strong></p>\r\n\r\n<p><strong>SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES, SO SOME OR ALL OF THE EXCLUSIONS AND LIMITATIONS IN THIS SECTION MAY NOT APPLY TO YOU.</strong></p>\r\n\r\n<p><strong>14. Venue.</strong></p>\r\n\r\n<p><br />\r\n<strong>Except for claims that may be properly brought in a small claims court of competent jurisdiction in the county in which you reside, all claims arising out of or relating to this Agreement, to the Service, or to your relationship with&nbsp; Rapport that for whatever reason are not submitted to arbitration will be litigated exclusively in the federal or state courts of India . You and Rapport consent to the exercise of personal jurisdiction of courts in the State of Kerala and waive any claim that such courts constitute an inconvenient forum.</strong></p>\r\n\r\n<p><br />\r\n<strong>15. Indemnity by You.<br />\r\nYou agree, to the extent permitted under applicable law, to indemnify, defend and hold harmless&nbsp; Rapport, our affiliates, and their and our respective officers, directors, agents, and employees from and against any and all complaints, demands, claims, damages, losses, costs, liabilities and expenses, including attorney&rsquo;s fees, due to, arising out of, or relating in any way to your access to or use of the Service, your Content, or your breach of this Agreement.</strong></p>\r\n\r\n<p><br />\r\n<strong>16. Entire Agreement; Other.<br />\r\nThis Agreement, along with the Privacy Policy, Safety Tips, and any terms disclosed to you if you purchase or have purchased additional features, products or services we offer on the Service, contains the entire agreement between you and&nbsp; Rapport regarding your relationship with Rapport and the use of the Service, with the following exception: anyone who opted out of the retroactive application of Section 15 is still subject to and bound by any prior agreements to arbitrate with&nbsp; Rapport as well as this agreement to arbitrate on a going forward basis. If any provision of this Agreement is held invalid, the remainder of this Agreement shall continue in full force and effect. The failure of Rapport to exercise or enforce any right or provision of this Agreement shall not constitute a waiver of such right or provision. You agree that your&nbsp; Rapport account is non-transferable and all of your rights to your account and its Content terminate upon your death. No agency, partnership, joint venture, fiduciary or other special relationship or employment is created as a result of this Agreement and you may not make any representations on behalf of or bind Rapport in any manner.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `forgot_token_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime DEFAULT NULL,
  `device_uid` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_version` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ref_code` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `login_token` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `optgenerate_date` datetime NOT NULL DEFAULT current_timestamp(),
  `mobile_verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_email`, `latitude`, `longitude`, `password`, `forgot_token_date`, `forgot_token`, `CreatedDate`, `UpdatedDate`, `device_uid`, `device_name`, `device_type`, `os_version`, `address`, `updated_at`, `created_at`, `ref_code`, `status`, `login_token`, `optgenerate_date`, `mobile_verify`) VALUES
(1, 'kajal', '7436023955', 'kajal.hathaliya@ngivbt.edu.in', '23.2887849', '72.3194254', '3045c91ef052074c6d2a506b86a36c59c9f2ca83b4abefe5984ca296325f39aa31c50d6703637f0c69b060492158efb491dad6d8f6508c1398ba6038944f2b96', '', '', '2021-05-14 13:28:38', '2021-05-14 13:38:21', '8ed0fff50b830a03', 'GIONEE F9', 'Android', '28', 'Kadi, Gujrat', '2021-05-14 13:38:21', '2021-05-31 13:00:20', '377899', 1, '', '2021-05-14 13:28:38', 1),
(2, 'pravinsinh', '8758410436', 'pzgohil06@gmail.com', '23.3501363', '72.3012886', '30130de2db10449bd524f13400cf59f5f08afab7614cce1223037ad6e375fa6d2450b7a77ddbeda0fcd373e106abb10a2dadf4bdce96ff1d0ff744bcbf573759', '', '', '2021-05-14 16:08:35', '2021-05-27 16:26:38', '664c5c3e4ad5e846', 'Redmi K20', 'Android', '29', 'Unnamed Road, Nagarasan, Gujarat 382705, India', '2021-05-27 16:26:38', '2021-05-31 13:00:20', '544661', 1, '', '2021-05-14 16:08:35', 1),
(3, 'Yash', '9408730079', 'yrachchh@gmail.com', '23.302823059656514', '72.33068324625492', 'bad1be880d26e8b66798c9d94fe8bbea769c81e1c4a8b5915c707b827ade707050f79cf2d6cb31b715fa4d9e9d70fefe25fc4d432b54d8520ed507e3df3bad67', '', '', '2021-05-15 04:34:10', '2021-05-15 04:35:36', '68ffd639ee8ca3cd', 'SM-M315F', 'Android', '30', 'Unnamed Road, Kasba, Kadi, Gujarat 382715, India', '2021-05-15 04:35:36', '2021-05-31 13:00:20', '346485', 1, '', '2021-05-15 04:34:10', 1),
(4, 'Anjali Gohil', '9106728170', 'Anjaliharidwarchauhan@gmail.com', NULL, NULL, 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '', '', '2021-05-27 08:32:41', '2021-05-27 08:32:54', 'a7323798659f199d', 'Infinix X652B', 'Android', '28', '', '2021-05-27 08:32:54', '2021-05-31 13:00:20', '430572', 1, '', '2021-05-27 08:32:41', 1),
(9, 'sahil', '9904925201', 'sahil.shaikh1810@gmail.com', NULL, NULL, '$2y$10$iYO5AkF9xd4QpABFt90PgO/91fw0ghffFlcfqN7hRfbe7f8TCEtqu', '0', '0', '2021-05-31 16:59:01', NULL, NULL, NULL, NULL, NULL, '111', '2021-06-01 12:02:02', '2021-05-31 11:29:01', NULL, 1, '111', '2021-05-31 16:59:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `deliverycharges`
--

CREATE TABLE `deliverycharges` (
  `deliverycharges_id` int(11) NOT NULL,
  `deliverycharge` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `min_order_amount` double NOT NULL DEFAULT 51
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliverycharges`
--

INSERT INTO `deliverycharges` (`deliverycharges_id`, `deliverycharge`, `CreatedDate`, `UpdatedDate`, `min_order_amount`) VALUES
(1, 11, '2021-05-15 04:52:42', '2021-05-15 04:55:58', 51);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offer_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `offer_percentage` int(11) DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `booking_id` varchar(100) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` int(100) DEFAULT NULL,
  `payment_method` tinyint(5) DEFAULT NULL COMMENT '1=>COD,2=>Online Payment',
  `payment_status` int(11) DEFAULT NULL COMMENT '1=>pending,2=>paid',
  `tax` int(100) DEFAULT NULL,
  `booking_date` varchar(45) DEFAULT NULL,
  `order_time` varchar(45) NOT NULL,
  `scheduled_date` varchar(100) DEFAULT NULL,
  `scheduled_time` varchar(200) DEFAULT NULL,
  `delivery_charge` int(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1=>ordered 2=>delivered 3=>packed 4=>shipped',
  `delivery_time_id` int(11) DEFAULT NULL,
  `discount` double NOT NULL,
  `promo_id` int(11) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `booking_id`, `product_id`, `address_id`, `store_id`, `quantity`, `total_amount`, `payment_method`, `payment_status`, `tax`, `booking_date`, `order_time`, `scheduled_date`, `scheduled_time`, `delivery_charge`, `status`, `delivery_time_id`, `discount`, `promo_id`, `note`, `comments`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 3, 'FFW1622099801', 0, 4, NULL, NULL, 80, 3, 2, NULL, '2021-05-27', '2021-05-27 12:46:41', '29-05-2021', '1', 11, 1, 1, 0, 0, NULL, '', '2021-05-27 12:46:41', '2021-05-27 12:46:41'),
(2, 2, 'FFW1622110520', 0, 2, NULL, NULL, 72, 3, 2, NULL, '2021-05-27', '2021-05-27 15:45:20', '29-05-2021', '1', 11, 6, 1, 0, 0, NULL, '', '2021-05-27 15:45:20', '2021-05-27 21:53:32'),
(3, 2, 'FFW1622115266', 0, 5, NULL, NULL, 511, 3, 2, NULL, '2021-05-27', '2021-05-27 17:04:26', '29-05-2021', '1', 11, 1, 1, 0, 0, NULL, '', '2021-05-27 17:04:26', '2021-05-27 17:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `op_id` int(11) NOT NULL,
  `booking_id` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`op_id`, `booking_id`, `product_id`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 1, 3, 23, 1, '2021-06-01 07:13:04', '0000-00-00 00:00:00'),
(2, '2', 1, 1, 23, 1, '2021-06-01 07:13:04', '0000-00-00 00:00:00'),
(3, '2', 2, 2, 19, 1, '2021-06-01 07:13:04', '0000-00-00 00:00:00'),
(4, '3', 67, 1, 140, 1, '2021-06-01 07:13:04', '0000-00-00 00:00:00'),
(5, '3', 67, 1, 360, 1, '2021-06-01 07:13:04', '0000-00-00 00:00:00'),
(8, NULL, 1, 1, 250, NULL, '2021-06-01 01:54:11', '2021-06-01 07:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `problem_report`
--

CREATE TABLE `problem_report` (
  `pr_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(250) DEFAULT NULL,
  `prblm_desc` varchar(1000) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `product_discription` varchar(200) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `product_name` varchar(77) DEFAULT NULL,
  `product_image` varchar(200) DEFAULT NULL,
  `product_qty` int(11) NOT NULL DEFAULT 0,
  `price` varchar(512) DEFAULT NULL,
  `attribute` varchar(512) DEFAULT NULL,
  `unit` varchar(512) DEFAULT NULL,
  `market_price` double(7,2) DEFAULT NULL,
  `product_discount` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `SKU`, `product_discription`, `category_id`, `subcat_id`, `product_name`, `product_image`, `product_qty`, `price`, `attribute`, `unit`, `market_price`, `product_discount`, `status`) VALUES
(1, '101', 'An onion is a round vegetable with a brown skin that grows underground. It has many white layers on its inside which have a strong, sharp smell and taste.', 1, 1, 'Onion 1 Kg', NULL, 0, '250', NULL, 'kg', 300.00, 2, 1),
(2, '102', 'A potato is a root vegetable, the Solanum tuberosum. It is a small plant with large leaves. The part of the potato that people eat is a tuber that grows under the ground. A potato contains a lot of st', 1, 1, 'Potato 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(3, '103', 'The fiber in carrots can help keep blood sugar levels under control. And they\'re loaded with vitamin A and beta-carotene, which there\'s evidence to suggest can lower your diabetes risk. They can stren', 1, 1, 'Carrot-Orange 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(4, '104', 'Okra is a nutritious food with many health benefits. It\'s rich in magnesium, folate, fiber, antioxidants, and vitamin C, K1, and A. Okra may benefit pregnant women, heart health, and blood sugar contr', 1, 1, 'Lady Finger 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(5, '105', 'Spinach is a superfood. It is loaded with tons of nutrients in a low-calorie package. Dark, leafy greens like spinach are important for skin, hair, and bone health. They also provide protein, iron, vi', 2, 2, 'Spinach 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(6, '106', 'Tomatoes are the major dietary source of the antioxidant lycopene, which has been linked to many health benefits, including reduced risk of heart disease and cancer. They are also a great source of vi', 1, 1, 'Tomato 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(7, '107', 'They are low in calories but contain many important vitamins and minerals, as well as a high water content. Eating cucumbers may lead to many potential health benefits, including weight loss, balanced', 1, 1, 'Cucumber-English 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(8, '108', 'Cauliflower is a cruciferous vegetable that is naturally high in fiber and B-vitamins. It provides antioxidants and phytonutrients that can protect against cancer. It also contains fiber to enhance we', 1, 1, 'Cauliflower 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(9, '109', 'Green capsicums are still a good source of nutrients and fibre. However, red capsicums tick the superfood box when it comes to vitamin and antioxidant content.” All capsicums, whether red, green, yell', 1, 1, 'Capsicum Green 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(10, '110', 'Green beans are a good source of vitamins and minerals. Green beans contain many essential vitamins, including folate. One cup of raw green beans contains 33 micrograms (mcg) of folate, almost 10 perc', 1, 1, 'French Beans 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(11, '111', 'Cabbage, especially red cabbage, seems to raise levels of beta-carotene, lutein, and other heart-protective antioxidants. It also helps lower something called “oxidized” LDL, which is linked to harden', 1, 1, 'Cabbage 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(12, '112', 'Beets provide some impressive health benefits. Not to mention, they are low in calories and a great source of nutrients, including fiber, folate and vitamin C. Beets also contain nitrates and pigments', 1, 1, 'Beet Root 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(13, '113', 'Based on the available evidence, fenugreek has benefits for lowering blood sugar levels, boosting testosterone, and increasing milk production in breastfeeding mothers. Fenugreek may also reduce chole', 2, 2, 'Fenugreek Leaves 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(14, '114', 'It belongs to the gourd family- Cucurbitaceae and is a running or climbing vine. The fruit is harvested young and used as a vegetable. It has a light green smooth skin and a white inner flesh. Usually', 1, 1, 'Bottle Gourd 2 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(15, '115', 'What is ridge gourd, turai, turiya? It is a dark green, ridged and tapering pretty vegetable. It has white pulp with white seeds embedded in spongy flesh. A ridge gourd also commonly known as Turai or', 1, 1, 'Ridge Gourd 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(16, '116', 'Sweet corn (Zea mays convar. saccharata var. rugosa; also called sweetcorn, sugar corn and pole corn) is a variety of maize with a high sugar content. Sweet corn is the result of a naturally occurring', 1, 1, 'American Corn 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(17, '117', 'The young, slender fruits, commonly known as \"drumsticks\", are prepared as a culinary vegetable, often cut into shorter lengths and stewed in curries and soups. The taste is described as reminiscent o', 1, 1, 'Drumstick ( Saragavo ) 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(18, '118', 'Mints are aromatic, almost exclusively perennial herbs. They have wide-spreading underground and overground stolons and erect, square, branched stems. The leaves are arranged in opposite pairs, from o', 2, 2, 'Mint Leaves 150 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(19, '119', 'The climbing ivy gourd, used in ayruvedic medicine to treat diabetes mellitus. Ingestion of an extract made from its dried leaves, often mixed with the dried roots of Abroma augusta, lowers blood suga', 1, 1, 'Coccinia 300 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(20, '120', 'Bitter gourd is a rich source of vitamins and minerals. It contains iron, magnesium, potassium and vitamins like A and C. It contains twice the calcium of spinach and beta-carotene of broccoli. Variou', 1, 1, 'Bitter Gourd 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(21, '121', 'onion might have different tastes, there is no particular way to define it; it can be strong, mild, aromatic, tear-inducing, acidic, salty, bitter, sweet and much more. Whereas, Spring onions taste mi', 2, 2, 'Spring Onion 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(22, '122', 'Very rich in dietary fiber, cluster bean offers heart health benefits. It also helps in maintaining a well digestive system. 2. It also contains Vitamin C that makes bones and teeth stronger.', 1, 1, 'Cluster Beans 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(23, '123', 'What is Chawli, Black Eyed Beans, Cowpeas? ... The skin of black-eyed beans is quite thick. It has a subtle, nutty aroma and a rich creamy taste that is slightly earthy. It is a subspecies of the cowp', 1, 1, 'Chowli Beans 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(24, '124', 'Pointed gourd is a good source of vitamins and minerals. It is a good source of carbohydrates, vitamin A, and vitamin C. It also contains major nutrients and trace elements (magnesium, potassium, copp', 1, 1, 'Pointed Gourd 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(25, '125', 'Raw papaya pulp contains 88% water, 11% carbohydrates, and negligible fat and protein (table).', 1, 1, 'Raw Papaya 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(26, '126', 'Green mangoes are rich in vitamin C, vitamin A, vitamin B6, and vitamin K. It is also a vital source of magnesium, calcium, iron, and dietary fibers that detoxify the liver.', 1, 1, 'Raw Mango Desi 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(27, '127', 'Green mangoes are rich in vitamin C, vitamin A, vitamin B6, and vitamin K. It is also a vital source of magnesium, calcium, iron, and dietary fibers that detoxify the liver.', 1, 1, 'Raw Mango Totapuri 2 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(28, '128', 'Cucumber, Cucumis sativus, is a warm season, vining, annual plant in the family Cucurbitaceae grown for its edible cucumber fruit. ... The cucumber fruit varies in shape but is generally a curved cyli', 1, 1, 'Kakadi Desi 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(29, '129', 'Cucumber, Cucumis sativus, is a warm season, vining, annual plant in the family Cucurbitaceae grown for its edible cucumber fruit. ... The cucumber fruit varies in shape but is generally a curved cyli', 1, 1, 'Kakadi Desi 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(30, '130', 'Jackfruits grow on the branches and trunks of tall trees. ... Then again, the jackfruit is not your typical fruit. It\'s got a distinctive, musky smell, and a flavor that some describe as like Juicy Fr', 1, 1, 'Jackfruit / Fanash 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(31, '131', 'Coriander, Coriandrum sativum, is an erect annual herb in the family Apiaceae. The leaves of the plant are variable in shape, broadly lobed at the base of the plant, and slender and feathery higher on', 2, 2, 'Coriander leaves 150 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(32, '132', 'The major constituents in ginger rhizomes are carbohydrates (50–70%), lipids (3–8%), terpenes, and phenolic compounds [10]. Terpene components of ginger include zingiberene, ?-bisabolene, ?-farnesene,', 1, 1, 'Ginger 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(33, '133', 'Fruit Shape: Oval. Fruit Colour: Shining Reddish Purple. Fruit Weight: 60 - 70 gm.', 1, 1, 'Brinjal Ravaiya 500 gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(34, '134', 'Bottle brinjals or eggplants are oval-shaped, smooth and glossy skinned, deep-purple or green coloured vegetables. Eggplants are low in sodium, saturated Fat, and cholesterol.', 1, 1, 'Brinjal Bhatta 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(35, '135', 'The lime green eggplant is capped with a dark green calyx, a very small stem, and the outer skin is smooth and glossy. The inner flesh is ivory, dense, and spongy with very few edible seeds.', 1, 1, 'Brinjal Green 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(36, '136', 'the edible starchy tuberous root of various plants (genus Dioscorea of the family Dioscoreaceae) used as a staple food in tropical areas also : a plant producing yams.', 1, 1, 'Yam 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(37, '137', 'Long green chillies are a lot milder than the smaller bird\'s eye chillies used in a lot of Indian cooking. They are still spicy but not numbingly so. If you still want to reduce the heat some, remove ', 1, 1, 'Green chilli Long Spicy 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(38, '138', ' green chillies are a lot milder than the smaller bird\'s eye chillies used in a lot of Indian cooking. They are still spicy but not numbingly so. If you still want to reduce the heat some, remove the ', 1, 1, 'Green Chilli Short Hot 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(39, '139', 'A spice without which Indian cuisine would be incomplete, the most common variety of chilli used apart from red is the green. These are used with or without the stalks, whole or chopped, with seeds or', 1, 1, 'Green Chilli Not Spicy 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(40, '140', 'The lemon is a round, slightly elongated fruit, it has a strong and resistant skin, with an intense bright yellow colour when it is totaly ripe, giving off a special aroma when it is cut. The pulp is ', 1, 1, 'Lemon 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(41, '141', 'The Sponge gourd is a cylindrical fruit that grows on a climbing, herbaceous vine. ... The interior flesh of the Sponge gourd is smooth and creamy-white. Sponge gourd has a mild, zucchini-like sweet t', 1, 1, 'Spong Gourd 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(42, '142', 'This is a vegan and gluten free dish. Lal tandalja ni bhaji is red amaranth leaves. This is rarely used amongst gujarati communities.It is very commonly used in Goa and it is called tambdi bhaji,becau', 2, 2, 'Tandarja 300 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(43, '143', 'White button mushrooms are small to medium in size with caps averaging 2-7 centimeters in diameter and are attached to short, truncated stems. The smooth white caps are rounded, firm, and spongy. When', 3, 3, 'Mushroom Botton ( 1 Box Approx 200 Gm )', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(44, '144', 'Broccoli is a fast-growing annual plant that grows 60–90 cm (24–35 inches) tall. Upright and branching with leathery leaves, broccoli bears dense green clusters of flower buds at the ends of the centr', 3, 3, 'Broccoli 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(45, '145', 'Red capsicum is member of the plants named scientifically as Capsicum annuum like green capsicum, yellow capsicum. Like chilli peppers (jalapenos), red capsicum is originated in South America. ... Red', 3, 3, 'Capsicum Red 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(46, '146', 'Yellow capsicums achieve their wonderful colour simply because they are left on the plant longer before picking. They are glossy and smooth-skinned. Yellow capsicums are 3 to 4 lobed fruits of the cap', 3, 3, 'Capsicum Yellow 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(47, '147', 'Iceberg is a variety of lettuce with crisp leaves that grow in a spherical head resembling cabbage. It is considered one of the sweeter lettuce varieties like romaine and butterhead. Mature iceberg le', 3, 3, 'Lettuce Iceberg ( 1 pc )', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(48, '148', 'Zucchini, also known as courgette, is a summer squash in the Cucurbitaceae plant family, alongside melons, spaghetti squash, and cucumbers. ... Although zucchini is often considered a vegetable, it is', 3, 3, 'Zucchini Green 250 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(49, '149', 'Antioxidants in grapes, such as resveratrol, reduce inflammation and may help protect against cancer, heart disease and diabetes. Grapes are easy to incorporate into your diet, whether fresh, frozen, ', 4, 4, 'Grapes Sonaka Seedless Nashik ( 1 Kg )', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(50, '150', 'Badam mango is known for their beautiful shape, flavor and divine floral fragrance. This mango is large in size. They are smooth-skinned and bright yellow upon ripening and have no blush. The flesh is', 4, 4, 'Mango Badam 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(51, '151', 'Kesar is a small to medium fruit with a roundish shape and a distinct curved tip. It has a relatively unexciting appearance, having skin that is a dull, slightly mottled yellow colour, perhaps with a ', 4, 4, 'Mango Kesar 1 Kg ( Gir Talala )', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(52, '152', 'Totapuri is one of the main cultivars grown in India for mango pulp, along with Alphonso, Dasheri, and Kesar mango. The tree is medium size with greenish yellow fruits.', 4, 4, 'Mango Totapuri 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(53, '153', 'Coconut water, less commonly known as coconut juice, is the clear liquid inside coconuts. In early development, it serves as a suspension for the endosperm of the coconut during the nuclear phase of d', 4, 4, 'Green Coconut 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(54, '154', 'Watermelon is a good source of vitamin C and contains decent amounts of potassium, copper, vitamin B5, and vitamin A (from beta carotene).', 4, 4, 'Water Melon 1 Pc ( Approx Weight 2 Kg To 3 Kg )', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(55, '155', 'Shimla apples are a good source of vitamin C, dietary fiber, flavonoids, and antioxidants.', 4, 4, 'Apple Shimla 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(56, '156', 'SUMMARY Apples are a good source of fiber and vitamin C. They also contain polyphenols, which may have numerous health benefits.', 4, 4, 'Apple Delicious 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(57, '157', 'The banana is a lengthy yellow fruit, found in the market in groups of three to twenty fruits, similar to a triangular cucumber, oblong and normally yellow. Its flavour is more or less sweet, dependin', 4, 4, 'Banana 6 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(58, '158', 'Pomegranate juice contains higher levels of antioxidants than most other fruit juices. It also has three times more antioxidants than red wine and green tea. The antioxidants in pomegranate juice can ', 4, 4, 'Pomegranate 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(59, '159', 'Fresh produce imported oranges are citrus, aromatic, seedless, bigger in size, and easy to peel. You can eat them raw, extract their juice, or use them in various recipes. It can give a unique aroma a', 4, 4, 'Orange Imported 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(60, '160', 'Muskmelon has a ribbed, tan skin and a sweet, musky flavor and aroma. Over the years, many unique varieties of muskmelon have emerged, including cantaloupe.', 4, 4, 'Musk Melon 2 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(61, '161', 'Kiwis are small fruits that pack a lot of flavor and plenty of health benefits. Their green flesh is sweet and tangy. It\'s also full of nutrients like vitamin C, vitamin K, vitamin E, folate, and pota', 4, 4, 'Kiwi Green 3 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(62, '162', 'Being rich in calcium, iron and phosphorus, sapota greatly helps in enhancing and strengthening the bones. Copper is essential for the growth of bones, connective tissue, and muscles. The deficiency o', 4, 4, 'Sapota 500 Gm', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(63, '163', 'Being rich in calcium, iron and phosphorus, sapota greatly helps in enhancing and strengthening the bones. Copper is essential for the growth of bones, connective tissue, and muscles. The deficiency o', 4, 4, 'Sapota/Farm Fresh 500 Gm ', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(64, '164', 'Mosambi is small to medium in size, averaging seven centimeters in diameter, and is round to oval in shape with a slightly lumpy exterior. ... Mosambi is generally sweet with a mild flavor and contain', 4, 4, 'Mosambi 1 Kg', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(65, '165', 'Eating it may be particularly advantageous for women because its high vitamin C content plays an important role in supporting healthy bones and reducing the risk of osteoporosis. Furthermore, pineappl', 4, 4, 'Pineapple 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(66, '166', 'The papaya fruit is slightly sweet, with an agreeable musky tang, which is more pronounced in some varieties and in some climates than in others. It is a popular breakfast fruit in many countries and ', 4, 4, 'Papaya 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(67, '167', 'Dragon fruit is high in vitamin C and other antioxidants, which are good for your immune system. It can boost your iron levels. Iron is important for moving oxygen through your body and giving you ene', 4, 4, 'Dragon Fruit Red 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(68, '168', 'Dragon fruit is high in vitamin C and other antioxidants, which are good for your immune system. It can boost your iron levels. Iron is important for moving oxygen through your body and giving you ene', 4, 4, 'Dragon Fruit White 1 Pc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`image_id`, `product_id`, `product_image`, `CreatedDate`, `UpdatedDate`, `status`) VALUES
(1, 1, 'Desi-onion.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(2, 2, 'potato-600x600.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(3, 3, 'ootycarrot.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(4, 4, '8bf1be26d02c37b7abf2b9bdc0f8f32f.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(5, 5, 'depositphotos_61386463-stock-photo-fresh-green-spinach-leaves.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(6, 5, 'depositphotos_61386463-stock-photo-fresh-green-spinach-leaves.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(7, 6, 'Tomato.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(8, 7, '704648_main-600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(9, 8, 'Cauliflower-600x600-1.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(10, 9, 'Green-Capsicum-600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(11, 10, 'french-beans-500-g-0-20200710.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(12, 11, 'cabbage-per-pc-0-20200710.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(13, 12, '10063-600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(14, 13, '0018825_fresh-methi-leaves-india_600_800x.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(15, 14, 'Bottle Gourd-800x800.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(16, 15, 'Ridgegourd.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(17, 16, 'fresh-american-sweet-corn-500x500.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(18, 17, 'fede_product_40_image_1.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(19, 18, 'fresh-mint-leaves-1569846043-5100281.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(20, 19, 'Tendali-1-600x600-1-600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(21, 20, 'm_varieties_996.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(22, 21, 'fresh-spring-onion-1594068139-5510866.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(23, 22, 'Cluster-beans.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(24, 23, '71gSaPpx7LL._SX466_.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(25, 24, 'pointed-gourd.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(26, 25, 'raw-papaya-freshproduceshoppe-600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(27, 26, 'Green-Mango-Kachi_keri.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(28, 27, 'rawmango_1kg.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(29, 28, 'Kakdi-subji-market-www.subjimarket.com_.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(30, 29, 'Kakdi-subji-market-www.subjimarket.com_.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(32, 31, 'Coriander-leaf-600x600-1.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(33, 32, 'Ginger.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(34, 33, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(35, 34, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(36, 35, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(37, 36, 'Yam.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(38, 37, '5ca393_cd829321f3f0452e9799528d965a865e_mv2.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(39, 38, '8bf1be26d02c37b7abf2b9bdc0f8f32f.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(40, 39, 'Green_Chilli-600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(41, 40, 'lemon-600x600.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(42, 41, 'R-DRoz-Sponge-Gourd-Tori-SDL969076682-1-b96aa.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(43, 42, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(44, 43, 'organic-button-mushroom-500x500-jpg-500x500.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(45, 44, 'Broccoli.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(46, 45, 'frut-plants-500x500.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(47, 46, 'yellow-capsicum-500x500.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(48, 47, 'kisspng-iceberg-lettuce-organic-food-lettuce-sandwich-sala-salad-5ab511a05fcbf9.7070887915218159683924.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(49, 48, 'green-zucchini-500x500.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(50, 49, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(51, 50, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(52, 51, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(53, 52, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(54, 53, 'download (5).jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(55, 54, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(56, 55, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(57, 56, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(58, 57, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(59, 58, 'image.jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(60, 59, '1364445_425x425.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(61, 60, 'muskmelon-yellow.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(62, 61, 'unnamed (8).jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(63, 62, 'download (6).jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(64, 63, 'download (6).jpeg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(65, 64, '9d888454309e411e29abd138b81f8c79.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(66, 65, '380-3807920_pineapple-png.png', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(67, 66, '598_600x600.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(68, 67, 'fresh-dragon-fruit-white-background_52253-1494_grande.jpg', '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(112, 67, 'dragon-fruit-plant-sapling.webp', '2021-05-27 11:26:47', '2021-05-27 11:26:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `promo_id` int(11) NOT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `discount_per` int(11) DEFAULT NULL,
  `min_order_amount` int(11) DEFAULT NULL,
  `max_discount` int(11) DEFAULT NULL,
  `starting_date` timestamp NULL DEFAULT NULL,
  `ending_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `subcat_id` int(11) NOT NULL,
  `subcategory_name` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0=>inactive 1=>active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`subcat_id`, `subcategory_name`, `category_id`, `image`, `status`) VALUES
(1, 'Fresh Vegetables', 1, 'assets/uploads/services/1620653076_20210504_143850.jpg', 1),
(2, 'Leafy Vegetables', 2, 'assets/uploads/services/1621005881_20210507_223452.jpg', 1),
(3, 'Exotic Vegetables', 3, 'assets/uploads/services/1621005966_20210507_224214.jpg', 1),
(4, 'All Fruits', 4, 'assets/uploads/services/1621006031_20210507_224800.jpg', 1),
(5, 'Milk', 5, 'assets/uploads/services/1621177270_20210425_112037.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_promo`
--

CREATE TABLE `user_promo` (
  `up_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `no_of_used` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `variation`
--

CREATE TABLE `variation` (
  `v_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `unit_val` double NOT NULL,
  `market_price` double(7,2) DEFAULT NULL,
  `product_discount` int(11) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation`
--

INSERT INTO `variation` (`v_id`, `product_id`, `unit`, `price`, `unit_val`, `market_price`, `product_discount`, `CreatedDate`, `UpdatedDate`, `status`) VALUES
(1, 1, 'Kg', 23, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(2, 2, 'Kg', 19, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(3, 3, 'Gm', 30, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(4, 4, 'Gm', 26, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(5, 5, 'Gm', 13, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(6, 6, 'Kg', 37, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(7, 7, 'Gm', 25, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(8, 8, 'Pc', 40, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(9, 9, 'Gm', 32, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(10, 10, 'Gm', 30, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(11, 11, 'Pc', 25, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(12, 12, 'Gm', 25, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(13, 13, 'Gm', 30, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(14, 14, 'Pc', 40, 2, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(15, 15, 'Gm', 35, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(16, 16, 'Pc', 15, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(17, 17, 'Gm', 32, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(18, 18, 'Gm', 20, 150, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(19, 19, 'Gm', 20, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(20, 20, 'Gm', 36, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(21, 21, 'Gm', 25, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(22, 22, 'Gm', 30, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(23, 23, 'Gm', 45, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(24, 24, 'Gm', 35, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(25, 25, 'Pc', 30, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(26, 26, 'Kg', 26, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(27, 27, 'Pc', 40, 2, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(28, 28, 'Gm', 30, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(29, 29, 'Gm', 25, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(30, 30, 'Kg', 90, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(31, 31, 'Gm', 15, 150, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(32, 32, 'Gm', 20, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(33, 33, 'Gm', 20, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(34, 34, 'Gm', 20, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(35, 35, 'Gm', 25, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(36, 36, 'Gm', 40, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(37, 37, 'Gm', 15, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(38, 38, 'Gm', 30, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(39, 39, 'Gm', 15, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(40, 40, 'Gm', 48, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(41, 41, 'Gm', 36, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(42, 42, 'Gm', 18, 300, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(43, 43, 'Box', 80, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(44, 44, 'Gm', 60, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(45, 45, 'Gm', 100, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(46, 46, 'Gm', 100, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(47, 47, 'Pc', 60, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(48, 48, 'Gm', 70, 250, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(49, 49, 'Kg', 120, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(50, 50, 'Kg', 70, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(51, 51, 'Kg', 120, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(52, 52, 'Kg', 60, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(53, 53, 'Pc', 70, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(54, 54, 'Pc', 50, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(55, 55, 'Kg', 220, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(56, 56, 'Kg', 240, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(57, 57, 'Pc', 40, 6, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(58, 58, 'Kg', 120, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(59, 59, 'Kg', 150, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(60, 60, 'Pc', 40, 2, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(61, 61, 'Pc', 150, 3, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(62, 62, 'Gm', 30, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(63, 63, 'Gm', 25, 500, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(64, 64, 'Kg', 90, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(65, 65, 'Pc', 70, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(66, 66, 'Pc', 60, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-14 13:06:51', 1),
(67, 67, 'Pc', 140, 1, 150.00, 0, '2021-05-14 13:06:51', '2021-05-27 11:26:47', 1),
(68, 68, 'Pc', 130, 1, 0.00, 0, '2021-05-14 13:06:51', '2021-05-27 11:21:37', 1),
(70, 1, 'Kg', 23, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(71, 2, 'Kg', 19, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(72, 3, 'Gm', 30, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(73, 4, 'Gm', 26, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(74, 5, 'Gm', 13, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(75, 6, 'Kg', 37, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(76, 7, 'Gm', 25, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(77, 8, 'Pc', 40, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(78, 9, 'Gm', 32, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(79, 10, 'Gm', 30, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(80, 11, 'Pc', 25, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(81, 12, 'Gm', 25, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(82, 13, 'Gm', 30, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(83, 14, 'Pc', 40, 2, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(84, 15, 'Gm', 35, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(85, 16, 'Pc', 15, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(86, 17, 'Gm', 32, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(87, 18, 'Gm', 20, 150, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(88, 19, 'Gm', 20, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(89, 20, 'Gm', 36, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(90, 21, 'Gm', 25, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(91, 22, 'Gm', 30, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(92, 23, 'Gm', 45, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(93, 24, 'Gm', 35, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(94, 25, 'Pc', 30, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(95, 26, 'Kg', 26, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(96, 27, 'Pc', 40, 2, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(97, 28, 'Gm', 30, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(98, 29, 'Gm', 25, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(99, 30, 'Kg', 90, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(100, 31, 'Gm', 15, 150, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(101, 32, 'Gm', 20, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(102, 33, 'Gm', 20, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(103, 34, 'Gm', 20, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(104, 35, 'Gm', 25, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(105, 36, 'Gm', 40, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(106, 37, 'Gm', 15, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(107, 38, 'Gm', 30, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(108, 39, 'Gm', 15, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(109, 40, 'Gm', 48, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(110, 41, 'Gm', 36, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(111, 42, 'Gm', 18, 300, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(112, 43, 'Box', 80, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(113, 44, 'Gm', 60, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(114, 45, 'Gm', 100, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(115, 46, 'Gm', 100, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(116, 47, 'Pc', 60, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(117, 48, 'Gm', 70, 250, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(118, 49, 'Kg', 120, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(119, 50, 'Kg', 70, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(120, 51, 'Kg', 120, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(121, 52, 'Kg', 60, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(122, 53, 'Pc', 70, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(123, 54, 'Pc', 50, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(124, 55, 'Kg', 220, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(125, 56, 'Kg', 240, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(126, 57, 'Pc', 40, 6, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(127, 58, 'Kg', 120, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(128, 59, 'Kg', 150, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(129, 60, 'Pc', 40, 2, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(130, 61, 'Pc', 150, 3, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(131, 62, 'Gm', 30, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(132, 63, 'Gm', 25, 500, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(133, 64, 'Kg', 90, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(134, 65, 'Pc', 70, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(135, 66, 'Pc', 60, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 06:39:18', 1),
(136, 67, 'Kg', 360, 1, 400.00, 0, '2021-05-27 06:39:18', '2021-05-27 11:26:47', 1),
(137, 68, 'Kg', 300, 1, 0.00, 0, '2021-05-27 06:39:18', '2021-05-27 11:21:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `v_settings`
--

CREATE TABLE `v_settings` (
  `id` int(11) NOT NULL,
  `v_key` varchar(100) NOT NULL,
  `v_val` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `wallet_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `wallet_balance` decimal(10,0) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`wallet_id`, `user_id`, `wallet_balance`, `status`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 1, '0', NULL, '2021-05-14 13:28:38', '2021-05-14 13:28:38'),
(2, 2, '3', NULL, '2021-05-14 16:08:35', '2021-05-27 16:22:14'),
(3, 3, '0', NULL, '2021-05-15 04:34:10', '2021-05-15 04:34:10'),
(4, 4, '0', NULL, '2021-05-27 08:32:41', '2021-05-27 08:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wish_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_table`
--
ALTER TABLE `auth_table`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cms_data`
--
ALTER TABLE `cms_data`
  ADD PRIMARY KEY (`cms_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `deliverycharges`
--
ALTER TABLE `deliverycharges`
  ADD PRIMARY KEY (`deliverycharges_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`op_id`);

--
-- Indexes for table `problem_report`
--
ALTER TABLE `problem_report`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `SKU` (`SKU`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`subcat_id`);

--
-- Indexes for table `user_promo`
--
ALTER TABLE `user_promo`
  ADD PRIMARY KEY (`up_id`);

--
-- Indexes for table `variation`
--
ALTER TABLE `variation`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `v_settings`
--
ALTER TABLE `v_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wish_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_table`
--
ALTER TABLE `auth_table`
  MODIFY `auth_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cms_data`
--
ALTER TABLE `cms_data`
  MODIFY `cms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deliverycharges`
--
ALTER TABLE `deliverycharges`
  MODIFY `deliverycharges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `op_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `problem_report`
--
ALTER TABLE `problem_report`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `subcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_promo`
--
ALTER TABLE `user_promo`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation`
--
ALTER TABLE `variation`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `v_settings`
--
ALTER TABLE `v_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
