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
@WebServlet(name = "editPolicy", value = "/editPolicy")
public class EditPolicy extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParameter = request.getParameter("id");
            String guaranteeParameter = request.getParameter("monthGua");
            String exchangeParameter = request.getParameter("monthChange");
            if (idParameter != null && guaranteeParameter != null && exchangeParameter != null) {
                int id = Integer.parseInt(idParameter);
                int guarantee = Integer.parseInt(guaranteeParameter);
                int exchange = Integer.parseInt(exchangeParameter);
                InforWebsite updatedInfo = new InforWebsite(id, guarantee, exchange);
                int result = WebService.getInstance().updatePolicy(updatedInfo);
                if (result > 0) {
                    HttpSession session = request.getSession();
                    InforWebsite policyInfo = (InforWebsite) session.getAttribute("policyInfo");
                    policyInfo.setGuarantee(guarantee);
                    policyInfo.setExchange(exchange);
                    session.setAttribute("policyInfo", policyInfo);
                } else {
                    response.getWriter().println("Không thể cập thông tin!");
                }
            }
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Error processing form data", e);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageIntro");
        dispatcher.forward(request, response);
    }
}
