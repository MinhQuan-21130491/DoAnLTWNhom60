package controller;

import model.Account;
import model.VerifyAccount;
import service.AccountService;
import util.Email;
import util.NumberRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;

@WebServlet(name = "reVerifyCode", value = "/reVerifyCode")
public class ReVerify extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String email = request.getParameter("email");
        Account account = AccountService.getInstance().selectAccountByEmail(email);
        String code = NumberRandom.getSoNgauNhien();
        if(AccountService.updateVerifyCode(Integer.parseInt(code), account.getId()) > 0) {
            Email.sendEmail(account.getEmail(), "Xác thực tài khoản", "Mã xác thực tài khoản HomeDecor của bạn là: " + code);
            request.setAttribute("email", account.getEmail());
        }
        try {
            request.getRequestDispatcher("VerifyAccount.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
