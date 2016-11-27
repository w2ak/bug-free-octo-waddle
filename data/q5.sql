-- Question 5
-- Find the titles of the twenty movies having the largest number of directors and their number of
-- directors, ordered by their number of directors in decreasing order.
WITH directors_count AS (
  SELECT COUNT(person_id) AS "count",movie_id
  FROM cast_info
  INNER JOIN role_type
  ON role_id = role_type.id
  AND role = 'director'
  GROUP BY movie_id
  ORDER BY "count" DESC
  LIMIT 20
)
SELECT title,"count"
FROM directors_count
INNER JOIN movie
ON movie.id = movie_id;
-- ORDER BY "count" DESC
-- LIMIT 20;
