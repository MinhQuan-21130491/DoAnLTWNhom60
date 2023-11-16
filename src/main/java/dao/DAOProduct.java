package dao;
import model.Image;
import model.Product;
import util.JDBCUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class DAOProduct {
    public static ArrayList<Product> listSixProduct(int offset) {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "select p.id,p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length " +
                    "from products as p " +
                    "limit 6 offset ? ";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1,offset);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                int priceImport = resultSet.getInt("priceImport");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,quantity);
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }
    public static Product getProductById(int id) {
        Product product = null;
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "select id, name, idCate, price, priceImport, quantity, color, material, description, height, width, length "+
                         "from products " +
                         "where id =?";
            PreparedStatement  pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                int priceImport = resultSet.getInt("priceImport");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,quantity);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
    public static ArrayList<Image> listImageOfProduct(Product p) {
        ArrayList<Image> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "Select urlImage " + "from images_product " + "where idProduct = ?";
            PreparedStatement  pr = connection.prepareStatement(sql);
            pr.setInt(1, p.getIdProduct());
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                String url = resultSet.getString("urlImage");
                Image img = new Image(url);
                re.add(img);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
}
