----------------------------------------------------------------------
-- Members with most trades
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    ta.name,
    count(t)
FROM
    account ta
JOIN
    trans t
ON
    ta.id = t.toaccount_id
GROUP BY
    ta.name
UNION
SELECT
    fa.name,
    count(t)
FROM
    account fa
JOIN
    trans t
ON
    t.fraccount_id = fa.id
GROUP BY
    fa.name
ORDER BY
    count DESC
LIMIT
    100;
