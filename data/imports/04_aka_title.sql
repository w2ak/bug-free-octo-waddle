DROP TABLE IF EXISTS aka_title;
CREATE TABLE aka_title(
id                integer,
movie_id          integer,
title             text,
kind_id           integer,
production_year   integer,
episode_of_id     integer,
season_nr         integer,
episode_nr        integer,
note              text,
PRIMARY KEY (id),
FOREIGN KEY (kind_id) REFERENCES movie_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy aka_title FROM 'aka_title.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);
UPDATE aka_title
SET movie_id=NULL
WHERE movie_id=0;
ALTER TABLE aka_title
ADD CONSTRAINT movie_id_fkey
FOREIGN KEY (movie_id)
REFERENCES movie (id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

