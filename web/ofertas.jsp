<%-- 
    Document   : ofertas
    Created on : 31/10/2017, 04:14:03 AM
    Author     : Manuelert5-Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <style>
            @import url('https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700&subset=latin-ext,vietnamese');   
            body{font-family: 'Quicksand', sans-serif;}
            h4{
                font-weight: 600;
            }
            p{
                font-size: 12px;
                margin-top: 5px;
            }
            .price{
                font-size: 30px;
                margin: 0 auto;
                color: #333;
            }

            .thumbnail{
                opacity:0.70;
                -webkit-transition: all 0.5s; 
                transition: all 0.5s;
            }
            .thumbnail:hover{
                opacity:1.00;
                box-shadow: 0px 0px 10px #4bc6ff;
            }
            .line{
                margin-bottom: 5px;
            }

            span.thumbnail {
                border: 1px solid #00c4ff !important;
                border-radius: 0px !important;
                -webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.16);
                -moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.16);
                box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.16);
                padding: 10px;
            }
            .container h4{margin-top:70px; margin-bottom:30px;}
            button {    margin-top: 6px;
            }
            .right {
                float: right;
                border-bottom: 2px solid #0a5971;
            }
            .btn-info {
                color: #fff;
                background-color: #19b4e2;
                border-color: #19b4e2;
                font-size:13px;
                font-weight:600;
            }

            /*en media query max es como decir menor o igual/*
            /*en media query min es como decir mayor o igual/*
            



            /* Small Devices, Tablets */
            @media only screen and (max-width : 768px) {
                .carruselEscritorio{
                    display: none;
                }

                   
                


            }            

                        /* Small Devices, Tablets */
            @media only screen and (min-width : 768px) {
                .right{
                    float:left;
                    width: 100%;
                }
                .carruselTelefono{
                    display: none;
                }
            
            }
            

            /* Dispositivos largos (desktops, 992px and up)*/

            @media (min-width: 992px) { 
 

                .imagen{
                    height: 300px;
                    width: 300px;
                }
            }

            /* DIspositivos extra largos(large desktops, 1200px and up)*/
            @media (max-width: 1200px) {


                .imagen{
                    height: 300px;
                    width: 300px;
                }
            }








            body{padding-top:20px;}
            .carousel {
                margin-bottom: 0;
                padding: 0 40px 30px 40px;
            }
            /* The controlsy */
            .carousel-control {
                left: -12px;
                height: 40px;
                width: 40px;
                background: none repeat scroll 0 0 #222222;
                border: 4px solid #FFFFFF;
                border-radius: 23px 23px 23px 23px;
                margin-top: 250px;
            }
            .carousel-control.right {
                right: -12px;
            }
            /* The indicators */
            .carousel-indicators {
                right: 50%;
                top: auto;
                bottom: -10px;
                margin-right: -19px;
            }
            /* The colour of the indicators */
            .carousel-indicators li {
                background: #cecece;
            }
            .carousel-indicators .active {
                background: #428bca;
            }

        </style>

    </head>
    <body>
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">

                        <div class="row carruselEscritorio"><!--carrusel dispositivos largos-->
                            <div class="col-md-12">
                                <div id="Carousel" class="carousel slide">

                                    <ol class="carousel-indicators">
                                        <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#Carousel" data-slide-to="1"></li>
                                        <li data-target="#Carousel" data-slide-to="2"></li>
                                    </ol>

                                    <!-- Carousel items -->
                                    <div class="carousel-inner">

                                        <div class="item active">
                                            <div class="row">
                                                <div class="col-md-1 col-sm-1">
                                                </div>
                                                <div class="col-md-5 col-sm-5">
                                                    <span class="thumbnail">
                                                        <img src="img/perfme 350x350.jpg"  class="img-responsive imagen" alt="...">
                                                        <h4>Product Tittle</h4>
                                                        <div class="ratings">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </div>
                                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                                                        <hr class="line">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6">
                                                                <span class="price">$29,90</span>
                                                                <span style="color: red;"><strike>$40,42</strike></span>

                                                            </div>
                                                            <div class="col-md-6 col-sm-6">
                                                                <a href="http://cookingfoodsworld.blogspot.in/" target="_blank" >	<button class="btn btn-info right " ><span class="glyphicon glyphicon-shopping-cart"> </span>  Agregar</button></a>
                                                            </div>

                                                        </div>
                                                    </span>
                                                </div>   
                                                <div class="col-md-5 col-sm-5">
                                                    <span class="thumbnail">
                                                        <img src="img/perfme 350x350.jpg"  class="img-responsive imagen" alt="...">
                                                        <h4>Product Tittle</h4>
                                                        <div class="ratings">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </div>
                                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                                                        <hr class="line">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6">
                                                                <span class="price">$29,90</span>
                                                                <span style="color: red;"><strike>$40,42</strike></span>

                                                            </div>
                                                            <div class="col-md-6 col-sm-6">
                                                                <a href="http://cookingfoodsworld.blogspot.in/" target="_blank" >	<button class="btn btn-info right " ><span class="glyphicon glyphicon-shopping-cart"> </span>  Agregar</button></a>
                                                            </div>

                                                        </div>
                                                    </span>
                                                </div>  

                                            </div><!--.row-->
                                        </div><!--.item-->


                                    </div><!--.carousel-inner-->
                                    <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                                    <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                                </div><!--.Carousel-->

                            </div>
                        </div>



                        <div class="row carruselTelefono"><!--carrusel dipositivos pequeños-->
                            <div class="col-md-12">
                                <div id="Carousel" class="carousel slide">

                                    <ol class="carousel-indicators">
                                        <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#Carousel" data-slide-to="1"></li>
                                        <li data-target="#Carousel" data-slide-to="2"></li>
                                    </ol>

                                    <!-- Carousel items -->
                                    <div class="carousel-inner">

                                        <div class="item active">
                                            <div class="row">
                                                <div class="col-md-1 col-sm-1">
                                                </div>
                                                <div class="col-md-5 col-sm-5">
                                                    <span class="thumbnail">
                                                        <img src="img/perfme 350x350.jpg"  class="img-responsive imagen" alt="...">
                                                        <h4>Product Tittle</h4>
                                                        <div class="ratings">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star"></span>
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </div>
                                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                                                        <hr class="line">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6">
                                                                <span class="price">$29,90</span>
                                                                <span style="color: red;"><strike>$40,42</strike></span>

                                                            </div>
                                                            <div class="col-md-6 col-sm-6">
                                                                <a href="http://cookingfoodsworld.blogspot.in/" target="_blank" >	<button class="btn btn-info right " ><span class="glyphicon glyphicon-shopping-cart"> </span>  Agregar</button></a>
                                                            </div>

                                                        </div>
                                                    </span>
                                                </div>   


                                            </div><!--.row-->
                                        </div><!--.item-->


                                    </div><!--.carousel-inner-->
                                    <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                                    <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                                </div><!--.Carousel-->

                            </div>
                        </div>





                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>



    </body>
</html>
