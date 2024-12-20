<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
</head>

<style>

body{
background-image: url(Deer199.jpg);
background-repeat: no-repeat;
background-size: cover;

}

.div1
{
border: 2px solid #333;
margin-left: 35%;
margin-right: 40%;
padding: 3%;
margin-top: 15%;
box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
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


</style>

<body>
    
    <div class=div1>
    
        <h1>PAYMENT AMOUNT</h1>
        <form method="post">
           <b> Name:</b><br>
            <input type="text" name="name" placeholder="Enter name"><br><br>
           <b> Enter Amount:</b><br>
            <input type="number" name="pay" placeholder="Enter amount"><br><br>
            <button type="submit">Submit</button>
        </form>
 

    <% 
    
    try {
        out.println("Form submitted successfully.<br>");

        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Debugging: Output parameter values
            String name = request.getParameter("name");
            String payParam = request.getParameter("pay");
            out.println("Received Name: " + name + "<br>");
            out.println("Received Amount: " + payParam + "<br>");

            if (name == null || name.isEmpty() || payParam == null || payParam.isEmpty()) {
                out.println("Error: Name and amount are required.<br>");
            } else {
                int pay = Integer.parseInt(payParam);

                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud_register", "root", "saivinnu");
                out.println("Database connected successfully.<br>");

                PreparedStatement pst = con.prepareStatement("SELECT pfee, dfee FROM register WHERE name = ?");
                pst.setString(1, name);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    int currentPaid = rs.getInt("pfee");
                    int currentDue = rs.getInt("dfee");
                    out.println("Current Paid: " + currentPaid + ", Current Due: " + currentDue + "<br>");

                    if (pay <= currentDue) {
                        int newPaid = currentPaid + pay;
                        int newDue = currentDue - pay;

                        PreparedStatement updatePst = con.prepareStatement("UPDATE register SET pfee = ?, dfee = ? WHERE name = ?");
                        updatePst.setInt(1, newPaid);
                        updatePst.setInt(2, newDue);
                        updatePst.setString(3, name);

                        int rows = updatePst.executeUpdate();
                        if (rows > 0) {
                            out.println("Payment updated successfully for " + name + ".<br>");
                            out.println("New Paid Fee: " + newPaid + ", New Due Fee: " + newDue + "<br>");
                        } else {
                            out.println("Failed to update fees.<br>");
                        }

                        updatePst.close();
                    } else {
                        out.println("Error: Payment exceeds the due amount.<br>");
                    }
                } else {
                    out.println("Error: No student found with the name " + name + ".<br>");
                }

                rs.close();
                pst.close();
                con.close();
            }
        } else {
            out.println("Error: Request method is not POST.<br>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage() + "<br>");
    }
    %>
    <a href="DUEFEES.jsp">DUE FEE PAGE</a>
    </div>
</body>
</html>