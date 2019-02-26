----------------------------------------------------------------------
-- Average and Total session time per username
-- Author: Nevin Jojo
----------------------------------------------------------------------

SELECT
    username,
    avg(last-start) as average_time,
    sum(last-start) as total_time,
    count(l) as session_count
FROM
    login l
GROUP BY
    username
ORDER BY
    average_time DESC,
    total_time DESC;
