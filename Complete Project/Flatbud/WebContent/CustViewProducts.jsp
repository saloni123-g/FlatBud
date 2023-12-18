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
if(request.getParameter("update")!=null)
{
out.println("<script>alert('Your Request Send Sucessful....!')</script>");	
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
<%
	if(request.getParameter("add")!=null)
	{
		out.print("<script>alert('Product Add To Cart Done')</script>");
	}
%>

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
		<div class="row">
			<div class="span12">
				<div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						<div class="carousel-inner">

							<h3 align="center">View Available Rooms</h3>
						</div>
					</div>
				</div>
				<div class="well well-small">
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
								<form action="CustViewProducts.jsp" method="POST">
									<table>
										<tr>
											<td><input type="text" name="search" required="required"></td>
											<td><input type="submit" value="Search"></td>
										</tr>
									</table>
								</form>
								</div>
							</div>
						</div>
					</div>
					
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
								<div class="item active" align="center">
									<ul class="thumbnails">

										<%
											String sql="select * from product_details where status='Not_Sell'";
											if(request.getParameter("search")!=null)
											{
												String search=request.getParameter("search");
												System.out.print("Search is "+search);												
												sql="select * from product_details where category='"+search+"' AND status='Not_Sell'";
											}
											
											String email = session.getAttribute("email").toString();
											System.out.print("Email " + email);
	
											Connection con = ConnectionProvider.getConnection();
											PreparedStatement ps = con.prepareStatement(sql);
											ResultSet rs = ps.executeQuery();
											int count=0;
											while (rs.next()) {
												count=count+1;
												String file_name = rs.getString("file_name");
												String id = rs.getString("id");
												String category = rs.getString("category");
												String p_name = rs.getString("p_name");
												String base_price = rs.getString("base_price");
												
										%>
										<li class="span3">
											<div class="thumbnail">
												<div class="caption cntr">
												<form action="AddToCart">
													<h4><%=rs.getString("category")%></h4>
													<img src="products/<%=file_name%>" alt="bootstrap-ring">
													<p><%=rs.getString("p_name")%></p>
													<p><b>Available</b></p>

													<%-- <p>
														<img alt="" src="products/r.jpg" style="width: 20%"><strong>&nbsp;<%=rs.getString("base_price")%></strong>
														<input type="number" style="width:29px;height:19px;" name="quantity" required>
													</p> --%>
													<hr />
													<h4>
														<input type="hidden" name="id" value="<%=id%>">
														<input type="hidden" name="req_type" value="W">
														<!-- <input type="submit" class="shopBtn" value="View Details"> -->
														<a href="ViewDetails.jsp?id=<%=id%>"><b class="shopBtn"><u>View Details</u></b></a>
													</h4>
													
													</form>
													<br class="clr">
												</div>
											</div>
										</li>
										<%
											int rsl=count%4;
										System.out.println("RSL "+rsl);
											if(rsl==0)
											{
												%>
												</ul>
												<hr/>
												<%
											}
										
										%>

										<%
											}
										%>
									</ul>
								</div>
							</div>
							<a class="left carousel-control" href="#newProductCar"
								data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
								href="#newProductCar" data-slide="next">&rsaquo;</a>
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