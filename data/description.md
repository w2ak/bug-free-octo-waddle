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
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy movie FROM 'movie.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_info(
  id                integer,
  movie_id          integer,
  info_type_id      integer,
  info              text,
  note              text,
  PRIMARY_KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type
    ON DELETE NO ACTION ON UPDATE CASCADE
);
\copy movie_info FROM 'movie_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE info_type(
  id                integer,
  info              text,
  PRIMARY KEY (id)
);
\copy info_type FROM 'info_type.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

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
  country_code      char(4),
  PRIMARY KEY (id)
);
\copy company FROM 'company.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);
```


# Query plans

# Improving query performance
