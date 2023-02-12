-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 12, 2023 at 09:20 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internations`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220420135640', '2023-02-10 12:04:33', 192),
('DoctrineMigrations\\Version20230210091251', '2023-02-10 11:15:22', 129),
('DoctrineMigrations\\Version20230210093227', '2023-02-10 11:15:23', 128),
('DoctrineMigrations\\Version20230210114008', '2023-02-10 11:40:14', 40),
('DoctrineMigrations\\Version20230210114051', '2023-02-10 11:41:14', 258),
('DoctrineMigrations\\Version20230210114642', '2023-02-10 11:46:47', 39),
('DoctrineMigrations\\Version20230210114740', '2023-02-10 11:47:44', 28),
('DoctrineMigrations\\Version20230210114819', '2023-02-10 11:48:23', 35),
('DoctrineMigrations\\Version20230210122329', '2023-02-10 12:23:40', 319),
('DoctrineMigrations\\Version20230210125206', '2023-02-10 12:52:12', 41),
('DoctrineMigrations\\Version20230210125322', '2023-02-10 12:53:26', 36),
('DoctrineMigrations\\Version20230210132139', '2023-02-10 13:21:50', 41),
('DoctrineMigrations\\Version20230210132143', '2023-02-10 13:21:50', 146),
('DoctrineMigrations\\Version20230210173302', '2023-02-10 17:34:07', 171),
('DoctrineMigrations\\Version20230210212651', '2023-02-10 21:27:13', 65),
('DoctrineMigrations\\Version20230211091224', '2023-02-11 09:13:24', 192);

-- --------------------------------------------------------

--
-- Table structure for table `interest_group`
--

CREATE TABLE `interest_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interest_group`
--

INSERT INTO `interest_group` (`id`, `name`) VALUES
(5, 'GROUP 1'),
(6, 'GROUP 2'),
(7, 'GROUP 3');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

CREATE TABLE `participation` (
  `id` int(11) NOT NULL,
  `interest_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participation`
--

INSERT INTO `participation` (`id`, `interest_group_id`, `user_id`) VALUES
(4, 5, 8),
(5, 6, 9),
(6, 7, 10),
(7, 6, 10),
(8, 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `roles`, `password`) VALUES
(8, 'kostas', '[\"ROLE_USER\"]', '$2y$13$yshMNQxN./OBU9msmbcm6ujXzEhi5mLfOHE0HJm1TLanirr5SSNhu'),
(9, 'boss', '[\"ROLE_ADMIN\"]', '$2y$13$yshMNQxN./OBU9msmbcm6ujXzEhi5mLfOHE0HJm1TLanirr5SSNhu'),
(10, 'nick', '[\"ROLE_USER\"]', '$2y$13$yshMNQxN./OBU9msmbcm6ujXzEhi5mLfOHE0HJm1TLanirr5SSNhu'),
(11, 'test', '[\"ROLE_USER\"]', '$2y$13$yshMNQxN./OBU9msmbcm6ujXzEhi5mLfOHE0HJm1TLanirr5SSNhu');

-- --------------------------------------------------------

--
-- Table structure for table `—regenerate`
--

CREATE TABLE `—regenerate` (
  `id` int(11) NOT NULL,
  `user_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `interest_group`
--
ALTER TABLE `interest_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AB55E24F82874C87` (`interest_group_id`),
  ADD KEY `IDX_AB55E24FA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D6495E237E06` (`name`);

--
-- Indexes for table `—regenerate`
--
ALTER TABLE `—regenerate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interest_group`
--
ALTER TABLE `interest_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participation`
--
ALTER TABLE `participation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `—regenerate`
--
ALTER TABLE `—regenerate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `FK_AB55E24F82874C87` FOREIGN KEY (`interest_group_id`) REFERENCES `interest_group` (`id`),
  ADD CONSTRAINT `FK_AB55E24FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
