DROP TABLE IF EXISTS movie_keyword;
CREATE TABLE movie_keyword(
id                integer,
movie_id          integer,
keyword_id        integer,
PRIMARY KEY (id),
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (keyword_id) REFERENCES keyword
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_keyword FROM 'movie_keyword.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

