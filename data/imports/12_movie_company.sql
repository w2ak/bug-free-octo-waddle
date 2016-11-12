DROP TABLE IF EXISTS movie_company;
CREATE TABLE movie_company(
id                integer,
movie_id          integer,
company_id        integer,
company_type_id   integer,
note              text,
PRIMARY KEY (id),
FOREIGN KEY (movie_id) REFERENCES movie (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (company_id) REFERENCES company (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (company_type_id) REFERENCES company_type (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_company FROM 'movie_company.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

