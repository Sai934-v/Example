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
HttpSession session2=request.getSession(false);
if(session.getAttribute("name")!=null)
{
out.print("welcome to my page");
%>
<jsp:include page="register.jsp"></jsp:include>
<% 
}
else
{
	out.print("please login first");

%>
<jsp:include page="login.jsp"></jsp:include>
<% 
}
%>
</body>
</html>