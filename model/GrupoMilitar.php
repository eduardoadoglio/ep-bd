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

    function getGrupoMilitarByGun(){
        $response = $this->database->executeQuery("SELECT GrupoArmado.NomeGrupo, NomeTraf, resultado.nomeArma FROM (SELECT NomeArma, CodigoG, NomeTraf FROM Fornece WHERE NomeArma = 'Barret M82' OR NomeArma = 'M200 intervention') AS resultado JOIN GrupoArmado ON resultado.CodigoG = GrupoArmado.codigoG;");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }
    function getGrupoMilitarByGunNumber(){
        $response = $this->database->executeQuery("SELECT resultado.CodigoG, NomeGrupo,resultado.somaArmas  FROM (SELECT CodigoG, SUM(NumArmas) AS somaArmas FROM Fornece GROUP BY (CodigoG) ORDER BY SUM(NumArmas) DESC LIMIT 5) AS resultado JOIN GrupoArmado ON GrupoArmado.CodigoG = resultado.CodigoG;");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    function getAllGruposMilitares(){
        $response = $this->database->executeQuery("SELECT * FROM grupoarmado;");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>