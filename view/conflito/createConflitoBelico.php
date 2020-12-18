<?php 
    include("../../template/header.php");
    include("../../template/menu.php");    
?>
<script src="../../assets/js/script.js"></script>
<body>
    <div class="container-fluid full-page-form">
        <div class="row justify-content-center">
            <div class="col-md-12 form">
                <div class="form-content">
                    <h1>Criação de conflito</h1>
                    <form action="../../action/conflito/createConflitoBelico.php" method="POST">
                        Nome do conflito: <br>
                        <input type="text" name="conflitoName"> <br>
                        Tipo do conflito: <br>
                        <select name="type" id="conflito-select">
                            <option value="" disabled selected> -- </option>
                            <option value="economico"> Econômico </option>
                            <option value="territorial"> Territorial </option>
                            <option value="racial"> Racial </option>
                            <option value="religioso"> Religioso </option>
                        </select>
                        <input type="submit" value="Enviar">
                    </form>    
                </div>
            </div>
        </div>
    </div>
</body>
</html>