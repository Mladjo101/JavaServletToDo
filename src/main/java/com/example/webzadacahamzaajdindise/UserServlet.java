package com.example.webzadacahamzaajdindise;

import com.example.webzadacahamzaajdindise.itemLogic.MenuDAO;
import com.example.webzadacahamzaajdindise.itemLogic.OrderDAO;
import com.example.webzadacahamzaajdindise.models.MenuItem;
import com.example.webzadacahamzaajdindise.models.Order;
import com.example.webzadacahamzaajdindise.models.OrderItem;
import com.example.webzadacahamzaajdindise.models.Task;
import com.example.webzadacahamzaajdindise.task.TaskDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    TaskDAO taskDAO;

    public UserServlet() {
        this.taskDAO = new TaskDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        List<Task> tasks = taskDAO.getTasksByUserId(userId);

        request.setAttribute("tasks", tasks);
        // Forward request to admin dashboard or relevant JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/userDashboard.jsp");
        dispatcher.forward(request, response);
    }

}
