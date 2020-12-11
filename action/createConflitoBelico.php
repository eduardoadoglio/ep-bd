<?php

require_once('../model/ConflitoBelico.php');

$conflito = new ConflitoBelico();

$conflito->createConflitoBelico($_POST['name']);

header('Location: ../view/conflitosBelicos.php');

?>