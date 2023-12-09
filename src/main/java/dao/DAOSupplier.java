package dao;

import model.Supplier;
import model.VerifyAccount;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOSupplier {
    public static int insertSupplier(Supplier supplier) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into suppliers(name, phoneNumber,email, idCate, address) values(?,?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, supplier.getNameSup());
            pr.setString(2, supplier.getPhoneNumber());
            pr.setString(3, supplier.getEmail());
            pr.setInt(4, supplier.getIdCate());
            pr.setString(5, supplier.getAddress());
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static ArrayList<Supplier> listAllSupplier() {
        ArrayList<Supplier> re = new ArrayList<>();
        Connection connect = JDBCUtil.getConnection();
        try {
            String sql = "select s.id, s.name, s.phoneNumber, s.email, s.idCate, s.address\n" +
                    "from suppliers s";
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idSup = resultSet.getInt("id");
                String nameSup = resultSet.getString("name");
                String phoneSup = resultSet.getString("phoneNumber");
                String emailSup = resultSet.getString("email");
                int idCate = resultSet.getInt("idCate");
                String addressSup = resultSet.getString("address");
                Supplier supplier = new Supplier(idSup, nameSup, phoneSup, emailSup, idCate, addressSup);
                re.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }
    public static int delSupplier(int idSupplier) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
            String sql = "delete  from suppliers where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idSupplier);
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {

        }
        return re;
    }

    public static void main(String[] args) {
        DAOSupplier sup = new DAOSupplier();
        ArrayList<Supplier> suplist = listAllSupplier();
        for (Supplier s : suplist) {
            System.out.println(s.getId());
        }
    }
}
