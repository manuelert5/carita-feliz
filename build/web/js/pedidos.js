/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


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
            $("#modalRastreo_cuerpo").html("");
            
            pedido=JSON.parse(response);//parseamos el json 
            seguimiento=pedido.seguimiento;//obtenemos el SubJson 
            
            
            
            
            var encabezado=' Numero Guia: '+pedido.codigo_rastreo+' Peso: '+pedido.peso+' Estado: '+pedido.estado+' Direccion: '+pedido.direccion+ ' Telefono: '+pedido.telefono;
            $("#modalRastreo_encabezado").html(encabezado);
            
            for(i=0; i<seguimiento.length; i++)
            {
                
                var cuerpo='Fecha '+seguimiento[i].fecha+ ' Suceso'+seguimiento[i].descipcion+"<BR>";
                $("#modalRastreo_cuerpo").append(cuerpo);
                 
                 
            }
            
            $("#modal_rastreo").modal('show');

        }
    });
    
    
    
}