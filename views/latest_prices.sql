CREATE VIEW latest_prices AS(
    SELECT
        n.has_id,
        n.value AS price,
        n.date
    FROM
        (
        SELECT
            has_id,
            MAX(DATE) AS maxdate
        FROM
            price_log
        GROUP BY
            has_id
    ) AS X
INNER JOIN price_log AS n
ON
    n.has_id = X.has_id AND n.date = X.maxdate
)
