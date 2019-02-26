SELECT
    u.username, count(a.action)
FROM
    users u
JOIN
    audit a
ON
    a.userid = u.id
WHERE
    u.id <> 1
GROUP BY
    u.username
ORDER BY
    count DESC;
