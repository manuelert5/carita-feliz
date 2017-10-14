var script = document.createElement('script');
script.src = 'jquery-3.2.1.min.js';
document.getElementsByTagName('head')[0].appendChild(script); 



$(document).ready(function(){

                $("#email").change(function(){
                    $(this).removeClass("resplandor-rojo");
                });
                
                
                $("#pass").change(function(){
                    $(this).removeClass("resplandor-rojo");
                });
                
                
                $("#formulario").submit(function(e) {
                    e.preventDefault();
                    var data = {
                               "email"     :   $("#email").val(),
                                "pass"       :   $("#pass").val()   

                    };
                    $.ajax({
                                data:   data,
                                url: "inicia_sesion",
                                type: 'post',

                            beforeSend: function () {
                                    $("#fountainG").show();
                            },
                            success:  function (response) {
                                    if(response=="0")//si el inicio de sesion es valido!
                                    {
                                        location.reload();
                                        $("#fountainG").hide();
                                    }
                                    else if(response=="1")//corrreo no encontrado
                                    {                                        
                                        $("#email").addClass("resplandor-rojo");
                                        $("#fountainG").hide();
                                    }
                                    else if(response=="2")//password no encontrada
                                    {
                                        $("#pass").addClass("resplandor-rojo");
                                        $("#fountainG").hide();
                                    }
                                    
                            }
                    });
                    return  false; 
                });
                
});


/*cuando el socio selecciona al usuario a quien le dedicara la orden*/
function guarda_seleccion_del_afiliado(id)
{
    var data={
        "id":   id
    };
    $.ajax({
            data:   data,
            url: "seleccion_socio_orden",
            type: 'post',

        beforeSend: function () {

        },
        success:  function (response) {
            if(response=="0")
            {
                location.reload();

            }

        }
    });


}

/*cuando quiere cambiar de persona a la que le dedicara la orden un soscio*/
function seleccion_afiliado_orden(){
    $('#modal_seleccion_orden').modal({backdrop: 'static', keyboard: false});
    $('#modal_seleccion_orden').modal('show');
}