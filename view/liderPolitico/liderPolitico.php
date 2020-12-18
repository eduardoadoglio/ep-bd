<?php 
	include("../../template/header.php");
    include("../../template/menu.php");
    require_once("../../model/LiderPolitico.php");
    $liderPolitico = new LiderPolitico();
    $lideresPoliticos = $liderPolitico->getAllLiderPolitico();
?>
<body>
    <?php
        if(count($lideresPoliticos) > 0):
    ?>
    <div class="container-fluid table-content ">
        <div class="row">
            <div class="col-md-12">
                <h1>Todas os conflitos bélicos</h1>
                <table class="table-data table-list-all">
                    <thead>
                        <tr>
                            <?php
                                foreach($lideresPoliticos[0] as $key => $value){
                                    echo '<th>'.$key.'</th>';
                                }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                            <?php
                                foreach($lideresPoliticos as $liderPolitico){
                                    echo '<tr>';
                                    foreach($liderPolitico as $key => $value){
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
                <h1>Não há nenhum Lider Político adicionado</h1>
                    <a href="createLiderPolitico.php">
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