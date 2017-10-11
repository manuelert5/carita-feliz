<%@page import="elementos_sistemas.direccion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="elementos_sistemas.producto_en_el_carrrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : pago_4
    Created on : 30/09/2017, 01:43:23 AM
    Author     : Manuelert5-Acer
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/barra_progreso.css">
        <link rel="stylesheet" href="css/estilo_direcciones.css">
        
        <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <jsp:include page="crea_header.jsp" flush="true"/>

       <%
            Calendar c = new GregorianCalendar();
            String dia = Integer.toString(c.get(Calendar.DATE));
            int mes1 = c.get(Calendar.MONTH)+1;
            String año = Integer.toString(c.get(Calendar.YEAR));
            String mes=null;
            if(mes1==1)
            {
                mes="Enero";
            }
            else if(mes1==2)
            {
                mes="Febrero";
            }
            else if(mes1==3)
            {
                mes="Marzo";
            }
            else if(mes1==4)
            {
                mes="Abril";
            }            
            else if(mes1==5)
            {
                mes="Mayo";
            }            
            else if(mes1==6)
            {
                mes="Junio";
            }            
            else if(mes1==7)
            {
                mes="Julio";
            }            
            else if(mes1==8)
            {
                mes="Agosto";
            }            
            else if(mes1==9)
            {
                mes="Septiembre";
            }            
            
            else if(mes1==10)
            {
                mes="Octubre";
            }            
            else if(mes1==11)
            {
                mes="Noviembre";
            }            
            else if(mes1==12)
            {
                mes="Diciembre";
            }
            
            procesos data=new procesos();
            direccion direction=new direccion();
            ArrayList<producto_en_el_carrrito> lista_carrito=new ArrayList();//arreglo que guardara los elementos del carrito

            try{
                data.crea_conexion();
                ResultSet p=data.retorna_carrito();
                
                while(p.next())//cargamos el arreglo de informacion
                {
                    lista_carrito.add(new producto_en_el_carrrito( 0,
                                                            p.getString("nombre"), 
                                                            null,
                                                            p.getFloat("precio"), 
                                                            p.getInt("cantidad"),
                                                            null,
                                                            null,
                                                            0));
                } 
                
                String id_dir="14";
                p=data.llama_funcion("retorna_direccion_especifica",id_dir);

            
                while(p.next())//cargamos el arreglo de informacion
                { 
                    direction.setDireccion(p.getString("direccion"));
                    direction.setDepartamento(p.getString("departamento"));
                    direction.setMunicipio(p.getString("municipio"));
                    direction.setReferencia(p.getString("referencia"));
                } 
            
   



            }
            catch(Exception e)
            {
                System.err.println(e);

            }
            
            finally
            {
                data.cierra_conexion();
            }
           
           
           %>
<div class="container">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <%
                            out.print("	                        <strong>"+direction.getDireccion()+"</strong>	");
                            out.print("	                        <br>	");
                            out.print(                                    direction.getDepartamento());                     
                            out.print("	                        <br>	");
                            out.print(                                    direction.getMunicipio());
                            out.print("	                        <br>	");
                            out.print(                                    direction.getReferencia());

                            
                            %>
                        

                        <abbr title="Phone">P:</abbr> 444444-4444
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em>Fecha: <%out.print(dia+" de "+mes+" del "+año);%> </em>
                    </p>

                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Factura</h1>
                </div>
                </span>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th class="text-center">Precio</th>
                            <th class="text-center">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Double acumula_precio=0.0;
                            
                            for(int x=0; x<lista_carrito.size(); x++)
                            {
                                Float precio_temp=lista_carrito.get(x).getPrecio()*lista_carrito.get(x).getCantidad();
                                out.print("	                        <tr>	");
                                out.print("	                            <td class='col-md-9'><em>"+lista_carrito.get(x).getNombre()+"</em></h4></td>	");
                                out.print("	                            <td class='col-md-1' style='text-align: center'>"+lista_carrito.get(x).getCantidad()+"</td>	");
                                out.print("	                            <td class='col-md-1 text-center'>Q"+lista_carrito.get(x).getPrecio()+"</td>	");
                                out.print("	                            <td class='col-md-1 text-center'>Q"+precio_temp+"</td>	");
                                out.print("	                        </tr>	");
                                acumula_precio=acumula_precio+precio_temp;
                                
                            }
                        %>
                        
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right">
                            <p>
                                <strong>Subtotal: </strong>
                            </p>
                            <p>
                                <strong>Envio: </strong>
                            </p></td>
                            <td class="text-center">
                            <p>
                                <strong>Q<%out.print(acumula_precio); %></strong>
                            </p>
                            <p>
                                <strong>Q6.94</strong>
                            </p></td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong>Q31.53</strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-success btn-lg btn-block">
                    Pagar Ahora   <span class="glyphicon glyphicon-chevron-right"></span>
                </button></td>
            </div>
        </div>
    </div>
       
       
    </body>
</html>
