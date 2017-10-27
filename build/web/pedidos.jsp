<%-- 
    Document   : pedidos
    Created on : 18/10/2017, 02:07:01 AM
    Author     : Manuelert5-Acer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="elementos_sistemas.persona"%>
<%@page import="BD.procesos"%>
<%@page import="elementos_sistemas.detalle_factura"%>
<%@page import="elementos_sistemas.factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/animacion_carga.css" rel="stylesheet">
        <link href="css/estrellas.css" rel="stylesheet">
        
        <script src="js/jquery-3.2.1.min.js"></script>        
        <script src="js/bootstrap.min.js"></script>
        
        
        <script src="js/pedidos.js"></script>
        
        
    </head>
    <body>
        <%
           ArrayList<factura> fac=new ArrayList();
           
           
           persona usuario=new persona(1, 1, "Jose Maria", "m@gmail.com");
           session.setAttribute("usuario", usuario);
           
           
           persona usr=(persona) session.getAttribute("usuario");
           
           if(usr!=null)
           {
               procesos data=new procesos();
               try
               {
                   data.crea_conexion();
                   ResultSet rs=data.llama_funcion("retorna_facturas_usr", Integer.toString(usr.getId()));
                   int indice_factura=0;
                   while(rs.next())
                   {
                      fac.add(new factura(rs.getInt("id_factura"),
                                          rs.getString("fecha"), 
                                          rs.getFloat("total")));



                       ResultSet rs2=data.llama_funcion("retorna_detalle_factura", Integer.toString(fac.get(indice_factura).getId_factua()));
                       while(rs2.next())
                       {
                           fac.get(indice_factura).agregarDetalle(rs2.getInt("id_detalle"), 
                                              rs2.getString("nombre"), 
                                              rs2.getString("url_imagen"), 
                                              rs2.getInt("cantidad"), 
                                              rs2.getFloat("precio_unitario"), 
                                              rs2.getFloat("subTOtal"));
                       }
                       indice_factura++;

                   }
                   
               }
               catch(Exception e)
               {
                   out.print(e);
               }
               finally
               {
                   data.cierra_conexion();
               }
                               
               
           }
         %>
               
         
         <div class="container">

         <%
           
            for(int indice_factura=0; indice_factura<fac.size(); indice_factura++)
            {
                out.print("<div class='row'>	"+
                            "<div class='col-xs-12'>	"+
                                "<div class='panel panel-info'>	");
                //////abre inicio
                
                
                out.print(" <div class='panel-heading'>	"+
                            "<div class='panel-title'>	"+
                            "   <div class='row'>	"+
                            "       <div class='col-xs-4'>	"+
                            "           <h5><span class='glyphicon glyphicon-th-list'></span><span id='fecha_pedido'>  Numero Factura: "+fac.get(indice_factura).getId_factua()+" </span></h5>	"+
                            "	</div>	"+
                            "           <div class='col-xs-5'>	"+
                            "               <button type='button' class='btn btn-success btn-sm btn-block' onclick='rastrear("+fac.get(indice_factura).getId_factua()+");'>	"+
                            "                   <span class='glyphicon glyphicon-map-marker'></span> Rastrear"+
                            "	        </button>	"+
                            "	    </div>	"+
                            "	    <div class='dropdown col-xs-1'>	"+
                            "               <button type='button' class='btn btn-warning btn-sm btn-block dropdown-toggle ' data-toggle='dropdown'>	"+
                            "                   <span class='glyphicon glyphicon-option-vertical'></span> 	"+
                            "	        </button>	"+
                            "               <ul class='dropdown-menu'>	"+
                            "                   <li><a href='#' onclick=''>Reclamar paquete</a></li>	"+
                            "                   <li><a href='#' onclick=''>Cancelar Pedido</a></li>	"+
                            "	         </ul>	"+
                            "	    </div>	"+
                            "       </div>	"+
                            "   </div>	"+
                            "</div>	");
                
                
                
                out.print("<div class='panel-body'>");//abre el panel body
                

               for(int indice_facDetalle=0; indice_facDetalle<fac.get(indice_factura).getDetalle().size(); indice_facDetalle++)
               {
                   out.print("<div class='row'>	"+
                                "<div class='col-xs-2'><img class='img-responsive' src='http://placehold.it/100x70'>	"+
                                    "</div>	"+
                                        "<div class='col-xs-4'>	"+
                                            "<strong id='nombre_producto' class='product-name' >"+fac.get(indice_factura).getDetalle().get(indice_facDetalle).getProducto()+"</strong><BR>	"+
                                                "<small style='color: graytext'>Precio unitario:"+fac.get(indice_factura).getDetalle().get(indice_facDetalle).getPrecio_unitario()+" </small><BR>	"+
                                                "<small style='color: graytext'>Cantidad:"+fac.get(indice_factura).getDetalle().get(indice_facDetalle).getCantidad()+"</small><BR>	"+
                                                "<small class='pull-left' style='color: graytext'>Calificacion: "+
                                                


                                                "</small>	"+"<small>	<span class='stars pull-left'>	"+
"	                            <i class='glyphicon glyphicon-star'></i>	"+
"	                            <i class='glyphicon glyphicon-star' ></i>	"+
"	                            <i class='glyphicon glyphicon-star' ></i>	"+
"	                            <i class='glyphicon glyphicon-star' ></i>	"+
"	                            <i class='glyphicon glyphicon-star' ></i>	"+
"	            </span></small>	"+
                                        "</div>	"+
                                        "<div class='col-xs-6 text-right'>	"+
                                                        "<a href='#' class='label label-danger' onclick='reclamar("+fac.get(indice_factura).getId_factua()+","+fac.get(indice_factura).getDetalle().get(indice_facDetalle).getId_detalle()+");'>Reclamar</a>"+
                                        "   <h4><strong>Q"+fac.get(indice_factura).getDetalle().get(indice_facDetalle).getSubTotal()+"0&nbsp;</strong></h4>	"+
                                        "</div>	"+
                                        "</div>	"+
                                        "<hr>	");

                   
                   
                   
                   
                   
                                }
               
               out.print("   <div class='row'>	"+
                         "       <div class='text-right'>	"+
                         "           <h5><strong>Gastos de envio </strong><strong>sad &nbsp;</strong></h5>	"+
                         "	</div>	"+
                       "   </div>	");
               
              
               
               
               
               out.print("</div>	"+  //cierra el panel boy
                            "<div class='panel-footer'>	"+
                                "<h3 class='text-right'>Total Q"+fac.get(indice_factura).getTotal()+"</h3>	"+
                           "</div>	");

               
              
               
               ///cierra inicio
               out.print("</div></div></div>");
               
               
               

            }
           
           

             
        %>
        
      
        </div><!--Cierra container-->

        
        
        <!--Modal Rastreo-->
    <div class="modal fade" id="modal_rastreo">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                
                <table class="table table-hover">
                    <thead>
                    <tr>
                        
                        <th>No. de rastreo</th>
                        <th>Peso</th>
                        <th>Estado</th>
                        <th>Direccion</th>
                        <th>Telefono</th>

                    </tr>
                    </thead>
                    
                    <tbody id="tb_cuerpo">
                        
                    </tbody>
                    
                </table>
                    
                <table class="table table-hover">
                    <thead>
                    <tr>
                        
                        <th>Fecha y hora</th>
                        <th>Sucesos</th>

                    </tr>
                    </thead>
                    
                    <tbody id="tb_cuerpo2">
                        
                    </tbody>
                    
                </table>

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
                    
    
    <div class="modal fade" id="modal_reclamo">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                
                    <label class="control-label">Motivo</label>
                    <input type="text" class="form-control" id="inp_motivo">
                    
                    <label class="control-label">Descripcion</label>
                    <textarea class="form-control" rows="3" id="txta_descripcion"></textarea>
                    
                
                </div>
                <div class="modal-footer">
                    
                    <button class="btn btn-success" onclick="guardaReclamo()">Guardar</button>
                    <button class="btn btn-danger" id="cer" onclick="cerrar()">Cerrar</button>
                
                </div>
                
            </div>            
            
        </div>
        
    </div>                
    

    </body>

</html>