
function agregaProductoCarrito(idUsr, idProducto, cantidad){
    
    var cadJson={
        "idUser":   idUsr, 
        "idProducto": idProducto,
        "Cantidad":cantidad
    }
    
        $.ajax({
            data:   {procutoAgragarCarrito: JSON.stringify(cadJson)}, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "agregaProductoCarrito",
            type: 'post',

        beforeSend: function () {
            $("#modalCarga").modal('show');

        },
        success:  function (response) {
            $("#modalCarga").modal('hide');
            if(response==0)
            {
                $("#modalAgragadoExito").modal('show');
                
            }
            
            if(response!=0)
            {
                $("#modalAgragadoError").modal('show');
                $("#contenedor_modalError").html(response)
            }
            
        }
    });
        
}
