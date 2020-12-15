<?php
session_start();
if(isset($_REQUEST['grupoMilitarName'])){
    require_once('../../model/GrupoMilitar.php');
    $grupoMilitarObj = new GrupoMilitar();
    $id = $grupoMilitarObj->createGrupoMilitar($_REQUEST['grupoMilitarName']);
    $grupoMilitar = $grupoMilitarObj->getGrupoMilitarById($id);
    echo json_encode($grupoMilitar);
}

?>