SELECT
    a.action, count(a.action)
FROM
    users u 
JOIN
    audit a
ON
    a.userid = u.id
WHERE
    u.id <> 1
GROUP BY
    a.action
ORDER BY
    count DESC;
