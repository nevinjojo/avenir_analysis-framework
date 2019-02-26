----------------------------------------------------------------------
-- Top Features per month during the year of 2018
--
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    detail,
    count(CASE WHEN changed BETWEEN '2018-10-01' AND '2018-10-31' THEN detail END) AS oct,
    count(CASE WHEN changed BETWEEN '2018-11-01' AND '2018-11-30' THEN detail END) AS nov,
    count(CASE WHEN changed BETWEEN '2018-12-01' AND '2018-12-31' THEN detail END) AS dec
FROM
    audit
GROUP BY
    detail
ORDER BY
    oct desc,
    nov DESC,
    dec DESC
LIMIT
    25;
