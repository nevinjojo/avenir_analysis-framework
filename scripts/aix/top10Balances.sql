----------------------------------------------------------------------
-- Top 10 balances per month (excluding systems)
-- Author: Nevin Jojo
----------------------------------------------------------------------
WITH Cte AS
(
    SELECT
    *,
    row_number() over(PARTITION BY month ORDER BY month) as rowNum
FROM
    (SELECT
        (to_char(changed, 'yyyy-MM'))as month,
        created,
        sum(total) as total
--        row_number() over(PARTITION BY (to_char(changed, 'yyyy-MM')) ORDER BY (to_char(changed, 'yyyy-MM'))) as row
    FROM
        balance
    GROUP BY
        month, 
        created
    ORDER BY
        --DATE_PART('year', changed),
        --DATE_PART('month', changed), 
        month,
        total DESC
    ) b
)
select * 
FROM
    Cte
WHERE
    rowNum <= 10;
