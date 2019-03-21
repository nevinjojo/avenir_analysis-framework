----------------------------------------------------------------------
-- Ledger
-- Author: Nevin Jojo
----------------------------------------------------------------------
SELECT
    id,
    total,
    free,
    date,
    account_id,
    instrument_id,
    rank() over (partition by account_id,instrument_id order by id desc)
FROM
    ledger
WHERE
    date < '2018-12-31'
AND
    account_id >= 32;
