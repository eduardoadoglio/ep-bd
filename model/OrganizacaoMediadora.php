<?php

require_once('Database.php');

class OrganizacaoMediadora {

    private $database;

    public function __construct(){
        $this->database = new Database();
    }

    public function getOrganizacoesOrderdByNumbers(){
        $response = $this->database->executeQuery('SELECT NomeOrg as "Nome da organização", OrganizacaoM.CodigoOrg as "Código da organização", resultado6.confNumber as "Número de conflitos" FROM (SELECT * FROM (SELECT CodigoOrgE AS CodigoOrg, (counte - counts) AS ConfNumber FROM (SELECT * FROM ((SELECT CodigoOrg AS CodigoOrgE, COUNT(*) AS counte FROM DEMedia GROUP BY (CodigoOrg)) AS resultado1 JOIN (SELECT CodigoOrg AS CodigoOrgS, COUNT(*) AS counts FROM DSMedia GROUP BY (CodigoOrg) ) AS resultado2 ON resultado1.CodigoOrgE = resultado2.CodigoOrgS) AS resultado3) AS resultado4) AS resultado5 ORDER BY resultado5.confnumber DESC LIMIT 5) AS resultado6 JOIN OrganizacaoM ON resultado6.CodigoOrg = OrganizacaoM.CodigoOrg;');
        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>