<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH PAGE</title>
</head>
<style>
 body
 {
 background-image: url(Deer199.jpg);
 background-repeat: no-repeat;
 background-size: cover;
 }
 
 h2{
 
 padding: 3%;
 padding-left: 33%;
 border: 2px solid #333;
 border-radius: 15px;
 font-size: 250%;
 box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
backdrop-filter: blur(8px);
 
 }

h1
{
text-align: center;
font-size: 500%;
}
</style>




<body>

<h1>Search Results</h1>

<h2>
   <%
   
       
   try {
	    // Load the MySQL driver
	    Class.forName("com.mysql.cj.jdbc.Driver");

	    // Establish the connection
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_register", "root", "saivinnu");
	    

	    // Prepare the SQL query
	    PreparedStatement st = con.prepareStatement("SELECT * FROM register");
	    ResultSet rs = st.executeQuery();

	    // Check if there are results
	    if (!rs.isBeforeFirst()) {
	        out.println("<p>No students found in the database.</p>");
	    } else {
	        // Display the results in a table
	        out.println("<table border='1'>");
	        out.println("<tr><th>Mobile</th><th>Name</th><th>Course</th></tr>");
	        while (rs.next()) {
	            out.println("<tr>");
	            out.println("<td>" + rs.getLong("mobile") + "</td>");
	            out.println("<td>" + rs.getString("name") + "</td>");
	            out.println("<td>" + rs.getString("course") + "</td>");
	            out.println("</tr>");
	        }
	        out.println("</table>");
	    }

	    // Close the ResultSet and PreparedStatement
	    rs.close();
	    st.close();
	    con.close();
	} catch (Exception e) {
	    out.println("<p>Error: " + e.getMessage() + "</p>");
	}
   
 
   
	%>
	<a href="Home3.jsp">Back to Search</a>

</h2>


</body>
</html>