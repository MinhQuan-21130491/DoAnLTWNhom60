package controller;

import model.Category;
import org.json.JSONObject;
import service.CategoryService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loadDetailCategory", value = "/loadDetailCategory")
public class loadDetailCategory extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Đoạn mã hiện tại để lấy chi tiết danh mục
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String categoryId = request.getParameter("categoryId");
            if (categoryId != null && !categoryId.isEmpty()) {
            Category c = CategoryService.getInstance().getCategoryById(Integer.parseInt(categoryId));
            if (c != null) {
                JSONObject jsonRes = new JSONObject();
                JSONObject categoryJSON = new JSONObject();
                categoryJSON.put("id", c.getId());
                categoryJSON.put("name", c.getName());
                jsonRes.put("category", categoryJSON);
                PrintWriter out = response.getWriter();
                response.getWriter().write(jsonRes.toString());
                return;
            }
        }
        // Trong trường hợp không tìm thấy danh mục hoặc có lỗi, trả về trạng thái không tìm thấy
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    }
}
