<?php
include('db.php'); 

$sql = "SELECT titulo, conteudo FROM anotacoes WHERE id = 1";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    echo json_encode($result->fetch_assoc());
} else {
    echo json_encode([
        "titulo" => "Título da Nota",
        "conteudo" => "Escreva aqui suas anotações..."
    ]);
}
$conn->close();
?>