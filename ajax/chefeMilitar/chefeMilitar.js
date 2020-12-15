$(document).ready(function(){
    $("#grupo-militar-select").on('change', function(){
        $("#divisao-select option").not('option:first').remove();
        let grupoMilitarId = $("#grupo-militar-select option:selected").val();
        if($("#divisao-select").length == 0){
            $(this).after('<br>Selecione uma divisão <br><select name="divisaoId" id="divisao-select"><option value="" disabled selected> -- </option></select><br>');
        }
        $.ajax({
            url:"../../ajax/divisao/getDivisoesFromGrupoMilitar.php",
            data:{
                grupoMilitarId:grupoMilitarId
            },
            success: function(ajaxResult){
                console.log(JSON.parse(ajaxResult));
                let ajaxObj = JSON.parse(ajaxResult);
                $(ajaxObj).each(function(index, item){
                    console.log(index + " " + item.barcos);
                    $("#divisao-select").append('<option value="'+ item.nrodivisao +'"> ' + item.nrodivisao + ' </option>');
                });
            },
            error: function(result){
                console.log("erro: " + JSON.stringify(result));
            }
        });
    });
    /*
    $('body').on('change', '#divisao-select', function(){
        let divisaoId = $("#divisao-select option:selected").val();
        $.ajax({
            url:"../../ajax/liderPolitico/getLiderPoliticoFromDivisao.php",
            data:{
                divisaoId:divisaoId
            },success: function(ajaxResult){
                console.log(JSON.parse(ajaxResult));
                let ajaxObj = JSON.parse(ajaxResult);
                $(ajaxObj).each(function(index, item){
                    console.log(index + " " + item.barcos);
                    // $("#divisao-select").append('<option value="'+ item.nrodivisao +'"> ' + item.nrodivisao + ' </option>');
                });
            }
        });
    });
    */
});