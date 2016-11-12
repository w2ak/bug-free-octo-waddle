DROP TABLE IF EXISTS complete_cast;
CREATE TABLE complete_cast(
id                integer,
movie_id          integer,
subject_id        integer,
status_id         integer,
PRIMARY KEY (id),
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (subject_id) REFERENCES comp_cast_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (status_id) REFERENCES comp_cast_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy complete_cast FROM 'complete_cast.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);
