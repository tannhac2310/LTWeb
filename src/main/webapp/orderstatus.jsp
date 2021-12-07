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
                    <h1>Đây là các đơn hàng của bạn
                    </h1>
                </div>
<!--                <form>-->
                    <div class="table-responsive margin-top">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-center">INVOICE ID</td>
                                    <td class="text-center">INVOICE DATE</td>
                                    <td class="text-center">TOTAL AMOUNT</td>
                                    <td class="text-center">STATUS</td>
                                    <td class="text-center">DETAILS</td>
                                    
                                    <td class="text-center"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listorder}" var="item">
                                        <tr>
                                            <td class="text-center">                                   
                                               
                                                
                                            </td>
                                            <td class="text-center">                                   
                                                <a href="#">
                                                    ${item.invoiceID}
                                                </a>
                                            </td>
                                            <td class="text-center">                                   
                                                <a href="#">
                                                    ${item.invoiceDate}
                                                </a>
                                            </td>
                                            <td class="text-center">                                   
                                                <a href="#">
                                                    ${item.totalAmount} VND
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <c:set var="isok" value="${item.isProccessed}"/>
                                                <c:choose>
                                                    <c:when test="${isok == '110'}">
                                                        <a href="#">
                                                           🚙🚙🚙 ĐANG GIAO ...
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="#">
                                                            GIAO THÀNH CÔNG
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">                                   
                                                <a href="detailorder?iid=${item.invoiceID}">
                                                    <span class="alert-danger"><b>XEM
                                                        <i class="fa fa-search-plus"></i>
                                                        </b></span>
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
                        
                            </i>&nbsp;Continue Shopping</a></div>
                    
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