-- Question 5 - optimized
EXPLAIN WITH directors_count AS (
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
