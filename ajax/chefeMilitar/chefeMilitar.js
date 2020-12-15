function handleGrupoMilitarCreationForm(){
    $("#grupo-militar-create").css('display', 'block');
    $("#new-grupo-militar-actions").css('display', 'inline-block');
    $("#lider-politico-create").css('display', 'block');
    $("#divisao-create").css('display', 'block');
    $("#grupo-militar-container").css('display', 'none');
    if($("#lider-politico-container").length){
        $("#lider-politico-container").remove();
    }
    $('#grupo-militar-select').val("");
}

function handleLiderPoliticoCreationForm(){

}

function handleCreationForm(entityType){
    switch(entityType){
        case 'grupoMilitar':
            handleGrupoMilitarCreationForm();
        break;
        case 'liderPolitico':
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
            $("#new-grupo-militar-actions, #grupo-militar-create").css('display', 'none');
            $("#grupo-militar-info").append("Grupo Militar: " + ajaxObj.nomegrupo);
            $("#grupo-militar-select").attr("name", "");
            $("#hidden-grupo-militar-id").attr("value", ajaxObj.codigog);
        },
        error: function(result){
            console.log("erro: " + JSON.stringify(result));
        }
    });
}

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
            $("#new-lider-politico-actions, #lider-politico-create").css('display', 'none');
            $("#lider-politico-info").append("Lider político: " + ajaxObj.nomel);
            $("#lider-politico-select").attr("name", "");
            $("#hidden-lider-politico-name").attr("value", ajaxObj.nomel);
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

$(document).ready(function(){
    // Após selecionar um grupo militar
    $("#grupo-militar-select").on('change', function(){
        $("#lider-politico-select option").not('option:first').remove();
        let grupoMilitarId = $("#grupo-militar-select option:selected").val();
        if(grupoMilitarId.toLowerCase() == 'outro'){
            return handleCreationForm('grupoMilitar');
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
        $("#new-lider-politico-actions").css('display', 'inline-block');
    });
    // Cancelamento da criação de novos grupos militares
    $('body').on('click', '#new-grupo-militar-cancel', function(e){
        e.preventDefault();
        $("#grupo-militar-create").css('display', 'none');
        $("#lider-politico-create").css('display', 'none');
        $("#divisao-create").css('display', 'none');
        $('#grupo-militar-container').css('display', 'block');
    });

    // Criação de um novo lider político
    $('body').on('click', '#new-lider-politico-submit', function(e){
        e.preventDefault();
        let liderPoliticoName = $("#lider-politico-name").val();
        let liderPoliticoApoio = $("#lider-politico-apoio").val();
        let codigoGrupo = $('input[name="grupoMilitarId"]').val();
        createLiderPolitico(liderPoliticoName, liderPoliticoApoio, codigoGrupo);
        $("#new-divisao-actions").css('display', 'inline-block');
    });
    $('body').on('change', '#lider-politico-select', function(){
        $("#divisao-select option").not('option:first').remove();
        let liderPoliticoName = $("#lider-politico-select option:selected").val();
        if(liderPoliticoName.toLowerCase() == 'outro'){
            return handleCreationForm('liderPolitico');
        }
        if($("#divisao-container").length == 0){
            $(this).after('<div id="divisao-container"> Selecione uma divisão <br><select name="divisaoId" id="divisao-select"><option value="" disabled selected> -- </option></select></div>');
        }
        getDivisoesFromLiderPolitico(liderPoliticoName);
    })
});