<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTRATION FORM</title>
<style>

body
{
background-image: url("Deer199.jpg");

}



.div1
{
border: 2px solid #333;
padding: 2%;
border-radius: 15px;
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

.div2{

	float: left;
	padding-left: 30%;

}

.div3{
	
	padding-right: 30%;
	float: right;

}
	
.div4
{
padding-top: 30%;
text-align: center;
}

h1
{
text-align: center;

}

</style>
</head>
<body>

<%
String name = (String) session.getAttribute("name");
if (name == null) {
    out.print("please login first");
    %>
    <jsp:include page="home2.jsp"></jsp:include>
    <%
} else {
%>  

    <body>
        <jsp:include page="home.jsp"></jsp:include>
       
         
     
<div class="div1">

   <h1><b>STUDENT REGISTRATION </b></h1>
            <form action="add.jsp">
            <div class="div2">
                <label><b>Name</b></label><br>
                <input type="text" name="name" placeholder="Name"><br><br>
                
                  <label><b> Father name </b></label><br>
                <input type="text" name="fname" placeholder="fathername"> <br><br>
                
                 <label><b> Mother </b></label><br>
                <input type="text" name="uname" placeholder="mothername"> <br><br>
                
                 <label><b>DATE OF BIRTH</b></label><br>
                <input type="date" placeholder="date" name="date"><br><br>
                
                 <label><b>GENDER:</b></label><br>
                 <select id="gender" name="gender">
                 <option value="male">Male</option>
                 <option value=" female">Female</option>
                 
                 
                 </select><br><br>
           
                
                
                 <label><b>Mobile</b></label><br>
                <input type="text" name="mobile" placeholder="Number"><br><br>
                
                 <label><b> E-mail </b></label><br>
                <input type="text" name="email " placeholder=" E-mail "> <br><br>
                
                </div>
                
                <div class="div3">
                
                 <label><b> ADDRESS </b></label><br>
                <input type="text" name="address" placeholder="ADDRESS"> <br><br>
                
                 <label><b>ADHAAR No</b></label><br>
                <input type="number" name="adhaar" placeholder="ADHAAR NO"><br><br>
                
                       
                
                <label> <b>SCC HALLticket</b></label><br>
                <input type="number" name="scc" placeholder="SSC NO"><br><br>
                
                
                <label for="course"> <b>Course Name</b></label><br>      
                <select id="course" name="course" >
                    <option value="c">C</option>
                    <option value="python">Python</option>
                    <option value="c++">C++</option>
                    <option value="java core">Java core</option>
                    <option value="java adv">Java Adv</option>
                    <option value="AI">AI</option>
                    <option value="Data scince"> DATA SCINCE</option>
                    <option value="MySql"> Mysql</option>
                    <option value="Php">PHP</option>
                </select><br><br>
                
               
                
                <label><b>Trainer name</b></label><br>
                <input type="text" name="tname" placeholder="trainer Name"><br><br>
                
                <label><b>Total fee </b></label><br>
                <input type="text" name="tfee" placeholder="total fee" pattern="\d*"><br><br>
                
                <label><b>Paid fee</b></label><br>
                <input type="text" name="pfee" placeholder="paid fee" pattern="\d*" title="Please enter only numbers" required><br><br>
                
               </div>

            <div class="div4">    
                <input type="submit" value="submit">
                
                </div>
            </form>
 </div>
<% } %>

</body>
</html>