/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var categorias_en_oferta = [];
var idOferta = 0;
var ofertas = [];
var indiceEdit_oferta = 0;
var idBorrado = 0;
var detalleOferta=[];
var idDetalleSeleccionado=0;
var idBorraDetalle=0;

$(document).ready(function () {
    $("#formulario_EditaOferta").submit(function (e) {
        e.preventDefault();



        data = {
            id_oferta: ofertas[indiceEdit_oferta].id_oferta,
            nombre: $("#text_nombre_editOferta").val(),
            descipcion: $("#txta_descripcion_editOferta").val(),
            fechaInicio: $("#cal_inicio_editOferta").val(),
            fechaFinaliza: $("#cal_fin_editOferta").val()
        },
                $.ajax({
                    data: {oferta: JSON.stringify(data)}, // le pone nombre al jSOn y convierte la cadena a jSon
                    url: "editar_oferta",
                    type: 'post',

                    beforeSend: function () {
                        $("#modal_EditarOferta").modal("hide");
                        $("#modalCarga").modal('show');
                    },
                    success: function (response) {
                        $("#modalCarga").modal('hide');
                        if (response == 0) {
                            ofertas[indiceEdit_oferta].descipcion = $("#txta_descripcion_editOferta").val();
                            ofertas[indiceEdit_oferta].nombre = $("#text_nombre_editOferta").val();
                            ofertas[indiceEdit_oferta].fechaInicio = $("#cal_inicio_editOferta").val();
                            ofertas[indiceEdit_oferta].fechaFinaliza = $("#cal_fin_editOferta").val();


                            $("#modal_Exito").modal("show");
                            $("#contenedorExito").html("Se a actualizado los datos con exito!")
                            $("#filaOfertaEdit" + ofertas[indiceEdit_oferta].id_oferta).html("<td>" + ofertas[indiceEdit_oferta].id_oferta + "</td>" +
                                    "<td>" + ofertas[indiceEdit_oferta].nombre + "</td>" +
                                    "<td>" + ofertas[indiceEdit_oferta].fechaInicio + "</td>" +
                                    "<td>" + ofertas[indiceEdit_oferta].fechaFinaliza + "</td>" +
                                    "<td>" +
                                    "<span class='btn btn-info glyphicon glyphicon-edit' style='width: 3em; height: 2em;' onclick='abrirModalEdit(" + ofertas[indiceEdit_oferta].id_oferta + ")'></span>	" +
                                    "<span class='btn btn-danger glyphicon glyphicon-remove' style='width: 3em; height: 2em;'  onclick='abrirModalBoarrado(" + ofertas[indiceEdit_oferta].id_oferta + ")'></span>	" +
                                    "<span class='btn btn-warning glyphicon glyphicon-eye-open' style='width: 3em; height: 2em;' onclick='cargaDetalleOferta(" + ofertas[indiceEdit_oferta].id_oferta + ");'></span>" +
                                    "</td>");

                        }
                    }
                });
    });

    $("#formulario_BuscaOferta").submit(function (event) {
        event.preventDefault();//EVITAR QUE EL FORMULARIO SE ENVIE DE MANERA AUTOMATICA

        data = {
            fechaInicio: $("#cal_inicioBusquedaOferta").val(),
            fechaFin: $("#cal_finBusquedaOferta").val()

        },
                $.ajax({
                    data: data, // le pone nombre al jSOn y convierte la cadena a jSon
                    url: "busca_ofertas",
                    type: 'post',

                    beforeSend: function () {
                        $("#modal_buscaOferta").modal("hide");
                        $("#modalCarga").modal('show');
                    },
                    success: function (response) {
                        ofertas = JSON.parse(response);
                        $("#modalCarga").modal("hide");
                        $("#tablaCuerpo_OfertasMuestra").html("");

                        for (var indiceOferta = 0; indiceOferta < ofertas.length; indiceOferta++)
                        {
                            $("#tablaCuerpo_OfertasMuestra").append("<tr id='filaOfertaEdit" + ofertas[indiceOferta].id_oferta + "'>" +
                                    "<td>" + ofertas[indiceOferta].id_oferta + "</td>" +
                                    "<td>" + ofertas[indiceOferta].nombre + "</td>" +
                                    "<td>" + ofertas[indiceOferta].fechaInicio + "</td>" +
                                    "<td>" + ofertas[indiceOferta].fechaFinaliza + "</td>" +
                                    "<td>" +
                                    "<span class='btn btn-info glyphicon glyphicon-edit' style='width: 3em; height: 2em;' onclick='abrirModalEdit(" + ofertas[indiceOferta].id_oferta + ")'></span>	" +
                                    "<span class='btn btn-danger glyphicon glyphicon-remove' style='width: 3em; height: 2em;'  onclick='abrirModalBoarrado(" + ofertas[indiceOferta].id_oferta + ")'></span>	" +
                                    "<span class='btn btn-warning glyphicon glyphicon-eye-open' style='width: 3em; height: 2em;' onclick='cargaDetalleOferta(" + ofertas[indiceOferta].id_oferta + ");'></span>" +
                                    "</td>" +
                                    "</tr>");

                        }
                    }
                });

    });


    $("#option_categoria").change(function () {

        $("#modal_ProcentajeDescuento").modal("show");

    });


    $("#formulario_CreaCatalago").submit(function (event) {
        event.preventDefault();//EVITAR QUE EL FORMULARIO SE ENVIE DE MANERA AUTOMATICA

        var jSon = {
            "nombre": $("#text_nombre_cat").val(),
            "descipcion": $("#txta_descripcion").val(),
            "fechaInicio": $("#cal_inicio").val(),
            "fechaFinaliza": $("#cal_fin").val()
        }


        $.ajax({
            data: {oferta: JSON.stringify(jSon)}, // le pone nombre al jSOn y convierte la cadena a jSon
            url: "crea_oferta",
            type: 'post',

            beforeSend: function () {
                $("#modal_crearOferta").modal("hide");
                $("#modalCarga").modal('show');
            },
            success: function (response) {
                $("#modalCarga").modal("hide");
                var respuesta = JSON.parse(response);
                if (respuesta.resultado == 2)
                {
                    $("#modalCarga").modal('hide');
                    $("#modal_errorFechas").modal("show");
                }

                if (respuesta.resultado == 0) {
                    $("#modal_Exito").modal("show");
                    $("#contenedorExito").html(" Se ha creado la oferta con exito!, ahora seleccione las categorias que van a estar en oferta.");
                    idOferta = respuesta.idOferta;
                    $("#contenedor_panelesCreaOfertaXCategoraia").show('true');
                }
            }
        });
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


    $('#cal_inicioBusquedaOferta').datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });



    $('#cal_finBusquedaOferta').datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });

    $("#cal_fin_editOferta").datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });

    $("#cal_inicio_editOferta").datepicker({
        format: "yyyy-mm-dd",
        viewMode: "years",
        minViewMode: "days",
        autoclose: true,

    });

});
function crearOferta() {
    $("#modal_crearOferta").modal("show");
}

function quitarCategoria(idCat) {

    var indice = 0;

    for (var i = 0; i < categorias_en_oferta.length; i++)
    {
        if (categorias_en_oferta[i].id_cat == idCat)
        {
            indice = i;
        }
    }
    $("#filaCats" + idCat).remove();
    $("#option_categoria").append("<option id='opcion" + categorias_en_oferta[indice].id_cat + "' value='" + categorias_en_oferta[indice].id_cat + "'>" + categorias_en_oferta[indice].categoria + "</option>");
    $('.selectpicker').selectpicker('refresh');

}


function guardaOferta() {
    $("#modal_ProcentajeDescuento").modal("hide");

    idCat = $("#option_categoria option:selected").val();
    nombeCat = $("#option_categoria option:selected").text();

    $("#option_categoria option:selected").remove();

    categorias_en_oferta.push({
        id_cat: idCat,
        idOferta: idOferta,
        categoria: nombeCat,
        pocentaje: $("#Text_porcentajeDescuento").val()
    });
    $('.selectpicker').selectpicker('refresh');

    var i = categorias_en_oferta.length - 1;

    $("#tablaCuerpo_categoriaEnDescuento").append("<tr id='filaCats" + categorias_en_oferta[i].id_cat + "'>" +
            "<td>" + categorias_en_oferta[i].categoria + "</td>" +
            "<td>" + categorias_en_oferta[i].pocentaje + "</td>" +
            "<td><span class='label label-danger' onclick='quitarCategoria(" + categorias_en_oferta[i].id_cat + ")'><em class='glyphicon glyphicon-trash'></em></span></td>" +
            "</tr>");


}


function guardaOfertaDetalle() {


    $.ajax({

        data: {ofertaDetalle: JSON.stringify(categorias_en_oferta)}, // le pone nombre al jSOn y convierte la cadena a jSon
        url: "creaDetalleOferta",
        type: 'post',

        beforeSend: function () {
            $("#modalCarga").modal('show');
        },

        success: function (response) {
            $("#modalCarga").modal("hide");
            if (response == 0)
            {
                $("#modal_Exito").modal("show");
                $("#contenedorExito").html("Se han guardado correctamente.");
            } else {
                $("#modalError").modal("show");
                $("#error_contenedor").html("No se a podido guardar correctamente por favor intente de nuevo");


            }

        }



    });

}

function  modal_ErrorFechasCierra() {
    $("#modal_crearOferta").modal("show");


}

function editarOferta() {
    $("#modal_buscaOferta").modal("show");
    $("#contenedor_panelesCreaOfertaXCategoraia").hide();

}

function abrirModalEdit(id) {
    var indice = 0;
    $("#modal_EditarOferta").modal("show");
    for (var i = 0; i < ofertas.length; i++)
    {
        if (ofertas[i].id_oferta == id)
        {
            indice = i;
        }
    }

    indiceEdit_oferta = indice;


    $("#text_nombre_editOferta").val(ofertas[indice].nombre);
    $("#txta_descripcion_editOferta").val(ofertas[indice].descipcion);
    $("#cal_inicio_editOferta").val(ofertas[indice].fechaInicio);
    $("#cal_fin_editOferta").val(ofertas[indice].fechaFinaliza);



}

function  abrirModalBoarrado(id) {
    idBorrado = id;
    $("#modal_BorraOferta").modal("show");

}

function  borraOferta() {

    data = {id: idBorrado}

    $.ajax({
        data: data, // le pone nombre al jSOn y convierte la cadena a jSon
        url: "elimina_oferta",
        type: 'post',

        beforeSend: function () {
            $("#modal_BorraOferta").modal("hide");
            $("#modalCarga").modal('show');
        },
        success: function (response) {
            $("#modalCarga").modal("hide");
            if (response == "0")
            {
                $("#contenedorExito").html("Se a borrado con exito el registro");
                $("#modal_Exito").modal("show");
                $("#filaOfertaEdit" + idBorrado).remove();
            }
        }
    });


}


function cargaDetalleOferta(idOferta) {
    data = {id: idOferta}

    $.ajax({
        data: data, // le pone nombre al jSOn y convierte la cadena a jSon
        url: "carga_detalleOferta",
        type: 'post',

        beforeSend: function () {
            $("#modal_BorraOferta").modal("hide");
        },
        success: function (response) {
            $("#modalCarga").modal("hide");
            detalleOferta=JSON.parse(response);
            if (detalleOferta.length==0)
            {
                $("#modal_Exito").modal("show");
                $("#contenedorExito").html("Esta Oferta no contiene ofertas");
            }
            $("#tablaCuerpo_CategoriasDelaOferta").html("");
            

            for(var i=0; i<detalleOferta.length; i++)
            {
                $("#tablaCuerpo_CategoriasDelaOferta").append("<tr id='filaDetalleOferta"+detalleOferta[i].idDetalle+"'>"+
                                                                "<td>"+detalleOferta[i].categoria+"</td>"+
                                                                "<td id='porcentajeDet"+detalleOferta[i].idDetalle+"'>"+detalleOferta[i].pocentaje+"</td>"+
                                                                "<td>"+
                                                                    "<span class='btn btn-info glyphicon glyphicon-edit' style='width: 3em; height: 2em;' onclick='modificaDetalleOferta(" + detalleOferta[i].idDetalle + ");'></span>	" +
                                                                    "<span class='btn btn-danger glyphicon glyphicon-remove' style='width: 3em; height: 2em;'  onclick='abrirModalBoarradoDetalleOferta(" + detalleOferta[i].idDetalle + ");'></span>	" +
                                                                "</td>"+
                                                               "</tr>");
            }
        }
    });
}


function  modificaDetalleOferta(id){
    var indice=0;
    for(var i=0; i<detalleOferta.length; i++)
    {
        if(detalleOferta[i].idDetalle==id)
        {
            indice=i;
        }
    }

    idDetalleSeleccionado=detalleOferta[indice].idDetalle;
    
    $("#modal_EditProcentajeDescuento").modal("show");
    $("#Text_EditPorcentajeDescuento").val(detalleOferta[indice].pocentaje);
}


function EditaDetalleOferta(){
        
        data={
            id:         idDetalleSeleccionado,
            porcentaje: $("#Text_EditPorcentajeDescuento").val()
        }
        
    
        $.ajax({
        data: data, // le pone nombre al jSOn y convierte la cadena a jSon
        url: "edita_DetealleOferta",
        type: 'post',

        beforeSend: function () {
            $("#modal_EditProcentajeDescuento").modal("hide");
            $("#modalCarga").modal('show');
        },
        success: function (response) {
            $("#modalCarga").modal("hide");
            if (response == "0")
            {
                
                $("#contenedorExito").html("Se a actualizado el registro con exito.");
                $("#modal_Exito").modal("show");
                $("#porcentajeDet"+idDetalleSeleccionado).html($("#Text_EditPorcentajeDescuento").val());
                
            }
            
        }
    });
    
}

function  abrirModalBoarradoDetalleOferta(id){
    $("#modal_BorraDetalleOferta").modal("show");
    idBorraDetalle=id;
}

function  borraDetalleOferta(){
    
        data={
            id:         idBorraDetalle
        }
        
    
        $.ajax({
        data: data, // le pone nombre al jSOn y convierte la cadena a jSon
        url: "borra_DetealleOferta",
        type: 'post',

        beforeSend: function () {
            $("#modal_BorraDetalleOferta").modal("hide");
            $("#modalCarga").modal('show');
        },
        success: function (response) {
            $("#modalCarga").modal("hide");
           
            if (response == "0")
            {
                
                $("#contenedorExito").html("Se a borrado  el detalle con exito.");
                $("#modal_Exito").modal("show");
                $("#filaDetalleOferta"+idBorraDetalle).remove();
                
            }
        }
    });
    
}