DROP TABLE IF EXISTS keyword;
CREATE TABLE keyword(
id                integer,
keyword           text,
PRIMARY KEY(id)
);
\copy keyword FROM 'keyword.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

