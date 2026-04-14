<%-- 
    Document   : registerClub
    Created on : 14 Apr 2026, 4:07:16 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page </title>
    </head>
    <body>
        
                <%@include file="header.jsp"%>
<h1>Student Registration Form</h1>
  
        <form id="registerClub" action="processRegistration.jsp" method="post" >
            <fieldset> 
               
                 
                <legend>Member Registration</legend>
                <table> 
                    <tr>

                        <td>Student Name </td>
                        <td><input type="text" id="stuName" name="stuName" size="15" placeholder="Name"></td> 
                    </tr>
                    <td>Matric Number </td>
                        <td><input type="text" id="matricNo" name="matricNo" size="15" placeholder="Matric Number"></td> 
                    </tr>
                    <tr>
                        <td>Selected Club </td>
                        <td>
                            <select name="club">
                                <option>BasketBall Club</option>
                                <option>Performing Arts Club</option>
                                <option>Green Earth Club</option>
                                <option>Community Service Club/option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br>


                            <input type="submit" value="Submit">
                            <input type="reset" value="Cancel">  
                        </td>
                    </tr>
                    </table> 
                        </fieldset>
                        </form>
                        <%@include file="footer.jsp"%>

    </body>
</html>
