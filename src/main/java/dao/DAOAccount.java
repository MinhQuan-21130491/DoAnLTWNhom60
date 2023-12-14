package dao;

import model.Account;
import model.VerifyAccount;
import util.Encrypt;
import util.JDBCUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

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
    public static Account selectById(int idA) {
        Account re = null;
        try{
            // Tạo kết nối đến database
            Connection connection = JDBCUtil.getConnection();
            // Tạo đối tượng statement
            String sql = "select a.id,a.name, a.userName, a.password, a.gender, a.phoneNumber, a.birthDay, a.address, a.addressReceive, a.email, a.role, a.status " +
                    "from accounts as a " +
                    "where a.id =? ";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idA);
            // Thực thi câu lệnh sql
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String userName = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String gender = resultSet.getString("gender");
                String phoneNumber = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                Date birthDay = resultSet.getDate("birthDay");
                String address = resultSet.getString("address");
                String addressReceive = resultSet.getString("addressReceive");
                int role = resultSet.getInt("role");
                boolean status = resultSet.getBoolean("status");
                re = new Account(id, name,userName, password, email, phoneNumber, gender, birthDay, address, addressReceive, role, status);}
            JDBCUtil.closeConnection(connection);
        } catch (Exception e) {
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
    // Thay đổi thông tin khách hàng
    public static int updateInfor(Account account) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "UPDATE accounts " +
                "SET name=?, phoneNumber=?, email=?, gender=?, birthDay=?, address=?, addressReceive=? " +
                "WHERE id=?";
        try (PreparedStatement pr = connection.prepareStatement(sql)) {
            pr.setString(1, account.getName());
            pr.setString(2, account.getPhoneNumber());
            pr.setString(3, account.getEmail());
            pr.setString(4, account.getGender());
            pr.setDate(5, account.getBirthDay());
            pr.setString(6, account.getAddress());
            pr.setString(7, account.getAddressReceive());
            pr.setInt(8, account.getId());
            re = pr.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static Account getAccount(String userName, String password) {
        Account re = null;
        try{
            // Tạo kết nối đến database
            Connection connection = JDBCUtil.getConnection();
            // Tạo đối tượng statement
            String sql = "select a.id, a.userName, a.password, a.name, a.gender, a.phoneNumber, a.birthDay, a.address, a.addressReceive, a.email, a.role, a.status " +
                    "from accounts as a " +
                    "where a.userName =? and a.password =?";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, userName);
            pr.setString(2, password);
            // Thực thi câu lệnh sql
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String usName = resultSet.getString("userName");
                String pw = resultSet.getString("password");
                String gender = resultSet.getString("gender");
                String phoneNumber = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                Date birthDay = resultSet.getDate("birthDay");
                String address = resultSet.getString("address");
                String addressReceive = resultSet.getString("addressReceive");
                int role = resultSet.getInt("role");
                boolean status = resultSet.getBoolean("status");
                re = new Account(id, name,usName, pw, email, phoneNumber, gender, birthDay, address, addressReceive, role, status);
            }
            JDBCUtil.closeConnection(connection);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static VerifyAccount getVrfOfAccount(int idAccount) {
        VerifyAccount verifyAccount = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select stateVerify from verify_account where idAccount =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idAccount);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                verifyAccount = new VerifyAccount(resultSet.getBoolean("stateVerify"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return verifyAccount;
    }
    public static ArrayList<Account> listAllAccount() {
        ArrayList<Account> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, userName, password, name, gender, phoneNumber, birthDay, address, addressReceive, email, role, status " +
                "from accounts ";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String usName = resultSet.getString("userName");
                String pw = resultSet.getString("password");
                String gender = resultSet.getString("gender");
                String phoneNumber = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                Date birthDay = resultSet.getDate("birthDay");
                String address = resultSet.getString("address");
                String addressReceive = resultSet.getString("addressReceive");
                int role = resultSet.getInt("role");
                boolean status = resultSet.getBoolean("status");
                Account account = new Account(id, name,usName, pw, email, phoneNumber, gender, birthDay, address, addressReceive, role, status);
                list.add(account);
            }
           JDBCUtil.closeConnection(connection);
       } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  list;
    }
    public static int updatePassword( String passEnCrypt, int idAccount) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql ="update accounts set password =? where id =?";
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
    public static int delAccount(int id) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from accounts where id=" + id);
                if (resultSet.next()) {
                    s.executeUpdate("delete from verify_account where idAccount =" + id);
                    re = s.executeUpdate("delete from accounts where id =" + id);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static int updateStatus(int id, boolean status) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from accounts where id=" + id);
                if (resultSet.next()) {
                    s.executeUpdate("update accounts set status ="+status +" where id =" + id);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static int updateInforAccount(Account a) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        Statement  s = connection.createStatement();
        synchronized(s) {
            try {
                ResultSet resultSet = s.executeQuery("select id from accounts where id=" + a.getId());
                if (resultSet.next()) {
                    re = s.executeUpdate("UPDATE accounts SET name='" + a.getName() +
                            "', gender='" + a.getGender() +
                            "', email='" + a.getEmail() +
                            "', phoneNumber='" + a.getPhoneNumber() +
                            "', birthDay='" + a.getBirthDay() +
                            "', address='" + a.getAddress() +
                            "', addressReceive='" + a.getAddressReceive() +
                            "', role='" + a.getRole() +
                            "' WHERE id=" + a.getId());
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);
        }
        return re;
    }
    public static void main(String[] args) {
    System.out.println(selectVerifyAccountByIdAccount(14));
    }


}
