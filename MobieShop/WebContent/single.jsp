<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Chi tiết sản phẩm</title>

</head>
<body>

	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		CategoryDAO categoryDAO = new CategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		Product product = new Product();
		String productID = "";
		if (request.getParameter("productID") != null) {
			productID = request.getParameter("productID");
			product = productDAO.getProduct(Long.parseLong(productID));
		}

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		ArrayList<Product> listSame = productDAO.getListProductSame(product.getCategoryID(),
				product.getProductID());
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container" >
		<div class="row" style="background-color: #fff;">
			<!-- left image -->
			<div class="col-xs-12 col-md-4 col-sm-4 col-lg-4">
				<ul id="etalage">
					<li><a href="optionallink.html"> <img
							class="etalage_thumb_image img-responsive"
							src="imageProduct/<%=product.getProductImage1()%>" alt=""> <img
							class="etalage_source_image img-responsive"
							src="imageProduct/<%=product.getProductImage1()%>" alt="" style="width: 450px;">
					</a></li>
					<li><img class="etalage_thumb_image img-responsive"
						src="imageProduct/<%=product.getProductImage2()%>" alt=""> <img
						class="etalage_source_image img-responsive"
						src="imageProduct/<%=product.getProductImage2()%>" alt=""></li>
					<li><img class="etalage_thumb_image img-responsive"
						src="imageProduct/<%=product.getProductImage3()%>" alt=""> <img
						class="etalage_source_image img-responsive"
						src="imageProduct/<%=product.getProductImage3()%>" alt=""></li>
					<li><img class="etalage_thumb_image img-responsive"
						src="imageProduct/<%=product.getProductImage1()%>" alt=""> <img
						class="etalage_source_image img-responsive"
						src="imageProduct/<%=product.getProductImage1()%>" alt=""></li>
				</ul>
			</div>
			<!-- end left image -->



			<!-- start info product -->
			<div class="col-xs-12 col-md-5 col-sm-5 col-lg-5">

				<div class="row" style="line-height: 50px;">
					<h3><%=product.getProductName()%></h3>
					<hr>
				</div>
				<div class="row" style="line-height: 50px;">
					<div class="col-md-8 col-sm-8">
						<h4>
							<span>Giá : </span> <span style="color: red; font-size: 24px;"> <%=formatter.format(product.getProductPrice())%>
								VND
							</span>
						</h4>
						<h4>
							<span>Tình trạng : </span>
							<%
								if (product.getQuantity() > 0) {
							%>
							<span>Còn hàng</span>
							<%
								} else {
							%>
							<span>Hết hàng</span>
							<%
								}
							%>
						</h4>
					</div>
					<div class="col-md-4 col-sm-4">
					<a href="CartServlet?command=plus&productID=<%=productID%>"
						class="btn btn-warning">MUA HÀNG</a></div>
					</div>
					<br>
					<div class="row">
					<div class="col-md-12">
						
						<table class="table table-hover">
							<thead>
								<tr>
									<th colspan="2" style="text-align: center;">THÔNG SỐ KĨ THUẬT</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><b>Hệ điều hành</b></td>
									<td><%=product.getHedieuhanh()%></td>
								</tr>
								<tr>
									<td><b>Camara</b></td>
									<td><%=product.getCamara()%></td>
								</tr>
								<tr>
									<td><b>CPU</b></td>
									<td><%=product.getCpu()%></td>
								</tr>
								<tr>
									<td><b>Ram</b></td>
									<td><%=product.getRam()%></td>
								</tr>
								<tr>
									<td><b>Rom</b></td>
									<td><%=product.getRom()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
			<!-- end info product -->

			<div class="col-xs-12 col-md-3 col-sm-3 col-lg-3">
				<div class="">
					<h4 style="line-height: 45px; background: #F1F3FA; ">Giỏ hàng</h4>
					<ul>
						<%
							for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
						%>
						<li><a href="#"><%=list.getValue().getProduct().getProductName()%></a></li>
						<%
							}
						%>

					</ul>
				</div>
				<div class="">
					<h4 style="line-height: 45px; background: #F1F3FA; ">Danh mục sản phẩm</h4>
					<ul>
						<%
							for (Category c : categoryDAO.getListCategory()) {
						%>
						<li><a href="product.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>

		<div class="row" style="background-color: #fff;">
			<h3 style="line-height: 45px; font-size: 24px; background: #ff5c01;; color : #fff;">Sản phẩm cùng loại</h3>
			<div class="col-xs-12 col-md-12 col-sm-12 col-lg-12">
				<div class="three-banner_list">
					<%
						for (Product p : listSame) {
					%>
					<div class="col-md-3 col-sm-3 col-xs-12 col-lg-3">
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
									<span>Tình trạng </span>
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
		</div>
	</div>
	<footer class="container-fluid text-center">
	<p>Pham Van Nguyen</p>
	<p>DHBKHN-CNTT2.01</p>
	</footer>

</body>
</html>