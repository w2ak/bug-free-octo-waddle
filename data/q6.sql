-- Question 6
-- Find the titles of the movies that have only 1 and 10 as ratings, and order them by average rating
-- (decreasing).
WITH ratings AS (
  SELECT movie_id, (movie_rating.info::float) AS info
  FROM movie_rating
  INNER JOIN info_type
  ON info_type.info = 'rating'
  AND info_type.id = info_type_id
),
extremes AS (
  SELECT movie_id
  FROM movie_rating
  INNER JOIN info_type
  ON info_type.info = 'votes distribution'
  AND movie_rating.info like '_........_'
)
SELECT title,ratings.info AS average
FROM ratings
INNER JOIN extremes
ON extremes.movie_id = ratings.movie_id
INNER JOIN movie
ON extremes.movie_id = movie.id
ORDER BY average DESC, title ASC;
