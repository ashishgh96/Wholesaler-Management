
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Card details</title>
<style>
.button 
{
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 18px;
    margin: 4px 2px;
    cursor: pointer;
    background-color: #555555;
}
</style>
</head>
<body>

<div style="header">
	
		<%@include file="header.jsp" %>
	</div>
	<div align="center">
	<h4><b>Enter card details:</b></h4>
	</div><br><br>
	 <table border="0" cellspacing="10" align="center">
				
					<tr>
						<td> Enter card number:</td>
						<td><input type="text" ></td>
					</tr>
					<tr>
						<td> Enter date of expiry(mm-yyyy):</td>
						<td><input type="text" ></td>
					</tr>
					<tr>
						<td>Enter CVV:</td>
						<td><input type="password"></td>
					</tr>
	
	</table>
	<div align="center">
	<a href="OrderConfirmed.jsp" ><input class="button" type="button" value="Proceed"></a>
	<a href="OrdersPlaced.jsp"><input class="button" type="button" value="Cancel"></a>
	</div>
	<div style="footer">
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>