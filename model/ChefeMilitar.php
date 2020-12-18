<?php


require_once('Database.php');

class ChefeMilitar {
    
    private $database;

    public function __construct(){
        $this->database = new Database();
    }
    
    function createChefeMilitar($faixa, $nrodivisao, $codigog, $nomel){

        try {
            $this->database->executeQuery("INSERT INTO chefemilitar (faixa, nrodivisao, codigog, nomel) VALUES (:faixa, :nrodivisao, :codigog, :nomel)", array(
                ":faixa" => $faixa,
                ":nrodivisao" => $nrodivisao,
                ":codigog" => $codigog,
                ":nomel" => $nomel,
            ));
            return $this->database->getLastInsertId();
        } catch(Exception $e){
            if($e->getCode() == "P0001"){
                return "Uma divisão só pode ter 3 chefes militares";
            }else{
                return $e->getMessage();
            }
        }
    }

    function updateChefeMilitar($name){

    }

    function deleteChefeMilitar($name){

    }

    function getChefeMilitarById($id){
        $response = $this->database->executeQuery("SELECT * FROM chefemilitar WHERE codigochef = :id", array(
            ":id" => $id
        ));
        return $response->fetch(PDO::FETCH_ASSOC);
    }

    function getAllChefeMilitar(){
        $response = $this->database->executeQuery("SELECT * FROM chefemilitar");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    function getAllChefesMilitares(){

    }

}

?>