DROP TABLE IF EXISTS person;
CREATE TABLE person(
id                integer,
name              text,
gender            char,
PRIMARY KEY (id)
);
\copy person FROM 'person.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

