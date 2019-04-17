----------------------------------------------------------------------
-- User login count per year
-- Author: Nevin Jojo
----------------------------------------------------------------------
WITH
    log_count as
    (SELECT
            *,
        row_number() over(PARTITION BY login_time ORDER BY login_time) as row_num
    FROM
        (SELECT
            to_char(start, 'YYYY') as login_time,
            username,
            count(username) as login_count
        FROM
            login
        GROUP BY
            to_char(start, 'YYYY'),
            username
        ORDER BY
            to_char(start, 'YYYY'),
            count(username) DESC
        ) l
    )
SELECT
    login_time,
    username,
    login_count
FROM
    log_count
WHERE
    row_num <= 10;
