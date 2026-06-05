<%-- 
    Document   : index
    Created on : 2 Jun 2026, 4:27:37 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Shop MVC</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container mt-4">

            <h1>Car Shop Management System (MVC)</h1>
            <hr>

            <ul class="list-group">

                <li class="list-group-item">
                    <a href="${pageContext.request.contextPath}/car/list">
                        View All Cars
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="${pageContext.request.contextPath}/car/new">
                        Add New Car
                    </a>
                </li>

            </ul>

        </div>
    </body>
</html>