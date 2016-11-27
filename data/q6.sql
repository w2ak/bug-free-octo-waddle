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
middle_ratings AS (
  SELECT DISTINCT movie_id
  FROM ratings
  WHERE info > 1
  AND info <10
),
extreme_ratings AS (
  SELECT DISTINCT movie_id
  FROM ratings
  EXCEPT
  SELECT movie_id
  FROM middle_ratings
),
averages AS (
  SELECT ratings.movie_id,AVG(info) AS average
  FROM ratings
  INNER JOIN extreme_ratings
  ON extreme_ratings.movie_id = ratings.movie_id
  GROUP BY ratings.movie_id
)
SELECT title,average
FROM averages
INNER JOIN movie
ON averages.movie_id = movie.id
ORDER BY average DESC;
