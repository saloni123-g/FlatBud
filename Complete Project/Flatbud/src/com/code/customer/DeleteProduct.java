package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conn.ConnectionProvider;

@WebServlet(name = "DeleteProductItem", urlPatterns = { "/DeleteProductItem" })
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	String p_id=request.getParameter("p_id");
	
	try {
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps=con.prepareStatement("DELETE FROM `cart_whish_list_products` WHERE p_id = '"+p_id+"'");
		int i=ps.executeUpdate();
	    if(i>0)
	    {
	    	response.sendRedirect("cart_wish_ls_product.jsp?delete");
	    }
	    else{
	    	response.sendRedirect("cart_wish_ls_product.jsp?fail=delete");
	    }    	
	    }
	catch(Exception e)
	{
		System.out.println(e);
	}	
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
