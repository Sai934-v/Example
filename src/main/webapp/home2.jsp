<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGGING PAGE</title>
<style>

body
{
background: url(Deer199.jpg);
background-repeat: no-repeat;
background-size: cover;
}

.div1
{
border: 2px solid #333;
padding: 2%;
margin-top: 10%;
margin-left: 35%;
margin-right: 45%;
border-radius: 5px;
box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
backdrop-filter: blur(8px);
}

input
{
 padding: 10px 30px;
}



</style>

</head>
<body>


<jsp:include page="home.jsp"></jsp:include>
<div class="div1">

<form action="login.jsp" method="post">

<h1> LOG IN PAGE</h1> <br>

<h4>
<b>USER NAME:</b>
<input type="text" name="name" placeholder="Username"><br><br>

<b>PASSWORD :</b>
<input type="password" name="pwd" placeholder="Password"><br></h4>

<br><input type="submit" value="login">

</form>
</div>
</body>
</html>