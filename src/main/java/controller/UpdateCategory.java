package controller;
import model.Category;
import org.json.JSONArray;
import org.json.JSONObject;
import service.CategoryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
@WebServlet(name = "addCategory", value = "/addCategory")
public class UpdateCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        String name = request.getParameter("nameCateAdd");
//        String idText = request.getParameter("id");
//        int id = Integer.parseInt(idText);
        Category category = new Category(name);
        String res = "Thêm danh mục thành công!";
        if (CategoryService.getInstance().insertCategory(category) > 0) {
            // Nếu cập nhật thành công
            res = "Cập nhật danh mục thành công!";
        } else {
            // Nếu có lỗi trong quá trình cập nhật
            res = "Đã xảy ra lỗi!";
        }
        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();

        for (Category c : listCategory) {
            JSONObject categoryJSON = new JSONObject();
            categoryJSON.put("id", c.getId());
            categoryJSON.put("name", c.getName());
            htmlDataArray.put(categoryJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
    }
