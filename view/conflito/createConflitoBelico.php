<?php 
    include("../../template/header.php");
    include("../../template/menu.php");    
?>
<body>
    <div class="container-fluid full-page-form">
        <div class="row justify-content-center">
            <div class="col-md-12 form">
                <div class="form-content">
                    <h1>Criação de conflito</h1>
                    <form action="../../action/conflito/createConflitoBelico.php" method="POST">
                        Nome do conflito: <br>
                        <input type="text" name="conflitoName"> <br>
                        <input type="submit" value="Enviar">
                    </form>    
                </div>
            </div>
        </div>
    </div>
</body>
</html>