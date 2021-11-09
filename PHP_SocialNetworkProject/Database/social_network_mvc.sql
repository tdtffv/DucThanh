-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2021 at 05:24 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_network_mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `ans_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ans` text NOT NULL,
  `ans_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`ans_id`, `content`, `post_id`, `user_id`, `user_ans`, `ans_date`) VALUES
(8, 'Sale your kidney', 4, 1, 'vi_duong_253938', '2021-07-02 04:11:12'),
(10, 'It is because of you maybe', 2, 2, 'ducthanh_trinh_921118', '2021-07-02 09:42:11'),
(11, 'Hello again', 5, 1, 'ducthanh_trinh_921118', '2021-07-04 07:01:25'),
(12, 'So?', 3, 1, 'ducthanh_trinh_921118', '2021-07-05 06:44:55'),
(13, 'No it is very easy', 2, 2, 'haiyen_vuthi_887749', '2021-07-06 06:13:21'),
(14, 'So what?', 3, 1, 'haiyen_vuthi_887749', '2021-07-06 06:13:43'),
(15, 'It just hate you, thats all', 1, 2, 'haiyen_vuthi_887749', '2021-07-06 06:14:31'),
(16, 'Sale your blood', 4, 1, 'haiyen_vuthi_887749', '2021-07-06 06:15:01'),
(17, 'because you re rich', 5, 1, 'haiyen_vuthi_887749', '2021-07-06 06:15:30'),
(19, 'Watch some funny video', 7, 2, 'nguyen_vuong_980473', '2021-07-14 10:06:02'),
(20, 'Because they ate it alot?', 11, 3, 'ducthanh_trinh_921118', '2021-07-15 09:11:29'),
(22, 'Love you allllllll', 25, 5, 'nguyen_vuong_980473', '2021-07-16 05:54:48'),
(23, 'Love you toooo', 25, 5, 'ducthanh_trinh_921118', '2021-07-16 05:55:20'),
(24, 'Buy new once', 12, 1, 'vi_duong_253938', '2021-07-16 06:00:00'),
(26, 'Shopee, Lazada,...', 13, 2, 'nguyen_vuong_980473', '2021-07-16 06:17:29'),
(28, 'being funny insset', 7, 2, 'haiyen_vuthi_887749', '2021-07-21 08:35:32'),
(29, 'Go out and play some game', 7, 2, 'ducthanh_trinh_921118', '2021-07-21 08:36:31'),
(33, 'HaHa', 47, 1, 'vi_duong_253938', '2021-07-24 14:54:08'),
(34, 'Fix it then', 47, 1, 'nguyen_vuong_980473', '2021-07-24 14:57:00'),
(35, 'Ew', 46, 2, 'ducthanh_trinh_921118', '2021-07-24 14:57:15'),
(36, 'It is because of you maybe', 54, 17, 'vi_duong_253938', '2021-07-26 09:39:20'),
(38, 'Get a part-time  job which is #wfh', 53, 17, 'nguyen_vuong_980473', '2021-07-26 14:12:32'),
(40, 'because you not workout', 54, 17, 'nguyen_vuong_980473', '2021-07-26 14:15:44'),
(41, '#fat', 54, 17, 'haiyen_vuthi_887749', '2021-07-26 14:15:59'),
(47, 'hello', 53, 2, 'thanh_tran_166700', '2021-07-30 10:06:19'),
(48, 'hi', 53, 2, 'thanh_t_572156', '2021-07-30 10:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `ans_like`
--

CREATE TABLE `ans_like` (
  `ans_like_id` int(11) NOT NULL,
  `user_like` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ans_like`
--

INSERT INTO `ans_like` (`ans_like_id`, `user_like`, `ans_id`) VALUES
(7, 1, 16),
(13, 1, 17),
(14, 1, 11),
(15, 1, 15),
(16, 5, 17),
(17, 1, 14),
(19, 1, 22),
(27, 32, 45);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'Technology'),
(2, 'Economy'),
(3, 'Sport'),
(4, 'Life'),
(5, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `queries` varchar(255) NOT NULL,
  `replies` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatbot`
--

INSERT INTO `chatbot` (`id`, `queries`, `replies`) VALUES
(1, 'Hello', 'Hello there'),
(2, 'How to insert a new post?', 'Well, just follow these steps to insert a post:\r\n1. Go to Home page\r\n2. Type your post content\r\n3. Choose the category\r\n4. Press the Post button'),
(3, 'How to change cover?', 'Well, just follow these steps to change your cover: \r\n1. Go to your profile\r\n2. Press the Change Cover button\r\n3. Choose Select Cover\r\n4. Choose the cover you want to change\r\n5. Choose Update Cover'),
(4, 'How to change avatar?', 'Well, just follow these steps to change your avatar: \r\n1. Go to your profile\r\n2. Press the Select Avatar button\r\n3. Choose the avatar you want to change\r\n4. Choose Update Avatar');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `post_cat` int(11) NOT NULL,
  `hashtag` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `author`, `content`, `post_cat`, `hashtag`, `status`, `post_date`) VALUES
(1, 2, 'What\'s going on with my laptop?', 1, '', 0, '2021-07-01 07:22:14'),
(2, 2, 'Why math is so hard?', 2, '', 0, '2021-07-01 07:24:42'),
(3, 4, 'How to fix this bug', 1, '', 0, '2021-07-02 04:08:29'),
(4, 2, 'Is anybody want to go swimming with me?', 3, '', 0, '2021-07-02 18:22:41'),
(5, 3, 'Love your body, love your self', 4, '', 0, '2021-07-05 05:18:11'),
(6, 3, 'How to create more and more code?', 1, '', 0, '2021-07-06 06:09:49'),
(7, 2, 'How to stop being bored?', 4, '', 0, '2021-07-14 08:45:28'),
(8, 5, 'I need to find some recipe about cooking with egg?', 5, '', 0, '2021-07-14 10:03:38'),
(9, 5, 'How to clean shoes without touching it?', 3, '', 0, '2021-07-14 10:07:40'),
(10, 3, 'Do you guys like Thai food?', 5, '', 0, '2021-07-14 10:10:09'),
(11, 3, 'Why is pizza popular?', 5, '', 0, '2021-07-14 10:11:03'),
(12, 1, 'How to clean shoes clearly?', 4, '', 0, '2021-07-14 16:11:12'),
(13, 2, 'Where I can buy a minion?', 4, '', 0, '2021-07-15 01:39:11'),
(14, 1, 'How does RAM work?', 1, '', 0, '2021-07-15 05:13:07'),
(23, 1, 'My laptop can not start?', 1, '', 1, '2021-07-15 10:13:03'),
(45, 1, 'Hello to all', 2, '', 0, '2021-07-21 13:26:04'),
(46, 2, 'This girl is on fire', 3, '', 0, '2021-07-23 10:16:50'),
(47, 1, 'My #laptop cannot shutdown?', 1, 'laptop', 0, '2021-07-24 06:22:45'),
(48, 1, 'Do you know any home workout app?', 3, '', 0, '2021-07-25 06:44:00'),
(50, 2, 'Yoga for the beginner? #yoga', 4, 'yoga', 0, '2021-07-26 05:41:34'),
(51, 5, 'All my cats very love you #cat', 4, 'cat', 0, '2021-07-26 07:33:51'),
(52, 5, 'All my cats very hate you #cat', 4, 'cat', 0, '2021-07-26 07:37:11'),
(53, 2, 'How to create more money? #cast #money', 2, 'cast,money', 0, '2021-07-26 07:43:19'),
(71, 35, 'hello #abc', 4, 'abc', 0, '2021-07-30 10:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `post_like_id` int(11) NOT NULL,
  `user_like` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`post_like_id`, `user_like`, `post_id`) VALUES
(1, 1, 6),
(2, 1, 4),
(3, 1, 5),
(4, 2, 7),
(5, 1, 25),
(11, 5, 0),
(15, 5, 0),
(16, 5, 0),
(17, 5, 0),
(18, 5, 0),
(19, 5, 0),
(22, 2, 47),
(23, 1, 54),
(25, 5, 54);

-- --------------------------------------------------------

--
-- Table structure for table `post_rate`
--

CREATE TABLE `post_rate` (
  `post_rate_id` int(11) NOT NULL,
  `user_rate` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_rate`
--

INSERT INTO `post_rate` (`post_rate_id`, `user_rate`, `post_id`, `rate`) VALUES
(1, 4, 4, 2),
(2, 1, 5, 2),
(3, 1, 1, 4),
(4, 1, 3, 2),
(5, 1, 6, 5),
(6, 1, 2, 3),
(7, 2, 3, 4),
(8, 2, 6, 5),
(9, 2, 5, 1),
(10, 2, 4, 5),
(11, 5, 7, 3),
(12, 1, 25, 5),
(13, 5, 23, 5),
(26, 0, 53, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE `ranking` (
  `rank_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `scores` int(11) NOT NULL,
  `numpost_thismonth` int(11) NOT NULL,
  `numans_thismonth` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ranking`
--

INSERT INTO `ranking` (`rank_id`, `user_id`, `scores`, `numpost_thismonth`, `numans_thismonth`, `month`, `year`) VALUES
(1, 1, 49, 7, 7, 7, 2021),
(2, 2, 48, 8, 4, 7, 2021),
(3, 3, 30, 4, 7, 7, 2021),
(4, 4, 5, 1, 0, 7, 2021),
(5, 5, 42, 4, 6, 7, 2021),
(9, 6, 5, 1, 0, 7, 2021),
(15, 35, 7, 1, 1, 7, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` bit(2) NOT NULL,
  `rp_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `post_id`, `user_id`, `reason`, `status`, `rp_date`) VALUES
(11, 53, 2, 'spam', b'00', '2021-07-30 10:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `f_name` text NOT NULL,
  `l_name` text NOT NULL,
  `user_name` text NOT NULL,
  `describe_user` varchar(255) NOT NULL,
  `relationship` text NOT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_country` text NOT NULL,
  `user_gender` text NOT NULL,
  `user_birthday` text NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_cover` varchar(255) NOT NULL,
  `user_reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text NOT NULL,
  `recovery_account` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `num_post` int(11) NOT NULL,
  `num_ans` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `pos_status` int(11) NOT NULL,
  `block_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `f_name`, `l_name`, `user_name`, `describe_user`, `relationship`, `user_pass`, `user_email`, `user_country`, `user_gender`, `user_birthday`, `user_image`, `user_cover`, `user_reg_date`, `status`, `recovery_account`, `title`, `num_post`, `num_ans`, `position`, `pos_status`, `block_status`) VALUES
(1, 'Admin', '1', 'admin', 'Hello World! Hear my words.', 'In a relationship', '123456', 'admin@gmail.com', 'Japan', 'Male', '1999-11-10', 'user_pic_4.jpg', 'cover_3.jpg', '2021-06-30 07:34:10', 'verified', 'TP HCM', 'Active', 7, 7, 'Member', 0, 0),
(2, 'Duc Thanh', 'Trinh', 'ducthanh_trinh_921118', 'Hello World! Hear my words.', 'In a relationship', '1234567890', 'ttdtffv@gmail.com', 'Japan', 'Male', '1999-11-10', 'user_pic_4.jpg', 'cover_3.jpg', '2021-06-30 07:34:10', 'verified', 'TP HCM', 'Active', 7, 7, 'Member', 0, 0),
(3, 'Vi', 'Duong', 'vi_duong_253938', 'Hello World! Hear my words.', 'In a relationship', '123456789', 'khanhvi@gmail.com', 'Vietnam', 'Female', '1999-03-24', 'user_pic_3.jpg', 'cover.jpg', '2021-06-30 07:35:10', 'verified', 'An Giang', 'Featured', 8, 4, 'Member', 0, 0),
(4, 'Hai Yen', 'Vu Thi', 'haiyen_vuthi_887749', 'Hello World! Hear my words.', '...', '123456789', 'yen_la_nhat@gmail.com', 'Vietnam', 'Female', '1999-11-11', 'user_pic_2.jpg', 'cover.jpg', '2021-07-02 07:35:49', 'verified', 'UDPT-16', 'Featured', 4, 7, 'Member', 0, 0),
(5, 'Tien Nhi', 'Huynh Ngoc', 'tiennhi_huynhngoc_884918', 'Hello World! Hear my words.', '...', '123456789', 'luctieupi@gmail.com', 'Vietnam', 'Female', '1999-02-22', 'user_pic_5.jpg', 'cover.jpg', '2021-07-02 07:36:21', 'verified', 'UDPT-16', 'Normal', 1, 0, 'Member', 0, 0),
(6, 'Nguyen', 'Vuong', 'nguyen_vuong_980473', 'Hello World! Hear my words.', '...', '123456789', 'roy@gmail.com', 'Vietnam', 'Male', '2000-11-08', 'user_pic_1.jpg', 'cover.jpg', '2021-07-02 07:36:46', 'verified', 'UDPT-16', 'Active', 4, 6, 'Member', 0, 0),
(7, 'Nguyen', 'Tran', 'nguyen_tran_448684', 'Hello World! Hear my words.', '...', '123456789', 'hat@gmail.com', 'Vietnam', 'Male', '1999-11-11', 'user_pic_3.jpg', 'cover.jpg', '2021-07-21 02:24:39', 'verified', 'UDPT-16', 'Normal', 1, 0, 'Member', 0, 0),
(35, 'thi', 'tan', 'thanh_t_572156', 'Hello World! Hear my words.', 'Engaged', '123456789', 'y@gmail.com', 'Vietnam', 'Male', '1999-11-11', 'user_pic_1.jpg.80', 'cover_2.jpg.89', '2021-07-30 10:56:51', 'verified', 'TP HCM', 'Normal', 1, 1, 'Member', 0, 0),
(36, 'Gia Huy', 'Trần', 'gia huy_trần_778218', 'Hello World! Hear my words.', '...', '123456789', 'tdtffc@gmail.com', 'Vietnam', 'Other', '1-1-1999', 'user_pic_4.jpg', 'cover.jpg', '2021-07-30 11:02:47', 'verified', 'UDPT-16', 'Normal', 0, 0, 'Member', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `mes_body` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_messages`
--

INSERT INTO `user_messages` (`id`, `user_from`, `user_to`, `mes_body`, `date`) VALUES
(1, 1, 2, 'hi', '2021-07-29 15:46:05'),
(2, 1, 3, 'hi', '2021-07-30 04:16:53'),
(3, 2, 1, 'hello', '2021-07-30 05:08:29'),
(4, 1, 2, 'chow', '2021-07-30 07:23:20'),
(5, 29, 1, 'hi', '2021-07-30 09:27:45'),
(6, 34, 3, 'hi', '2021-07-30 10:10:20'),
(7, 35, 1, 'hi', '2021-07-30 11:01:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`ans_id`);

--
-- Indexes for table `ans_like`
--
ALTER TABLE `ans_like`
  ADD PRIMARY KEY (`ans_like_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`post_like_id`);

--
-- Indexes for table `post_rate`
--
ALTER TABLE `post_rate`
  ADD PRIMARY KEY (`post_rate_id`);

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `ans_like`
--
ALTER TABLE `ans_like`
  MODIFY `ans_like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `post_like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `post_rate`
--
ALTER TABLE `post_rate`
  MODIFY `post_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ranking`
--
ALTER TABLE `ranking`
  MODIFY `rank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
