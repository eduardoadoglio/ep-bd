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

    public function getAllConflitoBelico(){
        $response = $this->database->executeQuery("SELECT * FROM conflito");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getConflitoBelicoOrderdByDeaths(){
        $response = $this->database->executeQuery("SELECT Nome, NumMortos FROM Conflito ORDER BY (NumMortos) DESC LIMIT 5;");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCountOfConflitos(){
        $response = $this->database->executeQuery("SELECT COUNT(*) FROM conflito;");
        return $response->fetch(PDO::FETCH_ASSOC)['count'];
    }
    public function getCountOfConflitosEconomicos(){
        $response = $this->database->executeQuery("SELECT COUNT(*) FROM economico;");
        return $response->fetch(PDO::FETCH_ASSOC)['count'];
    }

    public function getCountOfConflitosRaciais(){
        $response = $this->database->executeQuery("SELECT COUNT(*) FROM racial;");
        return $response->fetch(PDO::FETCH_ASSOC)['count'];
    }

    public function getCountOfConflitosReligiosos(){
        $response = $this->database->executeQuery("SELECT COUNT(*) FROM religioso;");
        return $response->fetch(PDO::FETCH_ASSOC)['count'];
    }
    

    public function getCountOfConflitosTerritoriais(){
        $response = $this->database->executeQuery("SELECT COUNT(*) FROM territorial;");
        return $response->fetch(PDO::FETCH_ASSOC)['count'];
    }

    public function generateConflitoHistogramArray(){
        return array(
            "Econômicos" => $this->getCountOfConflitosEconomicos(),
            "Raciais" => $this->getCountOfConflitosRaciais(),
            "Religiosos" => $this->getCountOfConflitosReligiosos(),
            "Territoriais" => $this->getCountOfConflitosTerritoriais()
        );
    }

}

?>