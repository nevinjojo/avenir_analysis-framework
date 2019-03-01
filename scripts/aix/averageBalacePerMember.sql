----------------------------------------------------------------------
-- Average balances per member for each short
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    b.created as member,
    b.short as short,
    ROUND(avg(b.total), 2) as avg_total
FROM
    balance b
GROUP BY
    b.created,
    b.short
ORDER BY
    b.short,
    avg_total DESC;
