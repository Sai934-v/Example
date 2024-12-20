<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ENQUIRY FORM</title>
<style >

body
{
background: url(Deer199.jpg);

}

.div1
{
border: 2px solid #333;
backdrop-filter: blur(8px);
width:30%;
margin: auto;
border-radius: 10px;
padding: 2%;
padding-top: 3%;

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
h1
{
text-align: center;

}

</style>


</head>
<body>

<%
String name=(String)session.getAttribute("name");
if(name==null)
{
	out.print("please login first");
	%>
	<jsp:include page="home2.jsp"></jsp:include>
	<%
}
else
{
%>	


<jsp:include page="home.jsp"></jsp:include>

<div class="div1">
<h1> ENQUIRY</h1>


<form action="enquiry2.jsp">

<b> Name :</b><br>
<input type="text" name="name" placeholder="Name"><br><br>
 
<b> Mobile:</b><br> 
<input type="number" name="mobile" placeholder="Number"><br><br>

<b> Course: </b><br>
<select id="course" name="course">

		
                    <option value="c">C</option>
                    <option value="python">Python</option>
                    <option value="c++">C++</option>
                    <option value="java core">java core</option>
                    <option value="java adv">javaadv</option>
                    <option value="AI">AI</option>
                    <option value="Data scince"> DATA SCINCE</option>
                    <option value="MySql"> Mysql</option>
                    <option value="Php">PHP</option>
   
                
 </select>
 <br><br>
 
 <b>Insti fee:</b> <br>
<input id="test" type="number" name=" tfee" placeholder="total fee"><br><br>

<input type="submit" value="submit">

<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/darkmode","root","saivinnu");


PreparedStatement st=con.prepareStatement("select * from enquiry");
ResultSet rs=st.executeQuery();
out.print("<html><body><table border=1>");
out.println("<tr><th>Name</th><th> mobile</th><th>coures</th><th>Fees </th></tr>");
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getString(1)+"</td>");
	out.print("<td>"+rs.getString(2)+""+"</td>");
	out.print("<td>"+rs.getString(3)+"</td>");
	out.print("<td>"+rs.getString(4)+"</td>");

	out.print("</tr>");
}
out.print("</table></body></html>");}

%>



</form>
</div>

</body>
</html>