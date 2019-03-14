
<%@page import="model.Users"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Trang chủ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css"
	rel="stylesheet">
<script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">
<script>
	jQuery(document)
			.ready(
					function($) {

						$('#etalage')
								.etalage(
										{
											thumb_image_width : 300,
											thumb_image_height : 400,
											source_image_width : 900,
											source_image_height : 1200,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
										});

					});
</script>


<script>
	$(document).ready(function() {
		$('.nav .dropdown').hover(function() {
			$(this).addClass('open');
		}, function() {
			$(this).removeClass('open');
		});
	});
</script>

<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script src="js/jquery.etalage.min.js"></script>
</head>

<body>

	<%
		CategoryDAO categoryDAO = new CategoryDAO();

		Users users = null;
		if (session.getAttribute("user") != null) {
			users = (Users) session.getAttribute("user");
		}

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<div class="jumbotron">
		<div class="container text-center">
			<h1>Mobie Shop</h1>
			<p>Đẳng cấp và chất lượng</p>
		</div>
		<div class="container ">
			<div class="row">
				<div
					class=" col-md-offset-4 col-sm-offset-4  col-md-4 col-sm-4 col-xs-12">
					<form action="Search" method="post">
						<div class="input-group row">
							<input type="text" class="form-control" placeholder="Search"
								class="form-control" name="search">

							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<nav class="navbar navbar-inverse" data-spy="affix"
		data-offset-top="197">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp" > Trang chủ</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="product.jsp">Danh mục sản phẩm<span
								class="caret"></span></a>
							<ul class="dropdown-menu animated">
								<%
									for (Category c : categoryDAO.getListCategory()) {
								%>
								<li><a style="background-color: white;"
									href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%=c.getCategoryName()%></a></li>
								<%
									}
								%>
							</ul></li>
						<li><a href="news.jsp">Tin tức</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">


						<%
							if (session.getAttribute("user") == null) {
						%>
						<li><a href="register.jsp"> Đăng ký</a></li>
						<li><a href="login.jsp"><span
								class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
						
						<%
							}
						%>
						<%
							if (session.getAttribute("user") != null) {
						%>
						<li><a href="UsersServlet?command=destroysession"><span
								class="glyphicon glyphicon-log-out"></span> Thoát</a></li>
						<li><a href="profile.jsp"><span
								class="glyphicon glyphicon-user"></span> Tài khoản</a></li>
						<%
							}
						%>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><span
								class="glyphicon glyphicon-shopping-cart"></span> Giỏ hàng <span
								class="badge"><%=cart.countProduct()%></span></a>

							<ul class="dropdown-menu dropdown-cart">

								<%
									for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
								%>
								<li><span class="item"> <span class="item-left"
										style="width: 300px; height: 60px;"> <a
											href="single.jsp"><img
												src="imageProduct/<%=list.getValue().getProduct().getProductImage1()%>"
												alt="Image" width="56" height="60"></a> <a
											href="single.html"><span class="item-info"><%=list.getValue().getProduct().getProductName()%></span></a><br>
										<br>
											<p>
												<span class="item-info"><%=list.getValue().getQuantity()%>x
													- $<%=list.getValue().getProduct().getProductPrice()%></span></span> <span
										class="item-right"><button
												class="btn btn-xs btn-danger pull-right">
												<a
													href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><i
													class="glyphicon glyphicon-trash"></i></a>
											</button> </span>
										</p>
								</span></li>

								<hr>
								<%
									}
								%>

								<li class="total"><strong>Tổng tiền</strong>: <%=cart.totalCart()%>
									VND <a href="cart.jsp" class="btn btn-success btn-cart">Xem
										giỏ hàng</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>