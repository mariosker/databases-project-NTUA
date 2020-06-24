CREATE VIEW transaction_total_cost AS(
    SELECT
        transaction_id,
        SUM(quantity_bought * price) AS total
    FROM
        (
        SELECT
            *
        FROM
            purchase
        NATURAL JOIN CONTAINS
    ) AS T
JOIN latest_prices WHERE has_id =(
    SELECT
        has_id
    FROM
        has
    WHERE
        product_id = T.product_id AND store_id = T.store_id
)
GROUP BY
    transaction_id
)
