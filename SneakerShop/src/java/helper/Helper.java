/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import model.User;
import model.Subscriber;
import dal.DAOFactory;

/**
 *
 * @author nguye
 */
public class Helper {
    public static void addActionUser(User user, String action)
    {
        String sql = "INSERT INTO [ActionUser]\n"
                + "           (LoginName\n"
                + "           ,Action\n"
                + "           ,Time)\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,GETDATE())";
        try {
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            statement.setString(1, user.getLoginname());
            statement.setString(2, action);
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(Helper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
//    public static void testHelper(){
//        System.out.println("aaaaaaaaa");
//    }
    
    public static void notifyToSubscriber() {
        
        AdminInterface admin = new NotificationObject(new ArrayList<SubscriberInterface>(), "Sneaker Shop");
        
        ArrayList<Subscriber> subscribers = DAOFactory.getAdminDAO().getAllSubscribers();
        
        for (Subscriber s : subscribers)
        {
            SubscriberInterface suber = new SMSSubscriber(admin, s.getSubmail());
            suber.subscribe();            
        }
        
        NotificationInterface no = ((NotificationInterface) admin);
        no.setNotify("There is a coupon for you");
        System.out.println();
        
    }
    
    public static void main(String[] args) {
        notifyToSubscriber();
    }
    
    
    
}
