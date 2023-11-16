package com.example.webzadacahamzaajdindise.task;

import com.example.webzadacahamzaajdindise.DatabaseConfig;
import com.example.webzadacahamzaajdindise.models.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    public List<Task> getTasksByUserId(int userId) {
        List<Task> tasks = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection()) {
            String query = "SELECT * FROM tasks WHERE user_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Task task = new Task();
                    task.setId(resultSet.getInt("id"));
                    task.setDescription(resultSet.getString("description"));
                    task.setUserId(resultSet.getInt("user_id"));
                    // Add more fields as needed

                    tasks.add(task);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving tasks for user ID: " + userId, e);
        }
        return tasks;
    }

    public void createTask(Task task) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String query = "INSERT INTO tasks (description, user_id) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, task.getDescription());
                statement.setInt(2, task.getUserId());

                statement.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error creating task", e);
        }
    }
    public void deleteTask(int taskId) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String query = "DELETE FROM tasks WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, taskId);

                int affectedRows = statement.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Deleting task failed, no rows affected.");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting task with ID: " + taskId, e);
        }
    }
}
