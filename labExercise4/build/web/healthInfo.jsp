<%-- 
    Document   : healthInfo
    Created on : 21 Apr 2026, 3:59:06 pm
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Info</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="container">
            <div class="card">

                <h2>BMI Categories</h2>

                <%
                    ArrayList<String> categories = new ArrayList<>();

                    categories.add("Underweight (< 18.5)");
                    categories.add("Normal (18.5 - 25)");
                    categories.add("Overweight (> 25)");
                %>

                <table cellpadding="10">
                    <tr>
                        <th>No</th>
                        <th>Category</th>
                    </tr>

                    <%
                        for (int i = 0; i < categories.size(); i++) {
                    %>
                    <tr>
                        <td><%= i + 1%></td>
                        <td><%= categories.get(i)%></td>
                    </tr>
                    <%
                        }
                    %>

                </table>

            </div>
        </div>

        <%@ include file="footer.jsp" %>

    </body>
</html>