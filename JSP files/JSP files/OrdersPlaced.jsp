<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders Placed</title>
<style>

table {
    border-collapse: collapse;
    width: 70%;
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
	 <h3><div align="right">Welcome,<a href="LogoutUser.jsp"><%=msg  %></a>&nbsp;&nbsp;</div></h3>
	 <ul>
  	<li><a class="active" href="RetailerHome.jsp">Home</a></li>
</ul>
	 <%

String dbuserId = getServletConfig().getServletContext().getInitParameter("DB_USER");
String dbpassword = getServletConfig().getServletContext().getInitParameter("DB_PASS");
String url = getServletConfig().getServletContext().getInitParameter("DB_URL");
            Connection connection = DriverManager.getConnection(url, dbuserId, dbpassword);
            Statement statement = connection.createStatement();
            Statement statement1 = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select *from order_details");
     %>
       <%String p_name="";
         String p_rate=""; 
       %>
		<div align="center">
		<h2>Please confirm your order:</h2>
		<br><br>
		
	 <TABLE BORDER="1">
            <TR>
            	<th>Sl. no.</th>
                <TH>Order ID</TH>
                <TH>Retailer ID</TH>
                <TH>Product ID</TH>
                
                <TH>Product Name</TH>
                <TH>Product Rate</TH>
                <th>Product Quantity</th>
                <th>Amount</th>
            </TR>
            <%double total=0.0;int count=1; %>
            <% while(resultset.next()){%>
          
            <TR>
            	<td><%=count %>.</td>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                
                <% ResultSet rs = statement1.executeQuery("select *from products where p_ID='"+resultset.getString(3)+"'"); %>
                <%if(rs.next())
                {
                		p_name=rs.getString(2);
                		p_rate=rs.getString(3);
                }
                %>
                	<td><%= p_name%></td>
                    <td>Rs.<%= p_rate%></td>
                    <td><%=resultset.getString(4) %></td>
                    <%Double price=Double.parseDouble(resultset.getString(4))*(Double.parseDouble(p_rate)); %>
                    <td>Rs.<%=price %></td>
            </TR>
          
            <%total=total+(Double.parseDouble(resultset.getString(4))*(Double.parseDouble(p_rate))); %>
             <%count=count+1;} %>
            <%statement.close();
            connection.close();
            %>
        </TABLE>
        <br>
        
     	<table border="0" cellspacing="14" align="center">
     	<h4> <tr><td>Total cost=</td><td>Rs.<%=total %></td></tr>
     						<%double tax=0.09*total; %>
     							<tr><td>Applicable Tax (@9.00%)=</td><td>Rs.<%=tax %></td></tr>
     							<%total=total+tax; %>
     		</h4>
     	</table>
     	<hr width="70%">
     	<table border="0" cellspacing="14" align="center">	
     							<tr><td>Total payable amount=</td><td>Rs.<%=total %></td></tr>
     	
     	</h4>
     	</table>
     	<br><br>
     	
        <table border="0" cellspacing="10" align="center">
				<tr><td><h3>Delivery details:</h3></td><td></td></tr>
					<tr>
						<td> Name:</td>
						<td> <input type="Text" value="<%=session.getAttribute("user_name") %>" disabled ></td>
					</tr>
					<tr>
						<td> Contact number:</td>
						<td> <input type="Text" value="<%=session.getAttribute("user_contact") %>"  disabled/></td>
					</tr>
					<tr>
						<td> Delivery Address:</td>
						<td> <input type="text" value="<%=session.getAttribute("user_address") %>" disabled>	</td>
					</tr>
		</table>
        <br>
        <%if (total>0.0) {%>
        
       		<a href="Payment.jsp"><input class="button" type="submit" value="Confirm Delivery Details"/></a>
           
        <%} %>
        &nbsp;&nbsp;
        <a href="RetailerHome.jsp"><input class="button" type="button" value="Add more items"></a>
        <form action="CANCEL_ORDER" method="post">
       		<input class="button" type="submit" value="Empty Cart"/>
        </form>    
	</div>
	<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
	
</body>
</html>