-- Question 3
-- Find the name of all the people who played in a movie they directed, and
-- order them by their name.
-- WITH directors_actors AS (
    -- SELECT person_id,movie_id
    -- FROM cast_info
    -- WHERE (role_id = 1)

    -- INTERSECT

    -- SELECT person_id,movie_id
    -- FROM cast_info
    -- WHERE (role_id = 8)
-- )
-- SELECT name
-- FROM person
-- INNER JOIN directors_actors
-- ON directors_actors.person_id=person.id
-- ORDER BY name ASC;


SELECT person.name
FROM cast_info AS A
INNER JOIN role_type AS RA
ON RA.id = A.role_id
INNER JOIN cast_info AS B
ON A.movie_id = B.movie_id
AND A.person_id = B.person_id
INNER JOIN role_type AS RB
ON RB.id = B.role_id
INNER JOIN person
ON person.id = A.person_id
WHERE RA.role = 'actor'
AND RB.role = 'director';
