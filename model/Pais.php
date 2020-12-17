<?php


require_once('Database.php');

class Pais {
    
    private $database;

    public function __construct(){
        $this->database = new Database();
    }

    function getPaisByReligiousConflict(){
        $response = $this->database->executeQuery("SELECT Pais, COUNT(*) AS numConflitosReligiosos FROM (SELECT Pais.Codigo, Pais FROM (SELECT Conflito.Codigo FROM Religioso JOIN Conflito ON Conflito.Codigo = Religioso.Codigo) AS resultado JOIN Pais ON Pais.Codigo = resultado.Codigo) AS resultado2 GROUP BY Pais ORDER BY COUNT(*);");
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>