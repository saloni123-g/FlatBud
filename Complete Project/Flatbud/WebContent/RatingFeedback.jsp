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
<link href="styles.css" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,600,700"
	rel="stylesheet">
</head>
<body>
<%
	if(request.getParameter("Done")!=null)
	{
	out.println("<script>alert('Payment Transfer Successfull...!')</script>");	
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
				<%
					String email = session.getAttribute("email").toString();
					System.out.print("Email " + email);
				%>
				
				<div class="well well-small">
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
							
								<div class="item active" align="center">
									<h1>Welcome</h1>
									<hr/>
									<form action="Feedback" method="post">
										<table style="width: 50%">
											<tr>
												<th>Feedback</th>
												<td><textarea class="form-control" name="feedback" required></textarea></td>
											</tr>
											<tr>
												<th>Rating</th>
												<td><fieldset class="rating">
												<input type="radio" name="stars" id="4_stars" value="5" />
												<label class="stars" for="4_stars">4 stars</label> <input
													type="radio" name="stars" id="3_stars" value="4" /> <label
													class="stars" for="3_stars">3 stars</label> <input
													type="radio" name="stars" id="2_stars" value="3" /> <label
													class="stars" for="2_stars">2 stars</label> <input
													type="radio" name="stars" id="1_stars" value="2" /> <label
													class="stars" for="1_stars">1 star</label> <input
													type="radio" name="stars" id="0_stars" value="1" required />
												<label class="stars" for="0_stars">0 star</label> <span
													class="label"> Rating: </span>
											</fieldset></td>
											</tr>
											<tr>
												<td>.</td>
											</tr>
											<tr>
												<th></th>
												<td><button type="submit" class="btn btn-success">Submit</button></td>
											</tr>
										</table>
										</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /container -->

		<div class="copyright">
			<div class="container">
				<p class="pull-right"></p>
				<span>Copyright &copy; FlatBud: The Flatmate Searching Website
				</span>
			</div>
		</div>
		<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
		<script src="assets/js/shop.js"></script>
</body>
</html>