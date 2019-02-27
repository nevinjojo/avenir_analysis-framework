----------------------------------------------------------------------
-- Top (features) among members over time
--
-- Author: Nevin Jojo
----------------------------------------------------------------------

SELECT
    au.detail as detail,      
    -- Top Features in each year
    count(CASE WHEN au.changed BETWEEN '2017-01-01' AND '2017-12-31' THEN au.detail END) as twenty17,
    count(CASE WHEN au.changed BETWEEN '2018-01-01' AND '2018-12-31' THEN au.detail END) as twenty18,
    count(CASE WHEN au.changed BETWEEN '2019-01-01' AND '2019-12-31' THEN au.detail END) as twenty19
FROM
    audit au
JOIN
    users u
ON
    au.userid = u.id
AND
    detail LIKE '%/en_GB/%'
--id id = 1 (system), then exclude the data
AND
    u.id <> 1
GROUP BY
    detail
ORDER BY
    twenty17 DESC,
    twenty18 DESC,
    twenty19 DESC
LIMIT
    50;
