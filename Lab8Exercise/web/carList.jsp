<%-- 
    Document   : carList
    Created on : 2 Jun 2026, 4:00:45 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Management Application</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">   </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark"
                 style="background-color: tomato">
                <div>
                    <a href="" class="navbar-brand"> Car
                        Management App </a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/car/list"
                           class="nav-link">Cars</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Car</h3>
                <hr>
                <div class="container text-left">
                    <a href="<%=request.getContextPath()%>/car/new"
                       class="btn btn-success">Add New Car</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Cyclinder</th>
                            <th>Price</th>
                            <th>Actions</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car" items="${listCar}">
                            <tr>
                                <td>${car.carId}</td>
                                <td>${car.brand}</td>
                                <td>${car.model}</td>
                                <td>${car.cylinder}</td>
                                <td>${car.price}</td>

                                <td>


                                    <a href="${pageContext.request.contextPath}/car/edit?id=${car.carId}">Edit</a>

                                    <a href="${pageContext.request.contextPath}/car/delete?id=${car.carId}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>

