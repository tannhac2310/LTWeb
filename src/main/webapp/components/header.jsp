<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4" id="logo" >
                    <a href="./" class="logo-text">
                        Medi<span style="color:#39BAF0; font-size:40px">STORE</span>
                    </a>		
                </div>
                <div class="col-md-2 col-sm-12 col-xs-12" style="display:none " id="navbar_hide" >
                    <nav  role="navigation" class="navbar navbar-inverse">
                        <a href="./" style="float: left" class="logo-text">
                            Medi<span style="color:#39BAF0; font-size:40px">STORE</span>
                        </a>
                        <div id="nav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background: #8EBE08; border: none; margin-right: 0">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav site_nav_menu1" >
                                    <li class="first" style="background: #8EBE08" ><a href="./">Trangs chủ</a></li>
                                    <li><a href="#">Về chúng tôi</a></li>
                                    <li><a href="#">Bảo hành</a></li>
                                    <li><a href="#">Vận chuyển & chi trả</a></li>
                                    <li><a href="#">Chính sách</a></li>
                                    <li><a href="#">Điều khoản và điều kiện</a></li>
                                    <li><a href="#">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-md-4 col-md-offset-4 col-sm-offset-2  col-sm-6 col-xs-12" >
                    <div id="top_right">
                        <div id="cart">
                            <div class="text">
                                <div class="img">
                                    <a href="cart.jsp"> <img class="img-responsive" src="images/cart.png" alt="" title="" width="26" height="27" /></a>
                                </div>
                                <span>Giỏ hàng:</span>
                                
                                <c:if test="${cart.getCount() == null || cart.getCount() < 1}">
                                    <span class="cart_items">giỏ hàng trống</span>
                                </c:if>
                                <c:if test="${cart.getCount() >= 1}">
                                    <span class="cart_items">${cart.getCount() } món hàng</span>
                                </c:if>    
                                
                            </div> 
                        </div>
                        <div id="bottom_right">
                            <div class="row">
                                <div class="col-md-6 col-xs-6 wd_auto ">
                                    <div class="left">
                                        <div class="login">
                                                <c:if test="${sessionScope.acc == null}">
                                                    <a class="btn btn-default reg_button" href="login.jsp"> 
                                                        Login
                                                    </a>
                                                </c:if>
                                                <c:if test="${sessionScope.acc != null}">
                                                    <a class="btn btn-default reg_button" href="account.jsp">                                               
                                                        Account
                                                    </a>
                                                    <a class="btn btn-default reg_button" href="logout">                                               
                                                        Logout
                                                    </a>
                                                </c:if>
                                                <c:if test="${sessionScope.acc == null}">
                                                    <a class="btn btn-default reg_button" href="register.jsp">                                               
                                                        Signup
                                                    </a>
                                                </c:if>
                                        </div>			
                                    </div>
                                </div> 
                                <div class="dropdown-bn wd-33 col-md-6 remove_PL col-xs-6">
                                    <div class="row">
                                        <div class=" pl-0 col-md-6 col-xs-6">

                                            <div class="dropdown btn-group">
                                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">ngôn ngữ
                                                    <span class="caret"></span></button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Việt Nam</a></li>
                                                    

                                                </ul>
                                            </div>
                                        </div>

                                        <div class="pl_0 col-md-6 col-xs-6">
                                            <div class="dropdown btn-group">
                                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">tiền tệ
                                                    <span class="caret"></span></button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Việt Nam</a></l>
        
                                                </ul>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
</div>