package controller;

import model.Account;
import model.Invoice;
import model.Product;
import service.AccountService;
import service.InvoiceService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "manage", value = "/manage")
public class ManageController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        ArrayList<Product> listAllProduct = ProductService.getInstance().listAllProduct();
        request.setAttribute("listAllProduct", listAllProduct);
        ArrayList<Account> listAllAccount = AccountService.getInstance().listAllAccount();
        request.setAttribute("listAllAccount", listAllAccount);
        ArrayList<Invoice> listAllInvoice = InvoiceService.getInstance().listInvoice();
        request.setAttribute("listAllInvoice", listAllInvoice);
        try {
            request.getRequestDispatcher("ManageAdmin.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}

