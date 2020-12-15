<?php 

include("../../template/header.php");

require_once('../../model/Divisao.php');
require_once('../../model/LiderPolitico.php');
require_once('../../model/GrupoMilitar.php');

$grupoMilitarObj = new GrupoMilitar();
$divisaoObj = new Divisao();
$liderPoliticoObj = new LiderPolitico();

$gruposMilitares = $grupoMilitarObj->getAllGruposMilitares();
$divisoes = $divisaoObj->getAllDivisoes();
$lideresPoliticos = $liderPoliticoObj->getAllLideresPoliticos();

?>

<script src="../../ajax/chefeMilitar/chefeMilitar.js"></script>

<body>
    <form action="../../action/chefeMilitar/createchefeMilitar.php" method="POST">
        lansa o chefe militar <br>
        Faixa: <br>
        <input type="text" name="chefeMilitarFaixa"> <br>
        Selecione um grupo militar <br>
        <select name="grupoMilitarId" id="grupo-militar-select" required>
        <option value="" selected disabled> -- </option>
            <?php
                foreach($gruposMilitares as $grupo){
                    echo '<option value="'.$grupo['codigog'].'">'.$grupo['nomegrupo'].'</option>';
                }
            ?>
        </select> <br>
        <input type="submit" value="Enviar">
    </form>
</body>
<?php include("../../template/footer.php"); ?>
</html>