# About

The whole project can be found on [github](https://www.github.com/w2ak/bug-free-octo-waddle.git).

# Loading

```sql
CREATE DATABASE inf553dp;

Merge branch 'master' of https://github.com/w2ak/bug-free-octo-waddle
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
  FOREIGN KEY (kind_id) REFERENCES movie_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy aka_title FROM 'aka_title.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);
UPDATE aka_title
  SET movie_id=NULL
  WHERE movie_id=0;
ALTER TABLE aka_title
  ADD CONSTRAINT movie_id_fkey
  FOREIGN KEY (movie_id)
  REFERENCES movie (id)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

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
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (keyword_id) REFERENCES keyword
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_keyword FROM 'movie_keyword.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE link_type(
  id                integer,
  link              varchar(32),
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
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (linked_movie_id) REFERENCES movie (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (link_type_id) REFERENCES link_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy movie_link FROM 'movie_link.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE movie_rating(
  id                integer,
  movie_id          integer,
  info_type_id      integer,
  info              text,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
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
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (company_id) REFERENCES company (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (company_type_id) REFERENCES company_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
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
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (info_type_id) REFERENCES info_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy person_info FROM 'person_info.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE aka_name(
  id                integer,
  person_id         integer,
  name              text,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES person (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy aka_name FROM 'aka_name.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);

CREATE TABLE role_type(
  id                integer,
  role              text,
  PRIMARY KEY (id)
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
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (movie_id) REFERENCES movie (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (person_role_id) REFERENCES char_name (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (role_id) REFERENCES role_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
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
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (subject_id) REFERENCES comp_cast_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (status_id) REFERENCES comp_cast_type (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
\copy complete_cast FROM 'complete_cast.csv' with (FORMAT 'csv', DELIMITER ',', HEADER true);
```

# Queries

1. Find the title and the year of production of each movie in which Nicholas Cage played. Order the
results by year in descending order, then by title in ascending order.

2. Find the name of each actor who played the character Morpheus in a video game, together with
the name of the game. Order the results by year in descending order, then by title in ascending
order.

3. Find the name of all the people that have played in a movie they directed, and order them by their
names (increasing alphabetical order).

4. Find the name of all the people that are both actors and directors, and order them by name.

5. Find the titles of the twenty movies having the largest number of directors and their number of
directors, ordered by their number of directors in decreasing order.6. Find the titles of the movies that have only 1 and 10 as ratings, and order them by average rating
(decreasing).

7. Find the average number of cinema movies Dolores Fonzi played in, in her active years. A year is
active if she plays in at least one movie produced that year.

8. Find all the pairs of titles of movies m1 and m2 such that m1 directly or indirectly references m2,
ordered first by the title of m1, then by the title of m2. We say there is an indirect reference from
m1 to m2, if either (i) m1 references m2, or (ii) m1 references m3, and m3 indirectly references
m2.

# Query plans

# Improving query performance
