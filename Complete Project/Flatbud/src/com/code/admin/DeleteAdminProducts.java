package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conn.ConnectionProvider;

@WebServlet("/DeleteAdminProducts")
public class DeleteAdminProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteAdminProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps=con.prepareStatement("DELETE FROM `product_details` WHERE id = '"+id+"'");
			int i=ps.executeUpdate();
		    if(i>0)
		    {
		    	response.sendRedirect("viewProducts.jsp?delete");
		    }
		    else{
		    	response.sendRedirect("viewProducts.jsp?fail=delete");
		    }    	
		    }
		catch(Exception e)
		{
			System.out.println(e);
		}	
	}
}
