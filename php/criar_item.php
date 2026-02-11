<?php
include('db.php');
$tipo = $_POST['tipo'];
$nome = $_POST['nome'] ?? 'Novo';
$pai_id = $_POST['pai_id'] ?? 0;

if ($tipo == 'disciplina') $sql = "INSERT INTO disciplinas (nome) VALUES ('$nome')";
elseif ($tipo == 'pasta') $sql = "INSERT INTO pastas (disciplina_id, nome) VALUES ($pai_id, '$nome')";
elseif ($tipo == 'pagina') $sql = "INSERT INTO paginas (pasta_id, titulo, conteudo) VALUES ($pai_id, '$nome', '')";

if ($conn->query($sql)) echo ($tipo == 'pagina') ? $conn->insert_id : "Sucesso";
else echo "Erro";
?>