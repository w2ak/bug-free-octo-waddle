-- Question :
-- Find the title and the year of production of each movie in which Nicholas Cage played.
-- Order the results by year in descending order, then by title in ascending order.
WITH cage AS (
  SELECT person_id
  FROM aka_name
  WHERE name='Cage, Nicholas'
)
SELECT title,production_year
      FROM cage
INNER JOIN cast_info
        ON cast_info.person_id = cage.person_id
INNER JOIN movie
        ON movie.id = cast_info.movie_id
ORDER BY production_year DESC, title ASC;
