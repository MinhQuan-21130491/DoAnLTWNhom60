<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lịch sử mua hàng</title>
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
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Manage.css">
</head>
<body>
<!--header-->
<header>
    <div class="container-fluid bgcolor-orange" >
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-9 col-8 col-4 d-flex align-items-center  ">
                    <a class ="nav-link" href="#"> <img style="width: 150px" src="image/logoWeb.png">
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-4 py-3 px-0 d-flex align-items-center justify-content-end">
                    <ul class="d-flex m-0 list-unstyled justify-content-end">
                        <li class="px-3 pt-1"><a class="nav-link active" aria-current="page" href="#"><i class="fa fa-phone" aria-hidden="true"></i></a></li>
                        <li class="px-3 pt-1"><a class="nav-link" href="#"><i
                                class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
                        <li class="px-3 pt-1"><a class="nav-link" href="#"><i
                                class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        <li class="px-3 pt-1"><a class="nav-link" href="#"><i
                                class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container-luid bd bgcolor">
        <div class="container p-0 ">
            <div class="row">
                <div class="col-lg-12 col-md-2 col-sm-2 col-2">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light pt-2 ">
                        <div class="container-fluid px-0">
                            <button class="navbar-toggler mt-1 " type="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                                    aria-controls="navbarTogglerDemo01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                                <div class="col-md-12 col-lg-4 col-sm-12">
                                    <ul class="navbar-nav w-100  mb-2 mb-lg-0">
                                        <li class="nav-item hv "><a class="nav-link ps-0 "
                                                                    aria-current="page" href=HomePage.jsp>Trang chủ</a></li>
                                        <li class="nav-item hv"><a class="nav-link" href="IntroWebsite.jsp">Giới
                                            thiệu</a></li>
                                        <li class="nav-item dropdown hv"><a
                                                class="nav-link dropdown-toggle" href="#" id=""
                                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Sản phẩm </a>
                                            <ul class="dropdown-menu" aria-labelledby="">
                                                <li><a class="dropdown-item" href="#">Ghế văn phòng</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Ghế thư giãn</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Ghế trang trí</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Ghế gaming</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item hv d-lg-none ">
                                            <ul class="navbar-nav justify-content-end ">
                                                <li class="nav-item dropdown hv"><a
                                                        class="nav-link dropdown-toggle" href="#"
                                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Tài khoản </a>
                                                    <ul class="dropdown-menu" aria-labelledby="">
                                                        <li><a class="dropdown-item" href="SignIn.jsp">Đăng nhập</a></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Đăng kí</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>

                                </div>
                                <div class="col-lg-6 col-sm-8 col-8 bd-full  rounded-2 d-md-none d-sm-none d-none d-lg-block">
                                    <form class = "">
                                        <div class="form-search">
                                            <input class="form-control border-0" type="search"
                                                   placeholder="Nội dung tìm kiếm" aria-label="Search">
                                            <button class="btn border-0" type="submit">
                                                <i class="fa fa-search" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-2  d-lg-block d-md-none d-none ">
                                    <ul class="navbar-nav justify-content-end">
                                        <li class="nav-item hv pe-2"><a class="nav-link" href="#"><button class = "position-relative border-0 bg-light "><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 25px"></i><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+<span class="visually-hidden">unread messages</span></span>
                                        </button> </a> </li>
                                        <li class="nav-item dropdown hv  d-flex align-items-center"><a
                                                class="nav-link dropdown-toggle" href="#"
                                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Tài khoản </a>
                                            <ul class="dropdown-menu" aria-labelledby="">
                                                <li><a class="dropdown-item" href="SignIn.jsp">Đăng nhập</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Đăng kí</a></li>
                                            </ul>
                                        </li>

                                    </ul>

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-md-10 col-sm-10 col-10 d-lg-none " style="padding: 11px 0" >
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-10 bd-full rounded-2   ">
                            <form class = "">
                                <div class="form-search">
                                    <input class="form-control border-0" type="search"
                                           placeholder="Nội dung tìm kiếm" aria-label="Search">
                                    <button class="btn border-0" type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-2 col-sm-2 col-2 ps-2 d-flex align-items-center">
                            <a class="nav-link" href="#">
                                <button class = "position-relative border-0 bg-light "><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 25px"></i><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+<span class="visually-hidden">unread messages</span></span>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--end header-->
<div class="container bgcolor mgt">
    <div class="row mt-2">
        <div class="col-lg-4">
            <h5 >Lịch sử mua hàng <i class="fa fa-clock-o" aria-hidden="true"></i></h5>
        </div>
        <div class="col-lg-8 pt-4   ">
            <label for="filter">Ngày mua hàng:</label> <input type="date" id="filter">
            <button class="bd-full bgcolor-orange ms-2 rounded-1" id="btnFilter">Lọc</button>
        </div>
    </div>
    <hr class="mt-1">
    <div class="row">
        <div class="col-lg-12 overflow-hidden">
            <table>
                <thead>
                <tr>
                    <td>MÃ HÓA ĐƠN</td>
                    <td>TÊN SẢN PHẨM</td>
                    <td>NGÀY MUA</td>
                    <td>SỐ LƯỢNG</td>
                    <td>ĐƠN GIÁ</td>
                    <td>TỔNG TIỀN</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <span>2</span>
                    </td>
                    <td>
                        <div class="item">
                            <div class="item_img">
                                <img src="https://images.elipsport.vn/sources/2021/12/13/ghe-massage-elip-galile-1690879452.jpg"
                                     class="card-img-top img_p_cart" alt="..."/>
                            </div>
                            <span class="item_text">Ghế massage siêu cấp prO</span>
                        </div>
                    </td>
                    <td>
                        <span>06/11/2023</span>
                    </td>
                    <td>
                        <span>50</span>
                    </td>
                    <td>
                        ₫<span>51.200</span>
                    </td>
                    <td>
                        ₫<span></span>
                    </td>
                    <td>
                        <div class="d-flex w-100 justify-content-center">
                            <a href="DetailProduct.jsp" class="btnAdd bgcolor bd-full me-1"><i class="fa fa-repeat text-color" aria-hidden="true" title="Mua lại"></i></a>
                            <button class="delete btnAdd bgcolor bd-full me-1"><i class="fa fa-trash-o text-color" title="Xóa" aria-hidden="true"></i></button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--footer-->
<footer>
    <div class="container-fluid bgcolor-orange ">
        <div class="container mt-3 pb-3">
            <div class="row py-3 float-xs-center" >
                <div class="col-lg-3 col-md-6 col-sm-6 ">
                    <h5 class="">DANH MỤC SẢN PHẨM</h5>
                    <hr class ="w-50 ">
                    <ul class="navbar-nav ">
                        <a class="nav-link link" href=""><li>Ghế văn phòng</li></a>
                        <a class="nav-link link" href=""><li>Ghế thư giãn</li></a>
                        <a class="nav-link link" href=""><li>Ghế trang trí</li></a>
                        <a class="nav-link link" href=""><li>Ghế gaming</li></a>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 ">
                    <h5>VỀ CHÚNG TÔI</h5>
                    <hr class ="w-50 ">
                    <ul class="navbar-nav ">
                        <a class="nav-link link" href="IntroWebsite.jsp"><li>Giới thiệu</li></a>
                        <a class="nav-link link" href="IntroWebsite.jsp#policy"><li>Bảo hành</li></a>
                        <a class="nav-link link" href="IntroWebsite.jsp#policy"><li>Đổi trả</li></a>
                        <a class="nav-link link" href="IntroWebsite.jsp#contact"><li>Liên hệ</li></a>

                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <h5 class ="">THEO DÕI CHÚNG TÔI</h5>
                    <hr class ="w-50">
                    <ul class="navbar-nav">
                        <li class="px-3"><a class="nav-link link" href="#"><i
                                class="fa fa-facebook-official" aria-hidden="true"></i> FaceBook</a></li>
                        <li class="px-3"><a class="nav-link link" href="#"><i
                                class="fa fa-instagram" aria-hidden="true"></i></i> Instagram</a></li>
                        <li class="px-3"><a class="nav-link link" href="#"><i
                                class="fa fa-twitter" aria-hidden="true"></i></i>Twitter</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <h5 class = "">THÔNG TIN LIÊN HỆ</h5>
                    <hr class ="w-50 ">
                    <ul class="navbar-nav ">
                        <li class="nav-link"><i class="fa fa-map-marker" aria-hidden="true"></i> 230A Tô Ngọc Vân, Phường Linh Xuân, Thành phố Thủ Đức</li>
                        <li class="nav-link" ><i class="fa fa-envelope" aria-hidden="true"></i> homedecorsqn@gmail.com</li>
                        <li class="nav-link" ><i class="fa fa-phone" aria-hidden="true"></i> 0812295775</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row bgcolor-gray">
            <div class="col text-center color-gray">
                Nhom 60 &copy;2023. All rights reserved.
            </div>
        </div>
    </div>
</footer>
<!--end footer-->
<script>
    $(document).ready(function () {
        // tính tổng tiền
        $('tr').each(function () {
            var amount = $(this).find('td:eq(3) span').text();
            var price = $(this).find('td:eq(4) span').text();
            price = price.replace(/\./g, "");
            var amountValue = parseInt(amount);
            var priceValue = parseFloat(price);
            var total = amountValue * priceValue;
            total = total.toLocaleString('en-US');
            total = total.replace(/\,/g, ".")
            $(this).find('td:eq(5) span').text(total);
        })
        //xóa lịch sử
        $('.delete').click(function () {
            $(this).closest('tr').remove();
        })
    })
</script>
</body>
</html>