<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        
     
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	
        <link rel="stylesheet" href="css/bootstrap.min.css">    
	<link rel="stylesheet" href="css/miEstilo.css">
        <link rel="stylesheet" href="css/animacion_carga.css">        

             <!-- Bootstrap CSS Toolkit styles -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
        <!-- Generic page styles -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Bootstrap styles for responsive website layout, supporting different screen sizes -->
        <!--<link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-responsive.min.css">-->
        <!-- Bootstrap CSS fixes for IE6 -->
        <!--[if lt IE 7]><link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-ie6.min.css"><![endif]-->
        <!-- Bootstrap Image Gallery styles -->
        <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
        <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
        <link rel="stylesheet" href="css/jquery.fileupload-ui.css">
        <!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
        <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        
        
        
        
        
        
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        

        

        
        
        <script>
            $(document).ready(function(){

                $("#formulario").submit(function(e) {
                    
                    $("#subida").click();
            
                    e.preventDefault();
                    var data = {
                            "Text_nombre_prodcuto"      : $("#Text_nombre_producto").val(),
                            "Text_descripcion"          : $("#Text_descripcion").val(),
                            "Text_lote"                 : $("#Text_lote").val(),
                            "Text_cantidad_lote"        : $("#Text_cantidad_lote").val(),   
                            "Text_cod_barras"           : $("#Text_cod_barras").val(),
                            "Text_costo"                : $("#Text_costo").val(),
                            "Text_peso"                 : $("#Text_peso").val(),
                            "Text_precio_socio"         : $("#Text_precio_socio").val(),
                            "Text_precio_afiliado"      : $("#Text_precio_afiliado").val(),
                            "select_categoria"          : $("#select_categoria option:selected").val(),
                            "Text_fecha_ingreso"        : $("#Text_fecha_ingreso").val(),
                            "Text_fecha_expiracion"     : $("#Text_fecha_expiracion").val()

                    };
                    
                    
                    $.ajax({
                            data:  data,
                            url:   'crea_producto',
                            type:  'post',
                            beforeSend: function () {

                            },
                            success:  function (response) {
                                if(response=="2627")//retorna la base de datos que el correo ya existe
                                {
                                    $("#cont").html(response);



                                }
                            }
                    });
                });
                return  false; 
            });
        </script>
        
        
        
        
        <title>JSP Page</title>
    </head>
    <body>
         
        <div>
        <form class="form-horizontal" id="formulario" role="form" >
        <fieldset>

            <div id="cont"></div>
            
            
            <legend>Ingresar Producto</legend>

            <div class="alert alert-danger  center-block clearfix" id="alerta" style='display:none;'><!--contenedor de la alertta-->
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <span id="alerta_correo" style='display:none;'><strong>Alerta: </strong>El correo eletronico ya esta registrado! </span>
                <span id="alerta_password" style='display:none;'><strong>Alerta: </strong>Las contraseñas no son iguales! </span>

            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Nombre Producto<font color="FF9100">*</font></label> 
              <div class="col-md-4">
                  <input id="Text_nombre_producto" type="text"  class="form-control input-md" required placeholder="">

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label">Descripcion<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_descripcion" type="text"  class="form-control input-md" required pattern='^[0-9]*' >

              </div>
            </div>
            
           <div class="form-group">
              <label class="col-md-4 control-label" for="city">Numero de lote<font color="FF9100">*</font></label>  
              <div class="col-md-4">
              <input id="Text_lote" name="city" type="text" class="form-control input-md" required="">

              </div>
            </div>



            <div class="form-group">
              <label class="col-md-4 control-label">Cantidad Producto del Lote<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_cantidad_lote" type="text"  class="form-control input-md" required placeholder="">

              </div>
            </div>
           

            <div class="form-group">
              <label class="col-md-4 control-label" for="phone">Codigo De Barras<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_cod_barras" name="phone" type="text"  class="form-control input-md" required placeholder="">
              </div>
            </div>
            

            <div class="form-group">
              <label class="col-md-4 control-label" for="address1">Costo Unidad<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_costo" name="address1" type="text"  placeholder=""  class="form-control input-md" required="">

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="email">Peso<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_peso"  type="text" placeholder="" class="form-control input-md" required >
              </div>
            </div>

            
            <div class="form-group">
              <label class="col-md-4 control-label" for="password">Precio Socio<font color="FF9100">*</font></label>
              <div class="col-md-4">
                <input id="Text_precio_socio"  type="text"  class="form-control input-md" required="">
              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" for="rpassword">Precio Afiliado<font color="FF9100">*</font> 
              </label>
              <div class="col-md-4">
                <input id="Text_precio_afiliado"  type="text"  class="form-control input-md" required="">

              </div>
            </div>
            
            


            <div class="form-group">
              <label class="col-md-4 control-label" for="selectbasic">Categoria<font color="FF9100">*</font></label>
              <div class="col-md-4">
                <select id="select_categoria" name="selectbasic" class="form-control">
                <option value="1">Jabon</option>
                <option value="2">xxx</option>
                </select>
              </div>
            </div>

            
             <div class="form-group">
              <label class="col-md-4 control-label" for="address1">Fecha de Ingreso<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_fecha_ingreso" type="text"  placeholder="" class="form-control input-md" required="">

              </div>
            </div>
            
            
             <div class="form-group">
              <label class="col-md-4 control-label" for="address1">Fecha de Expiracion<font color="FF9100">*</font></label>  
              <div class="col-md-4">
                  <input id="Text_fecha_expiracion" type="text"  placeholder="" class="form-control input-md" required="">

              </div>
            </div>
            
            <div>
            </div>
            
  
            <div class="form-group">
              <label class="col-md-4 control-label" for="save"></label>
              <div class="col-md-8">
                  <button id="Boton_guardar" name="save" class="btn btn-success">Guardar</button>
                  <input type="button" id="Boton_cancelar" name="save" class="btn btn-danger" value="Cancelar"  ></input>


              </div>
            </div>
            </fieldset>
            </form>     



   
                        <form id="fileupload" action="UploadServlet" method="POST" enctype="multipart/form-data">
                            <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                            <div class="row fileupload-buttonbar">
                                <div class="span7">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <span class="btn btn-info fileinput-button">
                                        <i class="icon-plus icon-white"></i>
                                        <span>Agregar imagenes</span>
                                        <input type="file" name="files[]" multiple>
                                    </span>
                                    <button type="submit" class="btn btn-primary start">
                                        <i class="icon-upload icon-white"></i>
                                        <span>Iniciar</span>
                                    </button>
                                    <button  id="subida" type="reset" class="btn btn-warning cancel" style="display: none">
                                        <i class="icon-ban-circle icon-white"></i>
                                        <span>Cancel upload</span>
                                    </button>
                                    <button type="button" class="btn btn-danger delete" style="display: none">
                                        <i class="icon-trash icon-white"></i>
                                        <span>Delete</span>
                                    </button>
                                </div>
                                <!-- The global progress information -->
                                <div class="span5 fileupload-progress fade">
                                    <!-- The global progress bar -->
                                    <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <div class="bar" style="width:0%;"></div>
                                    </div>
                                    <!-- The extended global progress information -->
                                    <div class="progress-extended">&nbsp;</div>
                                </div>
                            </div>
                            <!-- The loading indicator is shown during file processing -->
                            <div class="fileupload-loading"></div>
                            <br>
                            <!-- The table listing the files available for upload/download -->
                            <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
                        </form>
                    
                    
                    
                    
                    

        <script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-upload fade">
            <td class="preview"><span class="fade"></span></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">{%=locale.fileupload.error%}</span> {%=locale.fileupload.errors[file.error] || file.error%}</td>
            {% } else if (o.files.valid && !i) { %}
            <td>
            <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
            <button class="btn btn-primary">
            <i class="icon-upload icon-white"></i>
            <span>{%=locale.fileupload.start%}</span>
            </button>
            {% } %}</td>
            {% } else { %}
            <td colspan="2"></td>
            {% } %}
            <td class="cancel">{% if (!i) { %}
            <button class="btn btn-warning">
            <i class="icon-ban-circle icon-white"></i>
            <span>{%=locale.fileupload.cancel%}</span>
            </button>
            {% } %}</td>
            </tr>
            {% } %}
        </script>
        <!-- The template to display files available for download -->
        <script id="template-download" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-download fade">
            {% if (file.error) { %}
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">{%=locale.fileupload.error%}</span> {%=locale.fileupload.errors[file.error] || file.error%}</td>
            {% } else { %}
            <td class="preview">{% if (file.thumbnail_url) { %}
            <a href="{%=file.url%}" title="{%=file.name%}" rel="gallery" download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
            {% } %}</td>
            <td class="name">
            <a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
            {% } %}
            <td class="delete">
            <button class="btn btn-danger" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}">
            <i class="icon-trash icon-white"></i>
            <span>{%=locale.fileupload.destroy%}</span>
            </button>
            <input type="checkbox" name="delete" value="1">
            </td>
            </tr>
            {% } %}
        </script>
        
        
        <script src="js/vendor/jquery.ui.widget.js"></script>
        <!-- The Templates plugin is included to render the upload/download listings -->
        <script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
        <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
        <script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
        <!-- The Canvas to Blob plugin is included for image resizing functionality -->
        <script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
        
        <script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
        <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
        <script src="js/jquery.iframe-transport.js"></script>
        <!-- The basic File Upload plugin -->
        <script src="js/jquery.fileupload.js"></script>
        <!-- The File Upload file processing plugin -->
        <script src="js/jquery.fileupload-fp.js"></script>
        <!-- The File Upload user interface plugin -->
        <script src="js/jquery.fileupload-ui.js"></script>
        <!-- The localization script -->
        <script src="js/locale.js"></script>
        <!-- The main application script -->
        <script src="js/main.js"></script>
        <!-- The XDomainRequest Transport is included for cross-domain file deletion for IE8+ -->
        <!--[if gte IE 8]><script src="js/cors/jquery.xdr-transport.js"></script><![endif]-->
                    
    </body>
</html>
