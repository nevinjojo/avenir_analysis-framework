----------------------------------------------------------------------
-- Total balances per month
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    (to_char(changed, 'yyyy-MM')) as month,
    sum(total) as total
FROM
    balance
GROUP BY
    month
ORDER BY
    total DESC;
