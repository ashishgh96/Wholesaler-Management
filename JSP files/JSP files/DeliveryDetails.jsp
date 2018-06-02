<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="header">
	
		<%@include file="header.jsp" %>
	</div>
	<%String msg="";
try
{
	if(session.getAttribute("user_id")==null)
		msg="Sign In";
	else
		msg=session.getAttribute("user_name").toString();
}
catch(Exception e){}
if("Sign In".equals(msg))
	response.sendRedirect("Login.jsp");
	 %>
	<form action="LogoutW" method="post">
	<div align="right">  <input class="button" type="submit" value="Logout"></a></div>
	</form>
	<ul>
  <li><a class="active" href="WholesalerHome.jsp">Home</a></li>
  <li><a href="RList.jsp">Retailer's List</a></li>
  <li><a href="Orders.jsp">Order list</a></li>
  <li><a href="Items.jsp">Items list</a></li>
</ul>
			<%! String msg1=null;
				String msg2=null;
				String msg3=null;%>
			<%
			msg1=(String)request.getAttribute("key1");
			msg2=(String)request.getAttribute("key2");
			msg3=(String)request.getAttribute("key3");
				
			%>
			Selected Items would be delivered to: <br><br>
			Name:<%=msg1 %><br>
			Contact details:<%= msg2 %><br>
			Address:<%=msg3 %><br>
			<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
			
</body>
</html>