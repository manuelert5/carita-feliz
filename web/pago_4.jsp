<%@page import="elementos_sistemas.departamento"%>
<%@page import="java.text.DecimalFormat"%>
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

<%

    float envio = 0;
    float subTotal = 0;
    float total = 0;
    int tipo_user = 0;
    String id_dir = "3";


    Calendar c = new GregorianCalendar();
    String dia = Integer.toString(c.get(Calendar.DATE));
    int mes1 = c.get(Calendar.MONTH) + 1;
    String año = Integer.toString(c.get(Calendar.YEAR));
    String mes = null;
    if (mes1 == 1) {
        mes = "Enero";
    } else if (mes1 == 2) {
        mes = "Febrero";
    } else if (mes1 == 3) {
        mes = "Marzo";
    } else if (mes1 == 4) {
        mes = "Abril";
    } else if (mes1 == 5) {
        mes = "Mayo";
    } else if (mes1 == 6) {
        mes = "Junio";
    } else if (mes1 == 7) {
        mes = "Julio";
    } else if (mes1 == 8) {
        mes = "Agosto";
    } else if (mes1 == 9) {
        mes = "Septiembre";
    } else if (mes1 == 10) {
        mes = "Octubre";
    } else if (mes1 == 11) {
        mes = "Noviembre";
    } else if (mes1 == 12) {
        mes = "Diciembre";
    }

    int idUsr = 12;
    DecimalFormat df = new DecimalFormat("#.00");
    procesos data = new procesos();
    direccion direction = new direccion();
    ArrayList<producto_en_el_carrrito> lista_carrito = new ArrayList();//arreglo que guardara los elementos del carrito

    try {
        data.crea_conexion();
        ResultSet p = data.llama_funcion("productosFacturacion", Integer.toString(idUsr));

        while (p.next())//cargamos el arreglo de informacion
        {
            lista_carrito.add(new producto_en_el_carrrito(p.getString("nombre"),
                    p.getFloat("precio"),
                    p.getInt("cantidad")));
        }

        p = data.llama_funcion("retorna_direccion_especifica", id_dir);

        while (p.next())//cargamos el arreglo de informacion
        {
            direction.setDireccion(p.getString("direccion"));
            direction.setDepartamento(p.getString("departamento"));
            direction.setMunicipio(p.getString("municipio"));
            direction.setReferencia(p.getString("referencia"));
        }

        data.setEnteros("idDir", Integer.parseInt(id_dir));
        data.setEnteros("idUser", idUsr);
        data.setDecimalSalida("envio", 0);
        data.setDecimalSalida("subTotal", 0);
        data.setDecimalSalida("Total", 0);
        data.setEnterosSalida("tipoUser", 0);

        data.sp_invoca("{call calculaEnvio(?,?,?,?,?,?,?)}");
        envio = data.getDecimal("envio");
        subTotal = data.getDecimal("subTotal");
        total = data.getDecimal("Total");
        tipo_user = data.getEnteroSalida("tipoUser");

    } catch (Exception e) {
        out.print(e);

    } finally {
        data.cierra_conexion();
    }

%>




<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/barra_progreso.css">
        <link rel="stylesheet" href="css/estilo_direcciones.css">
        <link rel="stylesheet" href="bootstrapSelect/css/bootstrap-select.min.css">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="bootstrapSelect/js/bootstrap-select.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                $("#formularioPago").submit(function (e) {
                    e.preventDefault();

                    cadJson = {
                        idUser: '<%out.print(idUsr);%>',
                        tarjeta: $("#numeroTarjeta").val(),
                        fechaExpira: $("#mesExpira").val(),
                        año: $("#añoExpira").val()

                    };

                    $.ajax({
                        data: {pago: JSON.stringify(cadJson)}, // le pone nombre al jSOn y convierte la cadena a jSon
                        url: "procesaPago",
                        type: 'post',

                        beforeSend: function () {
                            $("#modalCarga").modal('show');

                        },
                        success: function (response) {
                            $("#modalCarga").modal('hide');
                            $("#modalPago").modal("hide");

                            if (response == 0)
                            {
                                $("#modalAgragadoExito").modal('show');

                            }

                            if (response != 0)
                            {
                                $("#modalAgragadoError").modal('show');
                                $("#contenedor_modalError").html(response)
                            }

                        }
                    });



                });
            });
        </script>


    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <address>
                                <%                                    out.print("	                        <strong>" + direction.getDireccion() + "</strong>	");
                                    out.print("	                        <br>	");
                                    out.print(direction.getDepartamento() + ",");
                                    out.print(direction.getMunicipio());
                                    out.print("	                        <br>	");
                                    out.print(direction.getReferencia());

                                %>

                                <br>
                                <abbr title="Phone">Tel:</abbr> 444444-4444
                            </address>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                            <p>
                                <em><%out.print(dia + " de " + mes + " del " + año);%> </em>
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
                                    <th>#</th>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th class="text-center">Precio</th>
                                    <th class="text-center">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (int x = 0; x < lista_carrito.size(); x++) {
                                        Float precio_temp = lista_carrito.get(x).getPrecio() * lista_carrito.get(x).getCantidad();
                                        out.print("	                        <tr>	");
                                        out.print("	                            <td class='col-md-1'><em>" + (x + 1) + "</em></h4></td>	");
                                        out.print("	                            <td class='col-md-9'><em>" + lista_carrito.get(x).getNombre() + "</em></h4></td>	");
                                        out.print("	                            <td class='col-md-1' style='text-align: center'>" + lista_carrito.get(x).getCantidad() + "</td>	");
                                        out.print("	                            <td class='col-md-1 text-center'>Q" + lista_carrito.get(x).getPrecio() + "</td>	");
                                        out.print("	                            <td class='col-md-1 text-center'>Q" + precio_temp + "</td>	");
                                        out.print("	                        </tr>	");

                                    }
                                %>

                                <tr>
                                    <td>   </td>
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
                                            <strong>Q<%out.print(df.format(subTotal));%></strong>
                                        </p>
                                        <p>
                                            <strong>Q<%out.print(envio);%></strong>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td>   </td>
                                    <td>   </td>
                                    <td>   </td>
                                    <td class="text-right text-danger"><h4><strong>Total: </strong></h4></td>
                                    <td class="text-center text-danger"><h4><strong><%out.print(total);%></strong></h4></td>
                                </tr>


                            </tbody>
                        </table>
                        <button type="button" class="btn btn-success btn-lg btn-block" data-toggle="modal" data-target="#modalPago">
                            Pagar Ahora   <span class="glyphicon glyphicon-chevron-right"></span>
                        </button></td>
                    </div>
                </div>
            </div>



            <!-- Modal -->
            <div id="modalPago" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-body ">
                        <div class="container">


                            <%
                                if (tipo_user == 1) {

                                    out.print("<div class='row'>	"
                                            + "	                                    <div class='col-xs-12 col-md-4 col-md-offset-1'>	"
                                            + "	                                        <div class='panel panel-default'>	"
                                            + "	                                            <div class='panel-heading'>	"
                                            + "	                                                Puntos	"
                                            + "	                                            </div>	"
                                            + "	                                            <div class='panel-body'>	"
                                            + "	                                                <div class='form-group'>	"
                                            + "	                                                    <h3>	"
                                            + "	                                                        <label class='label label-info'>	"
                                            + "	                                                            Puntos disponibles</label>	"
                                            + "	                                                    </h3>	"
                                            + "	                                                </div>	"
                                            + "	                                                <div class='form-group'>	"
                                            + "	                                                    <label for='cardNumber'>	"
                                            + "	                                                        Puntos a usar</label>	"
                                            + "	                                                    <div class='input-group'>	"
                                            + "	                                                            <input type='text' class='form-control' id='cardNumber' placeholder='' required autofocus />	"
                                            + "	                                                    </div>	"
                                            + "	                                                </div>	"
                                            + "	                                                    <button class='btn btn-success btn-lg btn-block' type='submit'><span class='glyphicon glyphicon-ok'></span>  Usar puntos</button>	"
                                            + "	                                            </div>	"
                                            + "	                                        </div>	"
                                            + "	                                    </div>	"
                                            + "	                                </div>	");

                                }

                            %>




                            <div class="row">

                                <div class="col-xs-12 col-md-4 col-md-offset-1">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                Pago
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <form role="form" id="formularioPago">
                                                <div class="form-group">
                                                    <label for="cardNumber">
                                                        Numero Tarjeta</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="numeroTarjeta" placeholder="" required autofocus />
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-7 col-md-7">
                                                        <div class="form-group">
                                                            <label for="expityMonth">
                                                                Fecha de Expiración</label>
                                                            <div class="col-xs-6 col-lg-6 pl-ziro">
                                                                <input type="text" class="form-control" id="mesExpira" placeholder="MM" required />
                                                            </div>
                                                            <div class="col-xs-6 col-lg-6 pl-ziro">
                                                                <input type="text" class="form-control" id="añoExpira" placeholder="AA" required /></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5 col-md-5 pull-right">
                                                        <div class="form-group">
                                                            <label for="cvCode">
                                                                CVC</label>
                                                            <input type="password" class="form-control" id="cvc" placeholder="CVC" required />
                                                        </div>
                                                    </div>
                                                </div>

                                                <ul class="nav nav-pills nav-stacked">
                                                    <label  class="active btn btn-primary btn-lg btn-block"><a><span class="badge pull-right">Q<%out.print(total);%></span></a> Pago</label>

                                                </ul>

                                                <br/>
                                                <button class="btn btn-success btn-lg btn-block" type="submit"><span class="glyphicon glyphicon-credit-card"></span>  Pagar</button>


                                            </form>
                                        </div>
                                    </div>

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



    </body>
</html>
