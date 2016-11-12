DROP TABLE IF EXISTS aka_name;
CREATE TABLE aka_name(
id                integer,
person_id         integer,
name              text,
PRIMARY KEY (id),
FOREIGN KEY (person_id) REFERENCES person (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy aka_name FROM 'aka_name.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

