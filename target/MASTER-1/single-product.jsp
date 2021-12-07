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
        <script src="js/jquery.min.js"></script>
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
                    <div class="col-md-9 col-sm-8 col-xs-12" id="content">            
                        <div class="breadcrumbs">
                            <a href="../Tiemthuoc/"><i class="fa fa-home"></i></a>
                            <a href="../Tiemthuoc/">Single Product</a>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="thumbnails">
                                    <li><a  href="#" class="thumbnail fix-box"><img class="changeimg" src="${SingleProduct.image}"></a></li>
                                    <li class="image-additional"><a title="Dianabol"  class="thumbnail"> 
                                            <img class="galleryimg" src="${SingleProduct.image}"></a></li>
                                    <li class="image-additional"><a title="Proviron"  class="thumbnail"> 
                                            <img class="galleryimg" src="${SingleProduct.image}"></a></li>
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <div class="btn-group">
                                    <button  title="" class="btn btn-default mr_5"  type="button"><i class="fa fa-heart"></i></button>
                                    <button  title="" class="btn btn-default"  type="button"><i class="fa fa-exchange"></i></button>
                                </div>
                                <h1 style="color: #39baf0">${SingleProduct.name}</h1>
                                <ul class="list-unstyled product-section">
                                    <li><span>Product Code:</span> ${SingleProduct.id}</li>
                                    <li><span>Reward Points:</span> 1000</li>
                                    <li><span>Availability:</span> <span class="check-stock">Pre-Order</span></li>
                                </ul>
                                <ul class="list-unstyled">
                                    <li>
                                        <h2>${SingleProduct.getPriceCurrencyFormat()}</h2>
                                    </li>
                                   
                                </ul>
                                <div id="product">
                                    <div class="form-group">
                                        <label for="input-quantity" class="control-label">Quantity</label>
                                        
                                        
                                        <br>
                                        <!--Thêm ở đây -->
                                        <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline-block">
                                            <input type="hidden" value="${SingleProduct.id}" name="pid">
                                            <input type="text" class="form-control" id="input-quantity" size="50" value="1" name="quantity">
                                            <button class="btn btn-primary btn-lg btn-block reg_button" style="padding: 10px 15px" type="submit" data-original-title="Upload">
                                                <i class="fa fa-shopping-cart"></i>
                                                BUY NOW!
                                            </button> 
                                        </form>
                                        <!--Ở đây -->
                                    </div>
                                </div>
                                <div class="rating">
                                    <p>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
<!--                                        <a  href="home.jsp">0 reviews</a> / <a  href="home.jsp">Write a review</a> -->
                                    </p>
                                    <hr>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="nav nav-tabs">
                                    <li class=""><a data-toggle="tab" href="#tab-description" aria-expanded="false">Description</a></li>
                                    <li class="active"><a data-toggle="tab" href="#tab-review" aria-expanded="true">Reviews (0)</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="tab-description" class="tab-pane">
                                        <div class="row ">
                                            <p>${SingleProduct.description}.</p>
                                        </div>
                                    </div>
                                    <div id="tab-review" class="tab-pane active">
                                        <form id="form-review" class="form-horizontal">

                                            <h2>Write a review</h2>
                                            <div class="form-group required">
                                                <div class="col-sm-12">
                                                    <label for="input-name" class="control-label">Your Name</label>
                                                    <input type="text" class="form-control" id="input-name" value="" name="name">
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <div class="col-sm-12">
                                                    <label for="input-review" class="control-label">Your Review</label>
                                                    <textarea class="form-control" id="input-review" rows="5" name="text"></textarea>
                                                    <div class="help-block"><span class="text-danger">Note:</span> HTML is not translated!</div>
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <div class="col-sm-12">
                                                    <label class="control-label">Rating</label>
                                                    &nbsp;&nbsp;&nbsp; Bad&nbsp;
                                                    <input type="radio" value="1" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="2" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="3" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="4" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="5" name="rating">
                                                    &nbsp;Good</div>
                                            </div>
                                            <div class="buttons clearfix">
                                                <div class="pull-right">
                                                    <button class="btn btn-primary reg_button"  id="button-review" type="button">
                                                        <i class="fa fa-caret-right"></i>&nbsp;
                                                        Continue                                       
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
        <script>
            $("document").ready(function () {

                $(".galleryimg").on("click", function () {
                    var src = $(this).attr('src');
                    console.log(src)
                    $(".changeimg").attr('src', src);
                });
            });
        </script>
    </body>
</html> 