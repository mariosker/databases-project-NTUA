<?php
include_once "./connection.php";

$id = $_POST["id"]; // σωστό, πάμε να δο΄ύμε το query

$sql = "SELECT * FROM customer WHERE card_id = ?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();


$res = $result->fetch_assoc();

echo json_encode($res, JSON_UNESCAPED_UNICODE);

$conn->close();
