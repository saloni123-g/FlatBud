package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conn.ConnectionProvider;

@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String name= request.getParameter("name");
		String address = request.getParameter("address");
		String mobile= request.getParameter("mobile");
		String email= request.getParameter("email");
		String salary= request.getParameter("salary");
		System.out.println("Email ID: "+email);
		//System.out.println("Password :  "+password);
		
		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `emp_details`(`name`, `address`, `email`, `mobile`, `salary`) VALUES ('"+name+"', '"+address+"','"+email+"','"+mobile+"','"+salary+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Insertion Done");
				response.sendRedirect("ViewEmployee.jsp?Done");

			}
			else 
			{
				System.out.println("Insertion fail");
				response.sendRedirect("AddEmployee.jsp?fail=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}