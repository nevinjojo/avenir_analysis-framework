SELECT
    a.name, count(t)
FROM
    account a
JOIN
    trans t
ON
    t.toaccount_id=a.id
GROUP BY
    a.name
ORDER BY
    count DESC;
