<%-- 
    Document   : manejoCatalago
    Created on : 24/10/2017, 12:43:26 AM
    Author     : Manuelert5-Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="elementos_sistemas.categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker2.js"></script>
        <script src="bootstrapSelect/js/bootstrap-select.min.js"></script>
        <script src="js/catalago.js"></script>


        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-datepicker2.css" rel="stylesheet">
        <link href="bootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/animacion_carga.css">
        <link rel='stylesheet' href="css/menuLateral.css">



        <title>JSP Page</title>
    </head>


    <body>
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


        
        <div class="container">
            <div class="row">

                <div class="col-sm-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Crear catalogo
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="formulario" role="form" >

                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: left">Nombre<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_nombre_cat" type="text"  class="form-control input-md" required placeholder="">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-4 control-label"  style="text-align: left">Número de paginas<font color="FF9100">*</font></label> 
                                    <div class="col-md-7">
                                        <input id="text_paginas" type="text"  class="form-control input-md" required placeholder="">
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
                                        <button id="Boton_guardar" name="save" class="btn btn-success" onclick="guardaCatalogo();" >Guardar</button>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>


                <div class="col-sm-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Administracion Catalago Creado
                        </div>
                        <div class="panel-body">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="form-horizontal" id="formulario" role="form" >

                                        <div class="form-group">
                                            <label class="col-md-1 control-label" style="text-align: left">Pagina<font color="FF9100">*</font></label> 
                                            <div class="col-md-4">
                                                <select id="select_pag" class="form-control">
                                                </select>
                                            </div>


                                            <div class="col-md-7">
                                                <div class="input-group">
                                                    <div class="input-group-btn search-panel">
                                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                            <span id="search_concept">Filtar producto</span> <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li><a href="#" onclick="cambioBusqueda('id');">Id</a></li>
                                                            <li><a href="#" onclick="cambioBusqueda('nombre');">Nombre</a></li>


                                                        </ul>
                                                    </div>
                                                    <input type="hidden" name="search_param" value="all" id="search_param">         
                                                    <input type="text" class="form-control" name="x" placeholder="Buscar producto" id="text_busqueda">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button" onclick="buscarProducto();"><span class="glyphicon glyphicon-search"></span></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-horizontal" id="formulario" role="form" >

                                    <label class="col-md-2 control-label" style="text-align: left">Categoria<font color="FF9100">*</font></label> 
                                    <div class="col-md-4">
                                        <select id="option_categoria" class="selectpicker" data-live-search="true" data-size="5" >
                                            <option selected value="0">Cualquiera</option>

                                            <%                                                
                                                for (int i = 0; i < cat.size(); i++) {
                                                    out.print("<option value='" + cat.get(i).getId_categoria() + "'>" + cat.get(i).getCaetegoria() + "</option>");
                                                }
                                            %>

                                        </select>
                                    </div>                                

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--FINALIZA FILA-->

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
                                                <th >Id</th>
                                                <th>Nombre</th>
                                                <th>Categoria</th>
                                                <th><em class="glyphicon glyphicon-wrench"></em></th>
                                            </tr> 
                                        </thead>
                                        <tbody id="tablaCuerpo_producto">
                                            <tr>

                                                <td class="hidden-xs">1</td>
                                                <td>---</td>
                                                <td>---</td>
                                                <td align="center">
                                                    <a class="btn btn-info" ><em class="glyphicon glyphicon-arrow-right" ></em></a>
                                                </td>                                              
                                            </tr>
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
                            Productos del catalago
                        </div>

                        <div class="panel-body">
                            <div class="panel panel-default panel-table">
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-list">
                                        <thead>
                                            <tr>
                                                <th><em class="glyphicon glyphicon-wrench"></em></th>
                                                <th class="hidden-xs">Id</th>
                                                <th>Nombre</th>
                                                <th>Categoria</th>
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

    </body>
</html>
