<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="model.Category" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Style.css">
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<!--page content-->
<%
    NumberFormat nF = NumberFormat.getCurrencyInstance();
    ArrayList<String> listColor = (ArrayList<String>) request.getAttribute("listColorP");
    Cart cart = (Cart) session.getAttribute("Cart");
%>
<div class="container p-0 mgt">
    <div class="row">
        <!-- menu left -->
        <div class="col-lg-3">
            <div class="list-group ">
                <div class="cate" id="cate">
                    <div class="icon-bar my-2 py-1">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </div>
                    <div class="cateList d-flex align-items-center justify-content-center p-0" id="cateList">
                        <h5 class="my-2">DANH MỤC SẢN PHẨM </h5>
                    </div>
                </div>
                <div class="typeChair" id="typeChair">
                    <%ArrayList<Category> listCate = (ArrayList<Category>) request.getAttribute("listCate");%>
                    <%if (!listCate.isEmpty() && listCate != null) {%>
                    <%for (Category c : listCate) {%>
                    <a href="#" class="list-group-item list-group-item-action lt"
                       onclick="loadProductByIdCate('<%=c.getId()%>')"><%=c.getName()%>
                    </a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="mt-3 d-none d-md-none d-lg-block ">
                <h5 class="m-0 text-center" id="titleCate">SẢN PHẨM MỚI NHẤT</h5>
                <hr class="mt-2 mb-2"/>
                <div class="card">
                    <%
                        Product latestProduct = (Product) request.getAttribute("latestP");
                        if (latestProduct != null) {
                    %>
                    <a href="<%=url%>/detail-product?pid=<%=latestProduct.getIdProduct()%>">
                        <img src="<%=latestProduct.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><%=latestProduct.getName()%>
                        </h5>
                        <p class="card-text">
                        <p class="price"><%=nF.format(latestProduct.getPrice())%>
                        </p>
                        <%
                            int quantity = 1;
                            if (cart != null) {
                                if (cart.get(latestProduct.getIdProduct()) != null) {
                                    quantity = cart.get(latestProduct.getIdProduct()).getQuantity() + 1;
                                }
                            } else {
                                quantity = latestProduct.getQuantity();
                            }
                        %>
                        <a href ="<%=url%>/cartController?id=<%=latestProduct.getIdProduct()%>&quantity=<%=quantity%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>

                    </div>
                    <%}%>
                </div>
            </div>
            <div class="mt-3 d-none d-md-none d-lg-block">
                <h5 class="m-0 text-center">SẢN PHẨM BÁN CHẠY NHẤT</h5>
                <hr class="mt-2 mb-2"/>
                <div class="card">
                    <a href="<%=url%>/DetailProduct.jsp">
                        <img src="https://down-vn.img.susercontent.com/file/sg-11134201-7r9a2-llujnaskifkp71"
                             class="card-img-top img_p" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Ghế xoay</h5>
                        <p class="card-text">
                        <p class="price">₫1.000.000</p></p>
                        <a href =""><i class="fa fa-shopping-cart cart" aria-hidden="true"
                                              title="Thêm vào giỏ hàng"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end menu left -->
        <!-- carousel -->
        <div class="col-lg-9 ">
            <div id="carouselExampleIndicators" class="carousel slide d-none d-md-none d-lg-block "
                 data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="0" class="active" aria-current="true"
                            aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="image/slide1.jpg" class="d-block img_p" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="image/slide2.jpg" class="d-block img_p" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="image/slide3.jpg" class="d-block img_p" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!--end carousel-->
            <!--product-->
            <h5 class="mt-3 mb-0">DANH SÁCH SẢN PHẨM</h5>
            <h6 class="text-center text-color mt-2 mb-0" id="exits"></h6>
            <div class="row" id="content">
                <%ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listP");
                if (!listProduct.isEmpty() && listProduct != null) {
                for (Product p : listProduct) {%>
                <div class="col-lg-4 col-sm-6 col-6 mt-3 product">
                    <div class="card">
                        <a href="<%=url%>/detail-product?pid=<%=p.getIdProduct()%>">
                            <img src="<%=p.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getName()%>
                            </h5>
                            <p class="card-text">
                            <p class="price"><%=nF.format(p.getPrice())%>
                            </p>
                            <%
                                int quantity = 1;
                                if (cart != null) {
                                    if (cart.get(p.getIdProduct()) != null) {
                                        quantity = cart.get(p.getIdProduct()).getQuantity() + 1;
                                    }
                                } else {
                                    quantity = p.getQuantity();
                                }
                            %>
                            <a href ="<%=url%>/cartController?id=<%=p.getIdProduct()%>&quantity=<%=quantity%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <%String display = request.getAttribute("hiddenLoadmore") + "";%>
            <button class="mt-3 bgcolor-orange border border-0 rounded-1 px-3 py-2 d-<%=display%>" id="loadMore"
                    onclick="loadMore()">Tải thêm
            </button>
        </div>
    </div>
</div>
<!-- End Page content -->
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
<script>
    var idCateCurrent = 0;
    var backProduct = 0;
    $(document).ready(function () {
        // ẩn hiện danh mục
        $('#cate').click(function () {
            var typeChair = $('#typeChair');
            if (typeChair.css("display") === "none") {
                typeChair.css("display", "block");
            } else {
                typeChair.css("display", "none");
            }
        })
        $('.lt').click(function () {
            var unCheckedRadio = $('input[type="radio"][name="price"]:checked, input[type="radio"][name="color"]:checked, input[type="radio"][name="material"]:checked');
            unCheckedRadio.prop('checked', false);
            if (backProduct === idCateCurrent) {
                $(this).css('color', 'black');
                loadProduct();
                backProduct = 0;
                idCateCurrent = 0;
            } else {
                $('.lt').css('color', '');
                $(this).css('color', '#f68e2e')
                backProduct = idCateCurrent;
            }
        })
    });
    function loadMore() {
        var count = document.getElementsByClassName("product").length;
        $.ajax({
            url: "loadMore",
            method: "GET",
            data: {
                exits: count,
                idCate: idCateCurrent
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML += data;
            },
        });
    }

    function loadProductByIdCate(idCate) {
        document.getElementById("loadMore").classList.remove("d-none")
        document.getElementById("exits").classList.add("d-none");
        $.ajax({
            url: "loadProductByIdCate",
            method: "GET",
            data: {
                cid: idCate
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
        });
        idCateCurrent = idCate;
    }

    function loadProduct() {
        document.getElementById("loadMore").classList.remove("d-none")
        document.getElementById("exits").classList.add("d-none");
        $.ajax({
            url: "loadProduct",
            method: "GET",
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
        });
    }
</script>
</body>
</html>
