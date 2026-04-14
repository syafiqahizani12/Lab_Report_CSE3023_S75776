<%-- 
    Document   : processRegistration
    Created on : 14 Apr 2026, 2:51:16 pm
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Details</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>The Result!!</h1>

        <fieldset>
            <%
                //define variables..
                String myname = request.getParameter("stuName");
                String mymatric = request.getParameter("matricNo");
                String myclub = request.getParameter("club");
                // <!-- use request.getParameter() method to retrieve data from the form in memberRegister.jsp--> 
                ArrayList<String[]> memberList = (ArrayList<String[]>) session.getAttribute("memberList");

                if (memberList == null) {
                    memberList = new ArrayList<String[]>(); // Create new list if it's the first registration
                }

                if (myname != null && mymatric != null) {
                    memberList.add(new String[]{myname, mymatric, myclub});
                }

                session.setAttribute("memberList", memberList);


            %>
            <!-- display the output -->
            <p>Thank you for registering as a <%= myclub%> member!</p>
            <p>This is your details:</p>
            <p>Name : <%= myname%></p>
            <p>Matric Number : <%= mymatric%></p>
            <p>Choosen Club: <%= myclub%></p>
        </fieldset>
    </body>
</html>