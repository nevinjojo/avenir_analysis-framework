----------------------------------------------------------------------
-- Most active users in an org based on audit detail count
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    *,
    row_number() over(PARTITION BY org ORDER BY audit_count) as row_num
FROM
    (SELECT
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
        audit_count DESC
    ) o
;
