<?php 

include("../../template/header.php");

require_once('../../model/GrupoMilitar.php');

$grupoMilitarObj = new GrupoMilitar();

$gruposMilitares = $grupoMilitarObj->getAllGruposMilitares();

?>
<body>
    <form action="../../action/divisao/createDivisao.php" method="POST">
        lansa a divisão <br>
        N° de barcos: <br>
        <input type="number" name="barcos"> <br>
        N° de avioes: <br>
        <input type="number" name="avioes"> <br>
        N° de tanques: <br>
        <input type="number" name="tanques"> <br>
        N° de homens: <br>
        <input type="number" name="homens"> <br>
        <select name="grupoMilitarId">
        <option value="" selected>Selecione um grupo militar</option>
            <?php
                foreach($gruposMilitares as $grupo){
                    echo '<option value="'.$grupo['codigog'].'">'.$grupo['nomegrupo'].'</option>';
                }
            ?>
        </select>
        <input type="submit" value="Enviar">
    </form>
</body>
<?php include("../../template/footer.php"); ?>
</html>