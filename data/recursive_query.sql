WITH RECURSIVE paths (s,origin,target) AS (
  SELECT 1,origin,target FROM edges
  UNION ALL
  SELECT s+1,edges.origin,paths.target
  FROM edges
  INNER JOIN paths
  ON edges.target = paths.origin
  AND edges.origin != paths.target
)
SELECT * FROM paths;
