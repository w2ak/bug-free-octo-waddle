WITH movies_directors (
    SELECT (movie_id,COUNT(*) AS directors_per_movie)
    FROM (
        SELECT (movie_id,person_id)
        FROM cast_info
        WHERE (role_id = DIRECTOR (corriger)!!!)
        GROUP BY movie_id
    )
    ORDER BY directors_per_movie DESC
) 

SELECT M.title
FROM movie M
    INNER JOIN movies_directors MD
        ON M.id = MD.movie_id
LIMIT 20;
