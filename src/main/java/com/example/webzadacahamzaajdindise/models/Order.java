package com.example.webzadacahamzaajdindise.models;

import java.util.Date;
import java.util.List;

public class Order {
    private int id;
    private String name; // Reference to the User who placed the order
    private double total;

    private String address;

    private String content;
    private Date orderDate;

    // Constructors
    public Order() {
    }

    public Order(String name, double total, String address, String content ) {
        this.name = name;
        this.total = total;
        this.address = address;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}