<?php

require_once('Database.php');

class Divisao {

    private $database;

    public function __construct(){
        $this->database = new Database();
    }
    
    function createDivisao($id, $barcos, $avioes, $tanques, $homens){
        $this->database->executeQuery("INSERT INTO divisao (codigog, numbaixasd, barcos, avioes, tanques, homens) VALUES (:codigog, 0, :barcos, :avioes, :tanques, :homens)", array(
            ":codigog" => $id,
            ":barcos" => $barcos,
            ":avioes" => $avioes,
            ":tanques" => $tanques,
            ":homens" => $homens
        ));
        return $this->database->getLastInsertId();
    }

    function updateDivisao($name){

    }

    function deleteDivisao($name){

    }

    function getDivisaoById($codigog, $id){
        $response = $this->database->executeQuery("SELECT * FROM divisao WHERE codigog = :codigog AND nrodivisao = :id;", array(
            ":codigog" => $codigog,
            ":id" => $id
        ));
        return $response->fetch(PDO::FETCH_ASSOC);
    }

    function getDivisaoByGrupoMilitarId($codigog){
        $response = $this->database->executeQuery("SELECT * FROM divisao WHERE codigog = :codigog;", array(
            ":codigog" => $codigog
        ));
        return $response->fetch(PDO::FETCH_ASSOC);
    }

    function getDivisoesByLiderPoliticoName($nomel){
        $response = $this->database->executeQuery("SELECT DISTINCT(nrodivisao) FROM divisao JOIN liderpolitico ON divisao.codigog = liderpolitico.codigog WHERE nomel = :nomel;", array(
            ":nomel" => $nomel
        ));
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    function getAllDivisoes(){
        $response = $this->database->executeQuery("SELECT * FROM divisao;", array());
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>