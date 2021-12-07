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
            <div action="signup" method="post" class="container" >
                <div class="row">
                    <aside class="col-sm-3 hidden-xs" id="column-left">
                        <div class="list-group">
                            <a class="list-group-item text-bold">Hello ${sessionScope.acc.user}</a>
                            <c:if test="${sessionScope.acc != null}">
                                <form action="orderstatus" method="post">
                                    <button type="submit" class="list-group-item" href="orderstatus.jsp">Trạng thái đơn hàng</button>
                                </form>
                            </c:if>
                            <c:if test="${sessionScope.acc.isSell == 1}">
                                <a class="list-group-item" href="#">Quản lý sản phẩm</a>
                            </c:if>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                                <a class="list-group-item" href="#">Quản lý tài khoản</a>
                            </c:if>
                                
                        </div>
                    </aside>
                    <div class="col-sm-9" id="content">            <div class="breadcrumbs">
                            <a href="../Tiemthuoc/"><i class="fa fa-home"></i></a>
                            <a href="#">TÀI KHOẢN</a>
                        </div>
                        <h1>Thông tin tài khoản</h1>
                        <form action="changepass" method="post" class="form-horizontal">
                            <div class="contentText">  
                                <fieldset id="account">
                                    <c:if test="${messagechangepass == 'Cập nhật thành công!'}">
                                        <p class="text-success alert-success">${messagechangepass}</p>
                                    </c:if>
                                    <c:if test="${messagechangepass != 'Cập nhật thành công!'}">
                                        <p class="text-danger alert-danger">${messagechangepass}</p>
                                    </c:if>
                                    <h1>Thông tin cá nhân</h1>
                                    <div style="display: none;" class="form-group required">
                                        <label class="col-sm-2 control-label">Customer Group</label>
                                        <div class="col-sm-10">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" checked="checked" value="1" name="customer_group_id">
                                                    Default</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-nameaccount" class="col-sm-2 control-label">Tên tài khoản</label>
                                        <div class="col-sm-10">
                                            <input name="newUser" type="text" class="form-control" id="input-firstname" placeholder="${sessionScope.acc.user}" required disabled="disabled">
                                        </div>
                                    </div>
<!--                                    <div class="form-group required">
                                        <label for="input-lastname" class="col-sm-2 control-label">Họ người dùng</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-lastname" placeholder="Nhập họ" value="" name="lastname">
                                        </div>
                                    </div>-->
                                    <div class="form-group required">
                                        <label for="input-email" class="col-sm-2 control-label">Địa chỉ Email</label>
                                        <div class="col-sm-10">
                                            <input name="newEmail" type="email" class="form-control" id="input-email" placeholder="${sessionScope.acc.email}" required disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-telephone" class="col-sm-2 control-label">Số điện thoại</label>
                                        <div class="col-sm-10">
                                            <input name="newTelephone" type="tel" class="form-control" id="input-telephone" placeholder="${sessionScope.acc.tel}" required disabled="disabled">
                                        </div>
                                    </div>
                                    
                                </fieldset>
<!--                                <fieldset id="address">
                                    <h1>Your Address</h1>
                                    <div class="form-group">
                                        <label for="input-company" class="col-sm-2 control-label">Company</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-company" placeholder="Company" value="" name="company">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-address-1" class="col-sm-2 control-label">Address 1</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-address-1" placeholder="Address 1" value="" name="address_1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="input-address-2" class="col-sm-2 control-label">Address 2</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-address-2" placeholder="Address 2" value="" name="address_2">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-city" class="col-sm-2 control-label">City</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-city" placeholder="City" value="" name="city">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-postcode" class="col-sm-2 control-label">Post Code</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-postcode" placeholder="Post Code" value="" name="postcode">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-country" class="col-sm-2 control-label">Country</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="input-country" name="country_id">
                                                <option value=""> --- Please Select --- </option>
                                                <option value="244">India</option>
                                                <option value="1">Afghanistan</option>
                                                <option value="2">Albania</option>
                                                <option value="3">Algeria</option>
                                                <option value="4">American Samoa</option>
                                                <option value="5">Andorra</option>
                                                <option value="6">Angola</option>
                                                <option value="7">Anguilla</option>
                                                <option value="8">Antarctica</option>
                                                <option value="9">Antigua and Barbuda</option>
                                                <option value="10">Argentina</option>

                                            </select> 
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-zone" class="col-sm-2 control-label">Region / State</label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="input-zone" name="zone_id">
                                                <option value=""> --- Please Select --- </option>
                                                <option value="3513">Aberdeen</option>
                                                <option value="3514">Aberdeenshire</option>
                                                <option value="3515">Anglesey</option><option value="3516">Angus</option>
                                                <option value="3517">Argyll and Bute</option>
                                                <option value="3518">Bedfordshire</option>
                                            </select>
                                        </div>
                                    </div>
                                </fieldset>-->
                                <fieldset>
                                    <h1>Nhập mật khẩu</h1>
                                    <div class="form-group required">
                                        <label for="input-password" class="col-sm-2 control-label">Mật khẩu cũ</label>
                                        <div class="col-sm-10">
                                            <input name="oldPassword" type="password" class="form-control" id="input-password" placeholder="Mật khẩu" required>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-password" class="col-sm-2 control-label">Mật khẩu</label>
                                        <div class="col-sm-10">
                                            <input name="changePassword" type="password" class="form-control" id="input-password" placeholder="Mật khẩu" required>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-confirm" class="col-sm-2 control-label">Nhập lại mật khẩu</label>
                                        <div class="col-sm-10">
                                            <input name="changeConfirm" type="password" class="form-control" id="input-confirm" placeholder="Nhập lại mật khẩu" required>
                                        </div>
                                    </div>
                                </fieldset>
<!--                                <fieldset>
                                    <h1>Newsletter</h1>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Subscribe</label>
                                        <div class="col-sm-10">
                                            <label class="radio-inline">
                                                <input type="radio" value="1" name="newsletter">
                                                Yes</label>
                                            <label class="radio-inline">
                                                <input type="radio" checked="checked" value="0" name="newsletter">
                                                No</label>
                                        </div>
                                    </div>
                                </fieldset>-->
                                <div class="buttons">
                                    <div class="pull-right">Khi bạn click vào chấp nhận là đã đọc và đồng ý với <a class="agree" href="#"><b>các điều khoản sử dụng</b></a>     
                                        &nbsp;
                                        <input type="submit" class="btn btn-primary reg_button" value="Chấp nhận" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="components/footer.jsp"></jsp:include>

        </div>
        <a style="display: none" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </body>
</html> 