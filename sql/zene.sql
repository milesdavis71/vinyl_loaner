-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Jan 10. 17:58
-- Kiszolgáló verziója: 10.4.11-MariaDB
-- PHP verzió: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zene_uj`
--
CREATE DATABASE IF NOT EXISTS `zene_uj` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `zene_uj`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `mufajid` int(11) NOT NULL,
  `eloadoid` int(11) NOT NULL,
  `albumcim` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `kiadaseve` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `album`
--

INSERT INTO `album` (`id`, `mufajid`, `eloadoid`, `albumcim`, `kiadaseve`) VALUES
(1, 1, 1, 'Sticky Fingers', 1971),
(2, 2, 3, 'Kind of Blue', 1956),
(3, 3, 4, 'The Miraculous Mandarin, Suite Sz.73a', 1963),
(5, 4, 2, 'The K & D Sessions', 1998),
(6, 4, 20, 'Blue Monday', 1986),
(7, 4, 18, 'Oxygène', 1976),
(9, 4, 16, 'Satta', 2001),
(10, 4, 19, 'Suzuki in Dub', 2001),
(11, 4, 13, 'Play', 1999),
(12, 4, 17, 'Autobahn', 1974),
(13, 2, 30, 'Moanin', 1958),
(14, 2, 31, 'Blues', 1979),
(15, 2, 29, 'Time Out', 1959),
(16, 2, 28, 'Change of the Century', 1960),
(17, 2, 3, 'Nefertiti', 1968),
(18, 2, 3, 'A Tribute to Jack Johnson', 1971),
(19, 2, 32, 'Something Else', 1958),
(25, 2, 33, 'Tribute', 1990),
(26, 2, 33, 'Personal Mountains', 1989),
(27, 2, 35, 'Chet Baker Sings', 1954),
(28, 2, 34, 'Go!', 1962),
(29, 2, 34, 'Our Man in Paris', 1963),
(30, 2, 34, 'One Flight Up', 1965),
(31, 2, 36, 'Witkacy Peyotl', 1986),
(32, 2, 35, 'Chet', 1959),
(33, 2, 32, 'Autumn Leaves', 1975),
(34, 2, 36, 'Music for K (Polish Jazz. vol. 22)', 1970),
(35, 2, 36, 'Dark Eyes', 2009),
(36, 2, 37, 'Astigmatic', 1965),
(37, 2, 36, 'Balladyna', 1976),
(38, 3, 23, 'Grand Quatuor, Op. 127 Es-Dur Pour Deux Violons, Alto Et Violoncelle', 1970),
(41, 3, 25, 'Mozart: Complete Piano Concertos', 1960),
(42, 3, 24, '\r\nChopin: Sonata No. 3 etc', 1965),
(45, 3, 21, 'Beethoven Symphonies Nos 5 & 7', 1975),
(46, 3, 22, 'Goldberg Variations', 1955),
(47, 3, 38, 'Igor Stravinsky: Petrushka', 1957),
(48, 3, 39, 'Bela Bartok: Concerto for Orchestra', 1955),
(49, 3, 39, 'Bela Bartok: Music for Strings, Percussion and Celesta', 1958),
(50, 3, 39, 'The Miraculous Mandarin Suite BB 82', 1958),
(51, 1, 5, 'In Rock', 1970),
(52, 1, 5, 'Machine Head', 1972),
(53, 1, 5, 'Fireball', 1971),
(54, 1, 9, 'Communiqué', 1979),
(57, 1, 9, 'Brothers in Arms', 1985),
(58, 1, 9, 'Love Over Gold', 1982),
(61, 1, 6, 'Rising', 1976),
(62, 1, 6, 'Long Live Rock\'N\'Roll', 1978),
(63, 1, 7, 'Fly to the Rainbow', 1974),
(64, 1, 7, 'Love at first sting ', 1978),
(65, 1, 8, '1984', 1984),
(66, 1, 8, 'Fair Warning', 1981),
(67, 1, 8, 'I.', 1978),
(68, 1, 8, 'II.', 1979),
(69, 1, 10, 'Creatures Of The Night', 1982),
(70, 1, 22, 'Permament Vacation', 1987);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eloado`
--

DROP TABLE IF EXISTS `eloado`;
CREATE TABLE `eloado` (
  `eloadid` int(11) NOT NULL,
  `eloadonev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `eloado`
--

INSERT INTO `eloado` (`eloadid`, `eloadonev`) VALUES
(12, 'Aerosmith'),
(30, 'Art Blakey és a Jazz Messengers'),
(31, 'Benkó Dixieland Band'),
(16, 'Boozoo Bajou'),
(23, 'Busch Quartett'),
(32, 'Cannonball Adderley'),
(21, 'Carlos Kleiber, Wiener Philharmoniker'),
(40, 'Charles Munch'),
(35, 'Chet Baker'),
(25, 'Daniel Barenboim'),
(29, 'Dave Brubeck'),
(5, 'Deep Purple'),
(14, 'Depeche Mode'),
(34, 'Dexter Gordon'),
(9, 'Dire Straits'),
(38, 'Ernest Ansermet'),
(39, 'Fritz Reiner'),
(4, 'George Solti, London Symphony Orchestra'),
(22, 'Glenn Gould'),
(18, 'Jean Michel Jarre'),
(33, 'Keith Jarrett'),
(10, 'Kiss'),
(37, 'Komeda Quintet'),
(17, 'Kraftwerk'),
(2, 'Krueder & Dorfmeister'),
(15, 'LTJ Bukem'),
(24, 'Martha Argerich'),
(3, 'Miles Davis'),
(13, 'Moby'),
(20, 'New Order'),
(28, 'Ornette Coleman'),
(6, 'Rainbow'),
(7, 'Scorpions'),
(26, 'Sviatoslav Richter'),
(1, 'The Rolling Stones'),
(36, 'Tomasz Stańko'),
(19, 'Tosca'),
(8, 'Van Halen'),
(11, 'Whitesnake');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE `felhasznalo` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `jelszo` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`id`, `email`, `jelszo`) VALUES
(1, 'galeria@g.hu', 'galeria'),
(2, 'pitju@p.hu', 'zene');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mufaj`
--

DROP TABLE IF EXISTS `mufaj`;
CREATE TABLE `mufaj` (
  `mufid` int(11) NOT NULL,
  `mufaj` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `mufaj`
--

INSERT INTO `mufaj` (`mufid`, `mufaj`) VALUES
(1, 'rock'),
(2, 'jazz'),
(3, 'klasszikus'),
(4, 'elektronikus');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eloadoid` (`eloadoid`),
  ADD KEY `mufajid` (`mufajid`);

--
-- A tábla indexei `eloado`
--
ALTER TABLE `eloado`
  ADD PRIMARY KEY (`eloadid`),
  ADD UNIQUE KEY `eloadonev` (`eloadonev`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `mufaj`
--
ALTER TABLE `mufaj`
  ADD PRIMARY KEY (`mufid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT a táblához `eloado`
--
ALTER TABLE `eloado`
  MODIFY `eloadid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `mufaj`
--
ALTER TABLE `mufaj`
  MODIFY `mufid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`eloadoid`) REFERENCES `eloado` (`eloadid`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`mufajid`) REFERENCES `mufaj` (`mufid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
