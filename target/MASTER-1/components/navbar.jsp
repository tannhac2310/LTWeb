<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid bg-color">
            <div class="row">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <nav  role="navigation" class="navbar navbar-inverse" id="nav_show">
                                <div id="nav">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>

                                    </div>
                                    <div class="collapse navbar-collapse" id="myNavbar">
                                        <ul class="nav navbar-nav site_nav_menu1"  >
                                            <li class="first" ><a href="./">Trang chủ</a></li>
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
                    </div> 

                </div>
            </div>
        </div>
        <div class="container" >
            <div class="row" id="search_manu" style="margin-top: 10px">
                <div class="col-md-6 col-xs-12">
                    <form action="search" method="post" name="quick_find">
                        <div class="form-group">
                            <div class="input-group">
                                <input value="${Search}" name="txt" type="text" placeholder="Bạn đang tìm gì hôm nay..." class="form-control input-lg" id="inputGroup"/>
                                <span class="input-group-addon">
                                    <i class="fa fa-search-plus"></i>
                                    <button type="submit" style="color: #ffffff; background-color: #8EBE08; border: none">Tìm kiếm</button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 col-xs-12">

                    <form  name="manufacturers"> 
                        <div class="form-group">
                            <div class="">
                                <select style="font-size: 14px; background: #EAEAEA; border: none;" name="manufacturers_id"  size="1" class="input-lg form-control arrow-hide date_class">
                                    <option value="" selected="selected">Chọn nhà sản xuất</option>
                                    <option>Pharmacity</option>
                                    <option>Nam Hà</option>
                                    <option>Bách thảo dược</option>
                                   
                                </select>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
</div>
