<?php
session_start();
if(isset($_POST['divisaoName'])){
    require_once('../../model/Divisao.php');
    $divisaoObj = new Divisao();
    $id = $divisaoObj->createDivisao($_POST['divisaoName']);
    $divisao = $divisaoObj->getDivisaoById($id);
    $_SESSION['divisao'] = $divisao;
    header('Location: ../../view/divisao/divisaoData.php');
}else{
    header('Location: ../../view/divisao/divisao.php');
}


?>