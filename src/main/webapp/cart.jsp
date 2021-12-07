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
                <div class="buttons pull-right">
                    <div class="pull-left"><a class="btn btn-default" href="#" onclick="quay_lai_trang_truoc()" >
                            <i class="fa fa-caret-right">
                        
                            </i>&nbsp;Continue Shopping</a></div>
                </div>
                <div class="contentText">
                    <h1>Đây là giỏ hàng của bạn
                    </h1>
                </div>
<!--                <form>-->
                    <div class="table-responsive margin-top">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-left">SẢN PHẨM</td>
                                    <td class="text-left">LOẠI</td>
                                    <td class="text-left">SỐ LƯỢNG</td>
                                    <td class="text-right">ĐƠN GIÁ</td>
                                    <td class="text-right">TỔNG CỘNG</td>
                                    <td class="text-right">XOÁ</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart.items}" var="item">
                                        <tr>
                                        <td class="text-center">                                   
                                            <a href="single-product.jsp">
                                                <img title="ana"  src="${item.product.image}" style="width: 100px; height: 80px;">
                                            </a>
                                        </td>
                                        <td class="text-left"><a href="#"><small>${item.product.name}</small></a>
                                            <br>
                                            <small>Title</small>
                                            <br>
                                            <small>ID: ${item.product.id}</small>
                                        </td>
                                        <td class="text-left"><br>${item.product.title}</td>
                                        <td class="text-left"><br><div style="max-width: 200px;" class="input-group btn-block ">
                                                <!--Tru san pham-->
<!--                                                <span class="input-group-btn">
                                                    <form>
                                                        <button class="btn btn-warning" type="submit" data-original-title="Subtract"><i class="fa fa-minus"></i></button>
                                                    </form>
                                                </span>-->
                                                <!--O tang giam-->
                                                <span class="input-group-btn">
                                                    <form action="" method="post">
                                                        <!--Chưa xong-->
                                                            <input type="hidden" class="form-control text-center input-sm" name="pid" value="<c:out value='${item.product.id}'/>">
                                                            <input type="text" style="width: 55%" class="form-control text-center" name="quantity" value="<c:out value='${item.quantity}'/>" id="quantity">
                                                            
                                                            <button class="btn btn-primary" type="submit" data-original-title="Upload">
                                                                <i class="fa fa-refresh"></i>
                                                            </button>
                                                            <span></span>
                                                    </form>
                                                
                                                
                                                </span>
                                            </div></td>
                                        <td class="text-right"><br>${item.product.getPriceCurrencyFormat()}</td>
                                        <td class="text-right"><br>${item.getPriceTotalFormat()}</td>
                                        <c:set var="total" value="${item.getTotal() + total}"/>
                                            <%--</c:set>--%>
                                        
                                        <td class="text-right"><br> 
                                            <!--Xoa san pham-->
                                                <form action="" method="post">
                                                    <input type="hidden" name="pid" value="<c:out value='${item.product.id}'/>">
                                                    <button class="btn btn-danger" type="submit" name="quantity" value="0" data-original-title="Remove">
                                                        <i class="fa fa-times-circle"></i>
                                                    </button>
                                                </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
<!--                </form>-->
                <h2>Bạn muốn làm gì tiếp theo?</h2>
                <p>Hãy chọn nếu bạn có mã giảm giá và nhập địa chỉ muốn ship nhé!</p>
                <div id="accordion" class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a data-parent="#accordion" data-toggle="collapse" class="accordion-toggle" href="#collapse-coupon" aria-expanded="true">Sử dụng mã giảm giá <i class="fa fa-caret-down"></i></a></h4>
                        </div>
                        <div class="panel-collapse collapse in" id="collapse-coupon" style="" aria-expanded="true">
                            <div class="panel-body">
                                <label for="input-coupon" class="col-sm-2 control-label">Nhập mã giảm giá</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="input-coupon" placeholder="Nhập mã giảm giá ở đây" value="" name="coupon">
                                    <span class="input-group-btn">
                                        <input type="button" class="btn btn-primary"  id="button-coupon" value="Chấp nhận">
                                    </span></div>

                            </div>
                        </div>
                    </div>
<!--                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a data-parent="#accordion" data-toggle="collapse" class="accordion-toggle collapsed" href="#collapse-shipping" aria-expanded="false">Địa chỉ giao hàng <i class="fa fa-caret-down"></i></a></h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapse-shipping" style="height: 0px;" aria-expanded="false">
                            <div class="panel-body">
                                <p>Nhập nơi giao hàng để tính phí vận chuyển</p>
                                <div class="form-horizontal">
                                    <div class="form-group required">
                                        <label for="input-country" class="col-sm-2 control-label">Quốc gia</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="input-country" name="country_id">
                                                <option value=""> --- Hãy chọn --- </option>
                                                <option value="1">Việt Nam</option>
                                                
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-zone" class="col-sm-2 control-label">Tỉnh/Thành phố</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="input-zone" name="zone_id"><option value=""> --- Hãy chọn --- </option>
                                                <option value="3513">Thành phố Hồ Chí Minh</option>
                                                <option value="3514">Bình Thuận</option>
                                                <option value="3515">Đà Nẵng</option> 
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-postcode" class="col-sm-2 control-label">Mã bưu điện</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-postcode" placeholder="Nhập mã bưu điện" value="" name="postcode">
                                        </div>
                                    </div>
                                    <button class="btn btn-primary"  id="button-quote" type="button">Chấp nhận</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    
                </div>-->
                <br>
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-8">
                        <table class="table table-bordered">
                            <tbody><tr>
                            <strong style="font-size: 30px;float: right">Chi tiết hoá đơn</strong>
                            <td class="text-right"><strong>Tổng sản phẩm:</strong></td>
                            <td class="text-right">
                                <c:set var="total" value="${item.getTotal() + total}"/>
                                                <c:if test="${total > 0}">
                                                    <p><c:out value="${total}"/> VNĐ</p>
                                                </c:if>
                            </td>
                            </tr>
                            <tr>
                                <td class="text-right">Mã giảm giá:</td>
                                <td class="text-right">0 VNĐ</td>
                            </tr
                            <tr>
                                <td class="text-right">Phí vận chuyển (5%):</td>
                                <td class="text-right">
                                    <c:set var="total" value="${item.getTotal() + total}"/>
                                                <c:if test="${total > 0}">
                                                    <p><c:out value="${total * 0.05}"/> VNĐ</p>
                                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right">VAT (10%):</td>
                                <td class="text-right">
                                    <c:set var="total" value="${item.getTotal() + total}"/>
                                                <c:if test="${total > 0}">
                                                    <p>DISCOUNT 0 VNĐ</p>
                                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Tổng tiền:</strong></td>
                                <td class="text-right">
                                    <c:set var="total" value="${item.getTotal() + total}"/>
                                                <c:if test="${total > 0}">
                                                    <p><c:out value="${total * 1.05 }"/> VNĐ</p>
                                                </c:if>
                                </td>
                            </tr>
                            </tbody></table>
                    </div>
                </div>
                <div class="buttons">
                    <div class="pull-left"><a class="btn btn-default" href="#" onclick="quay_lai_trang_truoc()" >
                            <i class="fa fa-caret-right">
                        
                            </i>&nbsp;Continue Shopping</a></div>
                    <div class="pull-right"><a class="btn btn-primary reg_button" href="checkout.jsp">Thanh toán</a></div>
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