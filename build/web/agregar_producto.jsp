<%@page import="BD.procesos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="elementos_sistemas.categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<categoria> cat = new ArrayList();
    procesos data = new procesos();
    try {
        data.crea_conexion();
        ResultSet rs = data.llama_funcion("retorna_categoria", "");
        while (rs.next()) {
            cat.add(new categoria(rs.getInt("id_categoria"),
                    rs.getString("categoraia")));
        }

    } catch (Exception e) {
        out.print(e);
    } finally {
        data.cierra_conexion();
    }


%>


<html>
    <head>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker2.js"></script>
        <script src="bootstrapSelect/js/bootstrap-select.js"></script>




        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/bootstrap.min.css">    
        <link rel="stylesheet" href="css/miEstilo.css">
        <link rel="stylesheet" href="css/animacion_carga.css">      


        <!-- Bootstrap CSS Toolkit styles -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
        <!-- Generic page styles -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Bootstrap styles for responsive website layout, supporting different screen sizes -->
        <!--<link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-responsive.min.css">-->
        <!-- Bootstrap CSS fixes for IE6 -->
        <!--[if lt IE 7]><link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-ie6.min.css"><![endif]-->
        <!-- Bootstrap Image Gallery styles -->
        <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
        <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
        <link rel="stylesheet" href="css/jquery.fileupload-ui.css">
        <!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
        <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->







        <link rel="stylesheet" href="css/bootstrap-datepicker2.css">
        <link rel="stylesheet" href="bootstrapSelect/css/bootstrap-select.min.css">




        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">






        <script>

            var catSelect = 0;

            $(document).ready(function () {


                $("#option_categoria").change(function () {//para cuando un administrador va a ingresar usuario, si es un afiliado va a necesitar un id para su socio... 
                    ///con esto si selecciona que registrara un afiliado escondera o mostrara en funcion del rol del usuario que creara

                    catSelect = $("#option_categoria option:selected").val();//si el rol seleccionado es afiliado

                });



                $("#cal_ingreso").datepicker({
                    format: "yyyy-mm-dd",
                    viewMode: "years",
                    minViewMode: "days",
                    autoclose: true,

                });
                $("#cal_expiracion").datepicker({
                    format: "yyyy-mm-dd",
                    viewMode: "years",
                    minViewMode: "days",
                    autoclose: true,

                });


                $("#formulario").submit(function (e) {


                    e.preventDefault();
                    var data = {
                        "Text_nombre_prodcuto": $("#Text_nombre_producto").val(),
                        "Text_descripcion": $("#Text_descripcion").val(),
                        "Text_lote": $("#Text_lote").val(),
                        "Text_cantidad_lote": $("#Text_cantidad_lote").val(),
                        "Text_cod_barras": $("#Text_cod_barras").val(),
                        "Text_costo": $("#Text_costo").val(),
                        "Text_peso": $("#Text_peso").val(),
                        "Text_precio_socio": $("#Text_precio_socio").val(),
                        "Text_precio_afiliado": $("#Text_precio_afiliado").val(),
                        "select_categoria": catSelect,
                        "Text_fecha_ingreso": $("#cal_ingreso").val(),
                        "Text_fecha_expiracion": $("#cal_expiracion").val()

                    };


                    $.ajax({
                        data: data,
                        url: 'crea_producto',
                        type: 'post',
                        beforeSend: function () {
                            $("#modalCarga").modal("show");

                        },
                        success: function (response) {
                            $("#modalCarga").modal("hide");
                            if (response == "0")
                            {
                                $("#modal_Exito").modal("show");
                                $("#contenedorExito").html("Se ha creado exitosamente el registro");

                            } else {
                               $("#modal_error").modal("show");
                            }
                        }
                    });
                });
                return  false;
            });


        </script>




        <title>JSP Page</title>
    </head>
    <body>

        <div>
            <form class="form-horizontal" id="formulario" role="form" >
                <fieldset>

                    <div id="cont"></div>


                    <legend>Ingresar Producto</legend>

                    <div class="alert alert-danger  center-block clearfix" id="alerta" style='display:none;'><!--contenedor de la alertta-->
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <span id="alerta_correo" style='display:none;'><strong>Alerta: </strong>El correo eletronico ya esta registrado! </span>
                        <span id="alerta_password" style='display:none;'><strong>Alerta: </strong>Las contraseñas no son iguales! </span>

                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label">Nombre Producto<font color="FF9100">*</font></label> 
                        <div class="col-md-4">
                            <input id="Text_nombre_producto" type="text"  class="form-control input-md" required placeholder="">

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">Descripcion<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input id="Text_descripcion" type="text"  class="form-control input-md" required >

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="city">Numero de lote<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input id="Text_lote" name="city" type="text" class="form-control input-md" required="">

                        </div>
                    </div>



                    <div class="form-group">
                        <label class="col-md-4 control-label">Cantidad Producto del Lote<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input id="Text_cantidad_lote" type="text"  class="form-control input-md" required placeholder="">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="phone">Codigo De Barras<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input id="Text_cod_barras" name="phone" type="text"  class="form-control input-md" required placeholder="">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="address1">Costo Unidad<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input id="Text_costo" name="address1" type="text"  placeholder=""  class="form-control input-md" required="">

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="email">Peso<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input id="Text_peso"  type="text" placeholder="" class="form-control input-md" required >
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="password">Precio Socio<font color="FF9100">*</font></label>
                        <div class="col-md-4">
                            <input id="Text_precio_socio"  type="text"  class="form-control input-md" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="rpassword">Precio Afiliado<font color="FF9100">*</font> 
                        </label>
                        <div class="col-md-4">
                            <input id="Text_precio_afiliado"  type="text"  class="form-control input-md" required="">

                        </div>
                    </div>




                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Categoria<font color="FF9100">*</font></label>
                        <div class="col-md-4">
                            <select class="selectpicker form-control" id="option_categoria"  required data-live-search="true" data-size="5" >
                                <option></option>
                                <%                                                        for (int i = 0; i < cat.size(); i++) {
                                        out.print("<option id='opcion" + cat.get(i).getId_categoria() + "' value='" + cat.get(i).getId_categoria() + "'>" + cat.get(i).getCaetegoria() + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="address1">Fecha de Ingreso<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input class="form-control input-md" id="cal_ingreso" required="" type="text">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="address1">Fecha de Expiracion<font color="FF9100">*</font></label>  
                        <div class="col-md-4">
                            <input class="form-control input-md" id="cal_expiracion" required="" type="text">
                        </div>

                    </div>

                    <div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="save"></label>
                        <div class="col-md-8">
                            <button id="Boton_guardar" type="submit" name="save" class="btn btn-success">Guardar</button>
                            <input type="button" id="Boton_cancelar" name="save" class="btn btn-danger" value="Cancelar"  ></input>


                        </div>
                    </div>
                </fieldset>
            </form>     





            <div class="modal fade"id="modal_Exito">
                <div class="modal-dialog">
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <em class="glyphicon glyphicon-exclamation-sign"></em><strong style="font-size: medium">  </strong>  <span id="contenedorExito"></span>
                    </div>
                </div>
            </div>

            <div class="modal fade"id="modal_error">
                <div class="modal-dialog">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="modal" onclick="modal_ErrorFechasCierra();">&times;</button>
                        <em class="glyphicon glyphicon-exclamation-sign"></em><strong style="font-size: medium">  Ha ocurrido un error!</strong>  <span id="error_contenedor"> </span>
                    </div>
                </div>
            </div>



            <!--modal qeu se motrara mientras carga-->
            <div class="modal fade bd-example-modal-sm" id="modalCarga">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div id='fountainG'>
                                <div id='fountainG_1' class='fountainG'></div>
                                <div id='fountainG_2' class='fountainG'></div>
                                <div id='fountainG_3' class='fountainG'></div>
                                <div id='fountainG_4' class='fountainG'></div>
                                <div id='fountainG_5' class='fountainG'></div>
                                <div id='fountainG_6' class='fountainG'></div>
                                <div id='fountainG_7' class='fountainG'></div>
                                <div id='fountainG_8' class='fountainG'></div>
                            </div>	
                        </div>
                    </div>
                </div>
            </div>






            <script src="js/vendor/jquery.ui.widget.js"></script>
            <!-- The Templates plugin is included to render the upload/download listings -->
            <script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
            <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
            <script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
            <!-- The Canvas to Blob plugin is included for image resizing functionality -->
            <script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>

            <script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
            <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
            <script src="js/jquery.iframe-transport.js"></script>
            <!-- The basic File Upload plugin -->
            <script src="js/jquery.fileupload.js"></script>
            <!-- The File Upload file processing plugin -->
            <script src="js/jquery.fileupload-fp.js"></script>
            <!-- The File Upload user interface plugin -->
            <script src="js/jquery.fileupload-ui.js"></script>
            <!-- The localization script -->
            <script src="js/locale.js"></script>
            <!-- The main application script -->
            <script src="js/main.js"></script>
            <!-- The XDomainRequest Transport is included for cross-domain file deletion for IE8+ -->
            <!--[if gte IE 8]><script src="js/cors/jquery.xdr-transport.js"></script><![endif]-->

    </body>
</html>
