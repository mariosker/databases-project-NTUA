<?php
include_once "./connection.php";

$product_name = $_POST["product_name"];
$category = $_POST["category"];
$store_brand = $_POST["store_brand"];

$sql = "INSERT INTO `products`(`store_brand`, `category`, `product_name`) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);

$stmt->bind_param("iss", $store_brand, $category, $product_name);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Product Added"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
