package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.conn.ConnectionProvider;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String p_id = request.getParameter("id");
		String quantity=request.getParameter("quantity");
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		
		try 
		{
		PreparedStatement ps = con.prepareStatement("select * from product_details where id='"+p_id+"'");
		System.out.println("PS_Query: "+ps);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			String category = rs.getString("category");
			String p_name = rs.getString("p_name");
			String base_price = rs.getString("base_price");
			System.out.println("id:"+p_id+ " Category:"+category+ " p_name:"+p_name+ " Base_Price:"+base_price);
			
		String req_type = request.getParameter("req_type");
		if(req_type.equals("A"))
		{
			req_type="Add To Cart";
		}
		else
		{
			req_type="Wish List Product";
		}
		System.out.println("Req Type "+req_type);
		
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `cart_whish_list_products`(`p_id`, `category`, `p_name`, `base_price`, `quantity`, `request_by`, `status`) VALUES ('"+p_id+"','"+category+"','"+p_name+"','"+base_price+"','"+quantity+"','"+email+"','"+req_type+"')");
			System.out.println("Query: "+ps1);
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				PreparedStatement ps2 = con.prepareStatement("INSERT INTO `cust_bookings`(`p_id`, `category`, `p_name`, `base_price`, `quantity`, `book_by`, `status`) VALUES ('"+p_id+"','"+category+"','"+p_name+"','"+base_price+"','"+quantity+"', '"+email+"', 'Pending')");
				int i2=ps2.executeUpdate();
				System.out.println("Add Product Done");
				response.sendRedirect("CustViewProducts.jsp?add=done");

			}
			else 
			{
				System.out.println("add Operation fail");
				response.sendRedirect("CustViewProducts.jsp?fail=add");
			}
		  }
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
  }
}