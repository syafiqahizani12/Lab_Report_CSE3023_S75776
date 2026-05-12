<%-- 
    Document   : payroll_view
    Created on : 29 Apr 2026, 3:25:52 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <title>Employee Payroll System</title>
        <style>
            table {
                border-collapse: collapse;
                width: 80%;
                margin: 20px auto;
            }

            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: lightblue;
            }
        </style>
    </head>

    <body>

        <h2 style="text-align:center;">Employee Payroll Display</h2>

        <table>
            <tr>
                <th>Emp ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Basic Salary</th>
                <th>Status</th>
            </tr>

            <c:forEach var="emp" items="${employeeList}">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.name}</td>
                    <td>${emp.department}</td>
                    <td>${emp.basicSalary}</td>

                    <td>
                <c:choose>
                    <c:when test="${emp.basicSalary >= 3000}">
                        Senior
                    </c:when>
                    <c:otherwise>
                        Junior
                    </c:otherwise>
                </c:choose>
                </td>
                </tr>
            </c:forEach>

        </table>

    </body>
</html>