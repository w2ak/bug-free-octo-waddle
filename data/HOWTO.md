# Load one of the tables

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

# Small tasks

## Clean up

When there were errors on import, there is data using disk but non accessible. Use the vacuum command :

```
inf553dp=# VACUUM;
```
