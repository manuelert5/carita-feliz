/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var tipoBusqueda = ''; //representa si va a buscar por id o por nombre1
var opcionCategoria = 0;//representa la categoria por la cual buscara; por defecto es cualquiera
var arreglo = [];//areglo que guardara los productos en el catalago
var obj = [];//arreglo json que retornara el WS
var selecccionPagina = 1;
var idCatalogo = 0;

$(document).ready(function () {

    $("#option_categoria").change(function () {

        opcionCategoria = $("#option_categoria option:selected").val();

    });

    $("#select_pag").change(function () {

        selecccionPagina = parseInt($("#select_pag option:selected").val());

    });


    $('.search-panel .dropdown-menu').find('a').click(function (e) {
        e.preventDefault();
        var param = $(this).attr("href").replace("#", "");
        var concept = $(this).text();
        $('.search-panel span#search_concept').text(concept);
        $('.input-group #search_param').val(param);
    });

    $('#cal_inicio').datepicker({
        format: " dd/mm/yyyy",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });



    $('#cal_fin').datepicker({
        format: " dd/mm/yyyy",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });

});


function cambioBusqueda(busqueda) {
    tipoBusqueda = busqueda;
}

function buscarProducto() {
    if (tipoBusqueda == '') {
        alert('Debe elegir un tipo de busqueda');
    } else {

        data = {
            "valor": $("#text_busqueda").val(),
            "categoria": opcionCategoria,
            "tipoBusqueda": tipoBusqueda

        };
        $.ajax({
            data: data, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "buscaProducto",
            type: 'post',

            beforeSend: function () {
                $("#modalCarga").modal('show');

            },
            success: function (response) {
                obj = JSON.parse(response);
                $("#modalCarga").modal('hide');
                if (obj.length > 0)
                {
                    $("#tablaCuerpo_producto").html("");
                    for (var indice = 0; indice < obj.length; indice++)
                    {

                        $("#tablaCuerpo_producto").append("<tr id=fila" + obj[indice].id_product + ">" +
                                "<td class='hidden-xs center'>" + obj[indice].id_product + "</td>" +
                                "<td>" + obj[indice].nombre + "</td>" +
                                "<td>" + obj[indice].categoria + "</td>" +
                                "<td align='center'>" +
                                "<button class='btn btn-info' onclick='mover(" + indice + ");'><em class='glyphicon glyphicon-arrow-right');'></em></button>" +
                                "</td>" +
                                "</tr>");
                    }

                } else {
                    alert("Sin resultados!");
                }
            }
        });

    }

}


function guardaCatalogo() {

    var jSon = {
        "nombre": $("#text_nombre_cat").val(),
        "numeroPaginas": $("#text_paginas").val(),
        "fechaInicio": $("#cal_inicio").val(),
        "fechaFinaliza": $("#cal_fin").val()
    }


    $.ajax({
        data: {catalago: JSON.stringify(jSon)}, // le pone nombre al jSOn y convierte la cadena a jSon
        url: "crea_catalago",
        type: 'post',

        beforeSend: function () {
            $("#modalCarga").modal('show');

        },
        success: function (response) {
            var respuesta = JSON.parse(response);




            $("#modalCarga").modal('hide');
            if (respuesta.resultado == 0)
            {
                idCatalogo = respuesta.idCat;
                var pag = $("#text_paginas").val();
                pag++;
                for (var i = 1; i < pag; i++)
                {
                    $("#select_pag").append("<option value='" + i + "'>" + i + "</option>");
                }

            } else {
                alert(response);
            }


        }
    });
}



function mover(indice) {



    var decision = false;

    for (var x = 0; x < arreglo.length; x++)
    {
        if (arreglo[x].id_product == obj[indice].id_product)
        {
            decision = true;
            alert("Este producto ya se encuentra en el catalogo");
        }

    }



    if (decision == false && selecccionPagina != 0)
    {
        var temp_arr = {
            id_product: obj[indice].id_product,
            nombre: obj[indice].nombre,
            categoria: obj[indice].categoria,
            id_categoria: obj[indice].id_categoria,
            pagina: selecccionPagina
        }

        arreglo.push(temp_arr);//agregamos el elemento al arreglo!


        var indice_arreglo = arreglo.length;
        indice_arreglo--;



        $("#fila" + obj[indice].id_product).remove();

        $("#tcc").prepend("<tr id=filaCatalogo" + arreglo[indice_arreglo].id_product + ">" +
                "<td align='center'>" +
                "<button class='btn btn-danger' onclick='eliminarDelCatalogo(" + arreglo[indice_arreglo].id_product + ");'><em class='glyphicon glyphicon-trash');'></em></button>" +
                "</td>" +
                "<td class='hidden-xs center'>" + arreglo[indice_arreglo].id_product + "</td>" +
                "<td>" + arreglo[indice_arreglo].nombre + "</td>" +
                "<td>" + arreglo[indice_arreglo].categoria + "</td>" +
                "<td>" + selecccionPagina + "</td>" +
                "</tr>");
    }
}


function eliminarDelCatalogo(id_arreglo) {
    var num_indice = 0;
    for (var indice = 0; indice < arreglo.length; indice++)
    {
        if (arreglo[indice].id_product == id_arreglo)
        {
            num_indice = indice;
        }
    }

    arreglo.splice(num_indice, 1);
    $("#filaCatalogo" + id_arreglo).remove();
}

function guardaDbDetallecat() {
    $.ajax({
        data: {"detalleCatalago": JSON.stringify(arreglo),
            "idCat": idCatalogo},
        url: "guardaDetalleCat",
        type: 'POST',

        beforeSend: function (xhr) {

        },

        success: function (data) {


        },

    });

}

