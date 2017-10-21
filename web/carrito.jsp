<%-- 
    Document   : carrito
    Created on : 20/09/2017, 11:58:34 PM
    Author     : Manuelert5-Acer
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/barra_progreso.css">
        <link rel="stylesheet" href="css/estilo_direcciones.css">
        
        <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/inicia_sesion.js"></script>
        <script>
            
function actualiza_dir(){
    var data={
        "id_dir"        : $("#modal_txt_id").val(),
        "municipio"     : $("#modal_txt_municipio").val(),
        "departamento"  : $("#modal_txt_departamento").val(),
        "referencia"    : $("#modal_txt_referencia").val(),
        "direccion"    : $("#modal_txt_dir").val()
        
    };
    $.ajax({
        data: data,
        url: "actualiza_direccion",
        type: 'POST',

        beforeSend: function ()
        {
        },
        success: function (respuesta)
        {
            if(respuesta=='0')
            {
                $("#modal_dir").modal('hide');
                
            }
            
        }
    });    
    
}

function selecciona_direccion(id){
    var data={
        "id_dir"      : id,
    };
    $.ajax({
        data: data,
        url: "selecciona_dir",
        type: 'POST',

        beforeSend: function ()
        {


        },
        success: function (respuesta)
        {
            alert(respuesta);
        }
    });
    }

function fun(id){
    var data={
        "id_dir"      : id,
    };
    $.ajax({
        data: data,
        url: "retorna_direccion_especifica",
        type: 'POST',

        beforeSend: function ()
        {


        },
        success: function (respuesta)
        {
            obj=JSON.parse(respuesta);
            $("#modal_txt_departamento").val(obj[0].departamento);
            $("#modal_txt_dir").val(obj[0].direccion);
            $("#modal_txt_municipio").val(obj[0].municipio);
            $("#modal_txt_referencia").val(obj[0].referencia);
            $("#modal_txt_id").val(id);

            
            $("#modal_dir").modal('show');
        }
    });
    


}

$(document).ready(function() {    
    
    $("#barra_pasos_carrito").click(function(){
        $("#contenedor_carrito").show();    
        $("#contenedor_dirreciones").hide();
 
        $("#barra_pasos_carrito").addClass("active");  
        $("#barra_pasos_carrito").removeClass("completed"); 
        
        
        $("#barra_passos_envio").removeClass("active");  
        $("#barra_passos_envio").removeClass("completed"); 
        
        
        $("#barra_pasos_pago").removeClass("active");  
        $("#barra_pasos_pago").removeClass("completed");
                
        $("#barra_pasos_facturacion").removeClass("active");  
        $("#barra_pasos_facturacion").removeClass("completed"); 
        
        

        
    });
    $("#barra_passos_envio").click(function(){
        $("#contenedor_carrito").hide();
        $("#contenedor_dirreciones").show();
        
        $("#barra_pasos_carrito").removeClass("active"); 
        
        $("#barra_pasos_pago").removeClass("active");  
        $("#barra_pasos_pago").removeClass("completed");
        
        $("#barra_pasos_facturacion").removeClass("active");  
        $("#barra_pasos_facturacion").removeClass("completed"); 
        

        
        $("#barra_pasos_carrito").addClass("completed");        
        $("#barra_passos_envio").addClass("active");
        
        
        $.ajax({
            data: '',
            url: "retona_direccion",
            type: 'POST',
            
            beforeSend: function ()
            {
                        
                        
            },
            success: function (respuesta)
            {
                obj = JSON.parse(respuesta);
                var acumula_Total=0;

                for(i=0; i<obj.length; i++) {
                    $("#contenedor_dirreciones").append("<div class='plan col-sm-4 col-lg-4'>"+
                                                              "<div>"+
                                                                "<h2> </h2>"+
                                                              "</div>"+
                                                              "<ul>"+
                                                                "<li class='plan-feature'><strong>Direccion: </strong>"+obj[i].direccion+"</li>"+
                                                                "<li class='plan-feature'><strong>Departamento: </strong>"+obj[i].departamento+"</li>"+
                                                                "<li class='plan-feature'><strong>Municipio: </strong>"+obj[i].municipio+"</li>"+
                                                                "<li class='plan-feature'><strong>Referencia: </strong>"+obj[i].referencia+"</li>"+
                                                                "<div class='btn-group btn-group-justified' role='group' aria-label='group button'>"+
                                                                    "<a  href='javascript:;' class='btn btn-primary btn-plan-select' onclick='fun("+obj[i].id_direccion+");'><i class='icon-white icon-ok'></i> Editar</a>"+
                                                                    "<a  href='javascript:;' class='btn btn-success btn-plan-select' onclick='selecciona_direccion("+obj[i].id_direccion+");'><i class='icon-white icon-ok'></i> Seleccionar</a>"+

                                                                "</div>"+
                                                                "</ul>"+
                                                            "</div>");
                }
            }
        });        
        
        
    });
    
$("#barra_pasos_pago").click(function(){
        $("#contenedor_dirreciones").hide();
        $("#barra_passos_envio").removeClass("active");
        $("#barra_pasos_facturacion").removeClass("active");     
        $("#barra_passos_envio").addClass("completed");        
        $("#barra_pasos_pago").addClass("active");
        
    });
    
$("#barra_pasos_facturacion").click(function(){
//        $("#contenedor_carrito").hide();
        $("#barra_pasos_pago").removeClass("active");     
        $("#barra_pasos_pago").addClass("completed");        
        $("#barra_pasos_facturacion").addClass("active");
        
    });
    
    
    
    $("#botonPagar").click(function(){
        $.ajax({
            data: '',
            url: "comprueba_carrito",
            type: 'POST',
            
            beforeSend: function ()
            {
                        
                        
            },
            success: function (respuesta)
            {
                if(respuesta==0)
                {
                    //redirige
                }
                else
                {
                    //meustra mensaje
                }
            }
        });
    });

    
    $("#modal_cerrar").click(function (){
        location.reload();
    });
    
    
        $('tbody').on('change', 'input', function() { 

            var data = {
                "id_carrito"      : this.id,
                "cantidad"        : $(this).val()

            };
            $.ajax({
                data:   data,
                url: "actualiza_cantidad_carrito",
                type: 'post',

                beforeSend: function () {


                },
                success:  function (response) {
                    if(response=="0")
                    {
                        location.reload();
                    }
                    else{
                        $("#modal_cuerpo").html(response);
                        $("#modalError").modal('show');                         
                    }
                }
            });
        
        });

    
     $.ajax({
                        data:  '',
                        url:   'retorna_carrito',
                        type:  'post',
                        beforeSend: function () {

                        },
                        success:  function (response) {
                            
                            
                            obj = JSON.parse(response);
                            var acumula_Total=0;
                            
                            for(i=0; i<obj.length; i++) {
                                var totalProducto=obj[i].precio*obj[i].cantidad;
                                acumula_Total=acumula_Total+totalProducto; 
                                var estado;
                                if(obj[i].estado=="Sin existencia")
                                {
                                    estado="<strong class='text-danger'>"+obj[i].estado+"</strong>";     
                                }
                                else if(obj[i].estado=="Mas de 20" || obj[i].estado=="Menos de 20")
                                {
                                    estado="<strong class='text-success'>"+obj[i].estado+"</strong>";     
                                }
                                                                
                                else
                                {
                                    estado="<strong class='text-warning'>"+obj[i].estado+"</strong>";     
                                }
                                
                                
                                $("tbody").prepend("<tr>"+
                                                            "<td class='col-sm-8 col-md-6'>"+
                                                            "<div class='media'>"+
                                                                "<a class='thumbnail pull-left' href='#'> <img class='media-object' src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png' style='width: 72px; height: 72px;'> </a>"+
                                                                "<div class='media-body'>"+
                                                                    "<h4 class='media-heading' ><a href='#' >"+obj[i].nombre+"</a></h4>"+
                                                                    "<h5 class='media-heading'> Por <a href='#' >"+obj[i].marca+"</a></h5>"+
                                                                    "<span>Estado: </span><span >"+estado+"</span>"+
                                                                "</div>"+
                                                            "</div></td>"+
                                                            "<td class='col-sm-1 col-md-1' style='text-align: center' id='cantidad'>"+
                                                            "<input type='email' class='form-control'  id='"+obj[i].id_carrito+"' value='"+obj[i].cantidad+"'>"+
                                                            "</td>"+
                                                            "<td class='col-sm-1 col-md-1 text-center'><strong>"+obj[i].precio+"</strong></td>"+
                                                            "<td class='col-sm-1 col-md-1 text-center'><strong>"+totalProducto+"</strong></td>"+
                                                            "<td class='col-sm-1 col-md-1'>"+
                                                            "<a href='elimina_carrito?id_carrito="+obj[i].id_carrito+"'>"+
                                                            "<button type='button' class='btn btn-danger'>"+
                                                                "<span class='glyphicon glyphicon-remove'></span> Quitar"+
                                                            "</button></td></a>"+
                                                        "</tr>")
                            }
                            $("#total").text("Q"+acumula_Total);
                        }
                });
    
});  
 
                            
            
        </script>
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        
       <jsp:include page="crea_header.jsp" flush="true"/>
        
        <button type="button" class="ir-arriba btn btn-info btn-circle btn-xl"><i class="glyphicon glyphicon-chevron-right"></i></button>


       
<div class="container"><!--esta es la barra de progreso-->
	<div class="row">
		<ul class="breadcrumb">
    		<li class="active"   id="barra_pasos_carrito"><a href="#">Carrito</a></li>
			<li id="barra_passos_envio"><a href="#" >Envio</a></li>
                        <li id="barra_pasos_pago"><a href="#">Pago</a></li>
                        <li id="barra_pasos_facturacion"><a href="#">Facturacion</a></li>

		</ul>
	</div>
</div>
        
<div class="container" id="contenedor_carrito">
    
    <div class="row">
        
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover" id="tabla">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
<!--
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong id="subtotal">0</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Envio</h5></td>
                        <td class="text-right"><h5><strong>$6.94</strong></h5></td>
                    </tr>
-->
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong id="total"></strong></h3></td>
                    </tr>
                    
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="index.jsp">
                            <button type="button" class="btn btn-default">
                                <span class="glyphicon glyphicon-shopping-cart"></span> Continuar Comprando
                            </button>
                        </a>
                        </td>
                        <td>
                        <button type="button" class="btn btn-success" id="botonPagar">
                            Generar Orden <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>


                </tbody>
            </table>
        </div>
    </div>
</div>    
        
 <!--inicia contenedor de las direcciones-->      
     <div class="container pricing-table pricing-three-column row"id="contenedor_dirreciones" style="display: none;">
     
    
     </div>
     
        
 <!--Finaliza contenedor de las direcciones-->      

 
    
       <!-- Modal  error-->
<div class="modal fade" id="modalError" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-body alert alert-warning" >
          <h2 id="modal_cuerpo"></h2>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal" id="modal_cerrar">Cerrar</button>
    </div>
  </div>
</div>
</div>
    
    
        <!-- Modal  decicion direccion-->
<div class="modal fade" id="modal_dir" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">Editar Direccion</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
                <div class="form-group">
                  <label for="exampleInputEmail1">Direccion</label>
                  <input type="text" class="form-control" id="modal_txt_dir" placeholder="">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Departamento</label>
                  <input type="text" class="form-control" id="modal_txt_departamento" placeholder="">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Municipio</label>
                  <input type="text" class="form-control" id="modal_txt_municipio" placeholder="">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Referencia</label>
                  <input type="text" class="form-control" id="modal_txt_referencia" placeholder="">
                </div>
            <!--esconde id-->
            <div class="form-group"style="display: none">
                  <label for="exampleInputPassword1">Referencia</label>
                  <input type="text" class="form-control" id="modal_txt_id" placeholder="">
                </div>
                
                



		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-danger" data-dismiss="modal"  role="button">Cerrar</button>
				</div>
				<div class="btn-group" role="group">
                                    <button type="button" id="saveImage" onclick="actualiza_dir();" class="btn btn-success btn-hover-green" data-action="save" role="button">Guardar</button>
				</div>
			</div>
		</div>

	</div>
  </div>
</div>
        
        
</body>
</html>
