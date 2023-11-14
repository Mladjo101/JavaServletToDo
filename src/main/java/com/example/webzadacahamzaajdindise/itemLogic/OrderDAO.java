package com.example.webzadacahamzaajdindise.itemLogic;

import com.example.webzadacahamzaajdindise.DatabaseConfig;
import com.example.webzadacahamzaajdindise.models.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public void placeOrder(Order order) {
        String sql = "INSERT INTO orders (name, total, address, content) VALUES (?, ?, ?, ?)";
        try (Connection connection = DatabaseConfig.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, order.getName());
            statement.setDouble(2, order.getTotal());
            statement.setString(3, order.getAddress());
            statement.setString(4, order.getContent());
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                order.setId(resultSet.getInt(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error placing order", e);
        }
    }

    public List<Order> getAllOrders() {
        String sql = "SELECT * FROM orders";
        List<Order> orders = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order(

                        resultSet.getString("name"),
                        resultSet.getDouble("total"),
                        resultSet.getString("address"),
                        resultSet.getString("content")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving orders", e);
        }
        return orders;
    }
}
