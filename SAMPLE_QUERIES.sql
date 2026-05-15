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

-- Extra: driver championship standings computed from RESULTS
SELECT
  d.driver_code,
  SUM(rr.points) AS total_points
FROM race_results rr
JOIN drivers d ON d.driver_id = rr.driver_id
WHERE rr.season_year = 2024
GROUP BY d.driver_id, d.driver_code
ORDER BY total_points DESC
LIMIT 10;
