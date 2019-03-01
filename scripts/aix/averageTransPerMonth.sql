----------------------------------------------------------------------
-- Average transaction value per month
--Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    to_char(t.changed, 'yyyy-MM') as changed,
    avg(t.quantity) as average_quantity
FROM
    trans t
GROUP BY
    to_char(t.changed, 'yyyy-MM')
ORDER BY
    changed;
