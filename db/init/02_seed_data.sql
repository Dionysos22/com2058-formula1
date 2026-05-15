-- Seed data (2020-2026)
USE formula_1;

-- ================================================
-- Generated seed from jolpica-f1 (Ergast successor)
-- Seasons: 2020..2026
-- Source API: https://api.jolpi.ca/ergast/f1
-- ================================================

-- Seasons
INSERT IGNORE INTO seasons (season_year) VALUES
(2020),
(2021),
(2022),
(2023),
(2024),
(2025),
(2026);

-- Teams (minimal; maps to teams.team_name)
INSERT IGNORE INTO teams (team_name) VALUES
('Alfa Romeo'),
('AlphaTauri'),
('Alpine F1 Team'),
('Aston Martin'),
('Audi'),
('Cadillac F1 Team'),
('Ferrari'),
('Haas F1 Team'),
('McLaren'),
('Mercedes'),
('RB F1 Team'),
('Racing Point'),
('Red Bull'),
('Renault'),
('Sauber'),
('Williams');

-- Drivers (minimal; driver_code is the stable join key)
INSERT IGNORE INTO drivers (car_no, driver_code, first_name, last_name, nation, birth_date, num_poles, num_podiums, num_championships) VALUES
(89, 'AIT', 'Jack', 'Aitken', 'British', '1995-09-23', 0, 0, 0),
(23, 'ALB', 'Alexander', 'Albon', 'Thai', '1996-03-23', 0, 0, 0),
(NULL, 'ALE', 'Alexander', 'Dunne', NULL, NULL, 0, 0, 0),
(14, 'ALO', 'Fernando', 'Alonso', 'Spanish', '1981-07-29', 0, 0, 0),
(12, 'ANT', 'Andrea Kimi', 'Antonelli', 'Italian', '2006-08-25', 0, 0, 0),
(NULL, 'ART', 'Arthur', 'Leclerc', NULL, NULL, 0, 0, 0),
(NULL, 'AYU', 'Ayumu', 'Iwasa', NULL, NULL, 0, 0, 0),
(87, 'BEA', 'Oliver', 'Bearman', 'British', '2005-05-08', 0, 0, 0),
(5, 'BOR', 'Gabriel', 'Bortoleto', 'Brazilian', '2004-10-14', 0, 0, 0),
(77, 'BOT', 'Valtteri', 'Bottas', 'Finnish', '1989-08-28', 0, 0, 0),
(NULL, 'CIA', 'Cian', 'Shields', NULL, NULL, 0, 0, 0),
(43, 'COL', 'Franco', 'Colapinto', 'Argentine', '2003-05-27', 0, 0, 0),
(21, 'DEV', 'Nyck', 'de Vries', 'Dutch', '1995-02-06', 0, 0, 0),
(NULL, 'DIN', 'Dino', 'Beganovic', NULL, NULL, 0, 0, 0),
(7, 'DOO', 'Jack', 'Doohan', 'Australian', '2003-01-20', 0, 0, 0),
(NULL, 'FEL', 'Felipe', 'Drugovich', NULL, NULL, 0, 0, 0),
(51, 'FIT', 'Pietro', 'Fittipaldi', 'Brazilian', '1996-06-25', 0, 0, 0),
(NULL, 'FRE', 'Frederik', 'Vesti', NULL, NULL, 0, 0, 0),
(10, 'GAS', 'Pierre', 'Gasly', 'French', '1996-02-07', 0, 0, 0),
(99, 'GIO', 'Antonio', 'Giovinazzi', 'Italian', '1993-12-14', 0, 0, 0),
(8, 'GRO', 'Romain', 'Grosjean', 'French', '1986-04-17', 0, 0, 0),
(6, 'HAD', 'Isack', 'Hadjar', 'French', '2004-09-28', 0, 0, 0),
(44, 'HAM', 'Lewis', 'Hamilton', 'British', '1985-01-07', 0, 0, 0),
(27, 'HUL', 'Nico', 'Hülkenberg', 'German', '1987-08-19', 0, 0, 0),
(NULL, 'JAK', 'Jak', 'Crawford', NULL, NULL, 0, 0, 0),
(88, 'KUB', 'Robert', 'Kubica', 'Polish', '1984-12-07', 0, 0, 0),
(26, 'KVY', 'Daniil', 'Kvyat', 'Russian', '1994-04-26', 0, 0, 0),
(6, 'LAT', 'Nicholas', 'Latifi', 'Canadian', '1995-06-29', 0, 0, 0),
(30, 'LAW', 'Liam', 'Lawson', 'New Zealander', '2002-02-11', 0, 0, 0),
(16, 'LEC', 'Charles', 'Leclerc', 'Monegasque', '1997-10-16', 0, 0, 0),
(41, 'LIN', 'Arvid', 'Lindblad', 'British', '2007-08-08', 0, 0, 0),
(NULL, 'LUK', 'Luke', 'Browning', NULL, NULL, 0, 0, 0),
(20, 'MAG', 'Kevin', 'Magnussen', 'Danish', '1992-10-05', 0, 0, 0),
(9, 'MAZ', 'Nikita', 'Mazepin', 'Russian', '1999-03-02', 0, 0, 0),
(47, 'MSC', 'Mick', 'Schumacher', 'German', '1999-03-22', 0, 0, 0),
(1, 'NOR', 'Lando', 'Norris', 'British', '1999-11-13', 0, 0, 0),
(31, 'OCO', 'Esteban', 'Ocon', 'French', '1996-09-17', 0, 0, 0),
(NULL, 'PAT', 'Patricio', 'O''Ward', NULL, NULL, 0, 0, 0),
(NULL, 'PAU', 'Paul', 'Aron', NULL, NULL, 0, 0, 0),
(11, 'PER', 'Sergio', 'Pérez', 'Mexican', '1990-01-26', 0, 0, 0),
(81, 'PIA', 'Oscar', 'Piastri', 'Australian', '2001-04-06', 0, 0, 0),
(7, 'RAI', 'Kimi', 'Räikkönen', 'Finnish', '1979-10-17', 0, 0, 0),
(3, 'RIC', 'Daniel', 'Ricciardo', 'Australian', '1989-07-01', 0, 0, 0),
(63, 'RUS', 'George', 'Russell', 'British', '1998-02-15', 0, 0, 0),
(NULL, 'RYO', 'Ryo', 'Hirakawa', NULL, NULL, 0, 0, 0),
(55, 'SAI', 'Carlos', 'Sainz', 'Spanish', '1994-09-01', 0, 0, 0),
(2, 'SAR', 'Logan', 'Sargeant', 'American', '2000-12-31', 0, 0, 0),
(18, 'STR', 'Lance', 'Stroll', 'Canadian', '1998-10-29', 0, 0, 0),
(22, 'TSU', 'Yuki', 'Tsunoda', 'Japanese', '2000-05-11', 0, 0, 0),
(3, 'VER', 'Max', 'Verstappen', 'Dutch', '1997-09-30', 0, 0, 0),
(5, 'VET', 'Sebastian', 'Vettel', 'German', '1987-07-03', 0, 0, 0),
(NULL, 'VIC', 'Victor', 'Martins', NULL, NULL, 0, 0, 0),
(24, 'ZHO', 'Guanyu', 'Zhou', 'Chinese', '1999-05-30', 0, 0, 0);

-- Circuits (historical rows won't have laps/length/fastest in Ergast)
INSERT IGNORE INTO circuits (circuit_name, country, city, laps, length_m, first_gp_year, fastest_lap_time) VALUES
('Albert Park Grand Prix Circuit', 'Australia', 'Melbourne', NULL, NULL, NULL, NULL),
('Autodromo Enzo e Dino Ferrari', 'Italy', 'Imola', NULL, NULL, NULL, NULL),
('Autodromo Internazionale del Mugello', 'Italy', 'Mugello', NULL, NULL, NULL, NULL),
('Autodromo Nazionale di Monza', 'Italy', 'Monza', NULL, NULL, NULL, NULL),
('Autódromo Hermanos Rodríguez', 'Mexico', 'Mexico City', NULL, NULL, NULL, NULL),
('Autódromo Internacional do Algarve', 'Portugal', 'Portimão', NULL, NULL, NULL, NULL),
('Autódromo José Carlos Pace', 'Brazil', 'São Paulo', NULL, NULL, NULL, NULL),
('Bahrain International Circuit', 'Bahrain', 'Sakhir', NULL, NULL, NULL, NULL),
('Baku City Circuit', 'Azerbaijan', 'Baku', NULL, NULL, NULL, NULL),
('Circuit Gilles Villeneuve', 'Canada', 'Montreal', NULL, NULL, NULL, NULL),
('Circuit Park Zandvoort', 'Netherlands', 'Zandvoort', NULL, NULL, NULL, NULL),
('Circuit Paul Ricard', 'France', 'Le Castellet', NULL, NULL, NULL, NULL),
('Circuit de Barcelona-Catalunya', 'Spain', 'Barcelona', NULL, NULL, NULL, NULL),
('Circuit de Monaco', 'Monaco', 'Monte Carlo', NULL, NULL, NULL, NULL),
('Circuit de Spa-Francorchamps', 'Belgium', 'Spa', NULL, NULL, NULL, NULL),
('Circuit of the Americas', 'USA', 'Austin', NULL, NULL, NULL, NULL),
('Hungaroring', 'Hungary', 'Budapest', NULL, NULL, NULL, NULL),
('Istanbul Park', 'Turkey', 'Istanbul', NULL, NULL, NULL, NULL),
('Jeddah Corniche Circuit', 'Saudi Arabia', 'Jeddah', NULL, NULL, NULL, NULL),
('Las Vegas Strip Street Circuit', 'USA', 'Las Vegas', NULL, NULL, NULL, NULL),
('Losail International Circuit', 'Qatar', 'Lusail', NULL, NULL, NULL, NULL),
('Madring', 'Spain', 'Madrid', NULL, NULL, NULL, NULL),
('Marina Bay Street Circuit', 'Singapore', 'Marina Bay', NULL, NULL, NULL, NULL),
('Miami International Autodrome', 'USA', 'Miami', NULL, NULL, NULL, NULL),
('Nürburgring', 'Germany', 'Nürburg', NULL, NULL, NULL, NULL),
('Red Bull Ring', 'Austria', 'Spielberg', NULL, NULL, NULL, NULL),
('Shanghai International Circuit', 'China', 'Shanghai', NULL, NULL, NULL, NULL),
('Silverstone Circuit', 'UK', 'Silverstone', NULL, NULL, NULL, NULL),
('Sochi Autodrom', 'Russia', 'Sochi', NULL, NULL, NULL, NULL),
('Suzuka Circuit', 'Japan', 'Suzuka', NULL, NULL, NULL, NULL),
('Yas Marina Circuit', 'UAE', 'Abu Dhabi', NULL, NULL, NULL, NULL);

-- Races / Schedule
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 1, circuit_id, 'Austrian Grand Prix', '2020-07-05', '2020-07-05'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 2, circuit_id, 'Styrian Grand Prix', '2020-07-12', '2020-07-12'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 3, circuit_id, 'Hungarian Grand Prix', '2020-07-19', '2020-07-19'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 4, circuit_id, 'British Grand Prix', '2020-08-02', '2020-08-02'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 5, circuit_id, '70th Anniversary Grand Prix', '2020-08-09', '2020-08-09'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 6, circuit_id, 'Spanish Grand Prix', '2020-08-16', '2020-08-16'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 7, circuit_id, 'Belgian Grand Prix', '2020-08-30', '2020-08-30'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 8, circuit_id, 'Italian Grand Prix', '2020-09-06', '2020-09-06'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 9, circuit_id, 'Tuscan Grand Prix', '2020-09-13', '2020-09-13'
FROM circuits WHERE circuit_name='Autodromo Internazionale del Mugello';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 10, circuit_id, 'Russian Grand Prix', '2020-09-27', '2020-09-27'
FROM circuits WHERE circuit_name='Sochi Autodrom';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 11, circuit_id, 'Eifel Grand Prix', '2020-10-11', '2020-10-11'
FROM circuits WHERE circuit_name='Nürburgring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 12, circuit_id, 'Portuguese Grand Prix', '2020-10-25', '2020-10-25'
FROM circuits WHERE circuit_name='Autódromo Internacional do Algarve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 13, circuit_id, 'Emilia Romagna Grand Prix', '2020-11-01', '2020-11-01'
FROM circuits WHERE circuit_name='Autodromo Enzo e Dino Ferrari';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 14, circuit_id, 'Turkish Grand Prix', '2020-11-15', '2020-11-15'
FROM circuits WHERE circuit_name='Istanbul Park';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 15, circuit_id, 'Bahrain Grand Prix', '2020-11-29', '2020-11-29'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 16, circuit_id, 'Sakhir Grand Prix', '2020-12-06', '2020-12-06'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2020, 17, circuit_id, 'Abu Dhabi Grand Prix', '2020-12-13', '2020-12-13'
FROM circuits WHERE circuit_name='Yas Marina Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 1, circuit_id, 'Bahrain Grand Prix', '2021-03-28', '2021-03-28'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 2, circuit_id, 'Emilia Romagna Grand Prix', '2021-04-18', '2021-04-18'
FROM circuits WHERE circuit_name='Autodromo Enzo e Dino Ferrari';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 3, circuit_id, 'Portuguese Grand Prix', '2021-05-02', '2021-05-02'
FROM circuits WHERE circuit_name='Autódromo Internacional do Algarve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 4, circuit_id, 'Spanish Grand Prix', '2021-05-09', '2021-05-09'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 5, circuit_id, 'Monaco Grand Prix', '2021-05-23', '2021-05-23'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 6, circuit_id, 'Azerbaijan Grand Prix', '2021-06-06', '2021-06-06'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 7, circuit_id, 'French Grand Prix', '2021-06-20', '2021-06-20'
FROM circuits WHERE circuit_name='Circuit Paul Ricard';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 8, circuit_id, 'Styrian Grand Prix', '2021-06-27', '2021-06-27'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 9, circuit_id, 'Austrian Grand Prix', '2021-07-04', '2021-07-04'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 10, circuit_id, 'British Grand Prix', '2021-07-18', '2021-07-18'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 11, circuit_id, 'Hungarian Grand Prix', '2021-08-01', '2021-08-01'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 12, circuit_id, 'Belgian Grand Prix', '2021-08-29', '2021-08-29'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 13, circuit_id, 'Dutch Grand Prix', '2021-09-05', '2021-09-05'
FROM circuits WHERE circuit_name='Circuit Park Zandvoort';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 14, circuit_id, 'Italian Grand Prix', '2021-09-12', '2021-09-12'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 15, circuit_id, 'Russian Grand Prix', '2021-09-26', '2021-09-26'
FROM circuits WHERE circuit_name='Sochi Autodrom';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 16, circuit_id, 'Turkish Grand Prix', '2021-10-10', '2021-10-10'
FROM circuits WHERE circuit_name='Istanbul Park';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 17, circuit_id, 'United States Grand Prix', '2021-10-24', '2021-10-24'
FROM circuits WHERE circuit_name='Circuit of the Americas';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 18, circuit_id, 'Mexico City Grand Prix', '2021-11-07', '2021-11-07'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 19, circuit_id, 'São Paulo Grand Prix', '2021-11-14', '2021-11-14'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 20, circuit_id, 'Qatar Grand Prix', '2021-11-21', '2021-11-21'
FROM circuits WHERE circuit_name='Losail International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 21, circuit_id, 'Saudi Arabian Grand Prix', '2021-12-05', '2021-12-05'
FROM circuits WHERE circuit_name='Jeddah Corniche Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2021, 22, circuit_id, 'Abu Dhabi Grand Prix', '2021-12-12', '2021-12-12'
FROM circuits WHERE circuit_name='Yas Marina Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 1, circuit_id, 'Bahrain Grand Prix', '2022-03-20', '2022-03-20'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 2, circuit_id, 'Saudi Arabian Grand Prix', '2022-03-27', '2022-03-27'
FROM circuits WHERE circuit_name='Jeddah Corniche Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 3, circuit_id, 'Australian Grand Prix', '2022-04-10', '2022-04-10'
FROM circuits WHERE circuit_name='Albert Park Grand Prix Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 4, circuit_id, 'Emilia Romagna Grand Prix', '2022-04-24', '2022-04-24'
FROM circuits WHERE circuit_name='Autodromo Enzo e Dino Ferrari';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 5, circuit_id, 'Miami Grand Prix', '2022-05-08', '2022-05-08'
FROM circuits WHERE circuit_name='Miami International Autodrome';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 6, circuit_id, 'Spanish Grand Prix', '2022-05-22', '2022-05-22'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 7, circuit_id, 'Monaco Grand Prix', '2022-05-29', '2022-05-29'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 8, circuit_id, 'Azerbaijan Grand Prix', '2022-06-12', '2022-06-12'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 9, circuit_id, 'Canadian Grand Prix', '2022-06-19', '2022-06-19'
FROM circuits WHERE circuit_name='Circuit Gilles Villeneuve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 10, circuit_id, 'British Grand Prix', '2022-07-03', '2022-07-03'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 11, circuit_id, 'Austrian Grand Prix', '2022-07-10', '2022-07-10'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 12, circuit_id, 'French Grand Prix', '2022-07-24', '2022-07-24'
FROM circuits WHERE circuit_name='Circuit Paul Ricard';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 13, circuit_id, 'Hungarian Grand Prix', '2022-07-31', '2022-07-31'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 14, circuit_id, 'Belgian Grand Prix', '2022-08-28', '2022-08-28'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 15, circuit_id, 'Dutch Grand Prix', '2022-09-04', '2022-09-04'
FROM circuits WHERE circuit_name='Circuit Park Zandvoort';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 16, circuit_id, 'Italian Grand Prix', '2022-09-11', '2022-09-11'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 17, circuit_id, 'Singapore Grand Prix', '2022-10-02', '2022-10-02'
FROM circuits WHERE circuit_name='Marina Bay Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 18, circuit_id, 'Japanese Grand Prix', '2022-10-09', '2022-10-09'
FROM circuits WHERE circuit_name='Suzuka Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 19, circuit_id, 'United States Grand Prix', '2022-10-23', '2022-10-23'
FROM circuits WHERE circuit_name='Circuit of the Americas';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 20, circuit_id, 'Mexico City Grand Prix', '2022-10-30', '2022-10-30'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 21, circuit_id, 'São Paulo Grand Prix', '2022-11-13', '2022-11-13'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2022, 22, circuit_id, 'Abu Dhabi Grand Prix', '2022-11-20', '2022-11-20'
FROM circuits WHERE circuit_name='Yas Marina Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 1, circuit_id, 'Bahrain Grand Prix', '2023-03-05', '2023-03-05'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 2, circuit_id, 'Saudi Arabian Grand Prix', '2023-03-19', '2023-03-19'
FROM circuits WHERE circuit_name='Jeddah Corniche Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 3, circuit_id, 'Australian Grand Prix', '2023-04-02', '2023-04-02'
FROM circuits WHERE circuit_name='Albert Park Grand Prix Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 4, circuit_id, 'Azerbaijan Grand Prix', '2023-04-30', '2023-04-30'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 5, circuit_id, 'Miami Grand Prix', '2023-05-07', '2023-05-07'
FROM circuits WHERE circuit_name='Miami International Autodrome';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 6, circuit_id, 'Monaco Grand Prix', '2023-05-28', '2023-05-28'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 7, circuit_id, 'Spanish Grand Prix', '2023-06-04', '2023-06-04'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 8, circuit_id, 'Canadian Grand Prix', '2023-06-18', '2023-06-18'
FROM circuits WHERE circuit_name='Circuit Gilles Villeneuve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 9, circuit_id, 'Austrian Grand Prix', '2023-07-02', '2023-07-02'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 10, circuit_id, 'British Grand Prix', '2023-07-09', '2023-07-09'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 11, circuit_id, 'Hungarian Grand Prix', '2023-07-23', '2023-07-23'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 12, circuit_id, 'Belgian Grand Prix', '2023-07-30', '2023-07-30'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 13, circuit_id, 'Dutch Grand Prix', '2023-08-27', '2023-08-27'
FROM circuits WHERE circuit_name='Circuit Park Zandvoort';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 14, circuit_id, 'Italian Grand Prix', '2023-09-03', '2023-09-03'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 15, circuit_id, 'Singapore Grand Prix', '2023-09-17', '2023-09-17'
FROM circuits WHERE circuit_name='Marina Bay Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 16, circuit_id, 'Japanese Grand Prix', '2023-09-24', '2023-09-24'
FROM circuits WHERE circuit_name='Suzuka Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 17, circuit_id, 'Qatar Grand Prix', '2023-10-08', '2023-10-08'
FROM circuits WHERE circuit_name='Losail International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 18, circuit_id, 'United States Grand Prix', '2023-10-22', '2023-10-22'
FROM circuits WHERE circuit_name='Circuit of the Americas';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 19, circuit_id, 'Mexico City Grand Prix', '2023-10-29', '2023-10-29'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 20, circuit_id, 'São Paulo Grand Prix', '2023-11-05', '2023-11-05'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 21, circuit_id, 'Las Vegas Grand Prix', '2023-11-19', '2023-11-19'
FROM circuits WHERE circuit_name='Las Vegas Strip Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2023, 22, circuit_id, 'Abu Dhabi Grand Prix', '2023-11-26', '2023-11-26'
FROM circuits WHERE circuit_name='Yas Marina Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 1, circuit_id, 'Bahrain Grand Prix', '2024-03-02', '2024-03-02'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 2, circuit_id, 'Saudi Arabian Grand Prix', '2024-03-09', '2024-03-09'
FROM circuits WHERE circuit_name='Jeddah Corniche Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 3, circuit_id, 'Australian Grand Prix', '2024-03-24', '2024-03-24'
FROM circuits WHERE circuit_name='Albert Park Grand Prix Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 4, circuit_id, 'Japanese Grand Prix', '2024-04-07', '2024-04-07'
FROM circuits WHERE circuit_name='Suzuka Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 5, circuit_id, 'Chinese Grand Prix', '2024-04-21', '2024-04-21'
FROM circuits WHERE circuit_name='Shanghai International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 6, circuit_id, 'Miami Grand Prix', '2024-05-05', '2024-05-05'
FROM circuits WHERE circuit_name='Miami International Autodrome';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 7, circuit_id, 'Emilia Romagna Grand Prix', '2024-05-19', '2024-05-19'
FROM circuits WHERE circuit_name='Autodromo Enzo e Dino Ferrari';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 8, circuit_id, 'Monaco Grand Prix', '2024-05-26', '2024-05-26'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 9, circuit_id, 'Canadian Grand Prix', '2024-06-09', '2024-06-09'
FROM circuits WHERE circuit_name='Circuit Gilles Villeneuve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 10, circuit_id, 'Spanish Grand Prix', '2024-06-23', '2024-06-23'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 11, circuit_id, 'Austrian Grand Prix', '2024-06-30', '2024-06-30'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 12, circuit_id, 'British Grand Prix', '2024-07-07', '2024-07-07'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 13, circuit_id, 'Hungarian Grand Prix', '2024-07-21', '2024-07-21'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 14, circuit_id, 'Belgian Grand Prix', '2024-07-28', '2024-07-28'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 15, circuit_id, 'Dutch Grand Prix', '2024-08-25', '2024-08-25'
FROM circuits WHERE circuit_name='Circuit Park Zandvoort';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 16, circuit_id, 'Italian Grand Prix', '2024-09-01', '2024-09-01'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 17, circuit_id, 'Azerbaijan Grand Prix', '2024-09-15', '2024-09-15'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 18, circuit_id, 'Singapore Grand Prix', '2024-09-22', '2024-09-22'
FROM circuits WHERE circuit_name='Marina Bay Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 19, circuit_id, 'United States Grand Prix', '2024-10-20', '2024-10-20'
FROM circuits WHERE circuit_name='Circuit of the Americas';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 20, circuit_id, 'Mexico City Grand Prix', '2024-10-27', '2024-10-27'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 21, circuit_id, 'São Paulo Grand Prix', '2024-11-03', '2024-11-03'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 22, circuit_id, 'Las Vegas Grand Prix', '2024-11-23', '2024-11-23'
FROM circuits WHERE circuit_name='Las Vegas Strip Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 23, circuit_id, 'Qatar Grand Prix', '2024-12-01', '2024-12-01'
FROM circuits WHERE circuit_name='Losail International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2024, 24, circuit_id, 'Abu Dhabi Grand Prix', '2024-12-08', '2024-12-08'
FROM circuits WHERE circuit_name='Yas Marina Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 1, circuit_id, 'Australian Grand Prix', '2025-03-16', '2025-03-16'
FROM circuits WHERE circuit_name='Albert Park Grand Prix Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 2, circuit_id, 'Chinese Grand Prix', '2025-03-23', '2025-03-23'
FROM circuits WHERE circuit_name='Shanghai International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 3, circuit_id, 'Japanese Grand Prix', '2025-04-06', '2025-04-06'
FROM circuits WHERE circuit_name='Suzuka Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 4, circuit_id, 'Bahrain Grand Prix', '2025-04-13', '2025-04-13'
FROM circuits WHERE circuit_name='Bahrain International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 5, circuit_id, 'Saudi Arabian Grand Prix', '2025-04-20', '2025-04-20'
FROM circuits WHERE circuit_name='Jeddah Corniche Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 6, circuit_id, 'Miami Grand Prix', '2025-05-04', '2025-05-04'
FROM circuits WHERE circuit_name='Miami International Autodrome';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 7, circuit_id, 'Emilia Romagna Grand Prix', '2025-05-18', '2025-05-18'
FROM circuits WHERE circuit_name='Autodromo Enzo e Dino Ferrari';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 8, circuit_id, 'Monaco Grand Prix', '2025-05-25', '2025-05-25'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 9, circuit_id, 'Spanish Grand Prix', '2025-06-01', '2025-06-01'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 10, circuit_id, 'Canadian Grand Prix', '2025-06-15', '2025-06-15'
FROM circuits WHERE circuit_name='Circuit Gilles Villeneuve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 11, circuit_id, 'Austrian Grand Prix', '2025-06-29', '2025-06-29'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 12, circuit_id, 'British Grand Prix', '2025-07-06', '2025-07-06'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 13, circuit_id, 'Belgian Grand Prix', '2025-07-27', '2025-07-27'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 14, circuit_id, 'Hungarian Grand Prix', '2025-08-03', '2025-08-03'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 15, circuit_id, 'Dutch Grand Prix', '2025-08-31', '2025-08-31'
FROM circuits WHERE circuit_name='Circuit Park Zandvoort';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 16, circuit_id, 'Italian Grand Prix', '2025-09-07', '2025-09-07'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 17, circuit_id, 'Azerbaijan Grand Prix', '2025-09-21', '2025-09-21'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 18, circuit_id, 'Singapore Grand Prix', '2025-10-05', '2025-10-05'
FROM circuits WHERE circuit_name='Marina Bay Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 19, circuit_id, 'United States Grand Prix', '2025-10-19', '2025-10-19'
FROM circuits WHERE circuit_name='Circuit of the Americas';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 20, circuit_id, 'Mexico City Grand Prix', '2025-10-26', '2025-10-26'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 21, circuit_id, 'São Paulo Grand Prix', '2025-11-09', '2025-11-09'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 22, circuit_id, 'Las Vegas Grand Prix', '2025-11-23', '2025-11-23'
FROM circuits WHERE circuit_name='Las Vegas Strip Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 23, circuit_id, 'Qatar Grand Prix', '2025-11-30', '2025-11-30'
FROM circuits WHERE circuit_name='Losail International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2025, 24, circuit_id, 'Abu Dhabi Grand Prix', '2025-12-07', '2025-12-07'
FROM circuits WHERE circuit_name='Yas Marina Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 1, circuit_id, 'Australian Grand Prix', '2026-03-08', '2026-03-08'
FROM circuits WHERE circuit_name='Albert Park Grand Prix Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 2, circuit_id, 'Chinese Grand Prix', '2026-03-15', '2026-03-15'
FROM circuits WHERE circuit_name='Shanghai International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 3, circuit_id, 'Japanese Grand Prix', '2026-03-29', '2026-03-29'
FROM circuits WHERE circuit_name='Suzuka Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 4, circuit_id, 'Miami Grand Prix', '2026-05-03', '2026-05-03'
FROM circuits WHERE circuit_name='Miami International Autodrome';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 5, circuit_id, 'Canadian Grand Prix', '2026-05-24', '2026-05-24'
FROM circuits WHERE circuit_name='Circuit Gilles Villeneuve';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 6, circuit_id, 'Monaco Grand Prix', '2026-06-07', '2026-06-07'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 7, circuit_id, 'Barcelona Grand Prix', '2026-06-14', '2026-06-14'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 8, circuit_id, 'Austrian Grand Prix', '2026-06-28', '2026-06-28'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 9, circuit_id, 'British Grand Prix', '2026-07-05', '2026-07-05'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 10, circuit_id, 'Belgian Grand Prix', '2026-07-19', '2026-07-19'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 11, circuit_id, 'Hungarian Grand Prix', '2026-07-26', '2026-07-26'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 12, circuit_id, 'Dutch Grand Prix', '2026-08-23', '2026-08-23'
FROM circuits WHERE circuit_name='Circuit Park Zandvoort';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 13, circuit_id, 'Italian Grand Prix', '2026-09-06', '2026-09-06'
FROM circuits WHERE circuit_name='Autodromo Nazionale di Monza';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 14, circuit_id, 'Spanish Grand Prix', '2026-09-13', '2026-09-13'
FROM circuits WHERE circuit_name='Madring';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 15, circuit_id, 'Azerbaijan Grand Prix', '2026-09-26', '2026-09-26'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 16, circuit_id, 'Singapore Grand Prix', '2026-10-11', '2026-10-11'
FROM circuits WHERE circuit_name='Marina Bay Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 17, circuit_id, 'United States Grand Prix', '2026-10-25', '2026-10-25'
FROM circuits WHERE circuit_name='Circuit of the Americas';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 18, circuit_id, 'Mexico City Grand Prix', '2026-11-01', '2026-11-01'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 19, circuit_id, 'Brazilian Grand Prix', '2026-11-08', '2026-11-08'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 20, circuit_id, 'Las Vegas Grand Prix', '2026-11-22', '2026-11-22'
FROM circuits WHERE circuit_name='Las Vegas Strip Street Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 21, circuit_id, 'Qatar Grand Prix', '2026-11-29', '2026-11-29'
FROM circuits WHERE circuit_name='Losail International Circuit';
INSERT IGNORE INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 22, circuit_id, 'Abu Dhabi Grand Prix', '2026-12-06', '2026-12-06'
FROM circuits WHERE circuit_name='Yas Marina Circuit';

-- Race results
-- Note: finish_position may be NULL for non-classified statuses; points are as provided by the API.
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 7, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 3, 3, 16
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 18, 9, 2
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 11, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 20, 11, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 4, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 9, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 10, 19, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 1, driver_id, 2, 20, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 17, 6, 8
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 3, 9, 3
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, NULL, 13, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 7, 15, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 11, 16, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 5, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 2, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 7, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 13, 5, 10
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, NULL, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 6, 11, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, NULL, 16, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 12, 18, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 3, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 3, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 2, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 7, 13, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 4, driver_id, 13, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 4, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 3, 7, 6
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 16, 10, 1
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 11, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 5, 14, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 5, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 2, 3, 16
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 6, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 4, 4, 13
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 7, driver_id, 7, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 10, 1, 25
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 8, 3, 15
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 2, 5, 10
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 1, 7, 7
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 4, 10, 1
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 20, 11, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 9, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 5, 17, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 8, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 11, 6, 8
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 6, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 9, 18, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 9, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 3, 1, 26
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 10, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 17, 11, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 6, 19, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 10, driver_id, 12, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 3, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 6, 3, 15
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 10, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 12, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 20, 8, 4
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 16, 9, 2
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 19, 12, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 8, 16, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 5, 17, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 7, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 1, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 11, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 6, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 12, driver_id, 12, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 2, 1, 26
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 11, 6, 8
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 18, 9, 2
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 20, 10, 1
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 19, 11, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 6, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 3, 17, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 12, 19, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 13, driver_id, 4, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 6, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 11, 3, 15
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 12, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 15, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 2, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 14, 8, 5
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 1, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 5, 10, 1
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 9, 14, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, NULL, 16, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 13, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, NULL, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 14, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 3, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 15, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 2, 8, 4
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 7, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 5, 18, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 15, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='GRO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 5, 1, 25
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 11, 2, 18
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 10, 3, 15
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 12, 6, 8
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 1, 8, 4
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 2, 9, 3
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 19, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='AIT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='FIT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 16, driver_id, 4, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 11, 7, 7
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='KVY';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='FIT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2020, 17, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 3, 3, 16
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 7, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, NULL, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 16, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 5, 17, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 1, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 1, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 7, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 2, 11, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 16, 13, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, NULL, 15, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 8, 18, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 12, 19, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 2, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 1, 3, 16
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 16, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 5, 11, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 11, 16, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 3, driver_id, 15, 20, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 5, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 10, 17, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 4, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 7, 7, 7
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 5, driver_id, 1, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 6, 1, 25
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 11, 2, 18
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 20, 11, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 2, 15, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 15, 17, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 3, 18, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 6, driver_id, 12, 20, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 10, 6, 8
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 19, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 5, 11, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, NULL, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 7, 16, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 7, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 12, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 11, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 10, 19, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 8, driver_id, 6, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 5, 2, 18
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 10, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 13, 7, 6
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 8, 11, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 7, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 9, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 10, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 16, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, NULL, 16, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 10, driver_id, 1, 20, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 8, 1, 25
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 15, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 5, 5, 11
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 16, 6, 8
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 18, 7, 6
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 17, 8, 4
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 3, 9, 2
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, NULL, 13, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 6, 15, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 2, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 4, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 7, 18, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 12, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 11, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 1, 1, 12
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 2, 2, 9
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 3, 3, 7
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 4, 4, 6
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 5, 5, 5
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 6, 6, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 8, 7, 3
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 9, 8, 2
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 10, 9, 1
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 11, 10, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, NULL, 18, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, NULL, 19, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 12, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, NULL, 8, 4
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 7, 14, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='KUB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, NULL, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 13, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 2, 1, 26
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 19, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 11, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 7, 13, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='KUB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 4, 17, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, 1, 18, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, NULL, 19, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 14, driver_id, NULL, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 4, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 20, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 16, 5, 10
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 1, 7, 7
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 3, 10, 1
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 9, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 15, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 6, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 19, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 20, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 9, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 5, 16, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 15, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 10, 18, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 16, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 18, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 11, 19, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 17, driver_id, 8, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 18, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 7, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 1, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 13, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 18, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 10, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 4, 4, 13
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 5, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, NULL, 12, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 11, 19, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 19, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 7, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 11, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 12, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 4, 9, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 2, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 15, 17, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 20, driver_id, 6, 20, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 15, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 7, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 8, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 12, 15, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 5, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 21, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 12, 5, 10
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 3, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 7, 10, 1
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 4, 15, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='GIO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='RAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2021, 22, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='MAZ';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 16, 8, 4
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 19, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 4, 18, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 2, 19, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 1, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 4, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 7, 16, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 2, driver_id, NULL, 20, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 6, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 20, 10, 1
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 19, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 10, 17, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 2, 18, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 3, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 11, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 2, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, NULL, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 10, 17, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 6, 18, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 4, driver_id, 4, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 3, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 12, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 20, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 18, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, NULL, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, NULL, 17, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 7, 18, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 5, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 5, 2, 19
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 20, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 8, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 6, driver_id, 1, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 5, 6, 9
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 17, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 7, driver_id, 13, 20, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 2, 2, 19
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 7, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 1, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 8, driver_id, 4, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 3, 2, 19
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 19, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 2, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 17, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 5, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 6, 19, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 9, driver_id, 13, 20, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 5, 3, 16
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 2, 7, 6
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 19, 8, 4
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 18, 9, 2
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 17, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 20, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 11, 16, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 8, 18, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 10, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 1, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 8, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 19, 10, 1
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, NULL, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 3, 18, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 11, driver_id, 5, 20, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 6, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 19, 5, 11
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 1, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 12, driver_id, 8, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 10, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 7, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 5, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 18, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, NULL, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 9, 15, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 13, driver_id, 8, 20, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 14, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 15, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 16, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, NULL, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 6, 10, 1
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, NULL, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 7, 15, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 11, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 14, driver_id, 4, 20, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 6, 2, 18
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 13, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 3, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 15, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 7, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 18, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 19, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 13, 6, 9
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 3, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 10, 15, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 4, 17, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 12, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 6, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 16, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 16, 5, 10
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 11, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 3, 9, 2
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 7, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, NULL, 14, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 10, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 5, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 17, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 20, 9, 2
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 19, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 12, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 15, 17, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 18, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 12, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 4, 5, 11
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 14, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 19, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, NULL, 11, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 5, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 7, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 19, driver_id, 1, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 2, 4, 13
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 6, 10, 1
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 20, driver_id, 13, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 7, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 17, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 16, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, NULL, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 6, 18, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 21, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 7, 6, 9
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='VET';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='MSC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 5, 18, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='LAT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2022, 22, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 20, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 10, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 9, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 1, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 15, 2, 19
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 2, driver_id, 5, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 20, 5, 11
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 13, 6, 8
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 16, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 17, 9, 2
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 19, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 5, 12, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 2, 18, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 3, driver_id, 7, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 11, 8, 5
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 7, 9, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 16, 13, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 4, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 9, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 13, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 4, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 17, 11, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 12, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 5, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 5, 4, 13
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 4, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 11, 10, 1
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 9, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 6, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 12, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 11, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 2, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 19, 11, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 7, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 3, 17, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 7, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 10, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 12, 6, 9
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 16, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 8, 11, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 7, 13, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 5, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 13, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 4, 19, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 8, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 15, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 18, 13, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 12, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 9, driver_id, 8, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 7, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 15, 6, 8
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 4, 9, 2
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 5, 10, 1
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 12, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='DEV';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 10, 18, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 10, driver_id, 13, 20, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 2, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 9, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 18, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 7, 12, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 5, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 12, 19, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 11, driver_id, 15, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 6, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 3, 4, 13
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 11, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 4, 19, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 12, driver_id, 5, 20, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 5, 2, 19
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 12, 3, 15
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 7, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 13, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 2, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 4, 8, 4
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 16, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, NULL, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 3, 17, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 13, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 5, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 7, 12, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 13, 17, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 14, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 5, 3, 16
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 12, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 17, 7, 6
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 6, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 19, 12, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 7, 15, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 2, 16, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 8, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 15, driver_id, NULL, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 5, 19, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 16, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 6, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 10, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 19, 9, 2
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 20, 10, 1
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 7, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 11, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 17, driver_id, 12, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 6, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 20, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 11, 8, 5
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 15, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 16, 10, 1
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 10, 17, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 8, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 18, driver_id, 1, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 6, 2, 19
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 17, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 9, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, NULL, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 19, driver_id, 5, 20, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 6, 2, 19
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 15, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 16, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 19, 11, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 11, 12, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 12, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 20, driver_id, 2, 20, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 11, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 16, 4, 12
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 19, 5, 10
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 12, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 3, 8, 4
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 18, 10, 2
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 4, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 5, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 6, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 7, 17, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 21, driver_id, 15, 20, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2023, 22, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 5, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 17, 11, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 10, 16, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 1, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 2, 3, 16
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 9, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 10, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 2, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 4, 2, 19
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 16, 9, 2
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 7, 17, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 11, 18, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 3, driver_id, 1, 19, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 8, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 7, 9, 2
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 18, 13, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 11, 19, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 4, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 3, 7, 7
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 18, 9, 2
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 11, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 12, 18, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 5, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 5, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 15, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 6, 13, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 6, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 6, 7, 7
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 7, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 12, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 7, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 7, 7, 7
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 8, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 7, 4, 13
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 15, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 18, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 17, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 8, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 10, 17, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 11, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 9, driver_id, 13, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 1, 2, 19
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 7, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 10, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 7, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 1, 5, 10
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 9, 6, 8
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 6, 11, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 17, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 14, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 11, driver_id, 2, 20, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 7, 5, 11
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 1, 19, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 12, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 16, 7, 6
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 17, 8, 5
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 13, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 5, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 11, 4, 12
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 2, 7, 7
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 10, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 14, driver_id, 6, 20, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 1, 1, 26
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 6, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 10, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 7, 10, 1
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='SAR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 15, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 4, 1, 25
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 1, 3, 16
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 3, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 10, 17, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 16, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 15, 4, 13
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 19, 9, 2
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 4, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 3, 18, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 17, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 8, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='RIC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 18, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 4, 1, 25
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 20, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 19, 9, 2
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 8, 11, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 6, 12, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 7, 13, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 12, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 18, 19, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 19, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 4, 3, 16
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 2, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 17, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 16, 12, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, NULL, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 20, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 17, 1, 26
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 13, 3, 15
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 1, 6, 8
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 3, 7, 6
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 5, 9, 2
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 9, 14, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 16, 17, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 7, 18, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 10, 19, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 21, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 10, 2, 18
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 6, 6, 9
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 7, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 13, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 11, 17, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 19, 18, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 22, driver_id, 3, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 5, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 3, 10, 2
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 6, 12, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 9, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 23, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 19, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 16, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 5, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 2, 10, 1
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 11, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='ZHO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='MAG';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 9, 18, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2024, 24, driver_id, 10, 20, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 16, 4, 12
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 13, 6, 8
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 17, 7, 6
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 2, 9, 2
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 9, 11, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 5, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 10, 18, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 1, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 11, 5, 10
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 17, 8, 4
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 18, 13, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 12, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 9, 16, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 13, 17, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 6, 18, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 5, 19, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 2, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 11, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 13, 17, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 17, 19, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 3, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 6, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 9, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 14, 8, 4
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 20, 10, 1
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 5, 11, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 4, driver_id, 16, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 10, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 5, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 4, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 3, 6, 8
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 20, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 15, 17, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 6, driver_id, 14, 20, 0
FROM drivers WHERE driver_code='DOO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 1, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 12, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 11, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 3, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 20, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 5, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 8, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 7, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 11, 10, 1
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 18, 13, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 13, 16, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 15, 18, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 6, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 8, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 7, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 15, 5, 10
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 9, 7, 6
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 3, 10, 1
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 6, 18, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 9, driver_id, 11, 19, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 8, 5, 10
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 16, 10, 1
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 18, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 15, 14, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 20, 15, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 12, 16, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 7, 18, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 10, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 8, 8, 4
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 20, 9, 2
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 17, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 15, 11, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 7, 18, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 9, 19, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 11, driver_id, 19, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 19, 3, 15
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 1, 5, 10
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 17, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 13, 8, 4
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 7, 9, 2
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 4, 10, 1
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 18, 11, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 9, 12, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 14, 13, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 6, 14, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 11, 15, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 10, 16, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 12, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 5, 6, 8
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 18, 7, 6
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 13, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 14, 12, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 7, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 11, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 19, 16, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 15, 19, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 13, driver_id, 8, 20, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 1, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 6, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 12, 12, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 18, 13, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 19, 15, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 20, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 14, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 15, 5, 10
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 20, 6, 8
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 19, 7, 6
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 18, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 16, 11, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 8, 12, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 17, 14, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 13, 15, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 11, 16, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 2, 18, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 6, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 15, driver_id, 7, 20, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 10, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 14, 7, 6
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 7, 8, 4
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 6, 9, 2
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 19, 10, 1
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 11, 12, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 8, 19, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 16, driver_id, 12, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 5, 2, 18
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 12, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 8, 10, 1
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 11, 15, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 18, 18, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 16, 19, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 17, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 3, 4, 12
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 10, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 6, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 9, 9, 2
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 18, 10, 1
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 8, 11, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 13, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 12, 15, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 14, 17, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 18, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 13, 7, 6
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 8, 9, 2
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 10, 10, 1
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 19, 12, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 7, 13, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 18, 14, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 17, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 15, 17, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 16, 18, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 14, 19, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 19, driver_id, 9, 20, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 5, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 7, 5, 10
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 4, 7, 6
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 3, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 11, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 16, 10, 1
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 10, 11, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 19, 14, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 18, 15, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 20, 16, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 12, 17, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 14, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 20, driver_id, 15, 20, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 19, 3, 15
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 6, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 5, 8, 4
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 9, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 12, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 15, 13, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 11, 14, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 14, 16, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 17, 17, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 3, 19, 0
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 21, driver_id, 18, 20, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 2, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 4, 2, 18
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 17, 3, 15
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 9, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 3, 5, 10
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 8, 6, 8
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 11, 7, 6
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 19, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 13, 9, 2
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 20, 12, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 10, 13, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 6, 14, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 15, 15, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 16, 16, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 12, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 1, 19, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 22, driver_id, 5, 20, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 3, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 1, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 7, 3, 15
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 4, 6, 8
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 10, 8, 4
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 12, 9, 2
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 14, 11, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 17, 12, 0
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 20, 14, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 9, 16, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 6, 18, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 13, 19, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 23, driver_id, 11, 20, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 2, 3, 15
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 5, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 4, 5, 10
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 8, 7, 6
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 16, 8, 4
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 18, 9, 2
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 15, 10, 1
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 7, 11, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 11, 12, 0
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 12, 13, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='TSU';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 14, 15, 0
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 17, 16, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 9, 17, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 13, 18, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2025, 24, driver_id, 20, 20, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 7, 4, 12
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 6, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 20, 6, 8
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 12, 7, 6
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='LIN';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 10, 9, 2
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 14, 10, 1
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 8, 13, 0
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 16, 14, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 21, 15, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 18, 16, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 22, 17, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 17, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 19, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 3, 20, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 5, 21, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, driver_id, 11, 22, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 2, 2, 18
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 3, 3, 15
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 4, 4, 12
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 10, 5, 10
FROM drivers WHERE driver_code='BEA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 7, 6, 8
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 14, 7, 6
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 9, 8, 4
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 17, 9, 2
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 11, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 15, 12, 0
FROM drivers WHERE driver_code='LIN';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 19, 13, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 13, 14, 0
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 21, 15, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 8, 16, 0
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 18, 17, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 20, 18, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 5, 19, 0
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 6, 20, 0
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 16, 21, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, driver_id, 22, 22, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 1, 1, 25
FROM drivers WHERE driver_code='ANT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 3, 2, 18
FROM drivers WHERE driver_code='PIA';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 4, 3, 15
FROM drivers WHERE driver_code='LEC';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 2, 4, 12
FROM drivers WHERE driver_code='RUS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 5, 5, 10
FROM drivers WHERE driver_code='NOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 6, 6, 8
FROM drivers WHERE driver_code='HAM';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 7, 7, 6
FROM drivers WHERE driver_code='GAS';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 11, 8, 4
FROM drivers WHERE driver_code='VER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 14, 9, 2
FROM drivers WHERE driver_code='LAW';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 12, 10, 1
FROM drivers WHERE driver_code='OCO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 13, 11, 0
FROM drivers WHERE driver_code='HUL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 8, 12, 0
FROM drivers WHERE driver_code='HAD';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 9, 13, 0
FROM drivers WHERE driver_code='BOR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 10, 14, 0
FROM drivers WHERE driver_code='LIN';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 16, 15, 0
FROM drivers WHERE driver_code='SAI';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 15, 16, 0
FROM drivers WHERE driver_code='COL';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 19, 17, 0
FROM drivers WHERE driver_code='PER';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 21, 18, 0
FROM drivers WHERE driver_code='ALO';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 20, 19, 0
FROM drivers WHERE driver_code='BOT';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 17, 20, 0
FROM drivers WHERE driver_code='ALB';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 22, 21, 0
FROM drivers WHERE driver_code='STR';
INSERT IGNORE INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, driver_id, 18, 22, 0
FROM drivers WHERE driver_code='BEA';

