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
@WebServlet(name = "editContact", value = "/editContact")
public class EditContact extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            String idC = request.getParameter("id");
            String address = request.getParameter("editAddress");
            String email = request.getParameter("editEmail");
            String phoneNumber = request.getParameter("editPhoneNumber");
            if (idC != null && address != null && email != null && phoneNumber != null) {
                int id = Integer.parseInt(idC);
                InforWebsite updatedInfo = new InforWebsite(id, address, email, phoneNumber);

                int result = WebService.getInstance().updateContact(updatedInfo);
                if (result > 0) {
                    HttpSession session = request.getSession();
                    InforWebsite contactInfo = (InforWebsite) session.getAttribute("contactInfo");
                    contactInfo.setAddress(address);
                    contactInfo.setEmail(email);
                    contactInfo.setPhoneNumber(phoneNumber);
                    session.setAttribute("contactInfo", contactInfo);
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