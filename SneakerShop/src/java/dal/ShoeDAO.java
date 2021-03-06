/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Shoe;

/**
 *
 * @author nguye
 */
public class ShoeDAO {
    
//    private static ShoeDAO dao = null;
//
//    private ShoeDAO() {
//    }
//
//    public static ShoeDAO getDAO() {
//        if (dao == null) {
//            dao = new ShoeDAO();
//        }
//        return dao;
//    }
    
    public ArrayList<Shoe> getAllShoes(int brandid) throws Exception 
    {
        String sql = "SELECT *"
                + "FROM Shoe, brand WHERE shoe.brandid = brand.brandid and brand.BrandID = ?";
        
        PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
        statement.setInt(1, brandid);
        ResultSet rs = statement.executeQuery();
        
        ArrayList<Shoe> shoes = new ArrayList<>();
        
        while (rs.next()) {
            String sid = rs.getString("ShoeID");
            String sname = rs.getString("ShoeName");                
            Date date = rs.getDate("ReleaseDate");
            boolean trend = rs.getBoolean("IsTrend");
            float size = rs.getFloat("Size");
            float retail = rs.getFloat("Retail");
            float price = rs.getFloat("Price");
            boolean sale = rs.getBoolean("Sale"); 
            int branId = rs.getInt("brandid");
            Shoe s = new Shoe(sid, sname, date, trend, size, retail, price, sale, branId);
            shoes.add(s);
        }
        System.out.println(shoes.size());
        return shoes;
    }
    
    public Shoe getShoe(String sid)
    {        
        try {
            String sql = "SELECT * FROM [Shoe] WHERE ShoeID = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, sid);
            ResultSet rs = statement.executeQuery();
            if(rs.next())
            {
                Shoe s = new Shoe();
                s.setSid(rs.getString("ShoeID"));
                s.setSname(rs.getString("ShoeName"));
                s.setSize(rs.getFloat("Size"));
                s.setRetail(rs.getFloat("Retail"));
                return s;
            }            
        } catch (Exception ex) {
            Logger.getLogger(ShoeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }
    
    public ArrayList<Shoe> getTrending()
    {
        String sql = "SELECT * FROM [Shoe] s INNER JOIN [Brand] b\n" +
                     "ON s.BrandID = b.BrandID WHERE s.IsTrend = 1";
        
        ArrayList<Shoe> shoes = new ArrayList<>();
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Shoe s = new Shoe();
                s.setSname(rs.getString("ShoeName"));
                s.setRetail(rs.getFloat("Retail"));
                s.setSale(rs.getBoolean("Sale"));
                s.setBrands(rs.getInt("BrandID"));
                shoes.add(s);
           }
       } catch (Exception ex) {
           Logger.getLogger(ShoeDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return shoes;
    }
    
    public ArrayList<Shoe> getReleaseCalendar()
    {
        String sql = "SELECT * \n"
                + "FROM [Shoe] s INNER JOIN [Brand] b\n"
                + "ON s.BrandID = b.BrandID";
        
        ArrayList<Shoe> shoes = new ArrayList<>();
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Shoe s = new Shoe();
                s.setSid(rs.getString("ShoeID"));
                s.setSname(rs.getString("ShoeName"));
                s.setRedate(rs.getDate("ReleaseDate"));
                s.setRetail(rs.getFloat("Retail"));
                s.setBrands(rs.getInt("BrandID"));
                shoes.add(s);
           }
       } catch (Exception ex) {
           Logger.getLogger(ShoeDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return shoes;
    }
    
    public ArrayList<Shoe> getSale()
    {
        String sql = "SELECT * \n"
                + "FROM [Shoe] s INNER JOIN [Brand] b\n"
                + "ON s.BrandID = b.BrandID WHERE s.Sale = 1";
        
        ArrayList<Shoe> shoes = new ArrayList<>();
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Shoe s = new Shoe();
                s.setSname(rs.getString("ShoeName"));
                s.setSize(rs.getFloat("Size"));
                s.setRetail(rs.getFloat("Retail"));
                s.setBrands(rs.getInt("Brandid"));
                shoes.add(s);
           }
       } catch (Exception ex) {
           Logger.getLogger(ShoeDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return shoes;
    }
    
    public ArrayList<Shoe> getShoesForCoupon()
    {
        ArrayList<Shoe> shoes = new ArrayList<>();
        try {
            String sql = "SELECT ShoeID, ShoeName FROM Shoe";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Shoe s = new Shoe();
                s.setSid(rs.getString("ShoeID"));
                s.setSname(rs.getString("ShoeName"));
                shoes.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShoeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return shoes;
    }
}
