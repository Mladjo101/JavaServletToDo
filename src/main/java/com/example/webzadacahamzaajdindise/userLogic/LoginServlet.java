package com.example.webzadacahamzaajdindise.userLogic;

import com.example.webzadacahamzaajdindise.models.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import static java.lang.System.out;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    UserDAO userDAO;

    public LoginServlet() {
        this.userDAO = new UserDAO();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User admin = userDAO.getAdmin();
        // Authenticate user
        boolean isAuthenticated = username.equals(admin.getUsername()) && password.equals(admin.getPassword());

        if (isAuthenticated) {
            // Redirect to a successful login page or dashboard
            response.sendRedirect("admin");
        } else {
            // Redirect back to the login page with an error message
            out.println("problem");
        }
    }
}
