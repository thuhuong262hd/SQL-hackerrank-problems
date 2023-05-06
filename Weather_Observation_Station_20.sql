/*
Enter your query here.
SET @row_num := 0;
SELECT (@row_num := @row_num + 1) AS row_num, LAT_N
FROM 
    STATION
ORDER BY 
    LAT_N;
*/
-- 499

SELECT ROUND(LAT_N, 4) as LAT_MEDIAN
FROM (
    SELECT row_num, LAT_N
        FROM ( 
            SELECT (@row_num := @row_num + 1) AS row_num, LAT_N
            FROM 
                (SELECT @row_num := 0) r, STATION
            ORDER BY LAT_N
            ) LAT_TABLE
    WHERE row_num IN (FLOOR((@row_num+1)/2))
) MEDIAN;

