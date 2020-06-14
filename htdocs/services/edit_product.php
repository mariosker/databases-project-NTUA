<?php
include_once "./connection.php";

$product_id = $_POST["product_id"];
$product_name = $_POST["product_name"];
$category = $_POST["category"];
$store_brand = $_POST["store_brand"];

$sql = "UPDATE `products` SET `store_brand`=?,`category`=?,`product_name`=? WHERE `product_id`= ?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("issi", $store_brand, $category, $product_name, $product_id);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Product Edited"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
