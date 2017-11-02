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
var arregloEditCat = [];//arreglo que carga los catalagos para editarlos
var indice_mover = 0;
var indice_edit = 0;
var idBorrado=0;

$(document).ready(function () {
    $("#modal_EditaCatalago").submit(function () {
        var jSon = {
            "id": arregloEditCat[indice_edit].id,
            "nombre": $("#text_nombre_EditCat").val(),
            "numeroPaginas": $("#text_Editpaginas").val(),
            "fechaInicio": $("#cal_EditInicio").val(),
            "fechaFinaliza": $("#cal_EditFin").val()
        }

        $.ajax({
            data: {catalago: JSON.stringify(jSon)}, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "editarCatalago",
            type: 'post',

            beforeSend: function () {
                $("#modalCarga").modal('show');
                $("#modal_EditaCatalago").modal('hide');

            },
            success: function (response) {
                $("#modalCarga").modal("hide");

                if (response != "0")
                {
                    $("#moda_error3").modal("show");
                    if (response == "2")
                    {
                        $("#contenedorError3").html("Ya hay un catalago en ese rango de fechas");

                    }

                }
                if (response == "0")
                {
                    arregloEditCat[indice_edit].nombre=$("#text_nombre_EditCat").val();
                    arregloEditCat[indice_edit].numeroPaginas=$("#text_Editpaginas").val();
                    arregloEditCat[indice_edit].fechaInicio=$("#cal_EditInicio").val();
                    arregloEditCat[indice_edit].fechaFinaliza=$("#cal_EditFin").val();
                    
                    
                    $("#modal_Exito").modal("show");
                    $("#contenedorExito").html("La actualizacion a finalizado con exito");
                    $("#fialEdit"+arregloEditCat[indice_edit].id).html("<td>" + arregloEditCat[indice_edit].id + "</td>	" +
                            "<td >" +$("#text_nombre_EditCat").val()+ "</td>	" +
                            "<td>" + $("#text_Editpaginas").val()+ "</td>	" +
                            "<td>" +$("#cal_EditInicio").val()+ "</td>	" +
                            "<td>" +$("#cal_EditFin").val() + "</td>	" +
                            "<td>" +
                            "<span class='btn btn-info glyphicon glyphicon-edit' style='width: 3em; height: 2em;' onclick='abrirModalEdit(" + indice_edit + ")'></span>	" +
                            "<span class='btn btn-danger glyphicon glyphicon-remove' style='width: 3em; height: 2em;'  onclick='abrirModalBoarrado(" + arregloEditCat[indice_edit].id + ")'></span>	" +
                            "<span class='btn btn-warning glyphicon glyphicon-eye-open' style='width: 3em; height: 2em;'></span>	" +
                            "</td>	");
                }
            }
        });


    });

    $("#formulario_BuscaCatalago").submit(function () {
        var jSon = {
            "fechaInicio": $("#cal_inicioBusquedaEdit").val(),
            "fechaFinaliza": $("#cal_finBusquedaModEdit").val()
        }


        $.ajax({
            data: jSon, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "busca_catalagosXfecha",
            type: 'post',

            beforeSend: function () {
                $("#modalCarga").modal('show');

            },
            success: function (response) {
                $("#modalCarga").modal("hide");
                $("#modal_buscaCatalago").modal("hide");
                $("#contenedor_panelesModificaCat").show('true');
                arregloEditCat = JSON.parse(response);
                if (arregloEditCat.length == 0) {
                    $("#contenedorError2").html("No se enconttrado resultados");
                    $("#moda_error2").modal("show");
                    $("#contenedor_panelesModificaCat").hide();

                }

                if (arregloEditCat.length > 0)
                {
                    $("#tabla_cuerpoEditCat").html("");
                    for (var i = 0; i < arregloEditCat.length; i++)
                    {
                        $("#tabla_cuerpoEditCat").append("<tr id='fialEdit" + arregloEditCat[i].id + "'>	" +
                                "<td>" + arregloEditCat[i].id + "</td>	" +
                                "<td >" + arregloEditCat[i].nombre + "</td>	" +
                                "<td>" + arregloEditCat[i].numeroPaginas + "</td>	" +
                                "<td>" + arregloEditCat[i].fechaInicio + "</td>	" +
                                "<td>" + arregloEditCat[i].fechaFinaliza + "</td>	" +
                                "<td>" +
                                "<span class='btn btn-info glyphicon glyphicon-edit' style='width: 3em; height: 2em;' onclick='abrirModalEdit(" + i + ")'></span>	" +
                                "<span class='btn btn-danger glyphicon glyphicon-remove' style='width: 3em; height: 2em;'  onclick='abrirModalBoarrado(" + arregloEditCat[i].id + ")'></span>	" +
                                "<span class='btn btn-warning glyphicon glyphicon-plus' style='width: 3em; height: 2em;'></span>	" +
                                "</td>	" +
                                "</tr>	");
                    }
                }
            }
        });


    });


    $("#formulario_CreaCatalago").submit(function () {

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
                    $("#modal_crearCatalago").modal('hide');
                    $("#contenedor_panelesCreaCat").show('true');
                    idCatalogo = respuesta.idCat;
                    var pag = $("#text_paginas").val();
                    pag++;
                    for (var i = 1; i < pag; i++)
                    {
                        $("#select_pag").append("<option value='" + i + "'>" + i + "</option>");
                    }

                }
                if (respuesta.resultado == 2)
                {
                    $('#moda_error').modal({backdrop: 'static', keyboard: false});


                    $("#contenedorError").html("Ya hay un catalago en ese rango de fechas");
                    $("#modal_EditaCatalago").modal('hide');
                }

            }
        });


    });


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
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });



    $('#cal_fin').datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });

    $('#cal_inicioBusquedaEdit').datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });



    $('#cal_finBusquedaModEdit').datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });

    $('#cal_EditInicio').datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });



    $('#cal_EditFin').datepicker({
        format: "yyyy-mm-dd",
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
                                "<td class='hidden-xs center' style='width: 3em;'>" + obj[indice].id_product + "</td>" +
                                "<td>" + obj[indice].nombre + "</td>" +
                                "<td class='categoria'>" + obj[indice].categoria + "</td>" +
                                "<td style='width: 4em;'>" +
                                "<button class='btn btn-info' onclick='mover(" + indice + ");'><em class='glyphicon glyphicon-plus-sign');'></em></button>" +
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




function mover(indice) {

    $("#modal_seleccionPagina").modal("show");
    indice_mover = indice;
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

        beforeSend: function () {
            $("#modalCarga").modal('show');

        },

        success: function (data) {
            $("#modalCarga").modal('hide');
            alert(data);

        },

    });

}


function llama_modalCreaCat() {
    $("#modal_crearCatalago").modal("show");
    $("#item_crea").addClass("item_activo");

    $("#item_elimina").removeClass("item_activo");
    $("#item_modifica").removeClass("item_activo");
    $("#item_sube").removeClass("item_activo");


    $("#contenedor_panelesModificaCat").hide();


}
function modal_ErrorCierra3() {
    $("#modal_EditaCatalago").modal("show");
}

function modal_ErrorCierra2() {
    $("#modal_buscaCatalago").modal("show");
}

function modal_ErrorCierra() {
    $("#modal_crearCatalago").modal("show");
}

function editarCatalago() {
    $("#modal_buscaCatalago").modal("show");

    $("#item_modifica").addClass("item_activo");

    $("#item_elimina").removeClass("item_activo");
    $("#item_crea").removeClass("item_activo");
    $("#item_sube").removeClass("item_activo");

    $("#contenedor_panelesCreaCat").hide();


}

function  abrirModalEdit(indice) {
    indice_edit = indice;
    $("#modal_EditaCatalago").modal('show');
    $("#text_nombre_EditCat").val(arregloEditCat[indice].nombre);
    $("#text_Editpaginas").val(arregloEditCat[indice].numeroPaginas);
    $("#cal_EditInicio").val(arregloEditCat[indice].fechaInicio);
    $("#cal_EditFin").val(arregloEditCat[indice].fechaFinaliza);
}


function  moverAcatalogo() {
    
    var decision = false;
    
    for (var x = 0; x < arreglo.length; x++)
    {
        if (arreglo[x].id_product == obj[indice_mover].id_product)
        {
            decision = true;
            alert("Este producto ya se encuentra en el catalogo");
        }
    }



    if (decision == false && selecccionPagina != 0)
    {
        var temp_arr = {
            id_product: obj[indice_mover].id_product,
            nombre: obj[indice_mover].nombre,
            categoria: obj[indice_mover].categoria,
            id_categoria: obj[indice_mover].id_categoria,
            pagina: selecccionPagina
        }

        arreglo.push(temp_arr);//agregamos el elemento al arreglo!


        var indice_arreglo = arreglo.length;
        indice_arreglo--;



        $("#fila" + obj[indice_mover].id_product).remove();

        $("#tcc").prepend("<tr id=filaCatalogo" + arreglo[indice_arreglo].id_product + ">" +
                "<td align='center'>" +
                "<button style='width: 4em;' class='btn btn-danger' onclick='eliminarDelCatalogo(" + arreglo[indice_arreglo].id_product + ");' style='width: 3em;'><em class='glyphicon glyphicon-trash');'></em></button>" +
                "</td>" +
                "<td class='hidden-xs center'>" + arreglo[indice_arreglo].id_product + "</td>" +
                "<td>" + arreglo[indice_arreglo].nombre + "</td>" +
                "<td class='categoria'>" + arreglo[indice_arreglo].categoria + "</td>" +
                "<td>" + selecccionPagina + "</td>" +
                "</tr>");
    }


    $("#modal_seleccionPagina").modal("hide");

}


function abrirModalBoarrado(id){
    idBorrado=id;
    $("#modal_BorrarCat").modal("show");
}

function borraModal(){
        data={"idCat": idBorrado};

        $.ajax({
            data: data, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "BorraCatalago",
            type: 'post',

            beforeSend: function () {
                $("#modal_BorrarCat").modal("hide");
                $("#modalCarga").modal('show');

            },
            success: function (response) {
                $("#modalCarga").modal("hide");
                if(response=="0"){
                    $("#modal_Exito").modal("show");
                    $("#contenedorExito").html("Se ha borrado con exito el catalago");
                    $("#fialEdit"+idBorrado).remove();
                    
                }
           
            }
        });

    
}