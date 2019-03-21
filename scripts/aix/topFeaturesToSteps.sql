----------------------------------------------------------------------
-- Number of steps to be made to reach each detail.
-- Details are ordered from most used to least used
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    *
FROM
    (SELECT
        au.detail as detail,      
        count(au.detail) detail_count,
        (CASE 
            WHEN (LENGTH(detail) - LENGTH(REPLACE(detail, '/', '')))-1 < 0 THEN 0
            ELSE (LENGTH(detail) - LENGTH(REPLACE(detail, '/', '')))-1 
        END) AS steps
            
    FROM
        audit au
    JOIN
        users u
    ON
        au.userid = u.id
    --id id = 1 (system), then exclude the data
    AND
        u.id <> 1
    AND
        detail <> '/en_GB'
    --AND
    --    steps > 1
    GROUP BY
        detail, steps
    ORDER BY
        detail_count DESC
    LIMIT
        50
    ) as b
WHERE
    steps > 0;
