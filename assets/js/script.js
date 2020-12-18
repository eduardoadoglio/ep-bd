$(document).ready(function(){
    $("#conflito-select").on('change', function(){
        let tipoConflito = $("#conflito-select option:selected").val();
        switch (tipoConflito) {
            case 'economico':
                $(".conflito-info").remove();
                $(this).after('<div class="conflito-info">Matéria prima: <br> <input type="text" name="info" required></div>');
            break;
            case 'religioso':
                $(".conflito-info").remove();
                $(this).after('<div class="conflito-info">Religião: <br> <input type="text" name="info" required></div>');
            break;
            case 'racial':
                $(".conflito-info").remove();
                $(this).after('<div class="conflito-info">Etnia: <br> <input type="text" name="info" required></div>');
            break;
            case 'territorial':
                $(".conflito-info").remove();
                $(this).after('<div class="conflito-info">Região: <br> <input type="text" name="info" required></div>');
            break;
        }
    });
});