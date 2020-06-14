<?php
include_once "./connection.php";

$sql = "SELECT * FROM products";
$result = $conn->query($sql);

$res = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($res, JSON_UNESCAPED_UNICODE);

$conn->close();
