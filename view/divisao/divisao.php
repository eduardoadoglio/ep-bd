<?php 
    include("../../template/header.php");
    include("../../template/menu.php");
    require_once("../../model/Divisao.php");
    $divisao = new Divisao();
    $divisoes = $divisao->getAllDivisoes();
?>
<body>
    <?php
        if(count($divisoes) > 0):
    ?>
    <div class="container-fluid table-content">
        <div class="row">
            <div class="col-md-12">
                <h1>Todas as divisões</h1>
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
    <?php
        else:
    ?>
    <div class="container-fluid table-content">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Não há nenhuma divisão criada</h1>
                    <a href="createDivisao.php">
                        <button class="default-button">Criar uma?</button>
                    </a>  
            </div>
        </div>
    </div>
    <?php
        endif;
    ?>
</body>
</html>