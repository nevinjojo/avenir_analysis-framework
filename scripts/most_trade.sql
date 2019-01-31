----------------------------------------------------------------------
-- Memebers with most trades 
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    u.username, u.id, count(t)
FROM
    users u
JOIN
    trade t
ON
    u.id = t.sellaccount_id
GROUP BY
    u.username, u.id
ORDER BY
    count DESC;
