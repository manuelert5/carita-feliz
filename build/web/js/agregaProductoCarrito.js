var script = document.createElement('script');
script.src = 'jquery-3.2.1.min.js';
document.getElementsByTagName('head')[0].appendChild(script); 

function agregaProductoCarrito(idUsr, idProducto){
    
    var cadJson={
        "idUser":   idUsr, 
        "idProducto": idProducto,
        "Cantidad":3
    }
    
        $.ajax({
            data:   {procutoAgragarCarrito: JSON.stringify(cadJson)}, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "agregaProductoCarrito",
            type: 'post',

        beforeSend: function () {

        },
        success:  function (response) {
            alert(response);


        }
    });
        
}
