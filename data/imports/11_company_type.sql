DROP TABLE IF EXISTS company_type;
CREATE TABLE company_type(
id                integer,
kind              text,
PRIMARY KEY (id)
);
\copy company_type FROM 'company_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

