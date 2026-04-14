<%-- 
    Document   : memberDirectory
    Created on : 14 Apr 2026, 3:37:24 pm
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Directory</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Member Directory Page</h1>

        <table>
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Matric Number</th>
                <th>Club</th>
            </tr>
            <%
                // Retrieve the list from the session
                ArrayList<String[]> memberList = (ArrayList<String[]>) session.getAttribute("memberList");

                if (memberList != null && !memberList.isEmpty()) {
                    int count = 1;
                    for (String[] member : memberList) {
            %>
            <tr>
                <td><%= count++%></td>
                <td><%= member[0]%></td>
                <td><%= member[1]%></td>
                <td><%= member[2]%></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">No members registered yet.</td>
            </tr>
            <%
                }
            %>
        </table>


        <%@ include file="footer.jsp" %>

    </body>
</html>