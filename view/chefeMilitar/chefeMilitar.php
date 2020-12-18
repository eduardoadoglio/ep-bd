<?php 
	include("../../template/header.php");
    include("../../template/menu.php");
    require_once("../../model/ChefeMilitar.php");
    $chefeMilitar = new ChefeMilitar();
    $chefesMilitares = $chefeMilitar->getAllChefeMilitar();
?>
<body>
    <?php
        if(count($chefesMilitares) > 0):
    ?>
    <div class="container-fluid table-content ">
        <div class="row">
            <div class="col-md-12">
                <h1>Todas os conflitos bélicos</h1>
                <table class="table-data table-list-all">
                    <thead>
                        <tr>
                            <?php
                                foreach($chefesMilitares[0] as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($chefesMilitares as $chefeMilitar){
                                    echo '<tr>';
                                    foreach($chefeMilitar as $key => $value){
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
                <h1>Não há nenhum chefe militar adicionado</h1>
                    <a href="createChefeMilitar.php">
                        <button class="default-button">Adicionar um?</button>
                    </a>  
            </div>
        </div>
    </div>
    <?php
        endif;
    ?>
</body>
<?php include("../../template/footer.php"); ?>
</html>