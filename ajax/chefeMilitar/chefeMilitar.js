function handleGrupoMilitarCreationForm(){
    $("#grupo-militar-create").toggleClass('hidden');
    $("#new-grupo-militar-actions").toggleClass('hidden');
    $("#lider-politico-create").toggleClass('hidden');
    $("#divisao-create").toggleClass('hidden');
    $("#grupo-militar-container").toggleClass('hidden');
    if($("#lider-politico-container").length){
        $("#lider-politico-container").remove();
    }
    $('#grupo-militar-select').val("");
}

function handleLiderPoliticoCreationForm(){

}

function handleCreationForm(entityType){
    switch(entityType){
        case 'grupo-militar':
            handleGrupoMilitarCreationForm();
        break;
        case 'lider-politico':
            handleLiderPoliticoCreationForm();
        break;
        case 'divisao':
            handleDivisaoCreationForm();
        break;
    }
}

function getLideresPoliticosFromGrupoMilitar(grupoMilitarId){
    $.ajax({
        url:"../../ajax/liderPolitico/getLideresPoliticosFromGrupoMilitar.php",
        data:{
            grupoMilitarId:grupoMilitarId
        },
        success: function(ajaxResult){
            console.log(JSON.parse(ajaxResult));
            let ajaxObj = JSON.parse(ajaxResult);
            addLideresPoliticosToSelect(ajaxObj);
        },
        error: function(result){
            console.log("erro: " + JSON.stringify(result));
        }
    });
}

function getDivisoesFromLiderPolitico(liderPoliticoName){
    $.ajax({
        url:"../../ajax/divisao/getDivisoesFromLiderPolitico.php",
        data:{
            liderPoliticoName:liderPoliticoName
        },
        success: function(ajaxResult){
            console.log(JSON.parse(ajaxResult));
            let ajaxObj = JSON.parse(ajaxResult);
            addDivisoesToSelect(ajaxObj);
        },
        error: function(result){
            console.log("erro: " + JSON.stringify(result));
        }
    });
}
// Criação de um grupo militar
function createGrupoMilitar(grupoMilitarName) {
    $.ajax({
        url:"../../ajax/grupoMilitar/createGrupoMilitar.php",
        data:{
            grupoMilitarName:grupoMilitarName
        },
        success: function(ajaxResult){
            ajaxObj = JSON.parse(ajaxResult);
            $("#new-grupo-militar-actions, #grupo-militar-create").toggleClass('hidden');
            $("#grupo-militar-info").append("Grupo Militar: " + ajaxObj.nomegrupo);
            $("#grupo-militar-select").attr("name", "");
            $("#hidden-grupo-militar-id").attr("value", ajaxObj.codigog);
        },
        error: function(result){
            console.log("erro: " + JSON.stringify(result));
        }
    });
}

// Criação de um lider político
function createLiderPolitico(liderPoliticoName, liderPoliticoApoio, codigoGrupo) {
    $.ajax({
        url:"../../ajax/liderPolitico/createLiderPolitico.php",
        data:{
            liderPoliticoName:liderPoliticoName,
            liderPoliticoApoio:liderPoliticoApoio,
            codigoGrupo:codigoGrupo
        },
        success: function(ajaxResult){
            ajaxObj = JSON.parse(ajaxResult);
            $("#new-lider-politico-actions, #lider-politico-create").toggleClass('hidden');
            $("#lider-politico-info").append("Lider político: " + ajaxObj.nomel);
            $("#lider-politico-select").attr("name", "");
            $("#hidden-lider-politico-name").attr("value", ajaxObj.nomel);
        },
        error: function(result){
            console.log("erro: " + JSON.stringify(result));
        }
    });
}

// Criação de uma divisão
function createDivisao(codigoGrupo, numBarcos, numAvioes, numTanques, numHomens){
    $.ajax({
        url:"../../ajax/liderPolitico/createLiderPolitico.php",
        data:{
            codigoGrupo:codigoGrupo,
            numBarcos:numBarcos,
            numAvioes:numAvioes,
            numTanques:numTanques,
            numHomens:numHomens,
        },
        success: function(ajaxResult){
            ajaxObj = JSON.parse(ajaxResult);
            $("#new-divisao-actions, #divisao-create").toggleClass('hidden');
            $("#divisao-info").append("Divisão: " + ajaxObj.nrodivisao);
            $("#divisao-select").attr("name", "");
            $("#hidden-divisao-id").attr("value", ajaxObj.nrodivisao);
        },
        error: function(result){
            console.log("erro: " + JSON.stringify(result));
        }
    });
}

function addDivisoesToSelect(divisoes){
    $(divisoes).each(function(_, item){
        $("#divisao-select").append('<option value="'+ item.nrodivisao +'"> ' + item.nrodivisao + ' </option>');
    });
    $("#divisao-select").append('<option value="outro"> Outro </option>');
}

function addLideresPoliticosToSelect(lideresPoliticos){
    $(lideresPoliticos).each(function(_, item){
        $("#lider-politico-select").append('<option value="'+ item.nomel +'"> ' + item.nomel + ' </option>');
    });
    $("#lider-politico-select").append('<option value="outro"> Outro </option>');
}


function handleHiddenFormFieldsAfterCancel(entityType){
    switch(entityType){
        case 'grupo-militar':
            $("#grupo-militar-select").attr("name", "grupoMilitarId");
            $("#hidden-grupo-militar-id").attr("name", "");

        break;
        case 'lider-politico':
            $("#lider-politico-select").attr("name", "liderPoliticoName");
            $("#hidden-lider-politico-name").attr("name", "");
        break;
        case 'divisao':
            $("#divisao-select").attr("name", "divisaoId");
            $("#hidden-divisao-id").attr("name", "");
        break;
    }
}

function handleCancelCreation(entityType){
    $("#new-" + entityType + "-actions").toggleClass('hidden');
    $("#grupo-militar-info").toggleClass('hidden');
    $("#grupo-militar-create, #lider-politico-create, #divisao-create").addClass('hidden');
    $('#grupo-militar-container').toggleClass('hidden');
    handleHiddenFormFieldsAfterCancel(entityType)
}

$(document).ready(function(){
    // Após selecionar um grupo militar
    $("#grupo-militar-select").on('change', function(){
        $("#lider-politico-select option").not('option:first').remove();
        let grupoMilitarId = $("#grupo-militar-select option:selected").val();
        if(grupoMilitarId.toLowerCase() == 'outro'){
            return handleCreationForm('grupo-militar');
        }
        if($("#lider-politico-container").length == 0){
            $(this).after('<div id="lider-politico-container"> Selecione um lider político <br><select name="liderPoliticoName" id="lider-politico-select"><option value="" disabled selected> -- </option></select></div>');
        }
        getLideresPoliticosFromGrupoMilitar(grupoMilitarId);
    });
    // Criação de um novo grupo militar
    $('body').on('click', '#new-grupo-militar-submit', function(e){
        e.preventDefault();
        let grupoMilitarName = $("#grupo-militar-name").val();
        createGrupoMilitar(grupoMilitarName);
        $("#new-lider-politico-actions").toggleClass('hidden');
    });
    // Cancelamento da criação de novos grupos militares
    $('body').on('click', '#new-grupo-militar-cancel', function(e){
        e.preventDefault();
        handleCancelCreation('grupo-militar');
    });
    
    // Após selecionar um líder político
    $('body').on('change', '#lider-politico-select', function(){
        $("#divisao-select option").not('option:first').remove();
        let liderPoliticoName = $("#lider-politico-select option:selected").val();
        if(liderPoliticoName.toLowerCase() == 'outro'){
            return handleCreationForm('lider-politico');
        }
        if($("#divisao-container").length == 0){
            $(this).after('<div id="divisao-container"> Selecione uma divisão <br><select name="divisaoId" id="divisao-select"><option value="" disabled selected> -- </option></select></div>');
        }
        getDivisoesFromLiderPolitico(liderPoliticoName);
    });

    // Criação de um novo lider político
    $('body').on('click', '#new-lider-politico-submit', function(e){
        e.preventDefault();
        let liderPoliticoName = $("#lider-politico-name").val();
        let liderPoliticoApoio = $("#lider-politico-apoio").val();
        let codigoGrupo = $('input[name="grupoMilitarId"]').val();
        createLiderPolitico(liderPoliticoName, liderPoliticoApoio, codigoGrupo);
        $("#new-divisao-actions").toggleClass('hidden');
    });

    // Cancelamento da criação de um lider politico
    $('body').on('click', '#new-lider-politico-cancel', function(e){
        e.preventDefault();
        handleCancelCreation('lider-politico');
    });

    // Após selecionar um líder político
    $('body').on('change', '#divisao-select', function(){
        $("#divisao-select option").not('option:first').remove();
        let divisaoId = $("#divisao-select option:selected").val();
        if(divisaoId.toLowerCase() == 'outro'){
            return handleCreationForm('divisao');
        }
    });

    // Criação de uma nova divisão
    $('body').on('click', '#new-divisao-submit', function(e){
        e.preventDefault();
        let numBarcos = $("#num-barcos").val();
        let numAvioes = $("#num-avioes").val();
        let numTanques = $("#num-tanques").val();
        let numHomens = $("#num-homens").val();
        let codigoGrupo = $('input[name="grupoMilitarId"]').val();
        createDivisao(codigoGrupo, numBarcos, numAvioes, numTanques, numHomens);
        $("#new-divisao-actions").toggleClass('hidden');
    });

    // Cancelamento da criação de um lider politico
    $('body').on('click', '#new-divisao-cancel', function(e){
        e.preventDefault();
        handleCancelCreation('divisao');
    });

});
