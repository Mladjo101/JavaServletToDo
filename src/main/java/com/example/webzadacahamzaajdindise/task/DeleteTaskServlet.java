package com.example.webzadacahamzaajdindise.task;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteTaskServlet", value = "/deleteTask")
public class DeleteTaskServlet extends HttpServlet {
    TaskDAO taskDAO;

    public DeleteTaskServlet() {
        this.taskDAO = new TaskDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the taskId from the request parameter
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        // Call TaskDAO to delete the task
        taskDAO.deleteTask(taskId);

        // Redirect back to the user dashboard or handle the response as needed
        response.sendRedirect(request.getContextPath() + "/user");
    }
}
