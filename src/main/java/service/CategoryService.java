package service;

import dao.DAOCategory;
import model.Category;

import java.util.ArrayList;

public class CategoryService {
    static CategoryService instance;
    private CategoryService() {
    }
    public static CategoryService getInstance() {
        if (instance == null)
            instance = new CategoryService();
        return instance;
    }
    /*
     load danh sách danh mục sản phẩm
     @return ArrayList<Category>
    */
    public ArrayList<Category> listCategory() {
        return DAOCategory.listCategory();
    }
    public Category getCategoryById(int id) {
        return DAOCategory.getCategoryById(id);
    }
}
