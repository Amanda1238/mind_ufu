<?php
include('db.php');
$id = $_POST['id'];
$tit = $_POST['titulo'];
$cont = $_POST['conteudo'];
$stmt = $conn->prepare("UPDATE paginas SET titulo = ?, conteudo = ? WHERE id = ?");
$stmt->bind_param("ssi", $tit, $cont, $id);
echo $stmt->execute() ? "Sucesso" : "Erro";
?>