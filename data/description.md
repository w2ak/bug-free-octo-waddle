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
-- TODO: import the file movie_type.csv

CREATE TABLE movie(
  id                integer,
  title             text,
  kind_id           integer,
  production_year   integer,
  episode_of_id     integer,
  season_nr         integer,
  episode_nr        integer,
  series_years      integer,
  PRIMARY KEY (id),
  FOREIGN KEY (kind_id) REFERENCES movie_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE movie_info(
  id                integer,
  movie_id          integer,
  info_type_id      integer,
  info              text,
  note              text,
  PRIMARY_KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE info_type(
  id                integer,
  info              text,
  PRIMARY KEY (id)
);

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
  FOREIGN KEY (movie_id) REFERENCES movie
    ON DELETE NO ACTION ON UPDATE CASCADE
  FOREIGN KEY (kind_id) REFERENCES movie_type (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE keyword(
  id                integer,
  keyword           text,
  PRIMARY KEY(id)
);

CREATE TABLE movie_keyword(
  id                integer,
  movie_id          integer,
  keyword_id        integer,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie
    ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (keyword_id) REFERENCES keyword
    ON DELETE NO ACTION ON UPDATE CASCADE
);
```


# Query plans

# Improving query performance
