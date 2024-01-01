package controller;
import model.InforWebsite;
import service.WebService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "manageIntro", value = "/manageIntro")
public class ManageIntro extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            int id = 1;
            InforWebsite contactInfo  = WebService.getInstance().getContactInformation(id);
            HttpSession session = request.getSession();
            session.setAttribute("contactInfo", contactInfo);
            InforWebsite policyInfo = WebService.getInstance().getPolicyInformation(id);
            session.setAttribute("policyInfo", policyInfo);

            RequestDispatcher dispatcher = request.getRequestDispatcher("IntroWebsite.jsp");
            dispatcher.forward(request, response);

    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
}
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
