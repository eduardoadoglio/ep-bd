<?php 
session_start();
// include("../../template/header.php");
if(isset($_SESSION['liderPolitico'])){
    $liderPolitico = $_SESSION['liderPolitico'];
}else{
    header('Location: ../../view/liderPolitico/liderPolitico.php');
}
?>
<body>
    <table>
        <tbody>
            <tr>
                <?php
                    foreach($liderPolitico as $key => $value){
                        echo '<th>'.$key.'</th>';
                    }
                ?>
            </tr>
                <?php
                    foreach($liderPolitico as $key => $value){
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