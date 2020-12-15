<?php
session_start();
if(isset($_POST['conflitoName'])){
    require_once('../../model/ConflitoBelico.php');
    $conflitoBelico = new ConflitoBelico();
    $id = $conflitoBelico->createConflitoBelico($_POST['conflitoName']);
    $conflito = $conflitoBelico->getConflitoBelicoById($id);
    $_SESSION['conflito'] = $conflito;
    header('Location: ../../view/conflito/conflitoData.php');
}else{
    header('Location: ../../view/conflito/conflitosBelicos.php');
}


?>