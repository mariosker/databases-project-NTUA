<?php
include_once "./connection.php";

$store_id = $_POST["store_id"];
$store_area = $_POST["store_area"];
$operating_hours = $_POST["operating_hours"];
$street = $_POST["street"];
$number = $_POST["number"];
$zip = $_POST["zip"];
$city = $_POST["city"];

$sql = "UPDATE `store` SET `store_area`=?,`operating_hours`=?,`street`=?,`number`=?,`zip`=?,`city`=? WHERE `store_id`=?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("isssisi", $store_area, $operating_hours, $street, $number, $zip, $city, $store_id);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Store Edited"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
