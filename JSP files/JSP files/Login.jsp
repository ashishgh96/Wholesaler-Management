
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Page</title>
	
	<style>

table {
    border-collapse: collapse;
    width: 100%;
}

th, td 
{
    text-align: left;
    padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: #404040;
    color: white;
}
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
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
	
			<%! String message=null;%>
			<%
				message=(String)request.getAttribute("key");
				if(message==null)
					message="";
			%>
		<h3>	
			<table style="width:100%">
				<tr>
					<th> Wholesaler login</th>
					<th>Retailer login</th>
				</tr>
		</table></h3>
			<div align="center"><font color="RED"><%= message %></font></div>
			<h3><table style="width:100%">
				<td>
				<form action="WLogin" method="post">
					User name&nbsp;&nbsp;<input type="text" name="WUname"><br><br>
					Password&nbsp;&nbsp;<input type="password" name="WPass"><br><br>
					<input class="button" type="submit" value="Login"><br><br>
					<a href="ForgotWholesalerPassword.jsp">Forgot Password?</a>
				</form>
				</td>
				
				<td>
				<br><br>
				<form action="RLogin" method="post">
					User name&nbsp;&nbsp;<input type="text" name="RUname"><br><br>
					Password&nbsp;&nbsp;<input type="password" name="RPass"><br><br>
					<input class="button" type="submit" value="Login"><br><br>
					New User? &nbsp; <a href="RetailerRegistration.jsp">Register</a><br><br>
					<a href="ForgotPassword.jsp">Forgot Password?</a>
				</form>
			
			
				</td>
			</table>
			</h3>
	<div style="footer">
		<%@include file="footer.jsp" %>
	</div>
			
</body>
</html>