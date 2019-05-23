----------------------------------------------------------------------
-- Most active users in an org
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    o.short as org,
    au.username as user,
    count(au.detail) as audit_count
FROM
    audit au
JOIN
    org o
ON
    o.id = au.orgid
GROUP BY
    org, username
ORDER BY
    org,
    audit_count DESC,
    username
;
