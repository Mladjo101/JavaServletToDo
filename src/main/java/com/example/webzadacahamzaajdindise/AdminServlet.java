package com.example.webzadacahamzaajdindise;

import com.example.webzadacahamzaajdindise.itemLogic.MenuDAO;
import com.example.webzadacahamzaajdindise.itemLogic.OrderDAO;
import com.example.webzadacahamzaajdindise.models.MenuItem;
import com.example.webzadacahamzaajdindise.models.Order;
import com.example.webzadacahamzaajdindise.models.OrderItem;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    OrderDAO orderDAO;
    MenuDAO menuDAO;

    public AdminServlet() {
        this.orderDAO = new OrderDAO();
        this.menuDAO = new MenuDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement administrative functions like viewing orders, managing menu, etc.
        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("orders", orders);

        // Forward request to admin dashboard or relevant JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement administrative functions like viewing orders, managing menu, etc.
        String name = request.getParameter("name");
        String priceString = request.getParameter("price");
        String description = request.getParameter("description");
        Double price = Double.parseDouble(priceString);
        menuDAO.addMenuItem(new MenuItem(name, price, description));
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
