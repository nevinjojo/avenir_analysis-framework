----------------------------------------------------------------------
-- Total Trades per day
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    date,
    sum(quantity) as quantity,
    sum(price) as price
FROM
    trade
GROUP BY
    date;
