<?php
require_once('../../model/Divisao.php');
$divisaoObj = new Divisao();
$grupoMilitarId = $_REQUEST['grupoMilitarId'];

$divisao = $divisaoObj->getDivisaoByGrupomilitarId($grupoMilitarId);

if(count($divisao) > 0){
    $response = $divisao
}else{
    $response = array(
        'error' => 'Não há nenhuma divisão nesse grupo militar'
    )
}

echo json_encode($divisao);

?>