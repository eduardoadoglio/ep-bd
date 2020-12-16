<?php 
    include("../../template/header.php");
    include("../../template/menu.php");
    require_once("../../model/Divisao.php");
    $divisao = new Divisao();
    $divisoes = $divisao->getAllDivisoes();
    // var_dump($divisoes);
    // die;
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
                                foreach($divisoes[0] as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($divisoes as $divisao){
                                    echo '<tr>';
                                    foreach($divisao as $key => $value){
                                        echo '<td>'.$value.'</td>';
                                    }
                                    echo '</tr>';
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