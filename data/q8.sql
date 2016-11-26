-- Question 8
-- Find all the pairs of titles of movies m1 and m2 such that m1 directly or indirectly references m2,
-- ordered first by the title of m1, then by the title of m2. We say there is an indirect reference from
-- m1 to m2, if either (i) m1 references m2, or (ii) m1 references m3, and m3 indirectly references
-- m2.
WITH RECURSIVE "references" (src,dst) AS (
  SELECT DISTINCT movie_link.movie_id AS src,movie_link.linked_movie_id AS dst
  FROM movie_link
  INNER JOIN link_type
  ON link_type.id = movie_link.link_type_id
  AND link_type."link" = 'references'
),
indirect (s,src,dst) AS (
  SELECT 1,src,dst FROM "references"
  UNION ALL
  SELECT s+1,"references".src,indirect.dst
  FROM "references"
  INNER JOIN indirect
  ON "references".dst = indirect.src
  AND "references".src != indirect.dst
)
SELECT DISTINCT src,dst FROM indirect;
