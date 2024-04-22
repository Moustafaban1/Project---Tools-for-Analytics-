
WITH RentRanking AS (
    SELECT 
        zip_code, 
        "Jan_2024" AS average_rent,
        RANK() OVER (ORDER BY "Jan_2024" DESC) AS high_rent_rank,
        RANK() OVER (ORDER BY "Jan_2024" ASC) AS low_rent_rank
    FROM rents
),
TreeCount AS (
    SELECT 
        zipcode AS zip_code, -- Using alias to match other table's column name
        COUNT(*) AS tree_count
    FROM trees
    GROUP BY zipcode
),
ComplaintCount AS (
    SELECT 
        zip_code,
        COUNT(*) AS complaint_count
    FROM complaints
    WHERE created_date >= '2024-01-01' AND created_date < '2024-02-01' -- Assuming you want January 2024 data
    GROUP BY zip_code
)
SELECT
    r.zip_code AS "Zip Code",
    TO_CHAR(r.average_rent, 'FM9,999,999.00') AS "Average Rent",
    COALESCE(t.tree_count, 0) AS "Tree Count",
    COALESCE(c.complaint_count, 0) AS "Complaint Count"
FROM RentRanking r
LEFT JOIN TreeCount t ON r.zip_code = t.zip_code -- Corrected to lowercase 'zip_code'
LEFT JOIN ComplaintCount c ON r.zip_code = c.zip_code -- Corrected to lowercase 'zip_code'
WHERE r.high_rent_rank <= 5 OR r.low_rent_rank <= 5
ORDER BY r.high_rent_rank, r.low_rent_rank;
