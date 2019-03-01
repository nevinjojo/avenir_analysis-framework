----------------------------------------------------------------------
-- Average balances per month for each member
-- author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    b.created as member,
    ROUND(AVG(b.total), 2) as avg_total,
    (to_char(b.changed, 'yyyy-MM')) as month
FROM
    balance b
GROUP BY
    b.created,
    month
ORDER BY
    member;
