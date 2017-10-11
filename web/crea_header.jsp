<%-- 
    Document   : header
    Created on : 21/09/2017, 12:06:45 AM
    Author     : Manuelert5-Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.procesos"%>
<%@page import="elementos_sistemas.persona"%>

<%
            String nombre_usr= null;
            Integer id_usr= null;
            
            ///crea la parte inicial  del header
            out.print("<header id='id_header'>");
            
            out.print("	<nav class='navbar navbar-default'>	");
            out.print("	<div class='container-fluid'>	");
            out.print("	    <!-- Brand and toggle get grouped for better mobile display -->	");
            out.print("	<div class='navbar-header'>	");
            out.print("	<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1' aria-expanded='false'>	");
            out.print("	<span class='sr-only'>Toggle navigation</span>	");
            out.print("	<span class='icon-bar'></span>	");
            out.print("	<span class='icon-bar'></span>	");
            out.print("	<span class='icon-bar'></span>	");
            out.print("	</button>	");
            out.print("	<a class='navbar-brand' href='index.jsp'>Carita Feliz</a>	");
            out.print("	</div>	");
            out.print("	<!-- Collect the nav links, forms, and other content for toggling -->	");
            out.print("	<div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>	");
            out.print("	<ul class='nav navbar-nav'>	");
            out.print("	<li class='active'><a href='#'>Quienes Somos <span class='sr-only'>(current)</span></a></li>	");
            out.print("	<li><a href='#'>Contacto</a></li>	");
            out.print("	<li class='dropdown'>	");
            out.print("	<a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>Productos <span class='caret'></span></a>	");
            out.print("	<ul class='dropdown-menu'>	");
            out.print("	<li><a href='#'>Catalogo</a></li>	");
            out.print("	<li><a href='#'>Ofertas</a></li>	");
            out.print("	<li><a href='#'>Kits</a></li>	");
            out.print("	</ul>	");
            out.print("	</li>	");
            out.print("	</ul>	");

            persona usuario= (persona) session.getAttribute("usuario");

            if(usuario != null)//si la sesion ya existe es xq el usuario ya se logeo....
            {
                out.print("	<ul class='nav navbar-nav navbar-right'>	");
                out.print("	<li><a href='carrito.jsp'><img src='imagenes/carrito.png' ></a></li>	");
                out.print("	<li class='dropdown'>	");
                out.print("	<a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>"+usuario.getNombre()+" <span class='caret'></span></a>	");
                out.print("	<ul class='dropdown-menu'>	");
                
                if(usuario.getRol()==1)///rol de asocioado
                {
                    out.print("	<li><a href='#'>Mis Pedidos</a></li>	");
                    out.print("	<li><a href='#'>Mis Datos</a></li>	");       
                    out.print("	<li><a href='#' onclick='seleccion_afiliado_orden();'>Cambiar Orden</a></li>	");       
                    out.print("	<li><a href='registrar.jsp?rol=2'>Crear Afiliado</a></li>	");
                    out.print("	<li><a href='#'>Gestión de Afiliados</a></li>	");
                    
                }
                
                else if(usuario.getRol()==2)///rol de afliado
                {
                    out.print("	<li><a href='#'>Mis Pedidos</a></li>	");
                    out.print("	<li><a href='#'>Mis Datos</a></li>	");
                }
                
                else if (usuario.getRol()==3)//rol de administrador
                {   
                    out.print("	<li><a href='#'>Ingresar Producto</a></li>	");
                    out.print("	<li><a href='#'>Validar Compra</a></li>	");
                    out.print("	<li><a href='registrar.jsp?rol=0'>Crear Usuario</a></li>	");
                    out.print("	<li><a href='#'>Validar Usuario</a></li>	");                    
                }
                
                out.print("      <li class='divider'></li>");
                out.print("	<li><a href='cerrar_session'>Cerrar Sesión</a></li>	");
                out.print("	</ul>	");
                out.print("	</li>	");
                out.print("	</ul>	");

            }
            
            else//si la sesion no existe
            {
                out.print("	<ul class='nav navbar-nav navbar-right'>	");
                out.print("	<li><a href='#' data-toggle='modal' data-target='.login-register-form'>Iniciar Sesion</a>	");
                out.print("	</ul>	");

                ///modal para iniciar sesion
                out.print("	<!--modal se activa al dar click en iniciar session-->	");
                out.print("	        <div class='modal fade login-register-form' role='dialog'>	");
                out.print("	            <div class='modal-dialog modal-sm'>	");
                out.print("	                <div class='modal-content'>	");
                out.print("	                    <div class='modal-header'>	");
                out.print("	                        <button type='button' class='close' data-dismiss='modal'>	");
                out.print("	                            <span class='glyphicon glyphicon-remove'></span>	");
                out.print("	                        </button>	");
                out.print("	                        <ul class='nav nav-tabs'>	");
                out.print("	                            <li class='active'><a data-toggle='tab' href='#login-form'> Iniciar Sesión <span class='glyphicon glyphicon-user'></span></a></li>	");
                out.print("	                        </ul>	");
                out.print("	                    </div>	");
                out.print("	                    <div class='modal-body'>	");
                out.print("	                        <div class='tab-content'>	");
                out.print("	                            <div id='login-form' class='tab-pane fade in active'>	");
                out.print("	                                <div id='contenedor'>	");
                out.print("	                                </div>	");
                out.print("	                                <form  id='formulario' role='form'>	");
                out.print("	                                    <div class='form-group'>	");
                out.print("	                                        <label for='email'>Email:</label>	");
                out.print("	                                        <input type='email' class='form-control' id='email' placeholder='Ingrese Mail' name='email' required>	");
                out.print("	                                    </div>	");
                out.print("	                                    <div class='form-group'>	");
                out.print("	                                        <label for='pwd'>Contraseña:</label>	");
                out.print("	                                        <input type='password' class='form-control' id='pass' placeholder='Ingrese Password' name='pwd' required>	");
                out.print("	                                    </div>	");
                out.print("	                                    <div class='checkbox'>	");
                out.print("	                                        <label><input type='checkbox' name='remember'>Recordarme</label>	");
                out.print("	                                    </div>	");
                out.print("	                                    <button id='Boton_guardar' name='save' class='btn btn-success' >Iniciar Sesión</button>	");
                out.print("	<div id='fountainG' style='display: none'>");
                out.print("	<div id='fountainG_1' class='fountainG'></div>	");
                out.print("	<div id='fountainG_2' class='fountainG'></div>	");
                out.print("	<div id='fountainG_3' class='fountainG'></div>	");
                out.print("	<div id='fountainG_4' class='fountainG'></div>	");
                out.print("	<div id='fountainG_5' class='fountainG'></div>	");
                out.print("	<div id='fountainG_6' class='fountainG'></div>	");
                out.print("	<div id='fountainG_7' class='fountainG'></div>	");
                out.print("	<div id='fountainG_8' class='fountainG'></div>	");
                out.print("	</div>	");
                out.print("	                                </form>	");
                out.print("	                            </div>	");
                out.print("	                        </div>	");
                out.print("	                    </div>	");
                out.print("	                </div>	");
                out.print("	            </div>	");
                out.print("	        </div>	");
                out.print("	        <!--Termina modal de logeo-->	");
            }            
        out.print("	<form class='navbar-form navbar-right'>	");
        out.print("	<div class='form-group'>	");
        out.print("	<input type='text' class='form-control' placeholder='Buscar'>	");
        out.print("	</div>	");
        out.print("	<button type='submit' class='btn btn-default'><img src='imagenes/buscar.png' alt=''></button>	");
        out.print("	</form>	");
        out.print("	</div><!-- /.navbar-collapse -->	");
        out.print("	</div><!-- /.container-fluid -->	");
        out.print("	</nav>	");


        out.print("</header>");
        
        
        
        if(usuario!=null)//si hay una sesion valida
        {
            if(usuario.getRol()==1)//si el usuario tiene un rol de asociasdo
            {
                procesos consulta=new procesos();
                String id=Integer.toString(usuario.getId());
                
                try 
                {
                    consulta.crea_conexion();
                    ResultSet rs= consulta.llama_funcion("retorna_afiliados_de_socio",id);
                    
                    out.print(  "	<div id='modal_seleccion_orden' class='modal fade' role='dialog'>	"+
                                "	  <div class='modal-dialog modal-sm'>	"+
                                "		"+
                                "	    <!-- Modal content-->	"+
                                "	    <div class='modal-content'>	"+
                                "	      <div class='modal-header'>	"+
                                "	        <h4 class='modal-title'>Seleccione al afiliado al que desea generar un pedido</h4>	"+
                                "	      </div>	"+
                                "	      <div class='modal-body'>	"+
                                "	      	<div class='row'>"+
                                "                   <table class='table table-hover'>"+  
                                "                      <tbody>");
                    
                    while(rs.next())
                    {
                        out.print("                        <tr onclick='guarda_seleccion_del_afiliado("+rs.getString("id_persona_afiliado")+")'>"+
                                  "                            <td>"+rs.getString("nombre")+" "+rs.getString("apellido")+"</td>"+
                                  "                            <td> </td>"+
                                  "                            </td>");
                    }
                                     
                    out.print( "                      </tbody>"+
                                "                    </table>"+
                                "                </div>	"+
                                "		"+
                                "		"+
                                "		"+
                                "		"+
                                "	      </div>	"+
                                "	      <div class='modal-footer'>	"+
                            
                                "	<div class='btn-group btn-group-justified' role='group' aria-label='group button'>	"+
                                "           <div class='btn-group' role='group'>	"+
                                "               <button type='button' onclick='guarda_seleccion_del_afiliado("+usuario.getId()+")' class='btn btn-info btn-hover-green' role='button'>Deseo generar un pedido para mi</button>	"+
                                "           </div>	"+
                                "	</div>	"+

                                "		"+
                                "	      </div>	"+
                                "	    </div>	"+
                                "		"+
                                "	  </div>	"+
                                "	</div>	");
                } 
                catch (Exception e) 
                {
                
                }
                finally
                {
                    consulta.cierra_conexion();
                }
                if(session.getAttribute("id_seleccion_carrito")==null)               
                {
                    out.print("<script>");
                    out.print("	    $(document).ready(function seleccion_orden(){	");
                    out.print("	        $('#modal_seleccion_orden').modal({backdrop: 'static', keyboard: false});	");
                    out.print("	        $('#modal_seleccion_orden').modal('show');	");
                    out.print("	    });	");
                    out.print("</script>");
                }
            }
        }
%>