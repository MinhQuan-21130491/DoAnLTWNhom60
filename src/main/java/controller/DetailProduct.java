package controller;
import model.Category;
import model.CategoryService;
import model.Product;
import model.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "detail-product", value = "/detail-product")
public class DetailProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String pid = request.getParameter("pid");
        Product product = ProductService.getInstance().getProductById(Integer.parseInt(pid));
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("DetailProduct.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}

