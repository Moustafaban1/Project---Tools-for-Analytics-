
SELECT zip_code, COUNT(*) AS complaint_count
FROM complaints
WHERE created_date >= '2023-03-01' AND created_date <= '2024-02-29'
GROUP BY zip_code
ORDER BY complaint_count DESC;
