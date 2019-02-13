----------------------------------------------------------------------
-- Members (other than System) with most actions (detail)
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    u.id, u.username, count(au.detail), au.detail
FROM
    users u
JOIN
    audit au
ON
    au.userid = u.id
-- if id id = 1 (system), then exclude the data
WHERE
    u.id <> 1
GROUP BY
    u.id, au.detail
ORDER BY
    count(au.detail) DESC;
