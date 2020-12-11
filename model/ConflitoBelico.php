<?php

require_once('Database.php');

class ConflitoBelico {

    private $database;

    public function __construct(){
        $this->database = new Database();
    }

    public function createConflitoBelico($name){
        $this->database->executeQuery("INSERT INTO conflito (nummortos, numferidos, nome) VALUES (0, 0, :name)", array(
            ":name" => $name
        ));
    }

    public function updateConflitoBelico($name){

    }

    public function deleteConflitoBelico($name){

    }

    public function getConflitoBelicoByName($name){

    }

    public function getAllConflitosBelicos($name){
        
    }

}

?>