----------------------------------------------------------------------
-- Top actions (features) among members
-- Author: Nevin Jojo
----------------------------------------------------------------------

SELECT
    u.id, u.username, count(au), au.detail
FROM
    users u
JOIN
    audit au
ON
    au.userid = u.id
-- id id = 1 (system), then exclude the data
WHERE
    u.id <> 1
GROUP BY
    u.id, au.detail
ORDER BY
    count(au) DESC;
