<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);

include_once "./connection.php";

$customer_card_id = $_POST["card_id"];
// $sql = "
// CREATE TEMPORARY TABLE customers_trans AS (
//     SELECT
//         transaction_id
//     FROM
//         purchase
//     WHERE
//         card_id = ?
//     );
// CREATE TEMPORARY TABLE bought_products AS (
//     SELECT
//         *
//     FROM
//         contains NATURAL
//         JOIN customers_trans NATURAL
//         JOIN products
//     );
// SELECT
//     product_id,
//     product_name,
//     category,
//     COUNT(*) as number_of_times
// FROM
//     bought_products
// GROUP BY
//     product_idτην
// ORDER BY
//     number_of_times DESC
// LIMIT
//     10;
// ";
$sql = "
SELECT * FROM `most_frequent_products_by_id` where card_id = ? ORDER by cnt desc limit 10
";


$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $customer_card_id);
$stmt->execute();
$res = $stmt->get_result();
$result = $res->fetch_all(MYSQLI_ASSOC);

echo json_encode($result, JSON_UNESCAPED_UNICODE);
