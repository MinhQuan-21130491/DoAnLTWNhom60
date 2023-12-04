<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý</title>
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
    <link rel="stylesheet" href="slider/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="slider/owlcarousel//assets/owl.theme.default.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<%--    <script src="jquery.min.js"></script>--%>
    <script src="slider/owlcarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Manage.css">
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%--header--%>
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<%--end header--%>
<%--content--%>
<div class="container p-0 mgt">
        <a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i>  </a> <span class="color-gray" id ="sp">Quản lý</span>
        <span class="text-color" id ="typeMa"><i class="fa fa-angle-right color-gray" aria-hidden="true"></i> Quản lý tài khoản</span>
        <div class="row mt-3">
            <!--menu-left-->
            <div class="col-lg-3 p-0 mb-2 pe-2">
                <div class="list-group  ">
                    <div class="cate" id="cate">
                        <div class="icon-bar my-2 py-1">
                            <i class="fa fa-bars" aria-hidden="true"></i>
                        </div>
                        <div class="cateList d-flex align-items-center justify-content-center p-0" id ="cateList">
                            <h5 class ="my-2 cateP">DANH MỤC QUẢN LÝ </h5>
                        </div>
                    </div>
                    <div class="typeManage " id ="typeManage" >
                        <a href="#" class="list-group-item list-group-item-action">Quản lý tài khoản</a>
                        <a href="#" class="list-group-item list-group-item-action">Quản lý sản phẩm</a>
                        <a href="#" class="list-group-item list-group-item-action">Quản lý nhà cung cấp</a>
                        <a href="#" class="list-group-item list-group-item-action">Quản lý danh mục</a>
                        <a href="#" class="list-group-item list-group-item-action">Quản lý bán hàng</a>
                        <a href="#" class="list-group-item list-group-item-action">Quản lý hóa đơn</a>
                    </div>
                </div>
            </div>
            <!--giao diện quản lý tài khoản-->
            <div class="col-lg-9 bgcolor " id ="mngAccount">
                <div class="row mt-2">
                    <div class="col-lg-6">
                        <h5 >Quản lý tài khoản</h5>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto">
                        <table class="mb-3">
                            <thead>
                                <tr>
                                    <td class="w40">ID</td>
                                    <td>CHỨC VỤ</td>
                                    <td>EMAIL</td>
                                    <td>XÁC THỰC</td>
                                    <td>TRẠNG THÁI</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-bs-toggle="modal" data-bs-target="#detailAccount">
                                    <td class="w40">1</td>
                                    <td>Admin</td>
                                    <td>qle29202@gmail.com</td>
                                    <td >1</td>
                                    <td class = "status"></td>
                                    <td>
                                        <div class="d-flex w-100 justify-content-center">
                                            <button class="delete btnAdd bgcolor bd-full" ><i class="fa fa-trash-o text-color"  title="Xóa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#"></i></button>
                                            <button class="block btnAdd bgcolor bd-full mx-1" ><i class="fa fa-lock text-color" title="Khóa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#"></i></button>
                                            <button class="editAccount btnAdd bgcolor bd-full me-1"><i class="fa fa-pencil text-color" title="Chỉnh sửa quyền truy cập" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editAccount"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="editAccount" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="" action="" method="post">
                                    <div class="row px-4  pt-0">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center title">QUYỀN TRUY CẬP</h5>
                                        <hr>
                                        <div class="col-md-12 text-center">
                                            <input class ="ms-4" type="checkbox" id ="staff" name="per" value="Nhân viên"><label for="staff">Nhân viên</label>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="submit">LƯU</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="detailAccount" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row p-4">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <h5 class="text-center title">CHI TIẾT TÀI KHOẢN</h5>
                                    <hr>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label"> Tên khách hàng </label>
                                            <input type="text" class="form-control" id="nameAccountDetail" name="nameAccountDetail" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Số điện thoại</label>
                                            <input type="text" class="form-control" id="phoneAccountDetail" name="phoneAccountDetail" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input type="text" class="form-control" id="EmailAccountDetail" name="EmailAccountDetail">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Giới tính</label>
                                            <input type="text" class="form-control" id="genderAccountDetail" name="genderAccountDetail" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Ngày sinh</label>
                                            <input type="text" class="form-control" id="dateAccountDetail" name="dateAccountDetail" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ</label>
                                            <input type="text" class="form-control" id="addressAccountDetail" name="addressAccountDetail" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end giao diện quản lý tài khoản -->
            <!--giao diện quản lý sản phẩm-->
            <div class="col-lg-9 bgcolor d-none " id="mngProduct">
                <div class="row mt-2">
                    <div class="col-lg-6">
                        <h5 >Quản lý sản phẩm</h5>
                    </div>
                    <div class="col-lg-6 text-end">
                        <button class="btnAdd bgcolor bd-full" id ="btnAddProduct"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm sản phẩm" data-bs-toggle="modal" data-bs-target="#addProduct"></i></button>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto mheight" >
                        <table class="mb-3">
                            <thead>
                                <tr>
                                    <td class="w40">ID</td>
                                    <td class="w260">SẢN PHẨM</td>
                                    <td>GIÁ NHẬP</td>
                                    <td>GIÁ BÁN</td>
                                    <td>MÀU SẮC</td>
                                    <td>SỐ LƯỢNG</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr  data-bs-toggle ="modal" data-bs-target="#detailProduct">
                                <td class="w40">1</td>
                                <td class="w260">
                                    <div class="item d-flex justify-content-center">
                                        <div class="item_img">
                                            <img src="https://images.elipsport.vn/sources/2021/12/13/ghe-massage-elip-galile-1690879452.jpg"
                                                 class="card-img-top img_p_cart" alt="..."/>
                                        </div>
                                        <span class="item_text">Ghế massage siêu cấp prO</span>
                                    </div>
                                </td>
                                <td>₫<span>1.000.000</span></td>
                                <td>₫<span>1.200.000</span></td>
                                <td>Màu đen</td>
                                <td>50</td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <button class="delete btnAdd bgcolor bd-full" ><i class="fa fa-trash-o text-color"  title="Xóa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="" ></i></button>
                                        <button class="editProduct btnAdd bgcolor bd-full mx-1"><i class="fa fa-pencil text-color" title="Chỉnh sửa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editProduct"></i></button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="editProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content ">
                            <div class="modal-body">
                                <form class ="editProduct" action="" method="post" id ="edit-Product" onsubmit="return editProduct()" >
                                    <div class="row px-2">
                                        <span class="d-none" id ="id"></span>
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class=" pb-2 text-center title">CHỈNH SỬA SẢN PHẨM</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên sản phẩm</label><span id="errNamePEdit"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameProductEdit" name="nameProductEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá nhập (₫)</label><span id="errImpPriceEdit"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceImpProductEdit" name="priceProduct">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá bán (₫)</label><span id="errPriceEdit"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceProductEdit" name="delivery">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" id = "cateTypeEdit">Thể loại</label>
                                                <select class="form-control" name="cateChairEdit" id="cateChairEdit">
                                                    <option value="Ghế văn phòng">Ghế văn phòng</option>
                                                    <option value="Ghế thư giãn">Ghế thư giãn</option>
                                                    <option value="Ghế trang trí">Ghế trang trí</option>
                                                    <option value="Ghế gaming">Ghế gaming</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Hình ảnh</label><span id="errImg1Edit"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="image1Edit" name="image1Edit">
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều dài<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="lengthEdit" name="lengthEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều rộng<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="widthEdit" name="widthEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều cao<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="heightEdit" name="heightEdit">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Vật liệu</label>
                                                    <input type="text" class="form-control" id="materialEdit" name="materialEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Màu sắc</label>
                                                    <input type="text" class="form-control" id="colorEdit" name="colorEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Số lượng</label>
                                                    <input type="number" class="form-control" id="amountEdit" name="amountEdit">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Mô tả</label><span id="errDesEdit"  class="text-danger"></span>
                                                <textarea type="text" class="form-control" id="desEdit" name="desEdit"></textarea>
                                            </div>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="submit">LƯU</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="detailProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content ">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row ">
                                        <span class="d-none" id ="detail"></span>
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="pb-2 text-center title">CHI TIẾT SẢN PHẨM</h5>
                                        <hr>
                                        <div class="col-md-6 col-sm-12 col-12">
                                            <div class="row pt-2">
                                                <div class="col-md-12 col-sm-8 col-8">
                                                    <img src="https://anphat.com.vn/media/product/40998_sihoo_m18_black_grey__2_.JPG" alt=""
                                                         class="img_p2" id="img_center">
                                                </div>
                                                <div class="col-md-12 mt-3">
                                                    <div class="owl-carousel">
                                                        <div class="pe-2" ><img src="https://i.pinimg.com/236x/28/02/b8/2802b872a06a99b8576dff4af0403723.jpg?fbclid=IwAR0AGtm9P18DGDrpzcnKZFmbaepyaS7_yzOTHX5jfolMiJD8VgEJ5K1HqEI"
                                                                                alt=""
                                                                                class="img_p_detail"
                                                                                onmouseover="changeImg('https://i.pinimg.com/236x/28/02/b8/2802b872a06a99b8576dff4af0403723.jpg?fbclid=IwAR0AGtm9P18DGDrpzcnKZFmbaepyaS7_yzOTHX5jfolMiJD8VgEJ5K1HqEI')">
                                                        </div>
                                                        <div class="pe-2" >
                                                            <img src="https://i.pinimg.com/236x/bb/be/90/bbbe9068896348d6ab9a7fffd06f5828.jpg?fbclid=IwAR3a0JkYfqdqHb6Angr_5owVHkV3RiKK7mdswjIv_t5ro2TUrUolQByhbGk"
                                                                 alt=""
                                                                 class="img_p_detail"
                                                                 onmouseover="changeImg('https://i.pinimg.com/236x/bb/be/90/bbbe9068896348d6ab9a7fffd06f5828.jpg?fbclid=IwAR3a0JkYfqdqHb6Angr_5owVHkV3RiKK7mdswjIv_t5ro2TUrUolQByhbGk')">
                                                        </div >
                                                        <div class="pe-2">
                                                            <img src="https://i.pinimg.com/564x/c0/8d/43/c08d432a2d040829cae57cd31c7726a7.jpg?fbclid=IwAR2V0qO9Z2t9BG7hpYX-2EGnkPdlg74cOd5qU55H7SxONL-BNLEpvqSmLck"
                                                                 alt=""
                                                                 class="img_p_detail"
                                                                 onmouseover="changeImg('https://i.pinimg.com/564x/c0/8d/43/c08d432a2d040829cae57cd31c7726a7.jpg?fbclid=IwAR2V0qO9Z2t9BG7hpYX-2EGnkPdlg74cOd5qU55H7SxONL-BNLEpvqSmLck')">
                                                        </div>
                                                        <div class="pe-2">
                                                            <img src="https://i.pinimg.com/564x/c0/8d/43/c08d432a2d040829cae57cd31c7726a7.jpg?fbclid=IwAR2V0qO9Z2t9BG7hpYX-2EGnkPdlg74cOd5qU55H7SxONL-BNLEpvqSmLck"
                                                                 alt=""
                                                                 class="img_p_detail"
                                                                 onmouseover="changeImg('https://i.pinimg.com/564x/c0/8d/43/c08d432a2d040829cae57cd31c7726a7.jpg?fbclid=IwAR2V0qO9Z2t9BG7hpYX-2EGnkPdlg74cOd5qU55H7SxONL-BNLEpvqSmLck')">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Tên sản phẩm</label>
                                                <input type="text" class="form-control" id="nameProductdetail" name="nameProductdetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá nhập (₫)</label>
                                                <input type="text" class="form-control" id="priceImpProductdetail" name="priceImpProductdetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá bán (₫)</label>
                                                <input type="text" class="form-control" id="priceProductDetail" name="priceProductDetail" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Thể loại</label>
                                                <input type="text" class="form-control" id="cateTypedetail" name="cateTypedetail" readonly>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều dài<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="lengthdetail" name="lengthdetail"readonly>
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều rộng<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="widthdetail" name="widthdetail"readonly>
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều cao<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="heightdetail" name="heightdetail"readonly>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Vật liệu</label>
                                                    <input type="text" class="form-control" id="materialdetail" name="materialdetail"readonly>
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Màu sắc</label>
                                                    <input type="text" class="form-control" id="colordetail" name="colordetail"readonly>
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Số lượng</label>
                                                    <input type="number" class="form-control" id="amountdetail" name="amountdetail"readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Mô tả</label>
                                                    <textarea type="text" class="form-control" id="desdetail" name="desdetail" readonly>
                                                    </textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="addProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content ">
                            <div class="modal-body">
                                <form  action="" method="post" id="add-product" onsubmit="return addProduct()">
                                    <div class="row px-2">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center title">  THÊM SẢN PHẨM</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên sản phẩm</label><span id="errNameP" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameProduct" name="nameProduct">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá nhập (₫)</label><span id="errImpPriceAdd"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceImpProductAdd" name="priceProduct">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá bán (₫)</label><span id="errPriceAdd"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceProductAdd" name="delivery">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Thể loại</label>
                                                <select class="form-control" name="cateChair" id="cateChair">
                                                    <option value="Ghế văn phòng">Ghế văn phòng</option>
                                                    <option value="Ghế thư giãn">Ghế thư giãn</option>
                                                    <option value="Ghế trang trí">Ghế trang trí</option>
                                                    <option value="Ghế gaming">Ghế gaming</option>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều dài<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="length" name="length">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều rộng<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="width" name="width">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều cao<span class="fs">(cm)</span></label>
                                                    <input type="number" class="form-control" id="height" name="height">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Vật liệu</label>
                                                    <input type="text" class="form-control" id="material" name="material">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Màu sắc</label>
                                                    <input type="text" class="form-control" id="color" name="color">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Số lượng</label>
                                                    <input type="number" class="form-control" id="amount" name="amount">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Mô tả</label><span id="errDes"  class="text-danger"></span>
                                                <textarea type="text" class="form-control" id="des" name="des"></textarea>
                                            </div>
                                            <div  id = "image">
                                                <label class="form-label">Hình ảnh</label><span id="errImg1" class="text-danger"></span>
                                                <div class="mb-3">
                                                    <input type="file" class="form-control" name="image">
                                                </div>
                                            </div>
                                            <div class="text-end mb-3">
                                                <button type ="button" class="btnAdd bgcolor bd-full" id ="btnAddImage" onclick="addInput()"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm hình ảnh" ></i></button>
                                            </div>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="submit">LƯU</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end giao diện quản lý sản phẩm-->
            <!--giao diện quản lý bán hàng-->
            <div class="col-lg-9 bgcolor d-none " id ="mngSale">
                <div class="row mt-2">
                    <div class="col-lg-6">
                        <h5 >Quản lý bán hàng</h5>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto mheight">
                        <table class="mb-3">
                            <thead>
                                <tr>
                                    <td class="w40">ID</td>
                                    <td class="w260">SẢN PHẨM</td>
                                    <td>ĐƠN GIÁ</td>
                                    <td>MÀU SẮC</td>
                                    <td>KÍCH THƯỚC</td>
                                    <td>ĐÃ BÁN</td>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="w40">1</td>
                                    <td class="w260">
                                        <div class="item d-flex justify-content-center">
                                            <div class="item_img">
                                                <img src="https://images.elipsport.vn/sources/2021/12/13/ghe-massage-elip-galile-1690879452.jpg"
                                                     class="card-img-top img_p_cart" alt="..."/>
                                            </div>
                                            <span class="item_text">Ghế massage siêu cấp pro</span>
                                        </div>
                                    </td>
                                    <td>
                                        ₫<span>1.000.000</span>
                                    </td>
                                    <td>Màu đen</td>
                                    <td>100x50x70</td>
                                    <td>50</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--end giao diện quản lý bán hàng -->
            <!--giao diện quản lý hóa đơn-->
            <div class="col-lg-9 bgcolor d-none " id ="mngInvoice">
                <div class="row mt-2">
                    <div class="col-lg-4">
                        <h5 >Quản lý hóa đơn</h5>
                    </div>
                    <div class="col-lg-8 pt-4"><label for = "filterInvoice" >Ngày xuất hóa đơn:</label> <input type="date" id="filterInvoice"><button class ="bd-full bgcolor-orange ms-2 rounded-1" id ="btnFilter">Lọc</button></div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto">
                        <table class="mb-3" >
                            <thead>
                                <tr>
                                    <td class="w40">ID</td>
                                    <td>MÃ KHÁCH HÀNG</td>
                                    <td>NGÀY XUẤT</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-bs-toggle="modal" data-bs-target="#detailInvoice">
                                <td class="w40">2</td>
                                <td>1</td>
                                <td>28/02/2023</td>
                                <td>
                                    <button class="delete btnAdd bgcolor bd-full" ><i class="fa fa-trash-o text-color"  title="Xóa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#" ></i></button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="detailInvoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content ">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row ">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="pb-2 text-center title">CHI TIẾT HOÁ ĐƠN</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <p class="fw-bold">Tên khách hàng: <span id="nameCus">Minh Quân</span></p>
                                            <p class="fw-bold">Số điện thoại: <span id="phoneCus">0812295775</span> </p>
                                            <p class="fw-bold">Email: <span id="emailCus">qle29210@gmail.com</span></p>
                                            <p class="fw-bold">Địa chỉ: <span id="addressCus">230A Tô Ngọc Vân</span> </p>
                                            <p class="fw-bold">Phí vận chuyển: ₫<span id="transFee">0</span> </p>
                                            <p class="fw-bold">Phương thức thanh toán: <span id="payMethod">Thanh toán khi nhận hàng</span> </p>
                                            <table  class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <td>STT</td>
                                                    <td>MÃ SẢN PHẨM</td>
                                                    <td>TÊN SẢN PHẨM</td>
                                                    <td>SỐ LƯỢNG</td>
                                                    <td>ĐƠN GIÁ</td>
                                                    <td>THÀNH TIỀN</td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>1</td>
                                                    <td>Ghế vip</td>
                                                    <td>1</td>
                                                    <td>₫<span>2.000.000</span></td>
                                                    <td>₫<span>2.000.000</span></td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">TỔNG TIỀN</td>
                                                    <td colspan="5">₫<span>2.000.000</span></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--end giao diện quản lý hóa đơn -->
            <!--giao diện quản lý danh mục-->
            <div class="col-lg-9 bgcolor d-none " id ="mngCate">
                <div class="row mt-2">
                    <div class="col-lg-6">
                        <h5 >Quản lý danh mục</h5>
                    </div>
                    <div class="col-lg-6 text-end">
                        <button class="btnAdd bgcolor bd-full" id ="btnAddCate"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm danh mục" data-bs-toggle="modal" data-bs-target="#addCate"></i></button>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto mheight">
                        <table class="mb-3">
                            <thead>
                            <tr>
                                <td>ID</td>
                                <td>TÊN</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td >Ghế trang trí</td>
                                <td>
                                    <div class="d-flex w-100 justify-content-center">
                                        <button class="delete btnAdd bgcolor bd-full me-1" ><i class="fa fa-trash-o text-color"  title="Xóa" aria-hidden="true" data-bs-toggle="modal" data-bs-target=""></i></button>
                                        <button class="editCate btnAdd bgcolor bd-full "><i class="fa fa-pencil text-color" title="Chỉnh sửa danh mục" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editCate"></i></button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="editCate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="cateEdit" id="cateEdit" action="" method="post" onsubmit="return editCate()">
                                    <div class="row px-2">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center">CHỈNH SỬA DANH MỤC</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên danh mục</label><span id="errNameCate" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameCateEdit" name="nameCateEdit">
                                            </div>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-lg-12 text-end p-0">
                                                <button class="save" type="submit">LƯU</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="addCate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form id="add-Cate" action="" method="post" onsubmit="return addCate()">
                                    <div class="row px-2">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center">THÊM DANH MỤC</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên danh mục</label><span id="errNameCateAdd" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameCateAdd" name="nameCateAdd">
                                            </div>

                                        </div>
                                        <div class="row p-0">
                                            <div class="col-lg-12 text-end p-0">
                                                <button class="save" type="submit">LƯU</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--end giao diện quản lý danh mục -->
            <!--giao diện quản lý nhà cung cấp-->
            <div class="col-lg-9 bgcolor d-none " id ="mngSup">
                <div class="row mt-2">
                    <div class="col-lg-6">
                        <h5 >Quản lý nhà cung cấp</h5>
                    </div>
                    <div class="col-lg-6 text-end">
                        <button class="btnAdd bgcolor bd-full" id ="btnAddSupplier"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm sản phẩm" data-bs-toggle="modal" data-bs-target="#addSup"></i></button>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto mheight">
                        <table class="mb-3">
                            <thead>
                                <tr>
                                    <td class="w40">ID</td>
                                    <td>TÊN NCC</td>
                                    <td class="w225">ĐỊA CHỈ</td>
                                    <td>SỐ ĐIỆN THOẠI</td>
                                    <td>EMAIL</td>
                                    <td>PHÂN PHỐI CHO</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="w40">1</td>
                                    <td>SimpleHome</td>
                                    <td class="w225">280 Lương Định Của, Q.2, TP.HCM</td>
                                    <td>0123456789</td>
                                    <td>simplehome@gmail.com</td>
                                    <td>Ghế văn phòng</td>
                                    <td>
                                        <div class="d-flex w-100 justify-content-center">
                                            <button class="delete btnAdd bgcolor bd-full me-1" ><i class="fa fa-trash-o text-color"  title="Xóa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="" ></i></button>
                                            <button class="editAccount btnAdd bgcolor bd-full "><i class="fa fa-pencil text-color" title="Chỉnh sửa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editSup"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="editSup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="form " id="supEdit" action="" method="post" onsubmit="return editSup()">
                                    <div class="row px-2">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center">CHỈNH SỬA NHÀ CUNG CẤP</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên nhà cung cấp</label><span id="errNameSupEdit" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameSupEdit" name="nameSupEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ</label><span id="errAddEdit" class="text-danger"></span>
                                                <input type="text" class="form-control" id="addressSupEdit" name="addressSupEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Số điện thoại</label><span id="errphoneNumberSupEdit" class="text-danger"></span>
                                                <input type="text" class="form-control" id="phoneNumberSupEdit" name="phoneNumberSupEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email</label><span id="errEmailSupEdit" class="text-danger"></span>
                                                <input type="text" class="form-control" id="emailSupEdit" name="emailSupEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Cung cấp loại</label>
                                                <select class="form-control" name="cateChairSupEdit" >
                                                    <option value="Ghế văn phòng">Ghế văn phòng</option>
                                                    <option value="Ghế thư giãn">Ghế thư giãn</option>
                                                    <option value="Ghế trang trí">Ghế trang trí</option>
                                                    <option value="Ghế gaming">Ghế gaming</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="submit">LƯU</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="addSup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog ">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="form" id="supAdd" action="" method="post" onsubmit="return addSup()">
                                    <div class="row p-4">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center">THÊM NHÀ CUNG CẤP</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên nhà cung cấp</label><span id="errNameSupAdd" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameSupAdd" name="nameSupAdd">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ</label><span id="errAddressSupAdd" class="text-danger"></span>
                                                <input type="text" class="form-control" id="addressSupAdd" name="addressSupAdd">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Số điện thoại</label><span id="errphoneSupAdd" class="text-danger"></span>
                                                <input type="text" class="form-control" id="phoneSupAdd" name="phoneSupAdd">
                                            </div>


                                            <div class="mb-3">
                                                <label class="form-label">Email</label><span id="errEmailSupAdd" class="text-danger"></span>
                                                <input type="text" class="form-control" id="emailSupAdd" name="emailSupAdd">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Phân phối cho</label>
                                                <select class="form-control" name="cateChairSupAdd" id="cateChairSupAdd">
                                                    <option value="Ghế văn phòng">Ghế văn phòng</option>
                                                    <option value="Ghế thư giãn">Ghế thư giãn</option>
                                                    <option value="Ghế trang trí">Ghế trang trí</option>
                                                    <option value="Ghế gaming">Ghế gaming</option>
                                                </select>
                                            </div>


                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="submit">LƯU</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--end giao diện quản lý nhà cung cấp -->
        </div>
</div>
<%--end content--%>
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
</body>
<script>
    $(document).ready(function () {
        $('#cate').click(function () {
            var typeManage = $('#typeManage');
            if (typeManage.css("display") === "none") {
                typeManage.css("display", "block");
            } else {
                typeManage.css("display", "none");
            }
        });

        function setColorFirt() {
            $('#typeManage a').each(function () {
                if($(this).text() === "Quản lý tài khoản" ) {
                    $(this).css('color','#f68e2e');
                }
            })
        }
        setColorFirt();
        //xoá 1 dòng
        $('.delete').click(function () {
            $(this).closest('tr').remove();
        })
        //chặn account
        // $('.block').click(function () {
        //     var state = $(this).closest('tr').find('.status');
        //     if(state.text() == 'Khóa') {
        //         state.text(" ");
        //         $(this).html("<i class=\"fa fa-lock text-color\" aria-hidden=\"true\" ></i>");
        //     }else {
        //         state.text("Khóa")
        //         $(this).html("<i class=\"fa fa-unlock-alt text-color\" aria-hidden=\"true\"></i>");
        //     }
        // })
        $('.img_p_detail').each(function () {
            $(this).hover(function () {
                $('#img_center').attr('src', $(this).attr('src'));
            })
        })
        // Chọn danh mục quản lý
        $('#typeManage a').click(function () {
            var selectedType = $(this).text();
            $('#typeManage a').css('color', '')
            $(this).css('color', '#f68e2e');
            $('#typeMa').html('<i class="fa fa-angle-right color-gray" aria-hidden="true"></i> ' + selectedType)
            if (selectedType === "Quản lý tài khoản") {
                $('#mngAccount').removeClass('d-none');
                $('#mngProduct').addClass('d-none');
                $('#mngSale').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngSup').addClass('d-none');
            } else if (selectedType === "Quản lý sản phẩm") {
                $('#mngAccount').addClass('d-none');
                $('#mngSale').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngProduct').removeClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngSup').addClass('d-none');
            }else if (selectedType === "Quản lý bán hàng") {
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngSale').removeClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngSup').addClass('d-none');
            }else if (selectedType === "Quản lý hóa đơn") {
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngSale').addClass('d-none');
                $('#mngInvoice').removeClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngSup').addClass('d-none');
            }else if (selectedType === "Quản lý danh mục") {
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngSale').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngCate').removeClass('d-none');
                $('#mngSup').addClass('d-none');
            }
            else if (selectedType === "Quản lý nhà cung cấp") {
                $('#mngProduct').addClass('d-none');
                $('#mngAccount').addClass('d-none');
                $('#mngSale').addClass('d-none');
                $('#mngInvoice').addClass('d-none');
                $('#mngCate').addClass('d-none');
                $('#mngSup').removeClass('d-none');
            }
        })
        $(".owl-carousel").owlCarousel();
    })
</script>
<script>
    function addProduct() {
        var flag = true;
        var nameP = document.getElementById("nameProduct");
        var priceImp = document.getElementById("priceImpProductAdd");
        var price = document.getElementById("priceProductAdd");
        var des = document.getElementById("des");
        var images = document.getElementsByName("image")
        var length = document.getElementById("length");
        var width = document.getElementById("width");
        var height = document.getElementById("height");
        var material = document.getElementById("material");
        var color = document.getElementById("color");
        var amount = document.getElementById("amount");
        var priceReg = /^\d+$/;

        var errNameP = document.getElementById("errNameP");
        var errImpPriceAdd = document.getElementById("errImpPriceAdd");
        var errPriceAdd = document.getElementById("errPriceAdd");
        var errDes = document.getElementById("errDes");
        var errImg1 = document.getElementById("errImg1");
        if (nameP.value === "") {
            errNameP.innerHTML = '*Vui lòng nhập tên sản phẩm';
            flag = false;
        } else {
            errNameP.innerHTML = '';
        }
        //giá nhập
        if (priceImp.value === "") {
            errImpPriceAdd.innerHTML = ' *Vui lòng nhập giá sản phẩm!';
            flag = false;
        } else if (!priceImp.value.match(priceReg)) {
            errImpPriceAdd.innerHTML = ' *Giá tiền không hợp lệ!';
            flag = false;
        } else {
            errImpPriceAdd.innerHTML = '';
        }
        //giá bán
        if (price.value === "") {
            errPriceAdd.innerHTML = ' *Vui lòng nhập giá bán!';
            flag = false;
        } else if (!price.value.match(priceReg)) {
            errPriceAdd.innerHTML = ' *Giá tiền không hợp lệ!';
            flag = false;
        } else {
            errPriceAdd.innerHTML = '';
        }
        //mô tả
        if (des.value === "") {
            errDes.innerHTML = ' *Vui lòng nhập mô tả sản phẩm!';
            flag = false;
        } else {
            errDes.innerHTML = ''
        }
        //hình
        for (var i = 0; i < images.length; i++) {
            if (images[i].value === "") {
                errImg1.innerHTML = ' *Vui lòng nhập đường dẫn các hình ảnh';
                flag = false;
            } else {
                errImg1.innerHTML = '';
            }
        }
        //length
        if (length.value === "") {
            length.style.borderColor = 'red';
            flag = false;
        } else {
            length.style.borderColor = '#dee2e6';
        }
        //width
        if (width.value === "") {
            width.style.borderColor = 'red';
            flag = false;
        } else {
            width.style.borderColor = '#dee2e6';
        }
        //height
        if (height.value === "") {
            height.style.borderColor = 'red';
            flag = false;
        } else {
            height.style.borderColor = '#dee2e6';
        }
        //material
        if (material.value === "") {
            material.style.borderColor = 'red';
            flag = false;
        } else {
            material.style.borderColor = '#dee2e6';
        }
        //color
        if (color.value === "") {
            color.style.borderColor = 'red';
            flag = false;
        } else {
            color.style.borderColor = '#dee2e6';
        }
        //amount
        if (amount.value === "") {
            amount.style.borderColor = 'red';
            flag = false;
        } else {
            amount.style.borderColor = '#dee2e6';
        }
        console.log(flag)
        return flag;
    }

    function editProduct() {
        var flag = true;
        var nameP = document.getElementById("nameProductEdit");
        var priceImp = document.getElementById("priceImpProductEdit");
        var price = document.getElementById("priceProductEdit");
        var des = document.getElementById("desEdit");
        var img1 = document.getElementById("image1Edit");
        var length = document.getElementById("lengthEdit");
        var width = document.getElementById("widthEdit");
        var height = document.getElementById("heightEdit");
        var material = document.getElementById("materialEdit");
        var color = document.getElementById("colorEdit");
        var amount = document.getElementById("amountEdit");
        var priceReg = /^\d+$/;

        var errNameP = document.getElementById("errNamePEdit");
        var errImpPriceAdd = document.getElementById("errImpPriceEdit");
        var errPriceAdd = document.getElementById("errPriceEdit");
        var errDes = document.getElementById("errDesEdit");
        var errImg1 = document.getElementById("errImg1Edit");


        if (nameP.value === "") {
            errNameP.innerHTML = '*Vui lòng nhập tên sản phẩm';
            flag = false;
        } else {
            errNameP.innerHTML = '';
        }
        //giá nhập
        if (priceImp.value === "") {
            errImpPriceAdd.innerHTML = ' *Vui lòng nhập giá sản phẩm!';
            flag = false;
        } else if (!priceImp.value.match(priceReg)) {
            errImpPriceAdd.innerHTML = ' *Giá tiền không hợp lệ!';
            flag = false;
        } else {
            errImpPriceAdd.innerHTML = '';
        }
        //giá bán
        if (price.value === "") {
            errPriceAdd.innerHTML = ' *Vui lòng nhập giá bán!';
            flag = false;
        } else if (!price.value.match(priceReg)) {
            errPriceAdd.innerHTML = ' *Giá tiền không hợp lệ!';
            flag = false;
        } else {
            errPriceAdd.innerHTML = '';
        }
        //mô tả
        if (des.value === "") {
            errDes.innerHTML = ' *Vui lòng nhập mô tả sản phẩm!';
            flag = false;
        } else {
            errDes.innerHTML = ''
        }
        //hình
        if (img1.value === "") {
            errImg1.innerHTML = ' *Vui lòng nhập đường dẫn các hình ảnh';
            flag = false;
        } else {
            errImg1.innerHTML = '';
        }
        //length
        if (length.value === "") {
            length.style.borderColor = 'red';
            flag = false;
        } else {
            length.style.borderColor = '#dee2e6';
        }
        //width
        if (width.value === "") {
            width.style.borderColor = 'red';
            flag = false;
        } else {
            width.style.borderColor = '#dee2e6';
        }
        //height
        if (height.value === "") {
            height.style.borderColor = 'red';
            flag = false;
        } else {
            height.style.borderColor = '#dee2e6';
        }
        //material
        if (material.value === "") {
            material.style.borderColor = 'red';
            flag = false;
        } else {
            material.style.borderColor = '#dee2e6';
        }
        //color
        if (color.value === "") {
            color.style.borderColor = 'red';
            flag = false;
        } else {
            color.style.borderColor = '#dee2e6';
        }
        //amount
        if (amount.value === "") {
            amount.style.borderColor = 'red';
            flag = false;
        } else {
            amount.style.borderColor = '#dee2e6';
        }
        console.log(flag)
        return flag;
    }

    function editSup() {
        var name = document.getElementById("nameSupEdit");
        var address = document.getElementById("addressSupEdit");
        var phone = document.getElementById("phoneNumberSupEdit");
        var email = document.getElementById("emailSupEdit");

        var errNameSup = document.getElementById("errNameSupEdit");
        var errAdd = document.getElementById("errAddEdit");
        var errphoneNumberSup = document.getElementById("errphoneNumberSupEdit");
        var errEmailSup = document.getElementById("errEmailSupEdit");

        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}$/;
        var flag = true;

        if (name.value === "") {
            flag = false;
            errNameSup.innerHTML = ' *Vui lòng nhập tên nhà cung cấp!';
        } else {
            errNameSup.innerHTML = '';
        }
        if (address.value === "") {
            flag = false;
            errAdd.innerHTML = ' *Vui lòng nhập địa chỉ!';
        } else {
            errAdd.innerHTML = '';
        }
        if (phone.value === "") {
            errphoneNumberSup.innerHTML = ' *Vui lòng nhập số điện thoại nhà cung cấp!';
            flag = false;
        } else if (!phone.value.match(tellReg)) {
            flag = false;
            errphoneNumberSup.innerHTML = ' *Số điện thoại không hợp lệ!';
        } else {
            errphoneNumberSup.innerHTML = ''
        }
        if (email.value === "") {
            errEmailSup.innerHTML = ' *Vui lòng nhập Email nhà cung cấp!';
            flag = false;
        }
        else if (!email.value.match(emailReg)) {
            flag = false;
            errEmailSup.innerHTML = ' *Email không hợp lệ!';
        } else {
            errEmailSup.innerHTML = ''
        }

        return flag;


    }
    function addSup() {
        var name = document.getElementById("nameSupAdd");
        var address = document.getElementById("addressSupAdd");
        var phone = document.getElementById("phoneSupAdd");
        var email = document.getElementById("emailSupAdd");

        var errNameSup = document.getElementById("errNameSupAdd");
        var errAdd = document.getElementById("errAddressSupAdd");
        var errphoneNumberSup = document.getElementById("errphoneSupAdd");
        var errEmailSup = document.getElementById("errEmailSupAdd");

        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}$/;
        var flag = true;

        if (name.value === "") {
            flag = false;
            errNameSup.innerHTML = ' *Vui lòng nhập tên nhà cung cấp!';
        } else {
            errNameSup.innerHTML = '';
        }
        if (address.value === "") {
            flag = false;
            errAdd.innerHTML = ' *Vui lòng nhập địa chỉ!';
        } else {
            errAdd.innerHTML = '';
        }
        if (phone.value === "") {
            errphoneNumberSup.innerHTML = ' *Vui lòng nhập số điện thoại nhà cung cấp!';
            flag = false;
        } else if (!phone.value.match(tellReg)) {
            flag = false;
            errphoneNumberSup.innerHTML = ' *Số điện thoại không hợp lệ!';
        } else {
            errphoneNumberSup.innerHTML = ''
        }
        if (email.value === "") {
            errEmailSup.innerHTML = ' *Vui lòng nhập Email nhà cung cấp!';
            flag = false;
        }
        else if (!email.value.match(emailReg)) {
            flag = false;
            errEmailSup.innerHTML = ' *Email không hợp lệ!';
        } else {
            errEmailSup.innerHTML = ''
        }

        return flag;


    }

    function addCate() {
        var flag = true;
        var name = document.getElementById("nameCateAdd");
        var error = document.getElementById("errNameCateAdd");
        if(name.value === "") {
            error.innerHTML = ' *Vui lòng nhập danh mục mới!';
            flag = false;
        }
        return flag;

    }
    function editCate() {
        var flag = true;
        var name = document.getElementById("nameCateEdit");
        var error = document.getElementById("errNameCate");
        if(name.value === "") {
            error.innerHTML = ' *Vui lòng nhập danh mục mới!';
            flag = false;
        }

        return flag;
    }
    function addInput() {
        var container = document.getElementById('image');
        var newInput = document.createElement('div');
        newInput.className = 'mb-3';
        newInput.innerHTML = '<input type="file" class="form-control" name="image"">';
        container.appendChild(newInput);
    }
</script>
</html>