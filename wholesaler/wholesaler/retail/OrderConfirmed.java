package com.wholesaler.retail;

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
import javax.servlet.http.HttpSession;

public class OrderConfirmed extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		RequestDispatcher rd=request.getRequestDispatcher("/Payment.jsp");
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
		String sql1="select * from order_details ";
		try
		{
			ResultSet rs1=stmt1.executeQuery(sql1);
			
			while(rs1.next())
			{
				String sql2="insert into wholesaler_orders(order_id,retailer_id,product_id,product_qty) values('"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"')";
				stmt2.executeUpdate(sql2);
				
			}
			String sql3="delete from order_details where retailer_id='"+session.getAttribute("user_code")+"'";
			stmt3.executeUpdate(sql3);
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
			stmt3.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		if(request.getParameter("pay").equals("Credit/Debit cards"))
			rd=request.getRequestDispatcher("/CardPayment.jsp");
		else if(request.getParameter("pay").equals("Netbanking"))
			rd=request.getRequestDispatcher("/Netbanking.jsp");
		else if(request.getParameter("pay").equals("Cash on delivery"))
			rd=request.getRequestDispatcher("/OrderConfirmed.jsp");
		rd.forward(request, response);
	}
}
