WITH
    topBalances as
    (
    SELECT
        *,
        row_number() over(PARTITION BY month ORDER BY month) as row_num
    FROM
        (
        SELECT
            l1.month as month,
            l1.account_id,
            l1.instrument_id,
            round(l2.free/100000) as free_balance
        FROM
            (SELECT
                max(id) as id,
                to_char(date, 'yyyy-MM') as month,
                account_id,
                instrument_id
            FROM
                ledger
            WHERE
                account_id >= 32
            GROUP BY
                month,
                instrument_id,
                account_id
            ORDER BY
                month) l1
        JOIN
            ledger l2
        ON
            l1.id = l2.id
        ORDER BY
            l1.month,
            l2.free DESC
        ) tb
    )
SELECT
    *
FROM
    topBalances
WHERE
    row_num <= 10;
