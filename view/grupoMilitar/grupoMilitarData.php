<?php 
session_start();
include("../../template/header.php");
include("../../template/menu.php");
if(isset($_SESSION['grupoMilitar'])){
    $grupoMilitar = $_SESSION['grupoMilitar'];
}else{
    header('Location: ../../view/grupoMilitar/grupoMilitar.php');
}
?>
<body>
    <div class="container-fluid table-content">
        <div class="row">
            <div class="col-md-12">
                <h1>Grupo militar criado</h1>
                <table class="table-data">
                    <thead>
                        <tr>
                            <?php
                                foreach($grupoMilitar as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($grupoMilitar as $key => $value){
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