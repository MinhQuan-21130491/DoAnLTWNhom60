package controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet(name = "signOutAccount", value = "/signOutAccount")
public class SignOutAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hủy bỏ phiên đăng nhập (nếu sử dụng session)
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // Xóa cookie trên máy khách
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính
        response.sendRedirect("/SignInAccount.jsp");
    }
}
