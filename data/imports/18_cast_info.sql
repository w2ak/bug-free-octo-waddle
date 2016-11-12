DROP TABLE IF EXISTS cast_info;
CREATE TABLE cast_info(
id                integer,
person_id         integer,
movie_id          integer,
person_role_id    integer,
note              text,
role_id           integer,
PRIMARY KEY (id),
FOREIGN KEY (person_id) REFERENCES person (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (person_role_id) REFERENCES char_name (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (role_id) REFERENCES role_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy cast_info FROM 'cast_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

