-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Lis 2022, 12:26
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `strona_praktyka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album`
--

CREATE TABLE `album` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `cover_art` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `year_of_release` int(4) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `album`
--

INSERT INTO `album` (`ID`, `name`, `cover_art`, `year_of_release`, `link`) VALUES
(1, 'Undefined', '../img/undefined.png', 2021, 'album_undefined'),
(2, 'Bootleg Princess', '../img/bootlegprincess.png', 2022, 'album_bootleg_princess'),
(3, 'Vogue Society', '../img/voguesociety.png', 2022, 'album_vogue_society');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `footer`
--

CREATE TABLE `footer` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `footer`
--

INSERT INTO `footer` (`ID`, `name`, `link`) VALUES
(1, 'Youtube', 'https://www.youtube.com/channel/UCET1UxPbAb7M7CqZXo5D79w'),
(2, 'Spotify', 'https://open.spotify.com/artist/0mvaqOMQmfzd3e5z8qcSjg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `menu`
--

INSERT INTO `menu` (`ID`, `name`, `link`) VALUES
(1, 'Strona Główna', 'index'),
(2, 'Albumy', 'albumy'),
(3, 'O mnie', 'about');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `utwor`
--

CREATE TABLE `utwor` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `album` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `utwor`
--

INSERT INTO `utwor` (`ID`, `name`, `album`, `link`) VALUES
(1, 'Unaccepted History Book', 1, 'https://www.youtube-nocookie.com/embed/MB0BTRinKUs'),
(2, 'Computer Man Disappears', 1, 'https://www.youtube-nocookie.com/embed/FxcX_EtML-8'),
(3, 'Weirdo March', 1, 'https://www.youtube-nocookie.com/embed/13OFU8LPGvw'),
(4, 'Hollow', 1, 'https://www.youtube-nocookie.com/embed/v0ATPppCino'),
(5, 'Welcome Home', 1, 'https://www.youtube-nocookie.com/embed/5kNtdLR7ZTI'),
(6, 'Wibbly Wobbly!', 1, 'https://www.youtube-nocookie.com/embed/0m5DElRg0So'),
(7, 'Enigmatic Grace', 1, 'https://www.youtube-nocookie.com/embed/4hg9zHlG6UA'),
(8, 'Oversized Hoodie', 2, 'https://www.youtube-nocookie.com/embed/A_f43VVrg_U'),
(9, 'Razor Burn', 2, 'https://www.youtube-nocookie.com/embed/Ql_2uTSX--c'),
(10, 'Black Lipstick', 2, 'https://www.youtube-nocookie.com/embed/jo-KhiZZHN0'),
(11, 'Pretty Hair', 2, 'https://www.youtube-nocookie.com/embed/XI0T1IGb-Ps'),
(12, 'Low-key Skirt', 2, 'https://www.youtube-nocookie.com/embed/jcn7YzGnrpA'),
(13, 'Bootleg Princess', 2, 'https://www.youtube-nocookie.com/embed/z7rHtIk_tl4'),
(14, 'Hi fellas', 3, 'https://www.youtube-nocookie.com/embed/BMVJ1ba1teI'),
(15, 'Shroom', 3, 'https://www.youtube-nocookie.com/embed/BMCro4VPNXY'),
(16, 'Best Sensei', 3, 'https://www.youtube-nocookie.com/embed/KYMm7gGXHvY'),
(17, 'Room number twenty', 3, 'https://www.youtube-nocookie.com/embed/yu3BBN7CEWw'),
(18, 'Weeksome', 3, 'https://www.youtube-nocookie.com/embed/SpxK0PqEY_k'),
(19, 'Breakfast time', 3, 'https://www.youtube-nocookie.com/embed/6Ud6WenJ4Lk'),
(20, 'Silver\'s Alarm Clock', 3, 'https://www.youtube-nocookie.com/embed/M-FxD2rFZTw');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `utwor`
--
ALTER TABLE `utwor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_album` (`album`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `album`
--
ALTER TABLE `album`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `footer`
--
ALTER TABLE `footer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `utwor`
--
ALTER TABLE `utwor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `utwor`
--
ALTER TABLE `utwor`
  ADD CONSTRAINT `fk_album` FOREIGN KEY (`album`) REFERENCES `album` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
