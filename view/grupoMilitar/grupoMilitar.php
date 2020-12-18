<?php 
	include("../../template/header.php");
    include("../../template/menu.php");
    require_once("../../model/GrupoMilitar.php");
    $grupoMilitar = new GrupoMilitar();
    $gruposMilitares = $grupoMilitar->getAllGrupoMilitar();
?>
<body>
    <?php
        if(count($gruposMilitares) > 0):
    ?>
    <div class="container-fluid table-content ">
        <div class="row">
            <div class="col-md-12">
                <h1>Todas os grupos militares</h1>
                <table class="table-data">
                    <thead>
                        <tr>
                            <?php
                                foreach($gruposMilitares[0] as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($gruposMilitares as $grupoMilitar){
                                    echo '<tr>';
                                    foreach($grupoMilitar as $key => $value){
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
                <h1>Não há nenhum grupo militar criado</h1>
                    <a href="createGrupoMilitar.php">
                        <button class="default-button">Criar um?</button>
                    </a>  
            </div>
        </div>
    </div>
    <?php
        endif;
    ?>
</body>
</html>