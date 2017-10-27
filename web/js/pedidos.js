/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var idFactura=0;
var idDetFac=0;





function rastrear(idFact){
    
    data={
        idFactura: idFact
    }
    $.ajax({
        data:   data,
        url: 'retornaInfoPedido',
        type: 'post',

        beforeSend: function () {
            $('#modalCarga').modal('show');

        },
        success:  function (response) {
            $('#modalCarga').modal('hide');
            //$("#modalRastreo_cuerpo").html("");
            $("#tb_cuerpo").html("");
            $("#tb_cuerpo2").html("");
            
            pedido=JSON.parse(response);//parseamos el json 
            seguimiento=pedido.seguimiento;//obtenemos el SubJson 
            
            
            
            
//            var encabezado='<p class="text-info"> <strong> Numero Guia: </strong> '+pedido.codigo_rastreo+
//                    ' <strong>Peso: </strong>'+pedido.peso+' <strong>Estado: </strong>'+pedido.estado+
//                    ' <strong>Direccion: </strong>'+pedido.direccion+
//                    ' <strong>Telefono: </strong>'+pedido.telefono+'</p>';
//            $("#modalRastreo_encabezado").html(encabezado);
            
            $("#tb_cuerpo").append("<tr>"+
                                    "<td>"+pedido.codigo_rastreo+"</td>"+
                                    "<td>"+pedido.peso+"</td>"+
                                    "<td>"+pedido.estado+"</td>"+
                                    "<td>"+pedido.direccion+"</td>"+
                                    "<td>"+pedido.telefono+"</td>"+
                                    "</tr>");
            
            
            for(i=0; i<seguimiento.length; i++)
            {
                
                //var cuerpo='Fecha '+seguimiento[i].fecha+ ' Suceso '+seguimiento[i].descipcion+"<BR>";
                $("#tb_cuerpo2").append("<tr>"+
                                    "<td>"+seguimiento[i].fecha+"</td>"+
                                    "<td>"+seguimiento[i].descipcion+"</td>"+
                                    "</tr>");
            }
            
            $("#modal_rastreo").modal('show');

        }
    });
}

function reclamar(idF,idDet){///abre el modal de reclamo;
    
    
    idFactura=idF;
    idDetFac=idDet;
    $("#modal_reclamo").modal('show');
}

function guardaReclamo(){
    
    
    var cadJson={
        "idFactura":    idFactura, 
        "idDetFac":     idDetFac,
        "motivo":       $("#inp_motivo").val(),
        "descipcion":   $("#txta_descripcion").val()
    }
    
    

        $.ajax({
            data:   {reclamo: JSON.stringify(cadJson)}, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "creaReclamo",
            type: 'post',

        beforeSend: function () {
            $("#modalCarga").modal('show');
            $("#modal_reclamo").modal('hide');

        },
        success:  function (response) {
            $("#modalCarga").modal('hide');
        }
    });
    
}

function cerrar(){
    
    $("#modal_reclamo").modal('hide');
    
}