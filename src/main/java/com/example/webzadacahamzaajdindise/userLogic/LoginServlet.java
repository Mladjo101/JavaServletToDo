package com.example.webzadacahamzaajdindise.userLogic;

import com.example.webzadacahamzaajdindise.models.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    public LoginServlet() {
        this.userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.getUserByUsername(username);

        if (user != null && password.equals(user.getPassword())) {
            // Authentication successful

            // Save user ID in session
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId());

            // Redirect to different pages based on the role
            if ("admin".equals(username)) {
                response.sendRedirect("admin"); // Redirect to admin page
            } else {
                response.sendRedirect("user"); // Redirect to user page
            }

        } else {
            // Authentication failed
            // Redirect back to the login page with an error message or handle it accordingly
            response.sendRedirect("login.jsp?error=true");
        }
    }
}

