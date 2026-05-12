<%-- 
    Document   : processBMI
    Created on : 21 Apr 2026, 3:57:44 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String weightStr = request.getParameter("weight");
            String heightStr = request.getParameter("height");

            double weight = 0;
            double height = 0;
            double bmi = 0;
            String category = "";

            try {
                weight = Double.parseDouble(weightStr);
                height = Double.parseDouble(heightStr);

//                calculation bmi
                if (height != 0) {
                    bmi = weight / (height * height);
                }

                if (bmi < 18.5) {
                    category = "Underweight";
                } else if (bmi <= 25) {
                    category = "Normal";
                } else {
                    category = "Overweight";
                }

            } catch (Exception e) {
                category = "Invalid Input";
            }
        %>

        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="bmi" value="<%= bmi%>" />
            <jsp:param name="category" value="<%= category%>" />
        </jsp:forward>
    </body>
</html>
