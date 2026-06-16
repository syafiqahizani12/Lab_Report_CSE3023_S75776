<%-- 
    Document   : schedule
    Created on : 16 Jun 2026, 3:57:02 PM
    Author     : MP2-4
--%>

<%@page import="java.util.List"%>
<%@page import="bean.SessionBean"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DriveSmart Academy</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">   </head>
        <%@ include file="header.html" %>
    <body>
    </<head>

    </head>
    <h2>Session Schedule</h2>

    <table border="1">

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Branch</th>
                    <th>Lesson Type</th>
                    <th>Status</th>
                </tr>
            </thead>

                <%
                    List<SessionBean> list
                            = (List<SessionBean>) request.getAttribute("sessionList");

                    for (SessionBean s : list) {
                %>

                <tr>
                    <td><%= s.getSession_id()%></td>
                    <td><%= s.getStudent_name()%></td>
                    <td><%= s.getBranch_location()%></td>
                    <td><%= s.getLesson_type()%></td>
                    <td><%= s.getStatus()%></td>
                </tr>

                <%
                    }
                %>

        </table>

        <%@ include file="footer.jsp" %>
