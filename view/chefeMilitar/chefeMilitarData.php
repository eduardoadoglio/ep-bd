<?php 
session_start();
// include("../../template/header.php");
if(isset($_SESSION['chefeMilitar'])){
    $chefeMilitar = $_SESSION['chefeMilitar'];
}else{
    header('Location: ../../view/chefeMilitar/chefeMilitar.php');
}
?>
<body>
    <table>
        <tbody>
            <tr>
                <?php
                    foreach($chefeMilitar as $key => $value){
                        echo '<th>'.$key.'</th>';
                    }
                ?>
            </tr>
                <?php
                    foreach($chefeMilitar as $key => $value){
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