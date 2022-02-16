-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2022 at 05:54 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contact`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactm`
--

CREATE TABLE `contactm` (
  `name` text NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `mes` text NOT NULL,
  `sno` int(11) NOT NULL,
  `datet` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactm`
--

INSERT INTO `contactm` (`name`, `phone_no`, `email`, `mes`, `sno`, `datet`) VALUES
('firstp', '8329873', 'first@gmail.com', 'first comment', 1, '2022-01-27 19:58:37'),
('saad ali', '12888987', 'daas3621@gmail.com', 'hi there', 2, '2022-01-27 21:48:08'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hi there\r\n', 3, '2022-01-30 12:56:24'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hi there\r\n', 4, '2022-01-30 12:57:46'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hi there\r\n', 5, '2022-01-30 13:01:51'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hgj', 20, '2022-01-30 13:31:00'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hgj', 21, '2022-01-30 13:37:50'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hgj', 22, '2022-01-30 13:38:01'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'jbkjh', 23, '2022-01-30 13:39:19'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'jbkjh', 24, '2022-01-30 13:42:37'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'jbkjh', 25, '2022-01-30 13:45:08'),
('saad ali', '2425252525', 'daas3621@gmail.com', 'hi\r\n', 26, '2022-01-31 12:19:15'),
('saad ali', '93126609', 'daas3621@gmail.com', 'hey its me finally did it', 27, '2022-01-31 12:20:47'),
('saad ali', '12888987', 'daas3621@gmail.com', 'HI THERE DON\'T BE SUPRISED ITS NORMAL', 28, '2022-01-31 12:26:06'),
('saad ali', '12888987', 'daas3621@gmail.com', 'HI THERE DON\'T BE SUPRISED ITS NORMAL', 29, '2022-01-31 12:26:42'),
('saad ali', '12888987', 'daas3621@gmail.com', 'HI THERE DON\'T BE SUPRISED ITS NORMAL', 30, '2022-01-31 12:27:09'),
('pretty', '646832999', 'pretty3621@gmail.com', 'hi its me pretti at your service\r\n', 31, '2022-01-31 12:31:03'),
('pretty', '646832999', 'pretty3621@gmail.com', 'hi its me pretti at your service\r\n', 32, '2022-01-31 12:31:58'),
('pretty', '646832999', 'pretty3621@gmail.com', 'hi its me pretti at your service\r\n', 33, '2022-01-31 12:33:31'),
('pretty', '12888987', 'pretty3621@gmail.com', 'hi there its pretty at your sevice', 34, '2022-01-31 12:35:05'),
('pretty', '2425252525', 'daas3621@gmail.com', 'KLAJFKL', 35, '2022-01-31 12:38:44'),
('pretty', '2425252525', 'daas3621@gmail.com', 'KLAJFKL', 36, '2022-01-31 12:40:29'),
('pretty', '2425252525', 'daas3621@gmail.com', 'KLAJFKL', 37, '2022-01-31 12:40:35'),
('pretty', '93126609', 'pretty3621@gmail.com', 'HI THERE ITS PRETTY AT YOUR SERVICE', 38, '2022-01-31 12:42:45'),
('pretty', '93126609', 'pretty3621@gmail.com', 'HI THERE ITS PRETTY AT YOUR SERVICE', 39, '2022-01-31 12:43:18'),
('pretty', '93126609', 'pretty3621@gmail.com', 'HI THERE ITS PRETTY AT YOUR SERVICE', 40, '2022-01-31 12:43:54'),
('pretty', '2425252525', 'pretty3621@gmail.com', 'HI THERE ITS PRETTY YOU CAN CALL OR HIT ON ME ANY TIME I WILL BE WAITING FOR YOU', 41, '2022-01-31 12:46:29'),
('pretty', '', '', '', 42, '2022-02-12 20:32:33'),
('sumaiya Ali ', '', '', '', 43, '2022-02-16 19:26:43'),
('sumaiya Ali ', '764537900876', 'sumaiyaali731@gmail.com', 'there are some errors in your blog and it will be helpful if u try to solve it', 44, '2022-02-16 19:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `no` int(30) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`no`, `title`, `slug`, `content`, `img_file`, `date_time`) VALUES
(1, 'new post nothing new daily routine  work only', 'daily routine', 'loved the content he makes ', 'forza.jpg', '2022-02-16 19:30:52'),
(9, 'test post', 'testing', 'wow eee', 'sor4.jpg', '2022-02-15 21:56:57'),
(10, 'nothing new test of alpha 2', 'alpha', 'content nothing man', 'sor4.jpg', '2022-02-15 21:59:55'),
(11, 'aklsjf', 'fas', 'fdas', 'fa', '2022-02-15 22:01:30'),
(12, 'TIME TABLE', 'DHAS', 'MY NAME IS SUMAIYA', 'deathloop.jpg', '2022-02-16 19:32:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactm`
--
ALTER TABLE `contactm`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactm`
--
ALTER TABLE `contactm`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `no` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
