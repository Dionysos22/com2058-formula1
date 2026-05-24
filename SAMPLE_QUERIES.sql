-- COM2058 Formula 1 – sample SQL queries (Requirements.md §2)
-- Run against the course schema: USE formula_1;

USE formula_1;

-- 1) Races of a season (chronological) with circuit and Grand Prix name
SELECT
  r.round_number,
  r.grand_prix_name,
  c.circuit_name,
  r.race_start_date
FROM races r
JOIN circuits c ON c.circuit_id = r.circuit_id
WHERE r.season_year = 2024
ORDER BY r.race_start_date, r.round_number;

-- 2) Constructors' standings for a season
SELECT
  t.team_name,
  DENSE_RANK() OVER (ORDER BY SUM(rr.points) DESC) AS season_position,
  SUM(rr.points) AS season_points
FROM race_results rr
JOIN team_drivers td
  ON td.season_year = rr.season_year
 AND td.driver_id = rr.driver_id
 AND td.role = 'MAIN'
JOIN teams t ON t.team_id = td.team_id
WHERE rr.season_year = 2024
GROUP BY t.team_id, t.team_name
ORDER BY season_position;

-- 3) All races for a driver (grid, finish, points)
SELECT
  r.season_year,
  r.grand_prix_name,
  rr.grid_position,
  rr.finish_position,
  rr.points
FROM race_results rr
JOIN races r
  ON r.season_year = rr.season_year
 AND r.round_number = rr.round_number
WHERE rr.driver_id = 1
ORDER BY r.season_year, r.round_number;

-- 4) Team roster in a season (role and seat)
SELECT
  d.first_name,
  d.last_name,
  td.role,
  td.seat_no
FROM team_drivers td
JOIN drivers d ON d.driver_id = td.driver_id
WHERE td.season_year = 2024
  AND td.team_id = 1
ORDER BY td.role, td.seat_no;

-- 5) Grand Prix events hosted by a circuit
SELECT
  r.season_year,
  r.round_number,
  r.grand_prix_name,
  r.race_start_date
FROM races r
WHERE r.circuit_id = 1
ORDER BY r.season_year, r.round_number;

-- 6) Driver career totals (derived attributes stored on DRIVER)
SELECT
  first_name,
  last_name,
  num_poles,
  num_podiums,
  num_championships
FROM drivers
WHERE driver_id = 1;

-- 7) Driver championship standings for a season (computed from RESULTS)
SELECT
  d.driver_code,
  CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
  SUM(rr.points) AS total_points,
  DENSE_RANK() OVER (ORDER BY SUM(rr.points) DESC) AS season_position
FROM race_results rr
JOIN drivers d ON d.driver_id = rr.driver_id
WHERE rr.season_year = 2024
GROUP BY d.driver_id, d.driver_code, d.first_name, d.last_name
ORDER BY season_position
LIMIT 10;

-- 8) Podium finishers for a specific Grand Prix
SELECT
  rr.finish_position,
  d.driver_code,
  CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
  t.team_name,
  rr.points
FROM race_results rr
JOIN drivers d ON d.driver_id = rr.driver_id
JOIN team_drivers td
  ON td.season_year = rr.season_year
 AND td.driver_id = rr.driver_id
 AND td.role = 'MAIN'
JOIN teams t ON t.team_id = td.team_id
WHERE rr.season_year = 2024
  AND rr.round_number = 1
  AND rr.finish_position BETWEEN 1 AND 3
ORDER BY rr.finish_position;

-- 9) Circuits grouped by country (with race count)
SELECT
  c.country,
  COUNT(DISTINCT c.circuit_id) AS circuit_count,
  COUNT(r.season_year) AS total_races_hosted
FROM circuits c
LEFT JOIN races r ON r.circuit_id = c.circuit_id
GROUP BY c.country
ORDER BY total_races_hosted DESC, c.country;

-- 10) Stored constructors' standings vs season (team_standings cache)
SELECT
  t.team_name,
  ts.season_position,
  ts.season_points
FROM team_standings ts
JOIN teams t ON t.team_id = ts.team_id
WHERE ts.season_year = 2024
ORDER BY ts.season_position;

-- 11) Race winners at a circuit across all seasons
SELECT
  r.season_year,
  r.grand_prix_name,
  CONCAT(d.first_name, ' ', d.last_name) AS winner
FROM races r
JOIN race_results rr
  ON rr.season_year = r.season_year
 AND rr.round_number = r.round_number
 AND rr.finish_position = 1
JOIN drivers d ON d.driver_id = rr.driver_id
WHERE r.circuit_id = 1
ORDER BY r.season_year DESC;

-- 12) Main drivers per team in a season (with car number)
SELECT
  t.team_name,
  d.car_no,
  d.driver_code,
  CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
  td.seat_no
FROM team_drivers td
JOIN teams t ON t.team_id = td.team_id
JOIN drivers d ON d.driver_id = td.driver_id
WHERE td.season_year = 2024
  AND td.role = 'MAIN'
ORDER BY t.team_name, td.seat_no;
