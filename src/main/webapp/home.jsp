<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME PAGE</title>
<style>

body
{

background-image: url(Deer199.jpg);
background-repeat: no-repeat;
background-size: cover;

}

ul
{
list-style-type:none;
width:auto;
text-align:center;
background-color: lightblue ;
margin: auto;
border-radius: 15px;
height:50px;
padding-top: 15px;
font-size: 150%;
}



li
{
float: left;
padding-left:50px;

}

li a
{

color: black;
text-decoration: none;
border:300px;
border-radius: 8px;


}

li a:hover
{
background-color: white;
padding: 10px 20px;
box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
transition: all 0.6s ease;

}


.search-container
{
  display: flex;
  justify-content: center;
  align-items: center;
}

/* Styling the input field */
.search-input {
  width: 300px;
  padding: 10px 15px;
   /* Green border */
  border-radius: 5px ; /* Rounded corners for left side */
  outline: none;
  font-size: 16px;
  transition: border-color 0.3s;
}

/* Adding hover and focus effects to input field */
.search-input:focus {
  border-color: #1E90FF; /* Blue border on focus */
}

/* Styling the search button */
.search-button {
  background-color: lightgreen; /* Green background */
  color: black;
  border: 2px solid #333;
  padding: 10px 30px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 5px; /* Rounded corners for right side */
  transition: background-color 0.3s;
}

/* Adding hover effect to the button */
.search-button:hover {
  background-color: lightblue; /* Darker green on hover */
}

/* Responsive design for smaller screens */
@media (max-width: 30px) {
  .search-input {
    width: 30px;
  }

  .search-button {
    padding: 10px 150px;
  }
}



</style>
</head>
<body>

	 <ul>
	 
          <li><a href="home2.jsp"><img alt="loging" src="log1.jpg" height="30px" width="30px"></a></li>
          
          <li><a href="Home3.jsp"><b> Home</b></a></li>
          <li><a href="register.jsp"><b> Register</b></a></li>
          <li><a href="enquiry.jsp"> <b>Enquiry</b> </a></li>
          <li><a href="DUEFEES.jsp"><b> Due Fee </b></a></li>
          
          
           <form action="search.jsp" method="post">
          <input type="text" class="search-button" placeholder="Search Here..." id="name"> 
          	<button class="search-button">search</button>
          </form>
          
      </ul>
      
      
</body>
</html>