<%@page import="DAO.*"%>
<%@page import="Entity.*"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-3 col-sm-4 col-xs-12 left_sidebar1">
                        <div id="left_part">
                            <div class="bs-example">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="infoBoxHeading">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Danh mục</a>
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                    <i  id="accordan_plus" class="indicator glyphicon glyphicon-chevron-down  pull-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <div class="infoBoxContents">
                                                    <% 
                                                        CategoryDAO ctgdao = new CategoryDAO();
                                                        List<Category> listC = ctgdao.getAllCategories();
                                                        request.setAttribute("listCategory", listC);
                                                    %>
                                                    <c:forEach items="${listCategory}" var="ct">
                                                        <a href="productlist?cid=${ct.cid}">${ct.cname}</a>&nbsp;<br />  
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="infoBoxHeading">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Có gì mới?</a>
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                    <i id="accordan_plus" class="indicator glyphicon glyphicon-chevron-up  pull-right accordan_plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <% 
                                            ProductDAO dao = new ProductDAO();
                                            List<Product> listnew = dao.getNewProduct();
                                            request.setAttribute("listNewProduct", listnew);
                                        %>
                                        <c:forEach items="${listNewProduct}" var="k">
                                            <div id="collapseTwo" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="infoBoxContainer">  
                                                        <div class="infoBoxHeading">
                                                            <a href="#">Có gì mới?</a>
                                                        </div> 
                                                        <div class="infoBoxContents" id="sidebar">
                                                            <div>
                                                                <a href="single-product?pid=${k.id}">
                                                                    <img src="${k.image}" class="img-responsive" />
                                                                </a>
                                                            </div>
                                                            <a href="single-product?pid=${k.id}">
                                                                ${k.name}</a>
                                                                <br />
                                                            ${k.getPriceCurrencyFormat()}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                        
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="infoBoxHeading">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Thông tin thêm</a>
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                    <i id="accordan_plus" class="indicator glyphicon glyphicon-chevron-up  pull-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="infoBoxContents">    
                                                    <a href="#">Vận chuyển &amp; Hoàn trả</a><br />   
                                                    <a href="#">Quyền riêng tư</a><br />   
                                                    <a href="#">Điều kiện sử dụng</a><br />   
                                                    <a href="#">Liên hệ</a> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="infoBoxHeading">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Bán chạy</a>
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                                    <i id="accordan_plus" class="indicator glyphicon glyphicon-chevron-up  pull-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <% 
                                            
                                            List<Product> listTopSell = dao.getTopProduct(12);
                                            request.setAttribute("listTopSell", listTopSell);
                                        %>
                                        <c:forEach items="${listTopSell}" var="tsell">
                                            <div id="collapseFour" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="infoBoxContents" id="sidebar">
                                                        <a href="single-product?pid=${tsell.id}">
                                                            <img src="${tsell.image}"  class="img-responsive" />
                                                        </a>
                                                        <a href="single-product?pid=${stell.id}">${tsell.name}</a><br /><del></del>
                                                        <span class="productSpecialPrice">${tsell.getPriceCurrencyFormat()}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="infoBoxHeading">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Đặc biệt</a>
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                                    <i id="accordan_plus" class="indicator glyphicon glyphicon-chevron-up  pull-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <% 
                                            
                                            List<Product> listSpecial = dao.getTopProduct(3);
                                            request.setAttribute("listSpecial", listSpecial);
                                        %>
                                        <c:forEach items="${listSpecial}" var="spec">
                                            <div id="collapseFive" class="panel-collapse collapse">
                                                <div class="panel-body">

                                                    <div class="infoBoxContents" id="sidebar">

                                                        <a href="single-product?pid=${spec.id}">
                                                            <img src="${spec.image}"  class="img-responsive" />
                                                        </a>
                                                        <a href="single-product?pid=${spec.id}">${spec.name}</a><br /><del></del>
                                                        <span class="productSpecialPrice">${spec.getPriceCurrencyFormat()}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <script>
                            function toggleChevron(e) {
                                $(e.target)
                                        .prev('.panel-heading')
                                        .find("i.indicator")
                                        .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
                            }
                            $('#accordion').on('hidden.bs.collapse', toggleChevron);
                            $('#accordion').on('shown.bs.collapse', toggleChevron);
                        </script>

                    </div> 