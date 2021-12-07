<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="row"><aside class="col-sm-3 hidden-xs" id="column-left">
                        <div class="list-group">
                            <a class="list-group-item text-bold">Hello Dear</a>
                            <a class="list-group-item" href="#">Đăng nhập</a> 
                            <a class="list-group-item" href="register.jsp">Đăng ký</a> 

                        </div>
                    </aside>
                    <div class="col-sm-9" id="content">            
                        <div class="breadcrumbs">
                            <a href="../Tiemthuoc/"><i class="fa fa-home"></i></a>
                            <a href="#">Đăng nhập</a>
                        </div>
                        <div class="contentText">
                            <h1>Chào mừng bạn, Hãy đăng nhập để có trải nghiệm tốt hơn nhé</h1>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!--<div class="well">!-->
                                    <h2>Chưa có tài khoản</h2>
                                    <p>Tôi chưa có tài khoản</p>
                                    <p>Bằng cách tạo tài khoản tại cửa hàng,
                                        bạn sẽ có thể mua sắm nhanh hơn, cập nhật tình trạng đơn hàng và theo dõi các đơn hàng bạn đã thực hiện trước đó.</p>
                                    <a class="btn btn-primary reg_button" href="register.jsp">
                                        <i class="fa fa-caret-right"></i>&nbsp;
                                        Tiếp tục
                                    </a>
                                    <!--</div>!-->
                                </div>
                                <div style="border-left: 1px dashed #c1bebe" class="col-sm-6">
                                    <!--<div class="well">!-->
                                    <p class="text-danger">${messagelogin}</p>
                                    <h2>Đã có tài khoản</h2>
                                    <p>Tôi là người mua hàng quay lại</p>
                                    <form action="login" method="post" class="form-horizontal add_margin">
                                        <div class="form-group">
                                            <label for="input-email" class="control-label col-sm-4">Tài khoản</label>
                                            <div class="col-sm-8">
                                                <input name="user" type="text" class="form-control" id="input-email" placeholder="Nhập tên đăng nhập" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="input-password" class="control-label col-sm-4">Mật khẩu</label>
                                            <div class="col-sm-8">
                                                <input name="pass" type="password" class="form-control" id="input-password" placeholder="Nhập mật khẩu" required>

                                            </div>

                                        </div>
                                        <p class="cat_name"> <a href="#">Quên mật khẩu? Click vào đây.</a></p>
                                        <!--<input type="submit" value="Login" class="btn btn-primary reg_button" />!-->
                                        <button class="btn btn-primary reg_button" value="Login" type="submit">
                                            <i class="fa fa-key"></i>&nbsp;
                                            Đăng nhập                            
                                        </button>
                                    </form>
                                    <!--</div>!-->
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
    </body>
</html> 
