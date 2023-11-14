package com.example.webzadacahamzaajdindise.itemLogic;

import com.example.webzadacahamzaajdindise.models.MenuItem;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MenuServlet", value = "/menu")
public class MenuServlet extends HttpServlet {

    private final MenuDAO menuDAO;

    public MenuServlet() {
        this.menuDAO = new MenuDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch menu items from database or any other source

        // Set menu items in request attribute
        List<MenuItem> menuItems = menuDAO.getAllMenuItems();

        System.out.println("Menu items: " + menuItems.toString());
        // Forward request to JSP page for displaying menu
        request.setAttribute("menuItems", menuItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/menu.jsp");
        dispatcher.forward(request, response);

    }
}
