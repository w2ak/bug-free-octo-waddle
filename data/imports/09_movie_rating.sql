DROP TABLE IF EXISTS movie_rating;
CREATE TABLE movie_rating(
id                integer,
movie_id          integer,
info_type_id      integer,
info              text,
PRIMARY KEY (id),
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (info_type_id) REFERENCES info_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_rating FROM 'movie_rating.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

