
SELECT t.zipcode AS zip_code, 
       TO_CHAR(AVG(z."Jan_2024"), 'FM9,999,999.00') AS average_rent
FROM trees t
JOIN rents z ON t.zipcode = CAST(z.zip_code AS text)
GROUP BY t.zipcode
ORDER BY COUNT(t.tree_id) DESC
LIMIT 10;
