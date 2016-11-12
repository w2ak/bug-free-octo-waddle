# About

The whole project can be found on [github](https://www.github.com/w2ak/bug-free-octo-waddle.git).

# Loading

```sql
CREATE DATABASE inf553dp;

CREATE TABLE movie_type(
  id                integer,
  kind              varchar(16),
  PRIMARY KEY (id)
);
\copy movie_type FROM 'movie_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie(
  id                integer,
  title             text,
  kind_id           integer,
  production_year   integer,
  episode_of_id     integer,
  season_nr         integer,
  episode_nr        integer,
  series_years      text,
  PRIMARY KEY (id),
  FOREIGN KEY (kind_id) REFERENCES movie_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie FROM 'movie.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE info_type(
  id                integer,
  info              text,
  PRIMARY KEY (id)
);
\copy info_type FROM 'info_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_info(
  id                integer,
  movie_id          integer,
  info_type_id      integer,
  info              text,
  note              text,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_info FROM 'movie_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE aka_title(
  id                integer,
  movie_id          integer,
  title             text,
  kind_id           integer,
  production_year   integer,
  episode_of_id     integer,
  season_nr         integer,
  episode_nr        integer,
  note              text,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
  FOREIGN KEY (kind_id) REFERENCES movie_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy aka_title FROM 'aka_title.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE keyword(
  id                integer,
  keyword           text,
  PRIMARY KEY(id)
);
\copy keyword FROM 'keyword.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_keyword(
  id                integer,
  movie_id          integer,
  keyword_id        integer,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (keyword_id) REFERENCES keyword
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy movie_keyword FROM 'movie_keyword.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE link_type(
  id                integer,
  link              varchar(13),
  PRIMARY KEY (id)
);
\copy link_type FROM 'link_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_link(
  id                integer,
  movie_id          integer,
  linked_movie_id   integer,
  link_type_id      integer,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,                -- TODO : SHORTEN
  FOREIGN KEY (linked_movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (link_type_id) REFERENCES link_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy movie_link FROM 'movie_link.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_rating(
  id                integer,
  movie_id          integer,
  info_type_id      integer,
  info              text,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy movie_rating FROM 'movie_rating.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE company(
  id                integer,
  name              text,
  country_code      text,
  PRIMARY KEY (id)
);
\copy company FROM 'company.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE company_type(
  id                integer,
  kind              text,
  PRIMARY KEY (id)
);
\copy company_type FROM 'company_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_company(
  id                integer,
  movie_id          integer,
  company_id        integer,
  company_type_id   integer,
  note              text,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (company_id) REFERENCES company (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (company_type_id) REFERENCES company_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy movie_company FROM 'movie_company.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE person(
  id                integer,
  name              text,
  gender            char,
  PRIMARY KEY (id)
);
\copy person FROM 'person.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE person_info(
  id                integer,
  person_id         integer,
  info_type_id      integer,
  info              text,
  note              text,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES person (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy person_info FROM 'person_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE aka_name(
  id                integer,
  person_id         integer,
  name              text,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES person (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy aka_name FROM 'aka_name.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE role_type(
  id                integer,
  role              text,
  PRIMARY_KEY (id)
);
\copy role_type FROM 'role_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE char_name(
  id                integer,
  name              text,
  PRIMARY KEY (id)
);
\copy char_name FROM 'char_name.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE cast_info(
  id                integer,
  person_id         integer,
  movie_id          integer,
  person_role_id    integer,
  note              text,
  role_id           integer,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES person (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (person_role_id) REFERENCES char_name (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (role_id) REFERENCES role_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy cast_info FROM 'cast_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE comp_cast_type(
  id                integer,
  kind              varchar(20),
  PRIMARY KEY (id)
);
\copy comp_cast_type FROM 'comp_cast_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE complete_cast(
  id                integer,
  movie_id          integer,
  subject_id        integer,
  status_id         integer,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (subject_id) REFERENCES comp_cast_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (status_id) REFERENCES comp_cast_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy complete_cast FROM 'complete_cast.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);
```


# Query plans

# Improving query performance
