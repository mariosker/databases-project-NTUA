<?php
include_once "./connection.php";

$card_id = $_POST["card_id"];

$sql = "DELETE FROM `store` WHERE `store_id`=?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("i", $card_id);
$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Customer Deleted"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
