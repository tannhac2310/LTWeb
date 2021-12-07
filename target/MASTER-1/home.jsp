<%@page import="DAO.*"%>
<%@page import="Entity.*"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" href="images/favicon.png"/>
        <title>Healthcare</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/> 
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/owl-carousel.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/owl-carousel.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
    </head>
    <body>
        <jsp:include page="components/header.jsp"></jsp:include> 
        <jsp:include page="components/navbar.jsp"></jsp:include>
        <div id="site_content">
            <div class="container">
                <div class="row">
                <jsp:include page="components/sidebar.jsp"></jsp:include>
                    <div class="col-md-9 col-sm-8 col-xs-12 right_sidebar1">
                        <div id="right_part">
                            <div class="contentContainer">
                                <div class="contentText">
                                    <div class="breadcrumbs">
                                        <a href="../Tiemthuoc/" class="headerNavigation"><i class="fa fa-home"></i></a>			
                                    </div>
                                </div>

                                <!----slidder start-!-->
                                <div class="contentText">
                                    <div class="infoBoxHeading">Bán chạy nhất</div>

                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12"  >
                                            <!--                                        <div class="bg_best">-->
                                            <div class="bg_best">
                                                <div class="owl-carousel">                                                             
                                                    <c:forEach items="${listProductTOP}" var="ts">
                                                        <div class="item">
                                                            <span>
                                                                <a href="single-product?pid=${ts.id}">
                                                                    <img class="carasoul_image" src="${ts.image}">
                                                                </a></span>
                                                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                                                    
                                                                    <button class="btn btn-default" name="pid" type="submit" value="${ts.id}">BUY NOW!</button> 
                                                                </form>
                                                        </div>
                                                    </c:forEach>
                                                    
                                                </div>

                                                <script>
                                                    $(document).ready(function () {
                                                        $('.owl-carousel').owlCarousel({
                                                            loop: true,
                                                            margin: 10,
                                                            responsiveClass: true,
                                                            responsive: {
                                                                0: {
                                                                    items: 2,
                                                                    nav: true
                                                                },
                                                                600: {
                                                                    items: 3,
                                                                    nav: false
                                                                },
                                                                1000: {
                                                                    items: 5,
                                                                    nav: true,
                                                                    loop: false,
                                                                    margin: 20
                                                                }

                                                            }
                                                        })
                                                    })
                                                </script>
                                            </div>
                                            <!--                                    </div>-->
                                        </div>
                                    </div>
                                </div>
                                <!----slidder End-!-->
                                <!----content_1--!-->
                                <div class="contentText Static">
                                    <h1>TẠI SAO CHÚNG TÔI HOẠT ĐỘNG?</h1>
                                    <p>Sức khoẻ của bạn là hạnh phúc của chúng tôi. </p>
                                    <p>Chia sẻ những kiến thức và thông tin hữu ích giúp chăm sóc và bảo vệ sức khoẻ cho cả gia đình bạn.</p>
                                </div>
                                <!----content_1 End--!-->


                                <!----content_2 For New Products--!-->
                                <div class="contentText">
                                    <h1>SẢN PHẨM CHỐNG DỊCH</h1>
                                        <div class="row margin-top product-layout_width">
                                            
                                            <c:forEach items="${listProductC3}" var="o">
                                                <div class="product-layout  col-md-4 col-sm-6 col-xs-12">
                                                    <div class="product-thumb-height">
                                                        <div class="product-thumb transition">
                                                            <ul>
                                                                <li class="li_product_title">
                                                                    <div class="product_title">
                                                                        <a href="single-product?pid=${o.id}">${o.title}</a>
                                                                    </div></li>
                                                                <li class="li_product_image">
                                                                    <div class="image">
                                                                        <a href="single-product?pid=${o.id}">
                                                                            <img src="${o.image}" class="img-responsive" width="200" height="200" />
                                                                        </a>

                                                                    </div>
                                                                </li>
                                                                <li class="li_product_price">
                                                                    <span class="old_price1"></span>
                                                                    <span class="new_price1">${o.getPriceCurrencyFormat()}</span>
                                                                    <span class="saving1"></span><li>
                                                                <li class="li_product_desc">
                                                                    <div class="caption">
                                                                        <p>
                                                                            ${o.name}
                                                                        </p>
                                                                    </div>
                                                                </li>
                                                                <li class="li_product_buy_button">
                                                                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline-block">
                   
                                                                        <button class="btn btn-default" style="padding: 10px 15px" name="pid" type="submit" value="${o.id}">BUY NOW!</button> 
                                                                    </form>
                                                                    <div class="pull-right">
                                                                        <button  type="button" class="btn btn-primary wish_button"><i class="fa fa-heart"></i></button>
                                                                        <button  type="button" class="btn btn-primary wish_button"><i class="fa fa-exchange"></i></button>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                           
                                        </div>
                                </div>
                                <!----content_2 End--!-->

                                <!----content_3--!-->
                                <div class="contentText">
                                    <h1>BẢO VỆ SỨC KHOẺ</h1>
                                    <div class="row margin-top product-layout_width">  
                                        <c:forEach items="${listProductC6}" var="op">
                                            <div class="product-layout  col-md-4 col-sm-6 col-xs-12">
                                                <div class="product-thumb-height">
                                                    <div class="product-thumb transition">
                                                        <ul>
                                                            <li class="li_product_title">
                                                                <div class="product_title">
                                                                    <a href="single-product?pid=${op.id}">${op.title}</a>
                                                                </div></li>
                                                            <li class="li_product_image">
                                                                <div class="image">
                                                                    <a href="single-product?pid=${op.id}">
                                                                        <img src="${op.image}" class="img-responsive" width="200" height="200"/>
                                                                    </a>

                                                                </div>
                                                            </li>
                                                            <li class="li_product_price">
                                                                <span class="old_price1"></span>
                                                                <span class="new_price1">${op.getPriceCurrencyFormat()}</span>
                                                                <span class="saving1"></span><li>
                                                            <li class="li_product_desc">
                                                                <div class="caption">
                                                                    <p>
                                                                        ${op.name}
                                                                    </p>
                                                                </div>
                                                            </li>
                                                            <li class="li_product_buy_button">
                                                                <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline-block">
                   
                                                                    <button class="btn btn-default" style="padding: 10px 15px" name="pid" type="submit" value="${op.id}">BUY NOW!</button> 
                                                                </form>
                                                                <div class="pull-right">
                                                                    <button  type="button" class="btn btn-primary wish_button"><i class="fa fa-heart"></i></button>
                                                                    <button  type="button" class="btn btn-primary wish_button"><i class="fa fa-exchange"></i></button>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                    </c:forEach>
                                    </div>
                                </div>
                                <!----content_3 End--!-->
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>



        <jsp:include page="components/footer.jsp"></jsp:include>
        <a style="display: none" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </body>
</html> 
