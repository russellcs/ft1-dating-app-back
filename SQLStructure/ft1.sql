-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 18, 2022 at 02:53 PM
-- Server version: 10.3.34-MariaDB-cll-lve
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `findspar_ks`
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

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `foreign_id`, `entry_date`) VALUES
(81, 38, 39, '2022-04-15 14:35:31'),
(83, 38, 42, '2022-04-15 14:42:41'),
(95, 38, 40, '2022-04-18 07:43:43'),
(96, 38, 43, '2022-04-18 07:43:43'),
(97, 39, 38, '2022-04-18 08:46:18'),
(98, 38, 49, '2022-04-18 08:48:49'),
(99, 38, 44, '2022-04-18 08:48:50'),
(100, 38, 45, '2022-04-18 08:48:50'),
(101, 38, 48, '2022-04-18 08:48:51'),
(102, 38, 41, '2022-04-18 08:48:51'),
(104, 38, 54, '2022-04-18 12:46:25'),
(105, 38, 53, '2022-04-18 12:46:26'),
(106, 38, 51, '2022-04-18 12:46:27'),
(107, 38, 55, '2022-04-18 12:46:28'),
(108, 46, 38, '2022-04-18 12:46:28'),
(110, 38, 56, '2022-04-18 13:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `log_login`
--

CREATE TABLE `log_login` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'ID from users table',
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_login`
--

INSERT INTO `log_login` (`id`, `user_id`, `entry_date`) VALUES
(1, 1, '2022-04-08 13:21:42'),
(2, 2, '2022-04-08 13:49:56'),
(3, 3, '2022-04-08 14:07:47'),
(4, 4, '2022-04-08 14:13:33'),
(5, 6, '2022-04-08 14:17:17'),
(6, 7, '2022-04-08 15:17:04'),
(7, 9, '2022-04-08 15:23:53'),
(8, 11, '2022-04-08 15:59:31'),
(9, 12, '2022-04-08 16:01:28'),
(10, 13, '2022-04-08 16:17:07'),
(11, 14, '2022-04-08 16:31:56'),
(12, 19, '2022-04-11 08:37:13'),
(13, 20, '2022-04-11 08:39:45'),
(14, 21, '2022-04-11 08:39:53'),
(15, 22, '2022-04-11 08:41:06'),
(16, 24, '2022-04-11 08:41:22'),
(17, 25, '2022-04-11 09:15:55'),
(18, 29, '2022-04-11 09:16:58'),
(19, 30, '2022-04-11 09:42:58'),
(20, 38, '2022-04-11 19:11:19'),
(21, 39, '2022-04-11 19:19:24'),
(22, 40, '2022-04-11 19:23:06'),
(23, 41, '2022-04-11 19:27:56'),
(24, 42, '2022-04-11 19:32:22'),
(25, 43, '2022-04-11 19:38:36'),
(26, 44, '2022-04-13 10:26:40'),
(27, 45, '2022-04-13 10:29:46'),
(28, 46, '2022-04-13 10:31:52'),
(29, 47, '2022-04-13 11:30:17'),
(30, 48, '2022-04-13 14:18:32'),
(31, 49, '2022-04-13 14:45:47'),
(32, 51, '2022-04-18 12:24:11'),
(33, 53, '2022-04-18 12:31:54'),
(34, 54, '2022-04-18 12:40:06'),
(35, 55, '2022-04-18 12:44:21'),
(36, 56, '2022-04-18 13:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `foreign_id`, `content`, `entry_date`) VALUES
(2, 1, 2, 'sup', '2022-04-08 17:47:18'),
(3, 38, 39, 'Hello', '2022-04-12 10:43:19'),
(4, 39, 38, 'Goodbye', '2022-04-12 10:43:19'),
(6, 39, 38, 'Goodbye', '2022-04-12 10:43:36'),
(7, 39, 38, 'Hi Freddie!', '2022-04-12 10:43:36'),
(8, 38, 39, 'Hi Simone, Happy Easter!', '2022-04-12 10:43:36'),
(9, 38, 39, 'Happy Easter back at you, how is your bank holiday going?', '2022-04-15 12:22:23'),
(10, 46, 38, 'fwfwef', '2022-04-15 12:35:34'),
(11, 46, 38, 'werwerwer', '2022-04-15 12:35:38'),
(12, 46, 38, 'hello', '2022-04-18 07:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `smokers` tinyint(4) NOT NULL DEFAULT 0,
  `accepted_distance` smallint(6) NOT NULL,
  `kids_accepted` tinyint(4) NOT NULL COMMENT '0=not sure\r\n1=don''t want parents\r\n2=parents ok',
  `lifestyle_marriage` tinyint(4) NOT NULL COMMENT '0=no marriage\r\n1=yes marriage',
  `lifestyle_casual` tinyint(4) NOT NULL COMMENT '0=no casual\r\n1=yes casual',
  `lifestyle_open_to_kids` tinyint(4) NOT NULL COMMENT '0=don''t want\r\n1=not sure\r\n2=open\r\n3=want'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`id`, `user_id`, `smokers`, `accepted_distance`, `kids_accepted`, `lifestyle_marriage`, `lifestyle_casual`, `lifestyle_open_to_kids`) VALUES
(19, 38, 0, 20, 2, 0, 0, 1),
(20, 39, 0, 10, 4, 0, 0, 1),
(21, 40, 0, 10, 2, 0, 0, 0),
(22, 41, 0, 10, 2, 0, 0, 2),
(23, 42, 0, 10, 0, 0, 0, 1),
(24, 43, 0, 10, 0, 0, 0, 0),
(25, 44, 0, 22, 0, 0, 0, 1),
(26, 45, 0, 22, 0, 0, 0, 1),
(27, 46, 0, 22, 0, 0, 0, 1),
(28, 47, 0, 22, 0, 0, 0, 1),
(29, 48, 0, 100, 2, 0, 0, 1),
(30, 49, 0, 22, 0, 0, 0, 1),
(31, 51, 0, 50, 0, 0, 0, 1),
(32, 53, 0, 100, 1, 0, 0, 1),
(33, 54, 0, 600, 1, 0, 0, 1),
(34, 55, 0, 67, 1, 0, 0, 0),
(35, 56, 0, 100, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seen`
--

CREATE TABLE `seen` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(128) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `entry_date`) VALUES
(1, 38, 'CbBoQeI4MpWvTpSv7lUkKRlCCUO7LOrHfGNzLLft7ZtlsNkdAf32vGF1J4B7h42IhpFGjozXA7XF2RR8ShYG0J0V86CTt7CJFSyY2IBsFPbmyBP5uvo1649766578197', '2022-04-12 12:29:38'),
(2, 38, 'xIl8jD7ZgktGHsKRDrq7puoKPRmV1vMJ2Eum8Np47BPvUh28PK7ECM0TFXri3Uuzc3Yr4QgB8itXMLNRurqm0U0U3jvnwBNLyWgde8FyfCW0BilbEax1649766604838', '2022-04-12 12:30:04'),
(3, 38, 'CvXkY1JbfU4J7uNKd39v4gZzM8aRwo3DH4uf6wY3awyn88VUkgaG5zyS3svE5C2YfCMAQ5NxaCgE1HaK09eTF2crDQozE2b5HCGngNGTnPP8HbpSnsQ1649766836316', '2022-04-12 12:33:56'),
(4, 38, 'zt5gsYYngBD09J7w2YHtSep02JSU8OCNfDAH0ZCHqJeN2bUC96a9HpCHrbFkdT2TP1Yf89uUHrbrYccAF4FXymIzCyILcNT1UuTYo7kUET5HkH2Do4U1649766848325', '2022-04-12 12:34:08'),
(5, 38, 'DjPfdFrlwA9SY2meiwXaHWY5swAHqDlADApeFYgD05TbXjzatrfUUG1BRx9foobOUmcuXIBhZxL3othUuhcONhZaEwa9ZbC6MObttsTioFkaMDvMGXC1649767676475', '2022-04-12 12:47:56'),
(6, 38, 'Wo575h20JGnTaDGlqHDVaowqdOzo1mj7FHRkfRKYv4lWMIZejTTFUfcWPoNzMBLa7tnwZm9WbUNCWBAakOq5ZR0bjf1eLsvxgBCVT57Vy6UHUkPyp5x1649768453664', '2022-04-12 13:00:53'),
(7, 38, 'Q34BnN6n0g6zhFSh7HwYfEx7TPa9uhoZ9MjW3M6s1JQul7R23nDyl3Y8awGdyqDp6UCtiht4kjtRpk0XVF7yTpzKdG9iJ3ZmnVeFP7lz2L5F3hU1qoL1649768498985', '2022-04-12 13:01:38'),
(8, 38, 'uBtJqHCnElbKT9Ef2VPijuMaooitkC38K7mOdmMgx4YFQIiHTwaVgAnSrurccq9hM4n5H9fLXhJAxLBISBvo6hjqCfXd109th2wXC5j59qAxtQXjZ5T1649768820101', '2022-04-12 13:06:59'),
(9, 38, 'BFVwut6J08A5YY4npH4HCKnf0HSxtbeuhA6qvhf6thibb40bbQhXSp6A6io3zI7I2Mu6mVcUGgjGMxx6I6MBNZYLQ4RUdJHVdmDa3iIPnm55M3CZzK51649768888429', '2022-04-12 13:08:08'),
(10, 38, 'xUlcQUm1A7GH532pr2XyZDV8CUGTnCLXPI6MtqRhgiDGfO9R7AjM9o0njWMIijjIdFQfBM54p8GJfwJnOuyg7BUsUjU4KjU91r5IV3fmv8iplayFUq51649768967183', '2022-04-12 13:09:27'),
(11, 38, 'zHC7LkPPECCMRoOk3qwUrgHU1U7lXpHUY1xLam1IIUzocRleabzt1e4QuKKgfAKvkYc0bylXCnBufJqdGgzuMOnv5eC6rqoiDzDkYKmYg2NpoBca12F1649768981607', '2022-04-12 13:09:41'),
(12, 38, 'XEti6VS9WUQpycW9dXJ7S90m40CYiP1NooIY79aSRUGWynL5uGFKY8YH883sAVPwAg1Ke4BUv6J64N7RWDRgaAqu24jEOgBkZaIss0sku3oL2ZJ6KVO1649769009787', '2022-04-12 13:10:09'),
(13, 38, 'QAv1xWRfhsWXhHUlvg63ev4c2cXA0GVAeFc69NGfTySusIrNxReGqnnnte5HXHyxbHFdHWN4HojnZjR8z2IRnnvahByDd6yKiZcisHWjf2c5JKqv1JE1649769080857', '2022-04-12 13:11:20'),
(14, 38, 'jW6wzyz5lOCjm7kZ2qSfBZlrXz1PfNad7z9IYz18et36GM3sMNmO5c7vbCUkCq6MielQkUGQKbdMIQXTcWkS3MLrmjaYJENcXiUk2XsORlOQAm6YseK1649769852332', '2022-04-12 13:24:12'),
(15, 38, 'wraUMbdVmyS2g6pmknhtFOxdhWHNrnUc1Md8abDhAPyzO8VTg6QVfRCb3yv8rFziR4T0uxw41gdlPTS2u1wBvqdvhuHmQ3LfwFqoB8jJ97vMkP2v99K1649770816561', '2022-04-12 13:40:16'),
(16, 38, 'UMw7okPjWdEB6l4fCv1WvOUxAk77Ue5zWMfWoPF5LmI5semWuiFyRSAK9dyTYPv34r7ILCDMKGKX34htFUbSaBXdfBwMYba8WEw7DynK7n9GB4apdLu1649778434597', '2022-04-12 15:47:13'),
(17, 38, 'ZfPDcCJ3d7AUoLezBZDFLArUDWcvsvBZpqdffSyjYOOw3ugga3wnvG3IMsmnqeFyaLn1fTfDrTwnPNr74AFD9EFyo57TqIc9na4HE02Weey1kT4lC9s1649778748394', '2022-04-12 15:52:27'),
(18, 38, '9tZpNxLrEqLB3UOzeJNYlwUyRvFg2VJzLU1W32wc9bU7ICSsMuQjTWqsZYuC80zzz62UUJs1mxHfoSUM8CG8TAcW4DcIGxJ5B4ep2UVAfQsUFw36UUi1649779196550', '2022-04-12 15:59:55'),
(19, 38, 'r7TJCHDDOfYExC2AUk7J69YOuolLwFTNoZAAx7l2z3cVRwqBEyie0FvK9E6Ihi5UUnzqCmBq2a0Gr7xGYyO91kjaZg1JtszPmKpJGqPc9006lzO4G8X1649779303839', '2022-04-12 16:01:42'),
(20, 38, 'f8UipOKZhY6JVEEHAKTYuhCEUP509ePR8oN4boDWjXPUHdFUAcV98VpXd47hSV2CEKIyixzPV9NpMea9MoTNGPXRkWTaTw4h3Wd5qfI1nZJUTjPqAro1649779544480', '2022-04-12 16:05:43'),
(21, 38, 'Qr9SQpxyvEzXQL0XVMRZiKw8aL6o9Cne0zsi1JNpiWfVyM4MUieW4kkJW7PTUSOEcjb2KBqMAjih4Kwk3covkFdgyHRUJcyqJFSXOVSHvdUTqB8D2Cf1649779644954', '2022-04-12 16:07:23'),
(22, 38, 'AjwPGfOcmEWdyhLsD0GJwQZjKMFHwfYSKztolR1w2gMmPvd9L0rCFZD4NWwZTUMKO90nzSnQiYG5mXs8ooFEmkteinWWEnxUECdClKw8yHUVPL7ZfXO1649779736526', '2022-04-12 16:08:55'),
(23, 38, 'HtUPjZEeFVzvAagHR8IUCyF3J0KlBOVxTHCXPiFEMaxVNueXWHATUI8Jf2sOV1LCXC5fyRfX318QBLjVkJXeujkrnps2187CANEYQhg2bIzclZyxYhU1649779828079', '2022-04-12 16:10:26'),
(24, 38, 'y2av9tpK1rDACHKtcm2jkilHcXhWTgUQ8Fr2znPINiaDJ1otUiLXi4L72QmuU4KxJlnrBgrKjy33Hf4nsIzEqrzKpLLT3giDNoZBvBeBoBh3qoNWkCr1649779869678', '2022-04-12 16:11:08'),
(25, 38, 'djH8V5wLYunLOsklTHUa24QNDPUSHKnsisjqO7LomolmNTWYckUxfW7UgUCW9ovSPKrkvRSCwncguOr0uqI3apGPMdsFpXavkuzxfXsgAjpuJ8YIVcr1649842991248', '2022-04-13 09:43:11'),
(26, 38, 'v3JchXSLagQY6MUrzYgd5V7cs73GJcM0AOe66mAagZaesKXqjIOkHE1kHcWAb9ZBW53aYSJG5gT9OlGpTtJHOUVWUwrftLuUvEjo89dz5h70R40nuUR1649843091622', '2022-04-13 09:44:51'),
(27, 38, 'tcNbkVab3K77MwASGJOpjI5TDL2fpt0Db18fLgUyI2ZGRl06G7VsZqiq7uwzmTSLjHS4pJv0zkiOoWgGttN2thO8XPKJfaUoweLMkkg8t84SXELqeYZ1649843167730', '2022-04-13 09:46:07'),
(28, 38, 'u1lw1RL264yXDnFU5ByLpLUXjWfqeZZIPLXh1r8s8TeSMytgEDHkc6vuF3RE6VOCK27BDk17SIpfU2SfkLsMxFzYbepiCURiE69rdShGjiHmINQOzAb1649843211582', '2022-04-13 09:46:51'),
(29, 38, 'NmiWG9Q8cHzB8qxwvjU8DnU3mnd1EXWViZeIsI34pqm8FR0Fp05YjefUN7eUL995G8yKGXmOZzjdywsSAa0GRrm6xZVMQvNn1AXA9cqDyNYEDN5jsES1649843237906', '2022-04-13 09:47:17'),
(30, 38, 'IStsEKCCNoSRbfjKJXVsaHKxkZnWFx1AejhpuAuuJMQByBMJkHDtKjoDy69KRef82AE0rcL5hqp5vxEwYUgvQlWhHAUUS6TmZCfcB3fLWuNQuGkeb4w1649843280011', '2022-04-13 09:47:59'),
(31, 38, 'V5kVZtGJmRYL7N85kvPxUxXOlmmaZlBxG2uSz6FLkCym8XiKPwIluCJPN1kUBgAfi5isGxzZqq0EwjEHzLQNEsqyrgmt1lSh9YHRvqBZpvIUOZvEsEU1649843358967', '2022-04-13 09:49:18'),
(32, 38, 'TITiZyJTjXXW97OA1aPEN28GoxTzE6nHuE3wRpzCvVoTJWzsGCfTjw8aDwZPW4tU7wQjFcrahj4NoJfrpuVri22WNKmceAp7anfSktuBtDMm7dLuHCR1649843415565', '2022-04-13 09:50:15'),
(33, 38, 'wBth6qLxUIVnXNEPxu5WOUXFB84R5h7YGnHeKbqOpnmKpXD27tjBBYiMQZgas8eRxU9HGId8FTEJJrZ23UZJq8adbWqfmnWebDrq8iceLIjZF8V2KLf1649843498912', '2022-04-13 09:51:38'),
(34, 38, '4lRs94zitiwqh3XvuhetYfN5pHUclwfTv2ntCJFN6p9XGybOqAKEaaPCWonZ9cla8dtXKHLIoI2NKLQK5btjRHYcAsub5yI23BFc5WBVUr7m0628Cvs1649843722314', '2022-04-13 09:55:22'),
(35, 38, 'kaJTCRPG1cSTAOY3bTEe441FUI1rONc35KBJze7HF79SHeG85bRq7QVfG2OIwjVlrhWrEdmUeGIocLURqgT0axEHUQcTcr478G8S93oSMdABO2zAI621649843921034', '2022-04-13 09:58:40'),
(36, 38, '6VFieUsixg1JJuElGwx8hm9qWn0uSyg1dTaW1SFDUJYUfxrmUUlZLFncZD1XpWtRtDba5NKazzHwqRY5dpYjNCUUVLklWegEO4b1kMhj7IexbbpypDu1649844001233', '2022-04-13 10:00:01'),
(37, 38, 'uvuNC6UnjjdIkjfeUHF9gyjk5CxSuAzWbWKDe7XVeRhDn9rcowTixdW7Ftn1ir1qDDUJ6FhwXYwbpWF365zSdIyOp4mHfoJBfUKPzlaHdVM5NAUDxQV1649844039717', '2022-04-13 10:00:39'),
(53, 38, 'EkExXSDFbMRtNy5wnGGq7QjmZF8sQxQ4AmYxoQ1sOchHuy7edO7RsNddM9ohNPOzovxZLe9093DkvBGZtBQNoCtJVkSKQw2GkICEZUICbTURHGw4odx1649930117050', '2022-04-14 09:55:17'),
(54, 38, 'I4IHBJ84EECkY6pwXTV5SKRyiHKw7riEU0iYCZLLt2mQNG55hOj89zdUU8tGKZSl63Ps8DIZKhMzwJttoEluB9FWwY0nv6CbgmH6Cac2tcbnZxlteYP1649930213977', '2022-04-14 09:56:54'),
(55, 38, 'FNcaM8T5KzXpKuyRY0wqUCpc1UMJhKanu75DmfUXwZvApM7faY2LRu5Rhs6BrCsFFpRvc5Rm6maZZVQNFrtKU98cxLilK1mgUAtq9IKrHVkKCnqWenS1649930297514', '2022-04-14 09:58:18'),
(56, 38, 'dkDIOMWqNCWpxTVnTadfPcuHDYGiDKim4EEQbVIsWOPb6Nr5vuYZra9Q2Zx1NmnioGOUwsqbMjTI64bYventDlRIxG8aqaFBC7VtOtEzsUyiBh8U0Wl1649930356707', '2022-04-14 09:59:17'),
(57, 38, 'hRsGbuBib1DSdYJRALdktz7Ea8ZrNJ199EinU0LthImaeXoskUHLxYANCgab6F46Heu07cEbEIQy0UjeuevUOOW47F6iV6PzNZ3YuWtPtP6jfPBru9X1649930621374', '2022-04-14 10:03:41'),
(58, 38, '3NXJtXn4oc8R3ahTUo5NMYuOOpIQyzuFtGcBe8IQLZnPogLKFzlUQcWvlzx6RgH2n77XLQz8a2fTXcC42vZQx4eA4EB93ZwN1Fy8hiFfxE2LFynnzrf1649930732547', '2022-04-14 10:05:33'),
(59, 38, '8FjvknthWWq1sH9LLiPtwO8pbX6mv4BMND0z4nGEUjjkZsh7SbwmuRQSLMIfFpo3yrD9IJ8HhNxiddaLGC0GVS2fMHgO9THw5ReeOjvnWxnLH5UyIcm1649931224776', '2022-04-14 10:13:45'),
(60, 38, 'S0MBwSjgk4rTiJQ6G0xdqIFHcXe0kD1ge6EjsPD779jWlbxH8wHxwXqwhDFXbugp0D4sPp1xwiSswHU0Nv8KUX6PkowiRXiDhsmir9keQ8r66bE1TZT1649931485277', '2022-04-14 10:18:05'),
(61, 38, 'uGBq8MPgOFeJGtmA1KDOYjTZK60cfmWBPH2Dpyj0AXm3Ol0hCzJEN7Wc1eivWXeeDSiLpEV6R4wK6asXMUYB0avgbJs6AAheF3ELvKACQ6PuiAfMM2w1649931676610', '2022-04-14 10:21:17'),
(62, 38, 'UmRY0w6mUtLOIczI2okrMU8HY2cD11DgglvIeDely1AV5v5l9Ywz6lRceWxtX2BUj4t9M65obgJwVviu8O6RraJ1p3xRQ3RUR7VUCkiPZm07fwVVyPL1649932734205', '2022-04-14 10:38:54'),
(63, 38, 'EeVpIJLYnb7UKHW4Ervlqmvl300SpDhSxOAFM4kKoO0XDCLjVz3nXrH3TSIg8VppXMOGiDPUQuvTJebfmgQcdCU7atZRpaczgV86IfGk2qAOwbQ6ULt1649932872998', '2022-04-14 10:41:13'),
(64, 38, 'dVmvUm1BFPYtTs6lkkhR7bVeZEp9Sv4G5n4godymHK2ZYl3bTT4wz8JXn4o1n6nUExyI0FdmKfKEO4w7vIUJV67B1LN17yP4bLsrLai0RWfXzE7wVMM1649933085831', '2022-04-14 10:44:46'),
(65, 38, '68o5UMc0wNhAdMkgLJC80QvYuSUx2RxMZ1ZikUjEUjhUVtOYQVUner57fF7HJkd6iLjuzDU1ldV068PNTUwJL9YslaRfGZ5Eu0Uamw50mAegcXOeJoi1649933563284', '2022-04-14 10:52:43'),
(66, 38, 'f4LeGGCtGzF2PL0xq6TPkdxTmZV0wVVZIIODM9tQUlQDGNPDe5EkwlN3Nfiqrgt7O9wCeDRBt4SCTYEcZwgbQYFelRIQ1EiwrgLx5m7Diub4tFhTsep1649935273635', '2022-04-14 11:21:13'),
(67, 38, 'MiOorINQRn3vHbVLnOUFoawGM3XZGIG4Mb4S3wy1dRMdJGg2KGQbXiXqfb1OwVVb54WoWzoLgraasMrhsNkxPJlg1DPFPqAzTfpB8zB6Z8CWW7AP6GC1649935303202', '2022-04-14 11:21:43'),
(71, 38, 'inbI3DPWpr9EKBdNvkJm92OfkxZgmwCkQK1aROrxFDA6h7C7qr71scrjZajB3vKpVIzHfeTMxEw0A0G2LTCAaDSASsj9ziyCjQTAW6JURlnpVZ9Z6W61649935642032', '2022-04-14 11:27:22'),
(76, 38, '0Lqn9YaxB0yuEcCs5eUUMDznzh3hIAUE0AlKIYgDbiP88dHF8AcOc1P5z3YbHHoNDdh6Rj23hR804WIgh5Mxr324EXnE8St8ewBTmUPZ3yYiBjJLXkI1649940225832', '2022-04-14 12:43:45'),
(77, 38, 'yuJsWhcX5JfYJhGZpG5eJCmCRnrzHHKwR9PvytZpzRgVALDQftkZbMlcwdzf3l5OX7vVielwZ03fRqnjC6a52F3jEHnNvIQqw21wANMDDQDGeihUGEn1649941129102', '2022-04-14 12:58:49'),
(78, 38, 'LjTeZKrXWyhltdVyyGc0leQedqjwWwVw5Y2Ywj6sWBJmrnLA1j1qm9t0I1ZqEaznbbuUTkKyeWULlNSQgnOvABHgByO0z8GlCXIDCF4ioEYIIxPT6511649943736202', '2022-04-14 13:42:16'),
(88, 38, 'aNNraFuU9tUU1P413aSTmajCy0TENQRqtnkyQnpvclLJullcaIKLlxmLQgDgj3YCVVFm2KNWpVIjE8Gk2X5V6gQpsJhspyhuSZUd8eaUQgBDh38KaUh1649946192359', '2022-04-14 14:23:12'),
(89, 38, 'Omddwwi8APCjiVLrFPwiSLE1mA2Gm0r2tKr7WVBynatZIG0jKDcX9uruzW88KjXtHL1OKkAdpY8WoOSUD3TYSrA31SjXAddwAYmY7mUzPMn96ORx7OO1649946235910', '2022-04-14 14:23:56'),
(92, 38, 'iJ9TVJvQvj5d5ePgBMKoTDXLyeIkxnyIrQmJjVDbuZplBAEuKU2piNISSG9vuUKIjQiKjdUbtE6cWQtdHNQ57fUFMIe46CPaJ4haJRfgyuaUMbk8ojU1649947029394', '2022-04-14 14:37:09'),
(93, 38, 'hTxG91er5bjKQ18XU2G4BACYM9MrgjQF2207GUu3vH0R2IHJtR3dljvhUSk6h5e3bTB3pAERPPwdTRTUPHrapU0d6tiQvaUvKm4ZQvRGC6KMyGjRbrm1649947266046', '2022-04-14 14:41:06'),
(99, 38, '6ZYO99iHcMw8b44lpHdqTM0YGbgLr3W3Umz69feH4mYmkoi6BoeTQjn4nlSRTUxby5TTlO0cBeRmhv5d5kBk4tIS8hECk6QRAbNBylVZEoNg0QfYMZ61649950195208', '2022-04-14 15:29:55'),
(100, 38, 'UAgrQClqSU8U1IUz0rUeUxE9H9Q5bkvYKD53kBbfazYhQaYadS33WZbaJX4RWUp8Lgdg04ws0Ryp69IblHZrR2q0SEThrabb0WkR2U0qu5py5URNi381649950294334', '2022-04-14 15:31:34'),
(101, 38, 'nrq3TUivHB6kgdE8VUI2KZmbamTAwPkP3f6Gdz3ZONfyyabuCdkumWi6hoYfUZY7T58LdjXZPDDMcGtUNh1bpXG2j1iQn6eRzH0n7790batvyJZbkOH1649950319873', '2022-04-14 15:32:00'),
(102, 38, 'fVb1Qcry4s5dVuTWTu7l4PY8CsUdDnbVY5U2YRoudQxDwmOCKsx73f252zipbpxSZ1ghEvdpi3GdGUT6wgSCQCsHKhfCW6W2f0yExSnTN6CNFHBgS8G1649950808076', '2022-04-14 15:40:08'),
(104, 38, 'Wkhx2segqrfrB2FdJ9qRitK6xkQ7yXSKQ91jEEejBESbJXb5hDIWmgiQ74rbN6K1ztvbOl4H7cUma7ZnJF8WllrQeBFHByLVwCa2fByao9l0jQ7qy7l1649951710952', '2022-04-14 15:55:10'),
(106, 38, 'f5MxpayKZPuVzMCS2FexWVZPTuoUmJpc3AM0N2s5be6Tfgf98DXCRIwQrUOnofPPhdC9eidiEeeK1DIdny8SVGQKdyHQHr1ExhAELUkJli9bl5PoiIz1649951925194', '2022-04-14 15:58:45'),
(107, 38, 'KUxAgodAU3YoJlu543eoZrWlXt1JlYKTWi5YALhVgHmRGKSNwLNDaiLAKcVoPeTOgmxoFl9n9pcqQxDui3t7lvyTS6YQ18ABNoMTsGh4Uv316V4Dwsj1649951946486', '2022-04-14 15:59:06'),
(108, 38, 'udFQ3bqR4DdHBa7p5C7KVwXgUMnUdjWROJDyfr2ldSkKcMZ47T5UCE5jinYAerO663enTHmTFRMmUHlpR9keADtHWryvMP52WvzU68OfUzPLZvwWCRF1649951967965', '2022-04-14 15:59:27'),
(113, 38, 'NslrJc9a9rhDyJRIfJoXAnCZchc1EmzYUiovLNsctfXYtKuyshlJhfqCGuWyDez7CiqiSHsYrh6VzQH5XWdd2QyR0kDRSUoLGoCs1XICaMMvpS3rMTF1649955303807', '2022-04-14 16:55:03'),
(117, 38, 'OjycjVl4ORRs6lnG00NX7pkgJKBpy4WLLQbs4WSApG6kTWevp6Zx8GDT5jerIdlQ1lTlZ2eU5ozVHm3eMw0U0TRDoSYOHh67XJq3IkUJqM1AYEt9BjS1649960016475', '2022-04-14 18:13:36'),
(119, 46, 'Wt5RfFjEHygoPn6tyn1oIWVATR7iteOy5jurYgnmZWEYSmwxNMXO5KjeAN2anjao4UuFuY3pYVo0O1S0nJFHp11yMYtEwKYwu6UaVNJKR7CkgMAePkC1649961720575', '2022-04-14 18:42:00'),
(120, 46, '62n4cbrpP4DFu1V7XJGjfvUtfADx4TE3ipt5pL3UvpZwp5NUeCL880GhlP3wJxqx9w52rG7AS6matY2YdmFkYTo1zry0ZDba8nKzQtsbFAVmRmWSqUD1650015574544', '2022-04-15 09:39:34'),
(121, 46, 'ib3khThymUAsMO5ABKh5Qnmh6tz0AXmvs2B9yr6VJKJPUyMwCoZbyXtGGnR8AiaXE12nNK9LNzvHN3QMwckUNL9eredKbgSeGDY4zKCFW7c6HVeqUJw1650015627768', '2022-04-15 09:40:27'),
(122, 46, 'BCXKbg9FUFtnFBUh7JSqokoQQW83vxhGl2jcueNPe9XjUOumuAxhnr7ZTikujEu059PpLTpxzQrX3nvIEPGnbA8P0uI6FcKgNtdw76HJqrz4PKR41qw1650015680583', '2022-04-15 09:41:20'),
(124, 38, 'BPRV2jDA6lSmbSLMRGq1end6LPPVuTzNnUSeZ7XRgqK1yBRgaUuOCfHts5N07075UOefDB1vnx3dX1jUKUYV79zztt0J88UFK5QkcFkUAENBsdR9Z3h1650024683164', '2022-04-15 12:11:23'),
(125, 38, '7gEtzUrmANernt0CsF7jjyBE44UKfx4m0TZo3F3T9cvUZ9nrAvcv7Vs0qc73ns3ho0ffrlfyjIguYuQexFMCkPKbZQtEXdnBYMk98GsJab9mz3Skiju1650025510975', '2022-04-15 12:25:11'),
(126, 38, '1VYqpOEuKM19xx5rdNwiF8LuL4G7zmA0HbJeFHPeGmZLAvd5m4fHQReTU89DlsVOVLRnIoubdAmVhn9tvJJxXawoiMdFqCLHjKlHl1BP2YDjVZIZ9mF1650025545350', '2022-04-15 12:25:45'),
(127, 38, 'hBlIsp40VGv1JXpaGgWSbytlUUvU9GoGQBBxMboDpHgvMTUJ1sIyAcJPbdJZlTEDB798hcl1uBPeQr8eW3xjB8O0Ev90gDS9LroUgLdOJ1zKQd0YBFe1650025948910', '2022-04-15 12:32:29'),
(128, 46, 'MP6ZarG76WE1q2flJpNRUaCtoxN2iAaEDyuz4hYwn6P4Td1Fp5wez4wtN6L0QKefjUo4ia7WDAqVoF6chpWk5waL9CtUBVUQ9NgyfUKZSP8eDRBZCKz1650026128471', '2022-04-15 12:35:28'),
(129, 38, 'GcrhGCSdPhalCSrLTdqvUD22K1vqqPf1vPiugybNXmh7fFPskwGZv9ivL3cFpibekQdkN0qW4SrxhXUThzhWjHK8XtC3jDGP9MqPjdNz4zDU6i7oR6s1650028796998', '2022-04-15 13:19:56'),
(130, 38, '8CUUvhjVJPaEmTB8PGVg85koQBmP9UVq60I58GgPG2z7q1BrlIYtTHti4c6XP5mADBo2VrYDVcnx4W7TYIWk9TYUGSHWmB6Ew7HoWQBCUDUFWC7TpBA1650029406205', '2022-04-15 13:30:06'),
(133, 38, 'mYHz0ksZjRZHpO1JZcEML6HillTTWWzUyNF4r2NK4ipJS3iM4vsu3789LLl3oNxHZOJUbO69tOZK3idyBcyRMxwMzcg6vsW3xkpid23sV06eKwL0Jbw1650030076408', '2022-04-15 13:41:16'),
(141, 38, 'I2pbz0QcdXV5q8hHOWLjOKdXPMR2nVOGznPryieq2ZOvoeUO22PgEn10KaN0V91ai1w84DuKvteXV9cW7oTY28UaW1JvydRMOTqtK2aNlgPzA3Aj3em1650031523428', '2022-04-15 14:05:23'),
(142, 38, 'PE9gXSum3JdgtwC5C0DzkJaSBUsBH0mU89Jv6b3guriiMCzhNGpSCOLO847c3qHSyLhWySQcEUf87pLV3UEVYaISctkT0PP6UrBwNo1RECET24IU0o21650031633980', '2022-04-15 14:07:14'),
(143, 38, 'Xqt9SZY2OPYyuMl4NjMcM4dANLKNPJdcJnrBPmVNXpMwDahDSfZUohNVPRxAjmglgkCw6aZGHg4EvU42m5uTRfWzyehE4zVCxZuhNkle0LEfGTs5xGo1650031688562', '2022-04-15 14:08:08'),
(144, 38, 'TkGZci4hANBC2XIVe1coe4iOsJCZU2HNZS5bu0KsKS1ZZKgtYn1CDTukaxfP5Luhpxx3uNZNvTwyClhSaCXmUbwe1IuZYqbdnRMTc4Dl2Kx2iGPKAwZ1650031762949', '2022-04-15 14:09:23'),
(145, 38, 'UkwUzThUbKeEbL9SbugTXPI6mArs9p21dmRY1JAuP3eoRQCaWiu6tedqHfBDeei2dO9jxIbjJ1S5hbxeChwU2hHjVbl47DFapVYUmXyLjShhuuTepIC1650031921648', '2022-04-15 14:12:01'),
(146, 38, 'Ndmi9BBUhGYnyiNdO3KFHHEOBDCKalhrUwdk3ZWIDI7P6SLIORxJL6czYX14KnTM95apNUd9qupcUsIRU6HRK4OGMGjMEBsqfwGKARb3g2in02xuujv1650032280770', '2022-04-15 14:18:00'),
(147, 38, 'bUkslAxEdaCFHA6y4ban34hGyit3FFmqqcfBThkAOps2H5N4ZHdrqUiYRZuPLUxcR7SNWULCUkf5NuTSUSG7SPg42tgAT1wLHMbfi8iSRnkQZZqUtd51650032532493', '2022-04-15 14:22:12'),
(148, 38, 'MR2OlIGjw9aJ23mCUNm9badVuxtTgleWUpdxij7LU7iB4GS11dCRoRjodLK3whMqRaxGVJu57wNkPjXLWXqUaCLrAIi4GdjcIxtuNIrCee2uUZwAQv71650032578428', '2022-04-15 14:22:58'),
(149, 38, 'Nhqz17O1oZI8mMWIDUJGfdJ1oE8LweWwz8wt8naepdMbcfbETG82ZcR415Iz2PN94PUsMLuut3YBmF8Uig4645Ic530646KMnTx1hVC4fMB9cxXdcN31650032697759', '2022-04-15 14:24:57'),
(150, 38, 'W3eWsNv1fkq9r13f00sO0J2S4Mar0EDzhrZuKOlhq58awwDmOJGzLwLDqfhBJ0tNK2J92KxRmAzdtjwSiH8timze3gNSAJmp3WDhW2AhVibpNS8LOGE1650032797040', '2022-04-15 14:26:37'),
(151, 38, 'jOVAVHKEUNSes8TqdHzrvZliPQ9DLHeScjdiaW0HbPxr8Hsep34HysHh9ORrTVYETFUD9gjgfFxjFNl6PXYvjZV0SpVjTZb86hSw0ZketImzFiKWx7S1650032885242', '2022-04-15 14:28:05'),
(152, 38, 'MVa8yhKOsaniJR8MMwpLeALur5IhehQaMwetPh8HUrbDoCigi8ZtMSgA49szNyEg8dK6beU8wUrbnUaVVTIIzF3g9OASxAnC1Whcpm62kV48nTbe03U1650033183557', '2022-04-15 14:33:03'),
(153, 38, 'DuR5eMp69XKE0CxfEMMYZt8Iz3DH4N4lF0ukLymRoP4jes7PwRb8EtGqddRFhuVGZEfJtU7Dinqr10BuOQGYpfWKCBs18DvAF83ZKj9SZRY0C2PdbIr1650033745115', '2022-04-15 14:42:25'),
(154, 38, 'UOMN0I4XoE1KJ8nAxtO4l6INT6WO0lj2LQ9OQYy0LHrHmM9do21LDcRUzo0Z278eGMsjhYXuEKQiXnLAn0xMUZU8a58VdKndhaRUA69DBc692uHPBS91650035011689', '2022-04-15 15:03:31'),
(155, 38, 'M52VT1S6muCK1Sadn1swSMcqBmSLVUUNEBNQq1GUBCrzWDp6TlmTxdWQFHhXzpPuSIVsBArlOQAWIEaKsLzLVEOCBIS8LMAbgq94JiFctiGcMl1tJLs1650035593271', '2022-04-15 15:13:13'),
(156, 38, 'fTACUBPRfZ9b3VkNzf5OQI8mMKKlZjffJT4gdqBN10AlGOnuPYXolmeK1VtZOMgJkuJD5590PuJ8ib6NJK2evhPHoWYbEsmYlGJKvAX4FwpPk5hsWVT1650035996281', '2022-04-15 15:19:56'),
(157, 38, 'YZsHnTUD0qVM9oeRXK384WftkRfRr2M6nCkFqiIbtGLep7eYKiHo1rIxCCUX5kkko8ZGl7bB7W5lGOwKFmwBWp4G96c1SZ1BPT2LkQUrmsgAPV9ONm11650036143014', '2022-04-15 15:22:23'),
(158, 38, 'nnDx32VXIqP2rfAUWIh0WFJAz6UtsXUh3UEoHeHVFuhgDpgtAwSUU7HXuSK1Z3wD6LnpdaWDfRfnlgOACcjsQ93aRo3FkLf8mEIsRuVg2u8UntQZV621650036238512', '2022-04-15 15:23:58'),
(159, 38, 'Oz9URWQgaN0IkwUDzPO5F9BoEBw2kzQ5yLoIbNm91mSGO7ToOIwnrPvmHjbRSLrb2jtPlJMNSZ3lb6pMeA7Q3pWPK0WHnHk99mDNYuupP7NvkGLbT3C1650036311898', '2022-04-15 15:25:11'),
(160, 38, '3STRt5IP4b3UvUQnfFjmtwsFsfdEkmV8ZB4Glyd2jCptjE0AkldRwUKQLmVlCej6KnRFUZBmLbk4SyQGyBx0sDNTbLkK4FGza1PtvMG8JKcxH69zxuV1650036467615', '2022-04-15 15:27:47'),
(161, 38, 'DKIpLlYu08iCIGmEMdnwVGw1R3bTh023vvGOrYVEHJroUbDondLPxg3RMlbfsXyUEdvV1nskf9FbIVrddC4pULJ1EvdkRm8UDjtVDqIKPuH7QL6P0Fl1650036624840', '2022-04-15 15:30:24'),
(162, 38, '3VoqzcPgzYalDGmsJ5pQHzfANBTHmQ9E3edYOXtYomUtevWzlNWPowsaU1t1GWwB9MhtfYaq7xXDpfkruslwrDrdYI3qUYLYmTNVZ34DaxgKIX3gK071650036895628', '2022-04-15 15:34:55'),
(163, 38, '2pzO3c3P93c7MiSbTZPTYsPkM29XGPv57ZBSx0Jg8Uo03bVVmN38F16Qgpy2sI9WNkSKAq8bwBbdwHc7l7l3NOXTFAzdH0oWnDN6PFdo9kCSVMeuoQU1650036994323', '2022-04-15 15:36:34'),
(164, 38, 'R8BtcZX1SW5pqammZhkdcdtb8LLF7hYUjOHz5lrsUfeeakLy5CtGKcX0Or1jhWPRnKUL4U1AEAc3JRsT8VleQKUsQrcmEi9tqMVWvIByoiSt6jO92jR1650037416395', '2022-04-15 15:43:36'),
(165, 38, 'NaPZs8eDP6c6LfcOJU3zkboThn6gQKpLkuF6lZJMW77Disg6UnP9OHh8LGoiz5VWE2aufL74HAxVZBZcdhaEq1clJT72gsOXZAmSA6JWCnSyJgpFXbL1650037525966', '2022-04-15 15:45:26'),
(166, 38, '34NLMvO0M34uh3FbnDtrmralDAkzYHrGuLwUQsrixkn9GQ3NwN6sNgpCcNXB18BqUeSoG0Gy2ZInw6z5Omy8JJWy57DMjbTEGxG3KSzTw8jhb9kGSfU1650037595168', '2022-04-15 15:46:35'),
(167, 38, 'wGOaJLhndS0w8Waey1shWJGefnYwcqyTzlAhpnVUaIZBSWTxRT6frPSBYOQr1NWVs4vApgvFfbCHQ9ZU5ap0OQe9Q9MEPWak2wOMLfWpNkcj9avXUOA1650037771766', '2022-04-15 15:49:31'),
(168, 38, 'VKZzYVH4LEF9FyGw6VtP6pzEcTeIg0IbEQCxqL0SoUUQhq9zyFA0v7M7vo06PD3dDlXZ3mwIQlr1FrpxdxTJj9m7hd64u6xXWEi8BR2yOA6qijyLQr71650038052093', '2022-04-15 15:54:12'),
(175, 38, 'HiyZWcQexoevuJUdlk9KVuCLPd5XzY32p8kW00jdBlUm1Y7VlQbocnRGPXbfmVliC2FZjHM6tfAtX34QuQN3fzrM1WUXfdZxoupvBIJ26GyshKMp5em1650271554267', '2022-04-18 08:45:54'),
(176, 38, 'nU9aBqfVIqni06NBk6j6J6HUe8h0vI9bzYrnqNQL08w9Iqm1lBSMKzM2DZVwzlw7wdlm2Liqq6mlNLhKGNEkQfDHJPqPucQtwIa2Lqmy5lhp62rKT211650271716869', '2022-04-18 08:48:36'),
(178, 46, 'pErsQGhVcoFQMlbWVaqB30wUq9NEehUrXKTdajAhJlFi9h7zFNFCgccCb4bogzof0afwU1QtR8HEKJU0UpkF4eiBYjPzcIlo5xpyGWsQjLKNVf8P26I1650271764299', '2022-04-18 08:49:24'),
(179, 46, '3AJBxNMyUUNCuW49fTZaXci1wEgtPh9Ib3nbgLieVGdJGu5Z0l367mCu9wS9tzs26flfUqz1xeqjYIzA0DZa4xcAZQrYQF9GBtQ3RQunDjRqCy2sawY1650271764340', '2022-04-18 08:49:24'),
(182, 51, 'joUARWwXIw6pSRmtS2wBfxMRyAU5RILi3hozd2KOPIXnvDxr2szRVkmlzjvq6YvH8l60KYrQRUBL8MvngFcWmGI3rFcmfkKaaUNMo1BIgkKzD6Glzfc1650284918822', '2022-04-18 12:28:38'),
(183, 53, 'l37Y9ASE6viqIj4TyqIZJH8WyZE2ULUUn1FAgnbeRkcCSbjFpQ4SelUiFG7BYq4x7XFKRZ1ddlFFZAon1xelhCklYa3NRy10aUHGdyUqumUZ0LqLljG1650285133727', '2022-04-18 12:32:13'),
(185, 38, '7aLmJ8YULFQN2W2pSTOlhGULgYlLTm1w4ufSKdpTGUIRU0rLKYQ87GypQb07gYAPZ2ELWvc8aAJG5fxRVPOhklhfCfBQZXdeHI9fxbVYZnZrEuv7cI41650286031456', '2022-04-18 12:47:11'),
(187, 38, 'BV5LVzvastBNslbZfkpHgZbBRUj1WKFkD46ESB6E30z2nILg9dBuqQEE9kuyUNq2ZbJDTNZzs1tqf5HuqKUbzzomvs6Z2c2X0JFmotuvQdOkAQGM7CM1650286270916', '2022-04-18 12:51:10'),
(190, 38, 'SfDvJZh0MhVEiY3WuYre2CJEUktbSbbhoeeb4kQSvrTJlmIyLTgee4bCqjlcfkLvwr0cZbw2vivtrqSLJJT1m6t68ciZxv08plVVoVCYRvFAxU9zfUl1650289854455', '2022-04-18 13:50:54'),
(191, 38, '4WM8XbyrsLK6fFx6I2k8bvU92n9AyTW9PNwFLamq2QkArlZRZsytpMZy2FxjagjDh2TV6yGTiKGWUdbSHTFWMWS75yjvkcMGjLkGNd7FMxXUjZLWWF01650289908784', '2022-04-18 13:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'user ID',
  `email` varchar(331) NOT NULL,
  `password` varchar(256) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '0=admin\r\n1=moderator\r\n2=customer',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is user suspended. 0=suspended',
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date of creation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `status`, `entry_date`) VALUES
(38, 'a@a.com', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-11 19:11:19'),
(39, 's@d.com', 'Simone', 2, 1, '2022-04-11 19:19:24'),
(40, 'Dante@d.com', 'Perry', 2, 1, '2022-04-11 19:23:06'),
(41, 'Jamari@d.com', 'Zhang', 2, 1, '2022-04-11 19:27:56'),
(42, 'Araceli@d.com', 'Trujilo', 2, 1, '2022-04-11 19:32:22'),
(43, 'Hiro@d.com', 'Nazuko', 2, 1, '2022-04-11 19:38:36'),
(44, 'testd1atawithimage3@a.c', 'e9dc1b81bc11a35e25edd715cfaf435fba5c6c6fd56d25add62bb1532371b0b6', 2, 1, '2022-04-13 10:26:40'),
(45, 'test@a.c', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 2, 1, '2022-04-13 10:29:46'),
(46, 'test1@a.c', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-13 10:31:52'),
(48, 'hello@a.b', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-13 14:18:31'),
(49, 'test123@a.c2', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-13 14:45:47'),
(51, 'b@b.com', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-18 12:24:11'),
(53, 'c@c.com', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-18 12:31:54'),
(54, 'd@d.com', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-18 12:40:06'),
(55, 'e@e.com', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-18 12:44:21'),
(56, 'f@f.com', 'fb1db195e9f47d4ce35ae76715c3a29533f90e7863cfe969a0e9274427775993', 2, 1, '2022-04-18 13:48:37');

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

--
-- Dumping data for table `users_preferences_ages`
--

INSERT INTO `users_preferences_ages` (`id`, `user_id`, `min_age`, `max_age`) VALUES
(19, 38, 24, 42),
(20, 39, 28, 45),
(21, 40, 25, 30),
(22, 41, 18, 30),
(23, 42, 25, 40),
(24, 43, 21, 30),
(25, 44, 22, 55),
(26, 45, 22, 55),
(27, 46, 22, 55),
(28, 47, 22, 55),
(29, 48, 18, 79),
(30, 49, 22, 55),
(31, 51, 20, 79),
(32, 53, 18, 80),
(33, 54, 18, 56),
(34, 55, 18, 88),
(35, 56, 18, 80);

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_genders`
--

CREATE TABLE `users_preferences_genders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_preferences_genders`
--

INSERT INTO `users_preferences_genders` (`id`, `user_id`, `gender_id`) VALUES
(34, 38, 1),
(35, 38, 2),
(36, 39, 0),
(37, 39, 1),
(38, 39, 2),
(39, 39, 3),
(40, 39, 4),
(41, 39, 5),
(42, 39, 6),
(43, 40, 0),
(44, 41, 1),
(45, 41, 2),
(46, 41, 3),
(47, 42, 0),
(48, 42, 1),
(49, 43, 0),
(50, 44, 1),
(51, 44, 2),
(52, 44, 3),
(53, 45, 1),
(54, 45, 2),
(55, 45, 3),
(56, 46, 1),
(57, 46, 2),
(58, 46, 3),
(59, 47, 1),
(60, 47, 2),
(61, 47, 3),
(62, 48, 0),
(63, 48, 1),
(64, 48, 2),
(65, 48, 3),
(66, 48, 4),
(67, 48, 5),
(68, 49, 1),
(69, 49, 2),
(70, 49, 3),
(71, 51, 0),
(72, 53, 0),
(73, 54, 2),
(74, 55, 2),
(75, 56, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_heights`
--

CREATE TABLE `users_preferences_heights` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `min_height` tinyint(4) NOT NULL,
  `max_height` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_preferences_heights`
--

INSERT INTO `users_preferences_heights` (`id`, `user_id`, `min_height`, `max_height`) VALUES
(16, 38, 127, 160),
(17, 39, 100, 210),
(18, 40, 127, 200),
(19, 41, 127, 175),
(20, 42, 127, 210),
(21, 43, 120, 165),
(22, 44, 66, 88),
(23, 45, 66, 88),
(24, 46, 66, 88),
(25, 47, 66, 88),
(26, 48, 120, 200),
(27, 49, 66, 88),
(28, 51, 1, 200),
(29, 53, 1, 200),
(30, 54, 56, 788),
(31, 55, 100, 200),
(32, 56, 127, 190);

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences_religions`
--

CREATE TABLE `users_preferences_religions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `religion_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `dob` date NOT NULL,
  `location_town` varchar(32) NOT NULL,
  `location_postcode` varchar(8) NOT NULL,
  `location_longitude` varchar(12) NOT NULL,
  `location_latitude` varchar(12) NOT NULL,
  `religion` tinyint(4) NOT NULL,
  `height` smallint(6) NOT NULL,
  `kids` tinyint(4) NOT NULL COMMENT '0=not saying\r\n1=no\r\n2=yes',
  `gender` tinyint(4) NOT NULL COMMENT '0=female\r\n1=male\r\n2=non-binary\r\n3=trans\r\n4=inter sex',
  `smoker` tinyint(4) NOT NULL COMMENT '0=prefer not to say\r\n1=no\r\n2=sometimes\r\n3=yes',
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `first_name`, `last_name`, `dob`, `location_town`, `location_postcode`, `location_longitude`, `location_latitude`, `religion`, `height`, `kids`, `gender`, `smoker`, `entry_date`) VALUES
(20, 38, 'Abdul', 'Aroyo', '1993-12-23', 'London', 'se27 0sr', '-0.105', '51.43', 7, 165, 0, 1, 1, '2022-04-11 19:11:19'),
(21, 39, 'Simone', 'Duboir', '1987-03-03', 'London', 'n1 0sr', '-0.118', '51.54', 1, 140, 1, 0, 0, '2022-04-11 19:19:24'),
(22, 40, 'Dante', 'Perry', '1993-07-28', 'London', 'SW19 1AA', '-0.118', '51.54', 1, 158, 1, 0, 2, '2022-04-11 19:23:06'),
(23, 41, 'Jamari', 'Zhang', '1999-01-01', 'Guildford', 'GU1 4DN', '-0.118', '51.54', 4, 180, 2, 1, 3, '2022-04-11 19:27:56'),
(24, 42, 'Araceli', 'Trujilo', '1988-09-19', 'London', 'W1 0AA', '-0.118', '51.54', 0, 155, 1, 2, 2, '2022-04-11 19:32:22'),
(25, 43, 'Hiro', 'Nazuko', '1997-04-04', 'London', 'E2 8EA', '-0.118', '51.54', 1, 155, 0, 1, 3, '2022-04-11 19:38:36'),
(26, 44, 'Fake', 'Name', '2000-01-01', 'London', 'se9 2qe', '0.077533', '51.454067', 1, 155, 1, 0, 0, '2022-04-13 10:26:40'),
(27, 45, 'Fake', 'Name', '2000-01-01', 'London', 'se9 2qe', '0.077533', '51.454067', 1, 155, 1, 0, 0, '2022-04-13 10:29:46'),
(28, 46, 'Fake', 'Name', '2000-01-01', 'London', 'se9 2qe', '0.077533', '51.454067', 1, 155, 1, 0, 0, '2022-04-13 10:31:52'),
(29, 47, 'Fake', 'Name', '2000-01-01', 'London', 'se9 2qe', '0.077533', '51.454067', 1, 155, 1, 0, 0, '2022-04-13 11:30:17'),
(30, 48, '132', '23123', '1996-01-01', 'London', 'n1 1aa', '0', '0', 9, 180, 0, 0, 0, '2022-04-13 14:18:32'),
(31, 49, 'Fake', 'Name', '2000-01-01', 'London', 'se9 2qe', '0.077533', '51.454067', 1, 155, 1, 0, 0, '2022-04-13 14:45:47'),
(32, 51, 'Bob', 'Smith', '2000-02-02', 'London', 'SW10 0AB', '-0.183053', '51.478206', 3, 180, 1, 1, 2, '2022-04-18 12:24:11'),
(33, 53, 'Tom', 'Jones', '1998-06-17', 'London', 'm1 1ad', '-2.244866', '53.483784', 1, 180, 0, 1, 2, '2022-04-18 12:31:54'),
(34, 54, 'nbfdnfg', 'ngfsngfn', '1991-03-14', 'london', 'm1 1ad', '-2.244866', '53.483784', 1, 179, 1, 1, 1, '2022-04-18 12:40:06'),
(35, 55, 'fds', 'gfdagd', '1994-11-16', 'london', 'm1 1ad', '-2.244866', '53.483784', 3, 180, 1, 2, 1, '2022-04-18 12:44:21'),
(36, 56, 'Bill', 'Gates', '1990-06-06', 'Manchester', 'm1 1ad', '-2.244866', '53.483784', 2, 180, 1, 1, 1, '2022-04-18 13:48:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocked`
--
ALTER TABLE `blocked`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blocked_combination` (`user_id`,`foreign_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `likes_combination` (`user_id`,`foreign_id`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seen_combination` (`user_id`,`foreign_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seen`
--
ALTER TABLE `seen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user ID', AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users_preferences_ages`
--
ALTER TABLE `users_preferences_ages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users_preferences_genders`
--
ALTER TABLE `users_preferences_genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users_preferences_heights`
--
ALTER TABLE `users_preferences_heights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users_preferences_religions`
--
ALTER TABLE `users_preferences_religions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
