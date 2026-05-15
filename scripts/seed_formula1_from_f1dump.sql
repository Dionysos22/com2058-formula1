-- Seed formula_1 schema from the local f1_dump dataset (created from .tmp_f1db dump).
-- This keeps the course schema (Formula_1.sql) but provides real data for the web UI.

-- Year to seed. This line is replaced by scripts/seed_formula1_range.py.
SET @Y := __YEAR__;

-- Safety: make sure we are writing into the intended DB.
USE formula_1;

SET FOREIGN_KEY_CHECKS = 0;
-- Idempotent for the chosen season
DELETE FROM race_results   WHERE season_year = @Y;
DELETE FROM races          WHERE season_year = @Y;
DELETE FROM team_standings WHERE season_year = @Y;
DELETE FROM team_drivers   WHERE season_year = @Y;
DELETE FROM seasons        WHERE season_year = @Y;
SET FOREIGN_KEY_CHECKS = 1;

-- 1) Season
INSERT INTO seasons (season_year) VALUES (@Y);

-- 2) Circuits used in season (insert if missing)
INSERT INTO circuits (circuit_name, country, city, laps, length_m, first_gp_year, fastest_lap_time)
SELECT
  c.name AS circuit_name,
  cn.name AS country,
  c.place_name AS city,
  NULL AS laps,
  CAST(ROUND(c.length * 1000) AS SIGNED) AS length_m,
  (SELECT MIN(r2.year) FROM f1_dump.race r2 WHERE r2.circuit_id = c.id) AS first_gp_year,
  NULL AS fastest_lap_time
FROM f1_dump.race r
JOIN f1_dump.circuit c ON c.id = r.circuit_id
LEFT JOIN f1_dump.country cn ON cn.id = c.country_id
WHERE r.year = @Y
GROUP BY c.id, c.name, cn.name, c.place_name, c.length
ON DUPLICATE KEY UPDATE circuit_name = circuit_name;

-- 3) Teams (constructors used in season)
INSERT INTO teams (team_name, full_name, founding_year, base_country, base_city, team_chief, engine_supplier)
SELECT
  co.name AS team_name,
  co.full_name,
  NULL AS founding_year,
  cn.name AS base_country,
  NULL AS base_city,
  NULL AS team_chief,
  NULL AS engine_supplier
FROM (
  SELECT DISTINCT rr.constructor_id
  FROM f1_dump.race_result rr
  JOIN f1_dump.race r ON r.id = rr.race_id
  WHERE r.year = @Y
) x
JOIN f1_dump.constructor co ON co.id = x.constructor_id
LEFT JOIN f1_dump.country cn ON cn.id = co.country_id
ON DUPLICATE KEY UPDATE team_name = team_name;

-- 4) Drivers used in season
INSERT INTO drivers (
  car_no, driver_code, first_name, last_name, nation, birth_date,
  num_poles, num_podiums, num_championships
)
SELECT
  NULL AS car_no,
  d.abbreviation AS driver_code,
  d.first_name,
  d.last_name,
  cn.name AS nation,
  d.date_of_birth AS birth_date,
  COALESCE(d.total_pole_positions, 0) AS num_poles,
  COALESCE(d.total_podiums, 0) AS num_podiums,
  COALESCE(d.total_championship_wins, 0) AS num_championships
FROM (
  SELECT DISTINCT rr.driver_id
  FROM f1_dump.race_result rr
  JOIN f1_dump.race r ON r.id = rr.race_id
  WHERE r.year = @Y
) x
JOIN f1_dump.driver d ON d.id = x.driver_id
LEFT JOIN f1_dump.country cn ON cn.id = d.nationality_country_id
ON DUPLICATE KEY UPDATE driver_code = driver_code;

-- 5) Races
INSERT INTO races (season_year, round_number, circuit_id, grand_prix_name, race_start_date, race_end_date)
SELECT
  r.year AS season_year,
  r.round AS round_number,
  c2.circuit_id,
  r.official_name AS grand_prix_name,
  r.date AS race_start_date,
  r.date AS race_end_date
FROM f1_dump.race r
JOIN f1_dump.circuit c ON c.id = r.circuit_id
JOIN circuits c2 ON c2.circuit_name = c.name
WHERE r.year = @Y
ON DUPLICATE KEY UPDATE grand_prix_name = VALUES(grand_prix_name);

-- 6) Team standings (final season constructors standings)
INSERT INTO team_standings (season_year, team_id, season_position, season_points)
SELECT
  s.year AS season_year,
  t.team_id,
  s.position_number AS season_position,
  CAST(ROUND(s.points) AS SIGNED) AS season_points
FROM f1_dump.season_constructor_standing s
JOIN f1_dump.constructor co ON co.id = s.constructor_id
JOIN teams t ON t.team_name = co.name
WHERE s.year = @Y
ON DUPLICATE KEY UPDATE
  season_position = VALUES(season_position),
  season_points = VALUES(season_points);

-- 7) Assign drivers to teams for the season using "most starts with constructor" (seat 1/2 for top 2)
INSERT INTO team_drivers (season_year, team_id, driver_id, role, seat_no)
SELECT
  rr.season_year,
  t.team_id,
  d2.driver_id,
  CASE WHEN rr.rn <= 2 THEN 'MAIN' ELSE 'RESERVE' END AS role,
  CASE WHEN rr.rn = 1 THEN 1 WHEN rr.rn = 2 THEN 2 ELSE NULL END AS seat_no
FROM (
  SELECT
    roster.season_year,
    roster.constructor_id,
    roster.driver_id,
    roster.points,
    ROW_NUMBER() OVER (
      PARTITION BY roster.season_year, roster.constructor_id
      ORDER BY roster.points DESC, roster.driver_id
    ) AS rn
  FROM (
    SELECT
      bc.season_year,
      bc.constructor_id,
      bc.driver_id,
      COALESCE(p.points, 0) AS points
    FROM (
      SELECT sbdc.*
      FROM (
        SELECT
          r.year AS season_year,
          rr.driver_id,
          rr.constructor_id,
          COUNT(*) AS starts
        FROM f1_dump.race_result rr
        JOIN f1_dump.race r ON r.id = rr.race_id
        WHERE r.year = @Y
        GROUP BY r.year, rr.driver_id, rr.constructor_id
      ) sbdc
      JOIN (
        SELECT season_year, driver_id, MAX(starts) AS max_starts
        FROM (
          SELECT
            r.year AS season_year,
            rr.driver_id,
            rr.constructor_id,
            COUNT(*) AS starts
          FROM f1_dump.race_result rr
          JOIN f1_dump.race r ON r.id = rr.race_id
          WHERE r.year = @Y
          GROUP BY r.year, rr.driver_id, rr.constructor_id
        ) x
        GROUP BY season_year, driver_id
      ) m
        ON m.season_year = sbdc.season_year
       AND m.driver_id = sbdc.driver_id
       AND m.max_starts = sbdc.starts
    ) bc
    LEFT JOIN (
      SELECT
        r.year AS season_year,
        rr.driver_id,
        SUM(COALESCE(rr.points, 0)) AS points
      FROM f1_dump.race_result rr
      JOIN f1_dump.race r ON r.id = rr.race_id
      WHERE r.year = @Y
      GROUP BY r.year, rr.driver_id
    ) p
      ON p.season_year = bc.season_year AND p.driver_id = bc.driver_id
  ) roster
) rr
JOIN f1_dump.constructor co ON co.id = rr.constructor_id
JOIN teams t ON t.team_name = co.name
JOIN f1_dump.driver d ON d.id = rr.driver_id
JOIN drivers d2 ON d2.driver_code = d.abbreviation
ON DUPLICATE KEY UPDATE role = VALUES(role), seat_no = VALUES(seat_no);

-- 8) Race results (from f1_dump.race_result view)
INSERT INTO race_results (season_year, round_number, driver_id, grid_position, finish_position, points)
SELECT
  r.year AS season_year,
  r.round AS round_number,
  d2.driver_id,
  rr.grid_position_number AS grid_position,
  rr.position_number AS finish_position,
  CAST(ROUND(COALESCE(rr.points, 0)) AS SIGNED) AS points
FROM f1_dump.race_result rr
JOIN f1_dump.race r ON r.id = rr.race_id
JOIN f1_dump.driver d ON d.id = rr.driver_id
JOIN drivers d2 ON d2.driver_code = d.abbreviation
WHERE r.year = @Y
ON DUPLICATE KEY UPDATE
  grid_position = VALUES(grid_position),
  finish_position = VALUES(finish_position),
  points = VALUES(points);

