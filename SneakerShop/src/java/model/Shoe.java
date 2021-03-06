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
public class Shoe {
    private String sid;
    private String sname;
    private Date redate;
    private boolean trend;
    private float size;
    private float retail;
    private float price;
    private boolean sale;
    private int brands;
    private Order orders;
    private OrderLine orderlines;
    private User users;
    private Brand br;
    ArrayList<Coupon> coupons = new ArrayList<>();

    public Shoe() {
    }

    public ArrayList<Coupon> getCoupons() {
        return coupons;
    }

    public void setCoupons(ArrayList<Coupon> coupons) {
        this.coupons = coupons;
    }

    public Shoe(String sid, String sname, Date redate, boolean trend, float size, float retail, float price, boolean sale, int brands) {
        this.sid = sid;
        this.sname = sname;
        this.redate = redate;
        this.trend = trend;
        this.size = size;
        this.retail = retail;
        this.price = price;
        this.sale = sale;
        this.brands = brands;
    }

    public Shoe(String sid, String sname, Date redate, boolean trend, float size, float retail, float price, boolean sale, Brand br) {
        this.sid = sid;
        this.sname = sname;
        this.redate = redate;
        this.trend = trend;
        this.size = size;
        this.retail = retail;
        this.price = price;
        this.sale = sale;
        this.br = br;
    }    
        
    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
    
    public Date getRedate() {
        return redate;
    }

    public void setRedate(Date redate) {
        this.redate = redate;
    }

    public boolean isTrend() {
        return trend;
    }

    public void setTrend(boolean trend) {
        this.trend = trend;
    }

    public float getSize() {
        return size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public float getRetail() {
        return retail;
    }

    public void setRetail(float retail) {
        this.retail = retail;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isSale() {
        return sale;
    }

    public void setSale(boolean sale) {
        this.sale = sale;
    }

    public int getBrands() {
        return brands;
    }

    public void setBrands(int brands) {
        this.brands = brands;
    }

    public Order getOrders() {
        return orders;
    }

    public void setOrders(Order orders) {
        this.orders = orders;
    }

    public OrderLine getOrderlines() {
        return orderlines;
    }

    public void setOrderlines(OrderLine orderlines) {
        this.orderlines = orderlines;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }
    
    public Brand getBr() {
        return br;
    }

    public void setBr(Brand br) {
        this.br = br;
    }
    
    
    
    
}
