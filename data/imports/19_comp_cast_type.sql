DROP TABLE IF EXISTS comp_cast_type;
CREATE TABLE comp_cast_type(
id                integer,
kind              varchar(20),
PRIMARY KEY (id)
);
\copy comp_cast_type FROM 'comp_cast_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

