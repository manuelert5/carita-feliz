<%-- 
    Document   : registrar
    Created on : 10/09/2017, 10:19:58 PM
    Author     : Manuelert5-Acer
--%>

<%@page import="elementos_sistemas.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <title>Registro</title>
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
         <link rel="stylesheet" href="css/miEstilo.css">
         



         <script src="js/jquery-3.2.1.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/obtiene_var_url.js"></script>

         
         
        <script type="text/javascript">   

   $(document).ready(function(){         
                   
        $("#Boton_cancelar").click(function (){
                window.location="index.jsp";
                
        });
       
       
       $("#select_rol").change(function (){//para cuando un administrador va a ingresar usuario, si es un afiliado va a necesitar un id para su socio... 
           ///con esto si selecciona que registrara un afiliado escondera o mostrara en funcion del rol del usuario que creara
           
           if($("#select_rol option:selected").val()==2)//si el rol seleccionado es afiliado
           {
               $("#contenedor_id_socio").show();//muestra campo para ingresar el id del socio
           }
           else if($("#select_rol option:selected").val()!=2)//si el rol seleccionado es diferente de afiliado
           {
               $("#contenedor_id_socio").hide();//esconde el campo para ingreasr el id del socio

           }
       });
       

        
        $("#Text_password").change(function(){//si cambia la caja 1 del password
           if($("#Text_password").val() != $("#Text_rpassword").val())//si lass contraseñas en los campos no son iguales
           {
                $("#Text_password").addClass("resplandor-rojo");//se activa el resplandor caja1
                $("#Text_rpassword").addClass("resplandor-rojo");//se activa el resplandor caja2
                $("#Boton_guardar").attr("disabled","disabled");//se deshabilita el boton guardar
                $("#alerta").show();//se muestra la alerta 
                $("#alerta").html("Las contraseñas no coinciden");//se activa el mensaje de la alerte
           }
           
           if($("#Text_password").val() == $("#Text_rpassword").val())//si las contraseñas son iguales
           {
                $("#Text_password").removeClass("resplandor-rojo");//se desactiva el resplandor caja1
                $("#Text_rpassword").removeClass("resplandor-rojo");//se desactiva el resplandor caja1
                $("#Boton_guardar").removeAttr("disabled");//se habilita el boton guardar
                $("#alerta").hide();//se ocula la alerta
         

           }
         });

        $("#Text_rpassword").change(function(){//si cambia la caja 2 del password
           if($("#Text_password").val() != $("#Text_rpassword").val())//si lass contraseñas en los campos no son iguales
           {
                $("#Text_password").addClass("resplandor-rojo");//se activa el resplandor caja1
                $("#Text_rpassword").addClass("resplandor-rojo");//se activa el resplandor caja2
                $("#Boton_guardar").attr("disabled","disabled");//se deshabilita el boton guardar
                $("#alerta").show();//se muestra la alerta 
                $("#alerta").html("Las contaseñas no coinciden")


           }
           if($("#Text_password").val() == $("#Text_rpassword").val())//si las contraseñas son iguales
           {
                $("#Text_password").removeClass("resplandor-rojo");//se desactiva el resplandor caja1
                $("#Text_rpassword").removeClass("resplandor-rojo");//se desactiva el resplandor caja1
                $("#Boton_guardar").removeAttr("disabled","disabled");//se muestra el boton guardar
                $("#alerta").hide();//se ocula la alerta
         

           }
         });
        
        
        $("#Text_email").change(function(){//si camba el contenido de la caja del correco
            $(this).removeClass("resplandor-rojo");//se quita el resplandor
            $("#alerta").hide();//se oculta la alerta
            $("#alerta_correo").hide();//se oculta el mensaje
            $("#Boton_guardar").removeAttr("disabled");
           
        });
      
      
        $("#formulario").submit(function(e) {
            

            var id_socio=null;           
            var rol=$(document).getUrlParam("rol");//el rol lo recuperamos de la url de la pagina..
            
            
            

   //         $("#Boton_guardar").click(function(){//si da click en guardar
                           
                           
                           
                if(rol==0)//si no tiene ningun rol, lo va a recuperar de un menu!
               {                
                   rol= $("#select_rol option:selected").val();
               }

               if(rol==2)//si el rol a seleccionado es un afiliado
               {
                    id_socio=$("#Text_socio").val();//se recupera el id del socio en la caja de texto
               }
               else  //de lo contrario sera socio o admin
               {
                    id_socio=0;//y no se va a necesitar un socio para registrarlo... ya que solo los afiliados tienen un socio 

               }



                e.preventDefault();
                var data = {
                        "Text_nombres"      : $("#Text_nombres").val(),
                        "Text_apellidos"    : $("#Text_apellidos").val(),
                        "Text_telefono"     : $("#Text_telefono").val(),
                        "Text_email"        : $("#Text_email").val(),   
                        "Text_password"     : $("#Text_password").val(),
                        "Text_socio"        : id_socio,
                        "Text_direccion"    : $("#Text_direccion").val(),
                        "Text_municipio"    : $("#Text_municipio").val(),
                        "select_depto"      : $("#select_depto option:selected").val(),
                        "Text_referencia"   : $("#Text_referencia").val(),
                        "Text_nit"          : $("#Text_nit").val(),
                        "Text_rol"          : rol

                };
                $.ajax({
                        data:  data,
                        url:   'crea_usuario',
                        type:  'post',
                        beforeSend: function () {

                        },
                        success:  function (response) {
                            
                            if(response=="0")
                            {
                                $("#alerta").show();//muestra la alerta
                                $("#alerta").html(response);                                
                            }
                            else//retorna la base de datos que el correo ya existe
                            {
                                $("#alerta").show();//muestra la alerta
                                $("#alerta").html(response);
                                $("#Boton_guardar").attr("disabled","disabled");//dehabilita el boton
                            }
                        }
                });

                
                
      //      });
            
            
            return  false; 
        });
   });


      
  </script>
        
         <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
         <title>Registrar Usuario</title>
    </head>
    
    <body>

    <div>
        <form class="form-horizontal" id="formulario" role="form" >
        <fieldset>

            <legend>Registro de Usuario</legend>

            <div class="alert alert-danger  center-block clearfix" id="alerta" style='display:none;'><!--contenedor de la alertta-->
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Nombres<font color="FF9100">*</font></label> 
              <div class="col-md-4">
                  <input id="Text_nombres" type="text"  class="form-control input-md" required placeholder="Jose Maria">

              </div>
            </div>




              <div class="form-group">
              <label class="col-md-4 control-label">Apellidos<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_apellidos" type="text"  class="form-control input-md" required placeholder="Perez Lima">

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label">Nit<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_nit" type="text"  class="form-control input-md" required pattern='^[0-9]*' >

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="phone">Telefono<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_telefono" name="phone" type="text"  class="form-control input-md" required pattern="\b\d{4}[-]?\d{4}" placeholder="5555-5555 ó 12345678">
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="email">Email<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_email" name="email" type="email" placeholder="ejemplo@hotmail.com" class="form-control input-md" required >
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="password">Contraseña<font color="FF9100">*</font></label>
              <div class="col-md-4">
                <input id="Text_password" name="password" type="password"  class="form-control input-md" required="">
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="rpassword">Confirme su contraseña<font color="FF9100">*</font> 
              </label>
              <div class="col-md-4">
                <input id="Text_rpassword" name="rpassword" type="password"  class="form-control input-md" required="">

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="selectbasic">Departamento<font color="FF9100">*</font></label>
              <div class="col-md-4">
                <select id="select_depto" name="selectbasic" class="form-control">
                <option value="Peten">Peten</option>
                <option value="Izabal">Izabal</option>


                </select>
              </div>
            </div>



            <div class="form-group">
              <label class="col-md-4 control-label" for="city">Municipio<font color="FF9100">*</font></label>  
              <div class="col-md-4">
              <input id="Text_municipio" name="city" type="text" class="form-control input-md" required="">

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="address1">Direccion<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_direccion" name="address1" type="text"  placeholder="5ta. Avenida Zona 10"  class="form-control input-md" required="">

              </div>
            </div>


             <div class="form-group">
              <label class="col-md-4 control-label" for="address1">Referencia<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_referencia" name="address1" type="text"  placeholder="5ta. Avenida Zona 10" class="form-control input-md" required="">

              </div>
            </div>

            <%
            Integer rol= Integer.parseInt(request.getParameter("rol"));
            
                out.print("	          <div class='form-group'>	");
                out.print("	              <label class='col-md-4 control-label' for='selectbasic'>Tipo de Usuario<font color='FF9100'>*</font></label>	");
                out.print("	              <div class='col-md-4'>	");
                
            
                if(rol==2)//si viene de un usuario socio
                {
                    out.print("	                <select id='select_rol' name='selectbasic' class='form-control' disabled>	");
                    out.print("	                    <option value='2'>Afiliado</option>	");
                    out.print("	                    <option value='1'>Socio</option>	");
                    out.print("	                    <option value='3'>Admministrador</option>	");
                    out.print("	                </select>	");   
                    out.print("	              </div>	");
                    out.print("	            </div>	");
                    
                    
                    persona usr= (persona) session.getAttribute("usuario");//recupera el objeto usuario y lo pone el id en la caja de texto
                                        
                    out.print("	            <div class='form-group' id='contenedor_id_socio'>	");       
                    out.print("	              <label class='col-md-4 control-label' for='address1'>Número de Socio</label>  	");
                    out.print("	              <div class='col-md-4'>	");
                    out.print("	              <input id='Text_socio' name='address1' type='text'  value='"+usr.getId()+"'placeholder='Ingrese el numero de Socio al que estara asociado' class='form-control input-md' required disabled >	");
                    out.print("	              </div>	");
                    out.print("	            </div>      	");                 
                    
                    
                }
                
                else if (rol==0)//si viene de un ususario administrador
                {
                    out.print("	                <select id='select_rol' name='selectbasic' class='form-control'>	");
                    out.print("	                    <option value='1'>Socio</option>	");
                    out.print("	                    <option value='2'>Afiliado</option>	");
                    out.print("	                    <option value='3'>Admministrador</option>	");
                    out.print("	                </select>	");
                    out.print("	              </div>	");
                    out.print("	            </div>	");      
                    
                    
                    //simplemente muestra la caja de texto para ingresar el id del socio, en caso de que el
                    //usuario a registrar sea un afiliado
                    
                    out.print("	            <div class='form-group' style='display: none' id='contenedor_id_socio'>	");       
                    out.print("	              <label class='col-md-4 control-label' for='address1'>Número de Socio</label>  	");
                    out.print("	              <div class='col-md-4'>	");
                    out.print("	              <input id='Text_socio' name='address1' type='text'  placeholder='Ingrese el numero de Socio al que estara asociado' class='form-control input-md' required pattern='^[0-9]*'>	");
                    out.print("	              </div>	");
                    out.print("	            </div>      	");                 
                    
                    
                } 

            %>
                    
  
            <div class="form-group">
              <label class="col-md-4 control-label" for="save"></label>
              <div class="col-md-8">
                  <button id="Boton_guardar" name="save" class="btn btn-success" disabled="true">Guardar</button>
                  <input type="button" id="Boton_cancelar" name="save" class="btn btn-danger" value="Cancelar"  ></input>

              </div>
            </div>


            </fieldset>
            </form>


    </div>
            
            
            <jsp:include page="comprueba_inicioSesion" flush="true"/>

    </body>

    
</html>
