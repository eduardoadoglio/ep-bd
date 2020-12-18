<?php
session_start();
if(isset($_REQUEST['liderPoliticoName']) && isset($_REQUEST['codigoGrupo']) && isset($_REQUEST['liderPoliticoName'])){
    require_once('../../model/LiderPolitico.php');
    $liderPoliticoObj = new LiderPolitico();
    $liderPoliticoObj->createLiderPolitico($_REQUEST['liderPoliticoName'], $_REQUEST['codigoGrupo'], $_REQUEST['liderPoliticoName']);
    $liderPolitico = $liderPoliticoObj->getLiderPoliticoById($_REQUEST['codigoGrupo'], $_REQUEST['liderPoliticoName']);
    echo json_encode($liderPolitico);
}

?>