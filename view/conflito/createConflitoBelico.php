<?php 
    include("../../template/header.php");
    include("../../template/menu.php");    
?>
<body>
    <div class="container-fluid full-page-form">
        <div class="row justify-content-center">
            <div class="col-md-12 form">
                <form action="../../action/conflito/createConflitoBelico.php" method="POST">
                    lansa o conflito <br>
                    Nome: <br>
                    <input type="text" name="conflitoName"> <br>
                    <input type="submit" value="Enviar">
                </form>
            </div>
        </div>
    </div>
</body>
<?php //include("../../template/footer.php"); ?>
</html>