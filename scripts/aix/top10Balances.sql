----------------------------------------------------------------------
-- Top 10 balances per month (excluding systems)
-- Author: Nevin Jojo
----------------------------------------------------------------------
WITH 
    topBalances AS
    (
        SELECT
            *,
            row_number() over(PARTITION BY month ORDER BY month) as rowNum
        FROM
            (SELECT
                (to_char(changed, 'yyyy-MM'))as month,
                created,
                sum(total) as total
            FROM
                balance
            GROUP BY
                month, 
                created
            ORDER BY
                month,
                total DESC
            ) b
    )
SELECT
    * 
FROM
    topBalances
WHERE
    rowNum <= 10;
