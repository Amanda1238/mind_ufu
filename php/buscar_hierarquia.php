<?php
include('db.php');
$hierarquia = [];
$res_disc = $conn->query("SELECT * FROM disciplinas ORDER BY nome ASC");
while($disc = $res_disc->fetch_assoc()) {
    $disc['pastas'] = [];
    $res_pastas = $conn->query("SELECT * FROM pastas WHERE disciplina_id = " . $disc['id']);
    while($pasta = $res_pastas->fetch_assoc()) {
        $pasta['paginas'] = [];
        $res_pags = $conn->query("SELECT id, titulo FROM paginas WHERE pasta_id = " . $pasta['id']);
        while($pag = $res_pags->fetch_assoc()) { $pasta['paginas'][] = $pag; }
        $disc['pastas'][] = $pasta;
    }
    $hierarquia[] = $disc;
}
echo json_encode($hierarquia);
?>