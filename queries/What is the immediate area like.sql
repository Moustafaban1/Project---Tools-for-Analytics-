
SELECT 
    tree_id AS "ID", 
    spc_common AS "Species", 
    health AS "Health", 
    status AS "Status", 
    ST_AsText(the_geom) AS "Coordinate Location"
FROM 
    trees
WHERE 
    ST_DWithin(the_geom, ST_SetSRID(ST_MakePoint(-73.96253174434912, 40.80737875669467), 4326), 804.672)
LIMIT 10000
