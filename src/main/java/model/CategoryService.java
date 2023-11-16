package model;

import dao.DAOCategory;

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
    public ArrayList<Category> listCategory() {
        return DAOCategory.listCategory();
    }
}
