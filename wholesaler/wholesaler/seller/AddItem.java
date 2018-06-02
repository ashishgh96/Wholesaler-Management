package com.wholesaler.seller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String i_name=request.getParameter("IName");
		String i_price=request.getParameter("IPrice");
		String i_brand=request.getParameter("IBrand");
		String i_details=request.getParameter("IDetails");
		String iUOM=request.getParameter("IUOM");
		RequestDispatcher rd=request.getRequestDispatcher("/AddItem.jsp");
		String message=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
				
		//STEP 2   CREATE THE CONNECTION
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
		
		
		// STEP 3- CREATE THE STATEMENT
		java.sql.Statement stmt=null;
		try
		{
			stmt=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
				
		// STEP 4 EXECUTE THE QUERY
		
		//INSERTION
		String insertSQL4 = "INSERT INTO products(P_NAME,P_COST,p_brand,p_details,p_uom) "
				+"VALUES('"+i_name+"','"+i_price+"','"+i_brand+"','"+i_details+"','"+iUOM+"')";              
		try
		{
			stmt.executeUpdate(insertSQL4);
			message="Item added successfully";
			rd=request.getRequestDispatcher("/Items.jsp");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//STEP 5-  RELEASE THE QUERY 

		try
		{
			con.close();
			stmt.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		request.setAttribute("key",message);
		rd.forward(request, response);
	}
}
