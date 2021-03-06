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
import model.Brand;
import model.Shoe;

/**
 *
 * @author nguye
 */
public class BrandDAO {
    
//    private static BrandDAO dao = null;
//
//    public BrandDAO() {
//    }
//
//    public static BrandDAO getDAO() {
//        if (dao == null) {
//            dao = new BrandDAO();
//        }
//        return dao;
//    }
    
    public ArrayList<Brand> getAllBrands() 
    {
        
        ArrayList<Brand> brands = new ArrayList<>();
        
        String sql = "SELECT BrandID, BrandName FROM [Brand]";
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) 
            {
                Brand b = new Brand();
                b.setBid(rs.getInt("BrandID"));
                b.setBname(rs.getString("BrandName"));
                brands.add(b);
            }
        } catch (Exception ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brands;
    }
    
    public Brand getOneBrand (int bid) {
        try {
            String sql = "SELECT * FROM [Brand]\n" +
                         "WHERE BrandID = ?";
            PreparedStatement statement= DBContext.getConnection().prepareStatement(sql);
            statement.setInt(1, bid);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Brand br = new Brand();
                br.setBid(rs.getInt("BrandID"));
                br.setBname(rs.getString("BrandName"));
                return br;
            }
            
        } catch (Exception ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Brand getBrand(int brandid)
    {
        String sql = "SELECT BrandName FROM [Brand]\n" +
                     "WHERE BrandID = ?";
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setInt(1, brandid);
            ResultSet rs = statement.executeQuery();
            if(rs.next())
            {
                String bName = rs.getString("BrandName");
                return new Brand(brandid, bName);
            }
        } catch (Exception ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getBrandName(int id) 
    {
        String sql = "SELECT brandname from brand where brandid = " + id;
        ArrayList<Shoe> shoes = new ArrayList<>();

        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("brandname");
            }
        } catch (Exception ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
