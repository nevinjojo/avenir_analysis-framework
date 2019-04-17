----------------------------------------------------------------------
-- Most Active members in term of login and actions
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    a.username as username,
    count(a.action) as action_count,
    to_char(avg(l.last-l.start), 'HH24:MI:SS') as avg_session
FROM
    login l
JOIN
    audit a
ON
    l.username = a.username
GROUP BY
    a.username
ORDER BY
    action_count DESC,
    avg_session DESC;
