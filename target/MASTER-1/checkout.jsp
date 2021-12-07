<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" href="images/favicon.png"/>
        <title>Healthcare</title>
        <link rel="stylesheet" type="text/css" href="css/style.css"/> 
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
            <div class="container checkout">
                <div class="breadcrumbs">
                    <a href="./"><i class="fa fa-home"></i></a>
                    <a href="checkout.jsp">Thanh toán</a>
                </div>
                <h2 class="text-center text-uppercase text-bold">THANH TOÁN SẢN PHẨM</h2>
                <hr class="small-line">
                <div id="accordion" class="panel-group margin-top">
                    <c:if test="${sessionScope.acc == null}">
                        <div class="panel panel-default">        
                            <div class="panel-heading">
                                <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-option">Bước 1: Tuỳ chọn thanh toán <i class="fa fa-caret-down"></i></a></h4>
                            </div>
                                <div id="collapse-checkout-option" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body"><div class="row">
                                            <div class="col-sm-6">
                                                <h2>Khách hàng mới</h2>
                                                <p>Tuỳ chọn thanh toán:</p>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" checked="checked" value="register" name="account">
                                                        Đăng ký tài khoản</label>
                                                </div>
                                                <p>Bằng cách tạo tài khoản, bạn sẽ có thể mua sắm nhanh hơn, cập nhật trạng thái đơn hàng và theo dõi các đơn hàng bạn đã thực hiện trước đó.</p>
                                                <a href="register.jsp" style="padding: 10px;" type="button" class="btn btn-primary" data-loading-text="Loading..." id="button-account" value="Tiếp tục">Tiếp tục</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <h2>Khách hàng quay trở lại</h2>
                                                <p>Tôi là một khách hàng quay trở lại</p>
                                                <p class="text-danger">${messageloginorder}</p>
                                                <form action="loginorder" method="post">
                                                    <div class="form-group">
                                                        <label for="input-email" class="control-label">Tên đăng nhập</label>
                                                        <input type="text" class="form-control" id="input-email" placeholder="Nhập tên đăng nhập" value="" name="user">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="input-password" class="control-label">Mật khẩu</label>
                                                        <input type="password" class="form-control" id="input-password" placeholder="Nhập mật khẩu" value="" name="pass">
                                                        <br/>
                                                        <a href="#">Quên mật khẩu</a></div>
                                                    <button type="submit" class="btn btn-primary" data-loading-text="Loading..." id="button-login" value="Đăng nhập">Đăng nhập</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:if>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-shipping-address" aria-expanded="true">Bước 2: Chi tiết vận chuyển <i class="fa fa-caret-down"></i></a></h4>
                        </div>
                        <div id="collapse-shipping-address" class="panel-collapse collapse in" aria-expanded="true" style="">
                            <div class="panel-body">
                                <form class="form-horizontal">
                                    <div class="form-group required">
                                        <label for="input-shipping-name" class="col-sm-2 control-label">Họ và tên</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-shipping-firstname" placeholder="VD: Nguyễn Văn A " value="" name="firstname">
                                        </div>
                                    </div>
                                    

                                    <div class="form-group required">
                                        <label for="input-shipping-address-1" class="col-sm-2 control-label">Địa chỉ</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-shipping-address-1" placeholder="VD: Đường 333, Quận 1" value="" name="address_1">
                                        </div>
                                    </div>

                                    
                                    <div class="form-group required">
                                        <label for="input-shipping-country" class="col-sm-2 control-label">Quốc gia</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="input-shipping-country" name="country_id">
                                                <option value=""> --- Hãy chọn --- </option>
                                                <option value="244">Việt Nam</option>
                                                
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-shipping-zone" class="col-sm-2 control-label">Tỉnh / Thành phố</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="input-shipping-zone" name="zone_id">
                                                <option value=""> --- Hãy chọn --- </option>
                                                <option value="3513">Thành phố Hồ Chí Minh</option>
                                                <option value="3514">Bình Thuận</option>
                                                <option value="3515">Đà Nẵng</option>
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-shipping-postcode" class="col-sm-2 control-label">Mã Bưu điện</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-shipping-postcode" placeholder="VD: 33500" value="" name="postcode" required=""> 
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-payment-method" aria-expanded="true">Bước 3: Phương thức giao hàng và nhận hàng <i class="fa fa-caret-down"></i></a></h4>
                        </div>
                        <div id="collapse-payment-method" class="panel-collapse collapse in" aria-expanded="true" style="">
                            <div class="panel-body"><p>Vui lòng chọn phương thức thanh toán ưa thích để sử dụng cho đơn đặt hàng này.</p>
                                <div class="radio">
                                    <label>
                                        <input type="radio" checked="checked" value="cod" name="payment_method">
                                        Thanh toán khi nhận hàng      </label>
                                </div>
                                <p><strong>Thêm lời nhắn về đơn hàng của bạn: </strong></p>
                                <p>
                                    <textarea class="form-control" rows="8" name="comment"></textarea>
                                </p>
                                <div class="buttons">
                                    <!--<div class="pull-right">Tôi đã đọc và đồng ý với các <a class="agree" href="#"><b>Điều khoản &amp; điều kiện</b></a>        <input type="checkbox" value="1" name="agree">-->
                                        &nbsp;
                                        <c:if test="${sessionScope.acc != null}">
                                            <input type="button" class="btn btn-primary"  id="button-payment-method" value="Tiếp tục" onclick="MessageAlertDialog()">
                                        </c:if>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <form action="sendemail" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-confirm" aria-expanded="true">Bước 4: Xác nhận đơn hàng <i class="fa fa-caret-down"></i></a></h4>
                            </div>
                            <div id="collapse-checkout-confirm" class="panel-collapse collapse in" aria-expanded="true" style="">
                                <div class="panel-body"><div class="table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <td class="text-left">CODE</td>
                                                    <td class="text-left">Tên sản phẩm</td>
                                                    <td class="text-left">Loại sản phẩm</td>
                                                    <td class="text-right">Số lượng</td>
                                                    <td class="text-right">Đơn giá</td>
                                                    <td class="text-right">Tổng cộng</td>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${cart.items}" var="item">
                                                <tbody>
                                                    <tr>
                                                        <td name="pid" value="${item.product.id}">${item.product.id}</td>
                                                        <td class="text-left">
                                                            <a href="#">${item.product.name}</a>
                                                        </td>
                                                        <td class="text-left">${item.product.title}</td>
                                                        <td class="text-right">${item.quantity}</td>
                                                        <td class="text-right">${item.product.getPriceCurrencyFormat()}</td>
                                                        <td class="text-right">${item.getPriceTotalFormat()}</td>
                                                    </tr>
                                                </tbody>
                                                <c:set var="total" value="${item.getTotal() + total}"/>
                                            </c:forEach>
                                            <tfoot>
                                                <tr>
                                                    <td class="text-right" colspan="4"><strong>Tổng sản phẩm:</strong></td>
                                                    <td class="text-right">
                                                        <c:if test="${total > 0}">
                                                            <p><c:out value="${total}"/> VNĐ</p>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <!-- -->
                                                <tr>
                                                    <td class="text-right" colspan="4">Mã giảm giá:</td>
                                                    <td class="text-right">0 VNĐ</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="4">Phí vận chuyển (5%):</td>
                                                    <td class="text-right">
                                                        <c:if test="${total > 0}">
                                                            <p><c:out value="${total * (5/100)}"/> VNĐ</p>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <!-- -->
                                                <tr>
                                                    <td class="text-right" colspan="4">VAT (10%):</td>
                                                    <td class="text-right">
                                                        <c:if test="${total > 0}">
                                                            <p><c:out value="DISCOUNT 0"/> VNĐ</p>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="4"><strong>TỔNG CỘNG:</strong></td>
                                                    <td class="text-right">
                                                        <c:if test="${total > 0}">
                                                            <p><c:out value="${total * 1.05}"/> VNĐ</p>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="buttons">
                                        <div class="pull-right">

                                                <c:if test="${sessionScope.acc != null && cart.getCount()!= null}">
                                                    <input type="submit"  class="btn btn-primary" id="button-confirm" value="Thanh toán">
                                                </c:if>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>



            </div>
        </div>

        <jsp:include page="components/footer.jsp"></jsp:include>
        <a style="display: none" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
            <i class="fa fa-chevron-up"></i>
        </a>
        <script type="text/javascript">
            function MessageAlertDialog()  {

              alert("Đã nhận được lời nhắn từ bạn!");
            } 
            function ShippingAlertDialog()  {

              alert("Đã xác nhận!");
            } 
        </script>
    </body>
</html> 