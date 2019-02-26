----------------------------------------------------------------------
-- Top (features) among members over time
--
-- Author: Nevin Jojo
----------------------------------------------------------------------

SELECT
    au.detail as detail,      
    --extract(month from au.changed) as month,
    count(CASE WHEN au.changed BETWEEN '2018-10-01' AND '2018-10-31' THEN au.detail END) as oct_count,
    count(CASE WHEN au.changed BETWEEN '2018-11-01' AND '2018-10-30' THEN au.detail END) as nov_count
    --count(au.detail) as nov_count
    
FROM
    audit au
JOIN
    users u
ON
    au.userid = u.id
--WHERE
   -- au.changed  BETWEEN '2018-10-01' AND '2018-10-31'
AND
    detail LIKE '%/en_GB/%'
--id id = 1 (system), then exclude the data
AND
    u.id <> 1
GROUP BY
    detail--, month
ORDER BY
    oct_count,
    nov_count DESC    --count17 DESC;
LIMIT
    25;
