<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Giỏ hàng</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>


	<h2 class="text-center">Giỏ hàng của bạn</h2>
	<div class="container" style="min-height: 200px;">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 65%;">sản phẩm</th>
					<th style="width: 8%; text-align: center;">Giá</th>
					<th style="width: 8%; text-align: center;">Số lượng</th>
					<th style="width: 14%; text-align: center;">Thành tiền</th>
					<th style="width: 5%;"></th>
				</tr>
			</thead>
			<%
				for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
			%>
			<tbody>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<img src="imageProduct/<%=list.getValue().getProduct().getProductImage1()%>"
									alt="Sản phẩm 1" class="img-responsive"
									style="width: 80px; height: 80px;">
							</div>
						
						<div class="col-sm-4 col-md-4 ">
								<h4 class="nomargin"><%=list.getValue().getProduct().getProductName()%></h4>
						</div>
						<div class="col-sm-6 col-md-6 ">
								<p class="nomargin">Hệ điều hành: <%=list.getValue().getProduct().getHedieuhanh()%></p>
								<p class="nomargin">Camara :<%=list.getValue().getProduct().getCamara()%></p>
								<p class="nomargin">CPU : <%=list.getValue().getProduct().getCpu()%></p>
								<p class="nomargin">Ram : <%=list.getValue().getProduct().getRam()%> - Rom : <%=list.getValue().getProduct().getRom()%></p>
						</div>
						</div>
					</td>
					<td class="text-center"><%=formatter.format(list.getValue().getProduct().getProductPrice())%></td>
					<td class="text-center"><%=list.getValue().getQuantity()%></td>
					<td class="text-center"><%=formatter.format(list.getValue().getQuantity() * list.getValue().getProduct().getProductPrice())%></td>
					<td class="text-center">
							<button class="btn btn-danger btn-sm">
								<i class="glyphicon glyphicon-trash"><a
									href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"></a></i>
							</button>
					</td>
				</tr>
			</tbody>
			<%
				}
			%>
			<br>
			<tfoot>
				<tr>
					<td><a href="index.jsp" class="btn btn-warning"><i
							class="glyphicon glyphicon-menu-left"></i> Tiếp tục mua hàng</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>Tổng tiền :
							<%=formatter.format(cart.totalCart())%> VND
					</strong></td>
					<td><a href="CheckOut.jsp" class="btn btn-success btn-block">Thanh
							toán <i class="glyphicon glyphicon-menu-right"></i>
					</a></td>
				</tr>
			</tfoot>
		</table>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>