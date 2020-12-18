<?php
session_start();
if(isset($_POST['grupoMilitarId']) && isset($_POST['divisaoId']) && isset($_POST['liderPoliticoName']) && isset($_POST['chefeMilitarFaixa'])){
    require_once('../../model/ChefeMilitar.php');
    $chefeMilitarObj = new ChefeMilitar();
    $id = $chefeMilitarObj->createChefeMilitar($_POST['chefeMilitarFaixa'], $_POST['divisaoId'], $_POST['grupoMilitarId'], $_POST['liderPoliticoName']);
    if(!is_string($id)){
	    $chefeMilitar = $chefeMilitarObj->getChefeMilitarById($id);
	    $_SESSION['chefeMilitar'] = $chefeMilitar;
    } else {
		$_SESSION['chefeMilitar'] = $id;
    }

    header('Location: ../../view/chefeMilitar/chefeMilitarData.php');
} else{
    header('Location: ../../view/chefeMilitar/chefeMilitar.php');
}

?>