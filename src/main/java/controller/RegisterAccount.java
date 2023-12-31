package controller;

import model.Account;
import model.VerifyAccount;
import service.AccountService;
import util.Email;
import util.Encrypt;
import util.NumberRandom;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@WebServlet(name = "registerAccount", value = "/registerAccount")
public class RegisterAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String passwordEncrypt = Encrypt.toSHA1(password);
        String rePassword = request.getParameter("rePassword");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String birthDay = request.getParameter("birthDay");
        String address = request.getParameter("address");
        String addressReceive = request.getParameter("addressRecei");
        String checkboxValue = request.getParameter("acp");
        String err = "";
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("name", name);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("gender", gender);
        request.setAttribute("birthDay", birthDay);
        request.setAttribute("address", address);
        request.setAttribute("addressReceive", addressReceive);
        Pattern patternUser = Pattern.compile("^[a-zA-Z0-9_]+$");
        Matcher matcherUser = patternUser.matcher(userName);
        if(userName.equals("")) {
            err = "Vui lòng nhập tên đăng nhập!";
            request.setAttribute("errUserName", err);
        }else if (!matcherUser.matches()) {
            err = "Tên đăng nhập không chứa kí tự đặc biệt!";
            request.setAttribute("errUserName", err);
        }
        Pattern patternPw = Pattern.compile("^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$");
        Matcher matcherPw = patternPw.matcher(password);
        if(password.equals("")) {
            err = "Vui lòng nhập mật khẩu!";
            request.setAttribute("errPassword", err);
        }else if(password.length() < 6){
            err = "Mật khẩu dài từ 6 đến 50 ký tự!";
            request.setAttribute("errPassword", err);
        }else if(!matcherPw.matches()) {
            err = "Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!";
            request.setAttribute("errPassword", err);
        }
        if(rePassword.equals("")) {
            err = "Vui lòng xác nhận lại mật khẩu!";
            request.setAttribute("errRePassword", err);
        }else if(!rePassword.equals(password)) {
            err = "Mật khẩu xác nhận không đúng!";
            request.setAttribute("errRePassword", err);
        }
        if(name.equals("")) {
            err = "Vui lòng nhập tên!";
            request.setAttribute("errName", err);
        }
        Pattern patternPhone = Pattern.compile("^\\d{10}$");
        Matcher matcherPhone = patternPhone.matcher(phoneNumber);
        if(phoneNumber.equals("")) {
            err = "Vui lòng nhập số điện thoại!";
            request.setAttribute("errPhoneNumber", err);
        }else if(!matcherPhone.matches()) {
            err = "Số điện thoại không hợp lệ!";
            request.setAttribute("errPhoneNumber", err);
        }
        Pattern patternEmail = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
        Matcher matcherEmail = patternEmail.matcher(email);
        if(email.equals("")) {
            err = "Vui lòng nhập Email!";
            request.setAttribute("errEmail", err);
        }else if(!matcherEmail.matches()) {
            err = "Email không hợp lệ!";
            request.setAttribute("errEmail", err);
        }
        if(birthDay.equals("")) {
            err = "Vui lòng nhập ngày sinh!";
            request.setAttribute("errBday", err);
        }
        if(address.equals("")) {
            err = "Vui lòng nhập địa chỉ!";
            request.setAttribute("errAddress", err);
        }
        if(addressReceive.equals("")) {
            err = "Vui lòng nhập địa chỉ nhận hàng!";
            request.setAttribute("errAddressReceive", err);
        }
        if (checkboxValue == null) {
            err = "Vui lòng chấp nhận điều khoản!";
            request.setAttribute("errAcp", err);
        }
        if(err.length() == 0) {
            if (AccountService.getInstance().checkExistUserName(userName)) {
                err = "Tên tài khoản đã tồn tại!";
                request.setAttribute("errUserName", err);
            } else if (AccountService.getInstance().checkExistEmail(email)) {
                err = "Email đã tồn tại!";
                request.setAttribute("errEmail", err);
            } else {
                Account account = new Account(name, userName, passwordEncrypt, email, phoneNumber, gender, Date.valueOf(birthDay), address, addressReceive);
                if (AccountService.getInstance().registerAccount(account) > 0) {
                    Account accountAferRegis = AccountService.getInstance().selectAccountByUserName(account.getUserName());
                    String verifyCodeString = NumberRandom.getSoNgauNhien();
                    int verifyCode = Integer.parseInt(verifyCodeString);
                    LocalDateTime timeCode = LocalDateTime.now();
                    VerifyAccount verifyAccount = new VerifyAccount(accountAferRegis.getId(), verifyCode, timeCode, false);
                    if (AccountService.getInstance().insertVerify(verifyAccount) > 0) {
                        Email.sendEmail(accountAferRegis.getEmail(), "Xác thực tài khoản", "Mã xác thực tài khoản HomeDecor của bạn là: " + verifyCode);
                        request.setAttribute("email", accountAferRegis.getEmail());
                    }
                }
            }
        }
        try {
            String url = "";
            if(err.length() == 0) {
                url = "VerifyAccount.jsp";
            }else {
                url = "SignUp.jsp";
            }
            request.getRequestDispatcher(url).forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

