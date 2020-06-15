-- TIMES WHEN CUSTOMER VISITS STORE
CREATE TEMPORARY TABLE stores_visited (
    SELECT store_id,
        transaction_id
    FROM `customer`
        NATURAL JOIN `purchase`
    WHERE `card_id` = ?
);
CREATE TEMPORARY TABLE transactions (
    SELECT transaction_id
    FROM `stores_visited`
        NATURAL JOIN `store`
    where store_id = ?
);
SELECT date_time
FROM transactions
    NATURAL JOIN transaction;
-- Average per week
select shop_id,
    (
        sum(total) /(WEEK(MAX(date_time)) - WEEK(MIN(date_time)) + 1)
    ) as weekly_avg,
    (
        sum(total) /(
            MONTH(MAX(date_time)) - MONTH(MIN(date_time)) + 1
        )
    ) as mothly_avg,
    sum(
        case
            when MONTH(date_time) = MONTH(NOW()) then total
            else 0
        end
    ) as current_month_total
from transaction
group by shop_id
WHERE YEAR(date_time) = 2016
