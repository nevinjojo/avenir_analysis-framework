----------------------------------------------------------------------
-- Average transaction value per month
--Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    EXTRACT(YEAR FROM t.changed) as year,
    EXTRACT(MONTH FROM t.changed) as month,
    EXTRACT('week' from t.changed) as week,
    avg(t.quantity) as average_quantity
FROM
    trans t
GROUP BY
    year, month, week
ORDER BY 
    year, month;
