<?php 
session_start();
// include("../../template/header.php");
if(isset($_SESSION['conflito'])){
    $conflito = $_SESSION['conflito'];
}else{
    header('Location: ../../view/conflito/conflitosBelicos.php');
}
?>
<body>
    <table>
        <tbody>
            <tr>
                <?php
                    foreach($conflito as $key => $value){
                        echo '<th>'.$key.'</th>';
                    }
                ?>
            </tr>
                <?php
                    foreach($conflito as $key => $value){
                        echo '<td>'.$value.'</td>';
                    }
                ?>
            </tr>
        </tbody>
    </table>
</body>
<?php
// include("../../template/footer.php"); 
?>
</html>