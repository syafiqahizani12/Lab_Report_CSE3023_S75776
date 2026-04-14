package com.lab.controller;

import com.lab.dao.productDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet {

    private productDAO dao;

    // initialize DAO
    @Override
    public void init() {
        dao = new productDAO();
    }

    // handle delete (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ambil id dari URL
        int id = Integer.parseInt(request.getParameter("id"));

        // call DAO delete
        dao.deleteProduct(id);

        // redirect balik ke list
        response.sendRedirect("ViewProductServlet");
    }

    // optional (kalau POST pun nak support)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Delete Product Servlet";
    }
}