-- =========================
-- Formula 1 (Web-Friendly) Schema v2 (MySQL 8+)
-- =========================

CREATE DATABASE IF NOT EXISTS formula_1
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE formula_1;

-- Re-run friendly
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS race_results;
DROP TABLE IF EXISTS races;
DROP TABLE IF EXISTS circuits;
DROP TABLE IF EXISTS team_standings;
DROP TABLE IF EXISTS team_drivers;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS seasons;
SET FOREIGN_KEY_CHECKS = 1;

-- -------------------------
-- Seasons
-- -------------------------
CREATE TABLE seasons (
  season_year INT NOT NULL,
  PRIMARY KEY (season_year),
  CHECK (season_year >= 1950)
);

INSERT INTO seasons (season_year) VALUES
(2020),
(2021),
(2022),
(2023),
(2024),
(2025),
(2026);

-- -------------------------
-- Teams
-- -------------------------
CREATE TABLE teams (
  team_id INT NOT NULL AUTO_INCREMENT,
  team_name VARCHAR(50) NOT NULL,             -- short name: Ferrari, Mercedes
  full_name VARCHAR(120) NULL,
  founding_year INT NULL,
  base_country VARCHAR(60) NULL,
  base_city VARCHAR(60) NULL,
  team_chief VARCHAR(80) NULL,
  engine_supplier VARCHAR(80) NULL,

  PRIMARY KEY (team_id),
  UNIQUE KEY uq_teams_team_name (team_name),
  CHECK (founding_year IS NULL OR founding_year >= 1800)
);

-- -------------------------
-- Drivers
-- -------------------------
CREATE TABLE drivers (
  driver_id INT NOT NULL AUTO_INCREMENT,
  car_no INT NULL,                            -- reserve drivers may not have an F1 car number in this dataset
  driver_code CHAR(3) NOT NULL,               -- e.g. RUS, LEC
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  nation VARCHAR(60) NULL,
  birth_date DATE NULL,

  num_poles INT NOT NULL DEFAULT 0,
  num_podiums INT NOT NULL DEFAULT 0,
  num_championships INT NOT NULL DEFAULT 0,

  PRIMARY KEY (driver_id),
  UNIQUE KEY uq_drivers_car_no (car_no),
  UNIQUE KEY uq_drivers_code (driver_code),
  CHECK (num_poles >= 0 AND num_podiums >= 0 AND num_championships >= 0)
);

-- -------------------------
-- Driver <-> Team (per season)
-- role: 'MAIN' (race driver), 'RESERVE'
-- seat_no: 1/2 only for MAIN drivers
-- -------------------------
CREATE TABLE team_drivers (
  season_year INT NOT NULL,
  team_id INT NOT NULL,
  driver_id INT NOT NULL,
  role ENUM('MAIN','RESERVE') NOT NULL,
  seat_no TINYINT NULL,

  PRIMARY KEY (season_year, team_id, driver_id),

  CONSTRAINT fk_td_season FOREIGN KEY (season_year) REFERENCES seasons(season_year)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT fk_td_team FOREIGN KEY (team_id) REFERENCES teams(team_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT fk_td_driver FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CHECK (seat_no IS NULL OR seat_no IN (1,2)),
  CHECK (
    (role = 'MAIN' AND seat_no IS NOT NULL) OR
    (role = 'RESERVE' AND seat_no IS NULL)
  )
);

CREATE INDEX ix_td_team_season ON team_drivers (team_id, season_year);
CREATE INDEX ix_td_driver_season ON team_drivers (driver_id, season_year);

-- -------------------------
-- Team standings (optional cache table for web)
-- You can also compute this from race_results.
-- -------------------------
CREATE TABLE team_standings (
  season_year INT NOT NULL,
  team_id INT NOT NULL,
  season_position INT NULL,
  season_points INT NOT NULL DEFAULT 0,

  PRIMARY KEY (season_year, team_id),
  CONSTRAINT fk_ts_season FOREIGN KEY (season_year) REFERENCES seasons(season_year)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_ts_team FOREIGN KEY (team_id) REFERENCES teams(team_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CHECK (season_points >= 0)
);

-- -------------------------
-- Circuits
-- length_m in meters (INT)
-- fastest_lap_time TIME(3) optional
-- -------------------------
CREATE TABLE circuits (
  circuit_id INT NOT NULL AUTO_INCREMENT,
  circuit_name VARCHAR(120) NOT NULL,
  country VARCHAR(60) NULL,
  city VARCHAR(60) NULL,
  laps INT NULL,
  length_m INT NULL,
  first_gp_year INT NULL,
  fastest_lap_time TIME(3) NULL,

  PRIMARY KEY (circuit_id),
  UNIQUE KEY uq_circuits_name (circuit_name),
  CHECK (laps IS NULL OR laps > 0),
  CHECK (length_m IS NULL OR length_m > 0),
  CHECK (first_gp_year IS NULL OR first_gp_year >= 1900)
);

-- -------------------------
-- Races (schedule)
-- Proper date types (web friendly: filter/sort/countdown)
-- -------------------------
CREATE TABLE races (
  season_year INT NOT NULL,
  round_number INT NOT NULL,
  circuit_id INT NOT NULL,
  grand_prix_name VARCHAR(160) NOT NULL,
  race_start_date DATE NOT NULL,
  race_end_date DATE NOT NULL,

  PRIMARY KEY (season_year, round_number),

  CONSTRAINT fk_r_season FOREIGN KEY (season_year) REFERENCES seasons(season_year)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT fk_r_circuit FOREIGN KEY (circuit_id) REFERENCES circuits(circuit_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  UNIQUE KEY uq_race_name_per_season (season_year, grand_prix_name),
  CHECK (round_number > 0),
  CHECK (race_start_date <= race_end_date)
);

CREATE INDEX ix_races_circuit ON races (circuit_id);

-- -------------------------
-- Race results
-- No repeated country/GP name (join from races)
-- -------------------------
CREATE TABLE race_results (
  season_year INT NOT NULL,
  round_number INT NOT NULL,
  driver_id INT NOT NULL,

  grid_position INT NULL,
  finish_position INT NULL,
  points INT NOT NULL DEFAULT 0,

  PRIMARY KEY (season_year, round_number, driver_id),

  CONSTRAINT fk_rr_race FOREIGN KEY (season_year, round_number) REFERENCES races(season_year, round_number)
    ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT fk_rr_driver FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,

  CHECK (grid_position IS NULL OR grid_position > 0),
  CHECK (finish_position IS NULL OR finish_position > 0),
  CHECK (points >= 0)
);

CREATE INDEX ix_rr_driver ON race_results (driver_id);
CREATE INDEX ix_rr_finish ON race_results (season_year, round_number, finish_position);

-- =========================
-- Seed data (same spirit, cleaned)
-- =========================

-- Teams
INSERT INTO teams (team_name, full_name, founding_year, base_country, base_city, team_chief, engine_supplier) VALUES
('Mercedes', 'Mercedes-AMG PETRONAS Formula One Team', 1970, 'United Kingdom', 'Brackley', 'Toto Wolff', 'Mercedes'),
('Ferrari', 'Scuderia Ferrari', 1950, 'Italy', 'Maranello', 'Frédéric Vasseur', 'Ferrari'),
('McLaren', 'McLaren F1 Team', 1966, 'United Kingdom', 'Woking', 'Andrea Stella', 'Mercedes'),
('Haas', 'Haas F1 Team', 2016, 'United States', 'Kannapolis', 'Ayao Komatsu', 'Ferrari'),
('Alpine', 'BWT Alpine Formula One Team', 1986, 'United Kingdom', 'Enstone', 'Flavio Briatore', 'Mercedes'),
('Red Bull', 'Oracle Red Bull Racing', 1997, 'United Kingdom', 'Milton Keynes', 'Laurent Mekies', 'Red Bull Ford'),
('Racing Bulls', 'Visa Cash App Racing Bulls', 1985, 'Italy', 'Faenza', 'Alan Permane', 'Red Bull Ford'),
('Audi', 'Audi F1 Team', 2026, 'Switzerland', 'Hinwil', 'Mattia Binotto', 'Audi'),
('Williams', 'Williams Racing', 1978, 'United Kingdom', 'Grove', 'James Vowles', 'Mercedes'),
('Cadillac', 'Cadillac Formula 1 Team', 2026, 'United Kingdom', 'Silverstone', 'Graeme Lowdon', 'Ferrari'),
('Aston Martin', 'Aston Martin Aramco Formula One Team', 2018, 'United Kingdom', 'Silverstone', 'Adrian Newey', 'Honda');

-- Drivers
INSERT INTO drivers (car_no, driver_code, first_name, last_name, nation, birth_date, num_poles, num_podiums, num_championships) VALUES
(63, 'RUS', 'George', 'Russell', 'United Kingdom', '1998-02-15', 8, 26, 0),
(12, 'ANT', 'Kimi', 'Antonelli', 'Italy', '2006-08-25', 2, 6, 0),
(16, 'LEC', 'Charles', 'Leclerc', 'Monaco', '1997-10-16', 27, 52, 0),
(44, 'HAM', 'Lewis', 'Hamilton', 'United Kingdom', '1985-01-07', 104, 203, 7),
(1, 'NOR', 'Lando', 'Norris', 'United Kingdom', '1999-11-13', 16, 44, 1),
(81, 'PIA', 'Oscar', 'Piastri', 'Australia', '2001-04-06', 6, 27, 0),
(31, 'OCO', 'Esteban', 'Ocon', 'France', '1996-09-17', 0, 4, 0),
(87, 'BEA', 'Oliver', 'Bearman', 'United Kingdom', '2005-05-08', 0, 0, 0),
(10, 'GAS', 'Pierre', 'Gasly', 'France', '1996-02-07', 0, 5, 0),
(43, 'COL', 'Franco', 'Colapinto', 'Argentina', '2003-05-27', 0, 0, 0),
(3, 'VER', 'Max', 'Verstappen', 'Netherlands', '1997-09-30', 48, 127, 4),
(6, 'HAD', 'Isack', 'Hadjar', 'France', '2004-09-28', 0, 1, 0),
(30, 'LAW', 'Liam', 'Lawson', 'New Zealand', '2002-02-11', 0, 0, 0),
(41, 'LIN', 'Arvid', 'Lindblad', 'United Kingdom', '2007-08-08', 0, 0, 0),
(27, 'HUL', 'Nico', 'Hulkenberg', 'Germany', '1987-08-19', 1, 1, 0),
(5, 'BOR', 'Gabriel', 'Bortoleto', 'Brazil', '2004-10-14', 0, 0, 0),
(55, 'SAI', 'Carlos', 'Sainz', 'Spain', '1994-09-01', 6, 29, 0),
(23, 'ALB', 'Alexander', 'Albon', 'Thailand', '1996-03-23', 0, 2, 0),
(11, 'PER', 'Sergio', 'Perez', 'Mexico', '1990-01-26', 3, 39, 0),
(77, 'BOT', 'Valtteri', 'Bottas', 'Finland', '1989-08-28', 20, 67, 0),
(14, 'ALO', 'Fernando', 'Alonso', 'Spain', '1981-07-29', 22, 106, 2),
(18, 'STR', 'Lance', 'Stroll', 'Canada', '1998-10-29', 1, 3, 0),
-- Reserves used by TEAMS table in the original dataset
(NULL, 'VES', 'Fred', 'Vesti', NULL, NULL, 0, 0, 0),
(NULL, 'GIO', 'Antonio', 'Giovinazzi', NULL, NULL, 0, 0, 0),
(NULL, 'FOR', 'Leonardo', 'Fornaroli', NULL, NULL, 0, 0, 0),
(NULL, 'HIR', 'Ryo', 'Hirakawa', NULL, NULL, 0, 0, 0),
(NULL, 'DOO', 'Jack', 'Doohan', NULL, NULL, 0, 0, 0),
(NULL, 'TSU', 'Yuki', 'Tsunoda', NULL, NULL, 0, 0, 0),
(NULL, 'ZHO', 'Zhou', 'Guanyu', NULL, NULL, 0, 0, 0),
(NULL, 'CRW', 'Jak', 'Crawford', NULL, NULL, 0, 0, 0);

-- Team drivers (2026)
-- NOTE: driver_id values are auto-assigned; link by driver_code.
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Mercedes' AND d.driver_code='RUS';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Mercedes' AND d.driver_code='ANT';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Mercedes' AND d.driver_code='VES';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Ferrari' AND d.driver_code='LEC';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Ferrari' AND d.driver_code='HAM';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Ferrari' AND d.driver_code='GIO';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='McLaren' AND d.driver_code='NOR';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='McLaren' AND d.driver_code='PIA';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='McLaren' AND d.driver_code='FOR';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Haas' AND d.driver_code='OCO';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Haas' AND d.driver_code='BEA';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Haas' AND d.driver_code='HIR';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Alpine' AND d.driver_code='GAS';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Alpine' AND d.driver_code='COL';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Alpine' AND d.driver_code='DOO';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Red Bull' AND d.driver_code='VER';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Red Bull' AND d.driver_code='HAD';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Racing Bulls' AND d.driver_code='LAW';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Racing Bulls' AND d.driver_code='LIN';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Racing Bulls' AND d.driver_code='TSU';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Audi' AND d.driver_code='HUL';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Audi' AND d.driver_code='BOR';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Williams' AND d.driver_code='SAI';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Williams' AND d.driver_code='ALB';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Cadillac' AND d.driver_code='PER';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Cadillac' AND d.driver_code='BOT';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Cadillac' AND d.driver_code='ZHO';

INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 1
FROM teams t JOIN drivers d
WHERE t.team_name='Aston Martin' AND d.driver_code='ALO';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'MAIN', 2
FROM teams t JOIN drivers d
WHERE t.team_name='Aston Martin' AND d.driver_code='STR';
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT 2026, t.team_id, d.driver_id, 'RESERVE', NULL
FROM teams t JOIN drivers d
WHERE t.team_name='Aston Martin' AND d.driver_code='CRW';

-- Team standings (2026) örnek
INSERT INTO team_standings (season_year, team_id, season_position, season_points)
SELECT 2026, team_id,
       CASE team_name
         WHEN 'Mercedes' THEN 1
         WHEN 'Ferrari' THEN 2
         WHEN 'McLaren' THEN 3
         WHEN 'Haas' THEN 4
         WHEN 'Alpine' THEN 5
         WHEN 'Red Bull' THEN 6
         WHEN 'Racing Bulls' THEN 7
         WHEN 'Audi' THEN 8
         WHEN 'Williams' THEN 9
         WHEN 'Cadillac' THEN 10
         WHEN 'Aston Martin' THEN 11
       END,
       CASE team_name
         WHEN 'Mercedes' THEN 135
         WHEN 'Ferrari' THEN 90
         WHEN 'McLaren' THEN 46
         WHEN 'Haas' THEN 18
         WHEN 'Alpine' THEN 16
         WHEN 'Red Bull' THEN 16
         WHEN 'Racing Bulls' THEN 14
         WHEN 'Audi' THEN 2
         WHEN 'Williams' THEN 2
         WHEN 'Cadillac' THEN 0
         WHEN 'Aston Martin' THEN 0
       END
FROM teams;

-- Circuits (full list from the original dataset)
INSERT INTO circuits (circuit_name, country, city, laps, length_m, first_gp_year, fastest_lap_time) VALUES
('Albert Park Circuit', 'Australia', 'Melbourne', 58, 5278, 1996, '00:01:19.813'),
('Shanghai International Circuit', 'China', 'Shanghai', 56, 5451, 2004, '00:01:32.238'),
('Suzuka Circuit', 'Japan', 'Suzuka', 53, 5807, 1987, '00:01:30.965'),
('Miami International Autodrome', 'USA', 'Miami', 57, 5412, 2022, '00:01:29.708'),
('Circuit Gilles-Villeneuve', 'Canada', 'Montreal', 70, 4361, 1978, '00:01:13.078'),
('Circuit de Monaco', 'Monaco', 'Monte Carlo', 78, 3337, 1950, '00:01:12.909'),
('Circuit de Barcelona-Catalunya', 'Spain', 'Barcelona', 66, 4657, 1991, '00:01:15.743'),
('Red Bull Ring', 'Austria', 'Spielberg', 71, 4326, 1970, '00:01:07.924'),
('Silverstone Circuit', 'United Kingdom', 'Silverstone', 52, 5891, 1950, '00:01:27.097'),
('Circuit de Spa-Francorchamps', 'Belgium', 'Stavelot', 44, 7004, 1950, '00:01:44.701'),
('Hungaroring', 'Hungary', 'Mogyorod', 70, 4381, 1986, '00:01:16.627'),
('Circuit Zandvoort', 'Netherlands', 'Zandvoort', 72, 4259, 1952, '00:01:11.097'),
('Autodromo Nazionale Monza', 'Italy', 'Monza', 53, 5793, 1950, '00:01:20.901'),
('Madring', 'Spain', 'Madrid', 57, 5416, 2026, NULL),
('Baku City Circuit', 'Azerbaijan', 'Baku', 51, 6003, 2016, '00:01:43.009'),
('Marina Bay Street Circuit', 'Singapore', 'Marina Bay', 62, 4927, 2008, '00:01:33.808'),
('Circuit of The Americas', 'USA', 'Austin', 56, 5513, 2012, '00:01:36.169'),
('Autódromo Hermanos Rodríguez', 'Mexico', 'Mexico City', 71, 4304, 1963, '00:01:17.774'),
('Autódromo José Carlos Pace', 'Brazil', 'São Paulo', 71, 4309, 1973, '00:01:10.540'),
('Las Vegas Strip Circuit', 'USA', 'Las Vegas', 50, 6201, 2023, '00:01:33.365'),
('Lusail International Circuit', 'Qatar', 'Doha', 57, 5419, 2021, '00:01:22.384'),
('Yas Marina Circuit', 'UAE', 'Abu Dhabi', 58, 5281, 2009, '00:01:25.637');

-- Races / Schedule (22 rounds). Dates are normalized to start/end DATE (2026).
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 1, circuit_id, 'FORMULA 1 QATAR AIRWAYS AUSTRALIAN GRAND PRIX 2026', '2026-03-06', '2026-03-08'
FROM circuits WHERE circuit_name='Albert Park Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 2, circuit_id, 'FORMULA 1 HEINEKEN CHINESE GRAND PRIX 2026', '2026-03-13', '2026-03-15'
FROM circuits WHERE circuit_name='Shanghai International Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 3, circuit_id, 'FORMULA 1 ARAMCO JAPANESE GRAND PRIX 2026', '2026-03-27', '2026-03-29'
FROM circuits WHERE circuit_name='Suzuka Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 4, circuit_id, 'FORMULA 1 CRYPTO.COM MIAMI GRAND PRIX 2026', '2026-05-01', '2026-05-03'
FROM circuits WHERE circuit_name='Miami International Autodrome';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 5, circuit_id, 'FORMULA 1 LENOVO GRAND PRIX DU CANADA 2026', '2026-05-22', '2026-05-24'
FROM circuits WHERE circuit_name='Circuit Gilles-Villeneuve';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 6, circuit_id, 'FORMULA 1 LOUIS VUITTON GRAND PRIX DE MONACO 2026', '2026-06-05', '2026-06-07'
FROM circuits WHERE circuit_name='Circuit de Monaco';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 7, circuit_id, 'FORMULA 1 MSC CRUISES GRAN PREMIO DE BARCELONA-CATALUNYA 2026', '2026-06-12', '2026-06-14'
FROM circuits WHERE circuit_name='Circuit de Barcelona-Catalunya';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 8, circuit_id, 'FORMULA 1 LENOVO AUSTRIAN GRAND PRIX 2026', '2026-06-26', '2026-06-28'
FROM circuits WHERE circuit_name='Red Bull Ring';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 9, circuit_id, 'FORMULA 1 PIRELLI BRITISH GRAND PRIX 2026', '2026-07-03', '2026-07-05'
FROM circuits WHERE circuit_name='Silverstone Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 10, circuit_id, 'FORMULA 1 MOËT & CHANDON BELGIAN GRAND PRIX 2026', '2026-07-17', '2026-07-19'
FROM circuits WHERE circuit_name='Circuit de Spa-Francorchamps';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 11, circuit_id, 'FORMULA 1 AWS HUNGARIAN GRAND PRIX 2026', '2026-07-24', '2026-07-26'
FROM circuits WHERE circuit_name='Hungaroring';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 12, circuit_id, 'FORMULA 1 HEINEKEN DUTCH GRAND PRIX 2026', '2026-08-21', '2026-08-23'
FROM circuits WHERE circuit_name='Circuit Zandvoort';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 13, circuit_id, 'FORMULA 1 PIRELLI GRAN PREMIO D''ITALIA 2026', '2026-09-04', '2026-09-06'
FROM circuits WHERE circuit_name='Autodromo Nazionale Monza';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 14, circuit_id, 'FORMULA 1 TAG HEUER GRAN PREMIO DE ESPAÑA 2026', '2026-09-11', '2026-09-13'
FROM circuits WHERE circuit_name='Madring';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 15, circuit_id, 'FORMULA 1 QATAR AIRWAYS AZERBAIJAN GRAND PRIX 2026', '2026-09-24', '2026-09-26'
FROM circuits WHERE circuit_name='Baku City Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 16, circuit_id, 'FORMULA 1 SINGAPORE AIRLINES SINGAPORE GRAND PRIX 2026', '2026-10-09', '2026-10-11'
FROM circuits WHERE circuit_name='Marina Bay Street Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 17, circuit_id, 'FORMULA 1 MSC CRUISES UNITED STATES GRAND PRIX 2026', '2026-10-23', '2026-10-25'
FROM circuits WHERE circuit_name='Circuit of The Americas';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 18, circuit_id, 'FORMULA 1 GRAN PREMIO DE LA CIUDAD DE MÉXICO 2026', '2026-10-30', '2026-11-01'
FROM circuits WHERE circuit_name='Autódromo Hermanos Rodríguez';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 19, circuit_id, 'FORMULA 1 MSC CRUISES GRANDE PRÊMIO DE SÃO PAULO 2026', '2026-11-06', '2026-11-08'
FROM circuits WHERE circuit_name='Autódromo José Carlos Pace';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 20, circuit_id, 'FORMULA 1 HEINEKEN LAS VEGAS GRAND PRIX 2026', '2026-11-19', '2026-11-21'
FROM circuits WHERE circuit_name='Las Vegas Strip Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 21, circuit_id, 'FORMULA 1 QATAR AIRWAYS QATAR GRAND PRIX 2026', '2026-11-27', '2026-11-29'
FROM circuits WHERE circuit_name='Lusail International Circuit';
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT 2026, 22, circuit_id, 'FORMULA 1 ETIHAD AIRWAYS ABU DHABI GRAND PRIX 2026', '2026-12-04', '2026-12-06'
FROM circuits WHERE circuit_name='Yas Marina Circuit';

-- Race results (Rounds 1-3) from the original dataset.
-- Insert by driver_code to stay stable even if driver_id changes.
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 1, 1, 25 FROM drivers d WHERE d.driver_code='RUS';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 2, 2, 18 FROM drivers d WHERE d.driver_code='ANT';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 3, NULL, 0 FROM drivers d WHERE d.driver_code='HAD';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 4, 3, 15 FROM drivers d WHERE d.driver_code='LEC';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 5, NULL, 0 FROM drivers d WHERE d.driver_code='PIA';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 6, 5, 10 FROM drivers d WHERE d.driver_code='NOR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 7, 4, 12 FROM drivers d WHERE d.driver_code='HAM';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 8, 13, 0 FROM drivers d WHERE d.driver_code='LAW';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 9, 8, 4 FROM drivers d WHERE d.driver_code='LIN';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 10, 9, 2 FROM drivers d WHERE d.driver_code='BOR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 11, NULL, 0 FROM drivers d WHERE d.driver_code='HUL';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 12, 7, 6 FROM drivers d WHERE d.driver_code='BEA';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 13, 11, 0 FROM drivers d WHERE d.driver_code='OCO';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 14, 10, 1 FROM drivers d WHERE d.driver_code='GAS';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 15, 12, 0 FROM drivers d WHERE d.driver_code='ALB';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 16, 14, 0 FROM drivers d WHERE d.driver_code='COL';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 17, NULL, 0 FROM drivers d WHERE d.driver_code='ALO';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 18, 16, 0 FROM drivers d WHERE d.driver_code='PER';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 19, NULL, 0 FROM drivers d WHERE d.driver_code='BOT';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 20, 6, 8 FROM drivers d WHERE d.driver_code='VER';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 21, 15, 0 FROM drivers d WHERE d.driver_code='SAI';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 1, d.driver_id, 22, NULL, 0 FROM drivers d WHERE d.driver_code='STR';

INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 1, 1, 25 FROM drivers d WHERE d.driver_code='ANT';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 2, 2, 18 FROM drivers d WHERE d.driver_code='RUS';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 3, 3, 15 FROM drivers d WHERE d.driver_code='HAM';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 4, 4, 12 FROM drivers d WHERE d.driver_code='LEC';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 5, NULL, 0 FROM drivers d WHERE d.driver_code='PIA';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 6, NULL, 0 FROM drivers d WHERE d.driver_code='NOR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 7, 6, 8 FROM drivers d WHERE d.driver_code='GAS';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 8, NULL, 0 FROM drivers d WHERE d.driver_code='VER';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 9, 8, 4 FROM drivers d WHERE d.driver_code='HAD';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 10, 5, 10 FROM drivers d WHERE d.driver_code='BEA';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 11, 11, 0 FROM drivers d WHERE d.driver_code='HUL';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 12, 10, 1 FROM drivers d WHERE d.driver_code='COL';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 13, 14, 0 FROM drivers d WHERE d.driver_code='OCO';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 14, 7, 6 FROM drivers d WHERE d.driver_code='LAW';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 15, 12, 0 FROM drivers d WHERE d.driver_code='LIN';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 16, NULL, 0 FROM drivers d WHERE d.driver_code='BOR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 17, 9, 2 FROM drivers d WHERE d.driver_code='SAI';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 18, NULL, 0 FROM drivers d WHERE d.driver_code='ALB';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 19, NULL, 0 FROM drivers d WHERE d.driver_code='ALO';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 20, 13, 0 FROM drivers d WHERE d.driver_code='BOT';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 21, NULL, 0 FROM drivers d WHERE d.driver_code='STR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 2, d.driver_id, 22, 15, 0 FROM drivers d WHERE d.driver_code='PER';

INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 1, 1, 25 FROM drivers d WHERE d.driver_code='ANT';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 2, 4, 12 FROM drivers d WHERE d.driver_code='RUS';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 3, 2, 18 FROM drivers d WHERE d.driver_code='PIA';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 4, 3, 15 FROM drivers d WHERE d.driver_code='LEC';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 5, 5, 10 FROM drivers d WHERE d.driver_code='NOR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 6, 6, 8 FROM drivers d WHERE d.driver_code='HAM';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 7, 7, 6 FROM drivers d WHERE d.driver_code='GAS';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 8, 12, 0 FROM drivers d WHERE d.driver_code='HAD';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 9, 13, 0 FROM drivers d WHERE d.driver_code='BOR';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 10, 14, 0 FROM drivers d WHERE d.driver_code='LIN';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 11, 8, 4 FROM drivers d WHERE d.driver_code='VER';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 12, 10, 1 FROM drivers d WHERE d.driver_code='OCO';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 13, 11, 0 FROM drivers d WHERE d.driver_code='HUL';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 14, 9, 2 FROM drivers d WHERE d.driver_code='LAW';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 15, 16, 0 FROM drivers d WHERE d.driver_code='COL';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 16, 15, 0 FROM drivers d WHERE d.driver_code='SAI';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 17, 20, 0 FROM drivers d WHERE d.driver_code='ALB';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 18, NULL, 0 FROM drivers d WHERE d.driver_code='BEA';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 19, 17, 0 FROM drivers d WHERE d.driver_code='PER';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 20, 19, 0 FROM drivers d WHERE d.driver_code='BOT';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 21, 18, 0 FROM drivers d WHERE d.driver_code='ALO';
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT 2026, 3, d.driver_id, 22, NULL, 0 FROM drivers d WHERE d.driver_code='STR';

-- =====================================================================
-- Historical seed (2020+) generated from Ergast successor (jolpica-f1)
-- Notes:
-- - Uses INSERT IGNORE, so it won't break if rows already exist.
-- - Circuit naming in Ergast may differ from this file's 2026 naming
--   (e.g. "Albert Park Grand Prix Circuit" vs "Albert Park Circuit").
--   If you want a single canonical naming set, we can unify later.
-- Source API: https://api.jolpi.ca/ergast/f1
-- =====================================================================

-- ================================================
-- Generated seed from jolpica-f1 (Ergast successor)
-- Seasons: 2020..2026
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
-- NOTE: For historical seasons, this uses race day as both start/end; you can enrich later.
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

-- ==========================================================
-- FULL 2020-2026 RESULTS SEED
-- ==========================================================
-- Tüm sezonların (2020-2026) tüm yarış sonuçlarını da yüklemek için,
-- bu dosyadan sonra üretilen seed dosyasını çalıştır:
--
--   SOURCE f1_seed_2020_2026_with_results.sql;
--
-- Bu seed, jolpica-f1 (Ergast successor) üzerinden otomatik üretildi:
-- scripts/seed_f1_from_ergast.py