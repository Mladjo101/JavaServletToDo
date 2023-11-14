package com.example.webzadacahamzaajdindise.models;

public class OrderItem {
    private int id;
    private MenuItem menuItem; // Reference to the MenuItem ordered
    private int quantity;
    private double price; // Price per item

    // Constructors
    public OrderItem() {}

    public OrderItem(int id, MenuItem menuItem, int quantity, double price) {
        this.id = id;
        this.menuItem = menuItem;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MenuItem getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(MenuItem menuItem) {
        this.menuItem = menuItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
