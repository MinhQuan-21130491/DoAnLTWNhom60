package model;

import dao.DAOProduct;
import java.util.ArrayList;
public class ProductService {
    static ProductService instance;
    private ProductService() {
    }
    public static ProductService getInstance() {
        if (instance == null)
            instance = new ProductService();
        return instance;
    }
    public ArrayList<Product> listSixProduct(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listSixProduct(offset);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    public Product getProductById(int id) {
       Product product = DAOProduct.getProductById(id);
       ArrayList<Image> listImageOfProduct = DAOProduct.listImageOfProduct(product);
       product.setImages(listImageOfProduct);
       return product;
    }
    public static void main(String[] args) {
//        System.out.println(ProductService.getInstance().listSixProduct(0));
    }
}