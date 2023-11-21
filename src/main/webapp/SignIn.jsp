<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
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
    <link rel="stylesheet" href="css/SingIn.css">
    <link rel="stylesheet" href="css/Style.css">
</head>
<body>
<header class="hd">
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
<div class="mt-5 sigin">
    <form id="form-login" action="" onsubmit="return my_submit()">
        <div id="imgHinh">
            <img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/393391152_208027392306653_4287583286038172734_n.png?_nc_cat=106&ccb=1-7&_nc_sid=510075&_nc_ohc=j-cDDctPUZcAX_OYW5u&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdQtLWCPR3-OIOvJwAx_zky171bVj7SA3uUW7rnpGvMp_A&oe=65561255">
        </div>
        <div class="thongtin">
            <h5 class="heading">ĐĂNG NHẬP</h5>
            <div class="form-group-p">
                <div class="text-danger pb-2" id="inputError"></div>
                <input class="form-input" id="idFormInput" name="idFormInput" type="text" placeholder="Tên đăng nhập">
            </div>
            <div class="form-group-p">
                <input class="form-pass" id="idFormPass" name="idFormPass" type="password" placeholder="Mật khẩu">
            </div>
            <div class="form-group-p" id="idFPass">
                <p id="idMK"><a href="">Quên mật khẩu?</a></p>
            </div>
            <div>
                <button id="submitDangNhap">ĐĂNG NHẬP</button>
            </div>
            <div class="form-group-p" id="idDK">
                <p>Bạn chưa có tài khoản?<a href=""> Đăng ký</a></p>
            </div>
        </div>
    </form>
</div>
<script>
    function my_submit() {
        var flag = true;
        let inputElement = document.getElementById("idFormInput");
        let passElement = document.getElementById("idFormPass");
        let inputError = document.getElementById("inputError");
        inputError.textContent = "";
        if (inputElement.value === "" && passElement.value === "") {
            inputError.textContent = "Bạn chưa nhập tên đăng nhập hoặc mật khẩu!";
            flag = false;
        } else if (inputElement.value === "") {
            inputError.textContent = "Bạn chưa nhập tên đăng nhập!";
            flag = false;
        } else if (passElement.value === "") {
            inputError.textContent = "Bạn chưa nhập mật khẩu!";
            flag = false;
            //tạo ra sẵn 3 tài khoản cho admin, nhân viên, khách hàng để test chức năng đăng nhập cho từng phân quyền tài khoản
            /*admin -tài khoản: root
                    -mật khẩu: 1*/
            /*nhân viên -tài khoản: nhanvien1
                    -mật khẩu: 1*/
            /*khách hàng -tài khoản: khachhang1
                    -mật khẩu: 1*/
        } else if ((inputElement.value !== "root" || inputElement.value !== "nhanvien1" || inputElement.value !== "khachhang1") && passElement.value !== "1") {
            inputError.textContent = "Tài khoản hoặc mật khẩu chưa chính xác!";
            flag = false;
        }
        if (flag) {
            //giao diện của từng phân quyền
            var formLogin = document.getElementById("form-login");
            if (inputElement.value === "root" || inputElement.value === "nhanvien1") {
                formLogin.action = "homeAdmin.html"
            } else if (inputElement.value === "khachhang1") {
                formLogin.action = "homeCustomer.html"
            }
        }
        return flag;
    }
</script>
</body>
</html>