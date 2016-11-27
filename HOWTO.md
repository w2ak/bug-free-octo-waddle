# Loading data from CSV files

## Load one of the tables

1. Chdir to the folder containing the description.

```
neze@pc:~$ cd /path/to/data/
```

2. Generate the .sql files

```
neze@pc:data/$ make imports
```

3. Chdir to the folder containing your tables.

```
neze@pc:data/$ cd ../files/
```

4. Connect to the database

```
neze@pc:files/$ psql inf553dp
```

5. Load the corresponding sql file

```
inf553dp=# \i ../data/imports/00_movie_type.sql
```

## Load all of the tables

Same as for one table, but you have to load the good file.

5. Load the generic import sql file

```
inf553dp=# \i ../data/imports/import.sql
```

**_Advice_**: You might want to start this and let it run through the night.

# Execute sql queries

1. Chdir to the folder containing the queries.

```
neze@pc:~$ cd /path/to/data/
```

2. Use make to compute a query, for example q2.sql.

```
neze@pc:data/$ make q2.out
```

3. When the computation ends, the output is in `q2.out` and the timing information is `q2.time`.

# Small tasks

## Clean up

When there were errors on import, there is data using disk but non accessible. Use the vacuum command :

```
inf553dp=# VACUUM;
```
