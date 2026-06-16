<%-- 
    Document   : book_session
    Created on : 16 Jun 2026, 3:46:49 PM
    Author     : MP2-4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>DriveSmart Academy</title>
        <%@include file="header.html"%>

    </head>
    <body>
        <div class="container col-md-5">

            <div class="card">

                <div class="card-body">
                    <form action="BookSessionServlet" method="POST">
                        <div class="form-group">
                            <label>Student Name</label> 
                            <input type="text"
                                   name="student_name" required>

                            <br><br>

                            <div class="form-group">
                                <label>Branch Location</label>    
                                <select name="branch_location">

                                    <option>Kuala Lumpur</option>
                                    <option>Penang</option>
                                    <option>Johor</option>

                                </select>

                                <br><br>

                                <div class="form-group">
                                    <label> Lesson Type</label>    

                                    <select name="lesson_type">

                                        <option>Manual Car</option>
                                        <option>Automatic Car</option>
                                        <option>Motorcycle</option>

                                    </select>

                                    <br><br>

                                    <input type="submit"
                                           value="Book Session">
                                    </form>
                                 
                                </div>
                            </div>
                        </div>
                </div>
            </div>

        </div>

   </body>
   <br>
        <%@include file="footer.jsp"%>

</html>
