<%-- 
    Document   : catalagos
    Created on : 29/10/2017, 06:04:41 PM
    Author     : Manuelert5-Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
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
        <title>TODO supply a title</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker2.js"></script>
        <script src="bootstrapSelect/js/bootstrap-select.min.js"></script>
        <script src="js/catalago.js"></script>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="css/bootstrap-datepicker2.css" rel="stylesheet">
        <link href="bootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/animacion_carga.css">
        <style>

            .container{
                z-index: 2;/*nivel de superposision*/
            }
            .left, .right {
                float:left;
                height:100vh;
                cursor: pointer;
            }

            .left {
                background: #337ab7;
                display: inline-block;
                white-space: nowrap;
                width: 45px;
                transition: width 1s ;
                z-index: 1;/*nivel de superposicion*/
            }

            .right {
                background: #fff;
                width: 350px;
                transition: width 1s;
                border-style:solid;
                border-color:#ccc;
                border-width:1px;
            }    

            .left:hover {
                width: 190px;/*anchura cuando pasa el cursor */
            }    

            .item:hover {
                background-color:#ccc;
            }

            .left .glyphicon {
                margin:15px;
                width:20px;
                color:#fff;
            }

            .right .glyphicon {
                color:#a9a9a9;
            }
            span.glyphicon.glyphicon-refresh{
                font-size:17px;
                vertical-align: middle !important;
            }

            .item {
                height:50px;
                overflow:hidden;
                color:#fff;
            }

            @media (max-width: 992px) { 
                .left:hover {
                    width: 45px;/*evitar que se expanda en modo telefono*/
                }  
                .categoria{
                    display: none;
                }

            }
            /* Large devices (desktops, 992px and up)*/
            @media (min-width: 992px) { 
                .left{

                    position:absolute;left:0%;   
                }
            }

            /* Extra large devices (large desktops, 1200px and up)*/
            @media (min-width: 1200px) {

                .left{

                    position:absolute;left:0%;   
                }

            }

            /* Medium devices (tablets, 768px and up)*/
            @media (min-width: 768px) { 
                .left{

                    position:absolute;left:0%;   
                }

            }


            .panel{
                margin-left: 1em;

            }
            .panel-table{
                margin-left: 0px;
            }
            .panel-table .panel-body{
                padding:0;
            }

            .panel-table .panel-body .table-bordered{
                border-style: none;
                margin:0;
            }

            .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
                text-align:center;
                width: 100px;
            }

            .panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
            .panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
                border-right: 0px;
            }

            .panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
            .panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
                border-left: 0px;
            }

            .panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
                border-bottom: 0px;
            }

            .panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
                border-top: 0px;
            }

            .panel-table .panel-footer .pagination{
                margin:0; 
            }

            /*
            used to vertically center elements, may need modification if you're not using default sizes.
            */
            .panel-table .panel-footer .col{
                line-height: 34px;
                height: 34px;
            }

            .panel-table .panel-heading .col h3{
                line-height: 30px;
                height: 30px;
            }

            .panel-table .panel-body .table-bordered > tbody > tr > td{
                line-height: 34px;
            }

            .item_activo{
                background: #ccc;
            }


        </style>


    </head>
    <body>

        <div class="left" id="bararLetral">

            <div class="item" onclick="llama_modalCreaCat();"  id="item_crea">
                <span class="glyphicon glyphicon-plus"></span>
                Crear Catalago
            </div>
            <div class="item" onclick="editarCatalago();" id="item_modifica">
                <span class="glyphicon glyphicon-edit" ></span>
                Modificar Catalago
            </div>

            <div class="item" id='item_sube' >
                <span class="glyphicon glyphicon-cloud-upload"></span>
                Subir Imagenes
            </div> 


        </div>

        <div class="container" style="display: none;"id='contenedor_panelesModificaCat'><!--container de todos los paneles-->
            <div class="col-sm-11 col-xs-10 col-md-12 col-lg-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Catalagos

                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 3em;">Id</th>
                                        <th style="width: 10em;">Nombre</th>
                                        <th >Paginas</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Fin</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tabla_cuerpoEditCat">


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> 
        </div>

        <div class="container" id='contenedor_panelesCreaCat' style="display: none"><!--container de todos los paneles-->


            <div class="col-sm-11 col-xs-10 col-md-12 col-lg-12">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Busqueda productos
                        </div>
                        <div class="panel-body">

                            <div class="col-sm-6 col-xs-12">
                                <div class="row">
                                    <div class="form-horizontal" id="formulario" role="form" >

                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <div class="input-group-btn search-panel" >
                                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                            <span id="search_concept">Filtar</span> <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li><a href="#" onclick="cambioBusqueda('id');">Id</a></li>
                                                            <li><a href="#" onclick="cambioBusqueda('nombre');">Nombre</a></li>


                                                        </ul>
                                                    </div>
                                                    <input type="hidden" name="search_param" value="all" id="search_param" style="z-index: 2;">         
                                                    <input type="text" class="form-control"  style="z-index: inherit !important;" placeholder="Buscar producto" id="text_busqueda">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button" onclick="buscarProducto();"><span class="glyphicon glyphicon-search"></span></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-6 col-xs-12 col-sm-12" id="formulario" role="form" >

                                <label class="col-md-3 control-label col-xs-12" style="text-align: left">Categoria<font color="FF9100">*</font></label> 
                                <div class="col-md-9 col-xs-12">

                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <select class="selectpicker form-control" id="option_categoria"  data-live-search="true" data-size="5" >
                                                <option value='0'>Cualquiera</option>
                                                <%                                                for (int i = 0; i < cat.size(); i++) {
                                                        out.print("<option value='" + cat.get(i).getId_categoria() + "'>" + cat.get(i).getCaetegoria() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>    


                                    </select>
                                </div>                                

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="row"><!--INICIA FILA DE PRODUCTOS EN EL CATALAGO-->

                        <div class="col-sm-6">
                            <div class="panel panel-primary">

                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-search">  </span>   Produtos



                                </div>

                                <div class="panel panel-body">

                                    <div class="panel panel-default panel-table">
                                        <div class="panel-body">
                                            <table class="table table-striped table-bordered table-list">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 3em;">Id</th>
                                                        <th>Nombre</th>
                                                        <th class="categoria">Categoria</th>
                                                        <th><em class="glyphicon glyphicon-wrench" style='width: 4em;'></em></th>
                                                    </tr> 
                                                </thead>
                                                <tbody id="tablaCuerpo_producto">


                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col col-xs-4">Page 1 of 5
                                                </div>
                                                <div class="col col-xs-8">
                                                    <ul class="pagination hidden-xs pull-right">
                                                        <li><a href="#">1</a></li>
                                                        <li><a href="#">2</a></li>
                                                        <li><a href="#">3</a></li>
                                                        <li><a href="#">4</a></li>
                                                        <li><a href="#">5</a></li>
                                                    </ul>
                                                    <ul class="pagination visible-xs pull-right">
                                                        <li><a href="#">«</a></li>
                                                        <li><a href="#">»</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    Productos en el catalago
                                </div>

                                <div class="panel-body">
                                    <div class="panel panel-default panel-table">
                                        <div class="panel-body">
                                            <table class="table table-striped table-bordered table-list">
                                                <thead>
                                                    <tr>
                                                        <th><em class="glyphicon glyphicon-wrench"style='width: 4em;'></em></th>
                                                        <th class="hidden-xs" style="width: 3em;">Id</th>
                                                        <th>Nombre</th>
                                                        <th class="categoria">Categoria</th>
                                                        <th>#</th>
                                                    </tr> 
                                                </thead>
                                                <tbody id="tcc">

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col col-xs-4">Page 1 of 5
                                                </div>
                                                <div class="col col-xs-8">
                                                    <ul class="pagination hidden-xs pull-right">
                                                        <li><a href="#">1</a></li>
                                                        <li><a href="#">2</a></li>
                                                        <li><a href="#">3</a></li>
                                                        <li><a href="#">4</a></li>
                                                        <li><a href="#">5</a></li>
                                                    </ul>
                                                    <ul class="pagination visible-xs pull-right">
                                                        <li><a href="#">«</a></li>
                                                        <li><a href="#">»</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>



                                </div>
                                <div class="panel-footer">
                                    <button class="btn btn-success" onclick="guardaDbDetallecat();">Guardar </button>
                                </div> 


                            </div>
                        </div>

                    </div>

                </div>
            </div>



        </div><!---Fin container todos los paneles-->

        <div class="modal fade" id="modal_crearCatalago">
            <div class="modal-dialog">
                <div class="modal-body">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Crear catalogo
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
                                    <label class="col-md-4 control-label"  style="text-align: left">Número de paginas<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_paginas" type="text"  class="form-control input-md" required placeholder="" pattern="^(?:\+|-)?\d+$">
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


        <div class="modal fade" id="modal_buscaCatalago">
            <div class="modal-dialog">
                <div class="modal-body">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <em class="glyphicon glyphicon-search"></em>  Buscar Catalago
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario_BuscaCatalago" role="form" >

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Fecha inicio<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_inicioBusquedaEdit" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left"> Fecha fin<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_finBusquedaModEdit" required>
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


        <div class="modal fade" id="modal_EditaCatalago">
            <div class="modal-dialog">
                <div class="modal-body">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Editar Catalogo
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario_EditaCatalago" role="form" >

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Nombre<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_nombre_EditCat" type="text"  class="form-control input-md" required placeholder="">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-4 control-label"  style="text-align: left">Número de paginas<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_Editpaginas" type="text"  class="form-control input-md" required placeholder="" pattern="^(?:\+|-)?\d+$">
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Fecha inicio<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_EditInicio" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left"> Fecha fin<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input  type="text"  class="form-control input-md" id="cal_EditFin" required>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>

                                    <div class="col-md-6">
                                        <button id="Boton_guardar" name="save"  type="submit"class="btn btn-success"  >Guardar Cambios</button>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>


                </div>

            </div>
        </div>




        <div class="modal fade"id="moda_error">
            <div class="modal-dialog">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="modal" onclick="modal_ErrorCierra();">&times;</button>
                    <em class="glyphicon glyphicon-exclamation-sign"></em><strong style="font-size: medium">  Ha ocurrido un error!</strong>  <span id="contenedorError"></span>
                </div>
            </div>
        </div>
        <div class="modal fade"id="moda_error2">
            <div class="modal-dialog">
                <div class="alert alert-warning">
                    <button type="button" class="close" data-dismiss="modal" onclick="modal_ErrorCierra2();">&times;</button>
                    <em class="glyphicon glyphicon-exclamation-sign"></em><strong style="font-size: medium">  Ha ocurrido un error!</strong>  <span id="contenedorError2"></span>
                </div>
            </div>
        </div>

        <div class="modal fade"id="moda_error3">
            <div class="modal-dialog">
                <div class="alert alert-warning">
                    <button type="button" class="close" data-dismiss="modal" onclick="modal_ErrorCierra3();">&times;</button>
                    <em class="glyphicon glyphicon-exclamation-sign"></em><strong style="font-size: medium">  Ha ocurrido un error!</strong>  <span id="contenedorError3"></span>
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
        <div id="modal_seleccionPagina" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Selecciones la pagina en la que aparecera el producto</h4>
                    </div>
                    <div class="modal-body">



                        <div class="form-group">
                            <label class="col-md-6 control-label" for="selectbasic">Pagina<font color="FF9100">*</font></label>
                            <div class="col-md-6">
                                <select id="select_pag" class="form-control">
                                </select>
                            </div>
                        </div><br>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" onclick="moverAcatalogo();" >Poner en el catalago</button>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" role="dialog" id="modal_BorrarCat">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-body">
                        <strong><h2>Desea elminar el catalago</h2></strong>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" onclick="borraModal();">Si</button>
                        <button class="btn btn-danger" class="close" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
