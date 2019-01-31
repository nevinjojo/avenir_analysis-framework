SELECT
    a.name, a.owner_id, count(t), au.detail
FROM
    account a
JOIN
    trans t
ON
    t.toaccount_id = a.id
JOIN
    audit au
ON
    au.orgid = a.owner_id
WHERE
    au.detail LIKE '%/org%'
GROUP BY
    a.name, au.detail, a.owner_id
ORDER BY
    count(t) DESC;
