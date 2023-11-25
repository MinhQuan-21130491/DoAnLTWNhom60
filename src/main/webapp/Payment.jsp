<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán</title>
</head>
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
<link rel="stylesheet" href="css/Cart.css">
<link rel="stylesheet" href="css/Payment.css">
<link rel="stylesheet" href="css/ChangeInfor.css">
<body>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<!--page content-->
<div class="container mgt">
    <div class="row p-2 bgcolor">
        <div class="col-lg-4 col-sm-4 my-1">
            <h5 class="text-color text-start"><i class="fa fa-user-circle-o text-color" aria-hidden="true"></i> THÔNG TIN KHÁCH HÀNG</h5>
            <div class="mt-3">
                <label for="fullName">Họ tên: <span id="fullName">Minh Quân</span></label>
            </div>
            <div class="mt-2">
                <label for="phoneNumber">Số điện thoại: <span id="phoneNumber">0811295775</span></label>
            </div>
            <div class="mt-2">
                <label for="email">Email:</label> <span id="email">qle29210@gmail.com</span>
            </div>
        </div>
        <div class="col-lg-6 col-sm-6 mt-1 ">
            <h5 class="text-color text-start"> <i class="fa fa-map-marker text-color" aria-hidden="true"></i> ĐỊA CHỈ NHẬN HÀNG</h5>
            <span class="mt-3 d-block" id="address">Trường Đại Học Khoa Học Tự Nhiên đường A2, Phường Linh Trung, Thành Phố Thủ Đức, TP. Hồ Chí Minh </span>
        </div>
        <div class="col-lg-2 col-sm-2 mt-1 text-end">
            <button class="btnAdd bgcolor bd-full" id ="editInFor" data-bs-toggle="modal"
                    data-bs-target="#changeInfor"><i class="fa fa-pencil text-color "
                    title="Chỉnh sửa thông tin liên hệ" aria-hidden="true"></i></button>
        </div>
        <div class="modal fade" id="changeInfor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content ">
                    <div class="modal-body">
                            <form id="changeNam" onsubmit="return check()">
                                <table>
                                    <thead>
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <tr>
                                        <td colspan ="4">
                                            <h5 class = "pt-3 pb-1"> THAY ĐỔI THÔNG TIN </h5>
                                            <div class="text-danger text-center w-100" id="error"></div>
                                        </td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td colspan="2">
                                            <label class="w-100">Tài khoản đã xác thực <i class="fa fa-check-circle text-success" aria-hidden="true"></i></label>
                                            <label class="w-100 d-none">Tài khoản của bạn chưa xác thực, <a href="#">xác thực ngay</a></label>
                                        </td>
                                    </tr>
                                    <tr id="changeName">
                                        <td >
                                            <label>Họ và tên</label>
                                        </td>
                                        <td class="w-50">
                                            <div id="InName">
                                                <input id="HienThiTen" name="TenHT" type="text">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="changeSDT">
                                        <td>
                                            <label> Số điện thoại </label>
                                        </td>
                                        <td>
                                            <div id="InSDT">
                                                <input id="HienThiSDT" name="SDTHT" type="text">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="changegGmail">
                                        <td>
                                            <label>Email</label>
                                        </td>
                                        <td>
                                            <div id="InGmail">
                                                <input id="HienThiGmail" name="GmailHT" type="text">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Giới tính</label>
                                        </td>
                                        <td >
                                            <div class = "gender">
                                                <label class="ms-0" for="male">Nam</label><input class="ms-2 me-3" type="radio" id="male" name="gender" value="Nam"  checked >
                                                <label for="female">Nữ</label> <input class="ms-2 me-3" type="radio" id="female" name="gender" value="Nữ" >
                                                <label for="other">Khác</label> <input class="ms-2 me-3" type="radio" id="other" name="gender" value="Khác">
                                            </div>
                                        </td>
                                    </tr>


                                    <tr id="changeNgaySinh">
                                        <td>
                                            <label>Ngày sinh</label>
                                        </td>
                                        <td>
                                            <div id="InNS">
                                                <input id="HienThiNS" name="HienThiNS" type="date">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="changeDC">
                                        <td>
                                            <label> Địa chỉ</label>
                                        </td>
                                        <td>
                                            <div id="InDiaChi">
                                                <input id="HienThiDC" name="DCHT" type="text">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="changeDCReceive">
                                        <td>
                                            <label> Địa chỉ nhận hàng</label>
                                        </td>
                                        <td>
                                            <div id="">
                                                <input id="HienThiDCReice" name="DCHT" type="text">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr id="SubmitSB">
                                        <td colspan="2">
                                            <div><button id="submit" name="SB" onclick="my_function()" style="color: white"> LƯU </button></div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row bgcolor mt-3 overflow-hidden">
        <div class="col-lg-12">
            <table class="mt-4">
                <thead>
                    <tr>
                        <td class="sp">SẢN PHẨM</td>
                        <td>MÀU SẮC</td>
                        <td>VẬT LIỆU</td>
                        <td>KÍCH THƯỚC</td>
                        <td>ĐƠN GIÁ</td>
                        <td>SỐ LƯỢNG</td>
                        <td>THÀNH TIỀN</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="item">
                                <div class="item_img">
                                    <img src="https://images.elipsport.vn/sources/2021/12/13/ghe-massage-elip-galile-1690879452.jpg"
                                         class="card-img-top img_p_cart" alt="..."/>
                                </div>
                                <span class="item_text">Ghế massage siêu cấp pro</span>
                            </div>
                        </td>
                        <td>
                            <span>Màu đen</span>
                        </td>
                        <td>
                            <span>Hợp kim, bọc da</span>
                        </td>
                        <td>
                            <span>100x50x70</span>
                        </td>
                        <td>
                            ₫<span>1.000.000</span>
                        </td>
                        <td>
                            <span>2</span>
                        </td>
                        <td>
                            ₫<span></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="item">
                                <div class="item_img">
                                    <img src="https://images.elipsport.vn/sources/2021/12/13/ghe-massage-elip-galile-1690879452.jpg"
                                         class="card-img-top img_p_cart" alt="..."/>
                                </div>
                                <span class="item_text">Ghế massage siêu cấp pro</span>
                            </div>
                        </td>
                        <td>
                            <span>Màu đen</span>
                        </td>
                        <td>
                            <span>Hợp kim, bọc da</span>
                        </td>
                        <td>
                            <span>100x50x70</span>
                        </td>
                        <td>
                            ₫<span>1.000.000</span>
                        </td>
                        <td>
                            <span>1</span>
                        </td>
                        <td>
                            ₫<span></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row bgcolor mt-3 p-2">
        <div class="col-lg-12 mt-1 bdm ">
            <h5>PHƯƠNG THỨC THANH TOÁN</h5>
        </div>
        <div class="col-lg-12 my-1">
            <div class="row">
                <div class="col-lg-8 col-sm-4 col-3"></div>
                <div class="col-lg-4 col-sm-8 col-9 mt-1 ps-5">
                    <input class="" type="radio" id="cash" name="pay" value="Tiền mặt"><label for="cash">Tiền mặt <i
                        class="fa fa-money" aria-hidden="true"></i> </label>
                    <input class="ms-3" type="radio" id="bank" name="pay" value="Thẻ tín dụng"><label for="bank">Thẻ tín
                    dụng <i class="fa fa-cc-visa" aria-hidden="true"></i></label>
                    <div class=" mt-3">
                        <p class="mb-3 color-gray">Tổng tiền hàng:
                            <span class="float-end">
                            <span> ₫</span>
                            <span id="totalMoney"></span>
                        </span>
                        </p>
                        <p class="mb-3 color-gray">Tiền vận chuyển:
                            <span class="float-end" id="moneyShip">₫0</span></p>
                        <p class="mb-3 color-gray">Tổng thanh toán:
                            <span class="float-end">
                            <span class="price "> ₫</span>
                            <span class="price" id="totalPay"></span>
                        </span>
                        </p>
                    </div>
                    <div class="pay text-end mt-2">
                        <a href=#>
                            <button id="btnPay">Đặt hàng</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end page content-->
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
<script>
        function updateTotalMoney() {
            $('tr').each(function () {
                var amountText = $(this).find('td:eq(5) span').text();
                var priceText = $(this).find('td:eq(4) span').text();
                priceText = priceText.replace(/\./g, "");
                var amount = parseInt(amountText);
                var price = parseInt(priceText);
                var total = amount * price;
                total = total.toLocaleString('en-US');
                total = total.replace(/\,/g, ".")
                $(this).find('td:eq(6) span').text(total);
            })
        }

        updateTotalMoney(); //gọi hàm tính thành tiền sau khi load web
        function totalMoneyPay() {
            var total = 0;
            $('tr').each(function () {
                var moneyText = $(this).find('td:eq(6) span').text();
                moneyText = moneyText.replace(/\./g, "");
                var money = parseInt(moneyText);
                if (!isNaN(money)) {
                    total += money;
                }
            })
            total = total.toLocaleString('en-US');
            total = total.replace(/\,/g, ".")
            $('#totalMoney').text(total);
            $('#totalPay').text(total);
        }
        totalMoneyPay()
        //load header
       // $('header').load('Header.jsp')
        //load footer
        //$('footer').load('Footer.jsp')
</script>
</body>

</html>