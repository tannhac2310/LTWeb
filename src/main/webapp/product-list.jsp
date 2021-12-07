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
                        <div class="contentText">
                            <div class="breadcrumbs">
                                <a href="../Tiemthuoc/"><i class="fa fa-home"></i></a>
                                <a href="#">Product Lists</a>
                            </div>
                            <h1>Search: ${Search}</h1>
                            <c:forEach items="${oneSearch}" var="onet">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-6"><img class="img-thumbnail"  src="${onet.image}"></div>
                                    <div class="col-sm-10 col-xs-6"><p>
                                            ${onet.title}</p>
                                    </div>
                                </div>
                            </c:forEach>
                            <hr>
                            <h3>Refine Search</h3>
                            <div class="row">
                                <div class="col-sm-3">
                                    <ul>
                                        <li><a href="#">Ab (0)</a></li>
                                        <li><a href="#">AB-one (1)</a></li>
                                    </ul>
                                </div>
                            </div>
                            <p><a id="compare-total" href="#">Product Compare (0)</a></p>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="btn-group hidden-xs">
                                        <a class="btn btn-default" id="list-view" ><i class="fa fa-th-list"></i></a>
                                        <a class="btn btn-default" id="grid-view" href="product.jsp"><i class="fa fa-th"></i></a>   
                                    </div>
                                </div>
                                <div class="col-md-2 text-right txt-left">
                                    <label for="input-sort" class="control-label">Sort By:</label>
                                </div>
                                <div class="col-md-3 text-right">
                                    <select  class="form-control" id="input-sort">
                                        <option selected="selected">Default</option>
                                        <option>Name (Z - A)</option>
                                    </select>
                                </div>
                                <div class="col-md-1 text-right txt-left">
                                    <label for="input-limit" class="control-label">Show:</label>
                                </div>
                                <div class="col-md-2 text-right">
                                    <select  class="form-control" id="input-limit">
                                        <option selected="selected">15</option>
                                        <option>25</option>
                                        <option>50</option>
                                        <option>75</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row margin-top">
                            <c:forEach items="${listSearch}" var="sr">
                                <div class="product-layout product-list col-xs-12">
                                    <div class="product-thumb">
                                        <div class="image"><a href="single-product?pid=${sr.id}"><img class="img-responsive"  src="${sr.image}" width="200" height="200"></a></div>
                                        <div class="product-details-box" style="overflow: hidden">
                                            <div class="caption">
                                                <h4 class="product_title"><a href="single-product?pid=${sr.id}">${sr.title}</a></h4>
                                                <p>
                                                    ${sr.name}</p>
                                                <p class="price">
                                                    <span class="new_price">${sr.getPriceCurrencyFormat()}</span> 
                                                    <!--<span class="old_price">€122.00</span>-->
                                                    <span class="price-tax">ID CODE: ${sr.id}</span>
                                                </p>
                                            </div>
                                            <!--<div class="button-group">!-->
                                            <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline-block">
                   
                                                <button class="btn btn-default" style="padding: 10px 15px" name="pid" type="submit" value="${sr.id}">BUY NOW!</button> 
                                            </form>
                                            <div class="pull-right">
                                                <button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-heart"></i></button>
                                                <button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-exchange"></i></button>
                                            </div>
                                            <!--</div>!-->
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>    
                            </div>
<!--                            <div class="row">
                                <div class="col-sm-6 text-left"></div>
                                <div class="col-sm-6 text-right">Showing 1 to 12 of 12 (1 Pages)</div>
                            </div>-->
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