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
                    <h1>Criação de divisão</h1>
                    <form action="../../action/divisao/createDivisao.php" method="POST">
                    Grupo militar:
                    <select name="grupoMilitarId" required>
                    <option value="" selected disabled required>Selecione um grupo militar</option>
                        <?php
                            foreach($gruposMilitares as $grupo){
                                echo '<option value="'.$grupo['codigog'].'">'.$grupo['nomegrupo'].'</option>';
                            }
                        ?>
                    </select>
                    N° de barcos: <br>
                    <input type="number" name="barcos" placeholder="Digite o número de barcos"> <br>
                    N° de aviões: <br>
                    <input type="number" name="avioes" placeholder="Digite o número de aviões"> <br>
                    N° de tanques: <br>
                    <input type="number" name="tanques" placeholder="Digite o número de tanques"> <br>
                    N° de homens: <br>
                    <input type="number" name="homens" placeholder="Digite o número de homens"> <br>
                    <input type="submit" value="Enviar">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>