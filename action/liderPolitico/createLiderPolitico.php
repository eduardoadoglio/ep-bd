<?php
session_start();
if(isset($_POST['grupoMilitarId'])){
    require_once('../../model/LiderPolitico.php');
    $liderPoliticoObj = new LiderPolitico();
    $liderPoliticoObj->createLiderPolitico($_POST['liderPoliticoName'], $_POST['grupoMilitarId'], $_POST['liderPoliticoApoios']);
    $liderPolitico = $liderPoliticoObj->getLiderPoliticoById($_POST['grupoMilitarId'], $_POST['liderPoliticoName']);
    $_SESSION['liderPolitico'] = $liderPolitico;
    header('Location: ../../view/liderPolitico/liderPoliticoData.php');
}else{
    header('Location: ../../view/liderPolitico/liderPolitico.php');
}


?>