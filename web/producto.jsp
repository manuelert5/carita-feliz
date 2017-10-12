<%-- 
    Document   : producto
    Created on : 10/10/2017, 12:19:37 AM
    Author     : Manuelert5-Acer
--%>
<%@page import="elementos_sistemas.persona"%>
<%@page import="elementos_sistemas.producto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/inicia_sesion.js"></script> 
        <script src="js/agregaProductoCarrito.js"></script>
        
	
        <link rel="stylesheet" href="css/plantilla.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animacion_carga.css">

	<link rel="stylesheet" href="css/miEstilo.css">
        <link rel="stylesheet" href="css/animacion_carga.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        

        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="crea_header.jsp" flush="true"/>
        
        
    <%
        producto elProducto=new producto();
        
        if((persona)session.getAttribute("usuario")!=null)
        {
            
        

            persona usuario=(persona)session.getAttribute("usuario");        
            int idProducto= Integer.parseInt(request.getParameter("idP"));

            out.print("<input id='prueba' class='btn btn-primary' type='button' value='pinchame' onclick='agregaProductoCarrito("+usuario.getId()+", "+idProducto+");'>");
            
            procesos consula=new procesos();

            try
            {
                consula.crea_conexion();
                String datos="1,1";
                //String datos=idProducto+",1";
                //String datos=idProducto+","+usuario.getRol();
                ResultSet rs=consula.llama_funcion("retorna_producto", datos);
                while(rs.next())
                {
                    elProducto.setNombre(rs.getString("nombre"));
                    elProducto.setPrecio(rs.getFloat("precio"));
                    elProducto.setCat(rs.getString("categoraia"));
                    elProducto.setSubCat("xx");
                    elProducto.setDescripcion(rs.getString("descripcion"));
                    elProducto.setExistencia(rs.getString("existencia"));
                    elProducto.setPathImagen(rs.getString("pathImagen"));
                    elProducto.setCalificacion(rs.getFloat("calificacion"));
                }
            }

            catch(Exception e)
            {
              out.print(e);
            }

            finally
            {
                consula.cierra_conexion();
            }
            
        }
    %>
   
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img src="https://www.kaft.com/static/images/cache/313/tisort_ozgurruh_1990_313_313.jpg?cacheID=1429301256000"/></div>
                                
                                <br>
                            <div class="well well-sm">
    
<div class="row">
  <div class="col-lg-10">
    <div class="input-group">
              <input type="text" class="form-control">

      <span class="input-group-btn">
        <button class="btn btn-success" type="button">Agregar</button>
      </span>
    </div>
        </div>
        </div>

  
                            </div>
                                
                                
                                
                                <br>
                            
                            
                                <div class="well well-sm">
                                    <div class="row">
                                        <div class="col-md-6 text-center">
                                            <h1 class="rating-num">
                                                <%
                                                    if((persona)session.getAttribute("usuario")!=null)
                                                        out.print(elProducto.getCalificacion());
                                                
                                                %>
                                            </h1>
                                            <div class="rating">
                                                <%
                                                    if((persona)session.getAttribute("usuario")!=null)
                                                    {
                                                        if(elProducto.getCalificacion()<=5.00 && elProducto.getCalificacion()>4.5)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	");     
                                                        }

                                                        if(elProducto.getCalificacion()<4.6 && elProducto.getCalificacion()>3.9)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>  "+ 
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");    
                                                        } 

                                                        if(elProducto.getCalificacion()<4 && elProducto.getCalificacion()>3.5)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");    
                                                        } 

                                                        if(elProducto.getCalificacion()<3.6 && elProducto.getCalificacion()>2.9)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 

                                                        if(elProducto.getCalificacion()<3 && elProducto.getCalificacion()>2.5)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 

                                                        if(elProducto.getCalificacion()<2.6 && elProducto.getCalificacion()>1.9)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 

                                                         if(elProducto.getCalificacion()<2 && elProducto.getCalificacion()>1.5)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 

                                                         if(elProducto.getCalificacion()<1.6 && elProducto.getCalificacion()>0.9)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 

                                                        if(elProducto.getCalificacion()<1 && elProducto.getCalificacion()>0.5)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 

                                                        if(elProducto.getCalificacion()<0.5 && elProducto.getCalificacion()>=0)
                                                        {
                                                            out.print("	<span class='glyphicon glyphicon-star-empty'></span>	"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>"+
                                                                      "       <span class='glyphicon glyphicon-star-empty'></span>");     
                                                        } 
                                                    }
                                                %>
                                                
                                            </div>
                                            <div>
                                                <span class="glyphicon glyphicon-user"></span>1,050,008 total
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                            </div>
                            
                        </div>
                        <div class="details col-md-6">
                            <div class="panel panel-primary text-center">
                                <div class="panel-title panel-heading">
                                    <h4><span class="glyphicon glyphicon-list-alt"></span>   Nombre</h4>
                                </div>
                                <div class="panel-body">                        
                                    <h4><%
                                        if((persona)session.getAttribute("usuario")!=null)
                                            out.print(elProducto.getNombre());
                                        %>
                                    </h4>
                                </div>

                            </div>
                            <div class="panel panel-primary text-center">
                                <div class="panel-title panel-heading"
                                     ><h4><span class="glyphicon glyphicon-info-sign"></span>Categoria</h4>
                                </div>
                                <div class="panel-body">
                                    <h4><%
                                        if((persona)session.getAttribute("usuario")!=null)
                                            out.print(elProducto.getCat());
                                        %>
                                    </h4>
                                </div>
                            </div>

                            <div class="panel panel-primary text-center">
                                <div class="panel-title panel-heading">
                                    <h4><span class="glyphicon glyphicon-comment"></span>   Descipción</h4>
                                </div>
                                <div class="panel-body">
                                    <h4><%
                                        if((persona)session.getAttribute("usuario")!=null)                                        
                                            out.print(elProducto.getDescripcion());%>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-primary text-center">
                                <div class="panel-title panel-heading">
                                    <h4><span class="glyphicon glyphicon-credit-card"></span>  Precio</h4>
                                </div>
                                <div class="panel-body">
                                    <h2><font color="purple">   Q<%
                                                                    if((persona)session.getAttribute("usuario")!=null)
                                                                        out.print(elProducto.getPrecio());
                                                                  %>
                                    </h2>
                                </div>
                            </div>

                            <div class="text-center">
                                <button class="add-to-cart btn btn-default" type="button"><span class="glyphicon glyphicon-gift"></span> Sepete Ekle</button>
                            </div>
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
  <div class="modal fade" id="modalAgragadoExito" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            <p>El producto <%out.print(elProducto.getNombre()); %> se a agregado correctamente!</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
        
        

    </body>
</html>
