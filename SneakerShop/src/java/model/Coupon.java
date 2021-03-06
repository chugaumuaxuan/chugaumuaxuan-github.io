/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author nguye
 */
public class Coupon {
    private String code;
    private String desc;
    private int percent;
    private Date from;
    private Date to;
    private ArrayList<Shoe> shoes = new ArrayList<>();
    ArrayList<String> shoeName;

    public Coupon() {
    }

    public Coupon(String code, String desc, int percent, Date from, Date to) {
        this.code = code;
        this.desc = desc;
        this.percent = percent;
        this.from = from;
        this.to = to;
    }

    public ArrayList<Shoe> getShoes() {
        return shoes;
    }

    public void setShoes(ArrayList<Shoe> shoes) {
        this.shoes = shoes;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }

    public ArrayList<String> getShoeName() {
        return shoeName;
    }

    public void setShoeName(ArrayList<String> shoeName) {
        this.shoeName = shoeName;
    }
    
    
    
}
