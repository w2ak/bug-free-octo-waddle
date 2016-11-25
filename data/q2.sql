-- Question 2
-- Find the name of each actor who played the character Morpheus in a video
-- game, together with the name of the game.
-- Order the results by year in descending order, then by title in ascending
-- order.
WITH morpheus_id AS (
    SELECT id
    FROM char_name
    WHERE name = 'Morpheus'
),
video_game AS (
    SELECT id
    FROM movie_type
    WHERE kind = 'video game'
),
movie_with_morpheus AS (
    SELECT person_id,movie_id
    FROM cast_info
    INNER JOIN morpheus_id
            ON morpheus_id.id = cast_info.person_role_id
)
SELECT person.name,title
      FROM movie
INNER JOIN video_game
        ON video_game.id = movie.kind_id
INNER JOIN movie_with_morpheus
        ON movie_with_morpheus.movie_id = movie.id
INNER JOIN person
        ON person.id = person_id
ORDER BY production_year DESC, title ASC;
