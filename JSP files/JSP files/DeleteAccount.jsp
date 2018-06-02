<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Account</title>
</head>
<body>
	<div style="header">
		<%@include file="header.jsp" %>
	</div>
	<form action="DeleteAccountS" method="post">
		<div align="center">
			<font color="RED" size="3">Are you sure to delete your account?</font>
		</div>
		<input type="submit" value="YES">&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="LogoutUser.jsp"><input type="button" value="NO"></a>
	</form>
		
	<div style="footer">
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>