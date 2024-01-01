<%@ page import="model.InforWebsite" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                <%
                    InforWebsite contactInfo = (InforWebsite) session.getAttribute("contactInfo");
                    String address = contactInfo.getAddress();
                    String email = contactInfo.getEmail();
                    String phoneNumber = contactInfo.getPhoneNumber();
                %>
                <hr class ="w-50 ">
                <ul class="navbar-nav ">
                    <input type="hidden" name="id" value="<%= contactInfo.getId() %>">
                    <li class="nav-link"><i class="fa fa-map-marker" aria-hidden="true"></i> <%= address%></li>
                    <li class="nav-link" ><i class="fa fa-envelope" aria-hidden="true"></i> <%= email %></li>
                    <li class="nav-link" ><i class="fa fa-phone" aria-hidden="true"></i> <%= phoneNumber %></li>
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
</html>