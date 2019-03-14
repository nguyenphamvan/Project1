<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Chi tiết sản phẩm</title>
</head>
<body class="nav-md">

	<%
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.getProduct(Long.parseLong(request.getParameter("product_id")));
	%>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>


			<div class="right_col" role="main">

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Chi tiết sản phẩm:
									<%=product.getProductName()%></h2>

								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<div class="col-md-5 col-sm-5 col-xs-12">

									<div class="product-image">
										<img src="../imageProduct/<%=product.getProductImage1()%>" alt="Image"
											style="width: 450px; height: 420px; margin-top: 0;" />
									</div>
									<div class="product_gallery">
										</a> <a> <img src="../imageProduct/<%=product.getProductImage1()%>" alt="..." />
										</a> <a> <img src="../imageProduct/<%=product.getProductImage2()%>" alt="..." />
										</a> <a> <img src="../imageProduct/<%=product.getProductImage3()%>" alt="..." />
										</a>
									</div>
								</div>

								<div class="col-md-7 col-sm-7 col-xs-12"
									style="border: 0px solid #e5e5e5;">

									<h3 class="prod_title"><%=product.getProductName()%></h3>

									<p>
										<span>Hệ điều hành</span><span> <%=product.getHedieuhanh()%></span>
									</p>
									<p>
										<span>Camara</span><span> <%=product.getCamara()%></span>
									</p>
									<p>
										<span>CPU</span><span> <%=product.getCpu()%></span>
									</p>
									<p>
										<span>Ram</span><span> <%=product.getRam()%></span>
									</p>
									<p>
										<span>Rom</span><span> <%=product.getRom()%></span>
									</p>
									<br />

									<div class="row">
										<div class="product_price">
											<h4 class="price">
												<span>Giá : </span>
												<%=product.getProductPrice()%></h4>
											<br>
										</div>
									</div>

									<div class="row">
										<div class="">
											<h3>
												<span>Số lượng còn trong kho : </span>
												<%=product.getQuantity()%></h3>
											<br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>