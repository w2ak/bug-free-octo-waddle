DROP TABLE IF EXISTS person_info;
CREATE TABLE person_info(
id                integer,
person_id         integer,
info_type_id      integer,
info              text,
note              text,
PRIMARY KEY (id),
FOREIGN KEY (person_id) REFERENCES person (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (info_type_id) REFERENCES info_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy person_info FROM 'person_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

