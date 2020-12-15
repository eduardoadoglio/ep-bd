<?php
require_once('../../model/Divisao.php');
$divisaoObj = new Divisao();
$grupoMilitarId = $_REQUEST['grupoMilitarId'];

$divisao = $divisaoObj->getDivisaoByGrupoMilitarId($grupoMilitarId);

echo json_encode($divisao);


?>