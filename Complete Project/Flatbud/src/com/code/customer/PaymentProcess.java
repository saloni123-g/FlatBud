package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.conn.ConnectionProvider;
import com.mail.SendMailSSL;

@WebServlet(name = "PaymentProcess1", urlPatterns = { "/PaymentProcess1" })
public class PaymentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String base_price= request.getParameter("base_price");
		String card_no= request.getParameter("card_no");
		String month_year= request.getParameter("month_year");
		String cvv= request.getParameter("cvv");
		
		DateFormat df = new SimpleDateFormat("dd/MM/yy");
		Date dateobj = new Date();
		String c_date = df.format(dateobj);
		System.out.println("Date1= "+c_date);
		System.out.println("Current Date is ="+c_date);
		
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		
		try 
		{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO `payment_details`(`totalPrice`, `card_no`, `month_year`, `cvv`, `payment_by`, `payment_date`) VALUES ('"+base_price+"','"+card_no+"','"+month_year+"','"+cvv+"','"+email+"','"+c_date+"')");
			int i=ps.executeUpdate();
			if (i>0) 
			{
				PreparedStatement ps1 = con.prepareStatement("DELETE FROM `cart_whish_list_products` where request_by='"+email+"'");
				int i2=ps1.executeUpdate();
				System.out.println("Deletion Done");
				
				System.out.println("Payment Done");
				
				SendMailSSL sendmail=new SendMailSSL();
				
				String Sub="Room Booking Confrom";
				String Msg="Hello '"+email+"', Your Room Booking is Confrom by Hotel Valencia. <br> Enjoy your Holidays";
		                     
		        sendmail.EmailSending(email, Sub, Msg);
		        
		        PreparedStatement ps2 = con.prepareStatement("UPDATE `cust_bookings` SET status='Paid', totalPrice='"+base_price+"' where book_by='"+email+"'");
				int ii=ps2.executeUpdate();
				if (i>0) 
				{
					System.out.println("Payment Done");
				}
		                    
				response.sendRedirect("RatingFeedback.jsp?Done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("paymentProcess.jsp?fail=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}
