-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-19 14:05:52
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bool_ddd`
--

-- --------------------------------------------------------

--
-- 表的结构 `atts`
--

CREATE TABLE `atts` (
  `aid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` enum('男','女') COLLATE utf8_unicode_ci NOT NULL,
  `salary` tinyint(4) NOT NULL,
  `jobcity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `udesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `atts`
--

INSERT INTO `atts` (`aid`, `uid`, `pid`, `title`, `realname`, `age`, `gender`, `salary`, `jobcity`, `udesc`) VALUES
(1, 3, 1, '', '李昕', 0, '男', 0, '', 'renasda '),
(2, 3, 2, '', '李兴部', 0, '男', 0, '', '很好 通过'),
(3, 3, 3, '', '李四', 0, '', 0, '', '不通过'),
(4, 3, 4, '', 'dasdasd', 0, '男', 0, '', 'edawe'),
(5, 1, 5, '', '李兴部', 0, '男', 0, '', '可以通过'),
(6, 3, 6, '', '', 0, '男', 0, '', ''),
(7, 3, 7, '', '', 15, '男', 0, '', ''),
(8, 3, 8, '', '', 0, '男', 0, '', ''),
(9, 3, 9, '', '', 0, '男', 0, '', ''),
(10, 3, 10, '', '', 15, '男', 0, '', ''),
(11, 3, 11, '', '', 15, '男', 0, '', ''),
(12, 3, 12, '', '', 15, '男', 0, '', ''),
(13, 3, 13, '', '', 15, '男', 0, '', ''),
(14, 3, 14, '', '', 40, '男', 0, '', ''),
(15, 3, 15, '', '', 15, '男', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `bids`
--

CREATE TABLE `bids` (
  `bid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `money` int(11) NOT NULL,
  `pubtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `bids`
--

INSERT INTO `bids` (`bid`, `uid`, `pid`, `title`, `money`, `pubtime`) VALUES
(1, 3, 1, '购买军火', 24000000, 1496502152),
(2, 3, 1, '购买军火', 26000000, 1496502223),
(3, 3, 2, '升学基金', 1000000, 1496502314),
(4, 3, 2, '升学基金', 49000000, 1496502324),
(5, 3, 4, '充钱玩游戏', 4000000, 1496502746),
(6, 3, 1, '购买军火', 1000000, 1496554667),
(7, 3, 1, '购买军火', 49000000, 1496554814),
(8, 1, 5, '好好学习', 99900, 1496555006),
(9, 1, 5, '好好学习', 999900000, 1496555107),
(10, 3, 2, '升学基金', 5000000, 1496569775),
(11, 3, 4, '充钱玩游戏', 2000000, 1496569787);

-- --------------------------------------------------------

--
-- 表的结构 `grows`
--

CREATE TABLE `grows` (
  `gid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `paytime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `grows`
--

INSERT INTO `grows` (`gid`, `uid`, `pid`, `title`, `amount`, `paytime`) VALUES
(1, 3, 4, '充钱玩游戏', 658, '2017-06-04'),
(2, 3, 1, '购买军火', 6575, '2017-06-04'),
(3, 3, 1, '购买军火', 7123, '2017-06-04'),
(4, 3, 1, '购买军火', 274, '2017-06-04'),
(5, 3, 1, '购买军火', 13425, '2017-06-04'),
(6, 1, 5, '好好学习', 41, '2017-06-04'),
(7, 1, 5, '好好学习', 410918, '2017-06-04'),
(8, 3, 4, '充钱玩游戏', 658, '2017-06-06'),
(9, 3, 1, '购买军火', 6575, '2017-06-06'),
(10, 3, 1, '购买军火', 7123, '2017-06-06'),
(11, 3, 1, '购买军火', 274, '2017-06-06'),
(12, 3, 1, '购买军火', 13425, '2017-06-06'),
(13, 1, 5, '好好学习', 41, '2017-06-06'),
(14, 1, 5, '好好学习', 410918, '2017-06-06'),
(15, 3, 4, '充钱玩游戏', 658, '2017-06-06'),
(16, 3, 1, '购买军火', 6575, '2017-06-06'),
(17, 3, 1, '购买军火', 7123, '2017-06-06'),
(18, 3, 1, '购买军火', 274, '2017-06-06'),
(19, 3, 1, '购买军火', 13425, '2017-06-06'),
(20, 1, 5, '好好学习', 41, '2017-06-06'),
(21, 1, 5, '好好学习', 410918, '2017-06-06'),
(22, 3, 4, '充钱玩游戏', 658, '2017-06-06'),
(23, 3, 1, '购买军火', 6575, '2017-06-06'),
(24, 3, 1, '购买军火', 7123, '2017-06-06'),
(25, 3, 1, '购买军火', 274, '2017-06-06'),
(26, 3, 1, '购买军火', 13425, '2017-06-06'),
(27, 1, 5, '好好学习', 41, '2017-06-06'),
(28, 1, 5, '好好学习', 410918, '2017-06-06'),
(29, 3, 4, '充钱玩游戏', 658, '2017-06-06'),
(30, 3, 1, '购买军火', 6575, '2017-06-06'),
(31, 3, 1, '购买军火', 7123, '2017-06-06'),
(32, 3, 1, '购买军火', 274, '2017-06-06'),
(33, 3, 1, '购买军火', 13425, '2017-06-06'),
(34, 1, 5, '好好学习', 41, '2017-06-06'),
(35, 1, 5, '好好学习', 410918, '2017-06-06'),
(36, 3, 4, '充钱玩游戏', 658, '2017-06-06'),
(37, 3, 1, '购买军火', 6575, '2017-06-06'),
(38, 3, 1, '购买军火', 7123, '2017-06-06'),
(39, 3, 1, '购买军火', 274, '2017-06-06'),
(40, 3, 1, '购买军火', 13425, '2017-06-06'),
(41, 1, 5, '好好学习', 41, '2017-06-06'),
(42, 1, 5, '好好学习', 410918, '2017-06-06'),
(43, 3, 4, '充钱玩游戏', 658, '2017-06-06'),
(44, 3, 1, '购买军火', 6575, '2017-06-06'),
(45, 3, 1, '购买军火', 7123, '2017-06-06'),
(46, 3, 1, '购买军火', 274, '2017-06-06'),
(47, 3, 1, '购买军火', 13425, '2017-06-06'),
(48, 1, 5, '好好学习', 41, '2017-06-06'),
(49, 1, 5, '好好学习', 410918, '2017-06-06');

-- --------------------------------------------------------

--
-- 表的结构 `hks`
--

CREATE TABLE `hks` (
  `hid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `paydate` date NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `hks`
--

INSERT INTO `hks` (`hid`, `uid`, `pid`, `title`, `amount`, `paydate`, `status`) VALUES
(1, 3, 1, '购买军火', 5972222, '2017-07-03', 0),
(2, 3, 1, '购买军火', 5972222, '2017-08-03', 0),
(3, 3, 1, '购买军火', 5972222, '2017-09-03', 0),
(4, 3, 1, '购买军火', 5972222, '2017-10-03', 0),
(5, 3, 1, '购买军火', 5972222, '2017-11-03', 0),
(6, 3, 1, '购买军火', 5972222, '2017-12-03', 0),
(7, 3, 1, '购买军火', 5972222, '2018-01-03', 0),
(8, 3, 1, '购买军火', 5972222, '2018-02-03', 0),
(9, 3, 1, '购买军火', 5972222, '2018-03-03', 0),
(10, 3, 2, '升学基金', 4666667, '2017-07-03', 0),
(11, 3, 2, '升学基金', 4666667, '2017-08-03', 0),
(12, 3, 2, '升学基金', 4666667, '2017-09-03', 0),
(13, 3, 2, '升学基金', 4666667, '2017-10-03', 0),
(14, 3, 2, '升学基金', 4666667, '2017-11-03', 0),
(15, 3, 2, '升学基金', 4666667, '2017-12-03', 0),
(16, 3, 2, '升学基金', 4666667, '2018-01-03', 0),
(17, 3, 2, '升学基金', 4666667, '2018-02-03', 0),
(18, 3, 2, '升学基金', 4666667, '2018-03-03', 0),
(19, 3, 2, '升学基金', 4666667, '2018-04-03', 0),
(20, 3, 2, '升学基金', 4666667, '2018-05-03', 0),
(21, 3, 2, '升学基金', 4666667, '2018-06-03', 0),
(22, 3, 1, '购买军火', 5972222, '2017-07-03', 0),
(23, 3, 1, '购买军火', 5972222, '2017-08-03', 0),
(24, 3, 1, '购买军火', 5972222, '2017-09-03', 0),
(25, 3, 1, '购买军火', 5972222, '2017-10-03', 0),
(26, 3, 1, '购买军火', 5972222, '2017-11-03', 0),
(27, 3, 1, '购买军火', 5972222, '2017-12-03', 0),
(28, 3, 1, '购买军火', 5972222, '2018-01-03', 0),
(29, 3, 1, '购买军火', 5972222, '2018-02-03', 0),
(30, 3, 1, '购买军火', 5972222, '2018-03-03', 0),
(31, 3, 2, '升学基金', 4666667, '2017-07-03', 0),
(32, 3, 2, '升学基金', 4666667, '2017-08-03', 0),
(33, 3, 2, '升学基金', 4666667, '2017-09-03', 0),
(34, 3, 2, '升学基金', 4666667, '2017-10-03', 0),
(35, 3, 2, '升学基金', 4666667, '2017-11-03', 0),
(36, 3, 2, '升学基金', 4666667, '2017-12-03', 0),
(37, 3, 2, '升学基金', 4666667, '2018-01-03', 0),
(38, 3, 2, '升学基金', 4666667, '2018-02-03', 0),
(39, 3, 2, '升学基金', 4666667, '2018-03-03', 0),
(40, 3, 2, '升学基金', 4666667, '2018-04-03', 0),
(41, 3, 2, '升学基金', 4666667, '2018-05-03', 0),
(42, 3, 2, '升学基金', 4666667, '2018-06-03', 0),
(43, 3, 4, '充钱玩游戏', 1353333, '2017-07-03', 0),
(44, 3, 4, '充钱玩游戏', 1353333, '2017-08-03', 0),
(45, 3, 4, '充钱玩游戏', 1353333, '2017-09-03', 0),
(46, 3, 1, '购买军火', 5972222, '2017-07-04', 0),
(47, 3, 1, '购买军火', 5972222, '2017-08-04', 0),
(48, 3, 1, '购买军火', 5972222, '2017-09-04', 0),
(49, 3, 1, '购买军火', 5972222, '2017-10-04', 0),
(50, 3, 1, '购买军火', 5972222, '2017-11-04', 0),
(51, 3, 1, '购买军火', 5972222, '2017-12-04', 0),
(52, 3, 1, '购买军火', 5972222, '2018-01-04', 0),
(53, 3, 1, '购买军火', 5972222, '2018-02-04', 0),
(54, 3, 1, '购买军火', 5972222, '2018-03-04', 0),
(55, 1, 5, '好好学习', 40277774, '2017-07-04', 0),
(56, 1, 5, '好好学习', 40277774, '2017-08-04', 0),
(57, 1, 5, '好好学习', 40277774, '2017-09-04', 0),
(58, 1, 5, '好好学习', 40277774, '2017-10-04', 0),
(59, 1, 5, '好好学习', 40277774, '2017-11-04', 0),
(60, 1, 5, '好好学习', 40277774, '2017-12-04', 0),
(61, 1, 5, '好好学习', 40277774, '2018-01-04', 0),
(62, 1, 5, '好好学习', 40277774, '2018-02-04', 0),
(63, 1, 5, '好好学习', 40277774, '2018-03-04', 0),
(64, 1, 5, '好好学习', 40277774, '2018-04-04', 0),
(65, 1, 5, '好好学习', 40277774, '2018-05-04', 0),
(66, 1, 5, '好好学习', 40277774, '2018-06-04', 0),
(67, 1, 5, '好好学习', 40277774, '2018-07-04', 0),
(68, 1, 5, '好好学习', 40277774, '2018-08-04', 0),
(69, 1, 5, '好好学习', 40277774, '2018-09-04', 0),
(70, 1, 5, '好好学习', 40277774, '2018-10-04', 0),
(71, 1, 5, '好好学习', 40277774, '2018-11-04', 0),
(72, 1, 5, '好好学习', 40277774, '2018-12-04', 0),
(73, 1, 5, '好好学习', 40277774, '2019-01-04', 0),
(74, 1, 5, '好好学习', 40277774, '2019-02-04', 0),
(75, 1, 5, '好好学习', 40277774, '2019-03-04', 0),
(76, 1, 5, '好好学习', 40277774, '2019-04-04', 0),
(77, 1, 5, '好好学习', 40277774, '2019-05-04', 0),
(78, 1, 5, '好好学习', 40277774, '2019-06-04', 0),
(79, 1, 5, '好好学习', 40277774, '2019-07-04', 0),
(80, 1, 5, '好好学习', 40277774, '2019-08-04', 0),
(81, 1, 5, '好好学习', 40277774, '2019-09-04', 0),
(82, 1, 5, '好好学习', 40277774, '2019-10-04', 0),
(83, 1, 5, '好好学习', 40277774, '2019-11-04', 0),
(84, 1, 5, '好好学习', 40277774, '2019-12-04', 0),
(85, 1, 5, '好好学习', 40277774, '2020-01-04', 0),
(86, 1, 5, '好好学习', 40277774, '2020-02-04', 0),
(87, 1, 5, '好好学习', 40277774, '2020-03-04', 0),
(88, 1, 5, '好好学习', 40277774, '2020-04-04', 0),
(89, 1, 5, '好好学习', 40277774, '2020-05-04', 0),
(90, 1, 5, '好好学习', 40277774, '2020-06-04', 0);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_06_03_072721_create_users_table', 2),
('2017_06_03_083922_create_projects_table', 3),
('2017_06_03_084938_create_atts_table', 4),
('2017_06_03_213636_create_bids_table', 5),
('2017_06_03_221734_create_hks_table', 6),
('2017_06_03_223859_create_tasks_table', 7),
('2017_06_04_134851_create_grous_tables', 8),
('2017_06_04_141244_create_grows_tables', 9);

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `projects`
--

CREATE TABLE `projects` (
  `pid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `money` int(11) NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `hrange` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `recive` int(11) NOT NULL,
  `pubtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `projects`
--

INSERT INTO `projects` (`pid`, `uid`, `name`, `money`, `mobile`, `title`, `rate`, `hrange`, `status`, `recive`, `pubtime`) VALUES
(1, 3, 'test', 50000000, '18660305442', '购买军火', 10, 9, 2, 50000000, 1496492024),
(2, 3, 'test', 50000000, '18660305442', '升学基金', 12, 12, 1, 5000000, 0),
(3, 3, 'test', 10000000, '13220463312', '充钱玩游戏', 8, 6, -1, 0, 1496492040),
(4, 3, 'test', 4000000, '11333333333', '充钱玩游戏', 6, 3, 1, 2000000, 1496492052),
(5, 1, '李兴部', 999999900, '11333333333', '好好学习', 15, 36, 2, 999999900, 1496554930),
(10, 3, 'test', 90000000, '18660305442', '', 0, 0, 0, 0, 1496722100),
(12, 3, 'test', 99999900, '13220463312', '', 0, 0, 0, 0, 1496727965),
(13, 3, 'test', 999900, '13884753866', '', 0, 0, 0, 0, 1496749295),
(14, 3, 'test', 999900, '13884753866', '', 0, 0, 0, 0, 1496750141),
(15, 3, 'test', 999900, '18660305442', '', 0, 0, 0, 0, 1496757234);

-- --------------------------------------------------------

--
-- 表的结构 `tasks`
--

CREATE TABLE `tasks` (
  `tid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `enddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tasks`
--

INSERT INTO `tasks` (`tid`, `uid`, `pid`, `title`, `amount`, `enddate`) VALUES
(1, 3, 4, '充钱玩游戏', 658, '2017-09-03'),
(2, 3, 1, '购买军火', 6575, '2018-03-04'),
(3, 3, 1, '购买军火', 7123, '2018-03-04'),
(4, 3, 1, '购买军火', 274, '2018-03-04'),
(5, 3, 1, '购买军火', 13425, '2018-03-04'),
(6, 1, 5, '好好学习', 41, '2020-06-04'),
(7, 1, 5, '好好学习', 410918, '2020-06-04');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regtime` int(11) NOT NULL,
  `lastlogin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`uid`, `name`, `email`, `mobile`, `password`, `remember_token`, `regtime`, `lastlogin`) VALUES
(1, '李兴部', '13220462381@qq.com', '', '$2y$10$gvh6HV5rvsaD9ujC02jRxu8.Zg7ApCCIW5LiFtA1df9SMA67ulYgi', 'odJ4sc2nwC3qD0WRERSYlPj0iUSjXfr4TooMPR2uMNFyVXqFXEKfnWz5U7cp', 0, 0),
(2, 'lixin', '18518179834@qq.com', '18518179834', '$2y$10$NSnXNghJvkOtyAo/cxubYu8p4kUDH2MnFZLyf3RRT24jqP6VKEbz6', NULL, 0, 0),
(3, 'test', '13220463412@qq.com', '13220463312', '$2y$10$FsQMrMi1cClUXnNK4H3T3.RgjN/GQ1mgc413yeN7k7K63r8JPaKWK', 'ygSF0jO8rMzrOC7MpU2EsskhsvDfW9rvAYbXPlErATvs9J09YrBVZYYaY3s4', 0, 0),
(18, '高兴萌', '781141036@qq.com', '18660305442', '$2y$10$zXx7cmcnhRi4z6scUwOb6uip8ku0aWU6syDtHCU4vR4P4awQ3783.', '7XKEtQmDURJ1C9q4267EpJ1UufKGkMI8O50sEW097cBizsgdJd9Ds67zGNPp', 0, 0),
(20, '李兴部', '1322046331@qq.com', '18660305442', '$2y$10$QunPC5KA5Lr06X5424L7Zuc1p7.0MvJn3I0UyqZxjIXkSIwe5vIGK', NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atts`
--
ALTER TABLE `atts`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `grows`
--
ALTER TABLE `grows`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `hks`
--
ALTER TABLE `hks`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `atts`
--
ALTER TABLE `atts`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `bids`
--
ALTER TABLE `bids`
  MODIFY `bid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `grows`
--
ALTER TABLE `grows`
  MODIFY `gid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- 使用表AUTO_INCREMENT `hks`
--
ALTER TABLE `hks`
  MODIFY `hid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- 使用表AUTO_INCREMENT `projects`
--
ALTER TABLE `projects`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `tasks`
--
ALTER TABLE `tasks`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
