package com.wholesaler.seller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher rd=request.getRequestDispatcher("/Orders.jsp");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		//Step 2
		String dbuserId = getServletConfig().getServletContext().getInitParameter("DB_USER");
		String dbpassword = getServletConfig().getServletContext().getInitParameter("DB_PASS");
		String url = getServletConfig().getServletContext().getInitParameter("DB_URL");
		
		Connection con=null;
		try {
			con = DriverManager.getConnection(url, dbuserId, dbpassword);
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		// step 3-
		java.sql.Statement stmt1=null;
		java.sql.Statement stmt2=null;
		java.sql.Statement stmt3=null;
		try
		{
			stmt1=con.createStatement();
			stmt2=con.createStatement();
			stmt3=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//Display data from database
		
		
		String r_code="";
		String msg1="";
		String msg2="";
		String msg3="";
		String sql="SELECT * FROM wholesaler_orders ";
		try
		{
			ResultSet rs=stmt1.executeQuery(sql);
			while(rs.next())
			{
				String a="order_"+rs.getString(1);
				String select = request.getParameter(a);
				if(select!=null)
				{
					r_code=rs.getString(2);
					String sql1="delete from wholesaler_orders where order_id='"+rs.getString(1)+"'";
					stmt2.executeUpdate(sql1);
				
					ResultSet rs1=stmt3.executeQuery("select *from retailer_list");
					while(rs1.next())
					{
						if(r_code.equals(rs1.getString(1)))
						{
							msg1=rs1.getString(2);
							msg2=rs1.getString(5);
							msg3=rs1.getString(6);
							break;
						}
					}
					break;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//step 5-
		try
		{
			con.close();
			stmt1.close();
			stmt2.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		rd=request.getRequestDispatcher("/DeliveryDetails.jsp");
		request.setAttribute("key1",msg1);
		request.setAttribute("key2",msg2);
		request.setAttribute("key3",msg3);
		rd.forward(request, response);

	}

}
