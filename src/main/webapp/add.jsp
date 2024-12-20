<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTER JSP</title>
</head>
<body>


<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_register","root","saivinnu");
out.println("database connected successfully");


String name=request.getParameter("name");
String fame=request.getParameter("fname");
String uname=request.getParameter("uname");
String date=request.getParameter("date");
String gender=request.getParameter("gender");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String address=request.getParameter("address");
String adhaar=request.getParameter("adhaar");
String ssc=request.getParameter("ssc");
String course=request.getParameter("course");
String tname=request.getParameter("tname");
int tfees = Integer.parseInt(request.getParameter("tfee"));
int pfee = Integer.parseInt(request.getParameter("pfee"));
int dfee = tfees-pfee;



PreparedStatement pst=con.prepareStatement("insert into register value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
PreparedStatement pst1=con.prepareStatement("select * from register where mobile=?");
pst1.setLong(1, Long.parseLong(mobile));

pst.setString(1, name);
pst.setString(2, fame);
pst.setString(3, uname);
pst.setString(4, date);
pst.setString(5, gender);
pst.setString(6, mobile);
pst.setString(7, email);
pst.setString(8, address);
pst.setString(9, adhaar);
pst.setString(10, ssc);
pst.setString(11, course);
pst.setString(12, tname);
pst.setInt(13,tfees);
pst.setInt(14, pfee);
pst.setInt(15, dfee);



int x=pst.executeUpdate();
System.out.println(x+"registed successfully");

ResultSet rs=pst1.executeQuery();
System.out.println("data retrived");
if(rs.next())
{
	PreparedStatement pst2=con.prepareStatement("delete from register where mobile=?" );
	Long mobileNumber= Long.parseLong("mobile");
	pst2.setLong(1, mobileNumber);
	int y=pst2.executeUpdate();
	out.print("register deleted successfully");
}

%>

<jsp:include page="register.jsp"></jsp:include>


<%

out.print("<html><body><table border=1>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString(1)+"</td>");
	out.print("<td>"+rs.getString(2)+"</td>");
	out.print("<td>"+rs.getString(3)+"</td>");
	out.print("<td>"+rs.getString(4)+"</td>");
	out.print("<td>"+rs.getString(5)+"</td>");
	out.print("<td>"+rs.getString(6)+"</td>");
	out.print("<td>"+rs.getString(7)+"</td>");
	out.print("<td>"+rs.getString(8)+"</td>");
	out.print("<td>"+rs.getString(9)+"</td>");
	out.print("<td>"+rs.getString(10)+"</td>");
	out.print("<td>"+rs.getString(11)+"</td>");
	out.print("<td>"+rs.getString(12)+"</td>");
	out.print("<td>"+rs.getString(13)+"</td>");
	out.print("<td>"+rs.getString(14)+"</td>");
	out.print("<td>"+rs.getString(15)+"</td>");
	
	out.print("<td><a href='pay.jsp?duefees="+rs.getString (2)+"'>pay</a></td>");
	out.print("</tr>");
}
out.print("</table></body></html>");

%>


</body>
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>