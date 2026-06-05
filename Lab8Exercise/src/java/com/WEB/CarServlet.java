/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.WEB;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import com.dao.CarDAO;
import com.Model.Car;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {
    "/car/list",
    "/car/new",
    "/car/insert",
    "/car/edit",
    "/car/update",
    "/car/delete"
})
public class CarServlet extends HttpServlet {

    private CarDAO dao;

    public void init() {
        dao = new CarDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CarServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/car/new":
                    request.getRequestDispatcher("/carForm.jsp").forward(request, response);
                    break;

                case "/car/insert":
                    insert(request, response);
                    break;

                case "/car/edit":
                    edit(request, response);
                    break;

                case "/car/update":
                    update(request, response);
                    break;

                case "/car/delete":
                    delete(request, response);
                    break;

                default:
                    list(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setAttribute("listCar", dao.selectAll());
        request.getRequestDispatcher("/carList.jsp").forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Car c = new Car(
                request.getParameter("brand"),
                request.getParameter("model"),
                Integer.parseInt(request.getParameter("cylinder")),
                Double.parseDouble(request.getParameter("price"))
        );
        dao.insert(c);
        response.sendRedirect(request.getContextPath() + "/car/list");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("car", dao.selectById(id));
        request.getRequestDispatcher("/carForm.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Car c = new Car(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("brand"),
                request.getParameter("model"),
                Integer.parseInt(request.getParameter("cylinder")),
                Double.parseDouble(request.getParameter("price"))
        );
        dao.update(c);
        response.sendRedirect(request.getContextPath() + "/car/list");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(id);
        response.sendRedirect(request.getContextPath() + "/car/list");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
