<?php
include_once "./connection.php";

$sql = '
SELECT store_id, CONCAT(
    street,
    " ",
    number,
    ", ",
    zip,
    " ",
    city
) AS storename FROM store
';
$result = $conn->query($sql);

$res = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($res, JSON_UNESCAPED_UNICODE);

$conn->close();
