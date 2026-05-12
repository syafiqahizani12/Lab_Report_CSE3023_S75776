<%-- 
    Document   : main
    Created on : 12 May 2026, 4:24:45 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Main Page</title></head>
    <body>
        <h2>Login Successful!</h2>
        <h3>User Details:</h3>
        <p><b>Username:</b> <%= session.getAttribute("sess_user")%></p>
        <p><b>First Name:</b> <%= session.getAttribute("sess_fname")%></p>
        <p><b>Last Name:</b> <%= session.getAttribute("sess_lname")%></p>
        <br>
        <a href="login.jsp">Logout</a>
    </body>
</html>