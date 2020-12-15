<?php


require_once('Database.php');

class LiderPolitico {
    
    private $database;

    public function __construct(){
        $this->database = new Database();
    }
    
    function createLiderPolitico($nome, $codigog, $apoios){
        $this->database->executeQuery("INSERT INTO liderpolitico (nomel, codigog, apoios) VALUES (:nomel, :codigog, :apoios)", array(
            ":nomel" => $nome,
            ":codigog" => $codigog,
            ":apoios" => $apoios
        ));
        return true;
    }

    function updateLiderPolitico($name){

    }

    function deleteLiderPolitico($name){

    }

    function getLiderPoliticoById($codigog, $nomel){
        $response = $this->database->executeQuery("SELECT * FROM liderpolitico WHERE codigog = :codigog AND nomel = :nomel", array(
            ":codigog" => $codigog,
            ":nomel" => $nomel
        ));
        return $response->fetch(PDO::FETCH_ASSOC);
    }

    function getLiderPoliticoByGrupoMilitarId($codigog){
        $response = $this->database->executeQuery("SELECT * FROM liderpolitico WHERE codigog = :codigog;", array(
            ":codigog" => $codigog
        ));
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    function getAllLideresPoliticos(){
        $response = $this->database->executeQuery("SELECT * FROM liderpolitico;", array());
        return $response->fetch(PDO::FETCH_ASSOC);
    }

}

?>