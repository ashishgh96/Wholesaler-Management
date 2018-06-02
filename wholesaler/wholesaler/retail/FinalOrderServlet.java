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
public class FinalOrderServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		RequestDispatcher rd=request.getRequestDispatcher("/RetailerHome.jsp");
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
		try
		{
			stmt1=con.createStatement();
			stmt2=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//Display data from database
		
		String sql="SELECT *FROM products";
		try
		{
			ResultSet rs=stmt1.executeQuery(sql);
			while(rs.next())
			{
				String r_qty=request.getParameter("qty_"+rs.getString(1));
				String select = request.getParameter("prod_"+rs.getString(1));
				String code=session.getAttribute("user_code").toString();
				if(select!=null)
				{
					String sql1="insert into order_details(retailer_id,product_id,prduct_qty) values('"+code+"','"+rs.getString(1)+"','"+r_qty+"')";
					stmt2.executeUpdate(sql1);
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
		rd=request.getRequestDispatcher("/OrdersPlaced.jsp");
		rd.forward(request, response);
	}
}
