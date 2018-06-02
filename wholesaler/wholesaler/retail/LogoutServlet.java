package com.wholesaler.retail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		session.removeAttribute("user_id");
		session.removeAttribute("user_name");
		session.removeAttribute("user_contact");
		session.removeAttribute("user_address");
		session.invalidate();
		response.sendRedirect("Login.jsp");
	}

}
