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
                (to_char(b.changed, 'yyyy-MM'))as month,
                b.created,
                sum(total) as total
            FROM
                balance b
            JOIN
                account a
            ON
                b.account_id = a.id
            WHERE
                a.id >= 32
            GROUP BY
                month, 
                b.created
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
