package controller;
import model.Category;
import service.CategoryService;
import model.Product;
import service.ProductService;
import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "homePage", value = "/homePage")
public class HomeController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        //load 6 sản phẩm
        ArrayList<Product> listSixProduct = ProductService.getInstance().listSixProduct(0);
        request.setAttribute("listP", listSixProduct);
        //load danh mục
        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
        request.setAttribute("listCate", listCategory);
        //load product mới nhất
        Product latestProduct = ProductService.getInstance().latestProduct();
        request.setAttribute("latestP", latestProduct);
        request.setAttribute("hiddenLoadmore", "block");
        //load màu sản phẩm
        ArrayList<String> listColorP = ProductService.getInstance().listColorP();
        request.setAttribute("listColorP", listColorP);
        try {
            request.getRequestDispatcher("HomePage.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}
