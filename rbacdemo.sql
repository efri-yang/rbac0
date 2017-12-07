-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-07 10:20:31
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbacdemo`
--

-- --------------------------------------------------------

--
-- 表的结构 `perssion`
--

CREATE TABLE `perssion` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `fname` varchar(30) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `aside` tinyint(4) NOT NULL DEFAULT '0',
  `created_time` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `perssion`
--

INSERT INTO `perssion` (`id`, `pid`, `name`, `fname`, `status`, `aside`, `created_time`) VALUES
(1, 0, '首页', 'homeIndex', 0, 1, 0),
(2, 0, '文章管理', 'articleIndex', 0, 1, 0),
(3, 2, '文章列表', 'articleList', 0, 1, 0),
(4, 2, '添加文章', 'articleAdd', 0, 1, 0),
(5, 2, '修改文章', 'articleEdit', 0, 0, 0),
(6, 2, '删除文章', 'articleDel', 0, 0, 0),
(7, 0, '角色管理', 'roleIndex', 0, 1, 0),
(8, 7, '角色列表', 'roleList', 0, 1, 0),
(9, 7, '添加角色', 'roleAdd', 0, 0, 0),
(10, 7, '修改角色', 'roleEdit', 0, 0, 0),
(11, 7, '删除角色', 'roleDel', 0, 0, 0),
(12, 0, '权限管理', 'permissionIndex', 0, 0, 0),
(13, 12, '权限列表', 'permissionList', 0, 0, 0),
(14, 12, '添加权限', 'permissionAdd', 0, 0, 0),
(15, 12, '修改权限', 'permissionEdit', 0, 0, 0),
(16, 12, '删除权限', 'permissionDel', 0, 0, 0),
(17, 0, '用户管理', 'userIndex', 0, 0, 0),
(18, 17, '用户列表', 'userList', 0, 0, 0),
(19, 17, '修改信息', 'userEdit', 0, 0, 0),
(20, 17, '添加用户', 'userAdd', 0, 0, 0),
(21, 17, '删除用户', 'userDel', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `perssion_role`
--

CREATE TABLE `perssion_role` (
  `rid` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `created_time` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `pid`, `name`, `status`, `created_time`) VALUES
(1, 0, '超级管理员', 0, 0),
(2, 1, '普通管理员', 0, 0),
(3, 2, '普通用户', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `avatar` varchar(100) NOT NULL,
  `sex` enum('男','女','保密') NOT NULL DEFAULT '保密',
  `occupation` varchar(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `reg_time` int(10) NOT NULL DEFAULT '0',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0',
  `last_login_time` int(10) NOT NULL DEFAULT '0',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

CREATE TABLE `user_role` (
  `uid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `perssion`
--
ALTER TABLE `perssion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `perssion`
--
ALTER TABLE `perssion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
