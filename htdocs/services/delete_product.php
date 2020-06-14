<?php
include_once "./connection.php";

$product_id = $_POST["product_id"];

$sql = "DELETE FROM `products` WHERE `product_id`=?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("i", $product_id);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Product Deleted"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
