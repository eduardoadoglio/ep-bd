<?php 
session_start();
// include("../../template/header.php");
if(isset($_SESSION['grupoMilitar'])){
    $grupoMilitar = $_SESSION['grupoMilitar'];
}else{
    header('Location: ../../view/grupoMilitar/grupoMilitar.php');
}
?>
<body>
    <table>
        <tbody>
            <tr>
                <?php
                    foreach($grupoMilitar as $key => $value){
                        echo '<th>'.$key.'</th>';
                    }
                ?>
            </tr>
                <?php
                    foreach($grupoMilitar as $key => $value){
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