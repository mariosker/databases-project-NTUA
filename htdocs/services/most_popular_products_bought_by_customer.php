<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once "./connection.php";

$customer_card_id = $_POST["card_id"];
$sql = "
CREATE TEMPORARY TABLE customers_trans AS (
    SELECT
        transaction_id
    FROM
        purchase
    WHERE
        card_id = 25
    );
CREATE TEMPORARY TABLE bought_products AS (
    SELECT
        *
    FROM
        contains NATURAL
        JOIN customers_trans NATURAL
        JOIN products
    );
SELECT
    product_id,
    product_name,
    category,
    COUNT(*) as number_of_times
FROM
    bought_products
GROUP BY
    product_id
ORDER BY
    number_of_times DESC
LIMIT
    10
";


$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $customer_card_id);
$stmt->execute();
$res = $stmt->get_result();
$res = $result->fetch_assoc();
echo json_encode($res, JSON_UNESCAPED_UNICODE);
