<%-- 
    Document   : carForm
    Created on : 2 Jun 2026, 4:17:49 pm
    Author     : ASUS
--%>

<%-- 
    Document   : EmployeeForm
    Created on : 2 Jun 2026, 2:42:23 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Car Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>

        <header>
            <nav class="navbar navbar-dark" style="background-color: tomato">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/list">
                    Car Management App
                </a>
            </nav>
        </header>

        <br>

        <div class="container col-md-5">

            <div class="card">

                <div class="card-body">

                    <!-- Check if edit or insert -->
                    <c:if test="${car != null}">
                        <form action="${pageContext.request.contextPath}/car/update" method="post">                        </c:if>

                        <c:if test="${car == null}">
                            <form action="${pageContext.request.contextPath}/car/insert" method="post">                            </c:if>

                                <h2>
                                <c:if test="${car != null}">
                                    Edit Car
                                </c:if>
                                <c:if test="${car == null}">
                                    Add New Car
                                </c:if>
                            </h2>

                            <!-- Hidden ID (IMPORTANT) -->
                            <c:if test="${car != null}">
                                <input type="hidden" name="id" value="${car.carId}" />
                            </c:if>

                            <!-- BRAND -->
                            <div class="form-group">
                                <label>Brand</label>
                                <input type="text"
                                       name="brand"
                                       value="${car.brand}"
                                       class="form-control"
                                       required />
                            </div>

                            <!-- MODEL -->
                            <div class="form-group">
                                <label>Model</label>
                                <input type="text"
                                       name="model"
                                       value="${car.model}"
                                       class="form-control"
                                       required />
                            </div>

                            <!-- CYLINDER -->
                            <div class="form-group">
                                <label>Cylinder</label>
                                <input type="number"
                                       name="cylinder"
                                       value="${car != null ? car.cylinder : ''}"
                                       class="form-control"
                                       required />
                            </div>

                            <!-- PRICE -->
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number"
                                       step="0.01"
                                       name="price"
                                       value="${car != null ? car.price : ''}"
                                       class="form-control"
                                       required />
                            </div>

                            <br>

                            <button type="submit" class="btn btn-success">
                                Save
                            </button>

                        </form>

                </div>
            </div>

        </div>

    </body>
</html>