package controller;

import javax.servlet.http.*;

import model.Account;

import service.AccountService;
import util.Email;
import util.Encrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.security.SecureRandom;

@WebServlet(name = "forgetPassword", value = "/forgetPassword")
public class ForgetPassword extends HttpServlet {
    final static String lowerCase = "abcdefghijklmnopqrstuvwxyz";
    final static String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    final static String number = "0123456789";
    final static String special = "!@#$&$%*+,-./:;()<=>[]^_`{}|~";
    public static String generateRandomString() {
        SecureRandom random = new SecureRandom();
        StringBuilder randomString= new StringBuilder();
        randomString.append(lowerCase.charAt(random.nextInt(lowerCase.length())));

        // Thêm ít nhất một chữ hoa
        randomString.append(upperCase.charAt(random.nextInt(upperCase.length())));

        // Thêm ít nhất một số
        randomString.append(number.charAt(random.nextInt(number.length())));

        // Thêm ít nhất một ký tự đặt biệt
        randomString.append(special.charAt(random.nextInt(special.length())));

        // Thêm các ký tự còn lại
        int length = 6 + random.nextInt(15); // Chiều dài ngẫu nhiên từ 6 đến 20
        for (int i = 4; i < length; i++) {
            String allChars = lowerCase + upperCase + number + special;
            randomString.append(allChars.charAt(random.nextInt(allChars.length())));
        }
        return randomString.toString();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
//        resp.setContentType("html/text; charset= UTF-8");
        String username = req.getParameter("user_name");
        String email = req.getParameter("email");
        req.setAttribute("user_name", username);
        req.setAttribute("email", email);
        String err = "";

        if (!AccountService.getInstance().checkExistUserName(username)) {
            err = "Tên tài khoản không tồn tại!";
            req.setAttribute("errUserName", err);
        } else if (!AccountService.getInstance().checkExistEmail(email)) {
            err = "Email không tồn tại!";
            req.setAttribute("errEmail", err);
        }else{
            Account account = AccountService.getInstance().selectAccountByUserName(username);
            String newpassword = generateRandomString();
            String pwEncrypt = Encrypt.toSHA1(newpassword);
            if(AccountService.updatePassword(pwEncrypt,account.getId())>0){
                Email.sendEmail(account.getEmail(),"Mật khẩu mới của bạn","Thông tin đăng nhập HomeDecor:\n"+"-Tên đăng nhập: "+username+"\n"+"-Mật khẩu mới: "+newpassword);

            };
        }
        try {
            String url = "";
            if(err.length() == 0) {
                url = "ForgetPW.jsp";
            }else {
                url = "SignIn.jsp";
            }
            req.getRequestDispatcher(url).forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    public static void main(String[] args) {

    }

}
