DROP TABLE IF EXISTS link_type;
CREATE TABLE link_type(
id                integer,
link              varchar(32),
PRIMARY KEY (id)
);
\copy link_type FROM 'link_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

