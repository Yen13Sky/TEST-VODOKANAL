-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 22 2021 г., 14:36
-- Версия сервера: 10.1.48-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
  `ID` int(10) NOT NULL,
  `ADDRESS_WORKS` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`ID`, `ADDRESS_WORKS`) VALUES
(1, 'Торики, Аннинское ш., д. 42\r\n'),
(2, 'Уральская ул д 19\r\n'),
(3, 'Культуры пр.. д.39, лит.А\r\n'),
(4, 'Петроградская наб., д. 44\r\n'),
(5, 'Авиационная ул. д. 31\r\n'),
(6, 'Атаманская ул. д. 5 \r\n'),
(7, 'Лисичанская ул. д. 68\r\n'),
(8, 'Рузовская ул. д. 10-12\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `works`
--

CREATE TABLE `works` (
  `ID` int(10) NOT NULL,
  `ADR_ID` int(10) NOT NULL,
  `DATE_START` datetime(6) NOT NULL,
  `DATE_END` datetime(6) NOT NULL,
  `TYPE_WORKS` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALTER_WATER` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `works`
--

INSERT INTO `works` (`ID`, `ADR_ID`, `DATE_START`, `DATE_END`, `TYPE_WORKS`, `ALTER_WATER`) VALUES
(47, 1, '2019-10-21 08:00:00.000000', '2022-10-21 14:00:00.000000', 'Ремонт сети диаметром 150 мм', 0),
(48, 1, '2019-10-21 08:00:00.000000', '2022-10-21 14:00:00.000000', 'Ремонт сети диаметром 150 мм', 0),
(49, 1, '2019-10-21 08:00:00.000000', '2022-10-21 14:00:00.000000', 'Ремонт сети диаметром 150 мм', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ADR_ID` (`ADR_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addresses`
--
ALTER TABLE `addresses`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `works`
--
ALTER TABLE `works`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
