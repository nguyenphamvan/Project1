<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Insert title here</title>
</head>
<body>

	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		CategoryDAO categoryDAO = new CategoryDAO();

		ProductDAO productDAO = new ProductDAO();

		String category_id = "";
		if (request.getParameter("category") != null) {
			category_id = request.getParameter("category");
		}

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<!-- <div class="container">  -->
	<h1 class="text-center" style="padding-bottom: 20px;"></h1>
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-sm-2 col-lg-2 col-xs-12 list"
				style="background: #D3D3D3; height: 100%;">
				<ul class="nav nav-pills nav-stacked ">
					<li class="active"><a href="index.jsp">Home</a></li>
					<%
						for (Category c : categoryDAO.getListCategory()) {
					%>
					<li><a style="background-color: #fff;"
						href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%=c.getCategoryName()%></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="col-md-8 col-sm-8 col-lg-8 col-xs-12">
				<div class="row">
					<h3
						style="line-height: 40px; margin: 0; font-size: 24px; background: #ff5c01; color : #fff ; text-align: center;">
						Sản phẩm bán chạy
				</h3>
				</div>
				<div class="row">
					<%
						for (Product p : productDAO.getListProductHot()) {
					%>
					<div class="col-sm-6 sp">
						<div class="panel panel-primary">
							<div class="panel-body">
								<div class="col-md-5 col-sm-5 col-xs-12">
									<img src="imageProduct/<%=p.getProductImage1()%>" class="img-responsive"
										style="width: 100%; height: 130px;  alt="Image">
								</div>
								<div class="col-md-7 col-sm-7 col-xs-12">
									<p>
										<h5>
											<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a>
										</h5>
									</p>
									
									<p>
										<span>Giá : </span><span style="color: red;"><%=formatter.format(p.getProductPrice())%>
											VND</span>
									</p>
									<p>
										<span>Tình trạng :</span>
										<%
											if (p.getQuantity() > 0) {
										%>
										<span >Còn hàng</span>
										<%
											} else {
										%>
										<span>Hết hàng</span>
										<%
											}
										%>
									</p>
									<br>
								</div>
							</div>
							<div class="panel-footer">
								<p>
									<span><a
										href="CartServlet?command=plus&productID=<%=p.getProductID()%>"
										class="btn btn-warning">MUA HÀNG</a></span> <span
										style="float: right;"><a
										href="single.jsp?productID=<%=p.getProductID()%>"
										class="btn btn-primary">XEM CHI TIẾT</a></span>
								<p>
							</div>
						</div>
					</div>
					<%
						}
					%>

				</div>
			</div>

			<div class="col-md-2 col-sm-2 col-lg-2 col-xs-12">
				<div class="row">
					<div class="col-sm sp">
						<img src="imageAdvertisement/home-banner-right.jpg" class="img-responsive"
							style="width: 100%; height: 493px;" alt="Image">
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12"
				style="padding-right: 0px; padding-left: 0px;">
				<img src="imageAdvertisement/rhs-banner-1.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
			</div>
			<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12"
				style="padding-right: 0px; padding-left: 0px;">
				<img src="imageAdvertisement/rhs-banner-2.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
			</div>
			<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12"
				style="padding-right: 0px; padding-left: 0px;">
				<img src="imageAdvertisement/rhs-banner-3.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
			</div>
		</div>
	</div>

	<div class="container" style="padding-top: 20px;">

		<div class="row" style="border: 1px;">
			<h3 style="line-height: 45px; font-size: 24px; background: #ff5c01;; color : #fff; text-align: left;">Sản phẩm mới nhập</h3>
		</div>

		<div class="row" style="background: #fff;">
			<%
				for (Product p : productDAO.getListProductNews()) {
			%>
			<div class="col-md-3 col-sm-3 col-lg-3 col-xs-12"
				style="padding-top: 20px;">
				<div class="panel panel-primary">
					<div class="panel-body">
						<img src="imageProduct/<%=p.getProductImage1()%>" class="img-responsive"
							style="width: 100%; height: 235px;" alt="Image">
					</div>
					<div class="panel-footer">
						<p>
						<h5>
							<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a>
						</h5>
						</p>
						<p>
							<span>Giá : </span><span style="color: red;"><%=formatter.format(p.getProductPrice())%>
								VND</span>
						</p>
						<p>
							<span>Tình trạng :</span>
							<%
								if (p.getQuantity() > 0) {
							%>
							<span>Còn hàng</span>
							<%
								} else {
							%>
							<span>Hết hàng</span>
							<%
								}
							%>
						</p>
						<p>
							<span><a
								href="CartServlet?command=plus&productID=<%=p.getProductID()%>"
								class="btn btn-warning">MUA HÀNG</a></span> <span style="float: right;"><a
								href="single.jsp?productID=<%=p.getProductID()%>"
								class="btn btn-primary">XEM CHI TIẾT</a></span>
						<p>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
	</div>

	<div class="container">
		<div class="row">
			<img src="imageAdvertisement/samsung-banners.png"
				style="width: 100%; height: 160px; padding-top: 20px;">
		</div>
	</div>


</body>
</html>