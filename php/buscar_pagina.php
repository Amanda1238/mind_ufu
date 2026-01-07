<?php
include('db.php');
$id = $_GET['id'] ?? 0;
$res = $conn->query("SELECT * FROM paginas WHERE id = $id");
echo json_encode($res->fetch_assoc());
?>