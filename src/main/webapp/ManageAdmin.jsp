<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Supplier" %>
<%@ page import="service.SupplierService" %>
<%@ page import="dao.DAOSupplier" %>
<%@ page import="controller.AddSupplier" %>
<%@ page import="model.Category" %>
<%@ page import="service.CategoryService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Manage.css">
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    NumberFormat nF = NumberFormat.getCurrencyInstance();

%>
<%--header--%>
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<%--end header--%>
<%--content--%>
<%
    Object obj = session.getAttribute("account");
    Account account = (Account) obj;
    if (account != null && (account.getRole() == 0 || account.getRole() == 1)) {
%>
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
                        <a href="#" class="list-group-item list-group-item-action">Quản lý sản phẩm</a        
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
                    <div class="col-lg-6 text-end">
                        <%if(account.getRole() == 0) {%>
                            <button class="btnAdd bgcolor bd-full" id ="btnAddAccount" data-bs-toggle="modal" data-bs-target="#addAccount" ><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm sản phẩm"></i></button>
                        <%}%>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-lg-12 overflow-auto">
                        <table class="mb-3">
                            <thead>
                                <tr>
                                    <td class="w40">STT</td>
                                    <td>HỌ TÊN</td>
                                    <td>EMAIL</td>
                                    <td>CHỨC VỤ</td>
                                    <td>XÁC THỰC</td>
                                    <td>TRẠNG THÁI</td>
                                </tr>
                            </thead>
                            <tbody id ="innerAccount">
                            <%
                                ArrayList<Account> listAllAccount = (ArrayList<Account>) request.getAttribute("listAllAccount");
                                if (!listAllAccount.isEmpty() && listAllAccount != null) {
                                    int sttA = 1;
                                    for(Account a: listAllAccount) {
                            %>
                                <tr data-bs-toggle="modal" data-bs-target="#detailAccount" onclick="detailAccount('<%=a.getId()%>')">
                                    <td class="w40"><%=sttA%></td>
                                    <td><%=a.getName()%></td>
                                    <td><%=a.getEmail()%></td>
                                    <%if (a.getRole() == 0) {%>
                                    <td>Admin</td>
                                    <%} else if(a.getRole() == 1){%>
                                    <td>Nhân viên</td>
                                    <%}else {%>
                                    <td>Khách hàng</td>
                                    <%}%>
                                    <%if(a.getVerifyAccount().isStateVerify()) {%>
                                    <td>Đã xác thực</td>
                                    <%}else {%>
                                    <td>Chưa xác thực</td>
                                    <%}%>
                                    <%if(a.isStatus()){%>
                                    <td class="status">Hoạt động</td>
                                    <%}else {%>
                                    <td class="status">Đã khóa</td>
                                    <%}%>
                                    <td>
                                        <%if(account.getRole() == 0) {%>
                                            <div class="d-flex w-100 justify-content-center">
                                                    <button class="delete btnAdd bgcolor bd-full" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#" onclick="deleteAccount(<%=a.getId()%>)"><i class="fa fa-trash-o text-color"  title="Xóa" ></i></button>
                                                <button class="editAccount btnAdd bgcolor bd-full mx-1" title="Chỉnh sửa thông tin" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editAccount" onclick="innerAccount(<%=a.getId()%>)"><i class="fa fa-pencil text-color" ></i></button>
                                                    <button class="block btnAdd bgcolor bd-full " data-bs-toggle="modal" data-bs-target="#" onclick="banAccount(<%=a.getId()%>)"><i class="fa fa-lock text-color" title="Khóa" aria-hidden="true" ></i></button>
                                            </div>
                                        <%}%>
                                    </td>
                                </tr>
                            <%
                                        sttA++;
                                    }
                                }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="editAccount" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content ">
                            <div class="modal-body">
                                <form id="edit">
                                    <table class="tbChane-infor px-2">
                                        <thead>
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <tr>
                                            <td class="py-0" colspan ="4">
                                                <h5 class = "pt-3 fw-bold text-center"> CHỈNH SỬA THÔNG TIN </h5>
                                                <hr>
                                                <div class="text-danger text-center w-100" id="error"></div>
                                            </td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr id="changeName">
                                            <td >
                                                <label>Họ và tên<span class="text-danger">*</span></label>
                                            </td>
                                            <td class="w-50">
                                                <div id="InName">
                                                    <input class="form-control" id="HienThiTen" name="TenHT" type="text">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="changeSDT">
                                            <td>
                                                <label>Số điện thoại<span class="text-danger">*</span></label>
                                            </td>
                                            <td>
                                                <div id="InSDT">
                                                    <input class="form-control" id="HienThiSDT" name="SDTHT" type="text">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="changegGmail">
                                            <td>
                                                <label>Email<span class="text-danger">*</span></label>
                                            </td>
                                            <td>
                                                <div id="InGmail">
                                                    <input class="form-control" id="HienThiGmail" name="GmailHT" type="text">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Giới tính<span class="text-danger">*</span></label>
                                            </td>
                                            <td >
                                                <div class = "gender">
                                                    <label class="ms-0" for="male">Nam</label><input class="ms-2 me-3" type="radio" id="male" name="gender" value="Nam">
                                                    <label for="female">Nữ</label> <input class="ms-2 me-3" type="radio" id="female" name="gender" value="Nữ" >
                                                    <label for="other">Khác</label> <input class="ms-2 me-3" type="radio" id="other" name="gender" value="Khác">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Chức vụ</label>
                                            </td>
                                            <td >
                                                <div class ="role">
                                                    <label for="staff">Nhân viên</label><input class="me-1" type="radio" id="staff" name="role" value="Nhân viên" >
                                                    <label for="Admin">Admin</label><input class="me-1" type="radio" id="admin" name="role" value="Admin" >
                                                    <label for="cus">Khách</label><input type="radio" id="cus" name="role" value="Khách hàng" >
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="changeNgaySinh">
                                            <td>
                                                <label>Ngày sinh<span class="text-danger">*</span></label>
                                            </td>
                                            <td>
                                                <div id="InNS">
                                                    <input class="form-control" id="HienThiNS" name="HienThiNS" type="date">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="changeDC">
                                            <td>
                                                <label>Địa chỉ<span class="text-danger">*</span></label>
                                            </td>
                                            <td>
                                                <div id="InDiaChi">
                                                    <input class="form-control" id="HienThiDC" name="DCHT" type="text">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="changeDCReceive">
                                            <td>
                                                <label>Địa chỉ nhận hàng<span class="text-danger">*</span></label>
                                            </td>
                                            <td>
                                                <div id="">
                                                    <input class="form-control" id="HienThiDCReice" name="DCHT" type="text">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="SubmitSB">
                                            <td class="py-0" colspan="2">
                                                <div><button type="button" class="m-0" id="submit" name="SB" onclick="editAccount()" style="color: white"> LƯU </button></div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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
                                            <label class="form-label"> Mã tài khoản </label>
                                            <input type="text" class="form-control" id="idAccountDetail" name="idAccountDetail" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label"> Họ và tên </label>
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
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ nhận hàng</label>
                                            <input type="text" class="form-control" id="addressReAccountDetail" name="addressReAccountDetail" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="addAccount" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row p-4">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <h5 class="text-center title">THÊM TÀI KHOẢN</h5>
                                    <hr>
                                    <form class="p-0" action="">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên đăng nhập<span class="text-danger">*</span></label><span class="text-danger" id="errUser"></span>
                                                <input type="text" class="form-control" placeholder="Nhập tên đăng nhập" name="userName" id="userName" value =""/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Mật khẩu<span class="text-danger">*</span></label><span class="text-danger" id="errPW"></span>
                                                <input type="password" class="form-control" placeholder="Nhập mật khẩu" name="password" id="password" value =""/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Nhập lại mật khẩu<span class="text-danger">*</span></label><span class="text-danger" id="errRePW"></span>
                                                <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="rePassword" id="rePassword" value =""/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email<span class="text-danger">*</span></label><span class="text-danger" id="errEmail"></span>
                                                <input type="text" class="form-control" placeholder="Nhập Email" name="email" id="email" value =""/>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="text-end">
                                                        <button class="save" type="button" onclick="addAccount()">LƯU</button>
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
                        <%
                            ArrayList<Product> listAllProduct = (ArrayList<Product>) request.getAttribute("listAllProduct");
                            int sttP = 1;
                        %>
                        <table class="mb-3">
                            <thead>
                                <tr>
                                    <td class="w40">STT</td>
                                    <td class="w260">SẢN PHẨM</td>
                                    <td>GIÁ BÁN</td>
                                    <td>MÀU SẮC</td>
                                    <td>SỐ LƯỢNG</td>
                                    <td>TRẠNG THÁI</td>
                                </tr>
                            </thead>
                            <tbody id ="innerProduct">
                            <% if (listAllProduct != null && !listAllProduct.isEmpty()) {
                                for (Product p: listAllProduct) {%>
                                <tr id="detailProductRow" data-bs-toggle ="modal" data-bs-target="#detailProduct" onclick="detailProduct('<%=p.getIdProduct()%>')">
                                    <input type="hidden" class ="idProduct" value="<%=p.getIdProduct()%>">
                                <td class="w40"><%=sttP%></td>
                                <td class="w260">
                                    <div class="item d-flex justify-content-center">
                                        <div class="item_img">
                                            <img src="<%=url%>/Products/<%=(p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()%>" class="card-img-top img_p_cart" alt="..."/>
                                        </div>
                                        <span class="item_text"><%=p.getName()%></span>
                                    </div>
                                </td>
                                <td><%=nF.format(p.getPrice())%></td>
                                <td><%=p.getColor()%></td>
                                <td><%=p.getQuantityAvailable()%></td>
                                    <%if (p.isStatus()) {%>
                                    <td>Đang bán</td>
                                    <%} else {%>
                                    <td>Ngưng bán</td>
                                    <%}%>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <button class="delete btnAdd bgcolor bd-full" title="Xóa" aria-hidden="true" onclick="deleteProduct('<%=p.getIdProduct()%>')" data-bs-toggle="modal" data-bs-target=""><i class="fa fa-trash-o text-color"></i></button>
                                        <button class="editProduct btnAdd bgcolor bd-full mx-1" title="Chỉnh sửa" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editProduct" onclick="innerEditProduct('<%=p.getIdProduct()%>')"><i class="fa fa-pencil text-color" ></i></button>
                                        <button class="block btnAdd bgcolor bd-full" title="Ẩn/hiện sản phẩm" onclick="hideProduct('<%=p.getIdProduct()%>')" aria-hidden="true" data-bs-toggle="modal" data-bs-target=""><i class="fa fa-lock text-color"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <%
                                        sttP++;
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="editProduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content ">
                            <div class="modal-body">
                                <form action="" method="post" id ="edit-Product" >
                                    <div class="row px-2">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class=" pb-2 text-center title">CHỈNH SỬA SẢN PHẨM</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên sản phẩm<span class="text-danger">*</span></label><span id="errNamePEdit" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameProductEdit" name="nameProductEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá nhập (₫)<span class="text-danger">*</span></label><span id="errImpPriceEdit"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceImpProductEdit" name="priceImpProductEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá bán (₫)<span class="text-danger">*</span></label><span id="errPriceEdit"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceProductEdit" name="priceProductEdit">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" id ="cateTypeEdit">Thể loại<span class="text-danger">*</span></label>
                                                <select class="form-control" name="cateChairEdit" id="cateChairEdit">
                                                    <option value="Ghế văn phòng">Ghế văn phòng</option>
                                                    <option value="Ghế thư giãn">Ghế thư giãn</option>
                                                    <option value="Ghế trang trí">Ghế trang trí</option>
                                                    <option value="Ghế gaming">Ghế gaming</option>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều dài<span class="fs">(cm)<span class="text-danger">*</span></span></label>
                                                    <input type="number" class="form-control" id="lengthEdit" name="lengthEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều rộng<span class="fs">(cm)<span class="text-danger">*</span></span></label>
                                                    <input type="number" class="form-control" id="widthEdit" name="widthEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều cao<span class="fs">(cm)<span class="text-danger">*</span></span></label>
                                                    <input type="number" class="form-control" id="heightEdit" name="heightEdit">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Vật liệu<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" id="materialEdit" name="materialEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Màu sắc<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" id="colorEdit" name="colorEdit">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Số lượng<span class="text-danger">*</span></label>
                                                    <input type="number" class="form-control" id="quantityEdit" name="quantityEdit">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Mô tả<span class ="text-danger">*</span></label><span id="errDesEdit"  class="text-danger"></span>
                                                <textarea type="text" class="form-control" id="desEdit" name="desEdit"></textarea>
                                            </div>
                                            <div id ="imageEdit">
                                                <label class="form-label">Hình ảnh<span class="text-danger">*</span></label><span id="errImg" class="text-danger"></span>
                                            </div>
                                            <div class="text-end mb-3">
                                                <button type ="button" class="btnAdd bgcolor bd-full" id ="btnAddImageEdit" onclick="addInputInEdit()"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm hình ảnh" ></i></button>
                                            </div>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="button" onclick="editProduct()">LƯU</button>
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
                            <div class="modal-body" id="detail">
                                <div class="container">
                                    <div class="row ">
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
                                                <div class="col-md-12 mt-3 imgdetail" >
                                                    <div class="owl-carousel" id ="owl">

                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Mã sản phẩm</label>
                                                <input type="text" class="form-control" id="idProductdetail" name="nameProductdetail" readonly>
                                            </div>
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
                                                    <input type="number" class="form-control" id="quantitydetail" name="amountdetail"readonly>
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
                                <form method="post" id="add-product" enctype="multipart/form-data">
                                    <div class="row px-2">
                                        <div class=" text-end">
                                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <h5 class="text-center title">  THÊM SẢN PHẨM</h5>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Tên sản phẩm<span class="text-danger">*</span></label><span id="errNameP" class="text-danger"></span>
                                                <input type="text" class="form-control" id="nameProduct" name="nameProduct">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá nhập (₫)<span class="text-danger">*</span></label><span id="errImpPriceAdd"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceImpProductAdd" name="priceImpProductAdd">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Giá bán (₫)<span class="text-danger">*</span></label><span id="errPriceAdd"  class="text-danger"></span>
                                                <input type="text" class="form-control" id="priceProductAdd" name="priceProductAdd">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Thể loại<span class="text-danger">*</span></label>
                                                <select class="form-control" name="cateChair" id="cateChair">
                                                    <option value="Ghế văn phòng">Ghế văn phòng</option>
                                                    <option value="Ghế thư giãn">Ghế thư giãn</option>
                                                    <option value="Ghế trang trí">Ghế trang trí</option>
                                                    <option value="Ghế gaming">Ghế gaming</option>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều dài<span class="fs">(cm)<span class="text-danger">*</span></span></label>
                                                    <input type="number" class="form-control" id="length" name="length">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều rộng<span class="text-danger">*</span><span class="fs">(cm)<span class="text-danger">*</span></span></label>
                                                    <input type="number" class="form-control" id="width" name="width">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Chiều cao<span class="fs">(cm)<span class="text-danger">*</span></span></label>
                                                    <input type="number" class="form-control" id="height" name="height">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Vật liệu<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" id="material" name="material">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Màu sắc<span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" id="color" name="color">
                                                </div>
                                                <div class="col-md-4 col-4 mb-3">
                                                    <label class="form-label">Số lượng<span class="text-danger">*</span></label>
                                                    <input type="number" class="form-control" id="quantity" name="quantity">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Mô tả<span class="text-danger">*</span></label><span id="errDes" class="text-danger"></span>
                                                <textarea type="text" class="form-control" id="des" name="des"></textarea>
                                            </div>
                                            <div id ="image">
                                                <label class="form-label">Hình ảnh<span class="text-danger">*</span></label><span id="errImg1" class="text-danger"></span>
                                            </div>
                                            <div class="text-end mb-3">
                                                <button type ="button" class="btnAdd bgcolor bd-full" id ="btnAddImage" onclick="addInput()"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm hình ảnh" ></i></button>
                                            </div>
                                        </div>
                                        <div class="row p-0">
                                            <div class="col-md-12 p-0">
                                                <div class="text-end">
                                                    <button class="save " type="button" onclick="addProduct()">LƯU</button>
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
                            <td class="w40">STT</td>
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
        <div class="col-lg-9 bgcolor d-none " id="mngInvoice">
            <div class="row mt-2">
                <div class="col-lg-4">
                    <h5>Quản lý hóa đơn</h5>
                </div>
                <div class="col-lg-8 pt-4"><label for="filterInvoice">Ngày xuất hóa đơn:</label> <input type="date"
                                                                                                        id="filterInvoice">
                    <button class="bd-full bgcolor-orange ms-2 rounded-1" id="btnFilter">Lọc</button>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-12 overflow-auto">
                    <table class="mb-3">
                        <thead>
                        <tr>
                            <td class="w40">STT</td>
                            <td>ID</td>
                            <td>MÃ KHÁCH HÀNG</td>
                            <td>NGÀY XUẤT</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr data-bs-toggle="modal" data-bs-target="#detailInvoice">
                            <td class="w40">2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>28/02/2023</td>
                            <td>
                                <button class="delete btnAdd bgcolor bd-full"><i class="fa fa-trash-o text-color"
                                                                                 title="Xóa" aria-hidden="true"
                                                                                 data-bs-toggle="modal"
                                                                                 data-bs-target="#"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="detailInvoice" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content ">
                        <div class="modal-body">
                            <div class="container">
                                <div class="row ">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <h5 class="pb-2 text-center title">CHI TIẾT HOÁ ĐƠN</h5>
                                    <hr>
                                    <div class="col-md-12">
                                        <p class="fw-bold">Tên khách hàng: <span id="nameCus">Minh Quân</span></p>
                                        <p class="fw-bold">Số điện thoại: <span id="phoneCus">0812295775</span></p>
                                        <p class="fw-bold">Email: <span id="emailCus">qle29210@gmail.com</span></p>
                                        <p class="fw-bold">Địa chỉ: <span id="addressCus">230A Tô Ngọc Vân</span></p>
                                        <p class="fw-bold">Mã hóa đơn: <span id="idInvoice">1</span></p>
                                        <p class="fw-bold">Phí vận chuyển: ₫<span id="transFee">0</span></p>
                                        <p class="fw-bold">Phương thức thanh toán: <span id="payMethod">Thanh toán khi nhận hàng</span>
                                        </p>
                                        <table class="table table-bordered">
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
                    <%
                        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
                        int sttC = 1;
                    %>
                    <table class="mb-3">
                        <thead>
                        <tr >
                            <td>STT</td>
                            <td>ID</td>
                            <td>TÊN</td>
                        </tr>
                        </thead>
                        <tbody id ="innerCategory">
                        <% if (listCategory != null && !listCategory.isEmpty()) {
                            for (Category c: listCategory) {%>
                        <tr>
                            <input type="hidden" class="id" id="categoryIdEdit" value="<%= c.getId()%>">
                            <td><%=sttC%></td>
                            <td><%=c.getId()%></td>
                            <td ><%=c.getName()%></td>
                            <td>
                                <div class="d-flex w-100 justify-content-center">
                                    <button class="delete btnAdd bgcolor bd-full me-1" title="Xóa" aria-hidden="true" onclick="deleteCategory('<%=c.getId()%>')" data-bs-toggle="modal" data-bs-target=""><i class="fa fa-trash-o text-color"></i></button>
                                    <button class="editCate btnAdd bgcolor bd-full" title="Chỉnh sửa danh mục" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editCate" onclick="innerEditCategory('<%=c.getId()%>')"><i class="fa fa-pencil text-color"></i></button>                                </div>
                            </td>
                        </tr>
                        <%
                                    sttC++;
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="editCate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form class="cateEdit" id="cateEdit" action="" method="post">
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
                                            <button class="save" type="button" onclick="editCate()">LƯU</button>
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
                            <form id="add-Cate" action="" method="post" enctype="multipart/form-data">
                                <div class="row px-2">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"data-bs-target="#addCate"></button>
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
                                            <button class="save" type="button" id="saveButton">LƯU</button>
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
            <div class="col-lg-9 bgcolor d-none " id="mngSup">
            <div class="row mt-2">
                <div class="col-lg-6">
                    <h5>Quản lý nhà cung cấp</h5>
                </div>
                <div class="col-lg-6 text-end">
                    <button class="btnAdd bgcolor bd-full" id="btnAddSupplier"><i class="fa fa-plus-circle text-color"
                                                                                  aria-hidden="true"
                                                                                  title="Thêm sản phẩm"
                                                                                  data-bs-toggle="modal"
                                                                                  data-bs-target="#addSup"></i></button>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-12 overflow-auto mheight">
                    <%
                        ArrayList<Supplier> suplist = (ArrayList<Supplier>) request.getAttribute("listAllSup");
                        int sttS = 1;
                    %>
                    <table class="mb-3">
                        <thead>
                        <tr>
                            <td class="w40">STT</td>
                            <td class="w40">ID</td>
                            <td>TÊN NCC</td>
                            <td class="w225">ĐỊA CHỈ</td>
                            <td>SỐ ĐIỆN THOẠI</td>
                            <td>EMAIL</td>
                            <td>PHÂN PHỐI</td>
                        </tr>
                        </thead>

                        <tbody id="innerSupplier">
                        <%
                            if (suplist != null && !suplist.isEmpty()) {
                                for (Supplier s : suplist) {
                        %>
                        <tr>
                            <td class="w40"><%=sttS%>
                            </td>
                            <td class="w40"><%=s.getIdSup()%>
                            </td>
                            <td><%=s.getNameSup()%>
                            </td>
                            <td class="w225"><%=s.getAddress()%>
                            </td>
                            <td><%=s.getPhoneNumber()%>
                            </td>
                            <td><%=s.getEmail()%>
                            </td>
                            <td>
                                <%=s.typeCate(s.getIdCate())%>
                            </td>

                            <td class="w110">
                                <div class="d-flex w-100 justify-content-center">
                                    <button class="delete btnAdd bgcolor bd-full me-1"
                                            onclick="deleteSupplier('<%=s.getIdSup()%>')" data-bs-toggle="modal"
                                            data-bs-target=""><i
                                            class="fa fa-trash-o text-color" title="Xóa" aria-hidden="true"
                                            data-bs-toggle="modal" data-bs-target=""></i></button>
                                    <button class="editAccount btnAdd bgcolor bd-full "><i
                                            class="fa fa-pencil text-color" title="Chỉnh sửa" aria-hidden="true" onclick="innerSupplier('<%=s.getIdSup()%>')"
                                            data-bs-toggle="modal" data-bs-target="#editSup"></i></button>
                                </div>
                            </td>
                        </tr>

                        <%
                                    sttS++;
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="editSup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form class="form " id="supEdit" method="post">
                                <div class="row px-2">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <h5 class="text-center">CHỈNH SỬA NHÀ CUNG CẤP</h5>
                                    <hr>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Tên nhà cung cấp</label><span id="errNameSupEdit"
                                                                                                    class="text-danger"></span>
                                            <input type="text" class="form-control" id="nameSupEdit" name="nameSupEdit">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ</label><span id="errAddEdit"
                                                                                           class="text-danger"></span>
                                            <input type="text" class="form-control" id="addressSupEdit"
                                                   name="addressSupEdit">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Số điện thoại</label><span
                                                id="errphoneNumberSupEdit" class="text-danger"></span>
                                            <input type="text" class="form-control" id="phoneNumberSupEdit"
                                                   name="phoneNumberSupEdit">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email</label><span id="errEmailSupEdit"
                                                                                         class="text-danger"></span>
                                            <input type="text" class="form-control" id="emailSupEdit"
                                                   name="emailSupEdit">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Cung cấp loại</label>
                                            <select class="form-control" name="cateChairSupEdit" id="cateChairSupEdit">
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
                                                <button class="save " type="button" onclick="editSup()">LƯU</button>
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
                            <%
                                String nameSupAdd = (String) request.getAttribute("nameSupAdd");
                                String addressSupAdd = (String) request.getAttribute("addressSupAdd");
                                String phoneSupAdd = (String) request.getAttribute("phoneSupAdd");
                                String emailSupAdd = (String) request.getAttribute("emailSupAdd");
//                                    String cateSupAdd = (String) request.getAttribute("cateChairSupAdd");

                                String errNameSupAdd = (String) request.getAttribute("errNameSupAdd");
                                String errPhoneSupAdd = (String) request.getAttribute("errPhoneSupAdd");
                                String errEmailSupAdd = (String) request.getAttribute("errEmailSupAdd");
                                String errAddressSupAdd = (String) request.getAttribute("errAddressSupAdd");

                                nameSupAdd = (nameSupAdd == null) ? "" : nameSupAdd;
                                addressSupAdd = (addressSupAdd == null) ? "" : addressSupAdd;
                                phoneSupAdd = (phoneSupAdd == null) ? "" : phoneSupAdd;
                                emailSupAdd = (emailSupAdd == null) ? "" : emailSupAdd;

                                errNameSupAdd = (errNameSupAdd == null) ? "" : errNameSupAdd;
                                errPhoneSupAdd = (errPhoneSupAdd == null) ? "" : errPhoneSupAdd;
                                errEmailSupAdd = (errEmailSupAdd == null) ? "" : errEmailSupAdd;
                                errAddressSupAdd = (errAddressSupAdd == null) ? "" : errAddressSupAdd;
                            %>
                            <form class="form" id="supAdd" method="post" enctype="multipart/form-data">
                                <div class="row p-4">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <h5 class="text-center">THÊM NHÀ CUNG CẤP</h5>
                                    <hr>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Tên nhà cung cấp</label><span id="errNameSupAdd"
                                                                                                    class="text-danger"><%=errNameSupAdd%></span>
                                            <input type="text" class="form-control" id="nameSupAdd" name="nameSupAdd"
                                                   value="<%=nameSupAdd%>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ</label><span id="errAddressSupAdd"
                                                                                           class="text-danger"><%=errAddressSupAdd%></span>
                                            <input type="text" class="form-control" id="addressSupAdd"
                                                   name="addressSupAdd" value="<%=addressSupAdd%>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Số điện thoại</label><span id="errphoneSupAdd"
                                                                                                 class="text-danger"><%=errPhoneSupAdd%></span>
                                            <input type="text" class="form-control" id="phoneSupAdd" name="phoneSupAdd"
                                                   value="<%=phoneSupAdd%>">
                                        </div>


                                        <div class="mb-3">
                                            <label class="form-label">Email</label><span id="errEmailSupAdd"
                                                                                         class="text-danger"><%=errEmailSupAdd%></span>
                                            <input type="text" class="form-control" id="emailSupAdd" name="emailSupAdd"
                                                   value="<%=emailSupAdd%>">
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
                                                <button class="save " type="button" onclick="addSup()">LƯU</button>
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
<%
} else {
    if (account == null) {
%>
<div class="container p-0 mgt text-center fw-bold">Bạn chưa đăng nhập! <a href = <%=url%>/SignIn.jsp>Đăng nhập</a></div>
<%} else {%>
<div class="container p-0 mgt text-center fw-bold">Bạn không có quyền quản lý! <a href = <%=url%>/homePage>Quay lại</a></div>
<%
        }
    }
%>
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
       // $(".owl-carousel").owlCarousel();
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
        var quantity = document.getElementById("quantity");
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
        //quantity
        if (quantity.value === "") {
            quantity.style.borderColor = 'red';
            flag = false;
        } else {
            quantity.style.borderColor = '#dee2e6';
        }
        console.log(flag)
        return flag;
    }
    var id ="";
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
    var idSup ="";
    function innerSupplier(id) {
        idSup=id;
        console.log(id);
        $.ajax({
            type: "GET",
            url: "LoadDetailSupplier",
            data: {
                id: id,
            },

            success: function (data) {
                var s = data.supplier;
                $("#nameSupEdit").val(s.name);
                console.log(s.name);
                $("#phoneNumberSupEdit").val(s.phoneNumber);
                $("#emailSupEdit").val(s.email);
                $("#addressSupEdit").val(s.address);

                $('#cateChairSupEdit').val(s.typeCate);

            },
            error: function () {
                console.error("Không thể tải chi tiết nhà cung cấp");
            }
        });
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
        } else if (!email.value.match(emailReg)) {
            flag = false;
            errEmailSup.innerHTML = ' *Email không hợp lệ!';
        } else {
            errEmailSup.innerHTML = ''
        }
        if(flag) {
            var formData = new FormData();

            formData.append('id', idSup);
            formData.append('nameSupEdit', name.value);
            formData.append('addressSupEdit', address.value);
            formData.append('phoneSupEdit', phone.value);
            formData.append('emailSupEdit', email.value);
            let cateChaiValue =$("#cateChairSupEdit :selected").text();
            formData.append('cateChairSupEdit', cateChaiValue);
            $.ajax({
                url: 'EditSupplier',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerSupplier");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var s = htmlData[i];
                        row.innerHTML +=  "<tr>\n" +
                            "<td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "<td class=\"w40\">" + s.idSup + "</td>\n" +
                            "<td>" + s.nameSup + "</td>\n" +
                            "<td class=\"w225\">" + s.addressSup + "</td>\n" +
                            "<td>" + s.phoneSup + "</td>\n" +
                            "<td>" + s.emailSup + "</td>\n" +
                            "<td>" + s.nameCate + "</td>\n" +
                            "<td class=\"w110\">\n" +
                            "<div class=\"d-flex w-100 justify-content-center\">\n" +
                            "<button class=\"delete btnAdd bgcolor bd-full me-1\"onclick=\"deleteSupplier('" + s.idSup + "')\" data-bs-toggle=\"modal\"data-bs-target=\"\"><i class=\"fa fa-trash-o text-color\" title=\"Xóa\" aria-hidden=\"true\"data-bs-toggle=\"modal\" data-bs-target=\"\"></i></button>\n" +
                            "<button class=\"editAccount btnAdd bgcolor bd-full \"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\" onclick=\"innerSupplier('"+s.idSup+"')\" data-bs-toggle=\"modal\" data-bs-target=\"#editSup\"></i></button>\n" +
                            "</div>\n" +
                            "</td>\n" +
                            "</tr>";
                    }
                },
                error: function(error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
        document.getElementById("supEdit").close();
    }
    window.onload = function () {
        if ($('#res').text() !== "") {
            alert($('#res').text());
        }
    }
    function addSup() {
        var name = document.getElementById("nameSupAdd");
        var address = document.getElementById("addressSupAdd");
        var phone = document.getElementById("phoneSupAdd");
        var email = document.getElementById("emailSupAdd");
        var cateChair = document.getElementById("cateChairSupAdd");

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
        } else if (!email.value.match(emailReg)) {
            flag = false;
            errEmailSup.innerHTML = ' *Email không hợp lệ!';
        } else {
            errEmailSup.innerHTML = ''
        }

        if (flag) {
            var formData2 = new FormData();
            formData2.append('nameSupAdd', name.value);
            formData2.append('addressSupAdd', address.value);
            formData2.append('phoneSupAdd', phone.value);
            formData2.append('emailSupAdd', email.value);
            let cateChaiValue =$("#cateChairSupAdd :selected").text();
            formData2.append('cateChairSupAdd', cateChaiValue);
            $.ajax({
                url: 'AddSupplier',
                type: 'POST',
                data: formData2,
                contentType: false,
                processData: false,
                success: function(data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerSupplier");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var s = htmlData[i];
                        row.innerHTML +=  "<tr>\n" +
                            "<td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "<td class=\"w40\">" + s.idSup + "</td>\n" +
                            "<td>" + s.nameSup + "</td>\n" +
                            "<td class=\"w225\">" + s.addressSup + "</td>\n" +
                            "<td>" + s.phoneSup + "</td>\n" +
                            "<td>" + s.emailSup + "</td>\n" +
                            "<td>" + s.nameCate + "</td>\n" +
                            "<td class=\"w110\">\n" +
                            "<div class=\"d-flex w-100 justify-content-center\">\n" +
                            "<button class=\"delete btnAdd bgcolor bd-full me-1\"onclick=\"deleteSupplier('" + s.idSup + "')\" data-bs-toggle=\"modal\"data-bs-target=\"\"><i class=\"fa fa-trash-o text-color\" title=\"Xóa\" aria-hidden=\"true\"data-bs-toggle=\"modal\" data-bs-target=\"\"></i></button>\n" +
                            "<button class=\"editAccount btnAdd bgcolor bd-full \"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\" onclick=\"innerSupplier('"+s.idSup+"')\" data-bs-toggle=\"modal\" data-bs-target=\"#editSup\"></i></button>\n" +
                            "</div>\n" +
                            "</td>\n" +
                            "</tr>";
                    }
                },
                error: function(error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }

    function addCate() {
       console.log('Button clicked!'); // Thêm dòng này
        var flag = true;
        var nameInput = document.getElementById("nameCateAdd");
        var error = document.getElementById("errNameCateAdd");

        if (nameInput.value === "") {
            error.innerHTML = ' *Vui lòng nhập danh mục mới!';
            flag = false;
        } else {
            error.innerHTML = '';
        }
        if (flag) {
            var name = nameInput.value;
            $.ajax({
                url: 'addCategory',
                type: 'POST',
                data: { nameCateAdd: name }, // tên danh mục nhập vào
                success: function (data) {
                    try {
                        var jsonData = JSON.parse(data);
                        var res = jsonData.res;
                        var htmlData = jsonData.htmlData;
                        alert(res);
                        // Cập nhật danh sách danh mục trên giao diện
                        var row = document.getElementById("innerCategory");
                        row.innerHTML = "";
                        for (var i = 0; i < htmlData.length; i++) {
                            var c = htmlData[i];
                            row.innerHTML +=  "<tr>" +
                                "<input type='hidden' class='id' value='" + c.id + "'>" +
                                "<td>" + (i + 1) + "</td>" +
                                "<td>" + c.id + "</td>" +
                                "<td>" + c.name + "</td>" +
                                "<td>" +
                                "<div class='d-flex w-100 justify-content-center'>" +
                                "<button class='delete btnAdd bgcolor bd-full me-1' title='Xóa' aria-hidden='true' onclick='deleteCategory(\"" + c.id + "\")' data-bs-toggle='modal' data-bs-target=''><i class='fa fa-trash-o text-color'></i></button>" +
                                "<button class='editCate btnAdd bgcolor bd-full' title='Chỉnh sửa danh mục' aria-hidden='true' data-bs-toggle='modal' data-bs-target='#editCate' onclick='innerEditCategory(\"" + c.id + "\")'><i class='fa fa-pencil text-color'></i></button>" +
                                "</div>" +
                                "</td>" +
                                "</tr>";
                        }
                    } catch (e) {
                        console.error("Xảy ra lỗi khi xử lý phản hồi JSON:", e);
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
        return false; // Ngăn chặn sự kiện mặc định của biểu mẫu
    }
    document.getElementById('saveButton').addEventListener('click', addCate);
    function addInput() {
        var container = document.getElementById('image');
        var newInput = document.createElement('div');
        newInput.className = 'mb-3';
        newInput.innerHTML = '<input type="file" class="form-control" name="image"">';
        container.appendChild(newInput);
    }
    // Sử dụng hàm này để tải chi tiết sản phẩm bằng AJAX
    function loadProductDetails(productId) {
        $.ajax({
            type: "GET",
            url: "loadDetailProduct",
            data: {
                idProduct: productId
            },
            success: function (data) {
                // Cập nhật nội dung modal với dữ liệu JSON nhận được
                updateModalContent(data);
            },
            error: function () {
                console.error("Không thể tải chi tiết sản phẩm");
            }
        });
    }

    // Sử dụng hàm này để cập nhật nội dung modal
    function updateModalContent(data) {
        var p = data.product;
        //Cập nhật các phần tử HTML với chi tiết sản phẩm
        $("#idProductdetail").val(p.idProduct);
        $("#nameProductdetail").val(p.name);
        $("#priceImpProductdetail").val(p.priceImport);
        $("#priceProductDetail").val(p.price);
        $("#lengthdetail").val(p.length);
        $("#widthdetail").val(p.width);
        $("#heightdetail").val(p.height);
        $("#materialdetail").val(p.material);
        $("#cateTypedetail").val(p.typeCate)
        $("#colordetail").val(p.color);
        $("#quantitydetail").val(p.quantityAvailable);
        $("#desdetail").val(p.description);
        // cập nhật ảnh chính
        $('#img_center').attr('src',p.imageCenter);
        $('.owl-carousel').owlCarousel('destroy'); // Khởi tạo lại Owl Carousel
        // Cập nhật carousel ảnh chi tiết
        $(".owl-carousel").empty();
        for (var img of p.imageDetail) {
            $(".owl-carousel").append(`<div class="pe-2"><img src="Products/${img.url}" alt="" class="img_p_detail" onmouseover="changeImg('Products/${img.url}')"></div>`);
        }
        $('.owl-carousel').owlCarousel()
        $('.owl-carousel').removeClass("owl-hidden");
    }

    // Ví dụ: Gọi hàm này khi một dòng sản phẩm được nhấp vào
    function detailProduct(productId) {
        // Tải chi tiết sản phẩm bằng AJAX
        loadProductDetails(productId);
    };

    function changeImg(newSrc) {
        var img_center = document.getElementById('img_center');
        if (img_center) {
            img_center.src = newSrc;
        }
    }
    function deleteCategory(categoryId) {
            var confirmation = confirm("Bạn có chắc muốn xóa ?");
            if (confirmation) {
                $.ajax({
                    type: "POST",
                    url: "delCategory", // Đường dẫn tới Servlet xử lý xóa danh mục
                    data: { id: categoryId },
                    success: function (data) {
                        var jsonData = JSON.parse(data);
                        var htmlData = jsonData.htmlData;
                        var res = jsonData.res;
                        alert(res);
                        var row = document.getElementById("innerCategory");
                        row.innerHTML = ""; // Clear existing content
                        for (var i = 0; i < htmlData.length; i++) {
                            var c = htmlData[i];
                            row.innerHTML +=  "<tr>" +
                                "<input type='hidden' class='id' value='" + c.id + "'>" +
                                "<td>" + (i + 1) + "</td>" +
                                "<td>" + c.id + "</td>" +
                                "<td>" + c.name + "</td>" +
                                "<td>" +
                                "<div class='d-flex w-100 justify-content-center'>" +
                                "<button class='delete btnAdd bgcolor bd-full me-1' title='Xóa' aria-hidden='true' onclick='deleteCategory(\"" + c.id + "\")' data-bs-toggle='modal' data-bs-target=''><i class='fa fa-trash-o text-color'></i></button>" +
                                "<button class='editCate btnAdd bgcolor bd-full' title='Chỉnh sửa danh mục' aria-hidden='true' data-bs-toggle='modal' data-bs-target='#editCate' onclick='innerEditCategory(\"" + c.id + "\")'><i class='fa fa-pencil text-color'></i></button>" +
                                "</div>" +
                                "</td>" +
                                "</tr>";
                        }
                    },
                    error: function (error) {
                        console.error("Lỗi khi xóa danh mục:", error);
                    }
                });
            }
    }
    var categoryId = "";
    function editCate() {
        var flag = true;
        var nameCate = document.getElementById("nameCateEdit");
        var errNameCate = document.getElementById("errNameCate");

        if (nameCate.value === "") {
            errNameCate.innerHTML = 'Vui lòng nhập tên danh mục';
            flag = false;
        } else {
            errNameCate.innerHTML = '';
        }
        if (flag) {
            $.ajax({
                url: 'editCategory',
                type: 'POST',
                data: {
                    nameCateEdit: nameCate.value,
                    categoryId: categoryId,
                },
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerCategory");
                    row.innerHTML = "";
                    for (var i = 0; i < htmlData.length; i++) {
                        var c = htmlData[i];
                        row.innerHTML += "<tr>" +
                            "<input type='hidden' class='id' value='" + c.id + "'>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td>" + c.id + "</td>" +
                            "<td>" + c.name + "</td>" +
                            "<td>" +
                            "<div class='d-flex w-100 justify-content-center'>" +
                            "<button class='delete btnAdd bgcolor bd-full me-1' title='Xóa' aria-hidden='true' onclick='deleteCategory(\"" + c.id + "\")' data-bs-toggle='modal' data-bs-target=''><i class='fa fa-trash-o text-color'></i></button>" +
                            "<button class='editCate btnAdd bgcolor bd-full' title='Chỉnh sửa danh mục' aria-hidden='true' data-bs-toggle='modal' data-bs-target='#editCate' onclick='innerEditCategory(\"" + c.id + "\")'><i class='fa fa-pencil text-color'></i></button>" +
                            "</div>" +
                            "</td>" +
                            "</tr>";
                    }
                },
            });
        }
    }
    function deleteProduct(productId) {
                url: "delProduct",
                data: { id: productId },
                success: function(data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerProduct");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var p = htmlData[i];
                        row.innerHTML += "  <tr  data-bs-toggle =\"modal\" data-bs-target=\"#detailProduct\" onclick=\"detailProduct('"+p.idProduct+"')\">\n" +
                        "<input type=\"hidden\" className =\"idProduct\" value=\""+p.idProduct+"\">"+
                        "                                <td class=\"w40\">"+(i+1)+"</td>\n" +
                        "                                <td class=\"w260\">\n" +
                        "                                    <div class=\"item d-flex justify-content-center\">\n" +
                        "                                        <div class=\"item_img\">\n" +
                        "                                            <img src=\""+p.imageUrl+"\"\n" +
                        "                                                 class=\"card-img-top img_p_cart\" alt=\"...\"/>\n" +
                        "                                        </div>\n" +
                            "<span class=\"item_text\">" + p.name + "</span>\n" +
                        "                                    </div>\n" +
                        "                                </td>\n" +
                        "                                <td>"+p.price+"</td>\n" +
                        "                                <td>"+p.color+"</td>\n" +
                        "                                <td>"+p.quantity+"\n" +
                        "                                <td>"+p.status+"</td>\n" +
                        "                                <td>\n" +
                        "                                    <div class=\"d-flex justify-content-center\">\n" +
                        "                                        <button class=\"delete btnAdd bgcolor bd-full\" title=\"Xóa\" aria-hidden=\"true\" onclick=\"deleteProduct('"+p.idProduct+"')\" data-bs-toggle=\"modal\" data-bs-target=\"\"><i class=\"fa fa-trash-o text-color\"></i></button>"+
                            "                                        <button class=\"editProduct btnAdd bgcolor bd-full mx-1\" data-bs-toggle=\"modal\" data-bs-target=\"#editProduct\" onclick=\"innerEditProduct('"+p.idProduct+"')\"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\"></i></button>\n" +
                        "                                        <button class=\"hideProduct btnAdd bgcolor bd-full\" title=\"Ẩn/hiện sản phẩm\" aria-hidden=\"true\" onclick=\"hideProduct('"+p.idProduct+"')\" data-bs-toggle=\"modal\" data-bs-target=\"\"><i class=\"fa fa-lock text-color\"></i></button>"+
                        "                                    </div>\n" +
                        "                                </td>\n" +
                        "                            </tr>";
                    }
                },
                error: function(error) {
                    console.error("Lỗi khi xóa sản phẩm:", error);
                }
            });
        }
    }
    function hideProduct(productId) {
        var confirmation = confirm("Bạn có chắc với lựa chọn này ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "updateStatusProduct",
                data: { id: productId },
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerProduct");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var p = htmlData[i];
                        row.innerHTML += "  <tr  data-bs-toggle =\"modal\" data-bs-target=\"#detailProduct\" onclick=\"detailProduct('"+p.idProduct+"')\">\n" +
                            "<input type=\"hidden\" className =\"idProduct\" value=\""+p.idProduct+"\">"+
                            "                                <td class=\"w40\">"+(i+1)+"</td>\n" +
                            "                                <td class=\"w260\">\n" +
                            "                                    <div class=\"item d-flex justify-content-center\">\n" +
                            "                                        <div class=\"item_img\">\n" +
                            "                                            <img src=\""+p.imageUrl+"\"\n" +
                            "                                                 class=\"card-img-top img_p_cart\" alt=\"...\"/>\n" +
                            "                                        </div>\n" +
                            "<span class=\"item_text\">" + p.name + "</span>\n" +
                            "                                    </div>\n" +
                            "                                </td>\n" +
                            "                                <td>"+p.price+"</td>\n" +
                            "                                <td>"+p.color+"</td>\n" +
                            "                                <td>"+p.quantity+"\n" +
                            "                                <td>"+p.status+"</td>\n" +
                            "                                <td>\n" +
                            "                                    <div class=\"d-flex justify-content-center\">\n" +
                            "                                        <button class=\"delete btnAdd bgcolor bd-full\" title=\"Xóa\" aria-hidden=\"true\" onclick=\"deleteProduct('"+p.idProduct+"')\" data-bs-toggle=\"modal\" data-bs-target=\"\"><i class=\"fa fa-trash-o text-color\"></i></button>"+
                            "                                        <button class=\"editProduct btnAdd bgcolor bd-full mx-1\" data-bs-toggle=\"modal\" data-bs-target=\"#editProduct\" onclick=\"innerEditProduct('"+p.idProduct+"')\"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\"></i></button>\n" +
                            "                                        <button class=\"hideProduct btnAdd bgcolor bd-full\" title=\"Ẩn/hiện sản phẩm\" aria-hidden=\"true\" onclick=\"hideProduct('"+p.idProduct+"')\" data-bs-toggle=\"modal\" data-bs-target=\"\"><i class=\"fa fa-lock text-color\"></i></button>"+
                            "                                    </div>\n" +
                            "                                </td>\n" +
                            "                            </tr>";
                    }
                },
                error: function(error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }
    function detailAccount(id) {
       $.ajax({
            type: "GET",
            url: "loadDetailAccount",
            data: {
                id: id
            },
            success: function (data) {
                // Cập nhật nội dung modal với dữ liệu JSON nhận được
                var a = data.account;
                $('#idAccountDetail').val(a.id);
                $('#nameAccountDetail').val(a.name);
                $('#phoneAccountDetail').val(a.phoneNumber);
                $('#genderAccountDetail').val(a.gender);
                $('#EmailAccountDetail').val(a.email);
                $('#dateAccountDetail').val(a.birthDay);
                $('#addressAccountDetail').val(a.address);
                $('#addressReAccountDetail').val(a.addressRecei);
            },
            error: function () {
                console.error("Không thể tải chi tiết tài khoản");
            }
        });
    }
    function deleteAccount(id) {
        var confirmation = confirm("Bạn có chắc muốn xóa ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "delAccount",
                data: { id: id},
                success: function(data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                                "                                    <td class=\"w40\">" + (i+1) + "</td>\n" +
                                "                                    <td>" + a.name + "</td>\n" +
                                "                                    <td>" + a.email + "</td>\n" +
                                "                                    <td>" + a.role + "</td>\n" +
                                "                                    <td>" + a.vrf + "</td>\n" +
                                "                                    <td class = \"status\">" + a.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                                "                                            <button class=\"delete btnAdd bgcolor bd-full\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"deleteAccount('" + a.id + "')\" ><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" ></i></button>\n" +
                                "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa quyền truy cập\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                                "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                                "                                        </div>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                    }
                },
                error: function(error) {
                    console.error("Lỗi khi xóa sản phẩm:", error);
                }
            });
        }
    }
    function banAccount(id) {
        var confirmation = confirm("Bạn có chắc với lựa chọn này ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "updateStatusAccount",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                                "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "                                    <td>" + a.name + "</td>\n" +
                                "                                    <td>" + a.email + "</td>\n" +
                                "                                    <td>" + a.role + "</td>\n" +
                                "                                    <td>" + a.vrf + "</td>\n" +
                                "                                    <td class = \"status\">" + a.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                                "                                            <button class=\"delete btnAdd bgcolor bd-full\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"deleteAccount('" + a.id + "')\" ><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" ></i></button>\n" +
                                "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa quyền truy cập\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                                "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                                "                                        </div>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }        
    function innerEditCategory(cateId) {
        categoryId = cateId;
        $.ajax({
            type: "GET",
            url: "loadDetailCategory",
            data: {
                id: cateId
            },
            success: function (data) {
                var c = data.category;
                $("#nameCateEdit").val(c.name);
            },
            error: function () {
                console.error("Không thể tải chi tiết sản phẩm");
            }
        });
    }
    var idAccount ="";
    function innerAccount(id) {
        idAccount = id;
        $.ajax({
            type: "GET",
            url: "loadDetailAccount",
            data: {
                id: id,
            },
            success: function (data) {
                var a = data.account;
                $("#HienThiTen").val(a.name);
                $("#HienThiGmail").val(a.email);
                $("#HienThiSDT").val(a.phoneNumber);
                $("#HienThiDC").val(a.address);
                $("#HienThiDCReice").val(a.addressRecei);
                $("#HienThiNS").val(a.birthDay);
                var gender = a.gender;
                if(gender === "Nam") {
                    $("#male").prop("checked", true);
                }else if(gender === "Nữ") {
                    $("#female").prop("checked", true);
                }else {
                    $("#other").prop("checked", true);
                }
                console.log(a.checkStaff)
                if(a.checkStaff === "Khách hàng") {
                    $('#cus').prop("checked", true);
                }else if(a.checkStaff === "Nhân viên"){
                    $('#staff').prop("checked", true);
                }else {
                    $('#admin').prop("checked", true);
                }
                var error = document.getElementById("res");
            },
            error: function () {
                console.error("Không thể tải chi tiết tài khoản");
            }
        });
    }
    function editAccount() {
        var flag = true;
        var tenElement = document.getElementById("HienThiTen");
        var gmailElement = document.getElementById("HienThiGmail");
        var sdtElement = document.getElementById("HienThiSDT");
        var dcElement = document.getElementById("HienThiDC");
        var dcReElement = document.getElementById("HienThiDCReice");
        var nsElement = document.getElementById("HienThiNS");
        var error = document.getElementById("error");
        var gmailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var phoneReg = /^\d{10}/;
        if(tenElement.value == "") {
            error.innerHTML = "Vui lòng nhập họ và tên!";
            flag = false;
        }else if(gmailElement.value == "") {
            error.innerHTML = "Vui lòng nhập Email!";
            flag = false;
        }else if(!gmailElement.value.match(gmailReg)) {
            error.innerHTML = "Email không hợp lệ!";
            flag = false;
        }else if(sdtElement.value == "") {
            error.innerHTML = "Vui lòng nhập số điện thoại!";
            flag = false;
        }else if(!sdtElement.value.match(phoneReg)) {
            error.innerHTML = "Số điện thoại không hợp lệ!";
            flag = false;
        }
        else if(dcElement.value == "") {
            error.innerHTML = "Vui lòng nhập địa chỉ!";
            flag = false;
        }else if(dcReElement.value ==""){
            error.innerHTML = "Vui lòng nhập địa chỉ nhận hàng!";
            flag = false;
        } else if(nsElement.value == "") {
            error.innerHTML = "Vui lòng chọn ngày sinh!";
            flag = false;
        }
        if(flag) {
            var gender = $('input[type="radio"][name="gender"]:checked');
            var role = $('input[type="radio"][name="role"]:checked');
            $.ajax({
                url: 'editAccount',
                type: 'POST',
                data: {
                    name:tenElement.value,
                    email: gmailElement.value,
                    phoneNumber:sdtElement.value,
                    address:dcElement.value,
                    gender:gender.val(),
                    addressRecei:dcReElement.value,
                    birthDay:nsElement.value,
                    role: role.val(),
                    id: idAccount
                },
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                                "                                    <td class=\"w40\">" + (i+1) + "</td>\n" +
                                "                                    <td>" + a.name + "</td>\n" +
                                "                                    <td>" + a.email + "</td>\n" +
                                "                                    <td>" + a.role + "</td>\n" +
                                "                                    <td>" + a.vrf + "</td>\n" +
                                "                                    <td class = \"status\">" + a.status + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                                "                                            <button class=\"delete btnAdd bgcolor bd-full\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"deleteAccount('" + a.id + "')\" ><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" ></i></button>\n" +
                                "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa thông tin\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                                "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                                "                                        </div>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                    }
                },
                error: function(error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }
    function addAccount() {
        var condition = true;
        var user = $('#userName').val();
        var password = $('#password').val();
        var rePW = $('#rePassword').val();
        var email = $('#email').val();
        var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$/;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var specialCharacters = /[!@#$%^&*(),.?":{}|<>' -]/;
        if (user === "") {
            $("#errUser").text('Vui lòng nhập tên đăng nhập!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else if (specialCharacters.test(user)) {
            $("#errUser").text('Tên đăng nhập không chứa kí tự đặc biệt!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errUser").text('');
        }
        if(password===""){
            $("#errPW").text('Vui lòng nhập mật khẩu!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else if(password.length < 6 || password.length > 50){
            $("#errPW").text('Mật khẩu dài từ 6 đến 50 ký tự!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else if(!password.match(passwordRegex)){
            $("#errPW").text('Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else {
            $("#errPW").text('');
        }
        if(rePW === ""){
            $("#errRePW").text('Vui lòng xác nhận lại mật khẩu!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        }else if(rePW !==password){
            $("#errRePW").text('Mật khẩu xác nhận không đúng!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errRePW").text('');
        }
        if(email===""){
            $("#errEmail").text('Vui lòng nhập Email!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmail").text('Email không hợp lệ!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errEmail").text('');
        }
        if(condition) {
            $.ajax({
                url: 'addAccount',
                type: 'POST',
                data:{
                    userName: user,
                    password: password,
                    rePW: rePW,
                    email: email,
                },
                success: function(data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    var errUser = jsonData.errUser;
                    var errEmail = jsonData.errEmail;
                    var userName = jsonData.user;
                    var emaill = jsonData.email;
                    if(errUser !== "") {
                        $("#errUser").text(errUser);
                        user.val(userName);
                    }
                    if(errEmail !== "") {
                        $("#errEmail").text(errEmail);
                        email.val(emaill);
                    }
                    if(res !== "") {
                        alert(res);
                    }
                    var row = document.getElementById("innerAccount");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var a = htmlData[i];
                        row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailAccount\" onclick=\"detailAccount('" + a.id + "')\">\n" +
                            "                                    <td class=\"w40\">" + (i+1) + "</td>\n" +
                            "                                    <td>" + a.name + "</td>\n" +
                            "                                    <td>" + a.email + "</td>\n" +
                            "                                    <td>" + a.role + "</td>\n" +
                            "                                    <td>" + a.vrf + "</td>\n" +
                            "                                    <td class = \"status\">" + a.status + "</td>\n" +
                            "                                    <td>\n" +
                            "                                        <div class=\"d-flex w-100 justify-content-center\">\n" +
                            "                                            <button class=\"delete btnAdd bgcolor bd-full\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"deleteAccount('" + a.id + "')\" ><i class=\"fa fa-trash-o text-color\"  title=\"Xóa\" ></i></button>\n" +
                            "                                            <button class=\"editAccount btnAdd bgcolor bd-full mx-1\" title=\"Chỉnh sửa thông tin\" aria-hidden=\"true\" data-bs-toggle=\"modal\" data-bs-target=\"#editAccount\" onclick=\"innerAccount('" + a.id + "')\"><i class=\"fa fa-pencil text-color\" ></i></button>\n" +
                            "                                            <button class=\"block btnAdd bgcolor bd-full \" data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"banAccount('" + a.id + "')\"><i class=\"fa fa-lock text-color\" title=\"Khóa\" aria-hidden=\"true\" ></i></button>\n" +
                            "                                        </div>\n" +
                            "                                    </td>\n" +
                            "                                </tr>";
                    }
                },
                error: function(error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
      function deleteSupplier(idSup) {
        var confirmation = confirm("Bạn có chắc muốn xóa ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "DelSupplierInManage",
                data: {id: idSup},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerSupplier");
                    row.innerHTML = ""; // Clear existing content
                    // console.log("length" + htmlData.length);
                    for (var i = 0; i < htmlData.length; i++) {
                        // console.log("i" + i);
                        var s = htmlData[i];
                        row.innerHTML += "<tr>\n" +
                            "<td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "<td class=\"w40\">" + s.idSup + "</td>\n" +
                            "<td>" + s.nameSup + "</td>\n" +
                            "<td class=\"w225\">" + s.addressSup + "</td>\n" +
                            "<td>" + s.phoneSup + "</td>\n" +
                            "<td>" + s.emailSup + "</td>\n" +
                            "<td>" + s.nameCate + "</td>\n" +
                            "<td class=\"w110\">\n" +
                            "<div class=\"d-flex w-100 justify-content-center\">\n" +
                            "<button class=\"delete btnAdd bgcolor bd-full me-1\"onclick=\"deleteSupplier('" + s.idSup + "')\" data-bs-toggle=\"modal\"data-bs-target=\"\"><i class=\"fa fa-trash-o text-color\" title=\"Xóa\" aria-hidden=\"true\"data-bs-toggle=\"modal\" data-bs-target=\"\"></i></button>\n" +
                            "<button class=\"editAccount btnAdd bgcolor bd-full \"><i class=\"fa fa-pencil text-color\" title=\"Chỉnh sửa\" aria-hidden=\"true\" onclick=\"innerSupplier('"+s.idSup+"')\" data-bs-toggle=\"modal\" data-bs-target=\"#editSup\"></i></button>\n" +
                            "</div>\n" +
                            "</td>\n" +
                            "</tr>";
                    }
                },
                error: function (error) {
                    console.error("Lỗi khi xóa sản phẩm:", error);
                }
            });
        }
    }
</script>
<script src="slider/owlcarousel/owl.carousel.min.js"></script>
</html>