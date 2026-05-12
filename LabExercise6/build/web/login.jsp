<%-- 
    Document   : login
    Created on : 12 May 2026, 4:23:20 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Login Page</title></head>
    <body>
        <h2>Login to System</h2>
        <%-- Requirement 6: Display failure message --%>
        <% if(request.getParameter("msg") != null) { %>
            <p style="color:red;"><%= request.getParameter("msg") %></p>
        <% } %>

        <form action="doLogin.jsp" method="POST">
            Username: <input type="text" name="username" required><br><br>
            Password: <input type="password" name="password" required><br><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
