<?php
include_once "./connection.php";

$sql = '
SELECT * FROM transactions WHERE 1
';

if (isset($_GET["filtertransactioninstore"]) and $_GET["filtertransactioninstore"] != "")
    $sql = $sql . "and store_id = " . $_GET["filtertransactioninstore"] . " ";

if (isset($_GET["trans_date"]) and $_GET["trans_date"] != "")
    $sql = $sql . "and DATE(date_time) = '" . $_GET["trans_date"] . "' ";

if (isset($_GET["choose_product_category"]) and $_GET["choose_product_category"] != "")
    $sql = $sql . "and transaction_id IN (SELECT transaction_id FROM transactions NATURAL JOIN contains NATURAL JOIN products WHERE category = " . $_GET["choose_product_category"] . ") ";

if (isset($_GET["input_number_of_products"]) and $_GET["input_number_of_products"] != "")
    $sql = $sql . "and transaction_id IN (SELECT transaction_id from contains WHERE quantity_bought < " . $_GET["input_number_of_products"] . ") ";

if (isset($_GET["input_total_cost"]) and $_GET["input_total_cost"] != "")
    $sql = $sql . "and total < " . $_GET["input_total_cost"] . " ";

if (isset($_GET["select_trans_way"]) and $_GET["select_trans_way"] != "")
    $sql = $sql . "and payment_type =  '" . $_GET["select_trans_way"] . "'";

$result = $conn->query($sql);

$res = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($res, JSON_UNESCAPED_UNICODE);

$conn->close();
