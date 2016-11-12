DROP TABLE IF EXISTS company;
CREATE TABLE company(
id                integer,
name              text,
country_code      text,
PRIMARY KEY (id)
);
\copy company FROM 'company.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

