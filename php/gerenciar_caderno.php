<?php
include('db.php');
$acao = $_POST['acao'] ?? '';

if ($acao == 'criar_disciplina') {
    $nome = $_POST['nome'];
    $sql = "INSERT INTO disciplinas (nome) VALUES ('$nome')";
    echo $conn->query($sql) ? "Sucesso" : "Erro";
}

if ($acao == 'criar_pasta') {
    $disc_id = $_POST['disciplina_id'];
    $nome = $_POST['nome'];
    $sql = "INSERT INTO pastas (disciplina_id, nome) VALUES ($disc_id, '$nome')";
    echo $conn->query($sql) ? "Sucesso" : "Erro";
}

if ($acao == 'salvar_pagina') {
    $id = $_POST['id'];
    $titulo = addslashes($_POST['titulo']);
    $conteudo = addslashes($_POST['conteudo']);
    $sql = "UPDATE paginas SET titulo = '$titulo', conteudo = '$conteudo' WHERE id = $id";
    echo $conn->query($sql) ? "Sucesso" : "Erro";
}
?>