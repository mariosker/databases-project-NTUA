<?php
include_once "./connection.php";

$store_id = $_POST["id"];

$sql = "DELETE FROM `store` WHERE `store_id`=?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("i", $store_id);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Store Deleted"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
