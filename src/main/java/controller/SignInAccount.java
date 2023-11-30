package controller;

import dao.DAOAccount;
import model.Account;
import service.AccountService;
import util.Encrypt;

import javax.servlet.RequestDispatcher;
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
            response.setContentType("text/html; charset=UTF-8");

            // Nhận thông tin từ yêu cầu đăng nhập
            String userName = request.getParameter("idFormInput");
            String password = request.getParameter("idFormPass");

            Account acc = new Account();
            acc.setUserName(userName);
            acc.setPassword(password);

            // Gọi phương thức checkLogin từ Service
            // phương thức này nếu thành công thì trả về account
            Account account = AccountService.checkLogin(acc);
            // Xử lý kết quả từ phương thức checkLogin
            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                response.sendRedirect("HomeCustomer.jsp");
            } else {
                request.setAttribute("err", "Tên đăng nhập hoặc mật khẩu chưa đúng!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("SignIn.jsp");
                dispatcher.forward(request, response);
            }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
