DROP TABLE IF EXISTS movie_type;
CREATE TABLE movie_type(
id                integer,
kind              varchar(16),
PRIMARY KEY (id)
);
\copy movie_type FROM 'movie_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

