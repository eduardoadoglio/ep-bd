<?php


require_once('Database.php');

class GrupoMilitar {
    
    private $database;

    public function __construct(){
        $this->database = new Database();
    }
    
    function createGrupoMilitar($name){
        $this->database->executeQuery("INSERT INTO grupoarmado (nomegrupo, numbaixasG) VALUES (:name, 0)", array(
            ":name" => $name
        ));
        return $this->database->getLastInsertId();
    }

    function updateGrupoMilitar($name){

    }

    function deleteGrupoMilitar($name){

    }

    function getGrupoMilitarById($id){
        $response = $this->database->executeQuery("SELECT * FROM grupoarmado WHERE codigog = :id", array(
            ":id" => $id
        ));
        return $response->fetch(PDO::FETCH_ASSOC);
    }

    function getAllGruposMilitares(){
        $response = $this->database->executeQuery("SELECT * FROM grupoarmado;");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>