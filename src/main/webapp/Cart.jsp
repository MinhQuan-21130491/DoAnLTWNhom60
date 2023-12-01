<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
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
<body>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<div class="container mgt">
    <div class="row bgcolor">
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
                        <td>XÓA</td>
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
                            <input type="text" class="amount" value="1"/>
                            <button class="minus">-</button>
                            <button class="plus">+</button>
                        </td>
                        <td>
                            <button class="delete"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </td>
                    </tr>

                </tbody>
            </table>
            <div class="totalPay mt-4 text-end">
                <span id="tt">THÀNH TIỀN: </span> ₫<span id="total"></span>
            </div>
            <div class="pay my-2">
                <a href=#>
                    <button id="btnPay">Thanh toán</button>
                </a>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
</body>
<script>
    $(document).ready(function () {
        // Lặp qua từng cặp nút "plus" và "minus" để xử lý riêng lẻ cho từng sản phẩm
        $('.plus').click(function () {
            var amountInput = $(this).siblings('.amount');
            var count = parseInt(amountInput.val()) || 0;
            count++;
            amountInput.val(count);
            calculateTotal()
        });

        $('.minus').click(function () {
            var amountInput = $(this).siblings('.amount');
            var count = parseInt(amountInput.val()) || 0;
            if (count > 0) {
                count--;
                amountInput.val(count);
                calculateTotal()
            }
        });
        // Xóa sản phẩm trong giỏ hàng
        $('.delete').click(function () {
            $(this).closest('tr').remove();
            calculateTotal(); //Gọi lại hàm tính tổng khi xóa
        })

        //Tính tổng tiền khi load qua trang giỏ hàng
        function calculateTotal() {
            var totalMoney = 0;
            var money = 0;
            var amount = 0;
            $('tr').each(function () {
                var moneyText = $(this).find('td:eq(4) span').text();
                var amountText = $(this).find('.amount').val();
                moneyText = moneyText.replace(/\./g, "");
                var money = parseFloat(moneyText);
                var amount = parseFloat(amountText);
                if (!isNaN(money) && !isNaN(amount)) {
                    totalMoney += money * amount;
                }
            });
            totalMoney = totalMoney.toLocaleString('en-US');
            totalMoney = totalMoney.replace(/\,/g, ".")
            $('#total').text(totalMoney);
        }
        // Gọi hàm tính tổng tiền khi tải trang
        calculateTotal()
        //load header
        //    $('header').load('Header.jsp')

    });
</script>
</html>