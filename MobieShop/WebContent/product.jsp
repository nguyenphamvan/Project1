<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>San pham</title>
</head>
<body>
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		CategoryDAO categoryDAO = new CategoryDAO();

		ProductDAO productDAO = new ProductDAO();

		long categoryID = 0;
		if (request.getParameter("categoryID") != null) {
			categoryID = (long) Long.parseLong(request.getParameter("categoryID"));
		}

		int pages = 0, firstResult = 0, maxResult = 0, total = 0;
		if (request.getParameter("pages") != null) {
			pages = (int) Integer.parseInt(request.getParameter("pages"));
		}

		total = productDAO.countProductByCategory(categoryID);
		if (total <= 8) {
			firstResult = 0;
			maxResult = total;
		} else {
			firstResult = (pages - 1) * 8;
			maxResult = 8;
		}

		ArrayList<Product> listProduct = productDAO.getListProductByPage(categoryID, firstResult, maxResult);
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-md-2 col-sm-2 col-xs-12 col-lg-2 list"
				style="background: #D3D3D3">
				<ul class="nav nav-pills nav-stacked ">
					<li class="active"><a href="index.jsp">Danh mục</a></li>
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

			<div class="col-md-10 col-sm-10 col-xs-12 col-lg-10">
				<div class="row">
					<%
						Category category = categoryDAO.getCategory(categoryID);
					%>
					<h3
						style="line-height: 40px; margin: 0; font-size: 24px; background: #ff5c01; color : #fff ;;  text-align: center;">
						Các sản phẩm của 
						<%=category.getCategoryName()%>
					</h3>
				</div>
				<div class="row">

					<%
						for (Product p : listProduct) {
					%>
					<div class="col-md-3 col-sm-3 col-xs-12 col-lg-3 sp">
						<div class="panel panel-danger">
							<div class="panel-body">
								<img src="imageProduct/<%=p.getProductImage1()%>" class="img-responsive"
									style="width: 100%; height: 235px;" alt="Image">
							</div>
							<div class="panel-footer">
								<p><h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a><br></h5> </p>
								<p>
									<span>Giá : </span><span style="color: red;"><%=formatter.format(p.getProductPrice())%>
										VND</span>
								</p>
								<p>
									<span>Tình trạng : </span>
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
										class="btn btn-primary">CHI TIẾT</a></span>
								<p>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>

				<div class="row">
					<ul class="pagination">
						<%
							for (int i = 1; i <= (total / 8) + 1; i++) {
						%>
						<li><a
							href="product.jsp?categoryID=<%=categoryID%>&pages=<%=i%>"><%=i%></a></li>
						<% } %>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>