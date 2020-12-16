<?php 
session_start();
include("../../template/header.php");
include("../../template/menu.php");
if(isset($_SESSION['chefeMilitar'])){
    $chefeMilitar = $_SESSION['chefeMilitar'];
}else{
    header('Location: ../../view/chefeMilitar/chefeMilitar.php');
}
?>
<body>
    <div class="container-fluid table-content">
        <div class="row">
            <div class="col-md-12">
                <h1>Chefe militar criado</h1>
                <table class="table-data">
                    <thead>
                        <tr>
                            <?php
                                foreach($chefeMilitar as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($chefeMilitar as $key => $value){
                                    echo '<td>'.$value.'</td>';
                                }
                            ?>
                        </tr>
                    </tbody>
                </table>    
            </div>
        </div>
        
    </div>
</body>
</html>