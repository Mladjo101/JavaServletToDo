package com.example.webzadacahamzaajdindise.userLogic;

import com.example.webzadacahamzaajdindise.DatabaseConfig;
import com.example.webzadacahamzaajdindise.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CreateUserDAO {

    public List<User> getAllUsersExceptAdmin() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection()) {
            String query = "SELECT * FROM users WHERE username <> 'admin'";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    // Add more fields as needed

                    users.add(user);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving users", e);
        }
        return users;
    }
    public User createUser(String username, String email, String password) {
        User newUser = new User();
        try (Connection connection = DatabaseConfig.getConnection()) {
            // Check if the user with the given username or email already exists
            if (userExists(connection, username, email)) {
                throw new RuntimeException("User with username or email already exists.");
            }

            // If the user doesn't exist, create a new user
            String insertQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                insertStatement.setString(1, username);
                insertStatement.setString(2, email);
                insertStatement.setString(3, password);

                int affectedRows = insertStatement.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Creating user failed, no rows affected.");
                }

                try (ResultSet generatedKeys = insertStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        newUser.setId(generatedKeys.getInt(1));
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error creating user", e);
        }
        return newUser;
    }

    private boolean userExists(Connection connection, String username, String email) throws SQLException {
        PreparedStatement checkStatement = connection.prepareStatement("SELECT * FROM users WHERE username = ? OR email = ?");
        checkStatement.setString(1, username);
        checkStatement.setString(2, email);
        ResultSet resultSet = checkStatement.executeQuery();
        return resultSet.next();
    }
}
