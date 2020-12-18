<?php
session_start();
if(isset($_POST['conflitoName']) && isset($_POST['type']) && isset($_POST['info'])){
    require_once('../../model/ConflitoBelico.php');
    $conflitoBelico = new ConflitoBelico();
    $id = $conflitoBelico->createConflitoBelico($_POST['conflitoName'], $_POST['type'], $_POST['info']);
    $conflito = $conflitoBelico->getConflitoBelicoById($id);
    $_SESSION['conflito'] = $conflito;
    header('Location: ../../view/conflito/conflitoData.php');
}else{
    header('Location: ../../view/conflito/conflitosBelicos.php');
}


?>