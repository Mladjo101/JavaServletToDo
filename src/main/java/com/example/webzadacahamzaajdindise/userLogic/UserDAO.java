package com.example.webzadacahamzaajdindise.userLogic;

import com.example.webzadacahamzaajdindise.DatabaseConfig;
import com.example.webzadacahamzaajdindise.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User getUserByUsername(String username) {
        User user = new User();
        try (Connection connection = DatabaseConfig.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
            } else {
                user = null; // User not found
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving user", e);
        }
        return user;
    }
}
