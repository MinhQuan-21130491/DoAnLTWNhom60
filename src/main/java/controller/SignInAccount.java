package controller;

import dao.DAOAccount;
import model.Account;
import service.AccountService;
import util.Encrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "signInAccount", value = "/signInAccount")
public class SignInAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");

        // Nhận thông tin từ yêu cầu đăng nhập
        String userName = request.getParameter("idFormInput");
        String password = request.getParameter("idFormPass");

        Account account = new Account();
        account.setUserName(userName);
        account.setPassword(password);

        // Gọi phương thức checkLogin từ Service
        Account acc = AccountService.checkLogin(account);

        // Xử lý kết quả từ phương thức checkLogin
        if (acc != null) {
            HttpSession session = request.getSession();
            session.setAttribute("acc", acc);
            // Chuyển hướng đến trang chính nếu đăng nhập thành công
            response.sendRedirect("HomeCustomer.jsp");
        } else {
            // Xử lý nếu đăng nhập không thành công
            request.setAttribute("err", "Tên đăng nhập hoặc mật khẩu chưa đúng");
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
