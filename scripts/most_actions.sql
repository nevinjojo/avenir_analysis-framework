SELECT
    u.username, a.action, count(a.action)
FROM
    users u
JOIN
    audit a
ON
    a.userid = u.id
GROUP BY
    u.username, a.action, u.id
ORDER BY
    count DESC;
