<%-- 
    Document   : comprueba_inicioSesion
    Created on : 12/10/2017, 12:02:09 AM
    Author     : Manuelert5-Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        if( session.getAttribute("usuario")==null)
        {
            out.print("	                  <link rel='stylesheet' href='css/block_error.css'>	");
            out.print("	                  <script src='js/cuenta_regresiva.js'></script>	");
            out.print("	         <div class='container col-md-12'>	");
            out.print("	            <div id='myModal' class='modal fade in' >	");
            out.print("	                <div class='modal-dialog '>	");
            out.print("	                    <div class='modal-content' id='block_error'>	");
            out.print("	                            <div>	");
            out.print("	                                <h2>Error de logeo</h2>	");
            out.print("	                                <p><h3>Para acceder a esta parte del sitio debe iniciar sesión primero!</p></h3>    	");
            out.print("	                                <p><h3>Sera redireccionado  en <span id='seg'>6</span> segundos.</h3></p>	");
            out.print("	                            </div>	");
            out.print("	                    </div><!-- /.modal-content -->	");
            out.print("	                </div><!-- /.modal-dalog -->	");
            out.print("	            </div><!-- /.modal -->	");
            out.print("	        </div>	");

        }
    
%>