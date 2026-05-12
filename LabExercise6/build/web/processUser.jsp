<%-- 
    Document   : processUser
    Created on : 12 May 2026, 4:22:29 pm
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

        <%@page import="java.sql.*"%>
        <%
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String fname = request.getParameter("firstname");
            String lname = request.getParameter("lastname");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Update the port/db name if yours is different
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cse3023", "root", "");

                String query = "INSERT INTO userprofile VALUES (?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, user);
                ps.setString(2, pass);
                ps.setString(3, fname);
                ps.setString(4, lname);

                int n = ps.executeUpdate();
                if (n > 0) {
                    out.println("<h3>Record successfully processed!</h3>");
                    out.println("<a href='login.jsp'>Go to Login Page</a>");
                }
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>
