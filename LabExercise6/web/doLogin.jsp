<%@page import="java.sql.*"%>
<%@page language="java"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    Connection conn = null; // Declare it outside to close it later
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Step 2: Establish connection (Using your port 3307 and DB name CF3107)
        String myURL = "jdbc:mysql://localhost:3307/cse3023"; 
        conn = DriverManager.getConnection(myURL, "root", "");
        
        // Step 3: Prepare and Execute Query
        String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Success: Store data in session and redirect to main.jsp
            session.setAttribute("sess_user", rs.getString("username"));
            session.setAttribute("sess_fname", rs.getString("firstname"));
            session.setAttribute("sess_lname", rs.getString("lastname"));
            response.sendRedirect("main.jsp");
        } else {
            // Failure: Redirect back to login.jsp with error message
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Step 5: Always close the connection
        if (conn != null) {
            conn.close();
        }
    }
%>