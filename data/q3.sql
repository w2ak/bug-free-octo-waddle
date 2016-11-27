-- Question 3
-- Find the name of all the people who played in a movie they directed, and
-- order them by their name.
WITH actors AS (
  SELECT person_id,movie_id
  FROM cast_info
  INNER JOIN role_type
  ON role_id = role_type.id
  AND role = 'actor'
),
directors AS (
  SELECT person_id,movie_id
  FROM cast_info
  INNER JOIN role_type
  ON role_id = role_type.id
  AND role = 'director'
),
"both" AS (
  SELECT DISTINCT actors.person_id
  FROM actors
  INNER JOIN directors
  ON actors.movie_id = directors.movie_id
  AND actors.person_id = directors.person_id
)
SELECT person.name
FROM person
INNER JOIN "both"
ON "both".person_id = person.id
ORDER BY person.name ASC;
