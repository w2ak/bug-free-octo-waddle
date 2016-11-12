DROP TABLE IF EXISTS movie_link;
CREATE TABLE movie_link(
id                integer,
movie_id          integer,
linked_movie_id   integer,
link_type_id      integer,
PRIMARY KEY (id),
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,                -- TODO : SHORTEN
FOREIGN KEY (linked_movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (link_type_id) REFERENCES link_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_link FROM 'movie_link.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

