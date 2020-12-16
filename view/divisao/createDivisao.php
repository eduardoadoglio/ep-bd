<?php 
    include("../../template/header.php");
    include("../../template/menu.php");    
    require_once('../../model/GrupoMilitar.php');

    $grupoMilitarObj = new GrupoMilitar();

    $gruposMilitares = $grupoMilitarObj->getAllGruposMilitares();
?>
<body>
    <div class="container-fluid full-page-form">
        <div class="row justify-content-center">
            <div class="col-md-12 form">
                <div class="form-content">
                    <h1>Criação de grupo militar</h1>
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
                        <option value="" selected required>Selecione um grupo militar</option>
                            <?php
                                foreach($gruposMilitares as $grupo){
                                    echo '<option value="'.$grupo['codigog'].'">'.$grupo['nomegrupo'].'</option>';
                                }
                            ?>
                        </select>
                        <input type="submit" value="Enviar">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>