SELECT DISTINCT 
    u.username, a.action, count(a)
FROM 
    audit a
JOIN
    users u ON u.id = a.userid
GROUP BY
    a.userid, u.username, a.action
ORDER BY
    count DESC
LIMIT
    25;
