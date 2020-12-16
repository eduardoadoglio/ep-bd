<?php 
session_start();
include("../../template/header.php");
include("../../template/menu.php");
if(isset($_SESSION['divisao'])){
    $divisao = $_SESSION['divisao'];
}else{
    header('Location: ../../view/divisao/divisao.php');
}
?>
<body>
    <div class="container-fluid table-content">
        <div class="row">
            <div class="col-md-12">
                <h1>Divisão criada</h1>
                <table class="table-data">
                    <thead>
                        <tr>
                            <?php
                                foreach($divisao as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($divisao as $key => $value){
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