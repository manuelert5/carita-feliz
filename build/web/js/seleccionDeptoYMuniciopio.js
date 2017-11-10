/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {

    $("#option_depto").change(function () {

        var data = {
            idDepto: $("#option_depto option:selected").val()
        };


        $.ajax({
            data: data,
            url: 'retornaMunicipios',
            type: 'post',
            beforeSend: function () {
                $("#modalCarga").modal("show");

            },
            success: function (response) {
                jSon = JSON.parse(response);
                $("#modalCarga").modal("hide");
                $("#option_municipio").html("");
                for (var i = 0; i < jSon.length; i++)
                {
                    $("#option_municipio").append("<option value='" + jSon[i].id + "'>" + jSon[i].municipio + "</option>");
                }
                $('.selectpicker').selectpicker('refresh');




            }


        });


    });

});
