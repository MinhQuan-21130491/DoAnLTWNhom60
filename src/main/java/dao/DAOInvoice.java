package dao;

import model.Invoice;
import model.InvoiceDetail;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;

public class DAOInvoice {
    public static ArrayList<Invoice> listInvoice() {
        ArrayList<Invoice> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                Invoice invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
                list.add(invoice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static Invoice selectById(int idInvoice) {
        Invoice invoice = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
           return invoice;
    }
    public static ArrayList<InvoiceDetail> listDetail(int idInvoice) {
        ArrayList<InvoiceDetail> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idProduct, price, quantity from invoice_details where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idProduct = resultSet.getInt("idProduct");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                InvoiceDetail detail = new InvoiceDetail(id, idProduct, price, quantity);
                list.add(detail);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static synchronized int delInvoice(int idInvoice) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement( "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where id =?");
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                pr = connection.prepareStatement("delete from invoices where id =?");
                pr.setInt(1, idInvoice);
                re = pr.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static synchronized int updateStatus(int idInvoice, int status) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement( "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where id =?");
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                pr = connection.prepareStatement("update invoices set status =? where id =?");
                pr.setInt(1, status);
                pr.setInt(2, idInvoice);
                re = pr.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
}
