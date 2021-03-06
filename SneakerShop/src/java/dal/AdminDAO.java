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
import model.Admin;
import model.Brand;
import model.Coupon;
import model.Shoe;
import model.Subscriber;
import model.Notification;


/**
 *
 * @author nguye
 */
public class AdminDAO {
    
//    private static AdminDAO dao = null;
//
//    private AdminDAO() {
//    }
//
//    public static AdminDAO getDAO() {
//        if (dao == null) {
//            dao = new AdminDAO();
//        }
//        return dao;
//    }
     
    public Admin getAdminByAdminNameAndPassword(String adminname, String password)
    {
        try {
            String sql = "SELECT AdminName, Password FROM [Admin]"
                       + "WHERE AdminName = ? AND Password = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, adminname);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if(rs.next()) 
            {
                Admin a = new Admin();
                a.setAdminname(rs.getString("AdminName"));
                a.setPassword(rs.getString("Password"));                
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Shoe> getAllProductsByAdmin()
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
                s.setBrands(rs.getInt("BrandID"));
                s.setSid(rs.getString("ShoeID"));
                s.setSname(rs.getString("ShoeName"));
                s.setSize(rs.getFloat("Size"));
                s.setPrice(rs.getFloat("Price"));
                s.setSale(rs.getBoolean("Sale"));
                shoes.add(s);
           }
       } catch (Exception ex) {
           Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
       return shoes;
    }
    
    public Shoe getOneProductByAdmin(String sid) {
        try {
            String sql = "SELECT s.ShoeID, s.ShoeName, s.BrandID, s.ReleaseDate, s.IsTrend,\n" +
                         "       s.Size, s.Retail, s.Price, s.Sale, b.BrandID, b.BrandName\n" +
                         "FROM [Shoe] s INNER JOIN [Brand] b ON s.BrandID = b.BrandID\n" +
                         "WHERE s.ShoeID = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, sid);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                Shoe s = new Shoe();
                s.setSid(rs.getString("ShoeID"));
                s.setSname(rs.getString("ShoeName"));
                s.setRedate(rs.getDate("ReleaseDate"));
                s.setTrend(rs.getBoolean("IsTrend"));
                s.setSize(rs.getFloat("Size"));
                s.setRetail(rs.getFloat("Retail"));
                s.setPrice(rs.getFloat("Price"));
                s.setSale(rs.getBoolean("Sale"));
                
                Brand b = new Brand();
                b.setBid(rs.getInt("BrandID"));
                b.setBname(rs.getString("BrandName"));
                s.setBr(b);
                return s;
            }
            
        } catch (Exception ex) {
           Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;        
    }
    
    public void insert(Shoe s)
    {
        try {
            String sql = "INSERT INTO [dbo].[Shoe]\n"
                    + "           ([ShoeID]\n"
                    + "           ,[ShoeName]\n"
                    + "           ,[BrandID]\n"
                    + "           ,[ReleaseDate]\n"
                    + "           ,[IsTrend]\n"
                    + "           ,[Size]\n"
                    + "           ,[Retail]\n"
                    + "           ,[Price]\n"
                    + "           ,[Sale])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE()\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, s.getSid());
            statement.setString(2, s.getSname());
            statement.setInt(3, s.getBr().getBid());
            statement.setBoolean(4, s.isTrend());
            statement.setFloat(5, s.getSize());
            statement.setFloat(6, s.getRetail());
            statement.setFloat(7, s.getPrice());
            statement.setBoolean(8, s.isSale());
            statement.executeUpdate();
        } catch (Exception ex) {
           Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
       } 
    }
    
    public void update(Shoe s) {
        try {
            String sql = "UPDATE [dbo].[Shoe]\n" +
                         "   SET [ShoeName] = ?\n" +
                         "      ,[BrandID] = ?\n" +
                         "      ,[ReleaseDate] = ?\n" +
                         "      ,[IsTrend] = ?\n" +
                         "      ,[Size] = ?\n" +
                         "      ,[Retail] = ?\n" +
                         "      ,[Price] = ?\n" +
                         "      ,[Sale] = ?\n" +
                         " WHERE [ShoeID] = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, s.getSname());
            statement.setInt(2, s.getBr().getBid());
            statement.setDate(3, s.getRedate());
            statement.setBoolean(4, s.isTrend());
            statement.setFloat(5, s.getSize());
            statement.setFloat(6, s.getRetail());
            statement.setFloat(7, s.getPrice());
            statement.setBoolean(8, s.isSale());
            statement.setString(9, s.getSid());
            statement.executeUpdate();            
        } catch (Exception ex) {
           Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void delete(Shoe s) {
        try {
            String sql = "DELETE FROM [Shoe] WHERE ShoeID = ?";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, s.getSid());
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
//    public ArrayList<Coupon> getAllCoupons()
//    {
//        try {
//            ArrayList<Coupon> coupons = new ArrayList<>();
//            String sql = "SELECT c.Code, c.[Description], c.[Percent], s.ShoeName, c.[From], c.[To] FROM [Coupon] c\n"
//                    + "INNER JOIN [Product_Coupon] p ON c.Code = p.Coupon\n"
//                    + "INNER JOIN [Shoe] s ON p.ShoeID = s.ShoeID";
//            
//            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
//            ResultSet rs = statement.executeQuery();
//            while(rs.next()) {
//                Coupon c = new Coupon();
//                ArrayList<String> shoe = new ArrayList<>();
//                String code = rs.getString("Code");
//                if (coupons.isEmpty()) {
//                    c.setCode(code);
//                    c.setDesc(rs.getString("Description"));
//                    c.setPercent(rs.getInt("Percent"));
//                    c.setFrom(rs.getDate("From"));
//                    c.setTo(rs.getDate("To"));
//                    
//                    shoe.add(rs.getString("ShoeName"));
//                    c.setShoeName(shoe);
//                    coupons.add(c);                    
//                }
//                for (Coupon cou : coupons)
//                {
//                    if(cou.getCode() != code) {
//                        c.setCode(code);
//                        c.setDesc(rs.getString("Description"));
//                        c.setPercent(rs.getInt("Percent"));
//                        c.setFrom(rs.getDate("From"));
//                        c.setTo(rs.getDate("To"));
//
//                        shoe.add(rs.getString("ShoeName"));
//                        c.setShoeName(shoe);
//                        coupons.add(c);
//                        break;
//                    } else {
//                        if(cou.getCode() == code) {
//                            for (String s : cou.getShoeName()) {
//                                if(!s.equals(rs.getString("ShoeName"))) {
//                                    cou.getShoeName().add(rs.getString("ShoeName"));
//                                    break;
//                                }
//                            }                            
//                        }
//                        break;
//                    }
//                }
//            }
//            return coupons;
//        } catch(Exception ex) {
//            return null;
//        }
//    }
    
    public ArrayList<Coupon> getAllCoupons()
    {
        ArrayList<Coupon> coupons = new ArrayList<>();
        
        String sql = "SELECT * FROM [Coupon]";
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Coupon c = new Coupon();
                c.setCode(rs.getString("Code"));
                c.setDesc(rs.getString("Description"));
                c.setPercent(rs.getInt("Percent"));
                c.setFrom(rs.getDate("From"));
                c.setTo(rs.getDate("To"));
                coupons.add(c);
            }
        } catch (Exception ex) {
           Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return coupons;        
    }
    
//    public void addCoupon(Coupon coupon)
//    {
//        try {
//            DBContext.getConnection().setAutoCommit(false);
//            String sql_insert_coupon = "INSERT INTO [dbo].[Coupon]\n"
//                    + "           ([Code]\n"
//                    + "           ,[Description]\n"
//                    + "           ,[Percent]\n"
//                    + "           ,[From]\n"
//                    + "           ,[To])\n"
//                    + "     VALUES\n"
//                    + "           (?\n"
//                    + "           ,?\n"
//                    + "           ,?\n"
//                    + "           ,GETDATE()\n"
//                    + "           ,GETDATE() + 7)";
//            PreparedStatement statement_insert_coupon = DBContext.getConnection().prepareStatement(sql_insert_coupon);
//            statement_insert_coupon.setString(1, coupon.getCode());
//            statement_insert_coupon.setString(2, coupon.getDesc());
//            statement_insert_coupon.setInt(3, coupon.getPercent());
//            statement_insert_coupon.executeUpdate();
//            
//            String sql_insert_procoupon = "INSERT INTO [dbo].[Product_Coupon]\n"
//                    + "           ([ShoeID]\n"
//                    + "           ,[Coupon])\n"
//                    + "     VALUES\n"
//                    + "           (?\n"
//                    + "           ,?)";
//            for (Shoe shoe : coupon.getShoes()) {
//                PreparedStatement statement_insert_procoupon = DBContext.getConnection().prepareStatement(sql_insert_procoupon);
//                statement_insert_procoupon.setString(1, shoe.getSid());
//                statement_insert_procoupon.setString(2, coupon.getCode());
//                statement_insert_procoupon.executeUpdate();
//            }
//            DBContext.getConnection().commit();            
//        } catch (Exception ex) {
//            try {
//                DBContext.getConnection().rollback();
//            } catch (Exception ex1) {
//                Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex1);
//            }
//            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        finally
//        {
//            try {
//                DBContext.getConnection().setAutoCommit(true);
//            } catch (Exception ex) {
//                Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }   
//    }
    
    public void addCoupon(Coupon coupon)
    {
        try {
            String sql = "INSERT INTO [dbo].[Coupon]\n"
                    + "           ([Code]\n"
                    + "           ,[Description]\n"
                    + "           ,[Percent]\n"
                    + "           ,[From]\n"
                    + "           ,[To])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE()\n"
                    + "           ,GETDATE() + 7)";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, coupon.getCode());
            statement.setString(2, coupon.getDesc());
            statement.setInt(3, coupon.getPercent());
            statement.executeUpdate();            
        } catch (Exception ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public ArrayList<Subscriber> getAllSubscribers() 
    {
        
        ArrayList<Subscriber> subscribers = new ArrayList<>();
        
        String sql = "SELECT * FROM [Subscriber]";
        
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) 
            {
                Subscriber s = new Subscriber();
                s.setSubid(rs.getInt("SID"));
                s.setSubmail(rs.getString("Email"));
                subscribers.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subscribers;
    }
    
    public void addNotification(Notification noti)
    {
        try {
            String sql = "INSERT INTO [dbo].[Notification]\n"
                    + "           ([NoID]\n"
                    + "           ,[Title]\n"
                    + "           ,[Content])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, noti.getNoid());
            statement.setString(2, noti.getTitle());
            statement.setString(3, noti.getContent());
            statement.executeUpdate();            
        } catch (Exception ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void sendNotification(Notification noti, Subscriber sub)
    {
        try {
            String sql = "INSERT INTO [dbo].[Notify_Subscriber]\n"
                    + "           ([SID]\n"
                    + "           ,[NoID]\n"
                    + "           ,[Time])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, noti.getNoid());
            statement.setString(2, noti.getNoid());
            statement.executeUpdate();            
        } catch (Exception ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    

        
}
