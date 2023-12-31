package service;
import dao.DAOCategory;
import dao.DaoWeb;
import model.Category;
import model.InforWebsite;

import java.sql.SQLException;
import java.util.ArrayList;
public class WebService {
    static WebService instance;
    private WebService() {
    }
    public static WebService getInstance() {
        if (instance == null)
            instance = new WebService();
        return instance;
    }
    public int updatePolicy(InforWebsite i) throws SQLException {
        return DaoWeb.updatePolicy(i);
    }
    public int updateContact(InforWebsite i) throws SQLException {
        return DaoWeb.updateContact(i);
    }
    public InforWebsite getPolicyInformation (int id) throws SQLException {
        return DaoWeb.getPolicyInformation(id);
    }
    public InforWebsite getContactInformation (int id) throws SQLException {
        return DaoWeb.getContactInformation(id);
    }
}
