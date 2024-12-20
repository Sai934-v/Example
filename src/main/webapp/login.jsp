<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
if(name.equals("dark")&& pwd.equals("mode"))
{
	session.setAttribute("name", name);
%>
<jsp:forward page="Home3.jsp"></jsp:forward>
<%
}
else
{
	out.print("invalid details");
%>
<jsp:include page="home2.jsp"></jsp:include>
<%
}
%>

</body>
</html>

