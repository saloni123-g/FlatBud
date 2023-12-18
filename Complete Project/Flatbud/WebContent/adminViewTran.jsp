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
	if(request.getParameter("already")!=null)
	{
	out.println("<script>alert('Member already added ...!')</script>");	
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
						<jsp:include page="Header/adminHeader.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span12">
				<div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						<!-- <div class="carousel-inner">

							<a class="left carousel-control" href="#myCarousel"
							data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
							href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div> -->
				</div>
				<div class="well well-small">
					<h3 align="center">View Transaction Details</h3>
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
								<table class="table table-striped">
								<tbody>
										<tr class="techSpecRow">
											<th class="techSpecTD1">Sr.No.</th>
											<th class="techSpecTD2">Payment By</th>
											<th class="techSpecTD2">Total Payment</th>
											<th class="techSpecTD2">Card Number</th>
											<th class="techSpecTD2">Month/Year</th>
											<th class="techSpecTD2">Status</th>
											<th class="techSpecTD2">Action</th>
										</tr>
									</tbody>
								<%
								Connection con=ConnectionProvider.getConnection();
								PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `payment_details` where status='Payment Done'");
								ResultSet rs1 = ps1.executeQuery();
								int i=0;
								
								while (rs1.next()) 
								{
									i=i+1;
									String id=rs1.getString("id");
									
								%>
										<tr class="techSpecRow">
											<td class="techSpecTD1"><%=i %></td>
											<td class="techSpecTD2"><%=rs1.getString("payment_by")%></td>	
											<td class="techSpecTD2"><%=rs1.getString("totalPrice") %></td>
											<td class="techSpecTD2"><%=rs1.getString("card_no") %></td>
											<td class="techSpecTD2"><%=rs1.getString("month_year") %></td>
											<td class="techSpecTD2"><%=rs1.getString("status") %></td>
											<td colspan="2" align="center"><a class="button" href="FlatMateRegistration.jsp?email=<%=rs1.getString("payment_by")%>" style="background: yellow;"><input type="submit" value="Add Member" class="button"></a></td>
										</tr>
								<%} %>	
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