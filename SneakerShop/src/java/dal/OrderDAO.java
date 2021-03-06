/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderLine;
import model.Shoe;
import model.User;

/**
 *
 * @author nguye
 */
public class OrderDAO {
    
//    private static OrderDAO dao = null;
//
//    private OrderDAO() {
//    }
//
//    public static OrderDAO getDAO() {
//        if (dao == null) {
//            dao = new OrderDAO();
//        }
//        return dao;
//    }
    
    public void addOrder(User user) 
    {
        String sql = " INSERT INTO [Order]\n" + 
                     "             (OrderDate\n" +
                     "             ,LoginName)\n" +
                     "     VALUES\n" +
                     "             (GETDATE()\n" +
                     "             ,?)";
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, user.getLoginname());
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getOrder(User user)
    {
        String sql = "SELECT OrderID, OrderDate, LoginName FROM [Order] WHERE LoginName = ?";
        int oid = -1;
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, user.getLoginname());
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                oid = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oid;
    }
    
    public void addOrderLine(int oid, String sid, int quantity, float price)
    {
        String sql = "INSERT INTO [OrderLine]\n"
                + "               (OrderID\n"
                + "               ,ShoeID\n"
                + "               ,Quantity\n"
                + "               ,Price)\n"
                + "         VALUES\n"
                + "               (?, ?, ?, ?)";
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setInt(1, oid);
            statement.setString(2, sid);
            statement.setInt(3, quantity);
            statement.setFloat(4, price);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Shoe> getViewOrder(User user)
    {
        ArrayList<Shoe> shoe = new ArrayList<>();
        try {
          
            String sql = "SELECT * FROM [Shoe] s INNER JOIN [OrderLine] l ON s.ShoeID = l.ShoeID\n" +
                         "INNER JOIN [Order] o ON l.OrderID = o.OrderID\n" +
                         "INNER JOIN [User] u ON o.LoginName = u.LoginName\n" +
                         "WHERE u.LoginName = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, user.getLoginname());
            ResultSet rs = statement.executeQuery();
            
            while(rs.next()) { 
                Shoe s = new Shoe();
                s.setSname(rs.getString("ShoeName"));
                s.setSize(rs.getFloat("Size"));
                s.setRetail(rs.getFloat("Retail"));
                
                Order o = new Order();
                o.setDate(rs.getDate("OrderDate"));
                s.setOrders(o);
                
                OrderLine l = new OrderLine();
                l.setQuantity(rs.getInt("Quantity"));
                s.setOrderlines(l);
                
                User u = new User();
                u.setUsername(rs.getString("UserName"));
                s.setUsers(u);
                
                shoe.add(s);
                
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return shoe;     
     }
    
}
