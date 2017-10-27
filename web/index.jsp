<%-- 
    Document   : index2
    Created on : 1/09/2017, 10:45:48 PM
    Author     : Manuelert5-Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/inicia_sesion.js"></script>    

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/miEstilo.css">
        <link rel="stylesheet" href="css/animacion_carga.css">
        <link rel="stylesheet" href="css/carrusel.css">

        <title></title>
    </head>
    <body>

        <jsp:include page="crea_header.jsp" flush="true"/>

        <div id="myCarousel" class="carousel slide" >
            <!-- Indicators -->

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="img/blade runner.jpg" class="img-responsive">

                </div>

                <div class="item">
                    <img src="img/lucifer morningstar.jpg" class="img-responsive">
                </div>

                <div class="item">
                    <img src="img/undertale.png" class="img-responsive">
                </div>

                <div class="item">
                    <img src="img/eudald_1.jpg">
                </div>




            </div>



            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>



    </body>
</html>
