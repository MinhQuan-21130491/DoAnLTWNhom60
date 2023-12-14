package dao;
import model.Image;
import model.Product;
import util.JDBCUtil;

import java.sql.*;
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
                    "from products as p where p.status =? " +
                    "limit 6 offset ? ";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1,1);
            pr.setInt(2,offset);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                double priceImport = resultSet.getDouble("priceImport");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,1,quantity);
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
            String sql = "select id, name, idCate, price, priceImport, quantity, color, material, description, height, width, length, status "+
                         "from products " +
                         "where id =?";
            PreparedStatement  pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                double priceImport = resultSet.getDouble("priceImport");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                boolean status = resultSet.getBoolean("status");
                product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,1, quantity, status);
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
                "where p.idCate =? and p.status =? " +
                "limit 6 offset ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            pr.setInt(2, 1);
            pr.setInt(3, offset);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                double priceImport = resultSet.getDouble("priceImport");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,1,quantity);
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
                double priceImport = resultSet.getDouble("priceImport");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double length = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(idProduct, idCate, name, priceImport, price, description, color, material, width, height, length,1, quantity);
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
            double priceImport = resultSet.getDouble("priceImport");
            double price = resultSet.getDouble("price");
            String description = resultSet.getString("description");
            String color = resultSet.getString("color");
            String material = resultSet.getString("material");
            double width = resultSet.getDouble("width");
            double height = resultSet.getDouble("height");
            double length = resultSet.getDouble("length");
            int quantity = resultSet.getInt("quantity");
            product = new Product(idProduct, idCate, name, priceImport, price, description, color, material, width, height, length, 1, quantity);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
        return product;
    }
    /*Lấy ra danh sách màu của sản phẩm
    @return ArrayList<String>
    */
    public static ArrayList<String> listColorP() {
        ArrayList<String> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select distinct(color) from products ";
        try {
        PreparedStatement pr = connection.prepareStatement(sql);
        ResultSet resultSet = pr.executeQuery();
        String color = null;
        while (resultSet.next()) {
             color = resultSet.getString("color");
             list.add(color);
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
        return list;
    }
    public static ArrayList<Product> listProductByFil(String command, double priceFil, String colorFil, String materialFil, int id) {
        ArrayList<Product> list = new ArrayList<>();
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement pr = createPreparedStatement(connection,command, priceFil, colorFil, materialFil, id);
             ResultSet resultSet = pr.executeQuery()) {
            while (resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                double priceImport = resultSet.getDouble("priceImport");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght, 1,quantity);
                list.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    private static PreparedStatement createPreparedStatement(Connection connection,String command, double priceFil, String colorFil, String materialFil, int idCate) throws SQLException {
        String sql ="";
        if(idCate == 0) {
           sql = "SELECT p.id, p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length " +
                    "FROM products AS p " +
                    "WHERE p.status = 1 and ";
        }else {
            sql = "SELECT p.id, p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length " +
                    "FROM ( SELECT id, idCate, name, price, priceImport, quantity, color, material, description, height, width, length  from products where idCate =" + idCate +" ) as p " +
                    "WHERE p.status = 1 and";
        }
        if (priceFil != 0) {
            if(command.equalsIgnoreCase("D")) {
                sql += "p.price < ? ";
            }else if(command.equalsIgnoreCase("T")) {
                sql += "p.price >= ? ";
            }
        }
        if (!colorFil.isEmpty()) {
            if (priceFil != 0) {
                sql += "AND ";
            }
            sql += "p.color = ? ";
        }
        if (!materialFil.isEmpty()) {
            if (priceFil != 0 || !colorFil.isEmpty()) {
                sql += "AND ";
            }
            sql += " p.material COLLATE utf8mb4_general_ci LIKE ? "; // Sử dụng LIKE và thêm dấu ?
        }
        PreparedStatement pr = connection.prepareStatement(sql);
        int parameterIndex = 1;
        if (priceFil != 0) {
            pr.setDouble(parameterIndex++, priceFil);
        }
        if (!colorFil.isEmpty()) {
            pr.setString(parameterIndex++, colorFil);
        }
        if (!materialFil.isEmpty()) {
            pr.setString(parameterIndex, "%" + materialFil + "%"); // Thêm dấu % vào giữa chuỗi tìm kiếm
        }
        return pr;
    }
    public static int insertProduct(Product p) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into products(name, idCate, price, priceImport, quantity, color, material, description, height, width, length) " +
                     "values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, p.getName());
            pr.setInt(2, p.getIdCate());
            pr.setDouble(3, p.getPrice());
            pr.setDouble(4, p.getPriceImport());
            pr.setInt(5, p.getQuantityAvailable());
            pr.setString(6, p.getColor());
            pr.setString(7, p.getMaterial());
            pr.setString(8, p.getDescription());
            pr.setDouble(9, p.getHeight());
            pr.setDouble(10, p.getWidth());
            pr.setDouble(11, p.getLength());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static int insertImageProduct(int id, String url) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into images_product(idProduct, urlImage) " +
                     "values(?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1,id);
            pr.setString(2,url);
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static ArrayList<Product> listAllProduct() {
        ArrayList<Product> re = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql = "select p.id,p.idCate, p.name, p.price, p.priceImport, p.quantity, p.color, p.material, p.description, p.height, p.width, p.length, p.status " +
                    "from products as p ";
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                int idCate = resultSet.getInt("idCate");
                String name = resultSet.getString("name");
                double priceImport = resultSet.getDouble("priceImport");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String color = resultSet.getString("color");
                String material = resultSet.getString("material");
                double width = resultSet.getDouble("width");
                double height = resultSet.getDouble("height");
                double lenght = resultSet.getDouble("length");
                int quantity = resultSet.getInt("quantity");
                boolean status = resultSet.getBoolean("status");
                Product product = new Product(idProduct, idCate, name, priceImport, price,description,color,material,width,height,lenght,1,quantity, status);
                re.add(product);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }
    public static int delProduct(int id) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from products where id=" + id);
                if (resultSet.next()) {
                    int idP = resultSet.getInt("id");
                       s.executeUpdate("delete from images_product where idProduct =" + id);
                        re = s.executeUpdate("delete from products where id =" + id);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static int updateStatusProduct(int id, boolean status) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
            synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from products where id=" + id);
                if (resultSet.next()) {
                    s.executeUpdate("update products set status ="+status +" where id =" + id);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static int updateProduct(Product p) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from products where id=" + p.getIdProduct());
                if (resultSet.next()) {
                    int idP = resultSet.getInt("id");
                    re = s.executeUpdate("UPDATE products SET " +
                            "name = '" + p.getName() + "', " +
                            "priceImport = " + p.getPriceImport() + ", " +
                            "price = " + p.getPrice() + ", " +
                            "description = '" + p.getDescription() + "', " +
                            "color = '" + p.getColor() + "', " +
                            "material = '" + p.getMaterial() + "', " +
                            "width = " + p.getWidth() + ", " +
                            "height = " + p.getHeight() + ", " +
                            "length = " + p.getLength() + ", " +
                            "quantity = " + p.getQuantityAvailable() +
                            " WHERE id = " + idP);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static int delImgOfProduct(int id, String urlImage) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from images_product where idProduct=" + id);
                if (resultSet.next()) {
                   re = s.executeUpdate("DELETE FROM images_product WHERE urlImage = '" + urlImage + "'");

                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static ArrayList<Image> getImgsByIdP(int idP) {
        ArrayList<Image> imgs = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql ="select id, idProduct, urlImage from images_product where idProduct =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idP);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idProduct = resultSet.getInt("idProduct");
                String urlImage = resultSet.getString("urlImage");
                Image image = new Image(id, idProduct, urlImage);
                imgs.add(image);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return imgs;
    }
    public static void main(String[] args) throws SQLException {
   System.out.println(delProduct(52));
   System.out.println(delProduct(52));
    }
 }
