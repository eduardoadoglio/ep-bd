<?php 
session_start();
// include("../../template/header.php");
if(isset($_SESSION['divisao'])){
    $divisao = $_SESSION['divisao'];
}else{
    header('Location: ../../view/divisao/divisao.php');
}
?>
<body>
    <table>
        <tbody>
            <tr>
                <?php
                    foreach($divisao as $key => $value){
                        echo '<th>'.$key.'</th>';
                    }
                ?>
            </tr>
                <?php
                    foreach($divisao as $key => $value){
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