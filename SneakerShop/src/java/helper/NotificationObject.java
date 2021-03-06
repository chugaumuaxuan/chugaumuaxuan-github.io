/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.util.List;

/**
 *
 * @author nguye
 */
public class NotificationObject implements AdminInterface, NotificationInterface {
    
    private final List<SubscriberInterface> subObserver;
    private String notify;
    private final String adminDetails;

    public NotificationObject(List<SubscriberInterface> subObserver, String adminDetails) {
        this.subObserver = subObserver;
        this.adminDetails = adminDetails;
    }    

    @Override
    public void subscribeUser(SubscriberInterface suber) {
        subObserver.add(suber);
        
    }

    @Override
    public void notifySubscriber() {
        System.out.println();
        for(SubscriberInterface suber : subObserver) {
            suber.update(notify);
        }
    }

    @Override
    public String adminDetails() {
        return adminDetails;
    }

    @Override
    public void setNotify(String notify) {
        this.notify = notify;
        notifySubscriber();
    }

    
    
}
