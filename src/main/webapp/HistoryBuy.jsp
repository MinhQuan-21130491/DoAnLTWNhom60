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
    <jsp:include page="Header.jsp"></jsp:include>
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
    <jsp:include page="Footer.jsp"></jsp:include>
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