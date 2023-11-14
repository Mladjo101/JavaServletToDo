package com.example.webzadacahamzaajdindise.itemLogic;

import com.example.webzadacahamzaajdindise.DatabaseConfig;
import com.example.webzadacahamzaajdindise.models.MenuItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {

    public MenuItem addMenuItem(MenuItem menuItem) {
        // Add a new menu item to the database
        String sql = "INSERT INTO menu_items (name, price, description) VALUES (?, ?, ?)";
        try (Connection connection = DatabaseConfig.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setString(1, menuItem.getName());
            statement.setDouble(2, menuItem.getPrice());
            statement.setString(3, menuItem.getDescription());
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                menuItem.setId(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error adding menu item", e);
        }
        return menuItem;
    }
    public List<MenuItem> getAllMenuItems() {
        // Get all menu items from the database
        String sql = "SELECT * FROM menu_items";
        try (Connection connection = DatabaseConfig.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            List<MenuItem> menuItems = new ArrayList<>();
            while (resultSet.next()) {
                MenuItem menuItem = new MenuItem();
                menuItem.setId(resultSet.getInt("id"));
                menuItem.setName(resultSet.getString("name"));
                menuItem.setPrice(resultSet.getDouble("price"));
                menuItem.setDescription(resultSet.getString("description"));
                menuItems.add(menuItem);
            }
            return menuItems;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving menu items", e);
        }

    }
}
