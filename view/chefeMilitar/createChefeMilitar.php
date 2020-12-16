<?php 

include("../../template/header.php");

require_once('../../model/Divisao.php');
require_once('../../model/LiderPolitico.php');
require_once('../../model/GrupoMilitar.php');

$grupoMilitarObj = new GrupoMilitar();
$divisaoObj = new Divisao();
$liderPoliticoObj = new LiderPolitico();

$gruposMilitares = $grupoMilitarObj->getAllGruposMilitares();
$divisoes = $divisaoObj->getAllDivisoes();
$lideresPoliticos = $liderPoliticoObj->getAllLideresPoliticos();

?>

<script src="../../ajax/chefeMilitar/chefeMilitar.js"></script>

<body>
    <form action="../../action/chefeMilitar/createchefeMilitar.php" method="POST">
        lansa o chefe militar <br>
        Faixa: <br>
        <input type="text" name="chefeMilitarFaixa"> <br>
        <div id="grupo-militar-container">
            Selecione um grupo militar <br>
            <select name="grupoMilitarId" id="grupo-militar-select" required>
            <option value="" selected disabled> -- </option>
                <?php
                    foreach($gruposMilitares as $grupo){
                        echo '<option value="'.$grupo['codigog'].'">'.$grupo['nomegrupo'].'</option>';
                    }
                ?>
            <option value="outro">Outro</option>
            </select> <br>
        </div>
        <div id="grupo-militar-info">
			<input type="hidden" name="grupoMilitarId" id="hidden-grupo-militar-id">
        </div>
        <div id="grupo-militar-create" class="hidden">
            Diga o nome do grupo militar <br>
            <input type="text" id="grupo-militar-name">
            <div id="new-grupo-militar-actions" class="hidden">
                <button id="new-grupo-militar-submit">Criar</button>
                <button id="new-grupo-militar-cancel">&times</button>
            </div>
        </div>
        <div id="lider-politico-create" class="hidden">
            Diga o nome do líder político <br>
            <input type="text" id="lider-politico-name"> <br>
            Digite os apoios desse lider <br>
            <input type="text" id="lider-politico-apoio">
            <div id="new-lider-politico-actions" class="hidden">
                <button id="new-lider-politico-submit">Criar</button>
                <button id="new-lider-politico-cancel">&times</button>
            </div>
        </div>
		<div id="lider-politico-info">
			<input type="hidden" name="liderPoliticoName" id="hidden-lider-politico-name">
        </div>
        <div id="divisao-create" class="hidden">
            Descreva a divisão <br>
            N° de barcos: <br>
            <input type="number" id="num-barcos"> <br>
            N° de avioes: <br>
            <input type="number" id="num-avioes"> <br>
            N° de tanques: <br>
            <input type="number" id="num-tanques"> <br>
            N° de homens: <br>
            <input type="number" id="num-homens"> <br>
            <div id="new-divisao-actions" class="hidden">
                <button id="new-divisao-submit">Criar</button>
                <button id="new-divisao-cancel">&times</button>
            </div>
        </div>
		<div id="divisao-info">
			<input type="hidden" name="divisaoId" id="hidden-divisao-id">
        </div>

        <input type="submit" value="Enviar" id="create-chefe-militar-submit">
    </form>
</body>
<?php include("../../template/footer.php"); ?>
</html>