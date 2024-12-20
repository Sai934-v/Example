<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DUEE FEES</title>
</head>
<body>

<style>
body
{
background: url(Deer199.jpg)
}

.div1
{

backdrop-filter: blur(8px);
padding-top:3%;
width: 100%;


font-size: 200%;

}

</style>




<jsp:include page="home.jsp"></jsp:include>
<div class=div1>

<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_register","root","saivinnu");


PreparedStatement st=con.prepareStatement("select * from register");
ResultSet rs=st.executeQuery();
out.print("<html><body><table border=1>");
out.println("<tr><th>Name</th><th>Father name</th><th>Mother name </th><th> date of birth </th><th> gender </th><th> mobile  </th><th> email </th><th>  address</th><th> adhaar  </th><th> SSC </th><th> course</th><th> Trainer</th><th>total fee</th><th>paid fee</th><th>due fee </th><th>pay </th><th> delete </th></tr>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString("name")+"</td>");
	out.print("<td>"+rs.getString("fname")+"</td>");
	out.print("<td>"+rs.getString("uname")+"</td>");
	out.print("<td>"+rs.getString("date")+"</td>");
	out.print("<td>"+rs.getString("gender")+"</td>");
	out.print("<td>"+rs.getString("mobile")+"</td>");
	
	out.print("<td>"+rs.getLong("email")+"</td>");
	
	out.print("<td>"+rs.getString("address")+"</td>");
	out.print("<td>"+rs.getString("adhaar")+"</td>");
	
	out.print("<td>"+rs.getLong("scc")+"</td>");
	
	out.print("<td>"+rs.getString("course")+"</td>");
	out.print("<td>"+rs.getString("tname")+"</td>");
	out.print("<td>"+rs.getString("tfee")+"</td>");
	out.print("<td>"+rs.getString("pfee")+"</td>");
	out.print("<td>"+rs.getString("dfee")+"</td>");
	
	out.print("<td><a href='pay.jsp?duefees="+rs.getString (2)+"'>pay</a></td>");
	out.print("<td><a href='delete.jsp?duefees="+rs.getString (2)+"'>delete</a></td>");
	out.print("</tr>");
}
out.print("</table></body></html>");

%>
</div>

</body>
</html>