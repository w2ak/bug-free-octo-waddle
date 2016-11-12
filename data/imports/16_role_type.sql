DROP TABLE IF EXISTS role_type;
CREATE TABLE role_type(
id                integer,
role              text,
PRIMARY KEY (id)
);
\copy role_type FROM 'role_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

