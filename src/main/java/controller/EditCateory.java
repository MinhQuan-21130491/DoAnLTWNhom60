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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "editCategory", value = "/editCategory")
public class EditCateory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String idText = request.getParameter("idCategory");
        int idCategory = Integer.parseInt(idText);
        String name = request.getParameter("nameCategoryEdit");
        String res = "";
        Category updatedCategory = new Category(idCategory, name);
        try {
            if (CategoryService.getInstance().updateCategory(updatedCategory) > 0) {
                res = "Chỉnh sửa danh mục thành công!";
            }else {
                res ="Đã xảy ra lỗi!";
            }
        } catch (SQLException e) {
            res = "Đã xảy ra lỗi khi cập nhật danh mục!";
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
        // Thêm thông tin về tên danh mục đã chỉnh sửa vào JSON response
        jsonResponse.put("editedCategoryName", updatedCategory.getName());

        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
