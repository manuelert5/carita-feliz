<%-- 
    Document   : manjaOfertas
    Created on : 1/11/2017, 01:40:32 AM
    Author     : Manuelert5-Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
<%@page import="elementos_sistemas.categoria"%>
<%@page import="java.util.ArrayList"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src='js/jquery-3.2.1.min.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src="js/bootstrap-datepicker2.js"></script>
        <script src="bootstrapSelect/js/bootstrap-select.js"></script>
        <script src="js/ofertas.js"></script>

        <link rel='stylesheet' href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animacion_carga.css">
        <link rel='stylesheet' href="css/menuLateral.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker2.css">
        <link rel="stylesheet" href="bootstrapSelect/css/bootstrap-select.min.css">

        <style>

            .btn-label {position: relative;left: -12px;display: inline-block;padding: 6px 12px;background: rgba(0,0,0,0.15);border-radius: 3px 0 0 3px;}
            .btn-labeled {padding-top: 0;padding-bottom: 0;}
            .btn { margin-bottom:10px; }


            .item_activo{
                background: #ccc;
            }



        </style>

    </head>
    <body>





        <div class="left" id="bararLetral">

            <div class="item" onclick="crearOferta();"  id="item_crea">
                <span class="glyphicon glyphicon-plus"></span>
                Crear Oferta
            </div>
            <div class="item" onclick="editarOferta();" id="item_modifica">
                <span class="glyphicon glyphicon-edit" ></span>
                Modificar Oferta
            </div>
        </div>        

        <div class="modal fade" id="modal_crearOferta">
            <div class="modal-dialog modal-lg">
                <div class="modal-body">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Crear Oferta por categoria
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario_CreaCatalago" role="form" >

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Nombre<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_nombre_cat" type="text"  class="form-control input-md" required placeholder="">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-4 control-label"  style="text-align: left">Descripción<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <textarea id='txta_descripcion' rows="3" class="form-control"></textarea>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Fecha inicio<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_inicio" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left"> Fecha fin<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_fin" required>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>

                                    <div class="col-md-6">
                                        <button id="Boton_guardar" name="save"  type="submit"class="btn btn-success"  >Guardar</button>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>


                </div>

            </div>
        </div>

        <div class="modal fade" id="modal_EditarOferta">
            <div class="modal-dialog modal-lg">
                <div class="modal-body">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Modificar Oferta por categoria
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario_EditaOferta" role="form" >

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Nombre<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_nombre_editOferta" type="text"  class="form-control input-md" required placeholder="">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-4 control-label"  style="text-align: left">Descripción<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <textarea id='txta_descripcion_editOferta' rows="3" class="form-control"></textarea>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Fecha inicio<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_inicio_editOferta" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left"> Fecha fin<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_fin_editOferta" required>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>

                                    <div class="col-md-6">
                                        <button id="Boton_guardar" name="save"  type="submit"class="btn btn-success"  >Guardar</button>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>


                </div>

            </div>
        </div>


        <div class="container" id='contenedor_panelesCreaOfertaXCategoraia' style="display: none"><!--container de todos los paneles-->


            <div class="col-sm-11 col-xs-10 col-md-12 col-lg-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Oferta
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-1"></div>
                                <label class="control-label" >Nombre oferta:</label> <span>sadsa</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-sm-11 col-xs-10 col-md-12 col-lg-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Categorias
                        </div>
                        <div class="panel-body">


                            <div class="row">
                                <div class="col-sm-6 col-xs-12" role="form" >

                                    <label class="col-md-3 control-label col-xs-12" style="text-align: left">Categoria<font color="FF9100">*</font></label> 
                                    <div class="col-md-9 col-xs-12">

                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <select class="selectpicker form-control" id="option_categoria"  data-live-search="true" data-size="5" >
                                                    <option></option>
                                                    <%                                                        for (int i = 0; i < cat.size(); i++) {
                                                            out.print("<option id='opcion" + cat.get(i).getId_categoria() + "' value='" + cat.get(i).getId_categoria() + "'>" + cat.get(i).getCaetegoria() + "</option>");
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>    


                                        </select>
                                    </div>                                

                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-12" role="form"  id="catSelect">

                                <table class="table table-striped table-bordered table-list">
                                    <thead>
                                        <tr>
                                            <th>Categoria</th>
                                            <th><em class="glyphicon glyphicon-tag"></em> Descuento</th>
                                            <th><em class="glyphicon glyphicon-wrench" style='width: 4em;'></em></th>
                                        </tr> 
                                    </thead>
                                    <tbody id="tablaCuerpo_categoriaEnDescuento">


                                    </tbody>
                                </table>


                            </div>
                        </div>
                        <div class="panel-footer" style="text-align: right">
                            <button class="btn btn-success" onclick="guardaOfertaDetalle();">Guardar</button>
                        </div>
                    </div>
                </div>
            </div> 

        </div>


        <div class="container" id='contenedor_panelesEditaOfertas' ><!--container de todos los paneles-->


            <div class="col-sm-11 col-xs-10 col-md-12 col-lg-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <em class="glyphicon glyphicon-search"></em> Ofertas
                        </div>

                        <div class="panel-body">

                            <table class="table table-striped table-bordered table-list">
                                <thead>
                                    <tr>
                                        <th style='width: 3em;'>Id</th>
                                        <th><em class="glyphicon glyphicon-tag"></em>Oferta</th>
                                        <th><em class="glyphicon glyphicon-calendar"></em> Fecha Inicio</th>
                                        <th><em class="glyphicon glyphicon-calendar"></em> Fecha Fin</th>
                                        <th><em class="glyphicon glyphicon-wrench"></em> Acciones</th>
                                    </tr> 
                                </thead>
                                <tbody id="tablaCuerpo_OfertasMuestra">


                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="container" id='contenedor_panelesEditaCategoriasXoferta' ><!--container de todos los paneles-->


            <div class="col-sm-11 col-xs-10 col-md-12 col-lg-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <em class="glyphicon glyphicon-search"></em> Categorias en oferta
                        </div>

                        <div class="panel-body">

                            <table class="table table-striped table-bordered table-list">
                                <thead>
                                    <tr>
                                        <th><em class="glyphicon glyphicon-tag"></em>Categoria</th>
                                        <th><em ></em>% Descuento</th>                                        
                                        <th><em class="glyphicon glyphicon-wrench"></em> Acciones</th>
                                    </tr> 
                                </thead>
                                <tbody id="tablaCuerpo_CategoriasDelaOferta">


                                </tbody>
                            </table>

                        </div>
                    </div>
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


        <!-- Modal -->
        <div id="modal_ProcentajeDescuento" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Ingrese el porcentaje de descuento de que tendra la categoria</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group row">
                            <label class="col-md-6 control-label" >Porcentaje descuento<font color="FF9100">*</font></label>  
                            <div class="col-md-6">
                                <input id="Text_porcentajeDescuento" type="text"  class="form-control input-md" required>

                            </div>

                        </div>
                        <hr>
                        <div style="text-align:right;">
                            <button type="button" class="btn btn-success" onclick="guardaOferta()">Guardar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade"id="modal_errorFechas">
            <div class="modal-dialog">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="modal" onclick="modal_ErrorFechasCierra();">&times;</button>
                    <em class="glyphicon glyphicon-exclamation-sign"></em><strong style="font-size: medium">  Ha ocurrido un error!</strong>  Ya hay ofertas en ese rango de fechas!
                </div>
            </div>
        </div>

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



        <div class="modal fade" id="modal_buscaOferta">
            <div class="modal-dialog">
                <div class="modal-body">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <em class="glyphicon glyphicon-search"></em>  Buscar Oferta
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario_BuscaOferta" role="form" >

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Fecha inicio<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_inicioBusquedaOferta" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left"> Fecha fin<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_finBusquedaOferta" required>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>

                                    <div class="col-md-6">
                                        <button  name="save"  type="submit"class="btn btn-info"  > <em class="glyphicon glyphicon-search"></em>  Buscar </button>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>


                </div>

            </div>
        </div>

        <div class="modal fade" role="dialog" id="modal_BorraOferta">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-body">
                        <strong><h2>Desea elminar la oferta</h2></strong>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" onclick="borraOferta();">Si</button>
                        <button class="btn btn-danger" class="close" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>        

        <div id="modal_EditProcentajeDescuento" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Ingrese el porcentaje de descuento de que tendra la categoria</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group row">
                            <label class="col-md-6 control-label">Porcentaje descuento<font color="FF9100">*</font></label>  
                            <div class="col-md-6">
                                <input id="Text_EditPorcentajeDescuento" class="form-control input-md" required="" type="text">

                            </div>

                        </div>
                        <hr>
                        <div style="text-align:right;">
                            <button type="button" class="btn btn-success" onclick="EditaDetalleOferta();">Guardar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" role="dialog" id="modal_BorraDetalleOferta">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-body">
                        <strong><h2>Desea elminar el detalle de la oferta</h2></strong>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" onclick="borraDetalleOferta();">Si</button>
                        <button class="btn btn-danger" class="close" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>        


    </body>
</html>
