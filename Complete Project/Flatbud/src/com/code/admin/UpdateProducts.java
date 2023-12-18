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
import javax.servlet.http.HttpSession;

import com.db.conn.ConnectionProvider;

@WebServlet("/UpdateProducts")
public class UpdateProducts extends HttpServlet {
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
	
		String id= request.getParameter("id");
		String category= request.getParameter("category");
		String p_name = request.getParameter("p_name");
		String specification= request.getParameter("specification");
		String base_price= request.getParameter("base_price");
		String seller= request.getParameter("seller");
		
		System.out.println("ID= "+id);
		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("UPDATE `product_details` SET category='"+category+"', p_name='"+p_name+"', specification='"+specification+"', base_price='"+base_price+"', seller='"+seller+"' where id='"+id+"'");
			int i=ps1.executeUpdate();
			System.out.println("Ps= "+ps1);
			if (i>0) 
			{
				System.out.println("Updation Done");
				response.sendRedirect("adminHome.jsp?Updat");

			}
			else 
			{
				System.out.println("fail");
				response.sendRedirect("UpdateProducts.jsp?fail=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}