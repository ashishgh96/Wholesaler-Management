package com.wholesaler.retail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddRetailer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String r_name=request.getParameter("RName");
		String r_username=request.getParameter("RUName");
		String r_password=request.getParameter("RPass");
		String r_contact=request.getParameter("RCont");
		String r_address=request.getParameter("RAdd");
		RequestDispatcher rd=request.getRequestDispatcher("/RetailerRegistration.jsp");
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
		catch(Exception e)
		{
		
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
		
		String insertSQL4 = "INSERT INTO RETAILER_LIST(R_NAME,R_USERNAME,R_PASSWORD,R_CONTACT,R_ADDRESS) "
				+"VALUES('"+r_name+"','"+r_username+"','"+r_password+"','"+r_contact+"','"+r_address+"')";              
		try
		{
			stmt.executeUpdate(insertSQL4);
			message="Retailer registered successfully";
			rd=request.getRequestDispatcher("/Login.jsp");
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
