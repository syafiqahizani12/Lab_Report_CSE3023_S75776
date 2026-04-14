<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Membership Fee Calculator</title>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <h2>Membership Fee Calculator</h2>

        <!-- Form Input -->
        <form method="post">
            Number of Activities:
            <input type="number" name="activities" required>
            <br><br>
            <input type="submit" value="Calculate">
        </form>

        <hr>

        <%
            // Check kalau user dah submit form
            if (request.getParameter("activities") != null) {

                int activities = Integer.parseInt(request.getParameter("activities"));

                double feePerActivity = 10.0;
                double totalFee = activities * feePerActivity;

                // format 2 decimal places
                java.text.DecimalFormat df = new java.text.DecimalFormat("0.00");
        %>

        <h3>Total Fee: RM <%= df.format(totalFee)%></h3>

        <%
            }
        %>

    </body>
    <%@include file="footer.jsp"%>

</html>