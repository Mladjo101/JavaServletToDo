package com.example.webzadacahamzaajdindise.itemLogic;

import com.example.webzadacahamzaajdindise.models.Order;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    private final OrderDAO orderDAO;

    public OrderServlet() {
        this.orderDAO = new OrderDAO();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract order details from the request
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String stringTotal = request.getParameter("total");
        Double total = Double.parseDouble(stringTotal);
        String content = request.getParameter("content");

        orderDAO.placeOrder(new Order(name, total, address, content));
        // Redirect to a confirmation page
        response.sendRedirect("pages/orderConfirmation.jsp");
    }


}

