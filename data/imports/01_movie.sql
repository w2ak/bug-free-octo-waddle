DROP TABLE IF EXISTS movie;
CREATE TABLE movie(
id                integer,
title             text,
kind_id           integer,
production_year   integer,
episode_of_id     integer,
season_nr         integer,
episode_nr        integer,
series_years      text,
PRIMARY KEY (id),
FOREIGN KEY (kind_id) REFERENCES movie_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie FROM 'movie.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

