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
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
    </head>
    <body>
        <jsp:include page="components/header.jsp"></jsp:include>
        <jsp:include page="components/navbar.jsp"></jsp:include>
        <div class="main-content">
            <div class="container cart-block-style">          
                <div class="breadcrumbs">
                    <a href="../Tiemthuoc/"><i class="fa fa-home"></i></a>
                    <a href="#">Giỏ hàng</a>
                </div>
                <div class="contentText">
                    <h1>Đây là hàng của bạn đã mua
                    </h1>
                </div>
<!--                <form>-->
                    <div class="table-responsive margin-top">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-center">ID SẢN PHẨM</td>
                                    <td class="text-center">SỐ LƯỢNG</td>
                                    
                                    <td class="text-center"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listItem}" var="item">
                                        <tr>
                                            <td class="text-center">                                   
                                               
                                                
                                            </td>
                                            <td class="text-center">                                   
                                                <a href="single-product?pid=${item.productID}" target="_blank">
                                                    <span class="btn-danger"><small>click để xem sản phẩm</small></span><br>
                                                    
                                                    ${item.productID}
                                                </a>
                                            </td>
                                            <td class="text-center">                                   
                                                <a href="#">
                                                    ${item.quantity}
                                                </a>
                                            </td>
                                            
                                            <td class="text-center">                                   
                                                <a href="#">
                                                </a>
                                            </td>
                                        </tr>    
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
<!--                </form>-->
              
                <div class="buttons">
                    <div class="pull-left"><a class="btn btn-default" href="#" onclick="quay_lai_trang_truoc()" >
                            <i class="fa fa-caret-right">
                        
                            </i>&nbsp;GO TO BACK</a></div>
                    <div class="pull-right"><a class="btn btn-primary reg_button" href="home">TRANG CHỦ</a></div>
                </div>
            </div>
        </div>


        <jsp:include page="components/footer.jsp"></jsp:include>
        <a style="display: none" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
            <i class="fa fa-chevron-up"></i>
        </a>
        <script>
            function quay_lai_trang_truoc(){
                history.back();
            }
        </script>
    </body>
</html> 