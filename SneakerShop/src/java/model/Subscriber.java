/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nguye
 */
public class Subscriber {
    private int subid;
    private String submail;

    public Subscriber() {
    }

    public Subscriber(String submail) {
        this.submail = submail;
    }

    public int getSubid() {
        return subid;
    }

    public void setSubid(int subid) {
        this.subid = subid;
    }

    public String getSubmail() {
        return submail;
    }

    public void setSubmail(String submail) {
        this.submail = submail;
    }
    
    
    
    
}
