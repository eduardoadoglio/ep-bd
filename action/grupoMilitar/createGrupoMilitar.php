<?php
session_start();
if(isset($_POST['grupoMilitarName'])){
    require_once('../../model/GrupoMilitar.php');
    $grupoMilitarObj = new GrupoMilitar();
    $id = $grupoMilitarObj->createGrupoMilitar($_POST['grupoMilitarName']);
    $grupoMilitar = $grupoMilitarObj->getGrupoMilitarById($id);
    $_SESSION['grupoMilitar'] = $grupoMilitar;
    header('Location: ../../view/grupoMilitar/grupoMilitarData.php');
}else{
    header('Location: ../../view/grupoMilitar/grupoMilitar.php');
}


?>