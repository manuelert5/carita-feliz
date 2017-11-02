<%-- 
    Document   : subadaImagenesCatalago
    Created on : 27/10/2017, 02:27:19 AM
    Author     : Manuelert5-Acer
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
<%@page import="elementos_sistemas.paginaCatalago"%>
<%@page import="java.util.ArrayList"%>
<%
    int idCatalago = 15;

    ArrayList<paginaCatalago> pagina = new ArrayList();
    procesos data = new procesos();
    try {
        data.crea_conexion();
        ResultSet rs = data.llama_funcion("retornaPagnasCatalago", Integer.toString(idCatalago));

        while (rs.next()) {

            pagina.add(new paginaCatalago(rs.getInt("idPaginaCatalogo"),
                    rs.getInt("pagina"),
                    idCatalago,
                    rs.getString("pathImagen")));
        }

    } catch (Exception e) {
        out.print(e);
    } finally {
        data.cierra_conexion();
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-filestyle.min.js"></script>
        <script src="js/jqueryForm.js"></script>


        <link href="css/animacion_carga.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script>

            $(document).ready(function () {
            <%                 for (int i = 0; i < pagina.size(); i++) {

                     out.print("	var options" + pagina.get(i).getIdPagina() + " = {	"
                             + "	                    beforeSend: function () {	$('#modalCarga').modal('show');"
                             + "		"
                             + "	                    },	"
                             + "	                    uploadProgress: function (event, position, total, percentComplete) {	"
                             + "		"
                             + "	                    },	"
                             + "	                    success: function () {	"
                             + "		"
                             + "	                    },	"
                             + "	                    complete: function (response) {	"
                             + "	     	"
                             + "	                       	"
                             + "	                       alert('Finalizado');	"
                             + "	                    },	"
                             + "	                    error: function () {	"
                             + "		"
                             + "	                    }};	");

                 }
            
                 for (int i = 0; i < pagina.size(); i++) {
                     out.print("$('#UploadForm" + pagina.get(i).getIdPagina()+ "').ajaxForm(options" + pagina.get(i).getIdPagina() + ");");
                 }
            %>
            });

        </script>


    </head>
    <body>


        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h3 class="panel-title">Administracion Paginas del catalogo</h3>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-list table-hover">
                        <thead>
                            <tr>
                                <th class="hidden-xs">Pagina</th>
                                <th>Productos</th>
                                <th>Seleccion Imagen</th>
                                <th>Subir Imagen</th>
                                <th><em class="fa fa-cog"></em>Imagen</th>                                    

                            </tr> 
                        </thead>
                        <tbody>
                            <%                                for (int i = 0; i < pagina.size(); i++) {
                                    out.print(" <form id='UploadForm" + pagina.get(i).getIdPagina() + "' action='up' method='post' enctype='multipart/form-data'>	"
                                            + "<tr>"
                                            + "     <td align='center'>"+pagina.get(i).getPagina()+"</td>	"
                                            + "<td class='hidden-xs'>bla bla bla bla bla</td>	"
                                            + "<td> <input type='file'  class='filestyle' data-buttonText='' size='60' id='myfile' name='myfile'  data-input='false' data-iconName='glyphicon-plus' data-classButton='btn btn-primary' required></td>	"
                                            + "<td><button type='submit' class='btn btn-success glyphicon glyphicon-upload'td></button>	"
                                            + "<td><input type='text' name='variable' value='" + pagina.get(i).getIdPagina() + "' style='display: none'/></td>"
                                            + "  </tr>	"
                                            + "</form>");
                                }
                            %> 
                        </tbody>
                    </table>

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
