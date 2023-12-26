package controller;

import com.google.gson.annotations.Until;
import model.Account;
import model.Cart;
import model.Product;
import util.Email;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Iterator;

@WebServlet(name = "Payment", value = "/Payment")
public class Payment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("Cart");
        Iterator<Product>  it = cart.list().iterator();
        double sum=(double) session.getAttribute("Sum");
        String name = a.getName();
        String phone=a.getPhoneNumber();
        String email=a.getEmail();
        String address=a.getAddressReceive();
        String startContent="Thông tin khách hàng: "+"<br>"+"Họ và tên: "+name+"<br>"+"Số điện thoại: "+phone+"<br>"+"Email: "+email+"<br>"+"Địa chỉ nhận hàng: "+address+"<br>";
        String content="Các sản phẩm đã đặt hàng:"+"<br>";
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String endContent="Tổng tiền: "+nF.format(sum);
        Product p;
        while (it.hasNext()){
            p= it.next();
            content+= "Sản phẩm: "+p.getName()+" -"+" Số lượng: "+p.getQuantity()+"<br>";
        }
        session.setAttribute("Cart",null);
        Email.sendEmail(a.getEmail(),"Xác nhận đơn hàng từ HomeDecor",startContent+content+endContent);
        response.sendRedirect(url+"/homePage");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}