<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Retailer Registration</title>
<style>

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #404040;
    color: white;
}

.button {
    background-color: #4CAF50; /* Green */
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
	<div align="center">
			<h1>Please enter registration details: </h1>
			<form action="NewRetailer" method="post">
				<table border="0" cellspacing="10" align="center">
					
					<tr>
						<td> Enter Name</td>
						<td> <input type="Text" name="RName" ></td>
					</tr>
					<tr>
						<td> Enter User Name</td>
						<td> <input type="Text" name="RUName" ></td>
					</tr>
					<tr>
						<td> Enter Password</td>
						<td> <input type="Password" name="RPass"> </td>
					</tr>
					
					<tr>
						<td> Enter Contact number</td>
						<td> <input type="Text" name="RCont" ></td>
					</tr>		
					<tr>
						<td> Enter Address</td>
						<td> <TextArea name="RAdd" row="20"></TextArea>	</td>
					</tr>			
					<tr>
						<td colspan="2" align="center"> </td>
						<td><input class="button" type="Submit" value="submit"/>
						<input class="button" type="reset" value="Reset"/>
						<a href="Login.jsp"><input class="button" type="button" value="Cancel"/></a></td>
					</tr>
				</table>
			</form>
		</div>
		<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
</body>
</html>