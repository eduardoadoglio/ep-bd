<?php

require_once('Database.php');

class ConflitoBelico {

    private $database;

    public function __construct(){
        $this->database = new Database();
    }

    public function createConflitoBelico($name, $tipo, $info){
        $this->database->executeQuery("INSERT INTO conflito (nummortos, numferidos, nome) VALUES (0, 0, :name)", array(
            ":name" => $name
        ));
        $id = $this->database->getLastInsertId();
        switch($tipo){
            case 'economico':
                return $this->createConflitoEconomico($id, $info);
            break;
            case 'religioso':
                return $this->createConflitoReligioso($id, $info);
            break;
            case 'territorial':
                return $this->createConflitoTerritorial($id, $info);
            break;
            case 'racial':
                return $this->createConflitoRacial($id, $info);
            break;
        }
    }

    public function createConflitoEconomico($id, $matprima) {
        $this->database->executeQuery("INSERT INTO economico (codigo, matprima) VALUES (:id, :matprima)", array(
            ":id" => $id,
            ":matprima" => $matprima
        ));
        return $id;
    }
    public function createConflitoReligioso($id, $religiao) {
        $this->database->executeQuery("INSERT INTO religioso (codigo, religiao) VALUES (:id, :religiao)", array(
            ":id" => $id,
            ":religiao" => $religiao
        ));
        return $id;
    }
    public function createConflitoTerritorial($id, $regiao) {
        $this->database->executeQuery("INSERT INTO territorial (codigo, regiao) VALUES (:id, :regiao)", array(
            ":id" => $id,
            ":regiao" => $regiao
        ));
        return $id;
    }
    public function createConflitoRacial($id, $etnia) {
        $this->database->executeQuery("INSERT INTO racial (codigo, etnia) VALUES (:id, :etnia)", array(
            ":id" => $id,
            ":etnia" => $etnia
        ));
        return $id;
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