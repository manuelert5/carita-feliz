<%-- 
    Document   : materialImpreso
    Created on : 8/11/2017, 05:23:01 AM
    Author     : Manuelert5-Acer
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/agregaProductoCarrito.js"></script>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animacion_carga.css">
        <link rel="stylesheet" href="css/ofertasEnModal.css">
        

        <script>
            var idUserGlobal = 0;
            var idProdcutoGlobal = 0;

            $(document).ready(function () {


                $("#formulario_guardaProducoCarrito").submit(function (e) {


                    e.preventDefault();
                    $("#modalCantdidad").modal("hide");
                    cantidad = $("#text_cantidad_productos").val();
                    agregaProductoCarrito(idUserGlobal, idProdcutoGlobal, cantidad);
                });

            });




            function agergarCarrito(idUser, idProducto) {
                idUserGlobal = idUser;
                idProdcutoGlobal = idProducto;
                $("#modalMaterialImpreso").modal("hide");
                $("#modalCantdidad").modal("show");
            }
        </script>

    </head>
    <body>

        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalMaterialImpreso">Open Modal</button>

        <%@page import="java.sql.ResultSet"%>
        <%@page import="BD.procesos"%>
        <%@page import="elementos_sistemas.ofertaMostrar"%>
        <%@page import="java.util.ArrayList"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>



        <%
            ArrayList<ofertaMostrar> ofertas = new ArrayList();

            int idUser = 12;

            procesos data = new procesos();
            try {
                data.crea_conexion();
                ResultSet rs = data.llama_funcion("retornaMaterialImpreso", Integer.toString(idUser));
                while (rs.next()) {
                    ofertas.add(new ofertaMostrar(rs.getInt("id_producto"),
                            rs.getString("nombre"),
                            rs.getString("descripcion"),
                            rs.getFloat("calificacion_global"),
                            rs.getFloat("precio")));
                }

            } catch (Exception e) {
                out.print(e);
            } finally {
                data.cierra_conexion();
                if (ofertas.size() % 2 != 0)//revisa si es impar, elimina un elemento
                {
                    ofertas.remove(ofertas.size() - 1);

                }

            }


        %>





        <!-- Modal -->
        <div id="modalMaterialImpreso" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <H3>Material Impreso!</H3>
                    </div>
                    <div class="modal-body">

                        <div class="row carruselEscritorio"><!--carrusel dispositivos largos-->
                            <div class="col-md-12">
                                <div id="Carousel" class="carousel slide">

                                    <ol class="carousel-indicators">
                                        <%                                            int nElementos = (ofertas.size() / 2);
                                            for (int i = 0; i < nElementos; i++) {
                                                if (i == 0) {
                                                    out.print("<li data-target='#Carousel' data-slide-to='0' class='active'></li>");
                                                } else {
                                                    out.print("<li data-target='#Carousel' data-slide-to='" + i + "'></li>");
                                                }
                                            }
                                        %>
                                    </ol>


                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <%
                                            for (int i = 0; i < ofertas.size(); i = i + 2) {

                                                if (i == 0) {
                                                    out.print("<div class='item active'>		"
                                                            + "                                                       <div class='row'>"
                                                            + "	                                                <div class='col-md-1 col-sm-1'>		"
                                                            + "	                                                </div>		"
                                                            + "	                                                <div class='col-md-5 col-sm-5'>		"
                                                            + "	                                                    <span class='thumbnail'>		"
                                                            + "	                                                        <img src='img/perfme 350x350.jpg'  class='img-responsive imagen' alt='...'>		"
                                                            +///aqui va la imagen!!!
                                                            "	                                                        <h4>" + ofertas.get(i).getNombre() + "</h4>		"
                                                            +//el nombre del producto!!!
                                                            "	                                                        <div class='ratings'>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star-empty'></span>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                        <p>" + ofertas.get(i).getDescripcion() + "</p>		"
                                                            + "	                                                        <hr class='line'>		"
                                                            + "	                                                        <div class='row'>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <span class='price'>Q" + ofertas.get(i).getPrecio() + "</span>		"
                                                            + "	                                                            </div>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <a href='#'  onclick='agergarCarrito(" + idUser + "," + ofertas.get(i).getId_producto() + ");'>	<button class='btn btn-info right ' ><span class='glyphicon glyphicon-shopping-cart'> </span>  Agregar</button></a>	"
                                                            + "	                                                            </div>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                    </span>		"
                                                            + "	                                                </div>   		"
                                                            + "	                                                <div class='col-md-5 col-sm-5'>		"
                                                            + "	                                                    <span class='thumbnail'>		"
                                                            + "	                                                        <img src='img/perfme 350x350.jpg'  class='img-responsive imagen' alt='...'>		"
                                                            + "	                                                        <h4>" + ofertas.get(i + 1).getNombre() + "</h4>		"
                                                            + "	                                                        <div class='ratings'>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star-empty'></span>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                        <p>" + ofertas.get(i + 1).getDescripcion() + "</p>		"
                                                            + "	                                                        <hr class='line'>		"
                                                            + "	                                                        <div class='row'>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <span class='price'>Q" + ofertas.get(i + 1).getPrecio() + "</span>		"
                                                            + "	                                                            </div>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <a href='#' onclick='agergarCarrito(" + idUser + "," + ofertas.get(i + 1).getId_producto() + ");'>	<button class='btn btn-info right ' ><span class='glyphicon glyphicon-shopping-cart'> </span>  Agregar</button></a>	"
                                                            + "	                                                            </div>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                    </span>		"
                                                            + "	                                                </div>  		"
                                                            + "	                                            </div><!--.row-->		"
                                                            + "	                                        </div><!--.item-->		");

                                                } else {
                                                    out.print("<div class='item'>		"
                                                            + "                                                       <div class='row'>"
                                                            + "	                                                <div class='col-md-1 col-sm-1'>		"
                                                            + "	                                                </div>		"
                                                            + "	                                                <div class='col-md-5 col-sm-5'>		"
                                                            + "	                                                    <span class='thumbnail'>		"
                                                            + "	                                                        <img src='img/perfme 350x350.jpg'  class='img-responsive imagen' alt='...'>		"
                                                            +///aqui va la imagen!!!
                                                            "	                                                        <h4>" + ofertas.get(i).getNombre() + "</h4>		"
                                                            +//el nombre del producto!!!
                                                            "	                                                        <div class='ratings'>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star-empty'></span>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                        <p>" + ofertas.get(i).getDescripcion() + "</p>		"
                                                            + "	                                                        <hr class='line'>		"
                                                            + "	                                                        <div class='row'>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <span class='price'>Q" + ofertas.get(i).getPrecio() + "</span>		"
                                                            + "	                                                            </div>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <a href='#' onclick='agergarCarrito(" + idUser + "," + ofertas.get(i).getId_producto() + ");'>	<button class='btn btn-info right ' ><span class='glyphicon glyphicon-shopping-cart'> </span>  Agregar</button></a>	"
                                                            + "	                                                            </div>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                    </span>		"
                                                            + "	                                                </div>   		"
                                                            + "	                                                <div class='col-md-5 col-sm-5'>		"
                                                            + "	                                                    <span class='thumbnail'>		"
                                                            + "	                                                        <img src='img/perfme 350x350.jpg'  class='img-responsive imagen' alt='...'>		"
                                                            + "	                                                        <h4>" + ofertas.get(i + 1).getNombre() + "</h4>		"
                                                            + "	                                                        <div class='ratings'>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                            + "	                                                            <span class='glyphicon glyphicon-star-empty'></span>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                        <p>" + ofertas.get(i + 1).getDescripcion() + "</p>		"
                                                            + "	                                                        <hr class='line'>		"
                                                            + "	                                                        <div class='row'>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <span class='price'>Q" + ofertas.get(i + 1).getPrecio() + "</span>		"
                                                            + "	                                                            </div>		"
                                                            + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                            + "	                                                                <a href='#' onclick='agergarCarrito(" + idUser + "," + ofertas.get(i + 1).getId_producto() + ");'>	<button class='btn btn-info right ' ><span class='glyphicon glyphicon-shopping-cart'> </span>  Agregar</button></a>	"
                                                            + "	                                                            </div>		"
                                                            + "	                                                        </div>		"
                                                            + "	                                                    </span>		"
                                                            + "	                                                </div>  		"
                                                            + "	                                            </div><!--.row-->		"
                                                            + "	                                        </div><!--.item-->		");
                                                }

                                            }


                                        %>







                                    </div><!--.carousel-inner-->
                                    <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                                    <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                                </div><!--.Carousel-->

                            </div>
                        </div>



                        <div class="row carruselTelefono"><!--carrusel dipositivos pequeños-->
                            <div class="col-md-12">
                                <div id="Carouse2" class="carousel slide">

                                    <ol class="carousel-indicators">
                                        <%                                            for (int i = 0; i < ofertas.size(); i++) {
                                                if (i == 0) {
                                                    out.print("<li data-target='#Carouse2' data-slide-to='0' class='active'></li>");
                                                } else {
                                                    out.print("<li data-target='#Carouse2' data-slide-to='" + i + "'></li>");
                                                }
                                            }

                                        %>
                                    </ol>

                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <%                                            for (int i = 0; i < ofertas.size(); i++) {
                                                if (i == 0) {
                                                    out.print("<div class='item active'>");

                                                } else {
                                                    out.print("<div class='item'>");
                                                }

                                                out.print("<div class='row'>		"
                                                        + "	                                                <div class='col-md-1 col-sm-1'>		"
                                                        + "	                                                </div>		"
                                                        + "	                                                <div class='col-md-5 col-sm-5'>		"
                                                        + "	                                                    <span class='thumbnail'>		"
                                                        + "	                                                        <img src='img/perfme 350x350.jpg'  class='img-responsive imagen' alt='...'>		"
                                                        + "	                                                        <h4>" + ofertas.get(i).getNombre() + "</h4>		"
                                                        + "	                                                        <div class='ratings'>		"
                                                        + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                        + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                        + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                        + "	                                                            <span class='glyphicon glyphicon-star'></span>		"
                                                        + "	                                                            <span class='glyphicon glyphicon-star-empty'></span>		"
                                                        + "	                                                        </div>		"
                                                        + "	                                                        <p>" + ofertas.get(i).getDescripcion() + "</p>		"
                                                        + "	                                                        <hr class='line'>		"
                                                        + "	                                                        <div class='row'>		"
                                                        + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                        + "	                                                                <span class='price'>Q" + ofertas.get(i).getPrecio() + "</span>		"
                                                        + "	                                                            </div>		"
                                                        + "	                                                            <div class='col-md-6 col-sm-6'>		"
                                                        + "	                                                                <a href='#' onclick='agergarCarrito(" + idUser + "," + ofertas.get(i).getId_producto() + ");' >	<button class='btn btn-info right ' ><span class='glyphicon glyphicon-shopping-cart'> </span>  Agregar</button></a>	"
                                                        + "	                                                            </div>		"
                                                        + "	                                                        </div>		"
                                                        + "	                                                    </span>		"
                                                        + "	                                                </div>   		"
                                                        + "	                                            </div><!--.row-->		"
                                                        + "	                                        </div><!--.item-->		");

                                            }
                                        %>




                                    </div><!--.carousel-inner-->
                                    <a data-slide="prev" href="#Carouse2" class="left carousel-control">‹</a>
                                    <a data-slide="next" href="#Carouse2" class="right carousel-control">›</a>
                                </div><!--.Carousel-->

                            </div>
                        </div>





                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" data-dismiss="modal">Continuar  <span class="glyphicon glyphicon-triangle-right"></span> </button>
                        <br>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="modalCantdidad">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Ingrese la cantidad que desea guardar en el producto</h4>
                    </div>
                    <div class="modal-body">

                        <form id="formulario_guardaProducoCarrito">
                            <div class="form-group row">
                                <label class="col-md-4 control-label">Cantidad<font color="FF9100">*</font></label>  
                                <div class="col-md-4">
                                    <input id="text_cantidad_productos" type="text"  class="form-control input-md" required pattern="^\d+$">

                                </div>
                            </div>
                            <div class="modal-footer">
                                <br>
                                <button type="submit" class="btn btn-success">Guardar</button>

                            </div>

                        </form>                
                    </div>
                </div>
            </div>
        </div>                 

        <!-- Modal  exito-->
        <div class="modal fade" id="modalAgragadoExito" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <p>El producto se a agregado correctamente!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal  error-->
        <div class="modal fade" id="modalAgragadoError" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <p id="contenedor_modalError">/p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" id="cer" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>
