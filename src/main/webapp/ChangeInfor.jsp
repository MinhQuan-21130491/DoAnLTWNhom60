<%@ page import="java.util.Date" %>
<%@ page import="java.io.Serializable" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thay Đổi Thông Tin</title>
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
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/ChangeInfor.css">
</head>
<body>
<header class = "hd">
    <div class="container-fluid bgcolor-orange">
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-9 col-8 col-4 d-flex align-items-center  ">
                    <a class="nav-link" href="#"> <img style="width: 150px" src="image/logoWeb.png">
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-4 py-3 px-0 d-flex align-items-center justify-content-end">
                    <ul class="d-flex m-0 list-unstyled justify-content-end">
                        <li class="px-3 pt-1"><a class="nav-link active" aria-current="page" href="#"><i
                                class="fa fa-phone" aria-hidden="true"></i></a></li>
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
</header>
<div class="changeInF">
    <%
        String name = (String) request.getAttribute("name");
        String phoneNumber = (String) request.getAttribute("phoneNumber");
        String email = (String) request.getAttribute("email");
        String gender = (String) request.getAttribute("gender");
        Serializable birthDay = (Date) request.getAttribute("birthDay");
        String address = (String) request.getAttribute("address");
        String addressReceive =(String) request.getAttribute("addressReceive");
        name = (name == null)? "": name;
        phoneNumber = (phoneNumber == null)? "": phoneNumber;
        email = (email == null)? "": email;
        gender = (gender == null)? "": gender;
        birthDay = (birthDay == null)? "": birthDay;
        address = (address == null)? "": address;
        addressReceive = (addressReceive == null)? "": addressReceive;
        String err = (String) request.getAttribute("err");
        err = (err == null)? "": err;
    %>
    <form id="changeNam" onsubmit="return check()" action="changeInfor" method="post">
        <table>
            <thead>
            <tr>
                <td colspan ="4">
                    <h5 class = "pt-3 pb-1"> THAY ĐỔI THÔNG TIN </h5>
                    <div class="text-danger text-center w-100" id="error"><%=err%></div>
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
                        <input id="HienThiTen" name="TenHT" type="text" value="<%=name%>">
                    </div>
                </td>
            </tr>
            <tr id="changeSDT">
                <td>
                    <label> Số điện thoại </label>
                </td>
                <td>
                    <div id="InSDT">
                        <input id="HienThiSDT" name="SDTHT" type="text" value="<%=phoneNumber%>">
                    </div>
                </td>
            </tr>
            <tr id="changegGmail">
                <td>
                    <label>Email</label>
                </td>
                <td>
                    <div id="InGmail">
                        <input id="HienThiGmail" name="GmailHT" type="text" value="<%=email%>">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Giới tính</label>
                </td>
                <td >
                    <div class = "gender">
                        <label class="ms-0" for="male">Nam</label><input type="radio" id="male" name="gender" value="Nam"  checked >
                        <label for="female">Nữ</label> <input type="radio" id="female" name="gender" value="Nữ" >
                        <label for="other">Khác</label> <input type="radio" id="other" name="gender" value="Khác">
                    </div>
                </td>
            </tr>


            <tr id="changeNgaySinh">
                <td>
                    <label>Ngày sinh</label>
                </td>
                <td>
                    <div id="InNS">
                        <input id="HienThiNS" name="HienThiNS" type="date" value="<%=birthDay%>">
                    </div>
                </td>
            </tr>
            <tr id="changeDC">
                <td>
                    <label> Địa chỉ</label>
                </td>
                <td>
                    <div id="InDiaChi">
                        <input id="HienThiDC" name="DCHT" type="text" value="<%=address%>">
                    </div>
                </td>
            </tr>
            <tr id="changeDCReceive">
                <td>
                    <label> Địa chỉ nhận hàng</label>
                </td>
                <td>
                    <div id="">
                        <input id="HienThiDCReice" name="DCNHHT" type="text" value="<%=addressReceive%>">
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
<script>

    function check() {
        var flag = true;
        var tenElement = document.getElementById("HienThiTen");
        var gmailElement = document.getElementById("HienThiGmail");
        var sdtElement = document.getElementById("HienThiSDT");
        var dcElement = document.getElementById("HienThiDC");
        var nsElement = document.getElementById("HienThiNS");
        var error = document.getElementById("error");

        var gmailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var phoneReg = /^\d{10}/;
        if(tenElement.value == "") {
            error.innerHTML = "(*)Vui lòng nhập họ và tên!";
            flag = false;
        }else if(gmailElement.value == "") {
            error.innerHTML = "(*)Vui lòng nhập Email!";
            flag = false;
        }else if(!gmailElement.value.match(gmailReg)) {
            error.innerHTML = "(*)Email không hợp lệ!";
            flag = false;
        }else if(sdtElement.value == "") {
            error.innerHTML = "(*)Vui lòng nhập số điện thoại!";
            flag = false;
        }else if(!sdtElement.value.match(phoneReg)) {
            error.innerHTML = "(*)Số điện thoại không hợp lệ!";
            flag = false;
        }
        else if(dcElement.value == "") {
            error.innerHTML = "(*)Vui lòng nhập địa chỉ!";
            flag = false;
        }else if(nsElement.value == "") {
            error.innerHTML = "(*)Vui lòng chọn ngày sinh!";
            flag = false;
        }
        return flag;
    }
</script>
</body>
</html>