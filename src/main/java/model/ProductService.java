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
    /*
    load 6 sản phẩm, có tham số offset là vị trí sản phẩm bắt đầu load
    @param offset
    @return ArrayList<Product>
    */
    public ArrayList<Product> listSixProduct(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listSixProduct(offset);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    /*
   lấy ra sản phẩm theo id sản phẩm
   @param id
   @return Product
    */
    public Product getProductById(int id) {
       Product product = DAOProduct.getProductById(id);
       ArrayList<Image> listImageOfProduct = DAOProduct.listImageOfProduct(product);
       product.setImages(listImageOfProduct);
       return product;
    }
    /*
   load sản phẩm theo mã danh mục
   @param id, offset
   @return ArrayList<Product>
   */
    public ArrayList<Product> listProductByIdCate(int id, int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductByIdCate(id, offset);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    /*
    load danh sách sản phẩm nếu sản phẩm đó có tên chứa chuỗi nhập vào thanh tìm kiếm
    @param nameProduct
    @return ArrayList<Product>
    */
    public ArrayList<Product> listProductByName(String name) {
        ArrayList<Product> listProduct = DAOProduct.listProductByName(name);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    public static void main(String[] args) {
//        System.out.println(ProductService.getInstance().listSixProduct(0));
    }
}