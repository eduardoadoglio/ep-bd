<?php
include("../../template/header.php");

require_once('../../model/GrupoMilitar.php');

$grupoMilitarObj = new GrupoMilitar();

$gruposMilitares = $grupoMilitarObj->getAllGruposMilitares();

?>
<body>
    <form action="../../action/liderPolitico/createLiderPolitico.php" method="POST">
        Nome: <br>
        <input type="text" name="liderPoliticoName" required> <br>
        Apoios: <br>
        <input type="text" name="liderPoliticoApoios" required> <br>
        Grupo que lidera: <br>
        <select name="grupoMilitarId"> 
        <option value="" selected>Selecione um grupo militar</option>
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