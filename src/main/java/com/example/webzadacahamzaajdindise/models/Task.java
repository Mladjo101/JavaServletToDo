package com.example.webzadacahamzaajdindise.models;

import java.util.Date;

public class Task {
    private int id;
    private String description;
    private int userId; // Reference to the User to whom the task is assigned


    // Constructors
    public Task() {
    }

    public Task(String description, int userId) {
        this.description = description;
        this.userId = userId;
    }

    // Getter and Setter methods for all fields

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
