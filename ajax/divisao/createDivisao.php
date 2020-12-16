<?php
session_start();
if(isset($_REQUEST['grupoMilitarId'])){
    require_once('../../model/Divisao.php');
    $divisaoObj = new Divisao();
    $barcos = isset($_REQUEST["barcos"]) ? $_REQUEST["barcos"] : 0; 
    $avioes = isset($_REQUEST["avioes"]) ? $_REQUEST["avioes"] : 0; 
    $tanques = isset($_REQUEST["tanques"]) ? $_REQUEST["tanques"] : 0; 
    $homens = isset($_REQUEST["homens"]) ? $_REQUEST["homens"] : 0; 
    $id = $divisaoObj->createDivisao($_REQUEST['grupoMilitarId'], $barcos, $avioes, $tanques, $homens);
    $divisao = $divisaoObj->getDivisaoById($_REQUEST['grupoMilitarId'], $id);
    echo json_encode($divisao);
}


?>