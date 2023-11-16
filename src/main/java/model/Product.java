package model;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class Product {
    private int idProduct;
    private int idCate;
    private String name;
    private int priceImport;
    private int price;
    private String description;
    private String color;
    private String material;
    private double width;
    private double height;
    private double length;
    private int quantity;
    private ArrayList<Image> images;

    public Product() {
    }

    public Product(int idProduct, int idCate, String name, int priceImport, int price, String description, String color, String material, double width, double height, double length, int quantity, ArrayList<Image> images) {
        this.idProduct = idProduct;
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantity = quantity;
        this.images = images;
    }
    public Product(int idProduct, int idCate, String name, int priceImport, int price, String description, String color, String material, double width, double height, double length, int quantity) {
        this.idProduct = idProduct;
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantity = quantity;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPriceImport() {
        return priceImport;
    }

    public void setPriceImport(int priceImport) {
        this.priceImport = priceImport;
    }

    public int getPrice() {
        return price;
    }
    public String getPriceFormatted() {
        // Sử dụng DecimalFormat để định dạng số
        DecimalFormat decimalFormat = new DecimalFormat("###,###,##0");
        return decimalFormat.format(price);
    }
    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ArrayList<Image> getImages() {
        return images;
    }

    public void setImages(ArrayList<Image> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idProduct=" + idProduct +
                ", idCate=" + idCate +
                ", name='" + name + '\'' +
                ", priceImport=" + priceImport +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", color='" + color + '\'' +
                ", material='" + material + '\'' +
                ", width=" + width +
                ", height=" + height +
                ", length=" + length +
                ", quantity=" + quantity +
                ", images=" + images +
                '}';
    }
}
