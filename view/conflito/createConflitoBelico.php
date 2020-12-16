<?php include("../../template/header.php"); ?>
<body>
    <form action="../../action/conflito/createConflitoBelico.php" method="POST">
        lansa o conflito <br>
        Nome: <br>
        <input type="text" name="conflitoName"> <br>
        <input type="submit" value="Enviar">
    </form>
</body>
<?php include("../../template/footer.php"); ?>
</html>