----------------------------------------------------------------------
-- Average transaction value per month
--Author: Nevin Jojo
----------------------------------------------------------------------

--SELECT t.quantity, d.month
--FROM (
--    SELECT
--        d::date AS month
--    FROM
--        generate_series('2018-01-01'::timestamp, '2019-12-31', '1 day') d
--     ) d
--JOIN
--    trans t
--ON
--    t.changed <= d.month;

SELECT
    to_char(t.changed, 'yyyy-MM') as changed,
    avg(t.quantity) as average_quantity
FROM
    trans t
GROUP BY
    to_char(t.changed, 'yyyy-MM')
ORDER BY
    changed;
