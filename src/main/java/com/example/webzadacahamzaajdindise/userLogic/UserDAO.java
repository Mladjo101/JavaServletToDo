package com.example.webzadacahamzaajdindise.userLogic;

import com.example.webzadacahamzaajdindise.DatabaseConfig;
import com.example.webzadacahamzaajdindise.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User getAdmin() {
        User admin = new User();
        try (Connection connection = DatabaseConfig.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = 'admin'");
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                admin.setId(resultSet.getInt("id"));
                admin.setUsername(resultSet.getString("username"));
                admin.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving admin", e);
        }
        return admin;
    }
}
