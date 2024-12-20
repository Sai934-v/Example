
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ENQUIRY JSP</title>
</head>
<body>

<%


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/darkmode","root","saivinnu");
out.println("database connected successfully");

	
String name=request.getParameter("name");
String mobile=request.getParameter("mobile");
String course=request.getParameter("course");
String fees=request.getParameter(" fees");

PreparedStatement pst=con.prepareStatement("insert into enquiry value(?,?,?,?)");
pst.setString(1, name);
pst.setString(2, mobile);
pst.setString(3, course);
pst.setString(4, fees);

int x=pst.executeUpdate();
out.print(x+"added successfully");



%>

<jsp:include page="enquiry.jsp"></jsp:include>





</body>
</html>