<?php 
    include("../../template/header.php");
    include("../../template/menu.php");    
?>
<body>
    <div class="container-fluid full-page-form">
        <div class="row justify-content-center">
            <div class="col-md-12 form">
                <div class="form-content">
                    <h1>Criação de grupo militar</h1>
                    <form action="../../action/grupoMilitar/createGrupoMilitar.php" method="POST">
                        Nome do grupo militar: <br>
                        <input type="text" name="grupoMilitarName"> <br>
                        <input type="submit" value="Enviar">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>