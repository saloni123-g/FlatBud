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
						src="assets/img/flat.png"
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
			
<%
	if(request.getParameter("delete")!=null)
	{
	out.println("<script>alert('Product remove from Cart...!')</script>");	
	}

		String email=session.getAttribute("email").toString();
		String id=request.getParameter("id");
		
		String sql="select * from product_details where id='"+id+"'";
		
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		int count=0;
		
		while (rs.next()) 
		{
			count=count+1;
			String file_name = rs.getString("file_name");
			String category = rs.getString("category");
			String p_name = rs.getString("p_name");
			String base_price = rs.getString("base_price");
%>
			
			<div class="row">
				<div class="span12">
					<div class="well well-small">
						<div class="row-fluid">
							<div class="span5">
								<div id="myCarousel">
									<div class="carousel-inner">
										<div class="item active">
											<a href="#"> <img src="products/<%=file_name %>" alt=""
												style="width: 90%; height:50%"></a>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="span7">
								<h3><%=rs.getString("category") %>&nbsp;&nbsp;(<%=rs.getString("p_name") %>)&nbsp;&nbsp;</h3>
								<hr class="soft" />
								
								<!-- <form action="AddToCart"> -->
									<div class="control-group">
										<input type="hidden" name="p_id" value="<%=id%>">
										<label class="control-label"><span><b>Base Price :</b> <%=rs.getString("base_price") %>/-</span></label>
										<div class="controls">
											<label class="control-label"><span><b>No of Beds :</b> <%=p_name %></span></label>
										</div>
									</div>
									<!-- <h4>Bidding Time</h4> -->
									<div class="control-group">
										<label class="control-label"><span><b>Facilities :</b> <%=rs.getString("specification") %></span></label>
										<div class="controls">
											<label class="control-label"><span><b>Upload By :</b> <%=rs.getString("seller") %></span></label>
										</div>
									</div>
																		
									<div class="control-group">
										<label class="control-label"><span><b>Status :</b> <%=rs.getString("action") %></span></label>
										<label class="control-label"><span><img alt="" src="products/r.jpg" style="width: 5%"><strong>&nbsp;<%=rs.getString("base_price")%></strong>
										<input type="number" style="width:29px;height:19px;" name="quantity" required></span></label>
									</div>
									
									<div class="control-group">
										<a class="shopBtn" href="SendRequest?id=<%=rs.getString("id")%>"><input type="submit" value="Send Request" class="shopBtn"></a>
									</div>
									<%-- <div class="control-group">
										<input type="hidden" name="id" value="<%=id%>">
										<input type="hidden" name="req_type" value="W">
										<input type="submit" class="shopBtn" value="Book Now">
									</div> --%>
								<!-- </form> -->
								</div>
							</div>
				
							<hr class="softn clr" />
							<%} %>
							
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