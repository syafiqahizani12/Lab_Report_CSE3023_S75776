package com.lab.controller;

import com.lab.dao.productDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ViewProductServlet", urlPatterns = {"/ViewProductServlet"})
public class ViewProductServlet extends HttpServlet {

    private productDAO dao;

    @Override
    public void init() {
        dao = new productDAO();
    }

    // =========================
    // DISPLAY ALL PRODUCTS
    // =========================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        List<Product> list = dao.getAllProducts();

        out.println("<h2>Product List</h2>");
        out.println("<a href='add_product.html'>Add Product</a><br><br>");

        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Qty</th><th>Action</th></tr>");

        for (Product p : list) {
            out.println("<tr>");
            out.println("<td>" + p.getId() + "</td>");
            out.println("<td>" + p.getName() + "</td>");
            out.println("<td>" + p.getCategory() + "</td>");
            out.println("<td>" + p.getPrice() + "</td>");
            out.println("<td>" + p.getQuantity() + "</td>");

            out.println("<td>"
                + "<a href='UpdateProductServlet?id=" + p.getId() + "'>Edit</a> | "
                + "<a href='DeleteProductServlet?id=" + p.getId() + "' "
                + "onclick=\"return confirm('Are you sure?')\">Delete</a>"
                + "</td>");

            out.println("</tr>");
        }

        out.println("</table>");
    }

    @Override
    public String getServletInfo() {
        return "View Product Servlet";
    }
}