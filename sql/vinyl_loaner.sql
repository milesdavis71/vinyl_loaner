-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Már 01. 11:23
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vinyl_loaner`
--
CREATE DATABASE IF NOT EXISTS `vinyl_loaner` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vinyl_loaner`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `performer_id` int(11) NOT NULL,
  `title_of_record` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `release_date` year(4) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `loan_price` int(11) NOT NULL,
  `avbl` int(1) NOT NULL,
  `path` varchar(255) COLLATE utf8_hungarian_ci NOT NULL DEFAULT 'assets/img/covers/',
  `filename` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `album`
--

INSERT INTO `album` (`id`, `genre_id`, `performer_id`, `title_of_record`, `release_date`, `grade_id`, `loan_price`, `avbl`, `path`, `filename`) VALUES
(1, 1, 1, 'Sticky Fingers', 1971, 1, 0, 1, 'assets/img/covers/', 'the_rolling_stones_sticky_fingers.jpg'),
(2, 2, 3, 'Kind of Blue', 1956, 1, 0, 0, 'assets/img/covers/', 'miles_davis_kind_of_blue.jpg'),
(3, 3, 4, 'The Miraculous Mandarin, Suite Sz.73a', 1963, 1, 0, 0, 'assets/img/covers/', 'george_solti_the_miraculous_mandarin_music_for_strings.jpg'),
(5, 4, 2, 'The K & D Sessions', 1998, 1, 0, 0, 'assets/img/covers/', 'kureder_dorfmeister_the_k_and_d_sessions.jpg'),
(6, 4, 20, 'Blue Monday', 1986, 1, 0, 0, 'assets/img/covers/', 'new_order_blue_monday.jpg'),
(7, 4, 18, 'Oxygène', 1976, 1, 0, 0, 'assets/img/covers/', 'jean-michell_jarre_oxigene.jpg'),
(9, 4, 16, 'Satta', 2001, 1, 0, 0, 'assets/img/covers/', 'boozoo_bajou_satta.jpg'),
(10, 4, 19, 'Suzuki in Dub', 2001, 1, 0, 0, 'assets/img/covers/', 'tosca_suzuki_in_dub.jpg'),
(11, 4, 13, 'Play', 1999, 1, 0, 0, 'assets/img/covers/', 'moby_play.jpg'),
(12, 4, 17, 'Autobahn', 1974, 1, 0, 0, 'assets/img/covers/', 'kraftwerk_autobahn.jpg'),
(13, 2, 30, 'Moanin', 1958, 1, 0, 0, 'assets/img/covers/', 'art_blakey_moanin.jpg'),
(14, 2, 31, 'Blues', 1979, 1, 0, 0, 'assets/img/covers/', 'benko_dixieland_band_blues.jpg'),
(15, 2, 29, 'Time Out', 1959, 1, 0, 0, 'assets/img/covers/', 'rainbow_rising.jpg'),
(16, 2, 28, 'Change of the Century', 1960, 1, 0, 0, 'assets/img/covers/', 'ornette_coleman_change_of_the_century.jpg'),
(17, 2, 3, 'Nefertiti', 1968, 1, 0, 0, 'assets/img/covers/', 'miles_davis_nefertiti.jpg'),
(18, 2, 3, 'A Tribute to Jack Johnson', 1971, 1, 0, 0, 'assets/img/covers/', 'miles_davis_tribute_to_jack_johnson.jpg'),
(19, 2, 32, 'Something Else', 1958, 1, 0, 0, 'assets/img/covers/', 'cannonball_adderley_something_else.jpg'),
(25, 2, 33, 'Tribute', 1990, 1, 0, 0, 'assets/img/covers/', 'keith_jarrett_tribute.jpg'),
(26, 2, 33, 'Personal Mountains', 1989, 1, 0, 0, 'assets/img/covers/', 'keith_jarrett_personal mountains.jpg'),
(27, 2, 35, 'Chet Baker Sings', 1954, 1, 0, 0, 'assets/img/covers/', 'chet_baker_chet_baker_sings.jpg'),
(28, 2, 34, 'Go!', 1962, 1, 0, 0, 'assets/img/covers/', 'dexter_gordon_go.jpg'),
(29, 2, 34, 'Our Man in Paris', 1963, 1, 0, 0, 'assets/img/covers/', 'dexter_gordon_our_man_in_paris.jpg'),
(30, 2, 34, 'One Flight Up', 1965, 1, 0, 0, 'assets/img/covers/', 'dexter_gordon_one_flight_up.jpg'),
(31, 2, 36, 'Witkacy Peyotl', 1986, 1, 0, 0, 'assets/img/covers/', 'tomasz_stanko_witkacy_peyotl.jpg'),
(32, 2, 35, 'Chet', 1959, 1, 0, 0, 'assets/img/covers/', 'chet_baker_chet.jpg'),
(33, 2, 32, 'Autumn Leaves', 1975, 1, 0, 0, 'assets/img/covers/', 'cannonball_adderley_autumn_leaves.jpg'),
(34, 2, 36, 'Music for K (Polish Jazz. vol. 22)', 1970, 1, 0, 0, 'assets/img/covers/', 'tomasz_stanko_music_for_k.jpg'),
(35, 2, 36, 'Dark Eyes', 2009, 1, 0, 0, 'assets/img/covers/', 'tomasz_stanko_dark_eyes.jpg'),
(36, 2, 37, 'Astigmatic', 1965, 1, 0, 0, 'assets/img/covers/', 'komeda_quintet_astigmatic.jpg'),
(37, 2, 36, 'Balladyna', 1976, 1, 0, 0, 'assets/img/covers/', 'tomasz_stanko_balladyna.jpg'),
(38, 3, 23, 'Grand Quatuor, Op. 127 Es-Dur Pour Deux Violons, Alto Et Violoncelle', 1970, 1, 0, 0, 'assets/img/covers/', 'busch_quartett_grand_quatauor.jpg'),
(41, 3, 25, 'Mozart: Complete Piano Concertos', 1960, 1, 0, 0, 'assets/img/covers/', 'daniel_barenboim_mozart_piano_concertos.jpg'),
(42, 3, 24, 'Chopin: Sonata No. 3 etc', 1965, 1, 0, 0, 'assets/img/covers/', 'martha_argerich_chopin_sonata_no3.jpg'),
(45, 3, 21, 'Beethoven Symphonies Nos 5 & 7', 1975, 1, 0, 0, 'assets/img/covers/', 'carlos_kleiber_beethowen_symphonies5_7.jpg'),
(46, 3, 22, 'Goldberg Variations', 1955, 1, 0, 0, 'assets/img/covers/', 'glenn_gould_bach_goldberg_variations.jpg'),
(47, 3, 38, 'Petrushka', 1957, 1, 0, 0, 'assets/img/covers/', 'ernest_ansermet_strawinsky_pertouska.jpg'),
(48, 3, 39, 'Bela Bartok: Concerto for Orchestra', 1955, 1, 0, 0, 'assets/img/covers/', 'reiner_bartok_concerto_for_orchestra.jpg'),
(50, 3, 39, 'Also sprach Zarathustra', 1958, 1, 0, 0, 'assets/img/covers/', 'fritz_reiner_also_sprach_zarathustra.jpg'),
(51, 1, 5, 'In Rock', 1970, 1, 0, 0, 'assets/img/covers/', 'deep_purple_in_rock.jpg'),
(52, 1, 5, 'Machine Head', 1972, 1, 0, 0, 'assets/img/covers/', 'deep_purple_machine_head.jpg'),
(53, 1, 5, 'Fireball', 1971, 1, 0, 0, 'assets/img/covers/', 'deep_purple_fireball.jpg'),
(54, 1, 9, 'Communiqué', 1979, 1, 0, 0, 'assets/img/covers/', 'dire_straits_communique.jpg'),
(57, 1, 9, 'Brothers in Arms', 1985, 1, 0, 0, 'assets/img/covers/', 'dire_straits_brothers_in_arms.jpg'),
(58, 1, 9, 'Love Over Gold', 1982, 1, 0, 0, 'assets/img/covers/', 'dire_straits_love_over_gold.jpg'),
(61, 1, 6, 'Rising', 1976, 1, 0, 0, 'assets/img/covers/', 'rainbow_rising.jpg'),
(62, 1, 6, 'Long Live Rock\'N\'Roll', 1978, 1, 0, 0, 'assets/img/covers/', 'rainbow_long_live_rock_n_roll.jpg'),
(63, 1, 7, 'Fly to the Rainbow', 1974, 1, 0, 0, 'assets/img/covers/', 'scorpions_fly_to_the_rainbow.jpg'),
(64, 1, 7, 'Love at First Sting', 1978, 1, 0, 0, 'assets/img/covers/', 'scorpions_love_at_first.jpg'),
(65, 1, 8, '1984', 1984, 1, 0, 0, 'assets/img/covers/', 'van_halen_1984.jpg'),
(66, 1, 8, 'Fair Warning', 1981, 1, 0, 0, 'assets/img/covers/', 'van_halen_fair_warning.jpg'),
(67, 1, 8, 'I.', 1978, 1, 0, 0, 'assets/img/covers/', 'van_halen_1.jpg'),
(68, 1, 8, 'II.', 1979, 1, 0, 0, 'assets/img/covers/', 'van_halen_2.jpg'),
(69, 1, 10, 'Creatures Of The Night', 1982, 1, 0, 0, 'assets/img/covers/', 'kiss_creatures_of_the_night.jpg'),
(70, 1, 22, 'Permament Vacation', 1987, 1, 0, 0, 'assets/img/covers/', 'aerosmith_permament_vacation.jpg'),
(71, 1, 42, 'Paranoid', 1970, 1, 0, 1, 'assets/img/covers/', 'black_sabbath_paranoid.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `grading`
--

DROP TABLE IF EXISTS `grading`;
CREATE TABLE `grading` (
  `grd_id` int(11) NOT NULL,
  `grade_hu` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `grade_short` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `grade` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `descript` varchar(500) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `grading`
--

INSERT INTO `grading` (`grd_id`, `grade_hu`, `grade_short`, `grade`, `descript`) VALUES
(1, 'újszerű, kifogástalan', 'M', 'Mint', 'Teljesen kifogástalan állapotú (le nem játszott) lemez.'),
(2, 'szinte újszerű', 'NM ', 'Near mint', 'Szinte kifogástalan állapotú lemez, egy-két nagyon apró felületi hajszálkarc fellelhető rajta, a lejátszás teljesen sercegésmentes.'),
(3, 'kiváló', 'EX', 'Excellent', 'Alig használt, szinte újértékű lemez, apró felületi sérülés előfordulhat, ám ez a lejátszáskor nem hallható. A borítón minimális kopás fedezhető csak fel az éleknél vagy sarkoknál.'),
(4, 'nagyon jó', 'VG', 'Very good', 'Keveset használt lemez, felületi karcok lehetnek rajta; kis mértékű, ám a lejátszást érdemben nem zavaró sercegés előfordulhat. A borítón fellelhető árcédula, vagy annak nyoma, illetve lemez-okozta kisebb mértékű körkopás is lehetséges.'),
(5, 'jó', 'G', 'Good', 'Erősen használt lemez, zavaró sercegés hallható, de a lemez végigjátszható. A borítón nagyobb felületi kopás, gyűrődés, élén pedig szakadás található.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `music_genre`
--

DROP TABLE IF EXISTS `music_genre`;
CREATE TABLE `music_genre` (
  `genr_id` int(11) NOT NULL,
  `genre` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `music_genre`
--

INSERT INTO `music_genre` (`genr_id`, `genre`) VALUES
(1, 'rock'),
(2, 'jazz'),
(3, 'klasszikus'),
(4, 'elektronikus');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `performer`
--

DROP TABLE IF EXISTS `performer`;
CREATE TABLE `performer` (
  `perform_id` int(11) NOT NULL,
  `performer` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `performer`
--

INSERT INTO `performer` (`perform_id`, `performer`) VALUES
(12, 'Aerosmith'),
(30, 'Art Blakey és a Jazz Messengers'),
(31, 'Benkó Dixieland Band'),
(42, 'Black Sabbath'),
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
-- Tábla szerkezet ehhez a táblához `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`) VALUES
(1, 'galeria@g.hu', 'galeria'),
(2, 'pitju@p.hu', 'zene');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eloadoid` (`performer_id`),
  ADD KEY `mufajid` (`genre_id`),
  ADD KEY `grade_id` (`grade_id`);

--
-- A tábla indexei `grading`
--
ALTER TABLE `grading`
  ADD PRIMARY KEY (`grd_id`);

--
-- A tábla indexei `music_genre`
--
ALTER TABLE `music_genre`
  ADD PRIMARY KEY (`genr_id`);

--
-- A tábla indexei `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`perform_id`),
  ADD UNIQUE KEY `eloadonev` (`performer`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`user_email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT a táblához `grading`
--
ALTER TABLE `grading`
  MODIFY `grd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `music_genre`
--
ALTER TABLE `music_genre`
  MODIFY `genr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `performer`
--
ALTER TABLE `performer`
  MODIFY `perform_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`performer_id`) REFERENCES `performer` (`perform_id`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `music_genre` (`genr_id`),
  ADD CONSTRAINT `album_ibfk_3` FOREIGN KEY (`grade_id`) REFERENCES `grading` (`grd_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
