DROP TABLE IF EXISTS movie_info;
CREATE TABLE movie_info(
id                integer,
movie_id          integer,
info_type_id      integer,
info              text,
note              text,
PRIMARY KEY (id),
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (info_type_id) REFERENCES info_type
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_info FROM 'movie_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

