----------------------------------------------------------------------
-- Total Trades per month
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    to_char(date, 'yyyy-MM') as month,
    sum(quantity) as quantity,
    sum(price) as price
FROM
    trade
GROUP BY
    month;
