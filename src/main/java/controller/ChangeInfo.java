package controller;

import model.Account;
import model.VerifyAccount;
import service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "changeInfo", value = "/changeInfo")
public class ChangeInfo extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String name = request.getParameter("TenHT");
        String phoneNumber = request.getParameter("SDTHT");
        String email = request.getParameter("GmailHT");
        String gender = request.getParameter("gender");
        Date birthDay = Date.valueOf(request.getParameter("HienThiNS"));
        String address = request.getParameter("DCHT");
        String addressReceive = request.getParameter("DCNHHT");
        String res = "";

        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        Account account = (Account) obj;
        Account accountNew = new Account(account.getId(), name, email, phoneNumber, gender, birthDay, address, addressReceive);
        VerifyAccount vrf = AccountService.getInstance().getVrfOfAccount(account.getId());
        accountNew.setVerifyAccount(vrf);
        session.setAttribute("account", accountNew);
        if (AccountService.getInstance().updateInfor(accountNew) > 0) {
            res = "Cập nhật thành công!";
        }else {
            res ="Cập nhật thất bại!";
        }
        request.setAttribute("res", res);
        request.getRequestDispatcher("ChangeInfor.jsp").forward(request, response);
    }
}

