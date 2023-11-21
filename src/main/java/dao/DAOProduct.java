package dao;
import model.Image;
import model.Product;
import util.JDBCUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class DAOProduct {
    /*
   load 6 sản phẩm, có tham số offset là vị trí sản phẩm bắt đầu load
   @param offset
   @return ArrayList<Product>
    */
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
    /*
   lấy ra sản phẩm theo id sản phẩm
   @param id
   @return Product
    */
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
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }
    /*
   lấy ra danh sách hình ảnh của sản phẩm đó
   @param product
   @return ArrayList<Image>
    */
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
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    /*
    load sản phẩm theo mã danh mục
    @param id, offset
    @return ArrayList<Product>
    */
    public static ArrayList<Product> listProductByIdCate(int id, int offset) {
        ArrayList<Product> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select p.id, p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length " +
                "from products as p " +
                "where p.idCate =? " +
                "limit 6 offset ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            pr.setInt(2, offset);
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
                Product product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,quantity);
                list.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    /*
    load danh sách sản phẩm nếu sản phẩm đó có tên chứa chuỗi nhập vào thanh tìm kiếm
    @param nameProduct
    @return ArrayList<Product>
    */
    public static ArrayList<Product> listProductByName(String nameProduct) {
        ArrayList<Product> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        // Tách từng từ trong chuỗi tìm kiếm
        String[] tuKhoa = nameProduct.split("\\s+");
        // Xây dựng câu truy vấn SQL động dựa trên số lượng từ khóa
        StringBuilder sqlBuilder = new StringBuilder("SELECT p.id, p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length FROM products AS p WHERE");
        for (int i = 0; i < tuKhoa.length; i++) {
            sqlBuilder.append(" p.name COLLATE utf8mb4_general_ci LIKE ?");
            if (i < tuKhoa.length - 1) {
                sqlBuilder.append(" AND");
            }
        }
        try {
            PreparedStatement pr = connection.prepareStatement(sqlBuilder.toString());
            // Thiết lập tham số cho mỗi từ khóa
            for (int i = 0; i < tuKhoa.length; i++) {
                pr.setString(i + 1, "%" + tuKhoa[i] + "%");
            }
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
                double length = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(idProduct, idCate, name, priceImport, price, description, color, material, width, height, length, quantity);
                list.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    /*Lấy ra sản phẩm mới nhất dựa vào id lớn nhất của sản phẩm
    @return Product
    */
    public static Product latestProduct() {
        Product product = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select p.id,p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length " +
                "from products as p " +
                "where p.id = (select Max(id)" +
                "              from products) ";
        try {
        PreparedStatement pr = connection.prepareStatement(sql);
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
            double length = resultSet.getDouble("length");
            int quantity = resultSet.getInt("quantity");
            product = new Product(idProduct, idCate, name, priceImport, price, description, color, material, width, height, length, quantity);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
        return product;
    }



    public static void main(String[] args) {
        System.out.println(latestProduct());
    }
 }