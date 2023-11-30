package controller;

import model.Account;
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
    public ChangeInfo(){
        super();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Object object = session.getAttribute("account");
        String err = "";
        if (object != null && object instanceof Account) {
            // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("SignIn.jsp");
            return;
        }
        Account account = (Account) object;
        try {
            String name = request.getParameter("TenHT");
            String phoneNumber = request.getParameter("SDTHT");
            String email = request.getParameter("GmailHT");
            String gender = request.getParameter("gender");
            Date birthDay = Date.valueOf(request.getParameter("HienThiNS"));
            String address = request.getParameter("DCHT");
            String addressReceive = request.getParameter("DCNHHT");

            // Lấy ra ID để xác định tài khoản cần cập nhật
            int id = account.getId();
            // Tạo đối tượng Account mới với thông tin mới
            Account acc = new Account(id, "", "", name, phoneNumber, email, gender, birthDay, address, addressReceive);
            //Trả về số dòng thay đổi
            int re = AccountService.updateInfor(acc);
            if(re > 0){ // tức là có thông tin thay đổi
                // Lấy lại thông tin tài khoản đã cập nhật
                Account UpdateAccount = AccountService.selectById(acc);
                // Cập nhật session với thông tin mới
                request.getSession().setAttribute("account", UpdateAccount);
                // Chuyển hướng đến trang chính của khách hàng
               // request.setAttribute("err", "Cập nhật thành công!");
                request.getRequestDispatcher("HomeCustomer.jsp").forward(request, response);
            }else{
                // cập nhật không thành công
                request.setAttribute("err", "Cập nhật không thành công!");
                request.getRequestDispatcher("ChangeInfo.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
        }

