/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

/**
 *
 * @author nguye
 */
public class SMSSubscriber implements SubscriberInterface {
    
    private final AdminInterface admin;
    private String notify;
    private String suberInfo;

    public SMSSubscriber(AdminInterface admin, String suberInfo) {
        this.admin = admin;
        this.suberInfo = suberInfo;
    }        

    @Override
    public void update(String notify) {
        this.notify = notify;
        display();       
    }
    
    private void display() {
        System.out.println("["+suberInfo+"]: "+notify);
    }

    @Override
    public void subscribe() {
        System.out.println("Welcome " + suberInfo + "! Thanks for subscribe " + admin.adminDetails()+ "");
        this.admin.subscribeUser(this);        
    }
    
    
    
}
