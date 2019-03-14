<%@page import="model.BillDetail"%>
<%@page import="dao.BillDetailDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Insert title here</title>
</head>
<body class="nav-md">

	<%
		BillDetailDAO billDetailDAO = new BillDetailDAO();
		long BillID = 0, userID = 0;
		if (request.getParameter("bill_id") != null) {
			BillID = (long) Long.parseLong(request.getParameter("bill_id"));
		}
		if (request.getParameter("user_id") != null) {
			userID = (long) Long.parseLong(request.getParameter("user_id"));
		}
		ArrayList<BillDetail> listBillDetail = billDetailDAO.getBillDetailByBillID(BillID);
		BillDAO billDAO = new BillDAO();
		ProductDAO productDAO = new ProductDAO();
		UsersDAO usersDAO = new UsersDAO();
	%>

	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col" role="main">
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Chi tiết đơn hàng :
									<%=BillID%></h2>
								<div class="clearfix"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3>Thông tin khách hàng</h3>
									<div>
										<p>
											Tên khách hàng :
											<%=usersDAO.getUserbyID(userID).getUserName()%></p>
										<p>
											Email :
											<%=usersDAO.getUserbyID(userID).getUserEmail()%></p>
										<p>
											Điện thoại :
											<%=usersDAO.getUserbyID(userID).getUserPhone()%></p>
									</div>
								</div>
								<div
									class="col-md-4 col-sm-4 col-xs-4 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
									<h3>Thông tin đơn hàng</h3>
									<div>
										<p>
											Ngày đặt hàng :
											<%=billDAO.getBillByID(userID).getOrderDate()%></p>
										<p>
											Ngày giao hàng :
											<%=billDAO.getBillByID(userID).getShipDate()%></p>
										<p>
											Địa chỉ giao hàng :
											<%=billDAO.getBillByID(userID).getAddress()%></p>
									</div>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<form action="/MobieShop/ManagerBillServlet" method="post"
										class="form-inline">
										<div class="form-group">
											<label for="select">Trạng thái đơn hàng</label> <select
												name="status" id=select class="form-control">
												<option value="PREPARING" selected>PREPARING</option>
												<option value="NOT RECEIVED">NOT RECEIVED</option>
												<option value="SHIPPING">SHIPPING</option>
												<option value="FINISH">FINISH</option>
											</select>
											<button type="submit" class="btn btn-success" name="bill_id"
												value="<%=BillID%>">Cập nhật</button>
										</div>
									</form>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="table-responsive">
									<table class="table table-striped jambo_table bulk_action">
										<thead>
											<tr class="headings">
												<th class="column-title" style="width: 50%;">Sản phẩm</th>
												<th class="column-title">Đơn giá</th>
												<th class="column-title">Số lượng</th>
												<th class="column-title">Tổng tiền</th>
											</tr>
										</thead>

										<tbody>
											<%
												for (BillDetail billDetail : listBillDetail) {
											%>
											<tr class="even pointer">
												<td class=" ">
													<div class="col-md-2 col-sm-2 col-xs-2">
														<img
															src="../imageProduct/<%=productDAO.getProduct(billDetail.getProductID()).getProductImage1()%>"
															style="width: 100%; height: auto;">
													</div>
													<div class="col-md-4 col-sm-4 col-xs-4">
														<p><%=productDAO.getProduct(billDetail.getProductID()).getProductName()%></p>
														
													</div>
													<div class="col-md-6 col-sm-6 col-xs-6">
														<p>Hệ điều hành : <%=productDAO.getProduct(billDetail.getProductID()).getHedieuhanh()%></p>
														<p>Camara : <%=productDAO.getProduct(billDetail.getProductID()).getCamara()%></p>
														<p>CPU : <%=productDAO.getProduct(billDetail.getProductID()).getCpu()%></p>
														<p>Ram : <%=productDAO.getProduct(billDetail.getProductID()).getRam()%></p>
														<p>Rom : <%=productDAO.getProduct(billDetail.getProductID()).getRom()%></p>
													</div>
												</td>
												<td class=" "><%=billDetail.getPrice()%></td>
												<td class=" "><%=billDetail.getQuantity()%></td>
												<td class=" "><%=billDetail.getPrice() * billDetail.getQuantity()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
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