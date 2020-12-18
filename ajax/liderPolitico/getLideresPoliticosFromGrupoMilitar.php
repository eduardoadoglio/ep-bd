<?php
require_once('../../model/LiderPolitico.php');
$liderPoliticoObj = new LiderPolitico();
$grupoMilitarId = $_REQUEST['grupoMilitarId'];

$liderPolitico = $liderPoliticoObj->getLiderPoliticoByGrupoMilitarId($grupoMilitarId);

$response = $liderPolitico;

echo json_encode($liderPolitico);

?>