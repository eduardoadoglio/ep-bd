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
                    <h1>Criação de Líder político</h1>
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
                </div>
            </div>
        </div>
    </div>
</body>
</html>