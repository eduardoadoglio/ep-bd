<?php
require_once('../../model/Divisao.php');
$divisaoObj = new Divisao();
$liderPoliticoName = $_REQUEST['liderPoliticoName'];

$divisao = $divisaoObj->getDivisoesByLiderPoliticoName($liderPoliticoName);

echo json_encode($divisao);


?>