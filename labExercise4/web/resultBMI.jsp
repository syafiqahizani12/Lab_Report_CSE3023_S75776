<%-- 
    Document   : resultBMI
    Created on : 21 Apr 2026, 3:58:15 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Result</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="container">
            <div class="card">

                <h2>Your BMI Result</h2>

                <%
                    String bmiStr = request.getParameter("bmi");
                    String category = request.getParameter("category");

                    double bmi = 0;

                    try {
                        bmi = Double.parseDouble(bmiStr);
                    } catch (Exception e) {
                        bmi = 0;
                    }
                %>

                <p><strong>BMI:</strong> <%= String.format("%.2f", bmi)%></p>
                <p><strong>Category:</strong> <%= category%></p>

            </div>
        </div>

        <%@ include file="footer.jsp" %>

    </body>