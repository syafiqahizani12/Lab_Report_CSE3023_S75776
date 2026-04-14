package com.lab.controller;

import com.lab.dao.productDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    private productDAO dao;

    @Override
    public void init() {
        dao = new productDAO();
    }

    // =========================
    // DISPLAY FORM (GET)
    // =========================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Product p = dao.getProduct(id);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h2>Update Product</h2>");
        out.println("<form method='post'>");

        out.println("<input type='hidden' name='id' value='" + p.getId() + "'>");
        out.println("Name: <input type='text' name='name' value='" + p.getName() + "'><br><br>");
        out.println("Category: <input type='text' name='category' value='" + p.getCategory() + "'><br><br>");
        out.println("Price: <input type='text' name='price' value='" + p.getPrice() + "'><br><br>");
        out.println("Quantity: <input type='text' name='quantity' value='" + p.getQuantity() + "'><br><br>");

        out.println("<input type='submit' value='Update'>");
        out.println("</form>");
    }

    // =========================
    // HANDLE UPDATE (POST)
    // =========================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product p = new Product(id, name, category, price, quantity);

        dao.updateProduct(p);

        response.sendRedirect("ViewProductServlet");
    }

    @Override
    public String getServletInfo() {
        return "Update Product Servlet";
    }
}