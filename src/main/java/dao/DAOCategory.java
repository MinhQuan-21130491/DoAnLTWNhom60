package dao;

import model.Category;
import model.Product;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;

public class DAOCategory {
    /*
   load danh sách danh mục sản phẩm
   @return ArrayList<Category>
    */
    // Hiển thị danh sách các danh mục trong giao diện người dùng
    public static ArrayList<Category> listCategory() {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select id, name from categories";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = new Category(id, name);
                list.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    // Lấy thông tin về một danh mục dựa trên id
    public static Category getCategoryById(int id) {
        Category category = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select id, name from categories where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idCate = resultSet.getInt("id");
                String name = resultSet.getString("name");
                category = new Category(id, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }
    //Thêm danh mục
    public static int insertCategory(Category c) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into categories(name) " +
                "values(?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, c.getName());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    //Xoá danh mục
    public static int delCategory(int id) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from categories where id=" + id);
                if (resultSet.next()) {
                    resultSet.getInt("id");
                    re = s.executeUpdate("delete from categories where id =" + id);
                }
                resetAutoIncrement("categories", connection);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    // Phương thức reset giá trị tự động tăng
    private static void resetAutoIncrement(String categories, Connection connection) throws SQLException {
        String resetQuery = "ALTER TABLE " + categories + " AUTO_INCREMENT = 1";
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(resetQuery);
        }
    }
    // Cập nhật danh mục
    public static int editCategory(int categoryId, String newName) throws SQLException {
        int result = 0;

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement prSelect = connection.prepareStatement("SELECT id FROM categories WHERE id = ?");
             PreparedStatement prUpdate = connection.prepareStatement("UPDATE categories SET name = ? WHERE id = ?")) {

            prSelect.setInt(1, categoryId);
            if (prSelect.executeQuery().next()) {
                prUpdate.setString(1, newName);
                prUpdate.setInt(2, categoryId);
                result = prUpdate.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException();
        }

        return result;
    }
    public static int updateCategory(Category c) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from categories where id=" + c.getId());
                if (resultSet.next()) {
                    int idC = resultSet.getInt("id");
                    re = s.executeUpdate("UPDATE categories SET " +
                            "name = '" + c.getName() +
                            " WHERE id = " + idC);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
}
