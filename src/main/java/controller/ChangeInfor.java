package controller;

import dao.DAOAccount;
import model.Account;
import service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "changeInfor", value = "/changeInfor")
public class ChangeInfor {
    public ChangeInfor(){
        super();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("TenHT");
        String phoneNumber = request.getParameter("SDTHT");
        String email = request.getParameter("GmailHT");
        String gender = request.getParameter("gender");
        Date birthDay = Date.valueOf(request.getParameter("HienThiNS"));
        String address = request.getParameter("DCHT");
        String addressReceive = request.getParameter("DCNHHT");

        request.setAttribute("name", name);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("gender", gender);
        request.setAttribute("birthDay", birthDay);
        request.setAttribute("address", address);
        request.setAttribute("addressReceive", addressReceive);
        String mess = "";
        String url = "";
        String err = "";
        request.setAttribute("err", "Cập nhật không thành công!");
        if (err.length() > 0) {
            url = "/ChangeInfor.jsp";
        } else {
            Object object = request.getSession().getAttribute("account");
            Account account = null;
            if (object != null) {
                account = (Account) object;
                if (account != null) {
                    int id = account.getId();
                    Account acc = new Account(id, "", "", name, phoneNumber, email, gender, birthDay, address, addressReceive);
                    AccountService.updateInfor(acc);
                    Account acc1 = AccountService.selectById(acc);
                    request.getSession().setAttribute("account", acc1);
                    url = "/Homepage.jsp";
                }
            }
        }

        request.getRequestDispatcher(url).forward(request, response);
    }
}
