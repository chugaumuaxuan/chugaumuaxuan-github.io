/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subscriber;
import model.User;

/**
 *
 * @author nguye
 */
public class UserDAO {
    
//    private static UserDAO dao = null;
//
//    private UserDAO() {
//    }
//
//    public static UserDAO getDAO() {
//        if (dao == null) {
//            dao = new UserDAO();
//        }
//        return dao;
//    }
    
    public User getUserByLoginNameAndPassword(String loginname, String password)
    {
        try {
            String sql = "SELECT UserName, LoginName, [Address], PhoneNumber, Email FROM [User]"
                       + "WHERE LoginName = ? AND Password = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, loginname);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) 
            {
                User u = new User();
                u.setUsername(rs.getString("UserName"));
                u.setLoginname(rs.getString("LoginName"));
                u.setAddress(rs.getString("Address"));
                u.setPhone(rs.getInt("PhoneNumber"));
                u.setMail(rs.getString("Email"));
                return u;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean addNewUser(String loginname, String password, String username, String address, String phone, String email) throws Exception {
        
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([UserName]\n"
                + "           ,[LoginName]\n" 
                + "           ,[Password]\n"
                + "           ,[Address]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Email])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        
        PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
        statement.setString(1, loginname);
        statement.setString(2, password);
        statement.setString(3, username);
        statement.setString(4, address);
        statement.setString(5, phone);
        statement.setString(6, email);
        try {
            statement.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
    public void addNewSubscriber(Subscriber sub)
    {        
        try {
            String sql = "INSERT INTO [dbo].[Subscriber]\n"
                    + "           ([Email])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, sub.getSubmail());
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public boolean addNewSubscriber(String sub) throws Exception
//    {
//        String sql = "INSERT INTO [dbo].[Subscriber]\n"
//            + "           ([Email])\n"
//            + "     VALUES\n"
//            + "           (?)";
//        PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
//        statement.setString(1, sub);
//        try {
//            statement.executeUpdate();
//        } catch (Exception e) {
//            return false;
//        }
//        return true;
//    }
}
