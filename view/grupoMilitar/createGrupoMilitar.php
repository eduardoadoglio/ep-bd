<?php include("../../template/header.php"); ?>
<body>
    <form action="../../action/grupoMilitar/createGrupoMilitar.php" method="POST">
        lansa o grupo militar <br>
        Nome: <br>
        <input type="text" name="grupoMilitarName"> <br>
        <input type="submit" value="Enviar">
    </form>
</body>
<?php include("../../template/footer.php"); ?>
</html>