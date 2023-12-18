package controller;

import model.Category;
import model.Product;
import service.CategoryService;
import model.Supplier;
import service.ProductService;
import service.SupplierService;
import service.AccountService;
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
        ArrayList<Product> listAll = ProductService.getInstance().listAllProduct();
        request.setAttribute("listAllProduct", listAll);
        ArrayList<Supplier> suplist = SupplierService.getInstance().listAllSupplier();
        request.setAttribute("listAllSup", suplist);
        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
        request.setAttribute("listCategory", listCategory);
        ArrayList<Account> listAllAccount = AccountService.getInstance().listAllAccount();
        request.setAttribute("listAllAccount", listAllAccount);
        try {
            request.getRequestDispatcher("ManageAdmin.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}

