<?php
session_start();
if(isset($_REQUEST['codigoGrupo'])){
    require_once('../../model/Divisao.php');
    $divisaoObj = new Divisao();
    $barcos = isset($_REQUEST["numBarcos"]) ? $_REQUEST["numBarcos"] : 0; 
    $avioes = isset($_REQUEST["numAvioes"]) ? $_REQUEST["numAvioes"] : 0; 
    $tanques = isset($_REQUEST["numTanques"]) ? $_REQUEST["numTanques"] : 0; 
    $homens = isset($_REQUEST["numHomens"]) ? $_REQUEST["numHomens"] : 0; 
    $id = $divisaoObj->createDivisao($_REQUEST['codigoGrupo'], $barcos, $avioes, $tanques, $homens);
    $divisao = $divisaoObj->getDivisaoById($_REQUEST['codigoGrupo'], $id);
    echo json_encode($divisao);
}


?>