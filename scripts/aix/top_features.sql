----------------------------------------------------------------------
-- Top (features) among members over time
-- Author: Nevin Jojo
----------------------------------------------------------------------

SELECT
    au.detail, count(au.detail) as details_count, au.action
FROM
    audit au
JOIN
    users u
ON
    au.userid = u.id
-- id id = 1 (system), then exclude the data
WHERE
    u.id <> 1
AND
    detail LIKE '%/en_GB/%'
GROUP BY
    au.detail, au.action
ORDER BY
    details_count DESC
LIMIT
    150;
