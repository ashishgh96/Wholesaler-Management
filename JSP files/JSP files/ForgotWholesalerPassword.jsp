<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
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
			<br><div align="center"><font color="RED"><%= message %></font></div>
	<div align="center"><h2>Reset Password</h2></div>
	<form action="ForgotW" method="post">
		<table border="0" cellspacing="10" align="center">
					<tr>
						<td> Enter Wholesaler User ID</td>
						<td> <input type="Text" name="WID" ></td>
					</tr>
					<tr>
						<td> Enter New Password</td>
						<td> <input type="password" name="WPassword" ></td>
					</tr>				
					<tr>
						<td colspan="2" align="center"> </td>
						<td><input type="Submit" value="submit"/>
						<a href="Login.jsp"><input type="button" value="Cancel"/></a></td>
					</tr>
		</table>
	</form>
	
	
	<div style="footer">
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>