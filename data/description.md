# About

The whole project can be found on [github](https://www.github.com/w2ak/bug-free-octo-waddle.git).

Authors :
* Carolina DE SENNE GARCIA
* Clément DURAND

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

# Query plans

## Query 1

```
                                      QUERY PLAN
---------------------------------------------------------------------------------------
 Sort  (cost=1128011.93..1128015.84 rows=1565 width=21)
   Sort Key: movie.production_year DESC, movie.title
   CTE cage
     ->  Gather  (cost=1000.00..15173.01 rows=2 width=4)
           Workers Planned: 2
           ->  Parallel Seq Scan on aka_name  (cost=0.00..14172.81 rows=1 width=4)
                 Filter: (name = 'Cage, Nicholas'::text)
   ->  Nested Loop  (cost=0.49..1112755.88 rows=1565 width=21)
         ->  Hash Join  (cost=0.07..1112034.50 rows=1565 width=4)
               Hash Cond: (cast_info.person_id = cage.person_id)
               ->  Seq Scan on cast_info  (cost=0.00..910687.48 rows=53688348 width=8)
               ->  Hash  (cost=0.04..0.04 rows=2 width=4)
                     ->  CTE Scan on cage  (cost=0.00..0.04 rows=2 width=4)
         ->  Index Scan using movie_pkey on movie  (cost=0.43..0.45 rows=1 width=25)
               Index Cond: (id = cast_info.movie_id)
(15 rows)
```

## Query 8

```
                                              QUERY PLAN
------------------------------------------------------------------------------------------------------
 HashAggregate  (cost=14805.09..14959.45 rows=15436 width=8)
   Group Key: indirect.src, indirect.dst
   CTE references
     ->  HashAggregate  (cost=202.06..207.62 rows=556 width=8)
           Group Key: movie_link.movie_id, movie_link.linked_movie_id
           ->  Hash Join  (cost=1.24..199.28 rows=556 width=8)
                 Hash Cond: (movie_link.link_type_id = link_type.id)
                 ->  Seq Scan on movie_link  (cost=0.00..154.99 rows=9999 width=12)
                 ->  Hash  (cost=1.23..1.23 rows=1 width=4)
                       ->  Seq Scan on link_type  (cost=0.00..1.23 rows=1 width=4)
                             Filter: ((link)::text = 'references'::text)
   CTE indirect
     ->  Recursive Union  (cost=0.00..10738.57 rows=154356 width=12)
           ->  CTE Scan on "references"  (cost=0.00..11.12 rows=556 width=12)
           ->  Hash Join  (cost=18.07..764.03 rows=15380 width=12)
                 Hash Cond: (indirect_1.src = references_1.dst)
                 Join Filter: (references_1.src <> indirect_1.dst)
                 ->  WorkTable Scan on indirect indirect_1  (cost=0.00..111.20 rows=5560 width=12)
                 ->  Hash  (cost=11.12..11.12 rows=556 width=8)
                       ->  CTE Scan on "references" references_1  (cost=0.00..11.12 rows=556 width=8)
   ->  CTE Scan on indirect  (cost=0.00..3087.12 rows=154356 width=8)
(21 rows)
```

# Improving query performance

## Query 2

### Original query

```sql
WITH morpheus_id AS (
    SELECT id
    FROM char_name
    WHERE name = 'Morpheus'
),
video_game AS (
    SELECT id
    FROM movie_type
    WHERE kind = 'video game'
),
movie_with_morpheus AS (
    SELECT person_id,movie_id
    FROM cast_info
    INNER JOIN morpheus_id
            ON morpheus_id.id = cast_info.person_role_id
)
SELECT person.name,title
      FROM movie
INNER JOIN video_game
        ON video_game.id = movie.kind_id
INNER JOIN movie_with_morpheus
        ON movie_with_morpheus.movie_id = movie.id
INNER JOIN person
        ON person.id = person_id
ORDER BY production_year DESC, title ASC;
```

There are many searches to do, which is obviously costly (also in joins).

### Estimated cost

Obtained in Query Plan.

```
(cost=47747.19..47747.19 rows=1 width=36)
```

### Improvement

We used indexes to reduce search and joins costs. To select on a particular string value we used a Hash index.

```sql
CREATE INDEX morpheus_id_name_index ON char_name USING hash (name);
CREATE INDEX cast_info_prid_index ON cast_info (person_role_id);
CREATE INDEX movie_kid_index ON movie (kind_id);
CREATE INDEX person_index ON person (id);
```

### New cost

Obtained in Query Plan.

```
(cost=72.78..72.78 rows=1 width=36)
```

## Query 7

### Original query

```sql
WITH fonzi_movies AS (
  SELECT movie.production_year AS year
        FROM person
  INNER JOIN cast_info
          ON cast_info.person_id = person.id
  INNER JOIN movie
          ON cast_info.movie_id = movie.id
  INNER JOIN movie_type
          ON movie_type.id = movie.kind_id
         AND movie_type.kind = 'movie'
  WHERE person.name = 'Fonzi, Dolores'
),
movie_count AS (
  SELECT COUNT(year) AS year_count
  FROM fonzi_movies
  GROUP BY year
)
SELECT AVG(year_count)
FROM movie_count;
```

### Original cost

```
(cost=1179945.93..1179945.94 rows=1 width=32)
```

### Improvement

```sql
CREATE INDEX person_name_index ON person USING hash (name);
CREATE INDEX cast_info_pid_index ON cast_info (person_id);
CREATE INDEX movie_id_index ON movie (id);
```

### New cost

```
(cost=8906.49..8906.50 rows=1 width=32)
```
