<?php
session_start();
if(isset($_POST['grupoMilitarId'])){
    $barcos = isset($_POST["barcos"]) ? $_POST["barcos"] : 0; 
    $avioes = isset($_POST["avioes"]) ? $_POST["avioes"] : 0; 
    $tanques = isset($_POST["tanques"]) ? $_POST["tanques"] : 0; 
    $homens = isset($_POST["homens"]) ? $_POST["homens"] : 0; 
    require_once('../../model/Divisao.php');
    $divisaoObj = new Divisao();
    $id = $divisaoObj->createDivisao($_POST['grupoMilitarId'], $barcos, $avioes, $tanques, $homens);
    $divisao = $divisaoObj->getDivisaoById($_POST['grupoMilitarId'], $id);
    $_SESSION['divisao'] = $divisao;
    header('Location: ../../view/divisao/divisaoData.php');
}else{
    header('Location: ../../view/divisao/divisao.php');
}


?>