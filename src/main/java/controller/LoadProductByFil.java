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
import org.json.JSONObject;
import org.json.JSONArray;

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
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Product p : listProduct) {
            JSONObject productJSON = new JSONObject();
            productJSON.put("idProduct", p.getIdProduct());
            productJSON.put("imageUrl", p.getImages().get(0).getUrl());
            productJSON.put("name", p.getName());
            productJSON.put("priceFormatted", p.getPriceFormatted());
            htmlDataArray.put(productJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("productExits", listProduct.size());
        out.println(jsonResponse.toString());
    }
}

