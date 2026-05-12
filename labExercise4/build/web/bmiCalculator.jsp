<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 3:47:40 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="container">
            <div class="card">

                <h2>Calculate Your BMI</h2>

                <form action="processBMI.jsp" method="post">

                    <label>Weight (kg):</label><br>
                    <input type="text" name="weight" required><br><br>

                    <label>Height (m):</label><br>
                    <input type="text" name="height" required><br><br>

                    <button type="submit">Calculate</button>

                </form>

            </div>
        </div>

        <%@ include file="footer.jsp" %>

    </body>
</html>