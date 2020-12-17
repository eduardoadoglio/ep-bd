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
        return $this->database->getLastInsertId();
    }

    public function updateConflitoBelico($name){
        
    }

    public function deleteConflitoBelico($name){

    }

    public function getConflitoBelicoById($id){
        $response = $this->database->executeQuery("SELECT * FROM conflito WHERE codigo = :id", array(
            ":id" => $id
        ));
        return $response->fetch(PDO::FETCH_ASSOC);
    }

    public function getConflitoBelicoOrderdByDeaths(){
        $response = $this->database->executeQuery("SELECT Nome, NumMortos FROM Conflito ORDER BY (NumMortos) DESC LIMIT 5;");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllConflitosBelicos($name){
        
    }

}

?>