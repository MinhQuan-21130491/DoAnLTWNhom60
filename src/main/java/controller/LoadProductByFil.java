package controller;

import model.Product;
import service.ProductService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "filterProduct", value = "/filterProduct")
public class LoadProductByFil extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String priceText = request.getParameter("price");
        int price = 0;
        if(!priceText.equals("")) {
            price = Integer.parseInt(priceText);
        }
        String color = request.getParameter("color")+"";
        String material = request.getParameter("material")+"";
        String command = request.getParameter("command")+"";
        String idCateText = request.getParameter("idCate");
        int idCate = 0;
        if(idCateText != null) {
            idCate = Integer.parseInt(idCateText);
        }
        ArrayList<Product> listProduct = ProductService.getInstance().listProductByFil(command,price, color, material, idCate );
        PrintWriter out = response.getWriter();
        for(Product p: listProduct){
            out.println(" <div class=\"col-lg-4 col-sm-6 mt-3 product\">\n" +
                    "                            <div class=\"card\">\n" +
                    "                                <a href=\"detail-product?pid="+p.getIdProduct()+"\">\n" +
                    "                                    <img src=\""+p.getImages().get(0).getUrl()+"\" class=\"card-img-top img_p\" alt=\"...\">\n" +
                    "                                </a>\n" +
                    "                                <div class=\"card-body\">\n" +
                    "                                    <h5 class=\"card-title\">"+p.getName()+"</h5>\n" +
                    "                                    <p class=\"card-text\">\n" +
                    "                                    <p class=\"price\">₫"+p.getPriceFormatted()+"\n" +
                    "                                    <a href=\"Cart.jsp\"><i class=\"fa fa-shopping-cart cart\" aria-hidden=\"true\" title=\"Thêm vào giỏ hàng\"></i></a>\n" +
                    "                                    </p>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </div>");
        }

    }
}

