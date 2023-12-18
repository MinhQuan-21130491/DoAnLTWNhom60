package controller;

import model.Account;
import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import service.AccountService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;

@WebServlet(name = "delAccount", value = "/delAccount")
public class DelAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Account> listAccount = null;
        try {
            if (AccountService.getInstance().delAccount(id) > 0) {
                listAccount = AccountService.getInstance().listAllAccount();
                res = "Xóa thành công!";
            } else {
                res = "Đã xảy ra lỗi!";
                listAccount = AccountService.getInstance().listAllAccount();
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        for (Account a : listAccount) {
            JSONObject accountJSON = new JSONObject();
            accountJSON.put("id", a.getId());
            accountJSON.put("name", a.getName());
            accountJSON.put("email", a.getEmail());
            String role = "Khách hàng";
            if(a.getRole() == 0) {
                role = "Admin";
            }else if(a.getRole() == 1) {
                role ="Nhân viên";
            }
            accountJSON.put("role", role);
            String vrf = "Chưa xác thực";
            if(a.getVerifyAccount().isStateVerify()) {
                vrf = "Đã xác thực";
            }
            accountJSON.put("vrf", vrf);
            String status = "Hoạt động";
            if(a.isStatus()) {
                status = "Đã khóa";
            }
            accountJSON.put("status", status);
            htmlDataArray.put(accountJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

