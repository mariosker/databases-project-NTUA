<?php
include_once "./connection.php";

$store_area = $_POST["store_area"];
$operating_hours = $_POST["operating_hours"];
$street = $_POST["street"];
$number = $_POST["number"];
$zip = $_POST["zip"];
$city = $_POST["city"];

$sql = "INSERT INTO `store`(`store_area`, `operating_hours`, `street`, `number`, `zip`, `city`) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);

$stmt->bind_param("isssis", $store_area, $operating_hours, $street, $number, $zip, $city);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Store Added"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
