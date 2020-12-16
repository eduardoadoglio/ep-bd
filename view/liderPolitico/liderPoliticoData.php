<?php 
session_start();
include("../../template/header.php");
include("../../template/menu.php");
if(isset($_SESSION['liderPolitico'])){
    $liderPolitico = $_SESSION['liderPolitico'];
}else{
    header('Location: ../../view/liderPolitico/liderPolitico.php');
}
?>
<body>
    <div class="container-fluid table-content">
        <div class="row">
            <div class="col-md-12">
                <h1>Líder político criado</h1>
                <table class="table-data">
                    <thead>
                        <tr>
                            <?php
                                foreach($liderPolitico as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($liderPolitico as $key => $value){
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