<?php
include_once "./connection.php";

$first_name = $_POST["first_name"];
$middle_name = $_POST["middle_name"];
$last_name = $_POST["last_name"];
$street = $_POST["street"];
$number = $_POST["number"];
$zip = $_POST["zip"];
$city = $_POST["city"];
$birth_date = $_POST["birth_date"];
$gender = $_POST["gender"];
$phone_number = $_POST["phone_number"];
$status = $_POST["status"];
$nr_kids = $_POST["nr_kids"];
$points = $_POST["points"];
$card_id = $_POST["card_id"];

$sql = "UPDATE `customer` SET `first_name`=?,`middle_name`=?,`last_name`=?,`street`=?,`number`=?,`zip`=?,`city`=?,`birth_date`=?,`relationship_status`=?,`nr_kids`=?,`gender`=?,`phone_number`=?,`points`=? WHERE `card_id`=?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("sssssisssssiii", $first_name, $middle_name, $last_name, $street, $number, $zip,  $city, $birth_date, $status, $nr_kids, $gender, $phone_number, $points, $card_id);

$result = $stmt->execute();

if ($result)
    echo json_encode(["status" => 1, "successmessage" => "Customer Edited"]);
else
    echo json_encode(["status" => 0, "errormessage" => "SQL error"]);

$conn->close();
