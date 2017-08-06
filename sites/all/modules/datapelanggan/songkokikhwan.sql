
-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2016 at 09:34 PM
-- Server version: 5.5.16
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `songkokikhwan`
--

-- --------------------------------------------------------

--
-- Table structure for table `carabayar`
--

CREATE TABLE `carabayar` (
  `carabayar` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carabayar`
--

INSERT INTO `carabayar` (`carabayar`) VALUES
('TUNAI'),
('GIRO'),
('HUTANG'),
('DEPOSIT'),
('DEBIT');

-- --------------------------------------------------------

--
-- Table structure for table `carabayartitipanlaundry`
--

CREATE TABLE `carabayartitipanlaundry` (
  `carabayar` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carabayartitipanlaundry`
--

INSERT INTO `carabayartitipanlaundry` (`carabayar`) VALUES
('TUNAI'),
('GIRO'),
('KEMUDIAN'),
('DEBIT');

-- --------------------------------------------------------

--
-- Table structure for table `carareturn`
--

CREATE TABLE `carareturn` (
  `id` int(11) NOT NULL,
  `carareturn` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carareturn`
--

INSERT INTO `carareturn` (`id`, `carareturn`) VALUES
(1, 'TUKAR BARANG'),
(2, 'POTONG HUTANG'),
(3, 'KEMBALI UANG');

-- --------------------------------------------------------

--
-- Table structure for table `cms_access`
--

CREATE TABLE `cms_access` (
  `aid` int(11) NOT NULL,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_actions`
--

CREATE TABLE `cms_actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_actions`
--

INSERT INTO `cms_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish post'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page'),
('node_save_action', 'node', 'node_save_action', '', 'Save post'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user'),
('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user'),
('imagecache_flush_action', 'node', 'imagecache_flush_action', '', 'ImageCache: Flush ALL presets for this node\'s filefield images'),
('imagecache_generate_all_action', 'node', 'imagecache_generate_all_action', '', 'ImageCache: Generate ALL presets for this node\'s filefield images');

-- --------------------------------------------------------

--
-- Table structure for table `cms_actions_aid`
--

CREATE TABLE `cms_actions_aid` (
  `aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_authmap`
--

CREATE TABLE `cms_authmap` (
  `aid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_batch`
--

CREATE TABLE `cms_batch` (
  `bid` int(10) UNSIGNED NOT NULL,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_blocks`
--

CREATE TABLE `cms_blocks` (
  `bid` int(11) NOT NULL,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_blocks`
--

INSERT INTO `cms_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES
(1, 'user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1),
(2, 'user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1),
(3, 'system', '0', 'garland', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(4, 'system', '0', 'adaptivetheme', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(5, 'user', '0', 'adaptivetheme', 1, 0, 'left', 0, 0, 0, '', '', -1),
(6, 'user', '1', 'adaptivetheme', 1, 0, 'left', 0, 0, 0, '', '', -1),
(7, 'system', '0', 'adaptivetheme_admin', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(8, 'user', '0', 'adaptivetheme_admin', 1, 0, 'left', 0, 0, 0, '', '', -1),
(9, 'user', '1', 'adaptivetheme_admin', 1, 0, 'left', 0, 0, 0, '', '', -1),
(10, 'system', '0', 'adaptivetheme_subtheme', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(11, 'user', '0', 'adaptivetheme_subtheme', 1, 0, 'left', 0, 0, 0, '', '', -1),
(12, 'user', '1', 'adaptivetheme_subtheme', 1, 0, 'left', 0, 0, 0, '', '', -1),
(13, 'system', '0', 'globalpos', 0, -5, '', 0, 0, 0, '', '', -1),
(14, 'user', '0', 'globalpos', 0, 0, '', 0, 0, 0, '', '', -1),
(15, 'user', '1', 'globalpos', 0, -5, '', 0, 0, 0, '', '', -1),
(16, 'comment', '0', 'globalpos', 0, -3, '', 0, 0, 0, '', '', 1),
(17, 'menu', 'primary-links', 'globalpos', 0, -4, '', 0, 0, 0, '', '', -1),
(18, 'menu', 'secondary-links', 'globalpos', 0, -2, '', 0, 0, 0, '', '', -1),
(19, 'node', '0', 'globalpos', 0, -1, '', 0, 0, 0, '', '', -1),
(20, 'user', '2', 'globalpos', 0, 1, '', 0, 0, 0, '', '', 1),
(21, 'user', '3', 'globalpos', 0, 2, '', 0, 0, 0, '', '', -1),
(22, 'system', '0', 'rubik', 0, -5, 'left', 0, 0, 0, '', '', -1),
(23, 'user', '1', 'rubik', 0, -5, 'left', 0, 0, 0, '', '', -1),
(24, 'menu', 'primary-links', 'rubik', 0, -4, 'left', 0, 0, 0, '', '', -1),
(25, 'comment', '0', 'rubik', 0, -3, 'left', 0, 0, 0, '', '', 1),
(26, 'menu', 'secondary-links', 'rubik', 0, -2, 'left', 0, 0, 0, '', '', -1),
(27, 'node', '0', 'rubik', 0, -1, 'left', 0, 0, 0, '', '', -1),
(28, 'user', '0', 'rubik', 0, 0, 'left', 0, 0, 0, '', '', -1),
(29, 'user', '2', 'rubik', 0, 1, 'left', 0, 0, 0, '', '', 1),
(30, 'user', '3', 'rubik', 0, 2, 'left', 0, 0, 0, '', '', -1),
(31, 'comment', '0', 'tao', 0, -3, 'left', 0, 0, 0, '', '', 1),
(32, 'menu', 'primary-links', 'tao', 0, -4, 'left', 0, 0, 0, '', '', -1),
(33, 'menu', 'secondary-links', 'tao', 0, -2, 'left', 0, 0, 0, '', '', -1),
(34, 'node', '0', 'tao', 0, -1, 'left', 0, 0, 0, '', '', -1),
(35, 'system', '0', 'tao', 0, -5, 'left', 0, 0, 0, '', '', -1),
(36, 'user', '0', 'tao', 0, 0, 'left', 0, 0, 0, '', '', -1),
(37, 'user', '1', 'tao', 0, -5, 'left', 0, 0, 0, '', '', -1),
(38, 'user', '2', 'tao', 0, 1, 'left', 0, 0, 0, '', '', 1),
(39, 'user', '3', 'tao', 0, 2, 'left', 0, 0, 0, '', '', -1),
(40, 'comment', '0', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', 1),
(41, 'menu', 'primary-links', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', -1),
(42, 'menu', 'secondary-links', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', -1),
(43, 'node', '0', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', -1),
(44, 'user', '2', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', 1),
(45, 'user', '3', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', -1),
(46, 'comment', '0', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', 1),
(47, 'menu', 'primary-links', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', -1),
(48, 'menu', 'secondary-links', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', -1),
(49, 'node', '0', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', -1),
(50, 'user', '2', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', 1),
(51, 'user', '3', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', -1),
(52, 'comment', '0', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', 1),
(53, 'menu', 'primary-links', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', -1),
(54, 'menu', 'secondary-links', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', -1),
(55, 'node', '0', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', -1),
(56, 'user', '2', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', 1),
(57, 'user', '3', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', -1),
(58, 'comment', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(59, 'menu', 'primary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(60, 'menu', 'secondary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(61, 'node', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(62, 'user', '2', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(63, 'user', '3', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(64, 'comment', '0', 'cti_flex', 0, -3, 'sidebar_first', 0, 0, 0, '', '', 1),
(65, 'menu', 'primary-links', 'cti_flex', 0, -4, 'sidebar_first', 0, 0, 0, '', '', -1),
(66, 'menu', 'secondary-links', 'cti_flex', 0, -2, 'sidebar_first', 0, 0, 0, '', '', -1),
(67, 'node', '0', 'cti_flex', 0, -1, 'sidebar_first', 0, 0, 0, '', '', -1),
(68, 'system', '0', 'cti_flex', 0, -5, 'sidebar_first', 0, 0, 0, '', '', -1),
(69, 'user', '0', 'cti_flex', 0, 0, 'sidebar_first', 0, 0, 0, '', '', -1),
(70, 'user', '1', 'cti_flex', 0, -5, 'sidebar_first', 0, 0, 0, '', '', -1),
(71, 'user', '2', 'cti_flex', 0, 1, 'sidebar_first', 0, 0, 0, '', '', 1),
(72, 'user', '3', 'cti_flex', 0, 2, 'sidebar_first', 0, 0, 0, '', '', -1),
(73, 'menu', 'devel', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', -1),
(74, 'devel_node_access', '0', 'adaptivetheme', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(75, 'devel_node_access', '1', 'adaptivetheme', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(76, 'image_attach', '0', 'adaptivetheme', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(77, 'image', '0', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', 1),
(78, 'image', '1', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', 1),
(79, 'devel', '0', 'adaptivetheme', 0, 0, '', 0, 0, 0, '', '', 1),
(80, 'devel', '2', 'adaptivetheme', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(81, 'menu', 'devel', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', -1),
(82, 'devel_node_access', '0', 'adaptivetheme_admin', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(83, 'devel_node_access', '1', 'adaptivetheme_admin', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(84, 'image_attach', '0', 'adaptivetheme_admin', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(85, 'image', '0', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', 1),
(86, 'image', '1', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', 1),
(87, 'devel', '0', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, '', '', 1),
(88, 'devel', '2', 'adaptivetheme_admin', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(89, 'menu', 'devel', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', -1),
(90, 'devel_node_access', '0', 'adaptivetheme_subtheme', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(91, 'devel_node_access', '1', 'adaptivetheme_subtheme', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(92, 'image_attach', '0', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(93, 'image', '0', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', 1),
(94, 'image', '1', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', 1),
(95, 'devel', '0', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, '', '', 1),
(96, 'devel', '2', 'adaptivetheme_subtheme', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(97, 'menu', 'devel', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', -1),
(98, 'devel_node_access', '0', 'cti_flex', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(99, 'devel_node_access', '1', 'cti_flex', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(100, 'image_attach', '0', 'cti_flex', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(101, 'image', '0', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 1),
(102, 'image', '1', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 1),
(103, 'devel', '0', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 1),
(104, 'devel', '2', 'cti_flex', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(105, 'menu', 'devel', 'globalpos', 0, 0, '', 0, 0, 0, '', '', -1),
(106, 'devel_node_access', '0', 'globalpos', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(107, 'devel_node_access', '1', 'globalpos', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(108, 'image_attach', '0', 'globalpos', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(109, 'image', '0', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 1),
(110, 'image', '1', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 1),
(111, 'devel', '0', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 1),
(112, 'devel', '2', 'globalpos', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(113, 'menu', 'devel', 'rubik', 0, 0, '', 0, 0, 0, '', '', -1),
(114, 'devel_node_access', '0', 'rubik', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(115, 'devel_node_access', '1', 'rubik', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(116, 'image_attach', '0', 'rubik', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(117, 'image', '0', 'rubik', 0, 0, '', 0, 0, 0, '', '', 1),
(118, 'image', '1', 'rubik', 0, 0, '', 0, 0, 0, '', '', 1),
(119, 'devel', '0', 'rubik', 0, 0, '', 0, 0, 0, '', '', 1),
(120, 'devel', '2', 'rubik', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(121, 'menu', 'devel', 'tao', 0, 0, '', 0, 0, 0, '', '', -1),
(122, 'devel_node_access', '0', 'tao', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(123, 'devel_node_access', '1', 'tao', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(124, 'image_attach', '0', 'tao', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(125, 'image', '0', 'tao', 0, 0, '', 0, 0, 0, '', '', 1),
(126, 'image', '1', 'tao', 0, 0, '', 0, 0, 0, '', '', 1),
(127, 'devel', '0', 'tao', 0, 0, '', 0, 0, 0, '', '', 1),
(128, 'devel', '2', 'tao', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(129, 'menu', 'devel', 'garland', 0, 0, '', 0, 0, 0, '', '', -1),
(130, 'devel_node_access', '0', 'garland', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(131, 'devel_node_access', '1', 'garland', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(132, 'image_attach', '0', 'garland', 0, 0, '', 0, 0, 1, 'node/*', '', 1),
(133, 'image', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(134, 'image', '1', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(135, 'devel', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 1),
(136, 'devel', '2', 'garland', 0, 0, '', 0, 0, 0, 'devel/php', '', 1),
(137, 'print', '0', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 4),
(138, 'print', '1', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 8),
(139, 'print_mail', '0', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 8),
(140, 'print_pdf', '0', 'cti_flex', 0, 0, '', 0, 0, 0, '', '', 8),
(141, 'print', '0', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 4),
(142, 'print', '1', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 8),
(143, 'print_mail', '0', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 8),
(144, 'print_pdf', '0', 'globalpos', 0, 0, '', 0, 0, 0, '', '', 8),
(145, 'print', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 4),
(146, 'print', '1', 'garland', 0, 0, '', 0, 0, 0, '', '', 8),
(147, 'print_mail', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 8),
(148, 'print_pdf', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 8),
(149, 'comment', '0', 'zen', 0, -3, 'sidebar_first', 0, 0, 0, '', '', 1),
(150, 'devel', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 1),
(151, 'devel', '2', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, 'devel/php', '', 1),
(152, 'devel_node_access', '0', 'zen', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(153, 'devel_node_access', '1', 'zen', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(154, 'image', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 1),
(155, 'image', '1', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 1),
(156, 'image_attach', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 1, 'node/*', '', 1),
(157, 'menu', 'devel', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', -1),
(158, 'menu', 'primary-links', 'zen', 0, -4, 'sidebar_first', 0, 0, 0, '', '', -1),
(159, 'menu', 'secondary-links', 'zen', 0, -2, 'sidebar_first', 0, 0, 0, '', '', -1),
(160, 'node', '0', 'zen', 0, -1, 'sidebar_first', 0, 0, 0, '', '', -1),
(161, 'print', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 4),
(162, 'print', '1', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 8),
(163, 'print_mail', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 8),
(164, 'print_pdf', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', 8),
(165, 'system', '0', 'zen', 0, -5, 'sidebar_first', 0, 0, 0, '', '', -1),
(166, 'user', '0', 'zen', 0, 0, 'sidebar_first', 0, 0, 0, '', '', -1),
(167, 'user', '1', 'zen', 0, -5, 'sidebar_first', 0, 0, 0, '', '', -1),
(168, 'user', '2', 'zen', 0, 1, 'sidebar_first', 0, 0, 0, '', '', 1),
(169, 'user', '3', 'zen', 0, 2, 'sidebar_first', 0, 0, 0, '', '', -1),
(170, 'comment', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 1),
(171, 'devel', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 1),
(172, 'devel', '2', 'pushbutton', 0, 0, 'left', 0, 0, 0, 'devel/php', '', 1),
(173, 'devel_node_access', '0', 'pushbutton', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(174, 'devel_node_access', '1', 'pushbutton', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(175, 'image', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 1),
(176, 'image', '1', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 1),
(177, 'image_attach', '0', 'pushbutton', 0, 0, 'left', 0, 0, 1, 'node/*', '', 1),
(178, 'menu', 'devel', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', -1),
(179, 'menu', 'primary-links', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', -1),
(180, 'menu', 'secondary-links', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', -1),
(181, 'node', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', -1),
(182, 'print', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 4),
(183, 'print', '1', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 8),
(184, 'print_mail', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 8),
(185, 'print_pdf', '0', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 8),
(186, 'system', '0', 'pushbutton', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(187, 'user', '0', 'pushbutton', 1, 0, 'left', 0, 0, 0, '', '', -1),
(188, 'user', '1', 'pushbutton', 1, 0, 'left', 0, 0, 0, '', '', -1),
(189, 'user', '2', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', 1),
(190, 'user', '3', 'pushbutton', 0, 0, 'left', 0, 0, 0, '', '', -1),
(191, 'comment', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 1),
(192, 'devel', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 1),
(193, 'devel', '2', 'bluemarine', 0, 0, 'left', 0, 0, 0, 'devel/php', '', 1),
(194, 'devel_node_access', '0', 'bluemarine', 1, 0, 'footer', 0, 0, 0, 'print/*', '', 1),
(195, 'devel_node_access', '1', 'bluemarine', 0, 0, 'footer', 0, 0, 0, '', '', 1),
(196, 'image', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 1),
(197, 'image', '1', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 1),
(198, 'image_attach', '0', 'bluemarine', 0, 0, 'left', 0, 0, 1, 'node/*', '', 1),
(199, 'menu', 'devel', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', -1),
(200, 'menu', 'primary-links', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', -1),
(201, 'menu', 'secondary-links', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', -1),
(202, 'node', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', -1),
(203, 'print', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 4),
(204, 'print', '1', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 8),
(205, 'print_mail', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 8),
(206, 'print_pdf', '0', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 8),
(207, 'system', '0', 'bluemarine', 1, 10, 'footer', 0, 0, 0, '', '', -1),
(208, 'user', '0', 'bluemarine', 1, 0, 'left', 0, 0, 0, '', '', -1),
(209, 'user', '1', 'bluemarine', 1, 0, 'left', 0, 0, 0, '', '', -1),
(210, 'user', '2', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', 1),
(211, 'user', '3', 'bluemarine', 0, 0, 'left', 0, 0, 0, '', '', -1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_blocks_roles`
--

CREATE TABLE `cms_blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_boxes`
--

CREATE TABLE `cms_boxes` (
  `bid` int(10) UNSIGNED NOT NULL,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache`
--

CREATE TABLE `cms_cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_block`
--

CREATE TABLE `cms_cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_content`
--

CREATE TABLE `cms_cache_content` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_filter`
--

CREATE TABLE `cms_cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_form`
--

CREATE TABLE `cms_cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_menu`
--

CREATE TABLE `cms_cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_page`
--

CREATE TABLE `cms_cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_update`
--

CREATE TABLE `cms_cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_views`
--

CREATE TABLE `cms_cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_cache_views_data`
--

CREATE TABLE `cms_cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_comments`
--

CREATE TABLE `cms_comments` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_access`
--

CREATE TABLE `cms_content_access` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `settings` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_field_gambar_file`
--

CREATE TABLE `cms_content_field_gambar_file` (
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `delta` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_gambar_file_fid` int(11) DEFAULT NULL,
  `field_gambar_file_list` tinyint(4) DEFAULT NULL,
  `field_gambar_file_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_content_field_gambar_file`
--

INSERT INTO `cms_content_field_gambar_file` (`vid`, `nid`, `delta`, `field_gambar_file_fid`, `field_gambar_file_list`, `field_gambar_file_data`) VALUES
(3, 3, 0, 3, 1, 'a:8:{s:8:"duration";i:0;s:6:"height";i:460;s:5:"width";i:948;s:18:"audio_bitrate_mode";s:0:"";s:18:"audio_channel_mode";s:0:"";s:12:"audio_format";s:0:"";s:13:"audio_bitrate";i:0;s:17:"audio_sample_rate";i:0;}'),
(5, 5, 0, 8, 1, 'a:10:{s:8:"duration";i:0;s:6:"height";i:480;s:5:"width";i:844;s:18:"audio_bitrate_mode";s:0:"";s:18:"audio_channel_mode";s:0:"";s:12:"audio_format";s:0:"";s:13:"audio_bitrate";i:0;s:17:"audio_sample_rate";i:0;s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(7, 7, 0, 17, 1, 'a:8:{s:8:"duration";i:0;s:6:"height";i:960;s:5:"width";i:1280;s:18:"audio_bitrate_mode";s:0:"";s:18:"audio_channel_mode";s:0:"";s:12:"audio_format";s:0:"";s:13:"audio_bitrate";i:0;s:17:"audio_sample_rate";i:0;}'),
(8, 8, 0, 18, 1, 'a:8:{s:8:"duration";i:0;s:6:"height";i:960;s:5:"width";i:1280;s:18:"audio_bitrate_mode";s:0:"";s:18:"audio_channel_mode";s:0:"";s:12:"audio_format";s:0:"";s:13:"audio_bitrate";i:0;s:17:"audio_sample_rate";i:0;}'),
(9, 9, 0, 19, 1, 'a:8:{s:8:"duration";i:0;s:6:"height";i:960;s:5:"width";i:1280;s:18:"audio_bitrate_mode";s:0:"";s:18:"audio_channel_mode";s:0:"";s:12:"audio_format";s:0:"";s:13:"audio_bitrate";i:0;s:17:"audio_sample_rate";i:0;}'),
(10, 10, 0, 20, 1, 'a:12:{s:3:"fid";s:2:"20";s:5:"width";i:1280;s:6:"height";i:960;s:8:"duration";i:0;s:12:"audio_format";s:0:"";s:17:"audio_sample_rate";i:0;s:18:"audio_channel_mode";s:0:"";s:13:"audio_bitrate";i:0;s:18:"audio_bitrate_mode";s:0:"";s:4:"tags";a:0:{}s:3:"alt";s:0:"";s:5:"title";s:0:"";}'),
(10, 10, 1, 25, 1, 'a:12:{s:3:"fid";s:2:"25";s:5:"width";i:1280;s:6:"height";i:960;s:8:"duration";i:0;s:12:"audio_format";s:0:"";s:17:"audio_sample_rate";i:0;s:18:"audio_channel_mode";s:0:"";s:13:"audio_bitrate";i:0;s:18:"audio_bitrate_mode";s:0:"";s:4:"tags";a:0:{}s:3:"alt";s:0:"";s:5:"title";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_group`
--

CREATE TABLE `cms_content_group` (
  `group_type` varchar(32) NOT NULL DEFAULT 'standard',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `settings` mediumtext NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_group_fields`
--

CREATE TABLE `cms_content_group_fields` (
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `field_name` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_node_field`
--

CREATE TABLE `cms_content_node_field` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(127) NOT NULL DEFAULT '',
  `global_settings` mediumtext NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `db_storage` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(127) NOT NULL DEFAULT '',
  `db_columns` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_content_node_field`
--

INSERT INTO `cms_content_node_field` (`field_name`, `type`, `global_settings`, `required`, `multiple`, `db_storage`, `module`, `db_columns`, `active`, `locked`) VALUES
('field_gambar_file', 'filefield', 'a:3:{s:10:"list_field";s:1:"1";s:12:"list_default";i:1;s:17:"description_field";s:1:"0";}', 1, 1, 0, 'filefield', 'a:3:{s:3:"fid";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"list";a:4:{s:4:"type";s:3:"int";s:4:"size";s:4:"tiny";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"data";a:3:{s:4:"type";s:4:"text";s:9:"serialize";b:1;s:5:"views";b:1;}}', 1, 0),
('field_id_produk', 'number_integer', 'a:6:{s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:14:"allowed_values";s:0:"";s:18:"allowed_values_php";s:244:"$produk_rs = db_query("SELECT idproduct,namaproduct FROM product");\r\n$produk_array = array();\r\nwhile ($produk_data = db_fetch_object($produk_rs)){\r\n   $produk_array[$produk_data->idproduct] = $produk_data->namaproduct;\r\n}\r\nreturn $produk_array;";}', 1, 0, 1, 'number', 'a:1:{s:5:"value";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:8:"sortable";b:1;}}', 1, 0),
('field_isi_halaman', 'text', 'a:4:{s:15:"text_processing";s:1:"1";s:10:"max_length";s:0:"";s:14:"allowed_values";s:0:"";s:18:"allowed_values_php";s:0:"";}', 1, 0, 1, 'text', 'a:2:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}s:6:"format";a:4:{s:4:"type";s:3:"int";s:8:"unsigned";b:1;s:8:"not null";b:0;s:5:"views";b:0;}}', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_node_field_instance`
--

CREATE TABLE `cms_content_node_field_instance` (
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `type_name` varchar(32) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `widget_type` varchar(32) NOT NULL DEFAULT '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL DEFAULT '',
  `widget_active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_content_node_field_instance`
--

INSERT INTO `cms_content_node_field_instance` (`field_name`, `type_name`, `weight`, `label`, `widget_type`, `widget_settings`, `display_settings`, `description`, `widget_module`, `widget_active`) VALUES
('field_gambar_file', 'gambar_produk', 7, 'Gambar', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:0:"";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:0;s:5:"title";s:0:"";s:12:"custom_title";i:0;s:10:"title_type";s:9:"textfield";s:13:"default_image";N;s:17:"use_default_image";i:0;}', 'a:4:{s:5:"label";a:2:{s:6:"format";s:5:"above";s:7:"exclude";i:0;}s:6:"teaser";a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1),
('field_id_produk', 'gambar_produk', 5, 'Produk', 'optionwidgets_select', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";N;}', 'a:4:{s:5:"label";a:2:{s:6:"format";s:5:"above";s:7:"exclude";i:0;}s:6:"teaser";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1),
('field_isi_halaman', 'halaman_nota', -4, 'Isi Halaman', 'text_textarea', 'a:4:{s:4:"rows";s:1:"5";s:4:"size";i:60;s:13:"default_value";a:1:{i:0;a:2:{s:5:"value";s:0:"";s:14:"_error_element";s:49:"default_value_widget][field_isi_halaman][0][value";}}s:17:"default_value_php";N;}', 'a:7:{s:6:"weight";s:2:"-4";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:5;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'text', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_type_gambar_produk`
--

CREATE TABLE `cms_content_type_gambar_produk` (
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_id_produk_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_content_type_gambar_produk`
--

INSERT INTO `cms_content_type_gambar_produk` (`vid`, `nid`, `field_id_produk_value`) VALUES
(3, 3, 23),
(5, 5, 1),
(7, 7, 12),
(8, 8, 13),
(9, 9, 14),
(10, 10, 15);

-- --------------------------------------------------------

--
-- Table structure for table `cms_content_type_halaman_nota`
--

CREATE TABLE `cms_content_type_halaman_nota` (
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_isi_halaman_value` longtext,
  `field_isi_halaman_format` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_content_type_halaman_nota`
--

INSERT INTO `cms_content_type_halaman_nota` (`vid`, `nid`, `field_isi_halaman_value`, `field_isi_halaman_format`) VALUES
(6, 6, '<?php\r\n \r\nprint cekPrinterCommand();\r\n\r\n?>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cms_date_formats`
--

CREATE TABLE `cms_date_formats` (
  `dfid` int(10) UNSIGNED NOT NULL,
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_date_formats`
--

INSERT INTO `cms_date_formats` (`dfid`, `format`, `type`, `locked`) VALUES
(1, 'Y-m-d H:i', 'short', 1),
(2, 'm/d/Y - H:i', 'short', 1),
(3, 'd/m/Y - H:i', 'short', 1),
(4, 'Y/m/d - H:i', 'short', 1),
(5, 'd.m.Y - H:i', 'short', 1),
(6, 'm/d/Y - g:ia', 'short', 1),
(7, 'd/m/Y - g:ia', 'short', 1),
(8, 'Y/m/d - g:ia', 'short', 1),
(9, 'M j Y - H:i', 'short', 1),
(10, 'j M Y - H:i', 'short', 1),
(11, 'Y M j - H:i', 'short', 1),
(12, 'M j Y - g:ia', 'short', 1),
(13, 'j M Y - g:ia', 'short', 1),
(14, 'Y M j - g:ia', 'short', 1),
(15, 'D, Y-m-d H:i', 'medium', 1),
(16, 'D, m/d/Y - H:i', 'medium', 1),
(17, 'D, d/m/Y - H:i', 'medium', 1),
(18, 'D, Y/m/d - H:i', 'medium', 1),
(19, 'F j, Y - H:i', 'medium', 1),
(20, 'j F, Y - H:i', 'medium', 1),
(21, 'Y, F j - H:i', 'medium', 1),
(22, 'D, m/d/Y - g:ia', 'medium', 1),
(23, 'D, d/m/Y - g:ia', 'medium', 1),
(24, 'D, Y/m/d - g:ia', 'medium', 1),
(25, 'F j, Y - g:ia', 'medium', 1),
(26, 'j F Y - g:ia', 'medium', 1),
(27, 'Y, F j - g:ia', 'medium', 1),
(28, 'j. F Y - G:i', 'medium', 1),
(29, 'l, F j, Y - H:i', 'long', 1),
(30, 'l, j F, Y - H:i', 'long', 1),
(31, 'l, Y,  F j - H:i', 'long', 1),
(32, 'l, F j, Y - g:ia', 'long', 1),
(33, 'l, j F Y - g:ia', 'long', 1),
(34, 'l, Y,  F j - g:ia', 'long', 1),
(35, 'l, j. F Y - G:i', 'long', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_date_format_locale`
--

CREATE TABLE `cms_date_format_locale` (
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(200) NOT NULL,
  `language` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_date_format_types`
--

CREATE TABLE `cms_date_format_types` (
  `type` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_date_format_types`
--

INSERT INTO `cms_date_format_types` (`type`, `title`, `locked`) VALUES
('long', 'Long', 1),
('medium', 'Medium', 1),
('short', 'Short', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_devel_queries`
--

CREATE TABLE `cms_devel_queries` (
  `qid` int(11) NOT NULL,
  `function` varchar(255) NOT NULL DEFAULT '',
  `query` text NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_devel_times`
--

CREATE TABLE `cms_devel_times` (
  `tid` int(11) NOT NULL,
  `qid` int(11) NOT NULL DEFAULT '0',
  `time` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_filefield_meta`
--

CREATE TABLE `cms_filefield_meta` (
  `fid` int(10) UNSIGNED NOT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `audio_format` varchar(10) NOT NULL DEFAULT '',
  `audio_sample_rate` mediumint(9) NOT NULL DEFAULT '0',
  `audio_channel_mode` varchar(10) NOT NULL DEFAULT '',
  `audio_bitrate` float NOT NULL DEFAULT '0',
  `audio_bitrate_mode` varchar(4) NOT NULL DEFAULT '',
  `tags` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_filefield_meta`
--

INSERT INTO `cms_filefield_meta` (`fid`, `width`, `height`, `duration`, `audio_format`, `audio_sample_rate`, `audio_channel_mode`, `audio_bitrate`, `audio_bitrate_mode`, `tags`) VALUES
(3, 948, 460, 0, '', 0, '', 0, '', NULL),
(8, 844, 480, 0, '', 0, '', 0, '', NULL),
(17, 1280, 960, 0, '', 0, '', 0, '', NULL),
(18, 1280, 960, 0, '', 0, '', 0, '', NULL),
(19, 1280, 960, 0, '', 0, '', 0, '', NULL),
(20, 1280, 960, 0, '', 0, '', 0, '', 'a:0:{}'),
(25, 1280, 960, 0, '', 0, '', 0, '', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_files`
--

CREATE TABLE `cms_files` (
  `fid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_files`
--

INSERT INTO `cms_files` (`fid`, `uid`, `filename`, `filepath`, `filemime`, `filesize`, `status`, `timestamp`) VALUES
(3, 1, 'logo fisitekh.png', 'sites/default/files/logo fisitekh.png', 'image/png', 56769, 1, 1333923947),
(4, 1, 'logo oikostekh bolong.png', '\\xampp\\tmp/logo oikostekh bolong.png', 'image/png', 207540, 0, 1333924802),
(5, 1, '_original', 'sites/default/files/images/logo oikostekh bolong.png', 'image/png', 207540, 1, 1333924802),
(6, 1, 'thumbnail', 'sites/default/files/images/logo oikostekh bolong.thumbnail.png', 'image/png', 5323, 1, 1333924803),
(7, 1, 'preview', 'sites/default/files/images/logo oikostekh bolong.preview.png', 'image/png', 95724, 1, 1333924803),
(8, 1, 'logo histekh.png', 'sites/default/files/logo histekh.png', 'image/png', 189472, 1, 1333924832),
(9, 1, 'logo_0.png', '\\xampp\\tmp/logo_0.png', 'image/png', 10415, 0, 1388135647),
(10, 1, 'logo-ikhwan2.png', '\\xampp\\tmp/logo-ikhwan2.png', 'image/png', 29046, 0, 1450303829),
(11, 1, 'logo ikhwan.png', '\\xampp\\tmp/logo ikhwan.png', 'image/png', 9168, 0, 1450303943),
(12, 1, 'logo-ikhwan2.png', 'sites/default/files/tmp/logo-ikhwan2.png', 'image/png', 29046, 0, 1450304009),
(13, 1, 'logo-ikhwan2.png', 'sites/default/files/tmp/logo-ikhwan2_0.png', 'image/png', 29046, 0, 1450304036),
(14, 1, 'logojpg.jpg', 'sites/default/files/tmp/logojpg.jpg', 'image/jpeg', 7995, 0, 1450304086),
(15, 1, 'logojpgsmall.jpg', 'sites/default/files/tmp/logojpgsmall.jpg', 'image/jpeg', 5011, 0, 1450304169),
(16, 1, 'logosmallpng.png', 'sites/default/files/tmp/logosmallpng.png', 'image/png', 9765, 0, 1450304252),
(17, 0, 'songkokikhwanspesial2.jpg', 'sites/default/files/songkokikhwanspesial2.jpg', 'image/jpeg', 168464, 1, 1477659834),
(18, 0, 'songkokikhwanspesial2.jpg', 'sites/default/files/songkokikhwanspesial2.jpg', 'image/jpeg', 168464, 1, 1477660371),
(19, 0, 'songkokikhwanspesial2.jpg', 'sites/default/files/songkokikhwanspesial2.jpg', 'image/jpeg', 168464, 1, 1477660675),
(20, 1, 'songkokikhwanbiasa.jpg', 'sites/default/files/songkokikhwanbiasa.jpg', 'image/jpeg', 250034, 1, 1477660899),
(21, 1, 'songkokikhwanspesial2.jpg', 'sites/default/files/tmp/songkokikhwanspesial2.jpg', 'image/jpeg', 168464, 0, 1477660979),
(22, 1, '_original', 'sites/default/files/images/songkokikhwanspesial2.jpg', 'image/jpeg', 168464, 1, 1477660979),
(23, 1, 'thumbnail', 'sites/default/files/images/songkokikhwanspesial2.thumbnail.jpg', 'image/jpeg', 3504, 1, 1477660979),
(24, 1, 'preview', 'sites/default/files/images/songkokikhwanspesial2.preview.jpg', 'image/jpeg', 56184, 1, 1477660979),
(25, 1, 'songkokikhwanspesial2.jpg', 'sites/default/files/songkokikhwanspesial2_0.jpg', 'image/jpeg', 168464, 1, 1477661101);

-- --------------------------------------------------------

--
-- Table structure for table `cms_filters`
--

CREATE TABLE `cms_filters` (
  `fid` int(11) NOT NULL,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_filters`
--

INSERT INTO `cms_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES
(1, 1, 'filter', 2, 0),
(2, 1, 'filter', 0, 1),
(3, 1, 'filter', 1, 2),
(4, 1, 'filter', 3, 10),
(5, 2, 'filter', 2, 0),
(6, 2, 'filter', 1, 1),
(7, 2, 'filter', 3, 10),
(8, 3, 'php', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_filter_formats`
--

CREATE TABLE `cms_filter_formats` (
  `format` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_filter_formats`
--

INSERT INTO `cms_filter_formats` (`format`, `name`, `roles`, `cache`) VALUES
(1, 'Filtered HTML', ',1,2,', 1),
(2, 'Full HTML', '', 1),
(3, 'PHP code', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_flood`
--

CREATE TABLE `cms_flood` (
  `fid` int(11) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_history`
--

CREATE TABLE `cms_history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_history`
--

INSERT INTO `cms_history` (`uid`, `nid`, `timestamp`) VALUES
(1, 1, 1333890378),
(1, 2, 1333891133),
(1, 3, 1333923966),
(1, 5, 1477660439),
(1, 4, 1333926075),
(1, 6, 1477638215),
(1, 10, 1477661107);

-- --------------------------------------------------------

--
-- Table structure for table `cms_image`
--

CREATE TABLE `cms_image` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image_size` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_image`
--

INSERT INTO `cms_image` (`nid`, `fid`, `image_size`) VALUES
(4, 5, '_original'),
(4, 6, 'thumbnail'),
(4, 7, 'preview'),
(11, 22, '_original'),
(11, 23, 'thumbnail'),
(11, 24, 'preview');

-- --------------------------------------------------------

--
-- Table structure for table `cms_imagecache_action`
--

CREATE TABLE `cms_imagecache_action` (
  `actionid` int(10) UNSIGNED NOT NULL,
  `presetid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_imagecache_action`
--

INSERT INTO `cms_imagecache_action` (`actionid`, `presetid`, `weight`, `module`, `action`, `data`) VALUES
(1, 1, 0, 'imagecache', 'imagecache_scale', 'a:3:{s:5:"width";s:3:"150";s:6:"height";s:3:"150";s:7:"upscale";i:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_imagecache_preset`
--

CREATE TABLE `cms_imagecache_preset` (
  `presetid` int(10) UNSIGNED NOT NULL,
  `presetname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_imagecache_preset`
--

INSERT INTO `cms_imagecache_preset` (`presetid`, `presetname`) VALUES
(1, 'thumbnail');

-- --------------------------------------------------------

--
-- Table structure for table `cms_image_attach`
--

CREATE TABLE `cms_image_attach` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `iid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_image_attach`
--

INSERT INTO `cms_image_attach` (`nid`, `iid`, `weight`) VALUES
(0, 4, 0),
(5, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_kategoripengeluaran`
--

CREATE TABLE `cms_kategoripengeluaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL DEFAULT 'Kategori Pengeluaran',
  `keterangan` varchar(255) NOT NULL DEFAULT 'Keterangan',
  `jeniskategori` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `changed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_kategoripengeluaran`
--

INSERT INTO `cms_kategoripengeluaran` (`id`, `kategori`, `keterangan`, `jeniskategori`, `created`, `changed`, `uid`) VALUES
(1, 'MAKAN MINUM', 'Pengeluaran terkait makan minum', 0, 1477127773, 1477127773, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menu_custom`
--

CREATE TABLE `cms_menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_menu_custom`
--

INSERT INTO `cms_menu_custom` (`menu_name`, `title`, `description`) VALUES
('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),
('primary-links', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),
('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links'),
('devel', 'Development', 'Development links.');

-- --------------------------------------------------------

--
-- Table structure for table `cms_menu_links`
--

CREATE TABLE `cms_menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) UNSIGNED NOT NULL,
  `plid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p6` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p7` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p8` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `p9` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_menu_links`
--

INSERT INTO `cms_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 2, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 8, 2, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 10, 2, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site\'s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 0, 1, 1, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 12, 0, 'comment/delete', 'comment/delete', 'Delete comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 13, 0, 'comment/edit', 'comment/edit', 'Edit comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 15, 2, 'admin/help', 'admin/help', 'Help', 'a:0:{}', 'system', 0, 0, 0, 0, 9, 2, 0, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 16, 2, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 17, 2, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 18, 2, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 20, 2, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site\'s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 22, 20, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 22, 0, 0, 0, 0, 0, 0, 0),
('navigation', 23, 18, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 23, 0, 0, 0, 0, 0, 0, 0),
('navigation', 24, 18, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Settings for how your administrative pages should look.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 24, 0, 0, 0, 0, 0, 0, 0),
('navigation', 25, 17, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site\'s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 25, 0, 0, 0, 0, 0, 0, 0),
('navigation', 26, 18, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 26, 0, 0, 0, 0, 0, 0, 0),
('navigation', 27, 10, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"List and edit site comments and the comment moderation queue.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 27, 0, 0, 0, 0, 0, 0, 0),
('navigation', 28, 10, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site\'s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 28, 0, 0, 0, 0, 0, 0, 0),
('navigation', 29, 10, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 29, 0, 0, 0, 0, 0, 0, 0),
('navigation', 30, 18, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system\'s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 30, 0, 0, 0, 0, 0, 0, 0),
('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 33, 18, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 33, 0, 0, 0, 0, 0, 0, 0),
('navigation', 34, 18, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 34, 0, 0, 0, 0, 0, 0, 0),
('navigation', 35, 18, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 35, 0, 0, 0, 0, 0, 0, 0),
('navigation', 36, 18, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 36, 0, 0, 0, 0, 0, 0, 0),
('navigation', 37, 18, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 18, 37, 0, 0, 0, 0, 0, 0, 0),
('navigation', 38, 17, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site\'s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 17, 38, 0, 0, 0, 0, 0, 0, 0),
('navigation', 39, 17, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 39, 0, 0, 0, 0, 0, 0, 0),
('navigation', 40, 18, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 40, 0, 0, 0, 0, 0, 0, 0),
('navigation', 41, 20, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 41, 0, 0, 0, 0, 0, 0, 0),
('navigation', 42, 10, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 42, 0, 0, 0, 0, 0, 0, 0),
('navigation', 43, 10, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 43, 0, 0, 0, 0, 0, 0, 0),
('navigation', 44, 0, 'comment/reply/%', 'comment/reply/%', 'Reply to comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 45, 20, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 45, 0, 0, 0, 0, 0, 0, 0),
('navigation', 46, 18, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 46, 0, 0, 0, 0, 0, 0, 0),
('navigation', 47, 18, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 47, 0, 0, 0, 0, 0, 0, 0),
('navigation', 48, 16, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site\'s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 48, 0, 0, 0, 0, 0, 0, 0),
('navigation', 49, 17, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 49, 0, 0, 0, 0, 0, 0, 0),
('navigation', 50, 20, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 50, 0, 0, 0, 0, 0, 0, 0),
('navigation', 51, 20, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 51, 0, 0, 0, 0, 0, 0, 0),
('navigation', 52, 15, 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 52, 0, 0, 0, 0, 0, 0, 0),
('navigation', 53, 15, 'admin/help/color', 'admin/help/color', 'color', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 53, 0, 0, 0, 0, 0, 0, 0),
('navigation', 54, 15, 'admin/help/comment', 'admin/help/comment', 'comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 54, 0, 0, 0, 0, 0, 0, 0),
('navigation', 55, 15, 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 55, 0, 0, 0, 0, 0, 0, 0),
('navigation', 56, 15, 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 56, 0, 0, 0, 0, 0, 0, 0),
('navigation', 57, 15, 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 57, 0, 0, 0, 0, 0, 0, 0),
('navigation', 58, 15, 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 58, 0, 0, 0, 0, 0, 0, 0),
('navigation', 59, 15, 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 59, 0, 0, 0, 0, 0, 0, 0),
('navigation', 60, 15, 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 60, 0, 0, 0, 0, 0, 0, 0),
('navigation', 61, 36, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 61, 0, 0, 0, 0, 0, 0),
('navigation', 62, 26, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 26, 62, 0, 0, 0, 0, 0, 0),
('navigation', 63, 23, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 63, 0, 0, 0, 0, 0, 0),
('navigation', 64, 25, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 64, 0, 0, 0, 0, 0, 0),
('navigation', 65, 17, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 65, 0, 0, 0, 0, 0, 0, 0),
('navigation', 66, 30, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 66, 0, 0, 0, 0, 0, 0),
('navigation', 67, 25, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 67, 0, 0, 0, 0, 0, 0),
('navigation', 68, 36, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 68, 0, 0, 0, 0, 0, 0),
('navigation', 69, 22, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 69, 0, 0, 0, 0, 0, 0),
('navigation', 70, 45, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 45, 70, 0, 0, 0, 0, 0, 0),
('navigation', 71, 22, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 71, 0, 0, 0, 0, 0, 0),
('navigation', 72, 48, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 72, 0, 0, 0, 0, 0, 0),
('navigation', 73, 42, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 42, 73, 0, 0, 0, 0, 0, 0),
('navigation', 74, 23, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 74, 0, 0, 0, 0, 0, 0),
('navigation', 75, 48, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:1:{s:5:"alter";b:1;}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 75, 0, 0, 0, 0, 0, 0),
('navigation', 76, 48, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 76, 0, 0, 0, 0, 0, 0),
('navigation', 77, 23, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 77, 0, 0, 0, 0, 0, 0),
('navigation', 78, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 79, 25, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 79, 0, 0, 0, 0, 0, 0),
('navigation', 80, 39, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 80, 0, 0, 0, 0, 0, 0),
('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 82, 39, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 82, 0, 0, 0, 0, 0, 0),
('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 86, 38, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 86, 0, 0, 0, 0, 0, 0),
('navigation', 87, 38, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 87, 0, 0, 0, 0, 0, 0),
('navigation', 88, 38, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 88, 0, 0, 0, 0, 0, 0),
('navigation', 89, 38, 'admin/build/menu-customize/navigation', 'admin/build/menu-customize/%', 'Navigation', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 89, 0, 0, 0, 0, 0, 0),
('navigation', 90, 38, 'admin/build/menu-customize/primary-links', 'admin/build/menu-customize/%', 'Primary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 90, 0, 0, 0, 0, 0, 0),
('navigation', 91, 38, 'admin/build/menu-customize/secondary-links', 'admin/build/menu-customize/%', 'Secondary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 91, 0, 0, 0, 0, 0, 0),
('navigation', 92, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 93, 16, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 2, 16, 93, 0, 0, 0, 0, 0, 0, 0),
('navigation', 94, 10, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 94, 0, 0, 0, 0, 0, 0, 0),
('navigation', 95, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 96, 16, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top \'access denied\' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View \'access denied\' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 96, 0, 0, 0, 0, 0, 0, 0),
('navigation', 97, 16, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top \'page not found\' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View \'page not found\' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 97, 0, 0, 0, 0, 0, 0, 0),
('navigation', 98, 15, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 98, 0, 0, 0, 0, 0, 0, 0),
('navigation', 99, 15, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 99, 0, 0, 0, 0, 0, 0, 0),
('navigation', 100, 37, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 37, 100, 0, 0, 0, 0, 0, 0),
('navigation', 101, 16, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 16, 101, 0, 0, 0, 0, 0, 0, 0),
('navigation', 102, 94, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 102, 0, 0, 0, 0, 0, 0),
('navigation', 103, 94, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 103, 0, 0, 0, 0, 0, 0),
('navigation', 104, 94, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 104, 0, 0, 0, 0, 0, 0),
('navigation', 105, 16, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 105, 0, 0, 0, 0, 0, 0, 0),
('navigation', 719, 10, 'admin/content/image', 'admin/content/image', 'Image galleries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:34:"Create and manage image galleries.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 719, 0, 0, 0, 0, 0, 0, 0),
('navigation', 720, 10, 'admin/content/image_import', 'admin/content/image_import', 'Image import', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"Import image from the filesystem.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 720, 0, 0, 0, 0, 0, 0, 0),
('navigation', 682, 0, 'admin/content/node-type/gambar-produk/delete', 'admin/content/node-type/gambar-produk/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 682, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 683, 0, 'admin/content/node-type/gambar-produk/groups/%', 'admin/content/node-type/gambar-produk/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 683, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 684, 0, 'admin/content/node-type/gambar-produk/groups/%/remove', 'admin/content/node-type/gambar-produk/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 684, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 108, 15, 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 108, 0, 0, 0, 0, 0, 0, 0),
('navigation', 109, 105, 'admin/reports/updates/check', 'admin/reports/updates/check', 'Manual update check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 105, 109, 0, 0, 0, 0, 0, 0),
('navigation', 721, 18, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Configure ImageAPI.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 721, 0, 0, 0, 0, 0, 0, 0),
('navigation', 780, 0, 'admin/content/node-type/gambar-produk/fields/field_gambar_file/remove', 'admin/content/node-type/gambar-produk/fields/field_gambar_file/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 780, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 717, 0, 'system/lightbox2/filter-xss', 'system/lightbox2/filter-xss', 'Filter XSS', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 717, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 260, 0, 'dataproduk/kategori', 'dataproduk/kategori', 'Kategori Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Manajemen Kategori Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 260, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 264, 0, 'dataproduk/simpansubkategori', 'dataproduk/simpansubkategori', 'Simpan Subkategori Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Simpan Subkategori Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 264, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 351, 0, 'datasupplier/simpancpsupplier', 'datasupplier/simpancpsupplier', 'Simpan Contact Person Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"Simpan Contact Person Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 351, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 350, 0, 'datasupplier/pembayaran', 'datasupplier/pembayaran', 'Form Pembayaran Hutang ke Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:34:"Form Pembayaran Hutang ke Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 267, 0, 'dataproduk/updatekategori', 'dataproduk/updatekategori', 'Update Kategori Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Update Kategori Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 267, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 266, 0, 'dataproduk/isitableproduk', 'dataproduk/isitableproduk', 'Tabel Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Tabel Data Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 266, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 349, 0, 'datasupplier/detailpembayaran', 'datasupplier/detailpembayaran', 'Detail Pembayaran ke Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:29:"Detail Pembayaran ke Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 349, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 348, 0, 'datasupplier/detailhutang', 'datasupplier/detailhutang', 'Detail Hutang ke Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Detail Hutang ke Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 348, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 268, 0, 'dataproduk/updatesubkategori', 'dataproduk/updatesubkategori', 'Update Subkategori Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Update Subkategori Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 268, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 347, 0, 'datasupplier/supplier', 'datasupplier/supplier', 'Data Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Manajemen Data Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 347, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 346, 0, 'datasupplier/cpsupplier', 'datasupplier/cpsupplier', 'Contact Person Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"Manajemen Contact Person Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 346, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 265, 0, 'dataproduk/subkategori', 'dataproduk/subkategori', 'Subkategori Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:28:"Manajemen Subkategori Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 265, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 263, 0, 'dataproduk/simpansatuan', 'dataproduk/simpansatuan', 'Simpan Satuan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Simpan Satuan Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 263, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 262, 0, 'dataproduk/simpankategori', 'dataproduk/simpankategori', 'Simpan Kategori Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Simpan Kategori Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 262, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 261, 0, 'dataproduk/simpanproduk', 'dataproduk/simpanproduk', 'Simpan Data Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Simpan Data Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 261, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 258, 0, 'dataproduk/editproduk', 'dataproduk/editproduk', 'Edit Data Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Edit Data Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 258, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 259, 0, 'dataproduk/filterkategori', 'dataproduk/filterkategori', 'Filter Kategori', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:15:"Filter Kategori";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 259, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 257, 0, 'dataproduk/produk', 'dataproduk/produk', 'Data Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Manajemen Data Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 257, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 256, 0, 'dataproduk/cekkodealternatif', 'dataproduk/cekkodealternatif', 'Cek Kode Alternatif', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Cek Kode Alternatif";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 255, 0, 'dataproduk/cekbarcode2', 'dataproduk/cekbarcode2', 'Cek Barcode', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Cek Barcode";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 254, 0, 'dataproduk/cekbarcode', 'dataproduk/cekbarcode', 'Cek Barcode', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Cek Barcode";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 296, 0, 'penjualan/kasir', 'penjualan/kasir', 'Kasir Global POS', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Kasir Global POS";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 296, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 297, 0, 'penjualan/autocaribarang', 'penjualan/autocaribarang', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 297, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 298, 0, 'penjualan/cariproduk', 'penjualan/cariproduk', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 298, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 295, 0, 'penjualan/hitungomset', 'penjualan/hitungomset', 'Hitung Omset', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:12:"Hitung Omset";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 295, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 294, 0, 'penjualan/detailpenjualan', 'penjualan/detailpenjualan', 'Detail Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Detail Penjualan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 294, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 293, 0, 'penjualan/viewpenjualan', 'penjualan/viewpenjualan', 'Data Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Data Penjualan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 293, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 299, 0, 'penjualan/simpanpenjualan', 'penjualan/simpanpenjualan', 'Simpan Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Simpan Penjualan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 299, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 318, 0, 'pembelian/simpanpembelian', 'pembelian/simpanpembelian', 'Simpan Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Simpan Pembelian";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 318, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 317, 0, 'pembelian/cariproduk', 'pembelian/cariproduk', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 317, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 316, 0, 'pembelian/autocaribarang', 'pembelian/autocaribarang', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 316, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 314, 0, 'pembelian/detailpembelian', 'pembelian/detailpembelian', 'Detail Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Detail Pembelian";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 314, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 315, 0, 'pembelian/kasir', 'pembelian/kasir', 'Kasir Pembelian Global POS', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"Kasir pembelian global pos";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 313, 0, 'pembelian/viewpembelian', 'pembelian/viewpembelian', 'Data Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Data Pembelian";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 313, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 427, 0, 'datapelanggan/updatepelanggan', 'datapelanggan/updatepelanggan', 'Update Data Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Update Data Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 427, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 426, 0, 'datapelanggan/tabeldiskon', 'datapelanggan/tabeldiskon', 'Tabel Diskon Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Tabel Diskon Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 426, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 425, 0, 'datapelanggan/simpandiskon', 'datapelanggan/simpandiskon', 'Simpan Diskon Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Simpan Diskon Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 425, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 424, 0, 'datapelanggan/simpanpelanggan', 'datapelanggan/simpanpelanggan', 'Simpan Data Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Simpan Data Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 424, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 422, 0, 'datapelanggan/pembayaran', 'datapelanggan/pembayaran', 'Form Pembayaran Piutang Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"Form Pembayaran Piutang Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 422, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 352, 0, 'datasupplier/simpansupplier', 'datasupplier/simpansupplier', 'Simpan Data Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Simpan Data Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 352, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 353, 0, 'datasupplier/updatecpsupplier', 'datasupplier/updatecpsupplier', 'Update Contact Person Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"Update Contact Person Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 353, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 354, 0, 'datasupplier/updatesupplier', 'datasupplier/updatesupplier', 'Update Data Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Update Data Supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 354, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 423, 0, 'datapelanggan/hapusdiskon', 'datapelanggan/hapusdiskon', 'Hapus Diskon Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Hapus Diskon Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 423, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 420, 0, 'datapelanggan/detailhutang', 'datapelanggan/detailhutang', 'Detail Hutang Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Detail Hutang Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 420, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 421, 0, 'datapelanggan/detailpembayaran', 'datapelanggan/detailpembayaran', 'Detail Pembayaran Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Detail Pembayaran Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 421, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 419, 0, 'datapelanggan/pelanggan', 'datapelanggan/pelanggan', 'Data Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Manajemen Data Pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 419, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 417, 0, 'hasilreproduksi/simpanhasilreproduksi', 'hasilreproduksi/simpanhasilreproduksi', 'Simpan Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Simpan Reproduksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 417, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 416, 0, 'reproduksi/cariproduk', 'reproduksi/cariproduk', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 416, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 415, 0, 'hasilreproduksi/cariproduk', 'hasilreproduksi/cariproduk', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 415, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 414, 0, 'reproduksi/autocaribarang', 'reproduksi/autocaribarang', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 414, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 413, 0, 'hasilreproduksi/autocaribarang', 'hasilreproduksi/autocaribarang', 'Pencarian Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pencarian Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 413, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 411, 0, 'hasilreproduksi/kasir', 'hasilreproduksi/kasir', 'Form Hasil Packing Ulang', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Form Hasil Packing Ulang";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 411, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 412, 0, 'reproduksi/kasir', 'reproduksi/kasir', 'From Packing Ulang', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"From Packing Ulang";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 412, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 410, 0, 'reproduksi/detailreproduksi', 'reproduksi/detailreproduksi', 'Detail Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Detail Reproduksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 410, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 409, 0, 'hasilreproduksi/detailhasilreproduksi', 'hasilreproduksi/detailhasilreproduksi', 'Detail Hasil Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Detail Hasil Reproduksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 409, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 408, 0, 'reproduksi/viewreproduksi', 'reproduksi/viewreproduksi', 'Data Packing Ulang', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:15:"Data Reproduksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 408, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 418, 0, 'reproduksi/simpanreproduksi', 'reproduksi/simpanreproduksi', 'Simpan Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Simpan Reproduksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 418, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 428, 0, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'devel', 0, 0, 0, 0, 0, 1, 0, 428, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 429, 0, 'admin/settings/devel', 'admin/settings', 'Devel settings', 'a:0:{}', 'devel', 0, 0, 0, 0, 0, 1, 0, 429, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 432, 0, 'content/js_add_more', 'content/js_add_more', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 432, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 433, 0, 'filefield/progress', 'filefield/progress', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 433, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 434, 0, 'upload/js', 'upload/js', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 434, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 435, 0, 'devel/queries', 'devel/queries', 'Database queries', 'a:0:{}', 'system', 0, 0, 1, 0, 0, 1, 0, 435, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 436, 0, 'devel/php', 'devel/php', 'Execute PHP Code', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Execute some PHP code";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 436, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 437, 0, 'devel/reference', 'devel/reference', 'Function reference', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:73:"View a list of currently defined user functions with documentation links.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 437, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 438, 0, 'devel/elements', 'devel/elements', 'Hook_elements()', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:51:"View the active form/render elements for this site.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 438, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 439, 0, 'nodereference/autocomplete', 'nodereference/autocomplete', 'Nodereference autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 439, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 440, 0, 'devel/phpinfo', 'devel/phpinfo', 'PHPinfo()', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View your server\'s PHP configuration";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 440, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 441, 0, 'devel/reinstall', 'devel/reinstall', 'Reinstall modules', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:64:"Run hook_uninstall() and then hook_install() for a given module.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, 0, 1, 0, 441, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 442, 0, 'devel/session', 'devel/session', 'Session viewer', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"List the contents of $_SESSION.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 442, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 443, 0, 'devel/switch', 'devel/switch', 'Switch user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 443, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 444, 0, 'user/timezone', 'user/timezone', 'User timezone', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 444, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 445, 0, 'userreference/autocomplete', 'userreference/autocomplete', 'Userreference autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 445, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 446, 0, 'devel/variable', 'devel/variable', 'Variable editor', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:31:"Edit and delete site variables.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, 0, 1, 0, 446, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 447, 0, 'views/ajax', 'views/ajax', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Ajax callback for view loading.";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 447, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 449, 18, 'admin/settings/devel', 'admin/settings/devel', 'Devel settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:164:"Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href="/admin/build/block">block administration</a> page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 449, 0, 0, 0, 0, 0, 0, 0),
('devel', 450, 0, 'devel/cache/clear', 'devel/cache/clear', 'Empty cache', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:100:"Clear the CSS cache and all database cache tables which store page, node, theme and variable caches.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, 0, 1, 0, 450, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 451, 435, 'devel/queries/empty', 'devel/queries/empty', 'Empty database queries', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 2, 0, 435, 451, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 452, 18, 'admin/settings/uploads', 'admin/settings/uploads', 'File uploads', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Control how files may be attached to content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 452, 0, 0, 0, 0, 0, 0, 0),
('navigation', 453, 18, 'admin/settings/mimedetect', 'admin/settings/mimedetect', 'Mime type detection', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Control how the mime type of uploaded files will be determined.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 453, 0, 0, 0, 0, 0, 0, 0),
('devel', 454, 0, 'devel/node_access/summary', 'devel/node_access/summary', 'Node_access summary', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 454, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 455, 16, 'admin/reports/performance_logging_details', 'admin/reports/performance_logging_details', 'Performance Logs: Details', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"View detailed, per page, performance logs: page generation times and memory usage.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 455, 0, 0, 0, 0, 0, 0, 0),
('navigation', 456, 16, 'admin/reports/performance_logging_summary', 'admin/reports/performance_logging_summary', 'Performance Logs: Summary', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:70:"View summary performance logs: page generation times and memory usage.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 456, 0, 0, 0, 0, 0, 0, 0),
('navigation', 457, 18, 'admin/settings/performance_logging', 'admin/settings/performance_logging', 'Performance logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:62:"Logs performance data: page generation times and memory usage.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 18, 457, 0, 0, 0, 0, 0, 0, 0),
('devel', 458, 0, 'devel/menu/reset', 'devel/menu/reset', 'Rebuild menus', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:113:"Rebuild menu based on hook_menu() and revert any custom changes. All menu items return to their default settings.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, 0, 1, 0, 458, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 459, 0, 'date/tools/remove', 'date/tools/remove', 'Remove calendar', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 459, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('devel', 460, 0, 'devel/theme/registry', 'devel/theme/registry', 'Theme registry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"View a list of available theme functions across the whole site.";}}', 'system', 0, 0, 0, 0, 0, 1, 0, 460, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 461, 17, 'admin/build/path', 'admin/build/path', 'URL aliases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Change your site\'s URL paths by aliasing them.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 461, 0, 0, 0, 0, 0, 0, 0),
('navigation', 462, 18, 'admin/settings/vertical-tabs', 'admin/settings/vertical-tabs', 'Vertical Tabs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:37:"Configure settings for vertical tabs.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 462, 0, 0, 0, 0, 0, 0, 0),
('navigation', 464, 15, 'admin/help/content', 'admin/help/content', 'content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 464, 0, 0, 0, 0, 0, 0, 0),
('navigation', 465, 15, 'admin/help/date', 'admin/help/date', 'date', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 465, 0, 0, 0, 0, 0, 0, 0),
('navigation', 466, 15, 'admin/help/date_tools', 'admin/help/date_tools', 'date_tools', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 466, 0, 0, 0, 0, 0, 0, 0),
('navigation', 467, 15, 'admin/help/devel', 'admin/help/devel', 'devel', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 467, 0, 0, 0, 0, 0, 0, 0),
('navigation', 468, 15, 'admin/help/devel_node_access', 'admin/help/devel_node_access', 'devel_node_access', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 468, 0, 0, 0, 0, 0, 0, 0),
('navigation', 469, 18, 'admin/settings/getid3', 'admin/settings/getid3', 'getID3()', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:44:"Configure settings associated with getID3().";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 469, 0, 0, 0, 0, 0, 0, 0),
('navigation', 470, 15, 'admin/help/getid3', 'admin/help/getid3', 'getid3', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 470, 0, 0, 0, 0, 0, 0, 0),
('navigation', 471, 15, 'admin/help/path', 'admin/help/path', 'path', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 471, 0, 0, 0, 0, 0, 0, 0),
('navigation', 472, 15, 'admin/help/php', 'admin/help/php', 'php', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 472, 0, 0, 0, 0, 0, 0, 0),
('navigation', 473, 17, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:144:"Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 473, 0, 0, 0, 0, 0, 0, 0),
('navigation', 474, 15, 'admin/help/upload', 'admin/help/upload', 'upload', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 474, 0, 0, 0, 0, 0, 0, 0),
('navigation', 475, 15, 'admin/help/views_ui', 'admin/help/views_ui', 'views_ui', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 475, 0, 0, 0, 0, 0, 0, 0),
('navigation', 476, 457, 'admin/settings/performance_logging/apc_clear', 'admin/settings/performance_logging/apc_clear', 'Clear APC', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Clears performance statistics collected in APC.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 457, 476, 0, 0, 0, 0, 0, 0),
('navigation', 477, 457, 'admin/settings/performance_logging/memcache_clear', 'admin/settings/performance_logging/memcache_clear', 'Clear Memcache', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:52:"Clears performance statistics collected in Memcache.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 457, 477, 0, 0, 0, 0, 0, 0),
('navigation', 478, 17, 'admin/build/views1/convert', 'admin/build/views1/convert', 'Convert view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 478, 0, 0, 0, 0, 0, 0, 0),
('navigation', 479, 10, 'admin/content/date/tools', 'admin/content/date/tools', 'Date Tools', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:52:"Tools to import and auto-create dates and calendars.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 479, 0, 0, 0, 0, 0, 0, 0),
('navigation', 480, 461, 'admin/build/path/delete', 'admin/build/path/delete', 'Delete alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 461, 480, 0, 0, 0, 0, 0, 0),
('navigation', 481, 17, 'admin/build/views1/delete', 'admin/build/views1/delete', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 481, 0, 0, 0, 0, 0, 0, 0),
('navigation', 482, 461, 'admin/build/path/edit', 'admin/build/path/edit', 'Edit alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 461, 482, 0, 0, 0, 0, 0, 0),
('devel', 483, 446, 'devel/variable/edit/%', 'devel/variable/edit/%', 'Variable editor', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 446, 483, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 484, 30, 'admin/settings/date-time/formats/lookup', 'admin/settings/date-time/formats/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 484, 0, 0, 0, 0, 0, 0),
('navigation', 485, 30, 'admin/settings/date-time/delete/%', 'admin/settings/date-time/delete/%', 'Delete date format type', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:52:"Allow users to delete a configured date format type.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 485, 0, 0, 0, 0, 0, 0),
('navigation', 486, 0, 'filefield/ahah/%/%/%', 'filefield/ahah/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 486, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 487, 473, 'admin/build/views/export/%', 'admin/build/views/export/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 487, 0, 0, 0, 0, 0, 0),
('navigation', 488, 2, 'admin/views/ajax/autocomplete/user', 'admin/views/ajax/autocomplete/user', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 488, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 489, 2, 'admin/views/ajax/autocomplete/tag', 'admin/views/ajax/autocomplete/tag', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 489, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 490, 473, 'admin/build/views/clone/%', 'admin/build/views/clone/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 490, 0, 0, 0, 0, 0, 0),
('navigation', 491, 473, 'admin/build/views/break-lock/%', 'admin/build/views/break-lock/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 491, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('navigation', 492, 473, 'admin/build/views/delete/%', 'admin/build/views/delete/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 492, 0, 0, 0, 0, 0, 0),
('navigation', 493, 473, 'admin/build/views/disable/%', 'admin/build/views/disable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 493, 0, 0, 0, 0, 0, 0),
('navigation', 494, 473, 'admin/build/views/enable/%', 'admin/build/views/enable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 494, 0, 0, 0, 0, 0, 0),
('navigation', 495, 30, 'admin/settings/date-time/formats/delete/%', 'admin/settings/date-time/formats/delete/%', 'Delete date format', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Allow users to delete a configured date format.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 495, 0, 0, 0, 0, 0, 0),
('admin_menu', 707, 693, 'admin/content/node-type/gambar-produk/fields/field_id_produk', 'admin/content/node-type/gambar-produk/fields/field_id_produk', 'Produk', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 509, 524, 688, 693, 707, 0, 0, 0, 0, 0),
('navigation', 680, 11, 'node/add/gambar-produk', 'node/add/gambar-produk', 'Gambar Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"Content type berisi gambar produk";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 680, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 497, 473, 'admin/build/views/%/add-display/%', 'admin/build/views/%/add-display/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 497, 0, 0, 0, 0, 0, 0),
('navigation', 498, 473, 'admin/build/views/%/%/%', 'admin/build/views/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 498, 0, 0, 0, 0, 0, 0),
('navigation', 499, 473, 'admin/build/views/%/analyze/%', 'admin/build/views/%/analyze/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 499, 0, 0, 0, 0, 0, 0),
('navigation', 500, 473, 'admin/build/views/%/clone-display/%', 'admin/build/views/%/clone-display/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 500, 0, 0, 0, 0, 0, 0),
('navigation', 718, 11, 'node/add/image', 'node/add/image', 'Image', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:83:"An image (with thumbnail). This is ideal for publishing photographs or screenshots.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 718, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 502, 473, 'admin/build/views/%/details/%', 'admin/build/views/%/details/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 502, 0, 0, 0, 0, 0, 0),
('navigation', 503, 473, 'admin/build/views/%/preview/%', 'admin/build/views/%/preview/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 473, 503, 0, 0, 0, 0, 0, 0),
('navigation', 681, 10, 'admin/content/node-type/gambar-produk', 'admin/content/node-type/gambar-produk', 'Gambar Produk', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 681, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 506, 0, '<front>', '', '<img class="admin-menu-icon" src="/sites/all/themes/cti_flex/favicon.ico" width="16" height="16" alt="Home" />', 'a:3:{s:11:"extra class";s:15:"admin-menu-icon";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 1, 1, 0, -100, 1, 0, 506, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 507, 0, 'logout', 'logout', 'Log out @username', 'a:3:{s:11:"extra class";s:35:"admin-menu-action admin-menu-logout";s:1:"t";a:0:{}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -100, 1, 0, 507, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 508, 0, 'user', 'user', 'icon_users', 'a:3:{s:11:"extra class";s:50:"admin-menu-action admin-menu-icon admin-menu-users";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -90, 1, 0, 508, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 509, 0, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 1, 0, 509, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 510, 0, 'admin/help', 'admin/help', 'Help', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 9, 1, 0, 510, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 511, 0, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 5, 1, 0, 511, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 512, 0, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 1, 0, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 513, 0, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -5, 1, 0, 513, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 514, 0, 'admin/user', 'admin/user', 'User management', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 1, 0, 514, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 515, 514, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 514, 515, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 516, 513, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 516, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 518, 513, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 518, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 519, 511, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 10, 2, 0, 511, 519, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 520, 512, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 520, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 521, 513, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 521, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 522, 509, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 522, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 523, 509, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 523, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 524, 509, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 524, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 525, 513, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 525, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 526, 513, 'admin/settings/devel', 'admin/settings/devel', 'Devel settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 526, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 527, 513, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 527, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 528, 513, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 528, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 529, 513, 'admin/settings/uploads', 'admin/settings/uploads', 'File uploads', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 529, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 530, 513, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 530, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 531, 513, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 531, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 532, 513, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 532, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 533, 512, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 533, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 534, 513, 'admin/settings/mimedetect', 'admin/settings/mimedetect', 'Mime type detection', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 534, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 535, 512, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 535, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 536, 513, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 536, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 537, 511, 'admin/reports/performance_logging_details', 'admin/reports/performance_logging_details', 'Performance Logs: Details', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 511, 537, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 538, 511, 'admin/reports/performance_logging_summary', 'admin/reports/performance_logging_summary', 'Performance Logs: Summary', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 511, 538, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 539, 513, 'admin/settings/performance_logging', 'admin/settings/performance_logging', 'Performance logging', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 539, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 540, 514, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 514, 540, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 541, 509, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 509, 541, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 542, 509, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 509, 542, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 543, 511, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 2, 0, 511, 543, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 544, 514, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 514, 544, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 545, 513, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 545, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 546, 513, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 546, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 547, 511, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 10, 2, 0, 511, 547, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 548, 509, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 548, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 549, 512, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 549, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 550, 511, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top \'access denied\' errors', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 511, 550, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 551, 511, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top \'page not found\' errors', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 511, 551, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 552, 512, 'admin/build/path', 'admin/build/path', 'URL aliases', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 552, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 553, 514, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 514, 553, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 554, 514, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 514, 554, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 555, 513, 'admin/settings/vertical-tabs', 'admin/settings/vertical-tabs', 'Vertical Tabs', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 555, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 556, 513, 'admin/settings/getid3', 'admin/settings/getid3', 'getID3()', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 513, 556, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 557, 512, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 557, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 558, 552, 'admin/build/path/add', 'admin/build/path/add', 'Add alias', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 552, 558, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 559, 520, 'admin/build/block/add', 'admin/build/block/add', 'Add block', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 520, 559, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 560, 524, 'admin/content/types/add', 'admin/content/types/add', 'Add content type', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 524, 560, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 561, 531, 'admin/settings/filters/add', 'admin/settings/filters/add', 'Add input format', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 513, 531, 561, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 562, 533, 'admin/build/menu/add', 'admin/build/menu/add', 'Add menu', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 533, 562, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 563, 515, 'admin/user/rules/add', 'admin/user/rules/add', 'Add rule', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 514, 515, 563, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 564, 554, 'admin/user/user/create', 'admin/user/user/create', 'Add user', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 514, 554, 564, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 565, 522, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Approval queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 522, 565, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 566, 515, 'admin/user/rules/check', 'admin/user/rules/check', 'Check rules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 514, 515, 566, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 567, 539, 'admin/settings/performance_logging/apc_clear', 'admin/settings/performance_logging/apc_clear', 'Clear APC', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 539, 567, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 568, 539, 'admin/settings/performance_logging/memcache_clear', 'admin/settings/performance_logging/memcache_clear', 'Clear Memcache', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 539, 568, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 569, 549, 'admin/build/themes/settings', 'admin/build/themes/settings', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 512, 549, 569, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 570, 532, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 532, 570, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 571, 509, 'admin/content/date/tools', 'admin/content/date/tools', 'Date Tools', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 571, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 572, 525, 'admin/settings/date-time/configure', 'admin/settings/date-time/configure', 'Date and time', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 525, 572, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 573, 524, 'admin/content/types/export', 'admin/content/types/export', 'Export', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 3, 3, 0, 509, 524, 573, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 574, 524, 'admin/content/types/fields', 'admin/content/types/fields', 'Fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 524, 574, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 575, 525, 'admin/settings/date-time/formats', 'admin/settings/date-time/formats', 'Formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 3, 0, 513, 525, 575, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 576, 524, 'admin/content/types/import', 'admin/content/types/import', 'Import', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 4, 3, 0, 509, 524, 576, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 577, 557, 'admin/build/views/import', 'admin/build/views/import', 'Import', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 557, 577, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 578, 520, 'admin/build/block/list', 'admin/build/block/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 3, 0, 512, 520, 578, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 579, 552, 'admin/build/path/list', 'admin/build/path/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 512, 552, 579, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 580, 523, 'admin/content/node/overview', 'admin/content/node/overview', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 509, 523, 580, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 581, 548, 'admin/content/taxonomy/list', 'admin/content/taxonomy/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 509, 548, 581, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 582, 524, 'admin/content/types/list', 'admin/content/types/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 509, 524, 582, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 583, 519, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 511, 519, 583, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 584, 515, 'admin/user/rules/list', 'admin/user/rules/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 514, 515, 584, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 585, 554, 'admin/user/user/list', 'admin/user/user/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 514, 554, 585, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 586, 557, 'admin/build/views/add', 'admin/build/views/add', 'Add', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 557, 586, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 587, 549, 'admin/build/themes/select', 'admin/build/themes/select', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 512, 549, 587, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 588, 535, 'admin/build/modules/list', 'admin/build/modules/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 535, 588, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 589, 557, 'admin/build/views/list', 'admin/build/views/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 512, 557, 589, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 590, 531, 'admin/settings/filters/list', 'admin/settings/filters/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 531, 590, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 591, 533, 'admin/build/menu/list', 'admin/build/menu/list', 'List menus', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 512, 533, 591, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 592, 516, 'admin/settings/actions/manage', 'admin/settings/actions/manage', 'Manage actions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -2, 3, 0, 513, 516, 592, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 593, 522, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 509, 522, 593, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 594, 533, 'admin/build/menu/settings', 'admin/build/menu/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 5, 3, 0, 512, 533, 594, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 595, 519, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 511, 519, 595, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 596, 557, 'admin/build/views/tools', 'admin/build/views/tools', 'Tools', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 512, 557, 596, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 597, 535, 'admin/build/modules/uninstall', 'admin/build/modules/uninstall', 'Uninstall', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 535, 597, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 599, 596, 'admin/build/views/tools/convert', 'admin/build/views/tools/convert', 'Convert', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 512, 557, 596, 599, 0, 0, 0, 0, 0, 0),
('admin_menu', 605, 575, 'admin/settings/date-time/formats/add', 'admin/settings/date-time/formats/add', 'Add format', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 3, 4, 0, 513, 525, 575, 605, 0, 0, 0, 0, 0, 0),
('admin_menu', 606, 578, 'admin/build/block/list/bluemarine', 'admin/build/block/list/bluemarine', 'Bluemarine', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 606, 0, 0, 0, 0, 0, 0),
('admin_menu', 607, 569, 'admin/build/themes/settings/bluemarine', 'admin/build/themes/settings/bluemarine', 'Bluemarine', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 607, 0, 0, 0, 0, 0, 0),
('admin_menu', 608, 596, 'admin/build/views/tools/export', 'admin/build/views/tools/export', 'Bulk export', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 4, 0, 512, 557, 596, 608, 0, 0, 0, 0, 0, 0),
('admin_menu', 609, 578, 'admin/build/block/list/chameleon', 'admin/build/block/list/chameleon', 'Chameleon', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 609, 0, 0, 0, 0, 0, 0),
('admin_menu', 610, 569, 'admin/build/themes/settings/chameleon', 'admin/build/themes/settings/chameleon', 'Chameleon', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 610, 0, 0, 0, 0, 0, 0),
('navigation', 712, 0, 'image_attach', 'image_attach', 'Image attachment view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 712, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 612, 575, 'admin/settings/date-time/formats/configure', 'admin/settings/date-time/formats/configure', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 513, 525, 575, 612, 0, 0, 0, 0, 0, 0),
('admin_menu', 615, 575, 'admin/settings/date-time/formats/custom', 'admin/settings/date-time/formats/custom', 'Custom formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 4, 0, 513, 525, 575, 615, 0, 0, 0, 0, 0, 0),
('admin_menu', 616, 578, 'admin/build/block/list/garland', 'admin/build/block/list/garland', 'Garland', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 616, 0, 0, 0, 0, 0, 0),
('admin_menu', 617, 569, 'admin/build/themes/settings/garland', 'admin/build/themes/settings/garland', 'Garland', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 617, 0, 0, 0, 0, 0, 0),
('admin_menu', 618, 569, 'admin/build/themes/settings/global', 'admin/build/themes/settings/global', 'Global settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 4, 0, 512, 549, 569, 618, 0, 0, 0, 0, 0, 0),
('admin_menu', 619, 578, 'admin/build/block/list/marvin', 'admin/build/block/list/marvin', 'Marvin', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 619, 0, 0, 0, 0, 0, 0),
('admin_menu', 620, 569, 'admin/build/themes/settings/marvin', 'admin/build/themes/settings/marvin', 'Marvin', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 620, 0, 0, 0, 0, 0, 0),
('admin_menu', 621, 578, 'admin/build/block/list/minnelli', 'admin/build/block/list/minnelli', 'Minnelli', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 621, 0, 0, 0, 0, 0, 0),
('admin_menu', 622, 569, 'admin/build/themes/settings/minnelli', 'admin/build/themes/settings/minnelli', 'Minnelli', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 622, 0, 0, 0, 0, 0, 0),
('admin_menu', 623, 578, 'admin/build/block/list/pushbutton', 'admin/build/block/list/pushbutton', 'Pushbutton', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 623, 0, 0, 0, 0, 0, 0),
('admin_menu', 624, 569, 'admin/build/themes/settings/pushbutton', 'admin/build/themes/settings/pushbutton', 'Pushbutton', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 624, 0, 0, 0, 0, 0, 0),
('primary-links', 849, 0, 'user/login', 'user/login', 'Login', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Klik Untuk login";}}', 'menu', 0, 0, 0, 0, -38, 1, 1, 849, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 848, 0, 'logout', 'logout', 'Exit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Klik untuk keluar dari aplikasi";}}', 'menu', 0, 0, 0, 0, -39, 1, 1, 848, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 629, 596, 'admin/build/views/tools/basic', 'admin/build/views/tools/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 4, 0, 512, 557, 596, 629, 0, 0, 0, 0, 0, 0),
('admin_menu', 630, 578, 'admin/build/block/list/globalpos', 'admin/build/block/list/globalpos', 'globalpos', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 630, 0, 0, 0, 0, 0, 0),
('admin_menu', 631, 569, 'admin/build/themes/settings/globalpos', 'admin/build/themes/settings/globalpos', 'globalpos', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 631, 0, 0, 0, 0, 0, 0),
('admin_menu', 632, 571, 'admin/content/date/tools/about', 'admin/content/date/tools/about', 'About', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -5, 3, 0, 509, 571, 632, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 633, 548, 'admin/content/taxonomy/add/vocabulary', 'admin/content/taxonomy/add/vocabulary', 'Add vocabulary', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 548, 633, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 634, 608, 'admin/build/views/tools/export/results', 'admin/build/views/tools/export/results', 'Bulk export results', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 512, 557, 596, 608, 634, 0, 0, 0, 0, 0),
('admin_menu', 635, 506, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 50, 2, 0, 506, 635, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 637, 513, 'admin/by-module', 'admin/by-module', 'By module', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 2, 0, 513, 637, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 638, 506, 'http://drupal.org', '', 'Drupal.org', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 1, 0, 100, 2, 0, 506, 638, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 639, 638, 'http://drupal.org/project/issues/drupal', '', 'Drupal issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, -10, 3, 0, 506, 638, 639, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 640, 638, 'http://drupal.org/project/issues/admin_menu', '', 'Administration menu issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 640, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 641, 638, 'http://drupal.org/project/issues/auto_nodetitle', '', 'Automatic Nodetitles issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 641, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 642, 638, 'http://drupal.org/project/issues/cck', '', 'Content issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 642, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 643, 638, 'http://drupal.org/project/issues/content_access', '', 'Content Access issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 643, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 644, 638, 'http://drupal.org/project/issues/date', '', 'Date issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 644, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 645, 638, 'http://drupal.org/project/issues/devel', '', 'Devel issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 645, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 646, 638, 'http://drupal.org/project/issues/filefield', '', 'FileField issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 646, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 647, 638, 'http://drupal.org/project/issues/getid3', '', 'getID3() issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 647, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 648, 638, 'http://drupal.org/project/issues/imagefield', '', 'ImageField issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 648, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 649, 638, 'http://drupal.org/project/issues/mimedetect', '', 'MimeDetect issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 649, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 650, 638, 'http://drupal.org/project/issues/vertical_tabs', '', 'Vertical Tabs issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 650, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 651, 638, 'http://drupal.org/project/issues/views', '', 'Views issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 651, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 652, 509, 'node/add', 'node/add', 'Create content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 652, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 693, 688, 'admin/content/node-type/gambar-produk/fields', 'admin/content/node-type/gambar-produk/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 509, 524, 688, 693, 0, 0, 0, 0, 0, 0),
('navigation', 713, 0, 'image', 'image', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 713, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 714, 0, 'contact/lightbox2', 'contact/lightbox2', 'Contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 714, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 715, 0, 'image/view', 'image/view', 'image', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 715, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 716, 0, 'system/files/imagecache', 'system/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 716, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 704, 0, 'admin/content/node-type/gambar-produk/fields/field_id_produk/remove', 'admin/content/node-type/gambar-produk/fields/field_id_produk/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 704, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 745, 509, 'admin/content/image', 'admin/content/image', 'Image galleries', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 509, 745, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 746, 509, 'admin/content/image_import', 'admin/content/image_import', 'Image import', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 509, 746, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 687, 652, 'node/add/gambar-produk', 'node/add/gambar-produk', 'Gambar Produk', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 652, 687, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 688, 524, 'admin/content/node-type/gambar-produk', 'admin/content/node-type/gambar-produk', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:13:"Gambar Produk";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 509, 524, 688, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 689, 688, 'admin/content/node-type/gambar-produk/access', 'admin/content/node-type/gambar-produk/access', 'Access control', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 509, 524, 688, 689, 0, 0, 0, 0, 0, 0),
('admin_menu', 690, 688, 'admin/content/node-type/gambar-produk/display', 'admin/content/node-type/gambar-produk/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 509, 524, 688, 690, 0, 0, 0, 0, 0, 0),
('admin_menu', 691, 690, 'admin/content/node-type/gambar-produk/display/basic', 'admin/content/node-type/gambar-produk/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 509, 524, 688, 690, 691, 0, 0, 0, 0, 0),
('admin_menu', 692, 690, 'admin/content/node-type/gambar-produk/display/rss', 'admin/content/node-type/gambar-produk/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 509, 524, 688, 690, 692, 0, 0, 0, 0, 0),
('admin_menu', 673, 506, 'devel/variable', 'devel/variable', 'Variable editor', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 20, 2, 0, 506, 673, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 674, 507, 'devel/switch/admin_pos', 'devel/switch', '<em>admin_pos</em>', 'a:3:{s:5:"query";s:93:"destination=penjualan%2Flaundry%3Ftanggal%3D2016-08-15&token=c44fc178c444ec7c77ae44e16988d218";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 507, 674, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 722, 17, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"Administer imagecache presets and actions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 722, 0, 0, 0, 0, 0, 0, 0),
('navigation', 723, 18, 'admin/settings/image', 'admin/settings/image', 'Images', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:151:"Configure the location of image files and image sizes. Also, if enabled, configure image attachments and options for image galleries and image imports.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 723, 0, 0, 0, 0, 0, 0, 0),
('navigation', 724, 18, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Lightbox2', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:51:"Allows the user to configure the lightbox2 settings";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 724, 0, 0, 0, 0, 0, 0, 0),
('navigation', 725, 0, 'user/login/lightbox2', 'user/login/lightbox2', 'Login', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 725, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 726, 15, 'admin/help/image', 'admin/help/image', 'image', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 726, 0, 0, 0, 0, 0, 0, 0),
('navigation', 727, 15, 'admin/help/image_gallery', 'admin/help/image_gallery', 'image_gallery', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 727, 0, 0, 0, 0, 0, 0, 0),
('navigation', 728, 15, 'admin/help/image_import', 'admin/help/image_import', 'image_import', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 728, 0, 0, 0, 0, 0, 0, 0),
('navigation', 729, 15, 'admin/help/imagecache_ui', 'admin/help/imagecache_ui', 'imagecache_ui', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 729, 0, 0, 0, 0, 0, 0, 0),
('navigation', 730, 15, 'admin/help/lightbox2', 'admin/help/lightbox2', 'lightbox2', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 730, 0, 0, 0, 0, 0, 0, 0),
('navigation', 731, 722, 'admin/build/imagecache/%', 'admin/build/imagecache/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 722, 731, 0, 0, 0, 0, 0, 0),
('navigation', 732, 10, 'admin/content/node-type/image', 'admin/content/node-type/image', 'Image', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 732, 0, 0, 0, 0, 0, 0, 0),
('navigation', 733, 0, 'sites/default/files/imagecache', 'sites/default/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 733, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 734, 0, 'admin/build/imagecache/%/delete', 'admin/build/imagecache/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 734, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 735, 0, 'admin/build/imagecache/%/export', 'admin/build/imagecache/%/export', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 735, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 736, 0, 'admin/build/imagecache/%/flush', 'admin/build/imagecache/%/flush', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 736, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 737, 0, 'admin/build/imagecache/%/override', 'admin/build/imagecache/%/override', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 737, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 738, 0, 'admin/build/imagecache/%/%', 'admin/build/imagecache/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 738, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 739, 0, 'admin/content/node-type/image/delete', 'admin/content/node-type/image/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 739, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 740, 719, 'admin/content/image/edit/%', 'admin/content/image/edit/%', 'Edit image gallery', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 719, 740, 0, 0, 0, 0, 0, 0),
('navigation', 741, 0, 'admin/build/imagecache/%/add/%', 'admin/build/imagecache/%/add/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 741, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 742, 0, 'admin/build/imagecache/%/%/delete', 'admin/build/imagecache/%/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 742, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 743, 0, 'admin/content/node-type/image/groups/%', 'admin/content/node-type/image/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 743, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 744, 0, 'admin/content/node-type/image/groups/%/remove', 'admin/content/node-type/image/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 744, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 747, 513, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 747, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 748, 512, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 512, 748, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 749, 513, 'admin/settings/image', 'admin/settings/image', 'Images', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 749, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 750, 513, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Lightbox2', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 750, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 751, 745, 'admin/content/image/add', 'admin/content/image/add', 'Add gallery', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 745, 751, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 752, 748, 'admin/build/imagecache/add', 'admin/build/imagecache/add', 'Add new preset', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 512, 748, 752, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 753, 750, 'admin/settings/lightbox2/automatic', 'admin/settings/lightbox2/automatic', 'Automatic image handling', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 3, 3, 0, 513, 750, 753, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 754, 747, 'admin/settings/imageapi/config', 'admin/settings/imageapi/config', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 513, 747, 754, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 755, 749, 'admin/settings/image/nodes', 'admin/settings/image/nodes', 'Files and sizes', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 513, 749, 755, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 756, 750, 'admin/settings/lightbox2/general', 'admin/settings/lightbox2/general', 'General', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 750, 756, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 757, 750, 'admin/settings/lightbox2/html_content', 'admin/settings/lightbox2/html_content', 'HTML Content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 3, 0, 513, 750, 757, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 758, 749, 'admin/settings/image/image_attach', 'admin/settings/image/image_attach', 'Image attach', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 749, 758, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 759, 749, 'admin/settings/image/image_gallery', 'admin/settings/image/image_gallery', 'Image gallery', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 749, 759, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 760, 749, 'admin/settings/image/image_import', 'admin/settings/image/image_import', 'Image import', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 513, 749, 760, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 761, 745, 'admin/content/image/list', 'admin/content/image/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 509, 745, 761, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 762, 748, 'admin/build/imagecache/list', 'admin/build/imagecache/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 512, 748, 762, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 763, 747, 'admin/settings/imageapi/list', 'admin/settings/imageapi/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 513, 747, 763, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 764, 750, 'admin/settings/lightbox2/slideshow', 'admin/settings/lightbox2/slideshow', 'Slideshow', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 513, 750, 764, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 765, 754, 'admin/settings/imageapi/config/imageapi_gd', 'admin/settings/imageapi/config/imageapi_gd', '@name', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 513, 747, 754, 765, 0, 0, 0, 0, 0, 0),
('admin_menu', 766, 754, 'admin/settings/imageapi/config/imageapi_imagemagick', 'admin/settings/imageapi/config/imageapi_imagemagick', '@name', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 513, 747, 754, 766, 0, 0, 0, 0, 0, 0),
('admin_menu', 798, 569, 'admin/build/themes/settings/cti_flex', 'admin/build/themes/settings/cti_flex', 'CTI Flex', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 798, 0, 0, 0, 0, 0, 0),
('admin_menu', 797, 578, 'admin/build/block/list/cti_flex', 'admin/build/block/list/cti_flex', 'CTI Flex', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 4, 0, 512, 520, 578, 797, 0, 0, 0, 0, 0, 0),
('admin_menu', 769, 638, 'http://drupal.org/project/issues/image', '', 'Image issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 769, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 770, 638, 'http://drupal.org/project/issues/imageapi', '', 'ImageAPI issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 770, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 771, 638, 'http://drupal.org/project/issues/imagecache', '', 'ImageCache issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 771, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 772, 638, 'http://drupal.org/project/issues/lightbox2', '', 'Lightbox2 issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 772, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 773, 652, 'node/add/image', 'node/add/image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 652, 773, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 774, 524, 'admin/content/node-type/image', 'admin/content/node-type/image', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:5:"Image";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 509, 524, 774, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 775, 774, 'admin/content/node-type/image/access', 'admin/content/node-type/image/access', 'Access control', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 509, 524, 774, 775, 0, 0, 0, 0, 0, 0),
('admin_menu', 776, 774, 'admin/content/node-type/image/display', 'admin/content/node-type/image/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 509, 524, 774, 776, 0, 0, 0, 0, 0, 0),
('admin_menu', 777, 776, 'admin/content/node-type/image/display/basic', 'admin/content/node-type/image/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 509, 524, 774, 776, 777, 0, 0, 0, 0, 0),
('admin_menu', 778, 776, 'admin/content/node-type/image/display/rss', 'admin/content/node-type/image/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 509, 524, 774, 776, 778, 0, 0, 0, 0, 0),
('admin_menu', 779, 774, 'admin/content/node-type/image/fields', 'admin/content/node-type/image/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 509, 524, 774, 779, 0, 0, 0, 0, 0, 0),
('admin_menu', 783, 693, 'admin/content/node-type/gambar-produk/fields/field_gambar_file', 'admin/content/node-type/gambar-produk/fields/field_gambar_file', 'Gambar', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 509, 524, 688, 693, 783, 0, 0, 0, 0, 0),
('navigation', 792, 0, 'testgambar', 'testgambar', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 792, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 891, 513, 'admin/settings/print', 'admin/settings/print', 'Printer, email and PDF versions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 513, 891, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 800, 578, 'admin/build/block/list/zen', 'admin/build/block/list/zen', 'Zen', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 520, 578, 800, 0, 0, 0, 0, 0, 0),
('admin_menu', 801, 569, 'admin/build/themes/settings/zen', 'admin/build/themes/settings/zen', 'Zen', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 512, 549, 569, 801, 0, 0, 0, 0, 0, 0),
('primary-links', 803, 0, 'dataproduk/produk', 'dataproduk/produk', 'Data Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Menu produk";}}', 'menu', 0, 0, 1, 1, -50, 1, 1, 803, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 804, 803, 'dataproduk/produk', 'dataproduk/produk', 'Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Data Produk";}}', 'menu', 0, 0, 0, 0, -50, 2, 1, 803, 804, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 805, 803, 'dataproduk/kategori', 'dataproduk/kategori', 'Kategori', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:15:"Kategori Produk";}}', 'menu', 0, 0, 0, 0, -49, 2, 1, 803, 805, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 806, 803, 'dataproduk/subkategori', 'dataproduk/subkategori', 'Subkategori', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Subkategori Produk";}}', 'menu', 0, 0, 0, 0, -48, 2, 1, 803, 806, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 811, 0, 'datapelanggan/pelanggan', 'datapelanggan/pelanggan', 'Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Data pelanggan";}}', 'menu', 0, 0, 0, 1, -49, 1, 1, 811, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 812, 0, 'datasupplier/supplier', 'datasupplier/supplier', 'Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:13:"Data Supplier";}}', 'menu', 0, 0, 0, 1, -48, 1, 1, 812, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 813, 0, 'pembelian/viewpembelian', 'pembelian/viewpembelian', 'Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Pembelian produk";}}', 'menu', 0, 0, 1, 1, -47, 1, 1, 813, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 814, 813, 'pembelian/viewpembelian', 'pembelian/viewpembelian', 'Data Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Data Pembelian";}}', 'menu', 0, 0, 0, 0, 0, 2, 1, 813, 814, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 815, 813, 'pembelian/kasir', 'pembelian/kasir', 'Form Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Form Pembelian Produk";}}', 'menu', 0, 0, 0, 0, 0, 2, 1, 813, 815, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 816, 0, 'penjualan/viewpenjualan', 'penjualan/viewpenjualan', 'Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Penjualan Produk";}}', 'menu', 0, 0, 1, 1, -46, 1, 1, 816, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 817, 816, 'penjualan/viewpenjualan', 'penjualan/viewpenjualan', 'Data Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Data Penjualan Produk";}}', 'menu', 0, 0, 0, 0, -50, 2, 1, 816, 817, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 818, 816, 'penjualan/kasir', 'penjualan/kasir', 'Form Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Form Penjualan";}}', 'menu', 0, 0, 0, 0, -49, 2, 1, 816, 818, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 819, 0, 'penjualan/kasir', 'penjualan/kasir', 'Kasir', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:5:"Kasir";}}', 'menu', 0, 0, 0, 0, -41, 1, 1, 819, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 820, 0, 'reproduksi/viewreproduksi', 'reproduksi/viewreproduksi', 'Reproduksi/Repacking', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Reproduksi/Repacking";}}', 'menu', 0, 0, 1, 1, -45, 1, 1, 820, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 821, 820, 'reproduksi/viewreproduksi', 'reproduksi/viewreproduksi', 'Data Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:15:"Data Reproduksi";}}', 'menu', 0, 0, 0, 0, -50, 2, 1, 820, 821, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 822, 820, 'reproduksi/kasir', 'reproduksi/kasir', 'Form Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:15:"Form reproduksi";}}', 'menu', 0, 0, 0, 0, -49, 2, 1, 820, 822, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 823, 820, 'hasilreproduksi/kasir', 'hasilreproduksi/kasir', 'Form Hasil Reproduksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Form Hasil Reproduksi";}}', 'menu', 1, 0, 0, 0, -48, 2, 1, 820, 823, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 826, 0, 'penjualan/updatepenjualan', 'penjualan/updatepenjualan', 'Update Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Update Penjualan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 826, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 829, 0, 'penjualan/deletepenjualan', 'penjualan/deletepenjualan', 'Delete Penjualan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Delete Penjualan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 829, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 834, 0, 'pembelian/deletepembelian', 'pembelian/deletepembelian', 'Delete Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Delete Pembelian";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 834, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 836, 0, 'pembelian/updatepembelian', 'pembelian/updatepembelian', 'Update Pembelian', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Update Pembelian";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 836, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 955, 0, 'keuangan/deletepengeluaran/%', 'keuangan/deletepengeluaran/%', 'Delete Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Delete Pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 955, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `cms_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('navigation', 954, 0, 'keuangan/deletepemasukan/%', 'keuangan/deletepemasukan/%', 'Delete Pemasukan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Delete Pemasukan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 954, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 952, 0, 'keuangan/viewkeuanganajax', 'keuangan/viewkeuanganajax', 'Report Keuangan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:15:"Report Keuangan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 952, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 953, 0, 'keuangan/pengeluaran', 'keuangan/pengeluaran', 'Tabel Pemasukan/Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Tabel pemasukan dan pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 953, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 892, 891, 'admin/settings/print/pdf', 'admin/settings/print/pdf', 'PDF', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 3, 3, 0, 513, 891, 892, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 852, 507, 'devel/switch/kasir', 'devel/switch', 'kasir', 'a:3:{s:5:"query";s:93:"destination=penjualan%2Flaundry%3Ftanggal%3D2016-08-15&token=921fd501c4c73a99c93e55b60daa17c6";s:4:"html";b:0;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 507, 852, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 853, 507, 'devel/switch/administrasi', 'devel/switch', 'administrasi', 'a:3:{s:5:"query";s:93:"destination=penjualan%2Flaundry%3Ftanggal%3D2016-08-15&token=155194d5cdf64d8d9dc81d3edb60a656";s:4:"html";b:0;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 507, 853, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 861, 0, 'penjualan/laundry', 'penjualan/laundry', 'Form Laundry Masuk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Form Laundry Masuk";}}', 'menu', 1, 0, 0, 0, -44, 1, 1, 861, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 858, 0, 'penjualan/laundry', 'penjualan/laundry', 'Laundry Masuk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Form laundry masuk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 858, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 862, 0, 'penjualan/simpanlaundry', 'penjualan/simpanlaundry', 'Simpan Laundry Masuk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Simpan laundry masuk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 862, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 873, 0, 'penjualan/deletelaundry', 'penjualan/deletelaundry', 'Delete Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Delete Laundry";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 873, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 867, 0, 'penjualan/viewlaundry', 'penjualan/viewlaundry', 'Data Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:12:"Data Laundry";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 867, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 870, 0, 'penjualan/detaillaundry', 'penjualan/detaillaundry', 'Detail Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Detail Laundry";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 870, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 874, 0, 'penjualan/updatelaundry', 'penjualan/updatelaundry', 'Update Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Update Laundry";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 874, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 877, 816, 'penjualan/viewlaundry', 'penjualan/viewlaundry', 'Tabel Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 1, 0, 0, 0, -46, 2, 1, 816, 877, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 878, 0, 'datapelanggan/gettotalhutang', 'datapelanggan/gettotalhutang', 'Get Total Hutang/Deposit Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:34:"Get total hutang/deposit pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 878, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 881, 0, 'print', 'print', 'Printer-friendly', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 881, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 882, 0, 'printpdf', 'printpdf', 'Printer-friendly PDF', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 882, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 883, 0, 'printmail', 'printmail', 'Send page by email', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 883, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 884, 0, 'printmail/printmail', 'printmail/printmail', '', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 884, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 885, 0, 'print/print', 'print/print', '', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 885, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 886, 0, 'printpdf/printpdf', 'printpdf/printpdf', '', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 886, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 887, 18, 'admin/settings/print', 'admin/settings/print', 'Printer, email and PDF versions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:73:"Adds a printer-friendly version link to content and administrative pages.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 887, 0, 0, 0, 0, 0, 0, 0),
('navigation', 888, 15, 'admin/help/print', 'admin/help/print', 'print', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 888, 0, 0, 0, 0, 0, 0, 0),
('navigation', 889, 15, 'admin/help/print_mail', 'admin/help/print_mail', 'print_mail', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 889, 0, 0, 0, 0, 0, 0, 0),
('navigation', 890, 15, 'admin/help/print_pdf', 'admin/help/print_pdf', 'print_pdf', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 890, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 893, 891, 'admin/settings/print/common', 'admin/settings/print/common', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 10, 3, 0, 513, 891, 893, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 894, 891, 'admin/settings/print/html', 'admin/settings/print/html', 'Web page', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 3, 0, 513, 891, 894, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 895, 891, 'admin/settings/print/email', 'admin/settings/print/email', 'email', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 3, 0, 513, 891, 895, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 897, 893, 'admin/settings/print/common/options', 'admin/settings/print/common/options', 'Options', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 513, 891, 893, 897, 0, 0, 0, 0, 0, 0),
('admin_menu', 898, 895, 'admin/settings/print/email/options', 'admin/settings/print/email/options', 'Options', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 513, 891, 895, 898, 0, 0, 0, 0, 0, 0),
('admin_menu', 899, 894, 'admin/settings/print/html/options', 'admin/settings/print/html/options', 'Options', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 513, 891, 894, 899, 0, 0, 0, 0, 0, 0),
('admin_menu', 900, 892, 'admin/settings/print/pdf/options', 'admin/settings/print/pdf/options', 'Options', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 513, 891, 892, 900, 0, 0, 0, 0, 0, 0),
('admin_menu', 901, 893, 'admin/settings/print/common/strings', 'admin/settings/print/common/strings', 'Text strings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 4, 0, 513, 891, 893, 901, 0, 0, 0, 0, 0, 0),
('admin_menu', 902, 892, 'admin/settings/print/pdf/strings', 'admin/settings/print/pdf/strings', 'Text strings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 4, 0, 513, 891, 892, 902, 0, 0, 0, 0, 0, 0),
('admin_menu', 903, 894, 'admin/settings/print/html/strings', 'admin/settings/print/html/strings', 'Text strings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 4, 0, 513, 891, 894, 903, 0, 0, 0, 0, 0, 0),
('admin_menu', 904, 895, 'admin/settings/print/email/strings', 'admin/settings/print/email/strings', 'Text strings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 4, 0, 513, 891, 895, 904, 0, 0, 0, 0, 0, 0),
('admin_menu', 906, 638, 'http://drupal.org/project/issues/print', '', 'Printer-friendly pages issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 506, 638, 906, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 907, 776, 'admin/content/node-type/image/display/print', 'admin/content/node-type/image/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 509, 524, 774, 776, 907, 0, 0, 0, 0, 0),
('admin_menu', 908, 690, 'admin/content/node-type/gambar-produk/display/print', 'admin/content/node-type/gambar-produk/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 509, 524, 688, 690, 908, 0, 0, 0, 0, 0),
('navigation', 924, 0, 'admin/content/node-type/halaman-nota/fields/field_isi_halaman/remove', 'admin/content/node-type/halaman-nota/fields/field_isi_halaman/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 924, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 909, 11, 'node/add/halaman-nota', 'node/add/halaman-nota', 'Halaman Print Nota', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"Untuk keperluan print out nota";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 909, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 910, 10, 'admin/content/node-type/halaman-nota', 'admin/content/node-type/halaman-nota', 'Halaman Print Nota', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 910, 0, 0, 0, 0, 0, 0, 0),
('navigation', 911, 0, 'admin/content/node-type/halaman-nota/delete', 'admin/content/node-type/halaman-nota/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 911, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 912, 0, 'admin/content/node-type/halaman-nota/groups/%', 'admin/content/node-type/halaman-nota/groups/%', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 912, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 913, 0, 'admin/content/node-type/halaman-nota/groups/%/remove', 'admin/content/node-type/halaman-nota/groups/%/remove', 'Edit group', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 913, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 916, 652, 'node/add/halaman-nota', 'node/add/halaman-nota', 'Halaman Print Nota', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 509, 652, 916, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 917, 524, 'admin/content/node-type/halaman-nota', 'admin/content/node-type/halaman-nota', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:18:"Halaman Print Nota";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 509, 524, 917, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 918, 917, 'admin/content/node-type/halaman-nota/access', 'admin/content/node-type/halaman-nota/access', 'Access control', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 509, 524, 917, 918, 0, 0, 0, 0, 0, 0),
('admin_menu', 919, 917, 'admin/content/node-type/halaman-nota/display', 'admin/content/node-type/halaman-nota/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 509, 524, 917, 919, 0, 0, 0, 0, 0, 0),
('admin_menu', 920, 919, 'admin/content/node-type/halaman-nota/display/basic', 'admin/content/node-type/halaman-nota/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 509, 524, 917, 919, 920, 0, 0, 0, 0, 0),
('admin_menu', 921, 919, 'admin/content/node-type/halaman-nota/display/print', 'admin/content/node-type/halaman-nota/display/print', 'Print', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 509, 524, 917, 919, 921, 0, 0, 0, 0, 0),
('admin_menu', 922, 919, 'admin/content/node-type/halaman-nota/display/rss', 'admin/content/node-type/halaman-nota/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 509, 524, 917, 919, 922, 0, 0, 0, 0, 0),
('admin_menu', 923, 917, 'admin/content/node-type/halaman-nota/fields', 'admin/content/node-type/halaman-nota/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 509, 524, 917, 923, 0, 0, 0, 0, 0, 0),
('admin_menu', 927, 923, 'admin/content/node-type/halaman-nota/fields/field_isi_halaman', 'admin/content/node-type/halaman-nota/fields/field_isi_halaman', 'Isi Halaman', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 509, 524, 917, 923, 927, 0, 0, 0, 0, 0),
('navigation', 945, 0, 'datapelanggan/synchutangpelanggan', 'datapelanggan/synchutangpelanggan', 'Sync Data Hutang Pelanggan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"Sync data hutang pelanggan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 945, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('admin_menu', 943, 507, 'devel/switch/Sarah', 'devel/switch', 'Sarah', 'a:3:{s:5:"query";s:93:"destination=penjualan%2Flaundry%3Ftanggal%3D2016-08-15&token=200302c86cfdd0a927b9274cf04bea3e";s:4:"html";b:0;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 507, 943, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 944, 0, 'dataproduk/updateproduk', 'dataproduk/updateproduk', 'Update Data Produk', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Update Data Produk";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 944, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 946, 0, 'return/kasir', 'return/kasir', 'Kasir Return', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Kasir return global pos";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 946, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 947, 813, 'return/kasir', 'return/kasir', 'Return Suplplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Form return ke supplier";}}', 'menu', 0, 0, 0, 0, 0, 2, 1, 813, 947, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 948, 0, 'pembelian/simpanreturn', 'pembelian/simpanreturn', 'Simpan Return', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Simpan return supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 948, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 949, 0, 'pembelian/viewreturnsupplier', 'pembelian/viewreturnsupplier', 'Data Return Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Data return ke supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 949, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 950, 813, 'pembelian/viewreturnsupplier', 'pembelian/viewreturnsupplier', 'Tabel Return Supplier', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Tabel return ke supplier";}}', 'menu', 0, 0, 0, 0, 0, 2, 1, 813, 950, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 951, 0, 'pembelian/detailreturnsupplier', 'pembelian/detailreturnsupplier', 'Detail Return', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Detail return supplier";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 951, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 956, 0, 'keuangan/getKategoriPengeluaran/1', 'keuangan/getKategoriPengeluaran/1', 'Get Kategori Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Get Kategori Pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 956, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 957, 0, 'keuangan/insertKategoriPengeluaran/%', 'keuangan/insertKategoriPengeluaran/%', 'Insert Kategori Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Insert Kategori Pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 957, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 958, 0, 'keuangan/insertPemasukan/%', 'keuangan/insertPemasukan/%', 'Insert Pemasukan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Insert Pemasukan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 958, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 959, 0, 'keuangan/insertPengeluaran/%', 'keuangan/insertPengeluaran/%', 'Insert Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Insert Pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 959, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 960, 0, 'keuangan/updateKategoriPengeluaran/%', 'keuangan/updateKategoriPengeluaran/%', 'Update Kategori Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Update Kategori Pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 960, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 961, 0, 'keuangan/updatePemasukan/%', 'keuangan/updatePemasukan/%', 'Update Pemasukan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Update Pemasukan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 961, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 962, 0, 'keuangan/updatePengeluaran/%', 'keuangan/updatePengeluaran/%', 'Update Pengeluaran', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Update Pengeluaran";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 962, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 963, 0, 'keuangan/pengeluaran', 'keuangan/pengeluaran', 'Keuangan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:13:"Menu keuangan";}}', 'menu', 0, 0, 0, 0, -40, 1, 1, 963, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 964, 0, 'penjualan/customerorder', 'penjualan/customerorder', 'Customer Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Form customer order";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 964, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 965, 816, 'penjualan/customerorder', 'penjualan/customerorder', 'Input Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Input customer order";}}', 'menu', 0, 0, 0, 0, -48, 2, 1, 816, 965, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 966, 0, 'penjualan/simpancustomerorder', 'penjualan/simpancustomerorder', 'Simpan Customer Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Simpan customer order";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 966, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 967, 0, 'penjualan/getrandomstring', 'penjualan/getrandomstring', 'Get Random String', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Get Random String";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 967, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 968, 0, 'penjualan/viewcustomerorder', 'penjualan/viewcustomerorder', 'Data Customer Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Data customer order";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 968, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 969, 816, 'penjualan/viewcustomerorder', 'penjualan/viewcustomerorder', 'Tabel Customer Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"View tabel customer order";}}', 'menu', 0, 0, 0, 0, -47, 2, 1, 816, 969, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 972, 0, 'admin', 'admin', 'Administrator', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -37, 1, 1, 972, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 973, 0, 'penjualan/detailcustomerorder', 'penjualan/detailcustomerorder', 'Detail Customer Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Detail customer order";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 973, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 971, 0, 'penjualan/deletecustomerorder/%', 'penjualan/deletecustomerorder/%', 'Delete Customer Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Delete Customer Order";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 971, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 974, 0, 'penjualan/carinotalaundry', 'penjualan/carinotalaundry', 'Pencarian Nota Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Pencarian Nota Laundry";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 974, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 975, 0, 'penjualan/laundrykeluar', 'penjualan/laundrykeluar', 'Pengambilan Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Form laundry keluar";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 975, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 976, 0, 'penjualan/updateraklaundry', 'penjualan/updateraklaundry', 'Update Nomer Rak Laundry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Update nomer rak laundry";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 976, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 977, 0, 'penjualan/carinotaorder', 'penjualan/carinotaorder', 'Pencarian Nota Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Pencarian Nota Order";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 977, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 978, 0, 'penjualan/orderkeluar', 'penjualan/orderkeluar', 'Pengambilan Order/Pesanan', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"Form pengambilan order/pesanan";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 978, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 979, 0, 'penjualan/orderkeluar', 'penjualan/orderkeluar', 'Pengambilan Order', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:56:"Pengambilan order/pesanan, cukup scan barcode nota order";}}', 'menu', 0, 0, 0, 0, -42, 1, 1, 979, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 980, 0, 'penjualan/orderselesai', 'penjualan/orderselesai', 'Input Hasil Produksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Form input hasil produksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 980, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('primary-links', 981, 0, 'penjualan/orderselesai', 'penjualan/orderselesai', 'Hasil Produksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Input/Scan Hasil Produksi";}}', 'menu', 0, 0, 0, 0, -43, 1, 1, 981, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 982, 0, 'penjualan/carinotaproduksi', 'penjualan/carinotaproduksi', 'Pencarian Nota Produksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:23:"Pencarian Nota Produksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 982, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 983, 0, 'penjualan/simpanhasilproduksi', 'penjualan/simpanhasilproduksi', 'Simpan Hasil Produksi', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Simpan hasil produksi";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 983, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menu_router`
--

CREATE TABLE `cms_menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_menu_router`
--

INSERT INTO `cms_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', 1, 1, '', 'node', 'Content', 't', '', 4, '', '', '', 0, ''),
('image_attach', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'image_attach_view_image', 'a:0:{}', 1, 1, '', 'image_attach', 'Image attachment view', 't', '', 4, '', '', '', 0, ''),
('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, ''),
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc'),
('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc'),
('print', '', '', 'user_access', 'a:1:{i:0;s:12:"access print";}', 'print_controller_html', 'a:0:{}', 1, 1, '', 'print', 'Printer-friendly', 't', '', 4, '', '', '', 0, 'sites/all/modules/print/print.pages.inc'),
('printpdf', '', '', 'user_access', 'a:1:{i:0;s:18:"access PDF version";}', 'print_pdf_controller', 'a:0:{}', 1, 1, '', 'printpdf', 'Printer-friendly PDF', 't', '', 4, '', '', '', 0, 'sites/all/modules/print/print_pdf/print_pdf.pages.inc'),
('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('testgambar', '', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:2:{i:0;s:16:"get_produk_image";i:1;s:6:"page_1";}', 1, 1, '', 'testgambar', '', 't', '', 4, '', '', '', 0, ''),
('image', '', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:2:{i:0;s:13:"image_gallery";i:1;s:15:"image_gallery_1";}', 1, 1, '', 'image', '', 't', '', 4, '', '', '', 0, ''),
('printmail', '', '', '_print_mail_access', 'a:1:{i:0;s:20:"access send by email";}', 'drupal_get_form', 'a:1:{i:0;s:15:"print_mail_form";}', 1, 1, '', 'printmail', 'Send page by email', 't', '', 4, '', '', '', 0, 'sites/all/modules/print/print_mail/print_mail.inc'),
('print/print', '', '', '0', 'a:0:{}', 'print_controller_html', 'a:0:{}', 3, 2, '', 'print/print', '', 't', '', 6, '', '', '', 0, 'sites/all/modules/print/print.pages.inc'),
('printmail/printmail', '', '', '0', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:15:"print_mail_form";}', 3, 2, '', 'printmail/printmail', '', 't', '', 6, '', '', '', 0, 'sites/all/modules/print/print_mail/print_mail.inc'),
('printpdf/printpdf', '', '', '0', 'a:0:{}', 'print_pdf_controller', 'a:0:{}', 3, 2, '', 'printpdf/printpdf', '', 't', '', 6, '', '', '', 0, 'sites/all/modules/print/print_pdf/print_pdf.pages.inc'),
('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('filefield/progress', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'filefield_progress', 'a:0:{}', 3, 2, '', 'filefield/progress', '', 't', '', 4, '', '', '', 0, ''),
('contact/lightbox2', '', '', 'user_access', 'a:1:{i:0;s:29:"access site-wide contact form";}', 'lightbox2_contact', 'a:0:{}', 3, 2, '', 'contact/lightbox2', 'Contact', 't', '', 4, '', '', '', 0, ''),
('upload/js', '', '', 'user_access', 'a:1:{i:0;s:12:"upload files";}', 'upload_js', 'a:0:{}', 3, 2, '', 'upload/js', '', 't', '', 4, '', '', '', 0, ''),
('user/timezone', '', '', '1', 'a:0:{}', 'user_timezone', 'a:0:{}', 3, 2, '', 'user/timezone', 'User timezone', 't', '', 4, '', '', '', 0, ''),
('userreference/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'userreference_autocomplete', 'a:0:{}', 3, 2, '', 'userreference/autocomplete', 'Userreference autocomplete', 't', '', 4, '', '', '', 0, ''),
('image/view', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'image_fetch', 'a:0:{}', 3, 2, '', 'image/view', 'image', 't', '', 4, '', '', '', 0, ''),
('content/js_add_more', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'content_add_more_js', 'a:0:{}', 3, 2, '', 'content/js_add_more', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.node_form.inc'),
('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc'),
('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc'),
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc'),
('comment/delete', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_delete', 'a:0:{}', 3, 2, '', 'comment/delete', 'Delete comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('comment/edit', '', '', 'user_access', 'a:1:{i:0;s:13:"post comments";}', 'comment_edit', 'a:0:{}', 3, 2, '', 'comment/edit', 'Edit comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('system/files', '', '', '1', 'a:1:{i:0;s:19:"view uploaded files";}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, ''),
('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', 3, 2, '', 'admin/help', 'Help', 't', '', 6, '', '', '', 9, 'modules/help/help.admin.inc'),
('nodereference/autocomplete', '', '', 'nodereference_autocomplete_access', 'a:1:{i:0;i:2;}', 'nodereference_autocomplete', 'a:0:{}', 3, 2, '', 'nodereference/autocomplete', 'Nodereference autocomplete', 't', '', 4, '', '', '', 0, ''),
('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('devel/queries', '', '', 'devel_menu_access_store_queries', 'a:0:{}', 'devel_queries', 'a:0:{}', 3, 2, '', 'devel/queries', 'Database queries', 't', '', 6, '', '', '', 0, ''),
('devel/reference', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_function_reference', 'a:0:{}', 3, 2, '', 'devel/reference', 'Function reference', 't', '', 6, '', 'View a list of currently defined user functions with documentation links.', '', 0, ''),
('penjualan/getrandomstring', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'getRandomStringAjax', 'a:0:{}', 3, 2, '', 'penjualan/getrandomstring', 'Get Random String', 't', '', 4, '', 'Get Random String', '', 0, ''),
('datapelanggan/gettotalhutang', '', '', 'user_access', 'a:1:{i:0;s:21:"Access Data Pelanggan";}', 'rest_getTotalHutang', 'a:0:{}', 3, 2, '', 'datapelanggan/gettotalhutang', 'Get Total Hutang/Deposit Pelanggan', 't', '', 4, '', 'Get total hutang/deposit pelanggan', '', 0, ''),
('devel/elements', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_elements_page', 'a:0:{}', 3, 2, '', 'devel/elements', 'Hook_elements()', 't', '', 6, '', 'View the active form/render elements for this site.', '', 0, ''),
('devel/phpinfo', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_phpinfo', 'a:0:{}', 3, 2, '', 'devel/phpinfo', 'PHPinfo()', 't', '', 6, '', 'View your server\'s PHP configuration', '', 0, ''),
('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('devel/session', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_session', 'a:0:{}', 3, 2, '', 'devel/session', 'Session viewer', 't', '', 6, '', 'List the contents of $_SESSION.', '', 0, ''),
('devel/switch', '', '', '_devel_switch_user_access', 'a:1:{i:0;i:2;}', 'devel_switch_user', 'a:0:{}', 3, 2, '', 'devel/switch', 'Switch user', 't', '', 4, '', '', '', 0, ''),
('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('devel/variable', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_variable_page', 'a:0:{}', 3, 2, '', 'devel/variable', 'Variable editor', 't', '', 6, '', 'Edit and delete site variables.', '', 0, ''),
('views/ajax', '', '', '1', 'a:0:{}', 'views_ajax', 'a:0:{}', 3, 2, '', 'views/ajax', 'Views', 't', '', 4, '', 'Ajax callback for view loading.', '', 0, 'sites/all/modules/views/includes/ajax.inc'),
('dataproduk/cekbarcode', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'cek_barcode', 'a:0:{}', 3, 2, '', 'dataproduk/cekbarcode', 'Cek Barcode', 't', '', 4, '', 'Cek Barcode', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('dataproduk/cekbarcode2', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'cek_barcode2', 'a:0:{}', 3, 2, '', 'dataproduk/cekbarcode2', 'Cek Barcode', 't', '', 4, '', 'Cek Barcode', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('dataproduk/cekkodealternatif', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'cek_kode_alt', 'a:0:{}', 3, 2, '', 'dataproduk/cekkodealternatif', 'Cek Kode Alternatif', 't', '', 4, '', 'Cek Kode Alternatif', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('datasupplier/cpsupplier', '', '', 'user_access', 'a:1:{i:0;s:29:"Admin Contact Person Supplier";}', 'data_cpsupplier', 'a:0:{}', 3, 2, '', 'datasupplier/cpsupplier', 'Contact Person Supplier', 't', '', 4, '', 'Manajemen Contact Person Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.cpsupplier.inc'),
('admin/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site\'s content.', 'left', -10, 'modules/system/system.admin.inc'),
('penjualan/customerorder', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'customerorder', 'a:0:{}', 3, 2, '', 'penjualan/customerorder', 'Customer Order', 't', '', 4, '', 'Form customer order', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('penjualan/viewcustomerorder', '', '', 'user_access', 'a:1:{i:0;s:25:"Admin Data Customer Order";}', 'view_tabel_customerorder', 'a:0:{}', 3, 2, '', 'penjualan/viewcustomerorder', 'Data Customer Order', 't', '', 4, '', 'Data customer order', '', 0, 'sites/all/modules/penjualan/globalpos.tabelcustomerorder.inc'),
('penjualan/viewlaundry', '', '', 'user_access', 'a:1:{i:0;s:27:"Admin Data Penjualan Produk";}', 'view_tabel_laundry', 'a:0:{}', 3, 2, '', 'penjualan/viewlaundry', 'Data Laundry', 't', '', 4, '', 'Data Laundry', '', 0, 'sites/all/modules/penjualan/globalpos.tabellaundry.inc'),
('reproduksi/viewreproduksi', '', '', 'user_access', 'a:1:{i:0;s:21:"Admin Data Reproduksi";}', 'view_tabel_reproduksi', 'a:0:{}', 3, 2, '', 'reproduksi/viewreproduksi', 'Data Packing Ulang', 't', '', 4, '', 'Data Reproduksi', '', 0, 'sites/all/modules/reproduksi/globalpos.reproduksi.inc'),
('datapelanggan/pelanggan', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'data_pelanggan', 'a:0:{}', 3, 2, '', 'datapelanggan/pelanggan', 'Data Pelanggan', 't', '', 4, '', 'Manajemen Data Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('pembelian/viewpembelian', '', '', 'user_access', 'a:1:{i:0;s:27:"Admin Data Pembelian Produk";}', 'view_tabel_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/viewpembelian', 'Data Pembelian', 't', '', 4, '', 'Data Pembelian', '', 0, 'sites/all/modules/pembelian/globalpos.pembelian.inc'),
('penjualan/viewpenjualan', '', '', 'user_access', 'a:1:{i:0;s:27:"Admin Data Penjualan Produk";}', 'view_tabel_penjualan', 'a:0:{}', 3, 2, '', 'penjualan/viewpenjualan', 'Data Penjualan', 't', '', 4, '', 'Data Penjualan', '', 0, 'sites/all/modules/penjualan/globalpos.penjualan.inc'),
('dataproduk/produk', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'data_produk', 'a:0:{}', 3, 2, '', 'dataproduk/produk', 'Data Produk', 't', '', 4, '', 'Manajemen Data Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('pembelian/viewreturnsupplier', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Return Produk";}', 'view_tabel_returnsupplier', 'a:0:{}', 3, 2, '', 'pembelian/viewreturnsupplier', 'Data Return Supplier', 't', '', 4, '', 'Data return ke supplier', '', 0, 'sites/all/modules/pembelian/globalpos.tabelreturn.inc'),
('datasupplier/supplier', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Supplier";}', 'data_supplier', 'a:0:{}', 3, 2, '', 'datasupplier/supplier', 'Data Supplier', 't', '', 4, '', 'Manajemen Data Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.supplier.inc'),
('penjualan/deletelaundry', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'delete_laundry', 'a:0:{}', 3, 2, '', 'penjualan/deletelaundry', 'Delete Laundry', 't', '', 4, '', 'Delete Laundry', '', 0, 'sites/all/modules/penjualan/penjualan.delete.inc'),
('pembelian/deletepembelian', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Pembelian Produk";}', 'delete_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/deletepembelian', 'Delete Pembelian', 't', '', 4, '', 'Delete Pembelian', '', 0, 'sites/all/modules/pembelian/pembelian.delete.inc'),
('penjualan/deletepenjualan', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'delete_penjualan', 'a:0:{}', 3, 2, '', 'penjualan/deletepenjualan', 'Delete Penjualan', 't', '', 4, '', 'Delete Penjualan', '', 0, 'sites/all/modules/penjualan/penjualan.delete.inc'),
('penjualan/detailcustomerorder', '', '', 'user_access', 'a:1:{i:0;s:25:"Admin Data Customer Order";}', 'detail_customerorder', 'a:0:{}', 3, 2, '', 'penjualan/detailcustomerorder', 'Detail Customer Order', 't', '', 4, '', 'Detail customer order', '', 0, 'sites/all/modules/penjualan/globalpos.tabelcustomerorder.inc'),
('hasilreproduksi/detailhasilreproduksi', '', '', 'user_access', 'a:1:{i:0;s:21:"Admin Data Reproduksi";}', 'detail_hasilreproduksi', 'a:0:{}', 3, 2, '', 'hasilreproduksi/detailhasilreproduksi', 'Detail Hasil Reproduksi', 't', '', 4, '', 'Detail Hasil Reproduksi', '', 0, 'sites/all/modules/reproduksi/globalpos.reproduksi.inc'),
('datapelanggan/detailhutang', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'detail_piutang', 'a:0:{}', 3, 2, '', 'datapelanggan/detailhutang', 'Detail Hutang Pelanggan', 't', '', 4, '', 'Detail Hutang Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('datasupplier/detailhutang', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Supplier";}', 'detail_hutang', 'a:0:{}', 3, 2, '', 'datasupplier/detailhutang', 'Detail Hutang ke Supplier', 't', '', 4, '', 'Detail Hutang ke Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.supplier.inc'),
('penjualan/detaillaundry', '', '', 'user_access', 'a:1:{i:0;s:27:"Admin Data Penjualan Produk";}', 'detail_laundry', 'a:0:{}', 3, 2, '', 'penjualan/detaillaundry', 'Detail Laundry', 't', '', 4, '', 'Detail Laundry', '', 0, 'sites/all/modules/penjualan/globalpos.tabellaundry.inc'),
('datapelanggan/detailpembayaran', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'detail_pembayaran', 'a:0:{}', 3, 2, '', 'datapelanggan/detailpembayaran', 'Detail Pembayaran Pelanggan', 't', '', 4, '', 'Detail Pembayaran Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('datasupplier/detailpembayaran', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Supplier";}', 'detail_pembayaran_hutang', 'a:0:{}', 3, 2, '', 'datasupplier/detailpembayaran', 'Detail Pembayaran ke Supplier', 't', '', 4, '', 'Detail Pembayaran ke Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.supplier.inc'),
('pembelian/detailpembelian', '', '', 'user_access', 'a:1:{i:0;s:27:"Admin Data Pembelian Produk";}', 'detail_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/detailpembelian', 'Detail Pembelian', 't', '', 4, '', 'Detail Pembelian', '', 0, 'sites/all/modules/pembelian/globalpos.pembelian.inc'),
('penjualan/detailpenjualan', '', '', 'user_access', 'a:1:{i:0;s:27:"Admin Data Penjualan Produk";}', 'detail_penjualan', 'a:0:{}', 3, 2, '', 'penjualan/detailpenjualan', 'Detail Penjualan', 't', '', 4, '', 'Detail Penjualan', '', 0, 'sites/all/modules/penjualan/globalpos.penjualan.inc'),
('reproduksi/detailreproduksi', '', '', 'user_access', 'a:1:{i:0;s:21:"Admin Data Reproduksi";}', 'detail_reproduksi', 'a:0:{}', 3, 2, '', 'reproduksi/detailreproduksi', 'Detail Reproduksi', 't', '', 4, '', 'Detail Reproduksi', '', 0, 'sites/all/modules/reproduksi/globalpos.reproduksi.inc'),
('pembelian/detailreturnsupplier', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Return Produk";}', 'detail_returnsupplier', 'a:0:{}', 3, 2, '', 'pembelian/detailreturnsupplier', 'Detail Return', 't', '', 4, '', 'Detail return supplier', '', 0, 'sites/all/modules/pembelian/globalpos.tabelreturn.inc'),
('dataproduk/editproduk', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'edit_data_produk', 'a:0:{}', 3, 2, '', 'dataproduk/editproduk', 'Edit Data Produk', 't', '', 4, '', 'Edit Data Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('devel/php', '', '', 'user_access', 'a:1:{i:0;s:16:"execute php code";}', 'drupal_get_form', 'a:1:{i:0;s:18:"devel_execute_form";}', 3, 2, '', 'devel/php', 'Execute PHP Code', 't', '', 6, '', 'Execute some PHP code', '', 0, ''),
('dataproduk/filterkategori', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'filter_kategori', 'a:0:{}', 3, 2, '', 'dataproduk/filterkategori', 'Filter Kategori', 't', '', 4, '', 'Filter Kategori', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('hasilreproduksi/kasir', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'hasilreproduksi', 'a:0:{}', 3, 2, '', 'hasilreproduksi/kasir', 'Form Hasil Packing Ulang', 't', '', 4, '', 'Form Hasil Packing Ulang', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirhasilrepro.inc'),
('datasupplier/pembayaran', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Supplier";}', 'bayar_hutang_supplier', 'a:0:{}', 3, 2, '', 'datasupplier/pembayaran', 'Form Pembayaran Hutang ke Supplier', 't', '', 4, '', 'Form Pembayaran Hutang ke Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.supplier.inc'),
('datapelanggan/pembayaran', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'bayar_hutang', 'a:0:{}', 3, 2, '', 'datapelanggan/pembayaran', 'Form Pembayaran Piutang Pelanggan', 't', '', 4, '', 'Form Pembayaran Piutang Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('reproduksi/kasir', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'reproduksi', 'a:0:{}', 3, 2, '', 'reproduksi/kasir', 'From Packing Ulang', 't', '', 4, '', 'From Packing Ulang', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirrepro.inc'),
('datapelanggan/hapusdiskon', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'hapus_diskon', 'a:0:{}', 3, 2, '', 'datapelanggan/hapusdiskon', 'Hapus Diskon Pelanggan', 't', '', 4, '', 'Hapus Diskon Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('penjualan/hitungomset', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'hitung_omset', 'a:0:{}', 3, 2, '', 'penjualan/hitungomset', 'Hitung Omset', 't', '', 4, '', 'Hitung Omset', '', 0, 'sites/all/modules/penjualan/globalpos.kasir.inc'),
('penjualan/orderselesai', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'order_selesai', 'a:0:{}', 3, 2, '', 'penjualan/orderselesai', 'Input Hasil Produksi', 't', '', 4, '', 'Form input hasil produksi', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('penjualan/kasir', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'penjualan', 'a:0:{}', 3, 2, '', 'penjualan/kasir', 'Kasir Global POS', 't', '', 4, '', 'Kasir Global POS', '', 0, 'sites/all/modules/penjualan/globalpos.kasir.inc'),
('pembelian/kasir', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Pembelian Produk";}', 'pembelian', 'a:0:{}', 3, 2, '', 'pembelian/kasir', 'Kasir Pembelian Global POS', 't', '', 4, '', 'Kasir pembelian global pos', '', 0, 'sites/all/modules/pembelian/globalpos.pembelian.inc'),
('return/kasir', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Return Produk";}', 'returnsupplier', 'a:0:{}', 3, 2, '', 'return/kasir', 'Kasir Return', 't', '', 4, '', 'Kasir return global pos', '', 0, 'sites/all/modules/pembelian/globalpos.return.inc'),
('dataproduk/kategori', '', '', 'user_access', 'a:1:{i:0;s:21:"Admin Kategori Produk";}', 'kategori_produk', 'a:0:{}', 3, 2, '', 'dataproduk/kategori', 'Kategori Produk', 't', '', 4, '', 'Manajemen Kategori Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.kategori.inc'),
('penjualan/laundry', '', '', 'user_access', 'a:1:{i:0;s:13:"Input Laundry";}', 'laundry', 'a:0:{}', 3, 2, '', 'penjualan/laundry', 'Laundry Masuk', 't', '', 4, '', 'Form laundry masuk', '', 0, 'sites/all/modules/penjualan/globalpos.laundry.inc'),
('penjualan/carinotalaundry', '', '', 'user_access', 'a:1:{i:0;s:13:"Input Laundry";}', 'cari_nota_laundry', 'a:0:{}', 3, 2, '', 'penjualan/carinotalaundry', 'Pencarian Nota Laundry', 't', '', 4, '', 'Pencarian Nota Laundry', '', 0, 'sites/all/modules/penjualan/globalpos.laundry.inc'),
('penjualan/carinotaorder', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'cari_nota_order', 'a:0:{}', 3, 2, '', 'penjualan/carinotaorder', 'Pencarian Nota Order', 't', '', 4, '', 'Pencarian Nota Order', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('penjualan/carinotaproduksi', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'cari_nota_produksi', 'a:0:{}', 3, 2, '', 'penjualan/carinotaproduksi', 'Pencarian Nota Produksi', 't', '', 4, '', 'Pencarian Nota Produksi', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('penjualan/autocaribarang', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'cari_barang', 'a:0:{}', 3, 2, '', 'penjualan/autocaribarang', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/penjualan/globalpos.kasir.inc'),
('hasilreproduksi/autocaribarang', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'cari_barang', 'a:0:{}', 3, 2, '', 'hasilreproduksi/autocaribarang', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirhasilrepro.inc'),
('reproduksi/autocaribarang', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'cari_barang', 'a:0:{}', 3, 2, '', 'reproduksi/autocaribarang', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirrepro.inc'),
('pembelian/autocaribarang', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Pembelian Produk";}', 'cari_barang_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/autocaribarang', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/pembelian/globalpos.pembelian.inc'),
('penjualan/cariproduk', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'cari_produk', 'a:0:{}', 3, 2, '', 'penjualan/cariproduk', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/penjualan/globalpos.kasir.inc'),
('hasilreproduksi/cariproduk', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'cari_produk', 'a:0:{}', 3, 2, '', 'hasilreproduksi/cariproduk', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirhasilrepro.inc'),
('reproduksi/cariproduk', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'cari_produk', 'a:0:{}', 3, 2, '', 'reproduksi/cariproduk', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirrepro.inc'),
('pembelian/cariproduk', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Pembelian Produk";}', 'cari_produk_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/cariproduk', 'Pencarian Produk', 't', '', 4, '', 'Pencarian Produk', '', 0, 'sites/all/modules/pembelian/globalpos.pembelian.inc'),
('penjualan/laundrykeluar', '', '', 'user_access', 'a:1:{i:0;s:13:"Input Laundry";}', 'laundry_keluar', 'a:0:{}', 3, 2, '', 'penjualan/laundrykeluar', 'Pengambilan Laundry', 't', '', 4, '', 'Form laundry keluar', '', 0, 'sites/all/modules/penjualan/globalpos.laundry.inc'),
('penjualan/orderkeluar', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'order_keluar', 'a:0:{}', 3, 2, '', 'penjualan/orderkeluar', 'Pengambilan Order/Pesanan', 't', '', 4, '', 'Form pengambilan order/pesanan', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('devel/reinstall', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'drupal_get_form', 'a:1:{i:0;s:15:"devel_reinstall";}', 3, 2, '', 'devel/reinstall', 'Reinstall modules', 't', '', 6, '', 'Run hook_uninstall() and then hook_install() for a given module.', '', 0, ''),
('keuangan/viewkeuanganajax', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'createReportAjax', 'a:0:{}', 3, 2, '', 'keuangan/viewkeuanganajax', 'Report Keuangan', 't', '', 4, '', 'Report Keuangan', '', 0, 'sites/all/modules/keuangan/keuangan.pengeluaran.inc'),
('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc'),
('datasupplier/simpancpsupplier', '', '', 'user_access', 'a:1:{i:0;s:29:"Admin Contact Person Supplier";}', 'simpan_cpsupplier', 'a:0:{}', 3, 2, '', 'datasupplier/simpancpsupplier', 'Simpan Contact Person Supplier', 't', '', 4, '', 'Simpan Contact Person Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.cpsupplier.inc'),
('penjualan/simpancustomerorder', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'simpan_customerorder', 'a:0:{}', 3, 2, '', 'penjualan/simpancustomerorder', 'Simpan Customer Order', 't', '', 4, '', 'Simpan customer order', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('datapelanggan/simpanpelanggan', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'simpan_pelanggan', 'a:0:{}', 3, 2, '', 'datapelanggan/simpanpelanggan', 'Simpan Data Pelanggan', 't', '', 4, '', 'Simpan Data Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('dataproduk/simpanproduk', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'simpan_produk', 'a:0:{}', 3, 2, '', 'dataproduk/simpanproduk', 'Simpan Data Produk', 't', '', 4, '', 'Simpan Data Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('datasupplier/simpansupplier', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Supplier";}', 'simpan_supplier', 'a:0:{}', 3, 2, '', 'datasupplier/simpansupplier', 'Simpan Data Supplier', 't', '', 4, '', 'Simpan Data Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.supplier.inc'),
('datapelanggan/simpandiskon', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'simpan_diskon', 'a:0:{}', 3, 2, '', 'datapelanggan/simpandiskon', 'Simpan Diskon Pelanggan', 't', '', 4, '', 'Simpan Diskon Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('penjualan/simpanhasilproduksi', '', '', 'user_access', 'a:1:{i:0;s:20:"Input Customer Order";}', 'simpan_hasil_produksi', 'a:0:{}', 3, 2, '', 'penjualan/simpanhasilproduksi', 'Simpan Hasil Produksi', 't', '', 4, '', 'Simpan hasil produksi', '', 0, 'sites/all/modules/penjualan/globalpos.customerorder.inc'),
('dataproduk/simpankategori', '', '', 'user_access', 'a:1:{i:0;s:21:"Admin Kategori Produk";}', 'simpan_kategori', 'a:0:{}', 3, 2, '', 'dataproduk/simpankategori', 'Simpan Kategori Produk', 't', '', 4, '', 'Simpan Kategori Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.kategori.inc'),
('penjualan/simpanlaundry', '', '', 'user_access', 'a:1:{i:0;s:13:"Input Laundry";}', 'simpan_laundry', 'a:0:{}', 3, 2, '', 'penjualan/simpanlaundry', 'Simpan Laundry Masuk', 't', '', 4, '', 'Simpan laundry masuk', '', 0, 'sites/all/modules/penjualan/globalpos.laundry.inc'),
('pembelian/simpanpembelian', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Pembelian Produk";}', 'simpan_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/simpanpembelian', 'Simpan Pembelian', 't', '', 4, '', 'Simpan Pembelian', '', 0, 'sites/all/modules/pembelian/globalpos.pembelian.inc'),
('penjualan/simpanpenjualan', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'simpan_penjualan', 'a:0:{}', 3, 2, '', 'penjualan/simpanpenjualan', 'Simpan Penjualan', 't', '', 4, '', 'Simpan Penjualan', '', 0, 'sites/all/modules/penjualan/globalpos.kasir.inc'),
('hasilreproduksi/simpanhasilreproduksi', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'simpan_hasilreproduksi', 'a:0:{}', 3, 2, '', 'hasilreproduksi/simpanhasilreproduksi', 'Simpan Reproduksi', 't', '', 4, '', 'Simpan Reproduksi', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirhasilrepro.inc'),
('reproduksi/simpanreproduksi', '', '', 'user_access', 'a:1:{i:0;s:23:"Admin Reproduksi Produk";}', 'simpan_reproduksi', 'a:0:{}', 3, 2, '', 'reproduksi/simpanreproduksi', 'Simpan Reproduksi', 't', '', 4, '', 'Simpan Reproduksi', '', 0, 'sites/all/modules/reproduksi/globalpos.kasirrepro.inc'),
('pembelian/simpanreturn', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Return Produk";}', 'simpan_returnsupplier', 'a:0:{}', 3, 2, '', 'pembelian/simpanreturn', 'Simpan Return', 't', '', 4, '', 'Simpan return supplier', '', 0, 'sites/all/modules/pembelian/globalpos.return.inc'),
('dataproduk/simpansatuan', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'simpan_satuan', 'a:0:{}', 3, 2, '', 'dataproduk/simpansatuan', 'Simpan Satuan', 't', '', 4, '', 'Simpan Satuan Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('dataproduk/simpansubkategori', '', '', 'user_access', 'a:1:{i:0;s:24:"Admin Subkategori Produk";}', 'simpan_subkategori', 'a:0:{}', 3, 2, '', 'dataproduk/simpansubkategori', 'Simpan Subkategori Produk', 't', '', 4, '', 'Simpan Subkategori Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.subkategori.inc'),
('admin/build', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc'),
('admin/settings', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc'),
('dataproduk/subkategori', '', '', 'user_access', 'a:1:{i:0;s:24:"Admin Subkategori Produk";}', 'subkategori_produk', 'a:0:{}', 3, 2, '', 'dataproduk/subkategori', 'Subkategori Produk', 't', '', 4, '', 'Manajemen Subkategori Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.subkategori.inc'),
('datapelanggan/synchutangpelanggan', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'syncHutangPelangganAjax', 'a:0:{}', 3, 2, '', 'datapelanggan/synchutangpelanggan', 'Sync Data Hutang Pelanggan', 't', '', 4, '', 'Sync data hutang pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('datapelanggan/tabeldiskon', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'tabel_diskon', 'a:0:{}', 3, 2, '', 'datapelanggan/tabeldiskon', 'Tabel Diskon Pelanggan', 't', '', 4, '', 'Tabel Diskon Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('keuangan/pengeluaran', '', '', 'user_access', 'a:1:{i:0;s:20:"Access Data Keuangan";}', 'tabel_pengeluaran_view', 'a:0:{}', 3, 2, '', 'keuangan/pengeluaran', 'Tabel Pemasukan/Pengeluaran', 't', '', 4, '', 'Tabel pemasukan dan pengeluaran', '', 0, 'sites/all/modules/keuangan/keuangan.pengeluaran.inc'),
('dataproduk/isitableproduk', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'tabel_produk', 'a:0:{}', 3, 2, '', 'dataproduk/isitableproduk', 'Tabel Produk', 't', '', 4, '', 'Tabel Data Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('datasupplier/updatecpsupplier', '', '', 'user_access', 'a:1:{i:0;s:29:"Admin Contact Person Supplier";}', 'update_cpsupplier', 'a:0:{}', 3, 2, '', 'datasupplier/updatecpsupplier', 'Update Contact Person Supplier', 't', '', 4, '', 'Update Contact Person Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.cpsupplier.inc'),
('datapelanggan/updatepelanggan', '', '', 'user_access', 'a:1:{i:0;s:20:"Admin Data Pelanggan";}', 'update_pelanggan', 'a:0:{}', 3, 2, '', 'datapelanggan/updatepelanggan', 'Update Data Pelanggan', 't', '', 4, '', 'Update Data Pelanggan', '', 0, 'sites/all/modules/datapelanggan/globalpos.pelanggan.inc'),
('dataproduk/updateproduk', '', '', 'user_access', 'a:1:{i:0;s:17:"Admin Data Produk";}', 'update_data_produk', 'a:0:{}', 3, 2, '', 'dataproduk/updateproduk', 'Update Data Produk', 't', '', 4, '', 'Update Data Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.produk.inc'),
('datasupplier/updatesupplier', '', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Supplier";}', 'update_supplier', 'a:0:{}', 3, 2, '', 'datasupplier/updatesupplier', 'Update Data Supplier', 't', '', 4, '', 'Update Data Supplier', '', 0, 'sites/all/modules/datasupplier/globalpos.supplier.inc'),
('dataproduk/updatekategori', '', '', 'user_access', 'a:1:{i:0;s:21:"Admin Kategori Produk";}', 'update_kategori', 'a:0:{}', 3, 2, '', 'dataproduk/updatekategori', 'Update Kategori Produk', 't', '', 4, '', 'Update Kategori Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.kategori.inc'),
('penjualan/updatelaundry', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'update_laundry', 'a:0:{}', 3, 2, '', 'penjualan/updatelaundry', 'Update Laundry', 't', '', 4, '', 'Update Laundry', '', 0, 'sites/all/modules/penjualan/penjualan.update.inc'),
('penjualan/updateraklaundry', '', '', 'user_access', 'a:1:{i:0;s:13:"Input Laundry";}', 'update_no_rak_laundry', 'a:0:{}', 3, 2, '', 'penjualan/updateraklaundry', 'Update Nomer Rak Laundry', 't', '', 4, '', 'Update nomer rak laundry', '', 0, 'sites/all/modules/penjualan/globalpos.tabellaundry.inc'),
('pembelian/updatepembelian', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Pembelian Produk";}', 'update_pembelian', 'a:0:{}', 3, 2, '', 'pembelian/updatepembelian', 'Update Pembelian', 't', '', 4, '', 'Update Pembelian', '', 0, 'sites/all/modules/pembelian/pembelian.update.inc'),
('penjualan/updatepenjualan', '', '', 'user_access', 'a:1:{i:0;s:22:"Admin Penjualan Produk";}', 'update_penjualan', 'a:0:{}', 3, 2, '', 'penjualan/updatepenjualan', 'Update Penjualan', 't', '', 4, '', 'Update Penjualan', '', 0, 'sites/all/modules/penjualan/penjualan.update.inc'),
('dataproduk/updatesubkategori', '', '', 'user_access', 'a:1:{i:0;s:24:"Admin Subkategori Produk";}', 'update_subkategori', 'a:0:{}', 3, 2, '', 'dataproduk/updatesubkategori', 'Update Subkategori Produk', 't', '', 4, '', 'Update Subkategori Produk', '', 0, 'sites/all/modules/dataproduk/globalpos.subkategori.inc'),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, ''),
('admin/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site\'s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc'),
('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc'),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, ''),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc'),
('system/files/imagecache', '', '', '1', 'a:0:{}', 'imagecache_cache_private', 'a:0:{}', 7, 3, '', 'system/files/imagecache', '', 't', '', 4, '', '', '', 0, ''),
('system/lightbox2/filter-xss', '', '', '1', 'a:0:{}', 'lightbox2_filter_xss', 'a:0:{}', 7, 3, '', 'system/lightbox2/filter-xss', 'Filter XSS', 't', '', 4, '', '', '', 0, ''),
('user/login/lightbox2', '', '', 'user_is_anonymous', 'a:0:{}', 'lightbox2_login', 'a:0:{}', 7, 3, '', 'user/login/lightbox2', 'Login', 't', '', 4, '', '', '', 0, ''),
('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, ''),
('devel/node_access/summary', '', '', 'user_access', 'a:1:{i:0;s:34:"view devel_node_access information";}', 'dna_summary', 'a:0:{}', 7, 3, '', 'devel/node_access/summary', 'Node_access summary', 't', '', 6, '', '', '', 0, ''),
('admin/reports/performance_logging_details', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'performance_view_details', 'a:0:{}', 7, 3, '', 'admin/reports/performance_logging_details', 'Performance Logs: Details', 't', '', 6, '', 'View detailed, per page, performance logs: page generation times and memory usage.', '', 0, ''),
('admin/reports/performance_logging_summary', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'performance_view_summary', 'a:0:{}', 7, 3, '', 'admin/reports/performance_logging_summary', 'Performance Logs: Summary', 't', '', 6, '', 'View summary performance logs: page generation times and memory usage.', '', 0, ''),
('date/tools/remove', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'drupal_get_form', 'a:2:{i:0;s:22:"date_tools_remove_form";i:1;i:3;}', 7, 3, '', 'date/tools/remove', 'Remove calendar', 't', '', 4, '', '', '', 0, ''),
('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, '', 'Get a status report about available updates for your installed modules and themes.', '', 10, 'modules/update/update.report.inc'),
('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site\'s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc'),
('node/%/devel', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;i:1;i:1;s:4:"node";}', 5, 3, 'node/%', 'node/%', 'Devel', 't', '', 128, '', '', '', 100, ''),
('user/%/devel', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;i:1;i:1;s:4:"user";}', 5, 3, 'user/%', 'user/%', 'Devel', 't', '', 128, '', '', '', 100, ''),
('devel/cache/clear', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_cache_clear', 'a:0:{}', 7, 3, '', 'devel/cache/clear', 'Empty cache', 't', '', 6, '', 'Clear the CSS cache and all database cache tables which store page, node, theme and variable caches.', '', 0, ''),
('devel/queries/empty', '', '', 'devel_menu_access_store_queries', 'a:0:{}', 'devel_queries_empty', 'a:0:{}', 7, 3, '', 'devel/queries/empty', 'Empty database queries', 't', '', 6, '', '', '', 0, ''),
('keuangan/getKategoriPengeluaran/1', '', '', 'user_access', 'a:1:{i:0;s:20:"Access Data Keuangan";}', 'getKategoriPengeluaran', 'a:0:{}', 7, 3, '', 'keuangan/getKategoriPengeluaran/1', 'Get Kategori Pengeluaran', 't', '', 4, '', 'Get Kategori Pengeluaran', '', 0, ''),
('admin/content/image', '', '', 'user_access', 'a:1:{i:0;s:26:"administer image galleries";}', 'image_gallery_admin', 'a:0:{}', 7, 3, '', 'admin/content/image', 'Image galleries', 't', '', 6, '', 'Create and manage image galleries.', '', 0, 'sites/all/modules/image/contrib/image_gallery/image_gallery.admin.inc'),
('admin/settings/imageapi', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 7, 3, '', 'admin/settings/imageapi', 'ImageAPI', 't', '', 6, '', 'Configure ImageAPI.', '', 0, ''),
('admin/build/imagecache', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 7, 3, '', 'admin/build/imagecache', 'ImageCache', 't', '', 6, '', 'Administer imagecache presets and actions.', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/performance_logging', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:20:"performance_settings";}', 7, 3, '', 'admin/settings/performance_logging', 'Performance logging', 't', '', 6, '', 'Logs performance data: page generation times and memory usage.', '', 0, ''),
('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc'),
('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site\'s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc'),
('taxonomy/term/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('devel/theme/registry', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_theme_registry', 'a:0:{}', 7, 3, '', 'devel/theme/registry', 'Theme registry', 't', '', 6, '', 'View a list of available theme functions across the whole site.', '', 0, ''),
('admin/build/path', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 7, 3, '', 'admin/build/path', 'URL aliases', 't', '', 6, '', 'Change your site\'s URL paths by aliasing them.', '', 0, 'modules/path/path.admin.inc'),
('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/color', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/comment', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/content', 'content', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/date', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/date', 'date', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/date_tools', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/date_tools', 'date_tools', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/devel', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/devel', 'devel', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/devel_node_access', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/devel_node_access', 'devel_node_access', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/getid3', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/getid3', 'getid3', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/image', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/image', 'image', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/image_gallery', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/image_gallery', 'image_gallery', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/image_import', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/image_import', 'image_import', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/imagecache_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/imagecache_ui', 'imagecache_ui', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/lightbox2', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/lightbox2', 'lightbox2', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/path', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/path', 'path', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/php', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/php', 'php', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `cms_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('admin/help/print', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/print', 'print', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/print_mail', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/print_mail', 'print_mail', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/print_pdf', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/print_pdf', 'print_pdf', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/update', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/update', 'update', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/upload', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/upload', 'upload', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/views_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/views_ui', 'views_ui', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc'),
('node/%/access', 'a:1:{i:1;s:9:"node_load";}', '', 'content_access_node_page_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"content_access_page";i:1;i:1;}', 5, 3, 'node/%', 'node/%', 'Access control', 't', '', 128, '', '', '', 3, 'sites/all/modules/content_access/content_access.admin.inc'),
('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site\'s content.', '', 0, 'modules/node/node.admin.inc'),
('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system\'s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc'),
('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_delete_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('keuangan/deletepemasukan/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'deletePemasukan', 'a:1:{i:0;i:2;}', 6, 3, '', 'keuangan/deletepemasukan/%', 'Delete Pemasukan', 't', '', 4, '', 'Delete Pemasukan', '', 0, ''),
('keuangan/deletepengeluaran/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'deletePengeluaran', 'a:1:{i:0;i:2;}', 6, 3, '', 'keuangan/deletepengeluaran/%', 'Delete Pengeluaran', 't', '', 4, '', 'Delete Pengeluaran', '', 0, ''),
('admin/settings/devel', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"devel_admin_settings";}', 7, 3, '', 'admin/settings/devel', 'Devel settings', 't', '', 6, '', 'Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href="/admin/build/block">block administration</a> page.', '', 0, ''),
('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc'),
('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/uploads', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"upload_admin_settings";}', 7, 3, '', 'admin/settings/uploads', 'File uploads', 't', '', 6, '', 'Control how files may be attached to content.', '', 0, 'modules/upload/upload.admin.inc'),
('admin/content/image_import', '', '', 'user_access', 'a:1:{i:0;s:13:"import images";}', 'drupal_get_form', 'a:1:{i:0;s:17:"image_import_form";}', 7, 3, '', 'admin/content/image_import', 'Image import', 't', '', 6, '', 'Import image from the filesystem.', '', 0, 'sites/all/modules/image/contrib/image_import/image_import.pages.inc'),
('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/image', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"image_admin_settings";}', 7, 3, '', 'admin/settings/image', 'Images', 't', '', 6, '', 'Configure the location of image files and image sizes. Also, if enabled, configure image attachments and options for image galleries and image imports.', '', 0, 'sites/all/modules/image/image.admin.inc'),
('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc'),
('keuangan/insertKategoriPengeluaran/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'insertKategoriPengeluaran', 'a:1:{i:0;i:1;}', 6, 3, '', 'keuangan/insertKategoriPengeluaran/%', 'Insert Kategori Pengeluaran', 't', '', 4, '', 'Insert Kategori Pengeluaran', '', 0, ''),
('keuangan/insertPemasukan/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'insertPemasukan', 'a:1:{i:0;i:1;}', 6, 3, '', 'keuangan/insertPemasukan/%', 'Insert Pemasukan', 't', '', 4, '', 'Insert Pemasukan', '', 0, ''),
('keuangan/insertPengeluaran/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'insertPengeluaran', 'a:1:{i:0;i:1;}', 6, 3, '', 'keuangan/insertPengeluaran/%', 'Insert Pengeluaran', 't', '', 4, '', 'Insert Pengeluaran', '', 0, ''),
('admin/settings/lightbox2', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'lightbox2_settings_page', 'a:0:{}', 7, 3, '', 'admin/settings/lightbox2', 'Lightbox2', 't', '', 6, '', 'Allows the user to configure the lightbox2 settings', '', 0, 'sites/all/modules/lightbox2/lightbox2.admin.inc'),
('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site\'s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc'),
('admin/settings/mimedetect', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"mimedetect_settings";}', 7, 3, '', 'admin/settings/mimedetect', 'Mime type detection', 't', '', 6, '', 'Control how the mime type of uploaded files will be determined.', '', 0, 'sites/all/modules/mimedetect/mimedetect.admin.inc'),
('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc'),
('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc'),
('admin/settings/print', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_html_settings";}', 7, 3, '', 'admin/settings/print', 'Printer, email and PDF versions', 't', '', 6, '', 'Adds a printer-friendly version link to content and administrative pages.', '', 0, 'sites/all/modules/print/print.admin.inc'),
('admin/content/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', 7, 3, '', 'admin/content/rss-publishing', 'RSS publishing', 't', '', 6, '', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc'),
('devel/menu/reset', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'drupal_get_form', 'a:1:{i:0;s:18:"devel_menu_rebuild";}', 7, 3, '', 'devel/menu/reset', 'Rebuild menus', 't', '', 6, '', 'Rebuild menu based on hook_menu() and revert any custom changes. All menu items return to their default settings.', '', 0, ''),
('comment/reply/%', 'a:1:{i:2;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:2;}', 'comment_reply', 'a:1:{i:0;i:2;}', 6, 3, '', 'comment/reply/%', 'Reply to comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc'),
('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 128, '', '', '', 2, 'modules/node/node.pages.inc'),
('admin/user/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_new_role";}', 7, 3, '', 'admin/user/roles', 'Roles', 't', '', 6, '', 'List, edit, or add user roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', 7, 3, '', 'admin/settings/site-information', 'Site information', 't', '', 6, '', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/site-maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_maintenance_settings";}', 7, 3, '', 'admin/settings/site-maintenance', 'Site maintenance', 't', '', 6, '', 'Take the site off-line for maintenance or bring it back online.', '', 0, 'modules/system/system.admin.inc'),
('admin/content/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 7, 3, '', 'admin/content/taxonomy', 'Taxonomy', 't', '', 6, '', 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 7, 3, '', 'admin/build/themes', 'Themes', 't', '', 6, '', 'Change which theme your site uses or allows users to set.', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', 7, 3, '', 'admin/reports/access-denied', 'Top \'access denied\' errors', 't', '', 6, '', 'View \'access denied\' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', 7, 3, '', 'admin/reports/page-not-found', 'Top \'page not found\' errors', 't', '', 6, '', 'View \'page not found\' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('keuangan/updateKategoriPengeluaran/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'updateKategoriPengeluaran', 'a:1:{i:0;i:1;}', 6, 3, '', 'keuangan/updateKategoriPengeluaran/%', 'Update Kategori Pengeluaran', 't', '', 4, '', 'Update Kategori Pengeluaran', '', 0, ''),
('keuangan/updatePemasukan/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'updatePemasukan', 'a:1:{i:0;i:1;}', 6, 3, '', 'keuangan/updatePemasukan/%', 'Update Pemasukan', 't', '', 4, '', 'Update Pemasukan', '', 0, ''),
('keuangan/updatePengeluaran/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:19:"Admin Data Keuangan";}', 'updatePengeluaran', 'a:1:{i:0;i:1;}', 6, 3, '', 'keuangan/updatePengeluaran/%', 'Update Pengeluaran', 't', '', 4, '', 'Update Pengeluaran', '', 0, ''),
('admin/user/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', 7, 3, '', 'admin/user/settings', 'User settings', 't', '', 6, '', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 7, 3, '', 'admin/user/user', 'Users', 't', '', 6, '', 'List, add, and edit users.', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/vertical-tabs', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"vertical_tabs_settings_form";}', 7, 3, '', 'admin/settings/vertical-tabs', 'Vertical Tabs', 't', '', 6, '', 'Configure settings for vertical tabs.', '', 0, 'sites/all/modules/vertical_tabs/vertical_tabs.admin.inc'),
('admin/build/views', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 7, 3, '', 'admin/build/views', 'Views', 't', '', 6, '', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/getid3', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:26:"getid3_admin_settings_form";i:1;N;}', 7, 3, '', 'admin/settings/getid3', 'getID3()', 't', '', 6, '', 'Configure settings associated with getID3().', '', 0, 'sites/all/modules/getid3/getid3.admin.inc'),
('penjualan/deletecustomerorder/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:25:"Admin Data Customer Order";}', 'delete_customer_order', 'a:1:{i:0;i:2;}', 6, 3, '', 'penjualan/deletecustomerorder/%', 'Delete Customer Order', 't', '', 4, '', 'Delete Customer Order', '', 0, 'sites/all/modules/penjualan/penjualan.delete.inc'),
('user/%/edit', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/settings/admin', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_admin_theme_settings";}', 7, 3, '', 'admin/settings/admin', 'Administration theme', 't', '', 6, 'system_admin_theme_settings', 'Settings for how your administrative pages should look.', 'left', 0, 'modules/system/system.admin.inc'),
('node/add/gambar-produk', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:13:"gambar_produk";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/gambar-produk', 'Gambar Produk', 'check_plain', '', 6, '', 'Content type berisi gambar produk', '', 0, 'modules/node/node.pages.inc'),
('node/add/halaman-nota', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:12:"halaman_nota";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/halaman-nota', 'Halaman Print Nota', 'check_plain', '', 6, '', 'Untuk keperluan print out nota', '', 0, 'modules/node/node.pages.inc'),
('node/add/image', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"image";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/image', 'Image', 'check_plain', '', 6, '', 'An image (with thumbnail). This is ideal for publishing photographs or screenshots.', '', 0, 'modules/node/node.pages.inc'),
('admin/build/block/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 15, 4, 'admin/build/block', 'admin/build/block', 'List', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/build/imagecache/list', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/node/overview', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 15, 4, 'admin/content/node', 'admin/content/node', 'List', 't', '', 136, '', '', '', -10, 'modules/node/node.admin.inc'),
('admin/content/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/build/path/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'List', 't', '', 136, '', '', '', -10, 'modules/path/path.admin.inc'),
('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc'),
('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/settings/imageapi/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'List', 't', '', 136, '', '', '', -1, ''),
('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc'),
('admin/settings/print/html', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_html_settings";}', 15, 4, 'admin/settings/print', 'admin/settings/print', 'Web page', 't', '', 136, '', '', '', 1, 'sites/all/modules/print/print.admin.inc'),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc'),
('admin/content/image/list', '', '', 'user_access', 'a:1:{i:0;s:26:"administer image galleries";}', 'image_gallery_admin', 'a:0:{}', 15, 4, 'admin/content/image', 'admin/content/image', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/image/contrib/image_gallery/image_gallery.admin.inc'),
('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('sites/default/files/imagecache', '', '', '_imagecache_menu_access_public_files', 'a:0:{}', 'imagecache_cache', 'a:0:{}', 15, 4, '', 'sites/default/files/imagecache', '', 't', '', 4, '', '', '', 0, ''),
('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/image/nodes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"image_admin_settings";}', 15, 4, 'admin/settings/image', 'admin/settings/image', 'Files and sizes', 't', '', 136, '', 'Configure the location of image files and image sizes.', '', -10, 'sites/all/modules/image/image.admin.inc'),
('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, ''),
('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, ''),
('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/path/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'Add alias', 't', '', 128, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/content/image/add', '', '', 'user_access', 'a:1:{i:0;s:26:"administer image galleries";}', 'image_gallery_admin_edit', 'a:0:{}', 15, 4, 'admin/content/image', 'admin/content/image', 'Add gallery', 't', '', 128, '', '', '', 0, 'sites/all/modules/image/contrib/image_gallery/image_gallery.admin.inc'),
('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc'),
('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, ''),
('admin/settings/imageapi/config', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'Configure', 't', '', 128, '', '', '', 0, ''),
('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, ''),
('admin/content/date/tools', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'date_tools_page', 'a:0:{}', 15, 4, '', 'admin/content/date/tools', 'Date Tools', 't', '', 6, '', 'Tools to import and auto-create dates and calendars.', '', 0, ''),
('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/path/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, '', 'admin/build/path/edit', 'Edit alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/content/types/export', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:24:"content_copy_export_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Export', 't', '', 128, '', '', '', 3, ''),
('admin/content/types/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_fields_list', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'Fields', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/types/import', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:24:"content_copy_import_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Import', 't', '', 128, '', '', '', 4, ''),
('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 136, '', '', '', 0, 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 4, '', '', '', 0, 'modules/update/update.fetch.inc'),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/imagecache/add', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imagecache_ui_preset_form";}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'Add new preset', 't', '', 128, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/settings/performance_logging/apc_clear', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:29:"performance_clear_apc_confirm";}', 15, 4, '', 'admin/settings/performance_logging/apc_clear', 'Clear APC', 't', '', 6, '', 'Clears performance statistics collected in APC.', '', 0, ''),
('admin/settings/performance_logging/memcache_clear', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:34:"performance_clear_memcache_confirm";}', 15, 4, '', 'admin/settings/performance_logging/memcache_clear', 'Clear Memcache', 't', '', 6, '', 'Clears performance statistics collected in Memcache.', '', 0, ''),
('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/path/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:25:"path_admin_delete_confirm";}', 15, 4, '', 'admin/build/path/delete', 'Delete alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc'),
('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc'),
('node/%/devel/load', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;i:1;i:1;s:4:"node";}', 11, 4, 'node/%/devel', 'node/%', 'Dev load', 't', '', 136, '', '', '', 0, ''),
('user/%/devel/load', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;i:1;i:1;s:4:"user";}', 11, 4, 'user/%/devel', 'user/%', 'Dev load', 't', '', 136, '', '', '', 0, ''),
('node/%/devel/render', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_render_object', 'a:2:{i:0;s:4:"node";i:1;i:1;}', 11, 4, 'node/%/devel', 'node/%', 'Dev render', 't', '', 128, '', '', '', 10, ''),
('user/%/devel/render', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_render_object', 'a:2:{i:0;s:4:"user";i:1;i:1;}', 11, 4, 'user/%/devel', 'user/%', 'Dev render', 't', '', 128, '', '', '', 10, ''),
('admin/content/node-type/gambar-produk', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:13:"gambar_produk";s:4:"name";s:13:"Gambar Produk";s:6:"module";s:4:"node";s:11:"description";s:33:"Content type berisi gambar produk";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Judul";s:8:"has_body";s:1:"1";s:10:"body_label";s:10:"Keterangan";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 15, 4, '', 'admin/content/node-type/gambar-produk', 'Gambar Produk', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/halaman-nota', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:12:"halaman_nota";s:4:"name";s:18:"Halaman Print Nota";s:6:"module";s:4:"node";s:11:"description";s:30:"Untuk keperluan print out nota";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:13:"Judul Halaman";s:8:"has_body";s:1:"0";s:10:"body_label";s:0:"";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 15, 4, '', 'admin/content/node-type/halaman-nota', 'Halaman Print Nota', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":15:{s:4:"name";s:5:"Image";s:6:"module";s:5:"image";s:11:"description";s:83:"An image (with thumbnail). This is ideal for publishing photographs or screenshots.";s:4:"type";s:5:"image";s:9:"has_title";b:1;s:11:"title_label";s:5:"Title";s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:5:"image";s:6:"is_new";b:1;}}', 15, 4, '', 'admin/content/node-type/image', 'Image', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/settings/image/image_attach', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"image_attach_admin_settings";}', 15, 4, 'admin/settings/image', 'admin/settings/image', 'Image attach', 't', '', 128, '', 'Enable image attach for content.', '', 0, ''),
('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc'),
('admin/build/views/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_page', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'Add', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/reports/updates/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:15:"update_settings";}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', 128, '', '', '', 0, 'modules/update/update.settings.inc'),
('devel/variable/edit/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'drupal_get_form', 'a:2:{i:0;s:19:"devel_variable_edit";i:1;i:3;}', 14, 4, '', 'devel/variable/edit/%', 'Variable editor', 't', '', 4, '', '', '', 0, ''),
('admin/build/views/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'List', 't', '', 136, '', '', '', -1, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/settings/date-time/configure', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 15, 4, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 't', '', 136, '', 'Settings for how Drupal displays date and time, as well as the system\'s default timezone.', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/date-time/formats', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:26:"date_api_date_formats_form";}', 15, 4, 'admin/settings/date-time', 'admin/settings/date-time', 'Formats', 't', '', 128, '', 'Allow users to configure date formats', '', 1, 'sites/all/modules/date/date_api.admin.inc'),
('admin/settings/image/image_gallery', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:28:"image_gallery_admin_settings";}', 15, 4, 'admin/settings/image', 'admin/settings/image', 'Image gallery', 't', '', 128, '', 'Configure appearance of image galleries.', '', 0, 'sites/all/modules/image/contrib/image_gallery/image_gallery.admin.inc'),
('admin/settings/image/image_import', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"image_import_admin_settings";}', 15, 4, 'admin/settings/image', 'admin/settings/image', 'Image import', 't', '', 128, '', 'Change settings for the Image Import module.', '', 0, 'sites/all/modules/image/contrib/image_import/image_import.admin.inc'),
('admin/build/views/import', '', '', 'views_import_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_import_page";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Import', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/print/pdf', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:18:"print_pdf_settings";}', 15, 4, 'admin/settings/print', 'admin/settings/print', 'PDF', 't', '', 128, '', 'Configure the settings of the PDF generation functionality.', '', 3, 'sites/all/modules/print/print_pdf/print_pdf.admin.inc'),
('admin/settings/print/common', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_main_settings";}', 15, 4, 'admin/settings/print', 'admin/settings/print', 'Settings', 't', '', 128, '', 'Settings for the common functionalities for all the print sub-modules.', '', 10, 'sites/all/modules/print/print.admin.inc'),
('admin/settings/print/email', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_mail_settings";}', 15, 4, 'admin/settings/print', 'admin/settings/print', 'email', 't', '', 128, '', 'Configure the settings of the send by email functionality.', '', 2, 'sites/all/modules/print/print_mail/print_mail.admin.inc'),
('admin/build/views/tools', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Tools', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views1/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_convert1', 'a:1:{i:0;i:4;}', 15, 4, '', 'admin/build/views1/convert', 'Convert view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/convert.inc'),
('admin/build/views1/delete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:24:"views_ui_delete1_confirm";i:1;i:4;}', 15, 4, '', 'admin/build/views1/delete', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/convert.inc'),
('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/settings/lightbox2/automatic', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:43:"lightbox2_auto_image_handling_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Automatic image handling', 't', '', 128, '', 'Allows the user to configure the lightbox2 automatic image handling settings', '', 3, 'sites/all/modules/lightbox2/lightbox2.admin.inc'),
('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/settings/lightbox2/general', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:31:"lightbox2_general_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'General', 't', '', 136, '', 'Allows the user to configure the lightbox2 settings', '', 0, 'sites/all/modules/lightbox2/lightbox2.admin.inc'),
('admin/settings/lightbox2/html_content', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:30:"lightbox2_iframe_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'HTML Content', 't', '', 128, '', 'Allows the user to configure the lightbox2 HTML content functionality.', '', 2, 'sites/all/modules/lightbox2/lightbox2.admin.inc'),
('admin/build/imagecache/%', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;}', 14, 4, '', 'admin/build/imagecache/%', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:24:"Edit preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/settings/lightbox2/slideshow', '', '', 'user_access', 'a:1:{i:0;s:20:"administer lightbox2";}', 'drupal_get_form', 'a:1:{i:0;s:33:"lightbox2_slideshow_settings_form";}', 15, 4, 'admin/settings/lightbox2', 'admin/settings/lightbox2', 'Slideshow', 't', '', 128, '', 'Allows the user to configure the lightbox2 slideshow functionality', '', 1, 'sites/all/modules/lightbox2/lightbox2.admin.inc'),
('admin/content/node-type/gambar-produk/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:13:"gambar_produk";s:4:"name";s:13:"Gambar Produk";s:6:"module";s:4:"node";s:11:"description";s:33:"Content type berisi gambar produk";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Judul";s:8:"has_body";s:1:"1";s:10:"body_label";s:10:"Keterangan";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, 'admin/content/node-type/gambar-produk', 'admin/content/node-type/gambar-produk', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/halaman-nota/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:12:"halaman_nota";s:4:"name";s:18:"Halaman Print Nota";s:6:"module";s:4:"node";s:11:"description";s:30:"Untuk keperluan print out nota";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:13:"Judul Halaman";s:8:"has_body";s:1:"0";s:10:"body_label";s:0:"";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, 'admin/content/node-type/halaman-nota', 'admin/content/node-type/halaman-nota', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/image/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":15:{s:4:"name";s:5:"Image";s:6:"module";s:5:"image";s:11:"description";s:83:"An image (with thumbnail). This is ideal for publishing photographs or screenshots.";s:4:"type";s:5:"image";s:9:"has_title";b:1;s:11:"title_label";s:5:"Title";s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:5:"image";s:6:"is_new";b:1;}}', 31, 5, 'admin/content/node-type/image', 'admin/content/node-type/image', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `cms_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('admin/build/themes/settings/global', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Global settings', 't', '', 136, '', '', '', -1, 'modules/system/system.admin.inc'),
('admin/content/taxonomy/%/list', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 29, 5, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/print/common/options', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_main_settings";}', 31, 5, 'admin/settings/print/common', 'admin/settings/print', 'Options', 't', '', 136, '', '', '', 1, 'sites/all/modules/print/print.admin.inc'),
('admin/settings/print/html/options', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_html_settings";}', 31, 5, 'admin/settings/print/html', 'admin/settings/print', 'Options', 't', '', 136, '', '', '', 1, 'sites/all/modules/print/print.admin.inc'),
('admin/settings/print/email/options', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:19:"print_mail_settings";}', 31, 5, 'admin/settings/print/email', 'admin/settings/print', 'Options', 't', '', 136, '', '', '', 1, 'sites/all/modules/print/print_mail/print_mail.admin.inc'),
('admin/settings/print/pdf/options', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:18:"print_pdf_settings";}', 31, 5, 'admin/settings/print/pdf', 'admin/settings/print', 'Options', 't', '', 136, '', '', '', 1, 'sites/all/modules/print/print_pdf/print_pdf.admin.inc'),
('admin/settings/filters/%/edit', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Edit', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/build/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 31, 5, '', 'admin/build/modules/list/confirm', 'List', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/menu-customize/%/list', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'List items', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/build/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 31, 5, '', 'admin/build/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/views/tools/export', '', '', 'user_access', 'a:1:{i:0;s:18:"use views exporter";}', 'views_export_export', 'a:0:{}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Bulk export', 't', '', 128, '', '', '', 0, ''),
('admin/settings/date-time/formats/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'date_api_date_time_lookup', 'a:0:{}', 31, 5, '', 'admin/settings/date-time/formats/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, ''),
('admin/build/themes/settings/bluemarine', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"bluemarine";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/cti_flex', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:39:"sites/all/themes/cti_flex/cti_flex.info";s:4:"name";s:8:"cti_flex";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:8:"CTI Flex";s:11:"description";s:81:"Zen sub-theme, 3-column, fluid or fixed-width.  Multiple color schemes available.";s:10:"screenshot";s:40:"sites/all/themes/cti_flex/screenshot.png";s:4:"core";s:3:"6.x";s:10:"base theme";s:3:"zen";s:11:"stylesheets";a:2:{s:3:"all";a:12:{s:18:"css/html-reset.css";s:44:"sites/all/themes/cti_flex/css/html-reset.css";s:18:"css/wireframes.css";s:44:"sites/all/themes/cti_flex/css/wireframes.css";s:12:"css/tabs.css";s:38:"sites/all/themes/cti_flex/css/tabs.css";s:16:"css/messages.css";s:42:"sites/all/themes/cti_flex/css/messages.css";s:13:"css/pages.css";s:39:"sites/all/themes/cti_flex/css/pages.css";s:21:"css/block-editing.css";s:47:"sites/all/themes/cti_flex/css/block-editing.css";s:14:"css/blocks.css";s:40:"sites/all/themes/cti_flex/css/blocks.css";s:18:"css/navigation.css";s:44:"sites/all/themes/cti_flex/css/navigation.css";s:13:"css/nodes.css";s:39:"sites/all/themes/cti_flex/css/nodes.css";s:16:"css/comments.css";s:42:"sites/all/themes/cti_flex/css/comments.css";s:13:"css/forms.css";s:39:"sites/all/themes/cti_flex/css/forms.css";s:16:"css/cti-flex.css";s:42:"sites/all/themes/cti_flex/css/cti-flex.css";}s:5:"print";a:1:{s:13:"css/print.css";s:39:"sites/all/themes/cti_flex/css/print.css";}}s:23:"conditional-stylesheets";a:2:{s:5:"if IE";a:1:{s:3:"all";a:1:{i:0;s:10:"css/ie.css";}}s:11:"if lte IE 6";a:1:{s:3:"all";a:1:{i:0;s:11:"css/ie6.css";}}}s:7:"regions";a:9:{s:13:"sidebar_first";s:20:"First sidebar (left)";s:14:"sidebar_second";s:22:"Second sidebar (right)";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:11:{s:17:"zen_block_editing";s:1:"0";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"0";s:23:"zen_breadcrumb_trailing";s:1:"0";s:20:"zen_breadcrumb_title";s:1:"0";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";s:15:"cti_flex_layout";s:5:"fixed";s:15:"cti_flex_design";s:1:"0";s:20:"cti_flex_font_family";s:1:"0";}s:7:"version";s:7:"6.x-2.3";s:7:"project";s:8:"cti_flex";s:9:"datestamp";s:10:"1287841529";s:7:"scripts";a:1:{s:9:"script.js";s:35:"sites/all/themes/cti_flex/script.js";}s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:2:{s:3:"all";a:12:{s:18:"css/html-reset.css";s:44:"sites/all/themes/cti_flex/css/html-reset.css";s:18:"css/wireframes.css";s:44:"sites/all/themes/cti_flex/css/wireframes.css";s:12:"css/tabs.css";s:38:"sites/all/themes/cti_flex/css/tabs.css";s:16:"css/messages.css";s:42:"sites/all/themes/cti_flex/css/messages.css";s:13:"css/pages.css";s:39:"sites/all/themes/cti_flex/css/pages.css";s:21:"css/block-editing.css";s:47:"sites/all/themes/cti_flex/css/block-editing.css";s:14:"css/blocks.css";s:40:"sites/all/themes/cti_flex/css/blocks.css";s:18:"css/navigation.css";s:44:"sites/all/themes/cti_flex/css/navigation.css";s:13:"css/nodes.css";s:39:"sites/all/themes/cti_flex/css/nodes.css";s:16:"css/comments.css";s:42:"sites/all/themes/cti_flex/css/comments.css";s:13:"css/forms.css";s:39:"sites/all/themes/cti_flex/css/forms.css";s:16:"css/cti-flex.css";s:42:"sites/all/themes/cti_flex/css/cti-flex.css";}s:5:"print";a:1:{s:13:"css/print.css";s:39:"sites/all/themes/cti_flex/css/print.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:3:"zen";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"cti_flex";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'CTI Flex', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/chameleon', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"chameleon";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/content/node-type/gambar-produk/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:13:"gambar_produk";s:4:"name";s:13:"Gambar Produk";s:6:"module";s:4:"node";s:11:"description";s:33:"Content type berisi gambar produk";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Judul";s:8:"has_body";s:1:"1";s:10:"body_label";s:10:"Keterangan";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, '', 'admin/content/node-type/gambar-produk/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/halaman-nota/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:12:"halaman_nota";s:4:"name";s:18:"Halaman Print Nota";s:6:"module";s:4:"node";s:11:"description";s:30:"Untuk keperluan print out nota";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:13:"Judul Halaman";s:8:"has_body";s:1:"0";s:10:"body_label";s:0:"";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, '', 'admin/content/node-type/halaman-nota/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/node-type/image/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":15:{s:4:"name";s:5:"Image";s:6:"module";s:5:"image";s:11:"description";s:83:"An image (with thumbnail). This is ideal for publishing photographs or screenshots.";s:4:"type";s:5:"image";s:9:"has_title";b:1;s:11:"title_label";s:5:"Title";s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:5:"image";s:6:"is_new";b:1;}}', 31, 5, '', 'admin/content/node-type/image/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc'),
('admin/content/taxonomy/edit/term', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_term_edit', 'a:0:{}', 31, 5, '', 'admin/content/taxonomy/edit/term', 'Edit term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/themes/settings/garland', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Garland', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/block/list/js', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display_js', 'a:0:{}', 31, 5, '', 'admin/build/block/list/js', 'JavaScript List Form', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/themes/settings/marvin', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"marvin";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/minnelli', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"minnelli";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/pushbutton', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/zen', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:29:"sites/all/themes/zen/zen.info";s:4:"name";s:3:"zen";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:3:"Zen";s:11:"description";s:194:"Zen sub-themes are the ultimate starting themes for Drupal 6. Read the <a href="http://drupal.org/node/873778">online docs</a> or the included README-FIRST.txt on how to create a theme with Zen.";s:10:"screenshot";s:49:"sites/all/themes/zen/zen-internals/screenshot.png";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:13:"First sidebar";s:14:"sidebar_second";s:14:"Second sidebar";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:7:"layouts";}}s:7:"version";s:7:"6.x-2.1";s:7:"project";s:3:"zen";s:9:"datestamp";s:10:"1302017816";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/zen/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:30:"sites/all/themes/zen/script.js";}s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/zen/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:3:"zen";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Zen', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/build/themes/settings/globalpos', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:41:"sites/all/themes/globalpos/globalpos.info";s:4:"name";s:9:"globalpos";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"globalpos";s:11:"description";s:58:"Tableless, Custom Themes For Global Point Of Sales System.";s:7:"version";s:4:"6.20";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:3:{s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:10:"base theme";s:7:"garland";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:36:"sites/all/themes/globalpos/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:36:"sites/all/themes/globalpos/script.js";}s:10:"screenshot";s:41:"sites/all/themes/globalpos/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:36:"sites/all/themes/globalpos/style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"globalpos";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'globalpos', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc'),
('admin/settings/imageapi/config/imageapi_gd', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 31, 5, 'admin/settings/imageapi/config', 'admin/settings/imageapi', '@name', 't', 'a:1:{s:5:"@name";s:12:"ImageAPI GD2";}', 136, '', '', '', 0, ''),
('admin/settings/imageapi/config/imageapi_imagemagick', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:34:"imageapi_imagemagick_settings_form";}', 31, 5, 'admin/settings/imageapi/config', 'admin/settings/imageapi', '@name', 't', 'a:1:{s:5:"@name";s:20:"ImageAPI ImageMagick";}', 128, '', '', '', 0, ''),
('admin/content/date/tools/about', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'date_tools_page', 'a:0:{}', 31, 5, 'admin/content/date/tools', 'admin/content/date/tools', 'About', 't', '', 136, '', 'Tools to import and auto-create dates and calendars.', '', -5, ''),
('filefield/ahah/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', 'filefield_edit_access', 'a:2:{i:0;i:2;i:1;i:3;}', 'filefield_js', 'a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}', 24, 5, '', 'filefield/ahah/%/%/%', '', 't', '', 4, '', '', '', 0, ''),
('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/block/list/bluemarine', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"bluemarine";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/cti_flex', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:39:"sites/all/themes/cti_flex/cti_flex.info";s:4:"name";s:8:"cti_flex";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:8:"CTI Flex";s:11:"description";s:81:"Zen sub-theme, 3-column, fluid or fixed-width.  Multiple color schemes available.";s:10:"screenshot";s:40:"sites/all/themes/cti_flex/screenshot.png";s:4:"core";s:3:"6.x";s:10:"base theme";s:3:"zen";s:11:"stylesheets";a:2:{s:3:"all";a:12:{s:18:"css/html-reset.css";s:44:"sites/all/themes/cti_flex/css/html-reset.css";s:18:"css/wireframes.css";s:44:"sites/all/themes/cti_flex/css/wireframes.css";s:12:"css/tabs.css";s:38:"sites/all/themes/cti_flex/css/tabs.css";s:16:"css/messages.css";s:42:"sites/all/themes/cti_flex/css/messages.css";s:13:"css/pages.css";s:39:"sites/all/themes/cti_flex/css/pages.css";s:21:"css/block-editing.css";s:47:"sites/all/themes/cti_flex/css/block-editing.css";s:14:"css/blocks.css";s:40:"sites/all/themes/cti_flex/css/blocks.css";s:18:"css/navigation.css";s:44:"sites/all/themes/cti_flex/css/navigation.css";s:13:"css/nodes.css";s:39:"sites/all/themes/cti_flex/css/nodes.css";s:16:"css/comments.css";s:42:"sites/all/themes/cti_flex/css/comments.css";s:13:"css/forms.css";s:39:"sites/all/themes/cti_flex/css/forms.css";s:16:"css/cti-flex.css";s:42:"sites/all/themes/cti_flex/css/cti-flex.css";}s:5:"print";a:1:{s:13:"css/print.css";s:39:"sites/all/themes/cti_flex/css/print.css";}}s:23:"conditional-stylesheets";a:2:{s:5:"if IE";a:1:{s:3:"all";a:1:{i:0;s:10:"css/ie.css";}}s:11:"if lte IE 6";a:1:{s:3:"all";a:1:{i:0;s:11:"css/ie6.css";}}}s:7:"regions";a:9:{s:13:"sidebar_first";s:20:"First sidebar (left)";s:14:"sidebar_second";s:22:"Second sidebar (right)";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:11:{s:17:"zen_block_editing";s:1:"0";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"0";s:23:"zen_breadcrumb_trailing";s:1:"0";s:20:"zen_breadcrumb_title";s:1:"0";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";s:15:"cti_flex_layout";s:5:"fixed";s:15:"cti_flex_design";s:1:"0";s:20:"cti_flex_font_family";s:1:"0";}s:7:"version";s:7:"6.x-2.3";s:7:"project";s:8:"cti_flex";s:9:"datestamp";s:10:"1287841529";s:7:"scripts";a:1:{s:9:"script.js";s:35:"sites/all/themes/cti_flex/script.js";}s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:2:{s:3:"all";a:12:{s:18:"css/html-reset.css";s:44:"sites/all/themes/cti_flex/css/html-reset.css";s:18:"css/wireframes.css";s:44:"sites/all/themes/cti_flex/css/wireframes.css";s:12:"css/tabs.css";s:38:"sites/all/themes/cti_flex/css/tabs.css";s:16:"css/messages.css";s:42:"sites/all/themes/cti_flex/css/messages.css";s:13:"css/pages.css";s:39:"sites/all/themes/cti_flex/css/pages.css";s:21:"css/block-editing.css";s:47:"sites/all/themes/cti_flex/css/block-editing.css";s:14:"css/blocks.css";s:40:"sites/all/themes/cti_flex/css/blocks.css";s:18:"css/navigation.css";s:44:"sites/all/themes/cti_flex/css/navigation.css";s:13:"css/nodes.css";s:39:"sites/all/themes/cti_flex/css/nodes.css";s:16:"css/comments.css";s:42:"sites/all/themes/cti_flex/css/comments.css";s:13:"css/forms.css";s:39:"sites/all/themes/cti_flex/css/forms.css";s:16:"css/cti-flex.css";s:42:"sites/all/themes/cti_flex/css/cti-flex.css";}s:5:"print";a:1:{s:13:"css/print.css";s:39:"sites/all/themes/cti_flex/css/print.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:3:"zen";}}', 'block_admin_display', 'a:1:{i:0;s:8:"cti_flex";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'CTI Flex', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc'),
('admin/build/block/list/chameleon', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'block_admin_display', 'a:1:{i:0;s:9:"chameleon";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/settings/date-time/formats/custom', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'date_api_configure_custom_date_formats', 'a:0:{}', 31, 5, 'admin/settings/date-time/formats', 'admin/settings/date-time', 'Custom formats', 't', '', 128, '', 'Allow users to configure custom date formats.', '', 2, 'sites/all/modules/date/date_api.admin.inc'),
('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, ''),
('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/node-type/gambar-produk/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:13:"gambar_produk";}', 31, 5, 'admin/content/node-type/gambar-produk', 'admin/content/node-type/gambar-produk', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:12:"halaman_nota";}', 31, 5, 'admin/content/node-type/halaman-nota', 'admin/content/node-type/halaman-nota', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/image/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:5:"image";}', 31, 5, 'admin/content/node-type/image', 'admin/content/node-type/image', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/image/edit/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:26:"administer image galleries";}', 'image_gallery_admin_edit', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/content/image/edit/%', 'Edit image gallery', 't', '', 4, '', '', '', 0, 'sites/all/modules/image/contrib/image_gallery/image_gallery.admin.inc'),
('admin/build/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Garland', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/content/node-type/gambar-produk/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:13:"gambar_produk";}', 31, 5, 'admin/content/node-type/gambar-produk', 'admin/content/node-type/gambar-produk', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:12:"halaman_nota";}', 31, 5, 'admin/content/node-type/halaman-nota', 'admin/content/node-type/halaman-nota', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/views/ajax/autocomplete/user', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'views_ajax_autocomplete_user', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/user', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/ajax.inc'),
('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/node-type/image/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:5:"image";}', 31, 5, 'admin/content/node-type/image', 'admin/content/node-type/image', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/build/block/list/marvin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'block_admin_display', 'a:1:{i:0;s:6:"marvin";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/minnelli', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:8:"minnelli";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/pushbutton', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"pushbutton";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc'),
('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc'),
('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_autocomplete_tag', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/tag', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/block/list/zen', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:29:"sites/all/themes/zen/zen.info";s:4:"name";s:3:"zen";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:3:"Zen";s:11:"description";s:194:"Zen sub-themes are the ultimate starting themes for Drupal 6. Read the <a href="http://drupal.org/node/873778">online docs</a> or the included README-FIRST.txt on how to create a theme with Zen.";s:10:"screenshot";s:49:"sites/all/themes/zen/zen-internals/screenshot.png";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:13:"First sidebar";s:14:"sidebar_second";s:14:"Second sidebar";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:7:"layouts";}}s:7:"version";s:7:"6.x-2.1";s:7:"project";s:3:"zen";s:9:"datestamp";s:10:"1302017816";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/zen/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:30:"sites/all/themes/zen/script.js";}s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/zen/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:3:"zen";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Zen', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/build/block/list/globalpos', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:41:"sites/all/themes/globalpos/globalpos.info";s:4:"name";s:9:"globalpos";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"globalpos";s:11:"description";s:58:"Tableless, Custom Themes For Global Point Of Sales System.";s:7:"version";s:4:"6.20";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:3:{s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:10:"base theme";s:7:"garland";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:36:"sites/all/themes/globalpos/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:36:"sites/all/themes/globalpos/script.js";}s:10:"screenshot";s:41:"sites/all/themes/globalpos/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:36:"sites/all/themes/globalpos/style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:9:"globalpos";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'globalpos', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc'),
('admin/settings/date-time/formats/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:30:"date_api_add_date_formats_form";}', 31, 5, 'admin/settings/date-time/formats', 'admin/settings/date-time', 'Add format', 't', '', 128, '', 'Allow users to add additional date formats.', '', 3, 'sites/all/modules/date/date_api.admin.inc');
INSERT INTO `cms_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES
('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/build/views/tools/basic', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Basic', 't', '', 136, '', '', '', -10, 'sites/all/modules/views/includes/admin.inc'),
('admin/content/date/tools/change', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'drupal_get_form', 'a:1:{i:0;s:27:"date_tools_change_type_form";}', 31, 5, 'admin/content/date/tools', 'admin/content/date/tools', 'Change', 't', '', 128, '', '', '', 3, 'sites/all/modules/date/date_tools/date_tools.change_type.inc'),
('admin/settings/date-time/delete/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:32:"date_api_delete_format_type_form";i:1;i:4;}', 30, 5, '', 'admin/settings/date-time/delete/%', 'Delete date format type', 't', '', 4, '', 'Allow users to delete a configured date format type.', '', 0, 'sites/all/modules/date/date_api.admin.inc'),
('admin/build/views/delete/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:23:"views_ui_delete_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/delete/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/print/html/strings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:27:"print_html_strings_settings";}', 31, 5, 'admin/settings/print/html', 'admin/settings/print', 'Text strings', 't', '', 128, '', 'Override the user-facing strings used in the printer-friendly version.', '', 2, 'sites/all/modules/print/print.admin.inc'),
('admin/build/views/break-lock/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:27:"views_ui_break_lock_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/break-lock/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/export/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:20:"views_ui_export_page";i:1;i:4;}', 30, 5, '', 'admin/build/views/export/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/clone/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_clone_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/clone/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/disable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_disable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/disable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/enable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_enable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/enable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/settings/date-time/formats/configure', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:26:"date_api_date_formats_form";}', 31, 5, 'admin/settings/date-time/formats', 'admin/settings/date-time', 'Configure', 't', '', 136, '', 'Allow users to configure date formats', '', 1, 'sites/all/modules/date/date_api.admin.inc'),
('admin/build/views/edit/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_page', 'a:1:{i:0;i:4;}', 30, 5, 'admin/build/views', 'admin/build/views', 'Edit', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/content/date/tools/import', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'drupal_get_form', 'a:1:{i:0;s:33:"date_tools_copy_import_event_form";}', 31, 5, 'admin/content/date/tools', 'admin/content/date/tools', 'Import', 't', '', 128, '', '', '', 2, 'sites/all/modules/date/date_tools/date_tools.event.inc'),
('admin/build/views/tools/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_admin_convert', 'a:0:{}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Convert', 't', '', 128, '', 'Convert stored Views 1 views.', '', 1, 'sites/all/modules/views/includes/convert.inc'),
('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, ''),
('admin/settings/print/common/strings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:27:"print_main_strings_settings";}', 31, 5, 'admin/settings/print/common', 'admin/settings/print', 'Text strings', 't', '', 128, '', 'Override the user-facing strings used by the print module.', '', 2, 'sites/all/modules/print/print.admin.inc'),
('admin/settings/print/pdf/strings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:26:"print_pdf_strings_settings";}', 31, 5, 'admin/settings/print/pdf', 'admin/settings/print', 'Text strings', 't', '', 128, '', 'Override the user-facing strings used in the PDF version.', '', 2, 'sites/all/modules/print/print_pdf/print_pdf.admin.inc'),
('admin/settings/print/email/strings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer print";}', 'drupal_get_form', 'a:1:{i:0;s:27:"print_mail_strings_settings";}', 31, 5, 'admin/settings/print/email', 'admin/settings/print', 'Text strings', 't', '', 128, '', 'Override the user-facing strings used in the send by email version.', '', 2, 'sites/all/modules/print/print_mail/print_mail.admin.inc'),
('admin/build/imagecache/%/delete', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_delete_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/delete', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Delete preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/flush', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:16:"flush imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:31:"imagecache_ui_preset_flush_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/flush', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:25:"Flush preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/gambar-produk/access', '', '', 'content_access_admin_settings_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_access_admin_settings";i:1;s:13:"gambar_produk";}', 31, 5, 'admin/content/node-type/gambar-produk', 'admin/content/node-type/gambar-produk', 'Access control', 't', '', 128, '', 'Configure content access control.', '', 1, 'sites/all/modules/content_access/content_access.admin.inc'),
('admin/build/imagecache/%/export', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_export_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/export', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Export preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/override', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;i:2;b:1;}', 29, 5, '', 'admin/build/imagecache/%/override', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:28:"Override preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/halaman-nota/access', '', '', 'content_access_admin_settings_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_access_admin_settings";i:1;s:12:"halaman_nota";}', 31, 5, 'admin/content/node-type/halaman-nota', 'admin/content/node-type/halaman-nota', 'Access control', 't', '', 128, '', 'Configure content access control.', '', 1, 'sites/all/modules/content_access/content_access.admin.inc'),
('admin/content/node-type/image/access', '', '', 'content_access_admin_settings_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_access_admin_settings";i:1;s:5:"image";}', 31, 5, 'admin/content/node-type/image', 'admin/content/node-type/image', 'Access control', 't', '', 128, '', 'Configure content access control.', '', 1, 'sites/all/modules/content_access/content_access.admin.inc'),
('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc'),
('admin/build/imagecache/%/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_action_form";i:1;i:3;i:2;i:4;}', 28, 5, '', 'admin/build/imagecache/%/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"!action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/date/tools/date_wizard', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'drupal_get_form', 'a:1:{i:0;s:22:"date_tools_wizard_form";}', 31, 5, 'admin/content/date/tools', 'admin/content/date/tools', 'Date wizard', 't', '', 128, '', 'Easy creation of date content types and calendars.', '', 1, 'sites/all/modules/date/date_tools/date_tools.wizard.inc'),
('admin/content/node-type/gambar-produk/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:13:"gambar_produk";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/gambar-produk/display', 'admin/content/node-type/gambar-produk', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:12:"halaman_nota";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/halaman-nota/display', 'admin/content/node-type/halaman-nota', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/image/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"image";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/image/display', 'admin/content/node-type/image', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/build/views/tools/export/results', '', '', 'user_access', 'a:1:{i:0;s:18:"use views exporter";}', 'views_export_export', 'a:0:{}', 63, 6, 'admin/build/views/tools/export', 'admin/build/views', 'Bulk export results', 't', '', 128, '', '', '', 0, ''),
('admin/content/node-type/gambar-produk/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:13:"gambar_produk";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/gambar-produk/display', 'admin/content/node-type/gambar-produk', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:12:"halaman_nota";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/halaman-nota/display', 'admin/content/node-type/halaman-nota', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/image/display/print', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"image";i:2;s:5:"print";}', 63, 6, 'admin/content/node-type/image/display', 'admin/content/node-type/image', 'Print', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/gambar-produk/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:13:"gambar_produk";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/gambar-produk/display', 'admin/content/node-type/gambar-produk', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:12:"halaman_nota";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/halaman-nota/display', 'admin/content/node-type/halaman-nota', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/image/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"image";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/image/display', 'admin/content/node-type/image', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/gambar-produk/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:13:"gambar_produk";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/gambar-produk/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/halaman-nota/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:12:"halaman_nota";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/halaman-nota/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/image/groups/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:26:"fieldgroup_group_edit_form";i:1;s:5:"image";i:2;i:5;}', 62, 6, '', 'admin/content/node-type/image/groups/%', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/content/node-type/gambar-produk/fields/field_gambar_file', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:13:"gambar_produk";i:2;s:17:"field_gambar_file";}', 63, 6, 'admin/content/node-type/gambar-produk/fields', 'admin/content/node-type/gambar-produk', 'Gambar', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/fields/field_isi_halaman', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:12:"halaman_nota";i:2;s:17:"field_isi_halaman";}', 63, 6, 'admin/content/node-type/halaman-nota/fields', 'admin/content/node-type/halaman-nota', 'Isi Halaman', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/gambar-produk/fields/field_id_produk', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:13:"gambar_produk";i:2;s:15:"field_id_produk";}', 63, 6, 'admin/content/node-type/gambar-produk/fields', 'admin/content/node-type/gambar-produk', 'Produk', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/build/views/%/add-display/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_display', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/add-display/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/%/%', 'a:3:{i:3;s:16:"views_ui_js_load";i:4;N;i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_form', 'a:3:{i:0;i:3;i:1;i:4;i:2;i:5;}', 56, 6, '', 'admin/build/views/%/%/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/analyze/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_analyze_view', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/analyze/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/clone-display/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_clone_display', 'a:3:{i:0;i:3;i:1;i:5;i:2;i:6;}', 58, 6, '', 'admin/build/views/%/clone-display/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/details/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_details', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/details/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/build/views/%/preview/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_preview', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/preview/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/settings/date-time/formats/delete/%', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:27:"date_api_delete_format_form";i:1;i:5;}', 62, 6, '', 'admin/settings/date-time/formats/delete/%', 'Delete date format', 't', '', 4, '', 'Allow users to delete a configured date format.', '', 0, 'sites/all/modules/date/date_api.admin.inc'),
('admin/content/date/tools/import/event', '', '', 'user_access', 'a:1:{i:0;s:21:"administer date tools";}', 'drupal_get_form', 'a:1:{i:0;s:33:"date_tools_copy_import_event_form";}', 63, 6, 'admin/content/date/tools/import', 'admin/content/date/tools', 'Event import', 't', '', 128, '', '', '', 3, 'sites/all/modules/date/date_tools/date_tools.event.inc'),
('admin/build/imagecache/%/add/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:5;N;}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_action_add_page', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/imagecache/%/add/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"Add !actionname to !presetname";i:1;i:3;i:2;i:5;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/build/imagecache/%/%/delete', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:32:"imagecache_ui_action_delete_form";i:1;i:3;i:2;i:4;}', 57, 6, '', 'admin/build/imagecache/%/%/delete', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:37:"Delete !action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc'),
('admin/content/node-type/gambar-produk/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:13:"gambar_produk";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/gambar-produk/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/halaman-nota/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:12:"halaman_nota";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/halaman-nota/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/image/groups/%/remove', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"fieldgroup_remove_group";i:1;s:5:"image";i:2;i:5;}', 125, 7, '', 'admin/content/node-type/image/groups/%/remove', 'Edit group', 't', '', 4, '', '', '', 0, ''),
('admin/content/node-type/gambar-produk/fields/field_gambar_file/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:13:"gambar_produk";i:2;s:17:"field_gambar_file";}', 127, 7, '', 'admin/content/node-type/gambar-produk/fields/field_gambar_file/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/gambar-produk/fields/field_id_produk/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:13:"gambar_produk";i:2;s:15:"field_id_produk";}', 127, 7, '', 'admin/content/node-type/gambar-produk/fields/field_id_produk/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc'),
('admin/content/node-type/halaman-nota/fields/field_isi_halaman/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:12:"halaman_nota";i:2;s:17:"field_isi_halaman";}', 127, 7, '', 'admin/content/node-type/halaman-nota/fields/field_isi_halaman/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');

-- --------------------------------------------------------

--
-- Table structure for table `cms_node`
--

CREATE TABLE `cms_node` (
  `nid` int(10) UNSIGNED NOT NULL,
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_node`
--

INSERT INTO `cms_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES
(3, 3, 'gambar_produk', '', 'Rautan kecil', 1, 1, 1333923947, 1333923947, 0, 0, 0, 0, 0, 0),
(4, 4, 'image', '', 'Indomie rasa baso', 1, 1, 1333924802, 1333924802, 2, 0, 0, 0, 0, 0),
(5, 5, 'gambar_produk', '', 'Indomie Rasa Baso', 1, 1, 1333924832, 1333924832, 0, 0, 0, 0, 0, 0),
(6, 6, 'halaman_nota', '', 'Halaman Print Nota', 1, 1, 1454857971, 1477638215, 0, 0, 0, 0, 0, 0),
(7, 7, 'gambar_produk', '', 'SIDP Spesial 2', 0, 1, 1477659834, 1477659834, 0, 0, 0, 0, 0, 0),
(8, 8, 'gambar_produk', '', 'SIDP Oman 2', 0, 1, 1477660371, 1477660371, 0, 0, 0, 0, 0, 0),
(9, 9, 'gambar_produk', '', 'SIDP Polos 2', 0, 1, 1477660675, 1477660675, 0, 0, 0, 0, 0, 0),
(10, 10, 'gambar_produk', '', 'SIDP Biasa 2', 1, 1, 1477660899, 1477661107, 0, 0, 0, 0, 0, 0),
(11, 11, 'image', '', 'songkokikhwanspesial2.jpg', 1, 1, 1477660979, 1477660979, 2, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_access`
--

CREATE TABLE `cms_node_access` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_node_access`
--

INSERT INTO `cms_node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES
(3, 0, 'all', 1, 0, 0),
(4, 0, 'all', 1, 0, 0),
(5, 0, 'all', 1, 0, 0),
(6, 0, 'all', 1, 0, 0),
(7, 0, 'all', 1, 0, 0),
(8, 0, 'all', 1, 0, 0),
(9, 0, 'all', 1, 0, 0),
(10, 0, 'all', 1, 0, 0),
(11, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_comment_statistics`
--

CREATE TABLE `cms_node_comment_statistics` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_node_comment_statistics`
--

INSERT INTO `cms_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES
(3, 1333923947, NULL, 1, 0),
(4, 1333924802, NULL, 1, 0),
(5, 1333924832, NULL, 1, 0),
(6, 1454857971, NULL, 1, 0),
(7, 1477659834, NULL, 0, 0),
(8, 1477660371, NULL, 0, 0),
(9, 1477660675, NULL, 0, 0),
(10, 1477660899, NULL, 1, 0),
(11, 1477660979, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_counter`
--

CREATE TABLE `cms_node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `daycount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_revisions`
--

CREATE TABLE `cms_node_revisions` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_node_revisions`
--

INSERT INTO `cms_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES
(4, 4, 1, 'Indomie rasa baso', '', '', '', 1333924802, 0),
(3, 3, 1, 'Rautan kecil', 'Rautan warna warni ukuran kecil', '', '', 1333923947, 0),
(5, 5, 1, 'Indomie Rasa Baso', '', '', '', 1333924832, 1),
(6, 6, 1, 'Halaman Print Nota', '', '', '', 1477638215, 0),
(7, 7, 1, 'SIDP Spesial 2', '', '', '', 1477659834, 0),
(8, 8, 1, 'SIDP Oman 2', 'test', '', '', 1477660371, 0),
(9, 9, 1, 'SIDP Polos 2', 'test', '', '', 1477660675, 0),
(10, 10, 1, 'SIDP Biasa 2', 'Test', 'Test', '', 1477661107, 1),
(11, 11, 1, 'songkokikhwanspesial2.jpg', '', '', '', 1477660979, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_node_type`
--

CREATE TABLE `cms_node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) UNSIGNED NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) UNSIGNED NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) UNSIGNED NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_node_type`
--

INSERT INTO `cms_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES
('gambar_produk', 'Gambar Produk', 'node', 'Content type berisi gambar produk', '', 1, 'Judul', 1, 'Keterangan', 0, 1, 1, 0, ''),
('image', 'Image', 'image', 'An image (with thumbnail). This is ideal for publishing photographs or screenshots.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'image'),
('halaman_nota', 'Halaman Print Nota', 'node', 'Untuk keperluan print out nota', '', 1, 'Judul Halaman', 0, '', 0, 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cms_pemasukan`
--

CREATE TABLE `cms_pemasukan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` int(10) UNSIGNED DEFAULT '0',
  `tglpemasukan` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `keterangan` varchar(255) NOT NULL DEFAULT 'Pemasukan Lain',
  `nilai` decimal(32,0) UNSIGNED NOT NULL,
  `created` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `changed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pengeluaran`
--

CREATE TABLE `cms_pengeluaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keterangan` varchar(255) NOT NULL DEFAULT 'Keterangan Pengeluaran',
  `kategori` int(10) UNSIGNED DEFAULT '0',
  `nilai` decimal(32,0) UNSIGNED NOT NULL,
  `tglpengeluaran` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `changed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_performance_detail`
--

CREATE TABLE `cms_performance_detail` (
  `pid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `bytes` int(11) NOT NULL DEFAULT '0',
  `ms` int(11) NOT NULL DEFAULT '0',
  `query_count` int(11) NOT NULL DEFAULT '0',
  `query_timer` int(11) NOT NULL DEFAULT '0',
  `anon` int(11) DEFAULT '1',
  `path` varchar(255) DEFAULT NULL,
  `data` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_performance_summary`
--

CREATE TABLE `cms_performance_summary` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `last_access` int(11) NOT NULL DEFAULT '0',
  `bytes_max` int(11) NOT NULL DEFAULT '0',
  `bytes_avg` int(11) NOT NULL DEFAULT '0',
  `ms_max` int(11) NOT NULL DEFAULT '0',
  `ms_avg` int(11) NOT NULL DEFAULT '0',
  `query_count_max` int(11) NOT NULL DEFAULT '0',
  `query_count_avg` int(11) NOT NULL DEFAULT '0',
  `query_timer_max` int(11) NOT NULL DEFAULT '0',
  `query_timer_avg` int(11) NOT NULL DEFAULT '0',
  `num_accesses` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_permission`
--

CREATE TABLE `cms_permission` (
  `pid` int(11) NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_permission`
--

INSERT INTO `cms_permission` (`pid`, `rid`, `perm`, `tid`) VALUES
(13, 1, 'access content', 0),
(14, 2, 'access comments, post comments, post comments without approval, Access Data Pelanggan, access content', 0),
(15, 3, 'Access Data Pelanggan, Admin Contact Person Pelanggan, Admin Data Pelanggan, Admin Data Produk, Admin Kategori Produk, Admin Subkategori Produk, Admin Contact Person Supplier, Admin Data Supplier, Admin Data Pembelian Produk, Admin Data Penjualan Produk, Admin Penjualan Produk, Input Laundry, access all views', 0),
(16, 4, 'Access Data Pelanggan, Admin Contact Person Pelanggan, Admin Data Pelanggan, Admin Data Produk, Admin Kategori Produk, Admin Subkategori Produk, Admin Contact Person Supplier, Admin Data Supplier, create images, delete any images, delete own images, edit any images, edit own images, view original images, attach images, administer image galleries, Access Data Keuangan, Admin Data Keuangan, access content, Admin Data Pembelian Produk, Admin Pembelian Produk, Admin Data Penjualan Produk, Admin Penjualan Produk, Input Laundry, Admin Data Reproduksi, Admin Reproduksi Produk, upload files, view uploaded files, access all views', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_print_mail_node_conf`
--

CREATE TABLE `cms_print_mail_node_conf` (
  `nid` int(10) UNSIGNED NOT NULL,
  `link` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `comments` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `url_list` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_print_mail_node_conf`
--

INSERT INTO `cms_print_mail_node_conf` (`nid`, `link`, `comments`, `url_list`) VALUES
(6, 1, 0, 1),
(7, 1, 0, 1),
(8, 1, 0, 1),
(9, 1, 0, 1),
(10, 1, 0, 1),
(11, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_print_mail_page_counter`
--

CREATE TABLE `cms_print_mail_page_counter` (
  `path` varchar(128) NOT NULL,
  `totalcount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sentcount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `sent_timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_print_node_conf`
--

CREATE TABLE `cms_print_node_conf` (
  `nid` int(10) UNSIGNED NOT NULL,
  `link` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `comments` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `url_list` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_print_node_conf`
--

INSERT INTO `cms_print_node_conf` (`nid`, `link`, `comments`, `url_list`) VALUES
(6, 1, 0, 1),
(7, 1, 0, 1),
(8, 1, 0, 1),
(9, 1, 0, 1),
(10, 1, 0, 1),
(11, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_print_page_counter`
--

CREATE TABLE `cms_print_page_counter` (
  `path` varchar(128) NOT NULL,
  `totalcount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_print_page_counter`
--

INSERT INTO `cms_print_page_counter` (`path`, `totalcount`, `timestamp`) VALUES
('node/6', 7479, 1477751116),
('node/6/5', 7, 1454864475);

-- --------------------------------------------------------

--
-- Table structure for table `cms_print_pdf_node_conf`
--

CREATE TABLE `cms_print_pdf_node_conf` (
  `nid` int(10) UNSIGNED NOT NULL,
  `link` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `comments` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `url_list` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_print_pdf_node_conf`
--

INSERT INTO `cms_print_pdf_node_conf` (`nid`, `link`, `comments`, `url_list`) VALUES
(6, 1, 0, 1),
(7, 1, 0, 1),
(8, 1, 0, 1),
(9, 1, 0, 1),
(10, 1, 0, 1),
(11, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_print_pdf_page_counter`
--

CREATE TABLE `cms_print_pdf_page_counter` (
  `path` varchar(128) NOT NULL,
  `totalcount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_role`
--

CREATE TABLE `cms_role` (
  `rid` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_role`
--

INSERT INTO `cms_role` (`rid`, `name`) VALUES
(1, 'anonymous user'),
(2, 'authenticated user'),
(3, 'kasir'),
(4, 'administrasi');

-- --------------------------------------------------------

--
-- Table structure for table `cms_semaphore`
--

CREATE TABLE `cms_semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_sessions`
--

CREATE TABLE `cms_sessions` (
  `uid` int(10) UNSIGNED NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_sessions`
--

INSERT INTO `cms_sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(1, 'hh1p2car5scl7067vba30m4m03', '::1', 1474534901, 0, ''),
(1, '54enr3qcc58trprsr172dkbn94', '::1', 1474681830, 0, ''),
(1, 'h3id1p1jevlok9hvrbca3l9n86', '192.168.1.101', 1474679444, 0, ''),
(1, '4jtpuiu1j66js98saqrvhi53j5', '127.0.0.1', 1475893333, 0, ''),
(1, 'd6j3emu08n7815kq1q2els7604', '127.0.0.1', 1477452383, 0, ''),
(1, 'bv56hi9fgb1h4dva9p31p2fcj7', '127.0.0.1', 1477454889, 0, ''),
(1, 'v62l17akntjjur4h5orkthsnv3', '127.0.0.1', 1477751399, 0, 'node_overview_filter|a:1:{i:0;a:2:{i:0;s:4:"type";i:1;s:13:"gambar_produk";}}dblog_overview_filter|a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_system`
--

CREATE TABLE `cms_system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_system`
--

INSERT INTO `cms_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('sites/all/modules/datasupplier/datasupplier.module', 'datasupplier', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:12:"datasupplier";s:11:"description";s:26:"Data Supplier by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/penjualan/penjualan.module', 'penjualan', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:9:"penjualan";s:11:"description";s:22:"Penjualan by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/dataproduk/dataproduk.module', 'dataproduk', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:10:"dataproduk";s:11:"description";s:24:"Data Produk by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('modules/system/system.module', 'system', 'module', '', 1, 0, 0, 6055, 0, 'a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/block/block.module', 'block', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blog/blog.module', 'blog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/blogapi/blogapi.module', 'blogapi', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/book/book.module', 'book', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/color/color.module', 'color', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/contact/contact.module', 'contact', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/locale/locale.module', 'locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.38";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/path/path.module', 'path', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/php/php.module', 'php', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/profile/profile.module', 'profile', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/search/search.module', 'search', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/throttle/throttle.module', 'throttle', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/translation/translation.module', 'translation', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/update/update.module', 'update', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.38";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/upload/upload.module', 'upload', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('modules/user/user.module', 'user', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/pembelian/pembelian.module', 'pembelian', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:9:"pembelian";s:11:"description";s:22:"Pembelian by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('themes/pushbutton/pushbutton.info', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/garland/minnelli/minnelli.info', 'minnelli', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}'),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/marvin/marvin.info', 'marvin', 'theme', '', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/chameleon/chameleon.info', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('themes/bluemarine/bluemarine.info', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.38";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1456343372";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/admin_menu/admin_menu.module', 'admin_menu', 'module', '', 0, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:19:"Administration menu";s:11:"description";s:123:"Provides a dropdown menu to most administrative tasks and other common destinations (to users with the proper permissions).";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:10:"admin_menu";s:9:"datestamp";s:10:"1308238014";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/globalpos/globalpos.info', 'globalpos', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:9:"globalpos";s:11:"description";s:58:"Tableless, Custom Themes For Global Point Of Sales System.";s:7:"version";s:4:"6.20";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:3:{s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:10:"base theme";s:7:"garland";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:36:"sites/all/themes/globalpos/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:36:"sites/all/themes/globalpos/script.js";}s:10:"screenshot";s:41:"sites/all/themes/globalpos/screenshot.png";s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/datapelanggan/datapelanggan.module', 'datapelanggan', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:13:"datapelanggan";s:11:"description";s:27:"Data Pelanggan by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/reproduksi/reproduksi.module', 'reproduksi', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:10:"reproduksi";s:11:"description";s:33:"Reproduksi/Repacking by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/auto_nodetitle/auto_nodetitle.module', 'auto_nodetitle', 'module', '', 1, 0, 0, 1, 5, 'a:9:{s:4:"name";s:20:"Automatic Nodetitles";s:11:"description";s:70:"Allows hiding of the content title field and automatic title creation.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:14:"auto_nodetitle";s:9:"datestamp";s:10:"1249042505";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/content.module', 'content', 'module', '', 1, 0, 0, 6010, 0, 'a:10:{s:4:"name";s:7:"Content";s:11:"description";s:50:"Allows administrators to define new content types.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/views.module', 'views', 'module', '', 1, 0, 0, 6013, 10, 'a:10:{s:4:"name";s:5:"Views";s:11:"description";s:55:"Create customized lists and queries from your database.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.16";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1321305946";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/views_export/views_export.module', 'views_export', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:14:"Views exporter";s:11:"description";s:40:"Allows exporting multiple views at once.";s:7:"package";s:5:"Views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.16";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1321305946";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/tests/views_test.module', 'views_test', 'module', '', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:10:"Views Test";s:11:"description";s:22:"Test module for Views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:6:"hidden";b:1;s:5:"files";a:2:{i:0;s:17:"views_test.module";i:1;s:18:"views_test.install";}s:7:"version";s:7:"6.x-3.0";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1325638545";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/views/views_ui.module', 'views_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Views UI";s:11:"description";s:93:"Administrative interface to views. Without this module, you cannot create or edit your views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:7:"version";s:8:"6.x-2.16";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1321305946";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/content_access/content_access.module', 'content_access', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Content Access";s:11:"description";s:40:"Provides flexible content access control";s:7:"package";s:14:"Access control";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:14:"content_access";s:9:"datestamp";s:10:"1249035332";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/content_copy/content_copy.module', 'content_copy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"Content Copy";s:11:"description";s:51:"Enables ability to import/export field definitions.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/content_permissions/content_permissions.module', 'content_permissions', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content Permissions";s:11:"description";s:43:"Set field-level permissions for CCK fields.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date/date.module', 'date', 'module', '', 1, 0, 0, 6005, 0, 'a:10:{s:4:"name";s:4:"Date";s:11:"description";s:41:"Defines CCK date/time fields and widgets.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:8:"date_api";i:2;s:13:"date_timezone";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_api.module', 'date_api', 'module', '', 1, 0, 0, 6006, 0, 'a:10:{s:4:"name";s:8:"Date API";s:11:"description";s:45:"A Date API that can be used by other modules.";s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_locale/date_locale.module', 'date_locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:11:"Date Locale";s:11:"description";s:124:"Allows the site admin to configure multiple formats for date/time display to tailor dates for a specific locale or audience.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:2:{i:0;s:8:"date_api";i:1;s:6:"locale";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_php4/date_php4.module', 'date_php4', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:9:"Date PHP4";s:11:"description";s:134:"Emulate PHP 5.2 date functions in PHP 4.x, PHP 5.0, and PHP 5.1. Required when using the Date API with PHP versions less than PHP 5.2.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_popup/date_popup.module', 'date_popup', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Date Popup";s:11:"description";s:84:"Enables jquery popup calendars and time entry widgets for selecting dates and times.";s:12:"dependencies";a:3:{i:0;s:8:"date_api";i:1;s:13:"date_timezone";i:2;s:9:"jquery_ui";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_repeat/date_repeat.module', 'date_repeat', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:15:"Date Repeat API";s:11:"description";s:73:"A Date Repeat API to calculate repeating dates and times from iCal rules.";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_timezone/date_timezone.module', 'date_timezone', 'module', '', 1, 0, 0, 5200, 0, 'a:10:{s:4:"name";s:13:"Date Timezone";s:11:"description";s:111:"Needed when using Date API. Overrides site and user timezone handling to set timezone names instead of offsets.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/date/date_tools/date_tools.module', 'date_tools', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:10:"Date Tools";s:11:"description";s:52:"Tools to import and auto-create dates and calendars.";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:4:"date";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.10";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1396284252";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/devel/devel.module', 'devel', 'module', '', 1, 0, 1, 6003, 88, 'a:10:{s:4:"name";s:5:"Devel";s:11:"description";s:52:"Various blocks, pages, and functions for developers.";s:7:"package";s:11:"Development";s:12:"dependencies";a:1:{i:0;s:4:"menu";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.28";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1391635706";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/devel/devel_generate.module', 'devel_generate', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Devel generate";s:11:"description";s:48:"Generate dummy users, nodes, and taxonomy terms.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.28";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1391635706";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/devel/devel_node_access.module', 'devel_node_access', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:17:"Devel node access";s:11:"description";s:67:"Developer block and page illustrating relevant node_access records.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.28";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1391635706";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/devel_themer/devel_themer.module', 'devel_themer', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:15:"Theme developer";s:11:"description";s:52:"Essential theme API information for theme developers";s:7:"package";s:11:"Development";s:12:"dependencies";a:1:{i:0;s:5:"devel";}s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-1.x-dev";s:7:"project";s:12:"devel_themer";s:9:"datestamp";s:10:"1289390809";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/fieldgroup/fieldgroup.module', 'fieldgroup', 'module', '', 1, 0, 0, 6007, 9, 'a:10:{s:4:"name";s:10:"Fieldgroup";s:11:"description";s:37:"Create display groups for CCK fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/filefield/filefield.module', 'filefield', 'module', '', 1, 0, 0, 6104, 0, 'a:10:{s:4:"name";s:9:"FileField";s:11:"description";s:26:"Defines a file field type.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:8:"6.x-3.13";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1405541029";s:10:"dependents";a:0:{}}'),
('sites/all/modules/filefield/filefield_meta/filefield_meta.module', 'filefield_meta', 'module', '', 1, 0, 0, 6100, 0, 'a:10:{s:4:"name";s:14:"FileField Meta";s:11:"description";s:48:"Add metadata gathering and storage to FileField.";s:12:"dependencies";a:2:{i:0;s:9:"filefield";i:1;s:6:"getid3";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:8:"6.x-3.13";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1405541029";s:10:"dependents";a:0:{}}'),
('sites/all/modules/imagefield/imagefield.module', 'imagefield', 'module', '', 1, 0, 0, 6006, 0, 'a:10:{s:4:"name";s:10:"ImageField";s:11:"description";s:28:"Defines an image field type.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:9:"filefield";}s:7:"package";s:3:"CCK";s:7:"version";s:8:"6.x-3.11";s:7:"project";s:10:"imagefield";s:9:"datestamp";s:10:"1365969012";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/mimedetect/mimedetect.module', 'mimedetect', 'module', '', 1, 0, 0, 0, 0, 'a:9:{s:4:"name";s:10:"MimeDetect";s:11:"description";s:53:"Provides common mime type detection for Drupal sites.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.3";s:7:"project";s:10:"mimedetect";s:9:"datestamp";s:10:"1274907008";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/nodereference/nodereference.module', 'nodereference', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Node Reference";s:11:"description";s:59:"Defines a field type for referencing one node from another.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/number/number.module', 'number', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:6:"Number";s:11:"description";s:28:"Defines numeric field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/optionwidgets/optionwidgets.module', 'optionwidgets', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Option Widgets";s:11:"description";s:82:"Defines selection, check box and radio button widgets for text and numeric fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/devel/performance/performance.module', 'performance', 'module', '', 1, 0, 1, 6001, 3000, 'a:10:{s:4:"name";s:19:"Performance Logging";s:11:"description";s:91:"Logs detailed and/or summary page generation time and memory consumption for page requests.";s:7:"package";s:11:"Development";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.23";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1291650062";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/text/text.module', 'text', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:4:"Text";s:11:"description";s:32:"Defines simple text field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/cck/modules/userreference/userreference.module', 'userreference', 'module', '', 1, 0, 0, 6002, 0, 'a:10:{s:4:"name";s:14:"User Reference";s:11:"description";s:56:"Defines a field type for referencing a user from a node.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1294407979";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/vertical_tabs/vertical_tabs.module', 'vertical_tabs', 'module', '', 1, 0, 0, 6104, 300, 'a:11:{s:4:"name";s:13:"Vertical Tabs";s:11:"description";s:67:"Provides vertical tabs for supported forms like the node edit page.";s:4:"core";s:3:"6.x";s:7:"package";s:14:"User interface";s:10:"recommends";a:1:{i:0;s:4:"form";}s:7:"version";s:11:"6.x-1.0-rc2";s:7:"project";s:13:"vertical_tabs";s:9:"datestamp";s:10:"1309875122";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/getid3/getid3.module', 'getid3', 'module', '', 1, 0, 0, 0, -10, 'a:9:{s:4:"name";s:8:"getID3()";s:11:"description";s:66:"getID3() extracts useful information from multimedia file formats.";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:6:"getid3";s:9:"datestamp";s:10:"1314210417";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/image/image.module', 'image', 'module', '', 1, 0, 0, 6104, 0, 'a:10:{s:4:"name";s:5:"Image";s:11:"description";s:49:"Allows uploading, resizing and viewing of images.";s:7:"package";s:5:"Image";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:5:"image";s:9:"datestamp";s:10:"1332228655";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/image/contrib/image_attach/image_attach.module', 'image_attach', 'module', '', 1, 0, 0, 6103, 0, 'a:10:{s:4:"name";s:12:"Image Attach";s:11:"description";s:60:"Allows easy attaching of image nodes to other content types.";s:7:"package";s:5:"Image";s:12:"dependencies";a:1:{i:0;s:5:"image";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:5:"image";s:9:"datestamp";s:10:"1332228655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/image/contrib/image_gallery/image_gallery.module', 'image_gallery', 'module', '', 1, 0, 0, 6101, 0, 'a:10:{s:4:"name";s:13:"Image Gallery";s:11:"description";s:69:"Allows sorting and displaying of image galleries based on categories.";s:7:"package";s:5:"Image";s:12:"dependencies";a:2:{i:0;s:5:"image";i:1;s:8:"taxonomy";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:5:"image";s:9:"datestamp";s:10:"1332228655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/image/contrib/image_im_advanced/image_im_advanced.module', 'image_im_advanced', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:28:"ImageMagick Advanced Options";s:11:"description";s:55:"Adds advanced options to the ImageMagick image toolkit.";s:7:"package";s:5:"Image";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:5:"image";s:9:"datestamp";s:10:"1332228655";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/image/contrib/image_import/image_import.module', 'image_import', 'module', '', 1, 0, 0, 1, 0, 'a:10:{s:4:"name";s:12:"Image Import";s:11:"description";s:71:"Allows batches of images to be imported from a directory on the server.";s:7:"package";s:5:"Image";s:12:"dependencies";a:1:{i:0;s:5:"image";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.2";s:7:"project";s:5:"image";s:9:"datestamp";s:10:"1332228655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imageapi/imageapi.module', 'imageapi', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"ImageAPI";s:11:"description";s:38:"ImageAPI supporting multiple toolkits.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.1";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1305563215";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}'),
('sites/all/modules/imageapi/imageapi_gd.module', 'imageapi_gd', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"ImageAPI GD2";s:11:"description";s:49:"Uses PHP\'s built-in GD2 image processing support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1305563215";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imageapi/imageapi_imagemagick.module', 'imageapi_imagemagick', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:20:"ImageAPI ImageMagick";s:11:"description";s:33:"Command Line ImageMagick support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.10";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1305563215";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imagecache/imagecache.module', 'imagecache', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:10:"ImageCache";s:11:"description";s:36:"Dynamic image manipulator and cache.";s:7:"package";s:10:"ImageCache";s:12:"dependencies";a:1:{i:0;s:8:"imageapi";}s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-2.0-rc1";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1337742655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/imagecache/imagecache_ui.module', 'imagecache_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"ImageCache UI";s:11:"description";s:26:"ImageCache User Interface.";s:12:"dependencies";a:2:{i:0;s:10:"imagecache";i:1;s:8:"imageapi";}s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:11:"6.x-2.0-rc1";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1337742655";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/lightbox2/lightbox2.module', 'lightbox2', 'module', '', 1, 0, 0, 6003, 0, 'a:9:{s:4:"name";s:9:"Lightbox2";s:11:"description";s:28:"Enables Lightbox2 for Drupal";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.11";s:7:"project";s:9:"lightbox2";s:9:"datestamp";s:10:"1285342563";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/zen/zen.info', 'zen', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:15:{s:4:"name";s:3:"Zen";s:11:"description";s:194:"Zen sub-themes are the ultimate starting themes for Drupal 6. Read the <a href="http://drupal.org/node/873778">online docs</a> or the included README-FIRST.txt on how to create a theme with Zen.";s:10:"screenshot";s:49:"sites/all/themes/zen/zen-internals/screenshot.png";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:13:"First sidebar";s:14:"sidebar_second";s:14:"Second sidebar";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:7:"layouts";}}s:7:"version";s:7:"6.x-2.1";s:7:"project";s:3:"zen";s:9:"datestamp";s:10:"1302017816";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:30:"sites/all/themes/zen/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:30:"sites/all/themes/zen/script.js";}s:3:"php";s:5:"4.3.5";}'),
('sites/all/themes/cti_flex/cti_flex.info', 'cti_flex', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:16:{s:4:"name";s:8:"CTI Flex";s:11:"description";s:81:"Zen sub-theme, 3-column, fluid or fixed-width.  Multiple color schemes available.";s:10:"screenshot";s:40:"sites/all/themes/cti_flex/screenshot.png";s:4:"core";s:3:"6.x";s:10:"base theme";s:3:"zen";s:11:"stylesheets";a:2:{s:3:"all";a:12:{s:18:"css/html-reset.css";s:44:"sites/all/themes/cti_flex/css/html-reset.css";s:18:"css/wireframes.css";s:44:"sites/all/themes/cti_flex/css/wireframes.css";s:12:"css/tabs.css";s:38:"sites/all/themes/cti_flex/css/tabs.css";s:16:"css/messages.css";s:42:"sites/all/themes/cti_flex/css/messages.css";s:13:"css/pages.css";s:39:"sites/all/themes/cti_flex/css/pages.css";s:21:"css/block-editing.css";s:47:"sites/all/themes/cti_flex/css/block-editing.css";s:14:"css/blocks.css";s:40:"sites/all/themes/cti_flex/css/blocks.css";s:18:"css/navigation.css";s:44:"sites/all/themes/cti_flex/css/navigation.css";s:13:"css/nodes.css";s:39:"sites/all/themes/cti_flex/css/nodes.css";s:16:"css/comments.css";s:42:"sites/all/themes/cti_flex/css/comments.css";s:13:"css/forms.css";s:39:"sites/all/themes/cti_flex/css/forms.css";s:16:"css/cti-flex.css";s:42:"sites/all/themes/cti_flex/css/cti-flex.css";}s:5:"print";a:1:{s:13:"css/print.css";s:39:"sites/all/themes/cti_flex/css/print.css";}}s:23:"conditional-stylesheets";a:2:{s:5:"if IE";a:1:{s:3:"all";a:1:{i:0;s:10:"css/ie.css";}}s:11:"if lte IE 6";a:1:{s:3:"all";a:1:{i:0;s:11:"css/ie6.css";}}}s:7:"regions";a:9:{s:13:"sidebar_first";s:20:"First sidebar (left)";s:14:"sidebar_second";s:22:"Second sidebar (right)";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:11:{s:17:"zen_block_editing";s:1:"0";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"0";s:23:"zen_breadcrumb_trailing";s:1:"0";s:20:"zen_breadcrumb_title";s:1:"0";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";s:15:"cti_flex_layout";s:5:"fixed";s:15:"cti_flex_design";s:1:"0";s:20:"cti_flex_font_family";s:1:"0";}s:7:"version";s:7:"6.x-2.3";s:7:"project";s:8:"cti_flex";s:9:"datestamp";s:10:"1287841529";s:7:"scripts";a:1:{s:9:"script.js";s:35:"sites/all/themes/cti_flex/script.js";}s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}'),
('sites/all/modules/keuangan/keuangan.module', 'keuangan', 'module', '', 1, 0, 0, 0, 0, 'a:8:{s:4:"name";s:8:"Keuangan";s:11:"description";s:26:"Data Keuangan by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/print/print.module', 'print', 'module', '', 1, 0, 0, 6118, 0, 'a:10:{s:4:"name";s:22:"Printer-friendly pages";s:11:"description";s:73:"Adds a printer-friendly version link to content and administrative pages.";s:4:"core";s:3:"6.x";s:7:"package";s:31:"Printer, email and PDF versions";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"print";s:9:"datestamp";s:10:"1346768621";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/print/print_mail/print_mail.module', 'print_mail', 'module', '', 1, 0, 0, 6118, 1, 'a:10:{s:4:"name";s:13:"Send by email";s:11:"description";s:53:"Provides the capability to send the web page by email";s:12:"dependencies";a:1:{i:0;s:5:"print";}s:4:"core";s:3:"6.x";s:7:"package";s:31:"Printer, email and PDF versions";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"print";s:9:"datestamp";s:10:"1346768621";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}'),
('sites/all/modules/print/print_pdf/print_pdf.module', 'print_pdf', 'module', '', 1, 0, 0, 6118, 2, 'a:10:{s:4:"name";s:11:"PDF version";s:11:"description";s:43:"Adds the capability to export pages as PDF.";s:12:"dependencies";a:1:{i:0;s:5:"print";}s:4:"core";s:3:"6.x";s:7:"package";s:31:"Printer, email and PDF versions";s:7:"version";s:8:"6.x-1.18";s:7:"project";s:5:"print";s:9:"datestamp";s:10:"1346768621";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `cms_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('sites/all/modules/datatables_connector/datatables_connector.module', 'datatables_connector', 'module', '', 0, 0, 0, -1, 0, 'a:8:{s:4:"name";s:20:"Datatables Connector";s:11:"description";s:26:"Data Supplier by Ikhwan IT";s:7:"package";s:9:"globalpos";s:4:"core";s:3:"6.x";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:7:"version";N;s:3:"php";s:5:"4.3.5";}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_term_data`
--

CREATE TABLE `cms_term_data` (
  `tid` int(10) UNSIGNED NOT NULL,
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_term_hierarchy`
--

CREATE TABLE `cms_term_hierarchy` (
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_term_node`
--

CREATE TABLE `cms_term_node` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_term_relation`
--

CREATE TABLE `cms_term_relation` (
  `trid` int(11) NOT NULL,
  `tid1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tid2` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_term_synonym`
--

CREATE TABLE `cms_term_synonym` (
  `tsid` int(11) NOT NULL,
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_upload`
--

CREATE TABLE `cms_upload` (
  `fid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `list` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_url_alias`
--

CREATE TABLE `cms_url_alias` (
  `pid` int(10) UNSIGNED NOT NULL,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  `timezone_name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`, `timezone_name`) VALUES
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL, ''),
(1, 'admin_pos', '12b7d0cc2e2e9b4b9380ad9ea59908e0', 'info@ikhwanit.com', 0, 0, 0, '', '', 0, 1302046258, 1477751264, 1477621548, 1, '25200', '', '', 'info@ikhwanit.com', 'a:1:{s:13:"form_build_id";s:48:"form-oe54e8LxbnAEMFWe3Kf1Fo9gJOanNLAVpb-O1vz6tBw";}', 'Asia/Jakarta'),
(4, 'kasir', 'de28f8f7998f23ab4194b51a6029416f', 'kasir@banimustofa.com', 0, 0, 0, '', '', 0, 1422282416, 1450087549, 1449386328, 1, '25200', '', '', 'kasir@banimustofa.com', 'a:1:{s:13:"form_build_id";s:48:"form-QNZJa4Ri3GiFvda_xqXTAyAw9mr3fSL02gl1fADpmBs";}', 'Asia/Jakarta'),
(5, 'administrasi', '4b9db269c5f978e1264480b0a7619eea', 'admin@banimustofa.com', 0, 0, 0, '', '', 0, 1422282879, 1450055289, 1449260500, 1, '25200', '', '', 'admin@banimustofa.com', 'a:1:{s:13:"form_build_id";s:48:"form-9wCkLyIGcRYW_fXLKVoWlzgAWfePUG94gNtdLVUMh64";}', 'Asia/Jakarta'),
(6, 'Sarah', 'ca273008260787ce2780285dba46665c', 'sarah@gmail.com', 0, 0, 0, '', '', 0, 1464234267, 1464238405, 1464234941, 1, '25200', '', '', 'sarah@gmail.com', 'a:1:{s:13:"form_build_id";s:48:"form-FjmSfzvJzf1vKKmYgyM8UMgBu3qE2JjQQM4amrr7v0o";}', '');

-- --------------------------------------------------------

--
-- Table structure for table `cms_users_roles`
--

CREATE TABLE `cms_users_roles` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_users_roles`
--

INSERT INTO `cms_users_roles` (`uid`, `rid`) VALUES
(4, 3),
(5, 4),
(6, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cms_variable`
--

CREATE TABLE `cms_variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_variable`
--

INSERT INTO `cms_variable` (`name`, `value`) VALUES
('theme_default', 's:8:"cti_flex";'),
('filter_html_1', 'i:1;'),
('node_options_forum', 'a:1:{i:0;s:6:"status";}'),
('drupal_private_key', 's:64:"1fbbd850c57678b85d7aaaa9faf87864da4dd2094e3fd786a83b556ad94a100b";'),
('menu_masks', 'a:24:{i:0;i:127;i:1;i:125;i:2;i:63;i:3;i:62;i:4;i:61;i:5;i:59;i:6;i:58;i:7;i:57;i:8;i:56;i:9;i:31;i:10;i:30;i:11;i:29;i:12;i:28;i:13;i:24;i:14;i:21;i:15;i:15;i:16;i:14;i:17;i:11;i:18;i:7;i:19;i:6;i:20;i:5;i:21;i:3;i:22;i:2;i:23;i:1;}'),
('install_task', 's:4:"done";'),
('menu_expanded', 'a:1:{i:0;s:13:"primary-links";}'),
('site_name', 's:14:"SONGKOK IKHWAN";'),
('site_mail', 's:17:"info@ikhwanit.com";'),
('date_default_timezone', 's:5:"25200";'),
('user_email_verification', 'b:1;'),
('clean_url', 's:1:"1";'),
('install_time', 'i:1302046313;'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('content_access_settings', 'a:0:{}'),
('theme_settings', 'a:19:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:0;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:30:"toggle_node_info_gambar_produk";i:1;s:29:"toggle_node_info_halaman_nota";i:0;s:22:"toggle_node_info_image";i:1;s:12:"default_logo";i:0;s:9:"logo_path";s:28:"sites/default/files/logo.png";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:14:"favicon_upload";s:0:"";}'),
('drupal_http_request_fails', 'b:0;'),
('css_js_query_string', 's:20:"APm2OeS7VwWNohulbQjz";'),
('install_profile', 's:7:"default";'),
('update_last_check', 'i:1476588894;'),
('file_directory_temp', 's:23:"sites/default/files/tmp";'),
('theme_adaptivetheme_settings', 'a:115:{s:23:"skip_navigation_display";s:4:"hide";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"0";s:19:"breadcrumb_trailing";s:1:"0";s:16:"breadcrumb_title";s:1:"0";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:18:"primary_links_tree";s:1:"0";s:20:"secondary_links_tree";s:1:"0";s:23:"mission_statement_pages";s:4:"home";s:25:"taxonomy_settings_enabled";s:1:"0";s:24:"taxonomy_display_default";s:4:"only";s:23:"taxonomy_format_default";s:5:"vocab";s:26:"taxonomy_delimiter_default";s:2:", ";s:28:"taxonomy_enable_content_type";s:1:"0";s:29:"submitted_by_settings_enabled";s:1:"0";s:27:"submitted_by_author_default";s:1:"1";s:25:"submitted_by_date_default";s:1:"1";s:32:"submitted_by_enable_content_type";s:1:"0";s:30:"display_links_settings_enabled";s:1:"0";s:21:"display_links_default";s:3:"all";s:33:"display_links_enable_content_type";s:1:"0";s:16:"rebuild_registry";s:1:"0";s:15:"show_theme_info";s:1:"0";s:23:"cleanup_classes_section";s:1:"0";s:21:"cleanup_classes_front";s:1:"0";s:27:"cleanup_classes_user_status";s:1:"0";s:27:"cleanup_classes_normal_path";s:1:"0";s:25:"cleanup_classes_node_type";s:1:"0";s:31:"cleanup_classes_add_edit_delete";s:1:"0";s:24:"cleanup_classes_language";s:1:"0";s:18:"cleanup_article_id";s:1:"0";s:31:"cleanup_article_classes_promote";s:1:"0";s:30:"cleanup_article_classes_sticky";s:1:"0";s:30:"cleanup_article_classes_teaser";s:1:"0";s:31:"cleanup_article_classes_preview";s:1:"0";s:28:"cleanup_article_classes_type";s:1:"0";s:32:"cleanup_article_classes_language";s:1:"0";s:25:"cleanup_comment_anonymous";s:1:"0";s:30:"cleanup_comment_article_author";s:1:"0";s:25:"cleanup_comment_by_viewer";s:1:"0";s:19:"cleanup_comment_new";s:1:"0";s:21:"cleanup_comment_zebra";s:1:"0";s:28:"cleanup_comment_wrapper_type";s:1:"0";s:32:"cleanup_block_block_module_delta";s:1:"0";s:28:"cleanup_block_classes_module";s:1:"0";s:27:"cleanup_block_classes_zebra";s:1:"0";s:28:"cleanup_block_classes_region";s:1:"0";s:27:"cleanup_block_classes_count";s:1:"0";s:23:"cleanup_menu_menu_class";s:1:"1";s:23:"cleanup_menu_leaf_class";s:1:"1";s:31:"cleanup_menu_first_last_classes";s:1:"0";s:27:"cleanup_menu_active_classes";s:1:"0";s:24:"cleanup_menu_title_class";s:1:"0";s:24:"cleanup_links_type_class";s:1:"1";s:28:"cleanup_links_active_classes";s:1:"0";s:32:"cleanup_links_first_last_classes";s:1:"0";s:23:"cleanup_item_list_zebra";s:1:"0";s:28:"cleanup_item_list_first_last";s:1:"0";s:22:"cleanup_views_css_name";s:1:"0";s:23:"cleanup_views_view_name";s:1:"0";s:24:"cleanup_views_display_id";s:1:"0";s:20:"cleanup_views_dom_id";s:1:"0";s:25:"cleanup_views_unformatted";s:1:"0";s:23:"cleanup_views_item_list";s:1:"0";s:19:"cleanup_fields_type";s:1:"0";s:19:"cleanup_fields_name";s:1:"0";s:20:"cleanup_fields_zebra";s:1:"0";s:28:"cleanup_headings_title_class";s:1:"0";s:33:"cleanup_headings_namespaced_class";s:1:"0";s:23:"links_add_span_elements";s:1:"0";s:12:"at_user_menu";s:1:"0";s:16:"block_edit_links";s:1:"1";s:18:"at_admin_hide_help";s:1:"0";s:13:"layout_method";s:1:"0";s:12:"layout_width";s:5:"960px";s:26:"layout_sidebar_first_width";s:3:"240";s:25:"layout_sidebar_last_width";s:3:"240";s:22:"layout_enable_settings";s:2:"on";s:19:"layout_enable_width";s:2:"on";s:22:"layout_enable_sidebars";s:2:"on";s:20:"layout_enable_method";s:2:"on";s:23:"layout_enable_frontpage";s:2:"on";s:22:"equal_heights_sidebars";s:1:"0";s:20:"equal_heights_blocks";s:1:"0";s:21:"equal_heights_gpanels";s:1:"0";s:22:"horizontal_login_block";s:1:"0";s:32:"horizontal_login_block_overlabel";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:13:"color_schemes";s:18:"colors-default.css";s:20:"color_enable_schemes";s:3:"off";s:7:"mission";s:0:"";s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:13:"primary_links";i:1;s:15:"secondary_links";i:1;s:11:"toggle_logo";i:1;s:14:"toggle_favicon";i:1;s:11:"toggle_name";i:1;s:13:"toggle_search";i:0;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;}'),
('theme_adaptivetheme_subtheme_settings', 'a:125:{s:23:"skip_navigation_display";s:4:"hide";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";i:0;s:19:"breadcrumb_trailing";i:0;s:16:"breadcrumb_title";i:0;s:25:"display_search_form_label";i:1;s:14:"search_snippet";i:1;s:16:"search_info_type";i:1;s:16:"search_info_user";i:1;s:16:"search_info_date";i:1;s:19:"search_info_comment";i:1;s:18:"search_info_upload";i:1;s:21:"search_info_separator";s:3:" - ";s:18:"primary_links_tree";i:0;s:20:"secondary_links_tree";i:0;s:23:"mission_statement_pages";s:4:"home";s:25:"taxonomy_settings_enabled";i:0;s:24:"taxonomy_display_default";s:4:"only";s:23:"taxonomy_format_default";s:5:"vocab";s:26:"taxonomy_delimiter_default";s:2:", ";s:28:"taxonomy_enable_content_type";s:1:"0";s:29:"submitted_by_settings_enabled";i:0;s:27:"submitted_by_author_default";s:1:"1";s:25:"submitted_by_date_default";s:1:"1";s:32:"submitted_by_enable_content_type";s:1:"0";s:30:"display_links_settings_enabled";i:0;s:21:"display_links_default";s:3:"all";s:33:"display_links_enable_content_type";s:1:"0";s:16:"rebuild_registry";i:0;s:15:"show_theme_info";s:1:"0";s:23:"cleanup_classes_section";i:0;s:21:"cleanup_classes_front";i:0;s:27:"cleanup_classes_user_status";i:0;s:27:"cleanup_classes_normal_path";i:0;s:25:"cleanup_classes_node_type";i:0;s:31:"cleanup_classes_add_edit_delete";i:0;s:24:"cleanup_classes_language";s:1:"0";s:18:"cleanup_article_id";i:0;s:31:"cleanup_article_classes_promote";i:0;s:30:"cleanup_article_classes_sticky";i:0;s:30:"cleanup_article_classes_teaser";i:0;s:31:"cleanup_article_classes_preview";i:0;s:28:"cleanup_article_classes_type";i:0;s:32:"cleanup_article_classes_language";s:1:"0";s:25:"cleanup_comment_anonymous";i:0;s:30:"cleanup_comment_article_author";i:0;s:25:"cleanup_comment_by_viewer";i:0;s:19:"cleanup_comment_new";i:0;s:21:"cleanup_comment_zebra";i:0;s:28:"cleanup_comment_wrapper_type";i:0;s:32:"cleanup_block_block_module_delta";i:0;s:28:"cleanup_block_classes_module";i:0;s:27:"cleanup_block_classes_zebra";i:0;s:28:"cleanup_block_classes_region";i:0;s:27:"cleanup_block_classes_count";i:0;s:23:"cleanup_menu_menu_class";i:1;s:23:"cleanup_menu_leaf_class";i:1;s:31:"cleanup_menu_first_last_classes";i:0;s:27:"cleanup_menu_active_classes";i:0;s:24:"cleanup_menu_title_class";i:0;s:24:"cleanup_links_type_class";i:1;s:28:"cleanup_links_active_classes";i:0;s:32:"cleanup_links_first_last_classes";i:0;s:23:"cleanup_item_list_zebra";i:0;s:28:"cleanup_item_list_first_last";i:0;s:22:"cleanup_views_css_name";s:1:"0";s:23:"cleanup_views_view_name";s:1:"0";s:24:"cleanup_views_display_id";s:1:"0";s:20:"cleanup_views_dom_id";s:1:"0";s:25:"cleanup_views_unformatted";s:1:"0";s:23:"cleanup_views_item_list";s:1:"0";s:19:"cleanup_fields_type";s:1:"0";s:19:"cleanup_fields_name";s:1:"0";s:20:"cleanup_fields_zebra";s:1:"0";s:28:"cleanup_headings_title_class";i:0;s:33:"cleanup_headings_namespaced_class";i:0;s:23:"links_add_span_elements";i:0;s:12:"at_user_menu";i:0;s:16:"block_edit_links";i:1;s:18:"at_admin_hide_help";i:0;s:13:"layout_method";s:1:"0";s:12:"layout_width";s:5:"960px";s:26:"layout_sidebar_first_width";s:3:"240";s:25:"layout_sidebar_last_width";s:3:"240";s:22:"layout_enable_settings";s:2:"on";s:19:"layout_enable_width";s:2:"on";s:22:"layout_enable_sidebars";s:2:"on";s:20:"layout_enable_method";s:2:"on";s:23:"layout_enable_frontpage";s:2:"on";s:22:"equal_heights_sidebars";i:0;s:20:"equal_heights_blocks";s:1:"0";s:21:"equal_heights_gpanels";i:0;s:22:"horizontal_login_block";i:1;s:32:"horizontal_login_block_overlabel";i:1;s:29:"horizontal_login_block_enable";s:2:"on";s:13:"color_schemes";s:18:"colors-default.css";s:20:"color_enable_schemes";s:3:"off";s:7:"mission";s:0:"";s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:13:"primary_links";i:1;s:15:"secondary_links";i:1;s:11:"toggle_logo";i:1;s:14:"toggle_favicon";i:1;s:11:"toggle_name";i:1;s:13:"toggle_search";i:0;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:11:"logo_upload";s:0:"";s:14:"favicon_upload";s:0:"";s:20:"equalize_leaderboard";i:0;s:15:"equalize_header";i:0;s:26:"equalize_secondary-content";i:0;s:20:"equalize_content-top";i:0;s:23:"equalize_content-bottom";i:0;s:25:"equalize_tertiary-content";i:0;s:15:"equalize_footer";i:0;s:17:"exported_settings";s:3916:"settings[skip_navigation_display]="hide"\r\nsettings[breadcrumb_display]="yes"\r\nsettings[breadcrumb_separator]=" &#187; "\r\nsettings[breadcrumb_home]="0"\r\nsettings[breadcrumb_trailing]="0"\r\nsettings[breadcrumb_title]="0"\r\nsettings[display_search_form_label]="1"\r\nsettings[search_snippet]="1"\r\nsettings[search_info_type]="1"\r\nsettings[search_info_user]="1"\r\nsettings[search_info_date]="1"\r\nsettings[search_info_comment]="1"\r\nsettings[search_info_upload]="1"\r\nsettings[search_info_separator]=" - "\r\nsettings[primary_links_tree]="0"\r\nsettings[secondary_links_tree]="0"\r\nsettings[mission_statement_pages]="home"\r\nsettings[taxonomy_settings_enabled]="0"\r\nsettings[taxonomy_display_default]="only"\r\nsettings[taxonomy_format_default]="vocab"\r\nsettings[taxonomy_delimiter_default]=", "\r\nsettings[taxonomy_enable_content_type]="0"\r\nsettings[submitted_by_settings_enabled]="0"\r\nsettings[submitted_by_author_default]="1"\r\nsettings[submitted_by_date_default]="1"\r\nsettings[submitted_by_enable_content_type]="0"\r\nsettings[display_links_settings_enabled]="0"\r\nsettings[display_links_default]="all"\r\nsettings[display_links_enable_content_type]="0"\r\nsettings[rebuild_registry]="0"\r\nsettings[show_theme_info]="0"\r\nsettings[cleanup_classes_section]="0"\r\nsettings[cleanup_classes_front]="0"\r\nsettings[cleanup_classes_user_status]="0"\r\nsettings[cleanup_classes_normal_path]="0"\r\nsettings[cleanup_classes_node_type]="0"\r\nsettings[cleanup_classes_add_edit_delete]="0"\r\nsettings[cleanup_classes_language]="0"\r\nsettings[cleanup_article_id]="0"\r\nsettings[cleanup_article_classes_promote]="0"\r\nsettings[cleanup_article_classes_sticky]="0"\r\nsettings[cleanup_article_classes_teaser]="0"\r\nsettings[cleanup_article_classes_preview]="0"\r\nsettings[cleanup_article_classes_type]="0"\r\nsettings[cleanup_article_classes_language]="0"\r\nsettings[cleanup_comment_anonymous]="0"\r\nsettings[cleanup_comment_article_author]="0"\r\nsettings[cleanup_comment_by_viewer]="0"\r\nsettings[cleanup_comment_new]="0"\r\nsettings[cleanup_comment_zebra]="0"\r\nsettings[cleanup_comment_wrapper_type]="0"\r\nsettings[cleanup_block_block_module_delta]="0"\r\nsettings[cleanup_block_classes_module]="0"\r\nsettings[cleanup_block_classes_zebra]="0"\r\nsettings[cleanup_block_classes_region]="0"\r\nsettings[cleanup_block_classes_count]="0"\r\nsettings[cleanup_menu_menu_class]="1"\r\nsettings[cleanup_menu_leaf_class]="1"\r\nsettings[cleanup_menu_first_last_classes]="0"\r\nsettings[cleanup_menu_active_classes]="0"\r\nsettings[cleanup_menu_title_class]="0"\r\nsettings[cleanup_links_type_class]="1"\r\nsettings[cleanup_links_active_classes]="0"\r\nsettings[cleanup_links_first_last_classes]="0"\r\nsettings[cleanup_item_list_zebra]="0"\r\nsettings[cleanup_item_list_first_last]="0"\r\nsettings[cleanup_views_css_name]="0"\r\nsettings[cleanup_views_view_name]="0"\r\nsettings[cleanup_views_display_id]="0"\r\nsettings[cleanup_views_dom_id]="0"\r\nsettings[cleanup_views_unformatted]="0"\r\nsettings[cleanup_views_item_list]="0"\r\nsettings[cleanup_fields_type]="0"\r\nsettings[cleanup_fields_name]="0"\r\nsettings[cleanup_fields_zebra]="0"\r\nsettings[cleanup_headings_title_class]="0"\r\nsettings[cleanup_headings_namespaced_class]="0"\r\nsettings[links_add_span_elements]="0"\r\nsettings[at_user_menu]="0"\r\nsettings[block_edit_links]="1"\r\nsettings[at_admin_hide_help]="0"\r\nsettings[layout_method]="0"\r\nsettings[layout_width]="960px"\r\nsettings[layout_sidebar_first_width]="240"\r\nsettings[layout_sidebar_last_width]="240"\r\nsettings[layout_enable_settings]="on"\r\nsettings[layout_enable_width]="on"\r\nsettings[layout_enable_sidebars]="on"\r\nsettings[layout_enable_method]="on"\r\nsettings[layout_enable_frontpage]="on"\r\nsettings[equal_heights_sidebars]="0"\r\nsettings[equal_heights_blocks]="0"\r\nsettings[equal_heights_gpanels]="0"\r\nsettings[horizontal_login_block]="0"\r\nsettings[horizontal_login_block_overlabel]="0"\r\nsettings[horizontal_login_block_enable]="on"\r\nsettings[color_schemes]="colors-default.css"\r\nsettings[color_enable_schemes]="off"\r\n";}'),
('site_slogan', 's:14:"Songkok Berkat";'),
('site_mission', 's:0:"";'),
('site_footer', 's:37:"Kilang Songkok Ikhwan\r\nDesa Cijayanti";'),
('anonymous', 's:9:"Anonymous";'),
('site_frontpage', 's:4:"user";'),
('javascript_parsed', 'a:0:{}'),
('admin_theme', 's:1:"0";'),
('node_admin_theme', 'i:1;'),
('content_schema_version', 'i:6009;'),
('cron_last', 'i:1333759233;'),
('fieldgroup_schema_version', 'i:6000;'),
('date_api_version', 's:3:"5.2";'),
('vertical_tabs_forms', 'a:0:{}'),
('node_options_gambar_produk', 'a:1:{i:0;s:6:"status";}'),
('upload_gambar_produk', 's:1:"1";'),
('form_build_id_gambar_produk', 's:37:"form-e804b90de91d33765888cbb241d6f82d";'),
('comment_gambar_produk', 's:1:"0";'),
('comment_default_mode_gambar_produk', 's:1:"4";'),
('comment_default_order_gambar_produk', 's:1:"1";'),
('comment_default_per_page_gambar_produk', 's:2:"50";'),
('comment_controls_gambar_produk', 's:1:"3";'),
('comment_anonymous_gambar_produk', 'i:0;'),
('comment_subject_field_gambar_produk', 's:1:"1";'),
('comment_preview_gambar_produk', 's:1:"1";'),
('comment_form_location_gambar_produk', 's:1:"0";'),
('ant_gambar_produk', 's:1:"0";'),
('ant_pattern_gambar_produk', 's:0:"";'),
('ant_php_gambar_produk', 'i:0;'),
('content_extra_weights_gambar_produk', 'a:9:{s:5:"title";s:1:"6";s:10:"body_field";s:1:"8";s:20:"revision_information";s:2:"10";s:6:"author";s:2:"11";s:7:"options";s:2:"12";s:16:"comment_settings";s:2:"14";s:4:"menu";s:1:"9";s:4:"path";s:2:"15";s:11:"attachments";s:2:"13";}'),
('image_toolkit', 's:2:"gd";'),
('file_directory_path', 's:19:"sites/default/files";'),
('file_downloads', 's:1:"1";'),
('node_options_image', 'a:1:{i:0;s:6:"status";}'),
('image_gallery_nav_vocabulary', 's:1:"1";'),
('image_updated', 'i:1333924054;'),
('image_default_path', 's:6:"images";'),
('image_max_upload_size', 's:3:"800";'),
('image_sizes', 'a:3:{s:9:"_original";a:5:{s:5:"label";s:8:"Original";s:9:"operation";s:5:"scale";s:5:"width";s:0:"";s:6:"height";s:0:"";s:4:"link";s:1:"1";}s:9:"thumbnail";a:5:{s:5:"label";s:9:"Thumbnail";s:9:"operation";s:5:"scale";s:5:"width";s:3:"100";s:6:"height";s:3:"100";s:4:"link";s:1:"1";}s:7:"preview";a:5:{s:5:"label";s:7:"Preview";s:9:"operation";s:5:"scale";s:5:"width";s:3:"640";s:6:"height";s:3:"640";s:4:"link";s:1:"2";}}'),
('image_attach_gambar_produk', 's:1:"1";'),
('image_attach_maximum_gambar_produk', 's:1:"0";'),
('image_attach_size_teaser_gambar_produk', 's:9:"thumbnail";'),
('image_attach_size_body_gambar_produk', 's:9:"thumbnail";'),
('conditional_styles_cti_flex', 's:261:"<!--[if IE]>\n<link type="text/css" rel="stylesheet" media="all" href="/sites/all/themes/cti_flex/css/ie.css?A" />\n<![endif]-->\n<!--[if lte IE 6]>\n<link type="text/css" rel="stylesheet" media="all" href="/sites/all/themes/cti_flex/css/ie6.css?A" />\n<![endif]-->\n";'),
('conditional_styles_cti_flex_rtl', 's:261:"<!--[if IE]>\n<link type="text/css" rel="stylesheet" media="all" href="/sites/all/themes/cti_flex/css/ie.css?A" />\n<![endif]-->\n<!--[if lte IE 6]>\n<link type="text/css" rel="stylesheet" media="all" href="/sites/all/themes/cti_flex/css/ie6.css?A" />\n<![endif]-->\n";'),
('theme_zen_settings', 'a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}'),
('theme_cti_flex_settings', 'a:43:{s:17:"zen_block_editing";i:0;s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";i:0;s:23:"zen_breadcrumb_trailing";i:0;s:20:"zen_breadcrumb_title";i:0;s:20:"zen_rebuild_registry";i:0;s:14:"zen_wireframes";i:0;s:15:"cti_flex_layout";s:5:"fluid";s:15:"cti_flex_design";s:1:"1";s:20:"cti_flex_font_family";s:1:"0";s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:1;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:0;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:12:"default_logo";i:0;s:9:"logo_path";s:37:"sites/default/files/cti_flex_logo.png";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:14:"favicon_upload";s:0:"";s:15:"cti_flex_color1";s:0:"";s:15:"cti_flex_color2";s:0:"";s:15:"cti_flex_color3";s:0:"";s:20:"cti_flex_color4_left";s:0:"";s:24:"cti_flex_color4_lefthead";s:0:"";s:22:"cti_flex_color4_center";s:0:"";s:26:"cti_flex_color4_centerhead";s:0:"";s:21:"cti_flex_color4_right";s:0:"";s:25:"cti_flex_color4_righthead";s:0:"";s:15:"cti_flex_color5";s:0:"";s:15:"cti_flex_color6";s:0:"";s:15:"cti_flex_color7";s:0:"";s:15:"cti_flex_color8";s:0:"";s:20:"cti_flex_color9_left";s:0:"";s:22:"cti_flex_color9_center";s:0:"";s:21:"cti_flex_color9_right";s:0:"";}'),
('print_html_link_pos', 'a:4:{s:4:"link";s:4:"link";s:5:"block";s:5:"block";s:4:"help";s:4:"help";s:6:"corner";i:0;}'),
('print_html_link_teaser', 'i:0;'),
('print_html_show_link', 's:1:"1";'),
('print_html_link_use_alias', 'i:0;'),
('print_html_link_class', 's:10:"print-page";'),
('print_html_node_link_visibility', 's:1:"0";'),
('print_html_node_link_pages', 's:0:"";'),
('print_html_sys_link_visibility', 's:1:"1";'),
('print_html_sys_link_pages', 's:0:"";'),
('print_html_book_link', 's:1:"1";'),
('print_html_new_window', 'i:0;'),
('print_html_sendtoprinter', 'i:0;'),
('print_html_windowclose', 'i:1;'),
('print_display_sys_urllist', 'i:0;'),
('print_robots_noindex', 'i:1;'),
('print_robots_nofollow', 'i:1;'),
('print_robots_noarchive', 'i:0;'),
('node_options_halaman_nota', 'a:1:{i:0;s:6:"status";}'),
('upload_halaman_nota', 's:1:"0";'),
('form_build_id_halaman_nota', 's:48:"form-sYnKrHNPJFyQLcI1wCLm1zZiuj_TODd9Ljnqc8xagKo";'),
('image_attach_halaman_nota', 's:1:"0";'),
('image_attach_maximum_halaman_nota', 's:1:"0";'),
('image_attach_size_teaser_halaman_nota', 's:9:"thumbnail";'),
('image_attach_size_body_halaman_nota', 's:9:"thumbnail";'),
('comment_halaman_nota', 's:1:"0";'),
('comment_default_mode_halaman_nota', 's:1:"4";'),
('comment_default_order_halaman_nota', 's:1:"1";'),
('comment_default_per_page_halaman_nota', 's:2:"50";'),
('comment_controls_halaman_nota', 's:1:"3";'),
('comment_anonymous_halaman_nota', 'i:0;'),
('comment_subject_field_halaman_nota', 's:1:"1";'),
('comment_preview_halaman_nota', 's:1:"1";'),
('comment_form_location_halaman_nota', 's:1:"0";'),
('print_display_halaman_nota', 'i:1;'),
('print_display_comment_halaman_nota', 'i:0;'),
('print_display_urllist_halaman_nota', 'i:1;'),
('print_mail_display_halaman_nota', 'i:1;'),
('print_mail_display_comment_halaman_nota', 'i:0;'),
('print_mail_display_urllist_halaman_nota', 'i:1;'),
('print_pdf_display_halaman_nota', 'i:1;'),
('print_pdf_display_comment_halaman_nota', 'i:0;'),
('print_pdf_display_urllist_halaman_nota', 'i:1;'),
('ant_halaman_nota', 's:1:"0";'),
('ant_pattern_halaman_nota', 's:0:"";'),
('ant_php_halaman_nota', 'i:0;'),
('content_extra_weights_halaman_nota', 'a:8:{s:5:"title";s:2:"-5";s:20:"revision_information";s:2:"-2";s:6:"author";s:2:"-1";s:7:"options";s:1:"0";s:16:"comment_settings";s:1:"3";s:4:"menu";s:2:"-3";s:4:"path";s:1:"2";s:5:"print";s:1:"1";}'),
('print_css', 's:0:"";'),
('print_keep_theme_css', 'i:0;'),
('print_urls', 'i:0;'),
('print_urls_anchors', 'i:0;'),
('print_comments', 'i:0;'),
('print_newwindow', 's:1:"1";'),
('print_logo_options', 's:1:"0";'),
('print_logo_url', 's:0:"";'),
('print_logo_upload', 's:0:"";'),
('print_footer_options', 's:1:"0";'),
('print_footer_user', 's:0:"";'),
('print_sourceurl_enabled', 'i:0;'),
('print_sourceurl_date', 'i:0;'),
('print_sourceurl_forcenode', 'i:0;'),
('print_text_published', 's:0:"";'),
('print_text_source_url', 's:0:"";'),
('print_text_retrieved', 's:0:"";'),
('print_text_links', 's:0:"";');

-- --------------------------------------------------------

--
-- Table structure for table `cms_views_display`
--

CREATE TABLE `cms_views_display` (
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id` varchar(64) NOT NULL DEFAULT '',
  `display_title` varchar(64) NOT NULL DEFAULT '',
  `display_plugin` varchar(64) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '0',
  `display_options` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_views_display`
--

INSERT INTO `cms_views_display` (`vid`, `id`, `display_title`, `display_plugin`, `position`, `display_options`) VALUES
(1, 'default', 'Defaults', 'default', 1, 'a:4:{s:7:"filters";a:1:{s:4:"type";a:9:{s:8:"operator";s:2:"in";s:5:"value";a:1:{s:13:"gambar_produk";s:13:"gambar_produk";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:12:"relationship";s:4:"none";}}s:6:"fields";a:1:{s:21:"field_gambar_file_fid";a:15:{s:5:"label";s:0:"";s:5:"alter";a:18:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:17:"thumbnail_default";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:21:"field_gambar_file_fid";s:5:"table";s:27:"node_data_field_gambar_file";s:5:"field";s:21:"field_gambar_file_fid";s:12:"relationship";s:4:"none";}}s:12:"style_plugin";s:4:"grid";s:13:"style_options";a:5:{s:8:"grouping";s:0:"";s:7:"columns";s:1:"4";s:9:"alignment";s:10:"horizontal";s:16:"fill_single_line";i:1;s:7:"summary";s:0:"";}}'),
(1, 'page_1', 'Page', 'page', 2, 'a:1:{s:4:"path";s:10:"testgambar";}');

-- --------------------------------------------------------

--
-- Table structure for table `cms_views_object_cache`
--

CREATE TABLE `cms_views_object_cache` (
  `sid` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `obj` varchar(32) DEFAULT NULL,
  `updated` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_views_view`
--

CREATE TABLE `cms_views_view` (
  `vid` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  `base_table` varchar(64) NOT NULL DEFAULT '',
  `core` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_views_view`
--

INSERT INTO `cms_views_view` (`vid`, `name`, `description`, `tag`, `base_table`, `core`) VALUES
(1, 'get_produk_image', 'View untuk mengambil gambar yang terkait dengan produk', 'gambar produk', 'node', 6);

-- --------------------------------------------------------

--
-- Table structure for table `cms_vocabulary`
--

CREATE TABLE `cms_vocabulary` (
  `vid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `multiple` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `required` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `tags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_vocabulary`
--

INSERT INTO `cms_vocabulary` (`vid`, `name`, `description`, `help`, `relations`, `hierarchy`, `multiple`, `required`, `tags`, `module`, `weight`) VALUES
(1, 'Image Galleries', NULL, '', 0, 1, 0, 0, 0, 'image_gallery', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_vocabulary_node_types`
--

CREATE TABLE `cms_vocabulary_node_types` (
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_vocabulary_node_types`
--

INSERT INTO `cms_vocabulary_node_types` (`vid`, `type`) VALUES
(1, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `cms_watchdog`
--

CREATE TABLE `cms_watchdog` (
  `wid` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cpsupplier`
--

CREATE TABLE `cpsupplier` (
  `idcpsupplier` int(11) NOT NULL,
  `namacp` varchar(255) NOT NULL,
  `telpcp` varchar(255) NOT NULL,
  `idsupplier` int(11) NOT NULL,
  `emailcp` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `id` int(11) NOT NULL,
  `nonota` varchar(20) NOT NULL,
  `tglorder` datetime DEFAULT NULL,
  `idpemakai` int(11) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `total` double NOT NULL,
  `totalmodal` double NOT NULL,
  `carabayar` varchar(20) NOT NULL DEFAULT 'TUNAI',
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `nokartu` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_order` tinyint(1) NOT NULL DEFAULT '0',
  `status_produksi` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `idpelanggan` int(11) NOT NULL,
  `besardeposit` double NOT NULL,
  `pembayaranterakhir` double NOT NULL,
  `last_update` datetime NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailcustomerorder`
--

CREATE TABLE `detailcustomerorder` (
  `id` int(11) NOT NULL,
  `idcustomerorder` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `detailbarcode` varchar(20) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargajual` double NOT NULL,
  `diskon` double NOT NULL,
  `status_order` tinyint(1) NOT NULL DEFAULT '0',
  `sisa` double DEFAULT '0',
  `diambil` int(11) NOT NULL DEFAULT '0',
  `masuk` int(11) DEFAULT NULL,
  `outstanding` int(11) NOT NULL DEFAULT '0',
  `perkiraan_ambil` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailhasilreproduksi`
--

CREATE TABLE `detailhasilreproduksi` (
  `idreproduksi` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargajual` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailhutang`
--

CREATE TABLE `detailhutang` (
  `idsupplier` int(11) NOT NULL,
  `idpembelian` int(11) NOT NULL,
  `besarhutang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detaillaundry`
--

CREATE TABLE `detaillaundry` (
  `iddetail` int(11) NOT NULL,
  `idtitipanlaundry` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargajual` double NOT NULL,
  `diskon` double NOT NULL,
  `status_laundry` tinyint(1) NOT NULL DEFAULT '0',
  `sisa` double DEFAULT '0',
  `diambil` int(11) NOT NULL DEFAULT '0',
  `masuk` int(11) DEFAULT NULL,
  `perkiraan_ambil` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailpemakaiandeposit`
--

CREATE TABLE `detailpemakaiandeposit` (
  `idpelanggan` int(11) NOT NULL,
  `idpenjualan` int(11) NOT NULL,
  `totalbelanja` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailpembelian`
--

CREATE TABLE `detailpembelian` (
  `idpembelian` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargapokoksebelumnya` double NOT NULL,
  `perubahan` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `iddetail` int(11) NOT NULL,
  `idpenjualan` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargajual` double NOT NULL,
  `diskon` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailpiutang`
--

CREATE TABLE `detailpiutang` (
  `idpelanggan` int(11) NOT NULL,
  `idpenjualan` int(11) NOT NULL,
  `besarhutang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailpo`
--

CREATE TABLE `detailpo` (
  `idpo` int(11) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargabeli` double NOT NULL,
  `hargabelisebelumnya` double NOT NULL,
  `perubahan` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailreproduksi`
--

CREATE TABLE `detailreproduksi` (
  `idreproduksi` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargajual` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detailreturn`
--

CREATE TABLE `detailreturn` (
  `idreturn` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `hargapokok` double NOT NULL,
  `hargapokoksebelumnya` double NOT NULL,
  `perubahan` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diskonkategori`
--

CREATE TABLE `diskonkategori` (
  `idpelanggan` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `besardiskon` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `giro`
--

CREATE TABLE `giro` (
  `idpelanggan` int(11) NOT NULL,
  `no_giro` varchar(50) NOT NULL,
  `namabank` varchar(100) NOT NULL,
  `nilaigiro` double NOT NULL,
  `jatuhtempo` date NOT NULL,
  `idpenjualan` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hasilreproduksi`
--

CREATE TABLE `hasilreproduksi` (
  `idreproduksi` int(11) NOT NULL,
  `idpo` int(11) NOT NULL DEFAULT '1',
  `nonota` varchar(20) NOT NULL,
  `tglhasilreproduksi` datetime NOT NULL,
  `idpemakai` int(11) NOT NULL,
  `total` double NOT NULL,
  `totalmodal` double NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historydeposit`
--

CREATE TABLE `historydeposit` (
  `idpelanggan` int(11) NOT NULL,
  `nilaisebelumbayar` double NOT NULL,
  `pembayaran` double NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  `tglbayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historyhargabeli`
--

CREATE TABLE `historyhargabeli` (
  `hargasebelum` double NOT NULL,
  `hargasesudah` double NOT NULL,
  `tglupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historypembayaran`
--

CREATE TABLE `historypembayaran` (
  `idpelanggan` int(11) NOT NULL,
  `nilaisebelumbayar` double NOT NULL,
  `pembayaran` double NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  `tglbayar` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `idpenjualan` int(11) NOT NULL DEFAULT '0',
  `idtitipanlaundry` int(11) NOT NULL DEFAULT '0',
  `idcustomerorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historypenggunaandeposit`
--

CREATE TABLE `historypenggunaandeposit` (
  `idpelanggan` int(11) NOT NULL,
  `nilaidepositsebelum` double NOT NULL,
  `penggunaan` double NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  `tglbayar` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `idpenjualan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE `hutang` (
  `idsupplier` int(11) NOT NULL,
  `besarhutang` double NOT NULL,
  `pembayaranterakhir` double NOT NULL,
  `last_update` datetime NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `kodekategori` varchar(10) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `kodekategori`, `kategori`, `keterangan`) VALUES
(1, 'SIDP', 'Songkok Ikhwan Datuk Pangeran', 'Songkok ikhwan datuk pangeran'),
(2, 'BM', 'Bahan Mentah', 'Bahan mentah pendukung produksi');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `kodepelanggan` varchar(10) NOT NULL,
  `namapelanggan` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `kodepelanggan`, `namapelanggan`, `telp`, `alamat`, `email`) VALUES
(1, 'PLG3131', 'IBU GINA', '08176473633', 'SENTUL Test', ''),
(2, 'PLG3132', 'FAISAL', '', 'SENTUL', ''),
(3, 'PLG3133', 'PENTADBIRAN', '', 'SENTUL', ''),
(4, 'PLG3134', 'IKHWAN BAKERY', '', 'SENTUL', '');

-- --------------------------------------------------------

--
-- Table structure for table `pemakai`
--

CREATE TABLE `pemakai` (
  `idpemakai` int(11) NOT NULL,
  `kodepemakai` varchar(20) NOT NULL,
  `namapemakai` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `jabatan` varchar(30) NOT NULL DEFAULT 'KASIR'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaranhutang`
--

CREATE TABLE `pembayaranhutang` (
  `idsupplier` int(11) NOT NULL,
  `hutangsebelumbayar` double NOT NULL,
  `pembayaran` double NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  `tglbayar` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `idpembelian` int(11) NOT NULL,
  `idpo` int(11) NOT NULL DEFAULT '1',
  `nonota` varchar(20) NOT NULL,
  `tglpembelian` datetime NOT NULL,
  `idpemakai` int(11) NOT NULL,
  `idsupplier` int(11) NOT NULL DEFAULT '1',
  `total` double NOT NULL,
  `carabayar` varchar(20) NOT NULL DEFAULT 'TUNAI',
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `nokartu` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `idpenjualan` int(11) NOT NULL,
  `nonota` varchar(20) NOT NULL,
  `idtitipanlaundry` int(11) DEFAULT NULL,
  `idcustomerorder` int(11) DEFAULT NULL,
  `tglpenjualan` datetime DEFAULT NULL,
  `idpemakai` int(11) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `total` double NOT NULL,
  `totalmodal` double NOT NULL,
  `carabayar` varchar(20) NOT NULL DEFAULT 'TUNAI',
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `perlakuankembalian` int(11) NOT NULL DEFAULT '0',
  `nokartu` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE `piutang` (
  `idpelanggan` int(11) NOT NULL,
  `besarhutang` double NOT NULL,
  `pembayaranterakhir` double NOT NULL,
  `last_update` datetime NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE `po` (
  `idpo` int(11) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `tglpo` int(11) NOT NULL,
  `idpemakai` int(11) NOT NULL,
  `idsupplier` int(11) NOT NULL DEFAULT '1',
  `total` double NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL,
  `idsupplier` int(11) DEFAULT NULL,
  `idkategori` int(11) NOT NULL,
  `idsubkategori` int(11) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `alt_code` varchar(10) DEFAULT NULL,
  `namaproduct` varchar(255) NOT NULL,
  `type_product` tinyint(1) NOT NULL DEFAULT '0',
  `hargapokok` double NOT NULL,
  `hargajual` double NOT NULL,
  `margin` double NOT NULL,
  `minstok` double NOT NULL,
  `maxstok` double NOT NULL,
  `stok` double NOT NULL,
  `satuan` varchar(40) NOT NULL,
  `berat` double NOT NULL,
  `keterangan` text NOT NULL,
  `lead_time` int(11) DEFAULT NULL COMMENT 'Lama pekerjaan suatu jasa, dalam hitungan menit',
  `aturan_jam_kerja` tinyint(1) NOT NULL DEFAULT '0',
  `berlaku_sebelum_zuhur` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idproduct`, `idsupplier`, `idkategori`, `idsubkategori`, `barcode`, `alt_code`, `namaproduct`, `type_product`, `hargapokok`, `hargajual`, `margin`, `minstok`, `maxstok`, `stok`, `satuan`, `berat`, `keterangan`, `lead_time`, `aturan_jam_kerja`, `berlaku_sebelum_zuhur`) VALUES
(1, 1, 1, 1, '8999893224315', 'SIDP-BS2', 'SIDP Biasa', 0, 100000, 130000, 23, 5, 10, 4, 'PCS', 0, '', NULL, 0, 0),
(12, 1, 1, 2, '8997510444207', 'SIDP-SP-2', 'SIDP Spesial 2', 0, 140000, 185000, 24, 5, 10, 4, 'PCS', 0, '', 48, 1, 0),
(2, 1, 1, 2, '8998611388827', 'SIDP-SP-1', 'SIDP Spesial', 0, 130000, 165000, 21, 5, 10, 9, 'PCS', 0, '', NULL, 0, 0),
(3, 1, 1, 3, '8994882642675', 'SIDP-UMN-1', 'SIDP Umno', 0, 130000, 165000, 21, 5, 10, 5, 'PCS', 0, '', NULL, 0, 0),
(4, 1, 1, 4, '8993937953117', 'SIDP-PLS-1', 'SIDP Polos', 0, 50000, 75000, 33, 5, 10, 7, 'PCS', 0, '', NULL, 0, 0),
(5, 1, 1, 5, '8996398484015', 'SIDP-PLA-1', 'SIDP Polos Anak', 0, 30000, 50000, 40, 5, 10, 7, 'PCS', 0, '', NULL, 0, 0),
(6, 1, 1, 6, '8999521953884', 'SIDP-BB-1', 'SIDP Baby', 0, 25000, 35000, 29, 5, 10, 7, 'PCS', 0, '', NULL, 0, 0),
(7, 1, 1, 7, '8992898855263', 'SIDP-OMN-1', 'SIDP Oman', 0, 130000, 165000, 21, 5, 10, 7, 'PCS', 0, '', NULL, 0, 0),
(8, 1, 2, 8, '8997936636132', 'BM-KN-1', 'Kain Songket', 0, 20000, 20000, 0, 10, 20, 15, 'METER', 0, 'Kain Jenis Songket 1', NULL, 0, 0),
(9, 1, 2, 8, '8998843552843', 'BM-KN-2', 'Kain Polos', 0, 10000, 10000, 0, 10, 20, 15, 'METER', 0, '', NULL, 0, 0),
(10, 1, 2, 8, '8999623964184', 'BM-KN-3', 'Kain Oman', 0, 20000, 20000, 0, 10, 20, 15, 'METER', 0, '', NULL, 0, 0),
(11, 1, 2, 8, '8995523723043', 'BM-KN-4', 'Kain songkok baby', 0, 5000, 5000, 0, 10, 20, 15, 'METER', 0, '', NULL, 0, 0),
(13, 1, 1, 7, '8992301485995', 'SIDP-OMN-2', 'SIDP Oman 2', 0, 130000, 165000, 21, 5, 10, 7, 'PCS', 0, 'test', 48, 1, 0),
(14, 1, 1, 4, '8998926150720', 'SIDP-PLS-2', 'SIDP Polos 2', 0, 125000, 150000, 17, 5, 10, 12, 'PCS', 0, 'test', 48, 1, 0),
(15, 1, 1, 1, '8994912958707', 'SIDP-BS-2', 'SIDP Biasa 2', 0, 100000, 120000, 17, 5, 10, 7, 'PCS', 0, 'Test', 48, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reproduksi`
--

CREATE TABLE `reproduksi` (
  `idreproduksi` int(11) NOT NULL,
  `nonota` varchar(20) NOT NULL,
  `tglreproduksi` datetime DEFAULT NULL,
  `idpemakai` int(11) NOT NULL,
  `total` double NOT NULL,
  `totalmodal` double NOT NULL,
  `keterangan` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `returnsupplier`
--

CREATE TABLE `returnsupplier` (
  `idreturn` int(11) NOT NULL,
  `idpembelian` int(11) NOT NULL,
  `nonota` varchar(20) NOT NULL,
  `tglreturn` datetime NOT NULL,
  `idpemakai` int(11) NOT NULL,
  `idsupplier` int(11) NOT NULL DEFAULT '1',
  `total` double NOT NULL,
  `carareturn` int(11) NOT NULL DEFAULT '1',
  `uang_dikembalikan` double NOT NULL DEFAULT '0',
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `satuan` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`satuan`) VALUES
('PCS'),
('PACK'),
('KG'),
('LITER'),
('PASANG'),
('SET'),
('M2'),
('METER');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `idproduct` int(11) NOT NULL,
  `stok` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subkategori`
--

CREATE TABLE `subkategori` (
  `idsubkategori` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `kodesubkategori` varchar(3) NOT NULL,
  `subkategori` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subkategori`
--

INSERT INTO `subkategori` (`idsubkategori`, `idkategori`, `kodesubkategori`, `subkategori`, `keterangan`) VALUES
(1, 1, 'BS', 'Biasa', ''),
(2, 1, 'SP', 'Spesial', ''),
(3, 1, 'UMN', 'SIDP Umno', 'Songkok Ikhwan Jenis Umno'),
(4, 1, 'PLS', 'SIDP Polos', 'Songkok Ikhwan Jenis Polos'),
(5, 1, 'PLA', 'SIDP Polos Anak', 'Songkok Ikhwan jenis polos untuk anak anak'),
(6, 1, 'BB', 'SIDP Baby', 'Songkok Ikhwan jenis untuk baby'),
(7, 1, 'OMN', 'SIDP Oman', 'Songkok Ikhwan jenis oman'),
(8, 2, 'KN', 'Kain', 'Kain'),
(9, 2, 'BN', 'Benang', 'Benang'),
(10, 2, 'SPO', 'Spons', 'Spons'),
(11, 2, 'LN', 'Lain-lain', 'Bahan mentah lain lain');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `idsupplier` int(11) NOT NULL,
  `kodesupplier` varchar(10) NOT NULL,
  `namasupplier` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`idsupplier`, `kodesupplier`, `namasupplier`, `telp`, `alamat`, `email`) VALUES
(1, 'IP', 'Ikhwan Production', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `titipanlaundry`
--

CREATE TABLE `titipanlaundry` (
  `idtitipanlaundry` int(11) NOT NULL,
  `nonota` varchar(20) NOT NULL,
  `tglpenjualan` datetime DEFAULT NULL,
  `idpemakai` int(11) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `total` double NOT NULL,
  `totalmodal` double NOT NULL,
  `carabayar` varchar(20) NOT NULL DEFAULT 'TUNAI',
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `nokartu` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_laundry` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksistock`
--

CREATE TABLE `transaksistock` (
  `idproduk` int(11) NOT NULL,
  `idpenjualan` int(11) NOT NULL DEFAULT '0',
  `tgltransaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stocksebelum` double NOT NULL,
  `masuk` double NOT NULL,
  `keluar` double NOT NULL,
  `stocksetelah` double NOT NULL,
  `keterangan` text NOT NULL,
  `idpembelian` int(11) NOT NULL DEFAULT '0',
  `idreproduksi` int(11) NOT NULL DEFAULT '0',
  `idreturn` int(11) NOT NULL DEFAULT '0',
  `idreturnpelanggan` int(11) NOT NULL DEFAULT '0',
  `idcustomerorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carareturn`
--
ALTER TABLE `carareturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_access`
--
ALTER TABLE `cms_access`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `cms_actions`
--
ALTER TABLE `cms_actions`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `cms_actions_aid`
--
ALTER TABLE `cms_actions_aid`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `cms_authmap`
--
ALTER TABLE `cms_authmap`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `authname` (`authname`);

--
-- Indexes for table `cms_batch`
--
ALTER TABLE `cms_batch`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `cms_blocks`
--
ALTER TABLE `cms_blocks`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  ADD KEY `list` (`theme`,`status`,`region`,`weight`,`module`);

--
-- Indexes for table `cms_blocks_roles`
--
ALTER TABLE `cms_blocks_roles`
  ADD PRIMARY KEY (`module`,`delta`,`rid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `cms_boxes`
--
ALTER TABLE `cms_boxes`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `info` (`info`);

--
-- Indexes for table `cms_cache`
--
ALTER TABLE `cms_cache`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_block`
--
ALTER TABLE `cms_cache_block`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_content`
--
ALTER TABLE `cms_cache_content`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_filter`
--
ALTER TABLE `cms_cache_filter`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_form`
--
ALTER TABLE `cms_cache_form`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_menu`
--
ALTER TABLE `cms_cache_menu`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_page`
--
ALTER TABLE `cms_cache_page`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_update`
--
ALTER TABLE `cms_cache_update`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_views`
--
ALTER TABLE `cms_cache_views`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_cache_views_data`
--
ALTER TABLE `cms_cache_views_data`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_comments`
--
ALTER TABLE `cms_comments`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `nid` (`nid`),
  ADD KEY `status` (`status`),
  ADD KEY `comment_uid` (`uid`);

--
-- Indexes for table `cms_content_access`
--
ALTER TABLE `cms_content_access`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `cms_content_field_gambar_file`
--
ALTER TABLE `cms_content_field_gambar_file`
  ADD PRIMARY KEY (`vid`,`delta`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `cms_content_group`
--
ALTER TABLE `cms_content_group`
  ADD PRIMARY KEY (`type_name`,`group_name`);

--
-- Indexes for table `cms_content_group_fields`
--
ALTER TABLE `cms_content_group_fields`
  ADD PRIMARY KEY (`type_name`,`group_name`,`field_name`);

--
-- Indexes for table `cms_content_node_field`
--
ALTER TABLE `cms_content_node_field`
  ADD PRIMARY KEY (`field_name`);

--
-- Indexes for table `cms_content_node_field_instance`
--
ALTER TABLE `cms_content_node_field_instance`
  ADD PRIMARY KEY (`field_name`,`type_name`);

--
-- Indexes for table `cms_content_type_gambar_produk`
--
ALTER TABLE `cms_content_type_gambar_produk`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `cms_content_type_halaman_nota`
--
ALTER TABLE `cms_content_type_halaman_nota`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `cms_date_formats`
--
ALTER TABLE `cms_date_formats`
  ADD PRIMARY KEY (`dfid`),
  ADD UNIQUE KEY `formats` (`format`,`type`);

--
-- Indexes for table `cms_date_format_locale`
--
ALTER TABLE `cms_date_format_locale`
  ADD PRIMARY KEY (`type`,`language`);

--
-- Indexes for table `cms_date_format_types`
--
ALTER TABLE `cms_date_format_types`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `cms_devel_queries`
--
ALTER TABLE `cms_devel_queries`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `cms_devel_times`
--
ALTER TABLE `cms_devel_times`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `cms_filefield_meta`
--
ALTER TABLE `cms_filefield_meta`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `cms_files`
--
ALTER TABLE `cms_files`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `status` (`status`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `cms_filters`
--
ALTER TABLE `cms_filters`
  ADD PRIMARY KEY (`fid`),
  ADD UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  ADD KEY `list` (`format`,`weight`,`module`,`delta`);

--
-- Indexes for table `cms_filter_formats`
--
ALTER TABLE `cms_filter_formats`
  ADD PRIMARY KEY (`format`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cms_flood`
--
ALTER TABLE `cms_flood`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `allow` (`event`,`hostname`,`timestamp`);

--
-- Indexes for table `cms_history`
--
ALTER TABLE `cms_history`
  ADD PRIMARY KEY (`uid`,`nid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `cms_image`
--
ALTER TABLE `cms_image`
  ADD PRIMARY KEY (`nid`,`image_size`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `cms_imagecache_action`
--
ALTER TABLE `cms_imagecache_action`
  ADD PRIMARY KEY (`actionid`),
  ADD KEY `presetid` (`presetid`);

--
-- Indexes for table `cms_imagecache_preset`
--
ALTER TABLE `cms_imagecache_preset`
  ADD PRIMARY KEY (`presetid`);

--
-- Indexes for table `cms_image_attach`
--
ALTER TABLE `cms_image_attach`
  ADD PRIMARY KEY (`nid`,`iid`),
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `cms_kategoripengeluaran`
--
ALTER TABLE `cms_kategoripengeluaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`kategori`),
  ADD KEY `User_ID` (`uid`);

--
-- Indexes for table `cms_menu_custom`
--
ALTER TABLE `cms_menu_custom`
  ADD PRIMARY KEY (`menu_name`);

--
-- Indexes for table `cms_menu_links`
--
ALTER TABLE `cms_menu_links`
  ADD PRIMARY KEY (`mlid`),
  ADD KEY `path_menu` (`link_path`(128),`menu_name`),
  ADD KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  ADD KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  ADD KEY `router_path` (`router_path`(128));

--
-- Indexes for table `cms_menu_router`
--
ALTER TABLE `cms_menu_router`
  ADD PRIMARY KEY (`path`),
  ADD KEY `fit` (`fit`),
  ADD KEY `tab_parent` (`tab_parent`),
  ADD KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`);

--
-- Indexes for table `cms_node`
--
ALTER TABLE `cms_node`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `vid` (`vid`),
  ADD KEY `node_changed` (`changed`),
  ADD KEY `node_created` (`created`),
  ADD KEY `node_moderate` (`moderate`),
  ADD KEY `node_promote_status` (`promote`,`status`),
  ADD KEY `node_status_type` (`status`,`type`,`nid`),
  ADD KEY `node_title_type` (`title`,`type`(4)),
  ADD KEY `node_type` (`type`(4)),
  ADD KEY `uid` (`uid`),
  ADD KEY `tnid` (`tnid`),
  ADD KEY `translate` (`translate`);

--
-- Indexes for table `cms_node_access`
--
ALTER TABLE `cms_node_access`
  ADD PRIMARY KEY (`nid`,`gid`,`realm`);

--
-- Indexes for table `cms_node_comment_statistics`
--
ALTER TABLE `cms_node_comment_statistics`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `node_comment_timestamp` (`last_comment_timestamp`),
  ADD KEY `comment_count` (`comment_count`),
  ADD KEY `last_comment_uid` (`last_comment_uid`);

--
-- Indexes for table `cms_node_counter`
--
ALTER TABLE `cms_node_counter`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `cms_node_revisions`
--
ALTER TABLE `cms_node_revisions`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `nid` (`nid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `cms_node_type`
--
ALTER TABLE `cms_node_type`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `cms_pemasukan`
--
ALTER TABLE `cms_pemasukan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `User_ID` (`uid`);

--
-- Indexes for table `cms_pengeluaran`
--
ALTER TABLE `cms_pengeluaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`kategori`),
  ADD KEY `User_ID` (`uid`);

--
-- Indexes for table `cms_performance_detail`
--
ALTER TABLE `cms_performance_detail`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `cms_performance_summary`
--
ALTER TABLE `cms_performance_summary`
  ADD PRIMARY KEY (`path`),
  ADD KEY `last_access` (`last_access`);

--
-- Indexes for table `cms_permission`
--
ALTER TABLE `cms_permission`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `cms_print_mail_node_conf`
--
ALTER TABLE `cms_print_mail_node_conf`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `cms_print_mail_page_counter`
--
ALTER TABLE `cms_print_mail_page_counter`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `cms_print_node_conf`
--
ALTER TABLE `cms_print_node_conf`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `cms_print_page_counter`
--
ALTER TABLE `cms_print_page_counter`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `cms_print_pdf_node_conf`
--
ALTER TABLE `cms_print_pdf_node_conf`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `cms_print_pdf_page_counter`
--
ALTER TABLE `cms_print_pdf_page_counter`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `cms_role`
--
ALTER TABLE `cms_role`
  ADD PRIMARY KEY (`rid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cms_semaphore`
--
ALTER TABLE `cms_semaphore`
  ADD PRIMARY KEY (`name`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cms_sessions`
--
ALTER TABLE `cms_sessions`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `cms_system`
--
ALTER TABLE `cms_system`
  ADD PRIMARY KEY (`filename`),
  ADD KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  ADD KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  ADD KEY `type_name` (`type`(12),`name`);

--
-- Indexes for table `cms_term_data`
--
ALTER TABLE `cms_term_data`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  ADD KEY `vid_name` (`vid`,`name`);

--
-- Indexes for table `cms_term_hierarchy`
--
ALTER TABLE `cms_term_hierarchy`
  ADD PRIMARY KEY (`tid`,`parent`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `cms_term_node`
--
ALTER TABLE `cms_term_node`
  ADD PRIMARY KEY (`tid`,`vid`),
  ADD KEY `vid` (`vid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `cms_term_relation`
--
ALTER TABLE `cms_term_relation`
  ADD PRIMARY KEY (`trid`),
  ADD UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  ADD KEY `tid2` (`tid2`);

--
-- Indexes for table `cms_term_synonym`
--
ALTER TABLE `cms_term_synonym`
  ADD PRIMARY KEY (`tsid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `name_tid` (`name`,`tid`);

--
-- Indexes for table `cms_upload`
--
ALTER TABLE `cms_upload`
  ADD PRIMARY KEY (`vid`,`fid`),
  ADD KEY `fid` (`fid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `cms_url_alias`
--
ALTER TABLE `cms_url_alias`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  ADD KEY `src_language_pid` (`src`,`language`,`pid`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `access` (`access`),
  ADD KEY `created` (`created`),
  ADD KEY `mail` (`mail`);

--
-- Indexes for table `cms_users_roles`
--
ALTER TABLE `cms_users_roles`
  ADD PRIMARY KEY (`uid`,`rid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `cms_variable`
--
ALTER TABLE `cms_variable`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cms_views_display`
--
ALTER TABLE `cms_views_display`
  ADD PRIMARY KEY (`vid`,`id`),
  ADD KEY `vid` (`vid`,`position`);

--
-- Indexes for table `cms_views_object_cache`
--
ALTER TABLE `cms_views_object_cache`
  ADD KEY `sid_obj_name` (`sid`,`obj`,`name`),
  ADD KEY `updated` (`updated`);

--
-- Indexes for table `cms_views_view`
--
ALTER TABLE `cms_views_view`
  ADD PRIMARY KEY (`vid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cms_vocabulary`
--
ALTER TABLE `cms_vocabulary`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `list` (`weight`,`name`);

--
-- Indexes for table `cms_vocabulary_node_types`
--
ALTER TABLE `cms_vocabulary_node_types`
  ADD PRIMARY KEY (`type`,`vid`),
  ADD KEY `vid` (`vid`);

--
-- Indexes for table `cms_watchdog`
--
ALTER TABLE `cms_watchdog`
  ADD PRIMARY KEY (`wid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `cpsupplier`
--
ALTER TABLE `cpsupplier`
  ADD PRIMARY KEY (`idcpsupplier`),
  ADD KEY `namacp` (`namacp`,`telpcp`,`idsupplier`,`emailcp`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nonota` (`nonota`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD KEY `idlangganan` (`idpelanggan`);

--
-- Indexes for table `detailcustomerorder`
--
ALTER TABLE `detailcustomerorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpenjualan` (`idcustomerorder`,`idproduct`);

--
-- Indexes for table `detailhasilreproduksi`
--
ALTER TABLE `detailhasilreproduksi`
  ADD KEY `idpenjualan` (`idreproduksi`,`idproduct`);

--
-- Indexes for table `detaillaundry`
--
ALTER TABLE `detaillaundry`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `idpenjualan` (`idtitipanlaundry`,`idproduct`);

--
-- Indexes for table `detailpembelian`
--
ALTER TABLE `detailpembelian`
  ADD KEY `idpenjualan` (`idpembelian`,`idproduct`);

--
-- Indexes for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `idpenjualan` (`idpenjualan`,`idproduct`);

--
-- Indexes for table `detailpiutang`
--
ALTER TABLE `detailpiutang`
  ADD KEY `idpelanggan` (`idpelanggan`),
  ADD KEY `idpenjualan` (`idpenjualan`);

--
-- Indexes for table `detailpo`
--
ALTER TABLE `detailpo`
  ADD KEY `idpenjualan` (`idpo`,`idproduk`);

--
-- Indexes for table `detailreproduksi`
--
ALTER TABLE `detailreproduksi`
  ADD KEY `idpenjualan` (`idreproduksi`,`idproduct`);

--
-- Indexes for table `detailreturn`
--
ALTER TABLE `detailreturn`
  ADD KEY `idpenjualan` (`idreturn`,`idproduct`);

--
-- Indexes for table `hasilreproduksi`
--
ALTER TABLE `hasilreproduksi`
  ADD PRIMARY KEY (`idreproduksi`),
  ADD KEY `nonota` (`nonota`),
  ADD KEY `idpo` (`idpo`);

--
-- Indexes for table `historydeposit`
--
ALTER TABLE `historydeposit`
  ADD KEY `idlangganan` (`idpelanggan`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `historyhargabeli`
--
ALTER TABLE `historyhargabeli`
  ADD KEY `tglupdate` (`tglupdate`,`uid`);

--
-- Indexes for table `historypembayaran`
--
ALTER TABLE `historypembayaran`
  ADD KEY `idlangganan` (`idpelanggan`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `historypenggunaandeposit`
--
ALTER TABLE `historypenggunaandeposit`
  ADD KEY `idlangganan` (`idpelanggan`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `hutang`
--
ALTER TABLE `hutang`
  ADD KEY `idsupplier` (`idsupplier`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`),
  ADD UNIQUE KEY `kodekategori` (`kodekategori`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`),
  ADD UNIQUE KEY `kodelangganan` (`kodepelanggan`),
  ADD KEY `namalangganan` (`namapelanggan`);

--
-- Indexes for table `pemakai`
--
ALTER TABLE `pemakai`
  ADD PRIMARY KEY (`idpemakai`),
  ADD UNIQUE KEY `kodepemakai` (`kodepemakai`),
  ADD KEY `namapemakai` (`namapemakai`,`telp`);

--
-- Indexes for table `pembayaranhutang`
--
ALTER TABLE `pembayaranhutang`
  ADD KEY `idlangganan` (`idsupplier`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`idpembelian`),
  ADD KEY `nonota` (`nonota`),
  ADD KEY `idpo` (`idpo`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`idpenjualan`),
  ADD KEY `nonota` (`nonota`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
  ADD KEY `idlangganan` (`idpelanggan`);

--
-- Indexes for table `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`idpo`),
  ADD KEY `nonota` (`nopo`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `idsupplier` (`idsupplier`,`idkategori`,`idsubkategori`),
  ADD KEY `barcode` (`barcode`);

--
-- Indexes for table `reproduksi`
--
ALTER TABLE `reproduksi`
  ADD PRIMARY KEY (`idreproduksi`),
  ADD KEY `nonota` (`nonota`);

--
-- Indexes for table `returnsupplier`
--
ALTER TABLE `returnsupplier`
  ADD PRIMARY KEY (`idreturn`),
  ADD KEY `nonota` (`nonota`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `stok` (`stok`);

--
-- Indexes for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD PRIMARY KEY (`idsubkategori`),
  ADD KEY `idkategori` (`idkategori`,`kodesubkategori`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`idsupplier`),
  ADD UNIQUE KEY `kodesupplier` (`kodesupplier`),
  ADD KEY `namasupplier` (`namasupplier`,`telp`,`email`);

--
-- Indexes for table `titipanlaundry`
--
ALTER TABLE `titipanlaundry`
  ADD PRIMARY KEY (`idtitipanlaundry`),
  ADD KEY `nonota` (`nonota`);

--
-- Indexes for table `transaksistock`
--
ALTER TABLE `transaksistock`
  ADD KEY `idproduk` (`idproduk`,`tgltransaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carareturn`
--
ALTER TABLE `carareturn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cms_access`
--
ALTER TABLE `cms_access`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_actions_aid`
--
ALTER TABLE `cms_actions_aid`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_authmap`
--
ALTER TABLE `cms_authmap`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_batch`
--
ALTER TABLE `cms_batch`
  MODIFY `bid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_blocks`
--
ALTER TABLE `cms_blocks`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `cms_boxes`
--
ALTER TABLE `cms_boxes`
  MODIFY `bid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_comments`
--
ALTER TABLE `cms_comments`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_date_formats`
--
ALTER TABLE `cms_date_formats`
  MODIFY `dfid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `cms_devel_queries`
--
ALTER TABLE `cms_devel_queries`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_devel_times`
--
ALTER TABLE `cms_devel_times`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_files`
--
ALTER TABLE `cms_files`
  MODIFY `fid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `cms_filters`
--
ALTER TABLE `cms_filters`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cms_filter_formats`
--
ALTER TABLE `cms_filter_formats`
  MODIFY `format` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cms_flood`
--
ALTER TABLE `cms_flood`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_imagecache_action`
--
ALTER TABLE `cms_imagecache_action`
  MODIFY `actionid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_imagecache_preset`
--
ALTER TABLE `cms_imagecache_preset`
  MODIFY `presetid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_kategoripengeluaran`
--
ALTER TABLE `cms_kategoripengeluaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_menu_links`
--
ALTER TABLE `cms_menu_links`
  MODIFY `mlid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=984;
--
-- AUTO_INCREMENT for table `cms_node`
--
ALTER TABLE `cms_node`
  MODIFY `nid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cms_node_revisions`
--
ALTER TABLE `cms_node_revisions`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cms_pemasukan`
--
ALTER TABLE `cms_pemasukan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_pengeluaran`
--
ALTER TABLE `cms_pengeluaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_performance_detail`
--
ALTER TABLE `cms_performance_detail`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_permission`
--
ALTER TABLE `cms_permission`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `cms_role`
--
ALTER TABLE `cms_role`
  MODIFY `rid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cms_term_data`
--
ALTER TABLE `cms_term_data`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_term_relation`
--
ALTER TABLE `cms_term_relation`
  MODIFY `trid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_term_synonym`
--
ALTER TABLE `cms_term_synonym`
  MODIFY `tsid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_url_alias`
--
ALTER TABLE `cms_url_alias`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cms_views_view`
--
ALTER TABLE `cms_views_view`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_vocabulary`
--
ALTER TABLE `cms_vocabulary`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_watchdog`
--
ALTER TABLE `cms_watchdog`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cpsupplier`
--
ALTER TABLE `cpsupplier`
  MODIFY `idcpsupplier` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detailcustomerorder`
--
ALTER TABLE `detailcustomerorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detaillaundry`
--
ALTER TABLE `detaillaundry`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pemakai`
--
ALTER TABLE `pemakai`
  MODIFY `idpemakai` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idpembelian` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `idpenjualan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `po`
--
ALTER TABLE `po`
  MODIFY `idpo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `reproduksi`
--
ALTER TABLE `reproduksi`
  MODIFY `idreproduksi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `returnsupplier`
--
ALTER TABLE `returnsupplier`
  MODIFY `idreturn` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subkategori`
--
ALTER TABLE `subkategori`
  MODIFY `idsubkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `idsupplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `titipanlaundry`
--
ALTER TABLE `titipanlaundry`
  MODIFY `idtitipanlaundry` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
