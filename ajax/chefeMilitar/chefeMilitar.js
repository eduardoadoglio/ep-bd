function handleGrupoMilitarCreationForm(){
    $("#grupo-militar-create").toggleClass('hidden');
    $("#new-grupo-militar-actions").toggleClass('hidden');
    $("#lider-politico-create").toggleClass('hidden');
    $("#divisao-create").toggleClass('hidden');
    $("#grupo-militar-container").toggleClass('hidden');
    if($("#lider-politico-container").length){
        $("#lider-politico-container").addClass('hidden');
    }
    $('#grupo-militar-select').val("");
}

function handleLiderPoliticoCreationForm(){
    $("#lider-politico-create").toggleClass('hidden');
    $("#new-lider-politico-actions").toggleClass('hidden');
    $("#divisao-create").toggleClass('hidden');
    $("#lider-politico-container").toggleClass('hidden');
    if($("#divisao-container").length){
        $("#divisao-container").addClass('hidden');
    }
    $('#lider-politico-select').val("");
}

function handleDivisaoCreationForm(){
    $("#divisao-create").toggleClass('hidden');
    $("#new-divisao-actions").toggleClass('hidden');
    $("#divisao-container").toggleClass('hidden');
    $('#divisao-select').val("");
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
            $("#lider-politico-info").removeClass("hidden");
            $("#lider-politico-info").append("Lider político: " + ajaxObj.nomel);
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
        url:"../../ajax/divisao/createDivisao.php",
        data:{
            codigoGrupo:codigoGrupo,
            numBarcos:numBarcos,
            numAvioes:numAvioes,
            numTanques:numTanques,
            numHomens:numHomens,
        },
        success: function(ajaxResult){
            console.log(ajaxResult);
            let ajaxObj = JSON.parse(ajaxResult);
            $("#new-divisao-actions, #divisao-create").toggleClass('hidden');
            $("#divisao-info").removeClass("hidden");
            $("#divisao-info").append("Divisão: " + ajaxObj.nrodivisao);
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

function handleDivisaoCancel() {
    $("#new-divisao-actions").toggleClass('hidden');
    $("#grupo-militar-info").toggleClass('hidden');
    $("#lider-politico-info").toggleClass('hidden');
    $("#grupo-militar-create, #lider-politico-create, #divisao-create").addClass('hidden');
    $('#grupo-militar-container').removeClass('hidden');
    $('#divisao-container').removeClass('hidden');
}

function handleLiderPoliticoCancel() {
    $("#new-lider-politico-actions").toggleClass('hidden');
    $("#grupo-militar-create, #lider-politico-create, #divisao-create, #lider-politico-info").addClass('hidden');
    if($("#grupo-militar-info").length == 0){
        $('#grupo-militar-container').removeClass('hidden');
    }else {
        if($("#lider-politico-container").length == 0){
            $("#grupo-militar-container").after('<div id="lider-politico-container"> Selecione um lider político <br><select id="lider-politico-select"><option value="" disabled selected> -- </option></select></div>');
            getLideresPoliticosFromGrupoMilitar($("#hidden-grupo-militar-id").val());
        }
    }
    $('#lider-politico-container, #divisao-container').removeClass('hidden');
}

function handleGrupoMilitarCancel() {
    $("#new-grupo-militar-actions").toggleClass('hidden');
    $("#grupo-militar-create, #lider-politico-create, #divisao-create, #lider-politico-info").addClass('hidden');
    $('#grupo-militar-container').removeClass('hidden');
    $('#lider-politico-container, #divisao-container').removeClass('hidden');
}


function handleCancelCreation(entityType){
    switch(entityType){
        case 'grupo-militar':
            handleGrupoMilitarCancel();
        break;
        case 'lider-politico':
            handleLiderPoliticoCancel();
        break;
        case 'divisao':
            handleDivisaoCancel();
        break;
    }
}

$(document).ready(function(){
    // Após selecionar um grupo militar
    $("#grupo-militar-select").on('change', function(){
        $("#lider-politico-select option").not('option:first').remove();
        let grupoMilitarId = $("#grupo-militar-select option:selected").val();
        if(grupoMilitarId.toLowerCase() == 'outro'){
            return handleCreationForm('grupo-militar');
        }
        $("#hidden-grupo-militar-id").attr("value", grupoMilitarId);
        if($("#lider-politico-container").length == 0){
            $("#grupo-militar-container").after('<div id="lider-politico-container"> Selecione um lider político <br><select id="lider-politico-select"><option value="" disabled selected> -- </option></select></div>');
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
        $("#hidden-lider-politico-name").attr("value", liderPoliticoName);
        if($("#divisao-container").length == 0){
            $("#lider-politico-container").after('<div id="divisao-container"> Selecione uma divisão <br><select id="divisao-select"><option value="" disabled selected> -- </option></select></div>');
        }
        getDivisoesFromLiderPolitico(liderPoliticoName);
    });

    // Criação de um novo lider político
    $('body').on('click', '#new-lider-politico-submit', function(e){
        e.preventDefault();
        let liderPoliticoName = $("#lider-politico-name").val();
        let liderPoliticoApoio = $("#lider-politico-apoio").val();
        let codigoGrupo = $('#hidden-grupo-militar-id').val();
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
        let divisaoId = $("#divisao-select option:selected").val();
        if(divisaoId.toLowerCase() == 'outro'){
            return handleCreationForm('divisao');
        }
        $("#hidden-divisao-id").attr("value", divisaoId);
    });

    // Criação de uma nova divisão
    $('body').on('click', '#new-divisao-submit', function(e){
        e.preventDefault();
        let numBarcos = $("#num-barcos").val();
        let numAvioes = $("#num-avioes").val();
        let numTanques = $("#num-tanques").val();
        let numHomens = $("#num-homens").val();
        let codigoGrupo = $('#hidden-grupo-militar-id').val();
        createDivisao(codigoGrupo, numBarcos, numAvioes, numTanques, numHomens);
        $("#new-divisao-actions, #divisao-create").toggleClass('hidden');
    });

    // Cancelamento da criação de um lider politico
    $('body').on('click', '#new-divisao-cancel', function(e){
        e.preventDefault();
        handleCancelCreation('divisao');
    });

});
