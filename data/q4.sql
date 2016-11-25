WITH directors_actors AS (
    SELECT (person_id)
    FROM cast_info
    WHERE (role_id = ACTOR (corriger)!!!) look at role_type table

    INTERSECT

    SELECT (person_id)
    FROM cast_info
    WHERE (role_id = DIRECTOR (corriger)!!!)    
)
SELECT name
FROM person
INNER JOIN directors_actors
ON directors_actors.person_id=person.id
ORDER BY name ASC;
