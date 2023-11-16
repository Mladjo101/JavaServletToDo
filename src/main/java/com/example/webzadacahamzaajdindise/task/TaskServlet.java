package com.example.webzadacahamzaajdindise.task;

import com.example.webzadacahamzaajdindise.models.Task;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "TaskServlet", value = "/tasks")
public class TaskServlet extends HttpServlet {
    TaskDAO taskDAO;

    public TaskServlet() {
        this.taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming you have user information in the session or request parameter
        int userId = 1; // Replace with your logic to get the user ID

        // Get tasks for the user
        List<Task> tasks = taskDAO.getTasksByUserId(userId);

        // Forward the tasks to a JSP or handle the response as needed
        // (You may need to adjust this based on your application structure)
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/tasks.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Create a new task
        Task newTask = new Task(description, userId);
        taskDAO.createTask(newTask);

        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
