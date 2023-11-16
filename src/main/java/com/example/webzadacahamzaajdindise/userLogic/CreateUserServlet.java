package com.example.webzadacahamzaajdindise.userLogic;

import com.example.webzadacahamzaajdindise.models.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CreateUserServlet", value = "/createUser")
public class CreateUserServlet extends HttpServlet {
    CreateUserDAO createUserDAO;

    public CreateUserServlet() {
        this.createUserDAO = new CreateUserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get all users
        List<User> users = createUserDAO.getAllUsersExceptAdmin();

        // Forward the list of users to a JSP page
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/createTask.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input (you might want to add more validation)
        if (username == null || username.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Username, email, and password are required");
            return;
        }

        // Call CreateUserDAO to create a new user
        User newUser = createUserDAO.createUser(username, email, password);

        // You can do something with the newUser if needed, like storing it in the session or displaying a confirmation message
        // For example, you might want to redirect to a success page:
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
