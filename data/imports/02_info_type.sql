DROP TABLE IF EXISTS info_type;
CREATE TABLE info_type(
id                integer,
info              text,
PRIMARY KEY (id)
);
\copy info_type FROM 'info_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

