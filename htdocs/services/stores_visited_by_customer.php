<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once "./connection.php";

$customer_card_id = $_POST["card_id"];
$sql = "
CREATE TEMPORARY TABLE stores_visited (SELECT store_id FROM `customer` NATURAL JOIN `purchase` WHERE `card_id` = ?);
SELECT DISTINCT * FROM `stores_visited` NATURAL JOIN `store`
";


$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $customer_card_id);
$stmt->execute();
$res = $stmt->get_result();
$res = $result->fetch_assoc();
echo json_encode($res, JSON_UNESCAPED_UNICODE);
