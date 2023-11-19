package com.example.webzadacahamzaajdindise.userLogic;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    CreateUserDAO createUserDAO;

    public DeleteUserServlet() {
        this.createUserDAO = new CreateUserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the userId from the request parameter
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Call CreateUserDAO to delete the user
        createUserDAO.deleteUserById(userId);


        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
