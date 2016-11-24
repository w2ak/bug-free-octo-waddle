SELECT (title,production_year)
FROM movie
JOIN ( 
    SELECT movie_id AS id
	FROM cast_info
	JOIN (
	    SELECT person_id AS person_id
	    FROM aka_name
	    WHERE (name='Cage, Nicholas')
	    )
	)
ORDER BY production_year DESC, title ASC;
