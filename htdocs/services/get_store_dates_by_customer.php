<?php
include_once "./connection.php";

$customer_card_id = $_POST["card_id"];

$sql = "
SELECT * FROM transactions_with_customers WHERE card_id = ?
";


$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $customer_card_id);
$stmt->execute();
$res = $stmt->get_result();
$result = $res->fetch_all(MYSQLI_ASSOC);

echo json_encode($result, JSON_UNESCAPED_UNICODE);
