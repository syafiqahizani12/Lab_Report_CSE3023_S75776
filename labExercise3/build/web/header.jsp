<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Header Page</title>

        <style>
            header {
                background-color: pink;
                padding: 20px;
                text-align: center;
                font-size: 18px;
                color: black;
            }
        </style>

    </head>

    <body>

        <header>
            <h1>Student Club Registration System</h1>
            </header>
            <nav style="padding:20px;background-color: green">
                <a href="registerClub.jsp" style="color:white; margin-right:15px;">Registration</a>
                <a href="feeCalculator.jsp" style="color:white; margin-right:15px;">Fee Calculator</a>
                <a href="memberDirectory.jsp" style="color:white;">Member Directory</a>
            </nav>
        

    </body>
</html>