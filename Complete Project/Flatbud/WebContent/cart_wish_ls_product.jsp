<%@page import="com.code.customer.DateTimeDifference"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.code.admin.GlobalFunction"%>
<%@page import="jdk.nashorn.internal.objects.Global"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.conn.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title><jsp:include page="projectTitle.jsp"></jsp:include></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="style.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="shortcut icon" href="assets/ico/favicon.ico">
</head>
<body>
<%
	if(request.getParameter("delete")!=null)
	{
	out.println("<script>alert('Product remove from Cart...!')</script>");	
	}
%>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div id="gototop"></div>
		<header id="header">
		<div class="row">
			<div class="span4">
				<h1>
					<a class="logo" href="index.jsp"><span><jsp:include
								page="projectTitle.jsp"></jsp:include></span> <img
						src="assets/img/umai.png"
						alt="bootstrap sexy shop"> </a>
				</h1>
			</div>
			<div class="span4 alignR"></div>
		</div>
		</header>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="nav-collapse">
						<jsp:include page="Header/CustomerHeader.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						<div class="carousel-inner">

							<h3 align="center">View Products in Cart</h3>
						</div>
					</div>
				</div>
				
				<div class="well well-small">
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
								<form action="paymentProcess.jsp" method="post">
								<table class="table table-striped">
								<tbody>
										<tr class="techSpecRow">
											<th class="techSpecTD1">Sr.No.</th>
											<th class="techSpecTD2">Category</th>
											<th class="techSpecTD2">No of Beds</th>
											<th class="techSpecTD2">Customer Name</th>
											<th class="techSpecTD2">Base Price</th>
											<th class="techSpecTD2">Quantity</th>
											<th class="techSpecTD2">Total Price</th>
											<th class="techSpecTD2">Action</th>
										</tr>
									</tbody>
								<%
								String email=session.getAttribute("email").toString(); 
								String sql="select * from cart_whish_list_products where request_by='"+email+"'";
								int srno=1;
								Connection con = ConnectionProvider.getConnection();
								PreparedStatement ps = con.prepareStatement(sql);
								//ResultSet rs = ps.executeQuery();
								
								String quantity = "";
								String base_price = "";
								int total =0;
								int totalPrice = 0;
								ResultSet rs = ps.executeQuery();
								while(rs.next())
								{
									//System.out.println("prescription_for:=-"+ prescription_for);
									quantity = rs.getString("quantity");
									base_price = rs.getString("base_price");
									int q=Integer.parseInt(quantity);  
									int p=Integer.parseInt(base_price); 
									total = (q * p);
								%>
								
									<tr align="center">
											<td><%=srno++ %></td>
											<td><%=rs.getString("category") %></td>
											<td><%=rs.getString("p_name") %></td>
											<td><%=rs.getString("request_by") %></td>
											<td><%=rs.getString("base_price") %></td>
											<td>0<%=q %></td>
											
											<td><i class="fa fa-inr" style="font-size:14px">&nbsp;<%=total %></i></td>
											
											<td><a href="DeleteProductItem?p_id=<%=rs.getString("p_id")%>" class="btn btn-info btn">
	          									<span class="ace-icon fa fa-trash-o bigger-120"></span> Delete</a></td>
										<%
											totalPrice=totalPrice+total;
											}
										%>
									</tr>
									<tr>
										<td colspan="6" style="text-align:right"><b>Total Amount:</b></td>
										<td style="width:15%"><i class="fa fa-inr" style="font-size:14px">&nbsp;<%=totalPrice %></i></td>
									<%
										session.setAttribute("totalPrice", totalPrice);
									%>
										<td><a href="CancelOrder?request_by=<%=email%>" class="btn btn-info btn">
	          									<span class="ace-icon fa fa-trash-o bigger-120"></span> Cancel Order</a></td>
									</tr>
								</table>
							<%-- <h3>Parcel Delivered to "<u><%=session.getAttribute("address").toString()%></u>" to this address</h3><hr> --%>
					<tr>
						<td><a href="CustomerHome.jsp?OrderDone"><b class="shopBtn"><u>Cash on Delivery</u></b></a>&nbsp;|&nbsp;
						<a href="paymentProcess.jsp?email=<%=email%>"><b class="shopBtn"><u>Payment Option</u></b></a></td>
					</tr>
					<br>
					<br /> <br />
					</form>
								</div>
							</div>
						</div>
					</div>
				</div>

	<div class="copyright">
		<div class="container">
			<p class="pull-right"></p>
			<span>Copyright &copy; Hotel Booking Management System.
			</span>
		</div>
	</div>
	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	<script src="assets/js/shop.js"></script>
</body>
</html>