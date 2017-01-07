-- Question 4
-- Find the names of all the people that are both actor and director, and order them by name.
WITH actors AS (
  -- SELECT person_id
  SELECT DISTINCT person_id
  FROM cast_info
  INNER JOIN role_type
  ON role_id = role_type.id
  AND ( role = 'actor' OR role = 'actress' )
),
directors AS (
  -- SELECT person_id
  SELECT DISTINCT person_id
  FROM cast_info
  INNER JOIN role_type
  ON role_id = role_type.id
  AND role = 'director'
),
"both" AS (
  -- SELECT DISTINCT actors.person_id
  SELECT actors.person_id
  FROM actors
  INNER JOIN directors
  ON actors.person_id = directors.person_id
)
SELECT person.name
FROM person
INNER JOIN "both"
ON "both".person_id = person.id
ORDER BY person.name ASC;
