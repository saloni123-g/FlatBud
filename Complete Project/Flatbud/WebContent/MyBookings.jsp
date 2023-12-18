<%@page import="com.db.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
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
		if(request.getParameter("update")!=null)
		{
		out.println("<script>alert('Your Table booked or Reserve Sucessful....!')</script>");	
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
						
				</div>
				<div class="well well-small">
					<h3 align="center">View Booking Requests</h3>
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
								<table class="table table-striped">
								<tbody>
										<tr class="techSpecRow">
											<th class="techSpecTD1">Sr. No.</th>
											<th class="techSpecTD1">Customer Name</th>
											<th class="techSpecTD2">Request Date</th>
											<th class="techSpecTD2">Building Name</th>
											<th class="techSpecTD2">Owner Name</th>
											<th class="techSpecTD2">Status</th>
											<th class="techSpecTD2">Pay</th>
										</tr>
									</tbody>
								<%
								String email=session.getAttribute("email").toString(); 
								Connection con=ConnectionProvider.getConnection();
								PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `booking_request` where email='"+email+"'");
								ResultSet rs1 = ps1.executeQuery();
								int i=0;
								while (rs1.next()) 
								{
									i=i+1;	
									String id = rs1.getString("request_for");
									PreparedStatement ps = con.prepareStatement("SELECT * FROM `product_details` where id='"+id+"'");
									ResultSet rs = ps.executeQuery();
									while (rs.next()) 
									{
										String status = rs1.getString("status");
										String base_price = rs.getString("base_price");
										//System.out.println("Amount= "+base_price);
										//session.setAttribute("base_price", base_price);
								%>
										<tr class="techSpecRow" align="center">
											<td class="techSpecTD1"><%=i %></td>
											<td class="techSpecTD1"><%=rs1.getString("email")%></td>
											<td class="techSpecTD2"><%=rs1.getString("request_date")%></td>	
											<td class="techSpecTD2"><%=rs.getString("p_name") %></td>
											<td class="techSpecTD2"><%=rs.getString("upload_by") %></td>
											<td class="techSpecTD2"><%=rs1.getString("status") %></td>
											
											<%if(status.equals("Accept")){ %>
											<td class="techSpecTD2" align="center"><a class="button" href="paymentProcess.jsp?email=<%=email%>&&id=<%=rs.getString("id")%>" style="background: yellow;"><input type="submit" value="Perform Payment" class="button"></a></td>
											<%}else{ %>
											<td class="techSpecTD2"><%=rs1.getString("status") %></td>
										</tr>
								<%}}}%>	
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="copyright">
			<div class="container">
				<p class="pull-right"></p>
				<span>Copyright &copy; FlatBud: The Flatmate Searching Website
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