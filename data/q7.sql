-- Question 7
-- Find the average number of cinema movies Dolores Fonzi played in, in her
-- active years. A year is active if she plays in at least one movie produced
-- that year.
WITH fonzi_movies AS (
  SELECT movie.production_year AS year
        FROM person
  INNER JOIN cast_info
          ON cast_info.person_id = person.id
  INNER JOIN movie
          ON cast_info.movie_id = movie.id
  INNER JOIN movie_type
          ON movie_type.id = movie.kind_id
         AND movie_type.kind = 'movie'
  WHERE person.name = 'Fonzi, Dolores'
),
movie_count AS (
  SELECT COUNT(year) AS year_count
  FROM fonzi_movies
  GROUP BY year
)
SELECT AVG(year_count)
FROM movie_count;
