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
@WebServlet(name = "changePassword", value = "/changePassword")
public class ChangePassword extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String password = req.getParameter("password");
        String newpassword = req.getParameter("new_password");
        String repassword = req.getParameter("re_password");
        String passEncrypt = Encrypt.toSHA1(password);
        String repassEncrypt = Encrypt.toSHA1(repassword);
        String err = "";
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
//        String username = "sangcs321";
//        Account account = AccountService.getInstance().selectAccountByUserName(username);

        if(account==null){
            err="Bạn chưa đăng nhập";
            req.setAttribute("errPass",err);
        }
        if(passEncrypt.equals(account.getPassword())){
            AccountService.updatePassword(repassEncrypt,account.getId());
            session.setAttribute("password",newpassword);
        }else{
            err="Mật khẩu hiện tại không chính xác!";
            req.setAttribute("errPass",err);
        }
        try {
            String url = "";
            if(err.length() == 0) {
                url = "SignIn.jsp";
            }else {
                url = "ChangePW.jsp";
            }
            req.getRequestDispatcher(url).forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
