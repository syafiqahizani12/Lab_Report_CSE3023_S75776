package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PayrollServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Employee> list = new ArrayList<>();

        // Populate with 5 different Employee objects
        Employee e1 = new Employee();
        e1.setEmpId("E001");
        e1.setName("Alyss");
        e1.setDepartment("IT");
        e1.setBasicSalary(4500);
        
        Employee e2 = new Employee();
        e2.setEmpId("E002");
        e2.setName("Mysa");
        e2.setDepartment("HR");
        e2.setBasicSalary(2500);
        
        Employee e3 = new Employee();
        e3.setEmpId("E003");
        e3.setName("Aspar");
        e3.setDepartment("Finance");
        e3.setBasicSalary(3200);
        
        Employee e4 = new Employee();
        e4.setEmpId("E004");
        e4.setName("Diana");
        e4.setDepartment("Sales");
        e4.setBasicSalary(2800);
        
        Employee e5 = new Employee();
        e5.setEmpId("E005");
        e5.setName("Zahid");
        e5.setDepartment("IT");
        e5.setBasicSalary(5000);

        list.add(e1);
        list.add(e2);
        list.add(e3);
        list.add(e4);
        list.add(e5);

        // Share list and forward
        request.setAttribute("employeeList", list);
        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
        rd.forward(request, response);
    }
}
