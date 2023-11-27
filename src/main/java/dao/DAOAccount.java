package dao;

import model.Account;
import model.VerifyAccount;
import util.JDBCUtil;
import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class DAOAccount {
    public static boolean checkExistUserName(String userName) {
        boolean re = false;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select userName from accounts where userName =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, userName);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                re = true;
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static boolean checkExistEmail(String email) {
        boolean re = false;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select email from accounts where email =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, email);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                re = true;
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static int registerAccount(Account a) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into accounts(name, userName, password, gender, phoneNumber, birthDay, address,addressReceive, email) values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, a.getName());
            pr.setString(2, a.getUserName());
            pr.setString(3, a.getPassword());
            pr.setString(4, a.getGender());
            pr.setString(5, a.getPhoneNumber());
            pr.setDate(6, a.getBirthDay());
            pr.setString(7, a.getAddress());
            pr.setString(8, a.getAddressReceive());
            pr.setString(9, a.getEmail());
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static int insertVerify(VerifyAccount v) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into verify_account(idAccount, verifyCode,timeCode, stateVerify) values(?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, v.getIdAccount());
            pr.setInt(2, v.getVerifyCode());
            pr.setObject(3, v.getTimeCode());
            pr.setBoolean(4, v.isStateVerify());
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static int updateStateVerify(VerifyAccount v) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "update verify_account set stateVerify =? where idAccount =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setBoolean(1, v.isStateVerify());
            pr.setInt(2, v.getIdAccount());
            pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println("update thanh cong");

        return re;
    }

    public static Account selectAccountByUserName(String userName) {
        Account account = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select a.id, a.name, a.userName, a.password, a.gender, a.phoneNumber, a.birthDay, a.address, a.addressReceive, a.email " +
                "from accounts as a " +
                "where a.userName =? ";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, userName);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String user = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String gender = resultSet.getString("gender");
                String phoneNumber = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                Date birthDay = resultSet.getDate("birthDay");
                String address = resultSet.getString("address");
                String addressReceive = resultSet.getString("addressReceive");
                account = new Account(id, name, user, password, email, phoneNumber, gender, birthDay, address, addressReceive);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return account;
    }

    public static Account selectAccountByEmail(String emailAccount) {
        Account account = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select a.id,a.name, a.userName, a.password, a.gender, a.phoneNumber, a.birthDay, a.address, a.addressReceive, a.email " +
                "from accounts as a " +
                "where a.email =? ";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, emailAccount);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String user = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String gender = resultSet.getString("gender");
                String phoneNumber = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                Date birthDay = resultSet.getDate("birthDay");
                String address = resultSet.getString("address");
                String addressReceive = resultSet.getString("addressReceive");
                account = new Account(id, name, user, password, email, phoneNumber, gender, birthDay, address, addressReceive);
            }
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return account;
    }

    public static VerifyAccount selectVerifyAccountByIdAccount(int idAccount) {
        VerifyAccount verifyAccount = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select idAccount, verifyCode, timeCode, stateVerify " +
                     "from verify_account " +
                     "where idAccount = ?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idAccount);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("idAccount");
                int verifyCode = resultSet.getInt("verifyCode");
                LocalDateTime timeCode = resultSet.getObject("timeCode", LocalDateTime.class);
                boolean stateVerify = resultSet.getBoolean("stateVerify");
                verifyAccount = new VerifyAccount(id, verifyCode, timeCode, stateVerify);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return verifyAccount;
    }
    public static int updateVerifyCode(int newCode, int idAccount) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql ="update verify_account set verifyCode =? where idAccount =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, newCode);
            pr.setInt(2, idAccount);
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static int updatePassword( String passEnCrypt, int idAccount) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql ="update accounts set password =? where idAccount =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, passEnCrypt);
            pr.setInt(2, idAccount);
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static void main(String[] args) {
    System.out.println(selectVerifyAccountByIdAccount(14));
    }


}
