/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

/**
 *
 * @author nguye
 */

public class DAOFactory {
    
    private static AdminDAO adminDAO = null;
    private static BrandDAO brandDAO = null;
    private static OrderDAO orderDAO = null;
    private static ShoeDAO shoeDAO = null;
    private static UserDAO userDAO = null;
    
    public static AdminDAO getAdminDAO() {
        if (adminDAO == null) {
            adminDAO = new AdminDAO();
        }
        return adminDAO;
    }
    
    public static BrandDAO getBrandDAO() {
        if (brandDAO == null) {
            brandDAO = new BrandDAO();
        }
        return brandDAO;
    }
    
    public static OrderDAO getOrderDAO() {
        if (orderDAO == null) {
            orderDAO = new OrderDAO();
        }
        return orderDAO;
    }
    
    public static ShoeDAO getShoeDAO() {
        if (shoeDAO == null) {
            shoeDAO = new ShoeDAO();
        }
        return shoeDAO;
    }
    
    public static UserDAO getUserDAO() {
        if (userDAO == null) {
            userDAO = new UserDAO();
        }
        return userDAO;
    }
    
    
}
