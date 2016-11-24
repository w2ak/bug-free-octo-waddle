WITH rating_1_and_10 (
    SELECT (movie_id,AVG(rating) AS average)
    FROM (
        SELECT (movie_id,???)
        FROM (
            DELETE FROM (SELECT * FROM movie_rating)
            WHERE (??? != 1 AND ??? != 10)
            )
        GROUP BY movie_id
    )
    ORDER BY average DESC
) 

SELECT M.title
FROM movie M
    INNER JOIN rating_1_and_10 R
        ON M.id = R.movie_id;
