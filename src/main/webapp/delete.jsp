<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Data</title>
</head>

<style>

body {
	background-image: url(Deer199.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	
}

.div1
{
border: 2px solid #333;
margin-left: 35%;
margin-right: 40%;
padding: 3%;
margin-top: 15%;
box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
backdrop-filter: blur(8px);

}

input {
	width: 200px;
  padding: 10px 15px;
   /* Green border */
  border-radius: 5px ; /* Rounded corners for left side */
  outline: none;
  font-size: 16px;
  transition: border-color 0.3s;
}




</style>


<body>

<div class=div1>

    <h1>Delete Student</h1>
    <form method="post">
       <b> Name:</b><br>
        <input type="text" name="name" id="name" required><br>
        <button type="submit">Delete</button><br><br>
    </form>

    <% 
        String studentName = request.getParameter("name");
        if (studentName != null && !studentName.trim().isEmpty()) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_register", "root", "saivinnu");

                // Create SQL query to delete data
                String sql = "DELETE FROM register WHERE name = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, studentName.trim());

                // Execute the query
                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p style='color:green;'>Record deleted successfully!</p>");
                } else {
                    out.println("<p style='color:red;'>No record found with the name: " + studentName + "</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        }
    %>
       <a href="DUEFEES.jsp">DUE FEE PAGE</a>
</div>
</body>
</html>