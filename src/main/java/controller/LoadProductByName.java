package controller;
import model.Category;
import service.CategoryService;
import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "loadProductByName", value = "/loadProductByName")
public class LoadProductByName extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String name = request.getParameter( "search");
        //load danh sách sản phẩm nếu sản phẩm đó có tên chứa chuỗi nhập vào thanh tìm kiếm
        ArrayList<Product> listProductByName = ProductService.getInstance().listProductByName(name);
        request.setAttribute("listP", listProductByName);
        //load danh mục
        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
        request.setAttribute("listCate", listCategory);
        //load product mới nhất
        Product latestProduct = ProductService.getInstance().latestProduct();
        request.setAttribute("latestP", latestProduct);
        request.setAttribute("hiddenLoadmore", "none");
        request.setAttribute("exits", "CÓ " + listProductByName.size() + " KẾT QUẢ TÌM KIẾM PHÙ HỢP");
        try {
            request.getRequestDispatcher("HomePage.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}

