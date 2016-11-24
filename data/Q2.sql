WITH morpheus AS (
    SELECT (person_id,movie_id)
    FROM cast_info
    WHERE (person_role_id = ???) #look at char_name id equivalent to Morpheus
)

WITH video_game AS (
    SELECT (id AS movie_id,production_year,title)
    FROM movie
    WHERE (kind_id =???) look at corresponding in movie_type for video game
)

WITH both_conditions AS (
    SELECT (A.person_id,B.title)
    FROM morpheus A 
         INNER JOIN video_game B
            ON A.movie_id = B.movie_id
    ORDER BY B.production_year DESC, B.title ASC
)

SELECT (A.name,B.title)
FROM person A
    INNER JOIN both_conditions B
        ON A.id = B.person_id;


