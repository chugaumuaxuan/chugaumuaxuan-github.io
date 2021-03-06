/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author nguye
 */
public class Order {
    private int oid;
    private Date date;
    private User user;
    private float total;
    
    private ArrayList<OrderLine> lines = new ArrayList<>();
    
    public float getTotal() 
    {
        float sum = 0;
        for (OrderLine l : lines) 
        {
            sum += l.getQuantity() * l.getPrice();
        }
        return sum;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ArrayList<OrderLine> getLines() {
        return lines;
    }

    public void setLines(ArrayList<OrderLine> lines) {
        this.lines = lines;
    }
    
    
}
