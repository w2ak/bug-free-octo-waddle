DROP TABLE IF EXISTS char_name;
CREATE TABLE char_name(
id                integer,
name              text,
PRIMARY KEY (id)
);
\copy char_name FROM 'char_name.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

