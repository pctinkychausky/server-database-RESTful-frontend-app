-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2022 at 06:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_spark`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocked`
--

CREATE TABLE `blocked` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(1, 'Female'),
(2, 'Male'),
(3, 'Intersex'),
(4, 'Transgender'),
(5, 'Non-binary');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_login`
--

CREATE TABLE `log_login` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'id from the users table',
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `somkers` tinyint(4) NOT NULL DEFAULT 0,
  `accepted_distance` smallint(6) NOT NULL,
  `kids_accepted` tinyint(4) NOT NULL COMMENT '0=not sure 1=don''t want parents 2=parnets ok',
  `lifestyle_marriage` tinyint(4) NOT NULL COMMENT '0=no marriage 1=yes marriage',
  `lifestyle_casual` tinyint(4) NOT NULL COMMENT '0=no casual 1=yes casual',
  `lifestyle_open_to_kids` tinyint(4) NOT NULL COMMENT '0=don''t want 1=not sure 2=open 3=want'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `religions`
--

INSERT INTO `religions` (`id`, `name`) VALUES
(1, 'Prefer not to say'),
(2, 'African Traditional'),
(3, 'Agnostic'),
(4, 'Atheist'),
(5, 'Buddhism'),
(6, 'Chinese Traditional'),
(7, 'Christianity'),
(8, 'Hinduism'),
(9, 'Islam'),
(10, 'Judaism'),
(11, 'Sikhism'),
(12, 'Spiritism'),
(13, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `seen`
--

CREATE TABLE `seen` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'user ID',
  `email` varchar(331) NOT NULL,
  `password` varchar(32) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '0=admin 1=moderator 2=customer',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'is user suspended. 0=suspended',
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date of creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `status`, `entry_date`) VALUES
(1, 'a@b.c', '', 2, 1, '2022-08-24 15:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_ages`
--

CREATE TABLE `users_preferences_ages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `min_age` tinyint(4) NOT NULL,
  `max_age` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_genders`
--

CREATE TABLE `users_preferences_genders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender_id` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_heights`
--

CREATE TABLE `users_preferences_heights` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `min_height` tinyint(4) NOT NULL,
  `max_height` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_religions`
--

CREATE TABLE `users_preferences_religions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `religion_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_preferences_religions`
--

INSERT INTO `users_preferences_religions` (`id`, `user_id`, `religion_id`) VALUES
(1, 1, 3),
(2, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `DOB` date NOT NULL,
  `location_town` varchar(32) NOT NULL,
  `location_postcode` varchar(8) NOT NULL,
  `location_longitude` varchar(12) NOT NULL,
  `location_latitude` varchar(12) NOT NULL,
  `religion` tinyint(4) NOT NULL,
  `height` tinyint(4) NOT NULL,
  `kids` tinyint(4) NOT NULL COMMENT '0=not saying 1=no 2=yes',
  `gender` tinyint(4) NOT NULL COMMENT '0=female 1=male 2=non-binary 3=trans 4=inter sex',
  `smoker` tinyint(4) NOT NULL COMMENT '0=prefer not to say 1=no 2=sometimes 3=yes',
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `selife` varchar(128) NOT NULL COMMENT 'URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocked`
--
ALTER TABLE `blocked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seen`
--
ALTER TABLE `seen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_preferences_ages`
--
ALTER TABLE `users_preferences_ages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_preferences_genders`
--
ALTER TABLE `users_preferences_genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_preferences_heights`
--
ALTER TABLE `users_preferences_heights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_preferences_religions`
--
ALTER TABLE `users_preferences_religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocked`
--
ALTER TABLE `blocked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `seen`
--
ALTER TABLE `seen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_preferences_ages`
--
ALTER TABLE `users_preferences_ages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_preferences_genders`
--
ALTER TABLE `users_preferences_genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_preferences_heights`
--
ALTER TABLE `users_preferences_heights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_preferences_religions`
--
ALTER TABLE `users_preferences_religions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
