<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BillDetail"%>
<%@page import="dao.BillDetailDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Lịch sử mua hàng</title>
<link href="css/style.css" rel="stylesheet">

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		Users user = (Users) session.getAttribute("user");

		BillDAO billDAO = new BillDAO();
		ArrayList<Bill> listBill = billDAO.getListBillByUserID(user.getUserID());

		BillDetailDAO billDetailDAO = new BillDetailDAO();
		ProductDAO productDAO = new ProductDAO();
	%>
	<div class="container body">
		<div class="row profile">
			<div class="col-md-3 col-sm-3 col-xs-12">
				<div class="profile-sidebar" style="background: #F1F3FA;">
					<div class="profile-userpic">
						<img src="imageAdvertisement/user.png" class="img-responsive"
							alt="Thông tin cá nhân">
					</div>
					<div class="profile-usertitle">
						<div class="profile-usertitle-name"><%=user.getUserName()%></div>
					</div>
					<div class="profile-userbuttons">
						<a href="index.jsp" class="btn btn-success btn-sm">Trang chủ</a> <a
							href="UsersServlet?command=destroysession"
							class="btn btn-danger btn-sm">Thoát</a>
					</div>
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="profile.jsp"
								style="color: black;"><i
									class="glyphicon glyphicon-info-sign"></i>Cập nhật thông tin cá nhân</a></li>
							<li><a href="changePassword.jsp" style="color: black;"
								class="glyphicon glyphicon-edit"></i> Đổi mật khẩu </a></li>
							<li><a href="shopping_history.jsp" style="color: black;"><i
									class="glyphicon glyphicon-shopping-cart"></i>Lịch sử mua hàng</a>
							</li>
						</ul>
					</div>
				</div>
			</div>


			<div class="col-md-9 col-sm-9 col-xs-12">

				<div class="shopping-history tab-content">
					<ul class="nav nav-pills x_title">
						<li class="active"><a data-toggle="pill" href="#1">Đã nhận</a></li>
						<li><a data-toggle="pill" href="#2">Đang đóng gói</a></li>
						<li><a data-toggle="pill" href="#3">Đang vận chuyển</a></li>
						<li><a data-toggle="pill" href="#4">Đơn hủy</a></li>
					</ul>
				</div>
				  <div class="tab-content">
				<div class="tab-pane fade in active" id="1">
					<%
						for (Bill b : listBill) {
					%>
					<%
						if (b.getStatus().equals("FINISH")) {
					%>
					<div class="shopping-history tab-content">
						<div class="x_content" >
							<div class="">
								<h4 style="float: left;">
									<span>Mã đơn hàng : </span><span><%=b.getBillID()%></span>
								</h4>
								<h4 style="float: right;">
									<span>Ngày mua : </span><span><%=b.getOrderDate()%></span>
								</h4>
							</div>

							<table id="cart" class="table table-hover table-condensed" style="margin-bottom: 0px;border: 1px solid black;">
								<thead>
									<tr>
										<th style="width: 20%"></th>
										<th style="width: 30%">Tên sản phẩm</th>
										<th style="width: 15%">Giá</th>
										<th style="width: 15%">Số lượng</th>
										<th style="width: 20%">Thành tiền</th>
									</tr>
								</thead>
								<%
									ArrayList<BillDetail> listBillDetail = billDetailDAO.getBillDetailByBillID(b.getBillID());
											for (BillDetail bd : listBillDetail) {
								%>
								<tbody>
									<tr>
										<td data-th="Product"><img
											src="imageProduct/<%=productDAO.getProduct(bd.getProductID()).getProductImage1()%>"
											alt="san pham 1" class="img-responsive"
											style="width: 80px; height: 80px;"></td>
										<td><p><%=productDAO.getProduct(bd.getProductID()).getProductName()%></p></td>
										<td><%=formatter.format(bd.getPrice())%> VND</td>
										<td><%=bd.getQuantity()%></td>
										<td><%=formatter.format(bd.getPrice() * bd.getQuantity())%>
											VND</td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
							<div class="">
								<h4 style="float: right;">
									<span><b>Tổng hóa đơn : </b></span><span><%=formatter.format(b.getTotal())%>
										VND</span>
								</h4>
							</div>
							<br>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>
				</div>
				

				<div class="tab-pane fade" id="2">
					<%
						for (Bill b : listBill) {
					%>
					<%
						if (b.getStatus().equals("PREPARING")) {
					%>
					<div class="shopping-history tab-content">
						<div class="x_content ">
							<div class="">
								<h4 style="float: left;">
									<span>Mã đơn hàng : </span><span><%=b.getBillID()%></span>
								</h4>
								<h4 style="float: right;">
									<span>Ngày mua : </span><span><%=b.getOrderDate()%></span>
								</h4>
							</div>

							<table id="cart" class="table table-hover table-condensed" style="margin-bottom: 0px; border: 1px solid black;">
								<thead>
									<tr>
										<th style="width: 20%"></th>
										<th style="width: 30%">Tên sản phẩm</th>
										<th style="width: 15%">Giá</th>
										<th style="width: 15%">Số lượng</th>
										<th style="width: 20%">Thành tiền</th>
									</tr>
								</thead>
								<%
									ArrayList<BillDetail> listBillDetail = billDetailDAO.getBillDetailByBillID(b.getBillID());
											for (BillDetail bd : listBillDetail) {
								%>
								<tbody>
									<tr>
										<td data-th="Product"><img
											src="imageProduct/<%=productDAO.getProduct(bd.getProductID()).getProductImage1()%>"
											alt="san pham 1" class="img-responsive"
											style="width: 80px; height: 80px;"></td>
										<td><p><%=productDAO.getProduct(bd.getProductID()).getProductName()%></p></td>
										<td><%=formatter.format(bd.getPrice())%> VND</td>
										<td><%=bd.getQuantity()%></td>
										<td><%=formatter.format(bd.getPrice() * bd.getQuantity())%>
											VND</td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
							<div class="row">
								<div class="col-md-2 col-sm-2 col-xs-12">
									<span style="display: inline-block;">
										<form action="ManagerBillServlet_user" method="post">
											<input type="hidden" value="CANCEL" name="status">
											<button type="submit" class="btn btn-danger" name="bill_id"
												value="<%=b.getBillID()%>">Hủy đơn hàng</button>
										</form>
									</span>
								</div>
								<div
									class="col-md-5 col-sm-5 col-xs-12 col-md-offset-5 col-sm-offset-5">
									<div class="row">
										<h4 style="float: left">
											<span><b>Tổng hóa đơn : </b></span><span><%=formatter.format(b.getTotal())%>
												VND</span>
										</h4>
									</div>

								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>
				</div>

				<div class="tab-pane fade" id="3">
					<%
						for (Bill b : listBill) {
					%>
					<%
						if (b.getStatus().equals("SHIPPING")) {
					%>
					<div class="shopping-history tab-content">
						<div class="x_content ">
							<div class="">
								<center>
									<h4>Xác nhận đơn hàng sau khi đã nhận</h4>
								</center>
							</div>

							<div class="">
								<h4 style="float: left;">
									<span>Mã đơn hàng : </span><span><%=b.getBillID()%></span>
								</h4>
								<h4 style="float: right;">
									<span>Ngày mua : </span><span><%=b.getOrderDate()%></span>
								</h4>
							</div>

							<table id="cart" class="table table-hover table-condensed" style="margin-bottom: 0px; border: 1px solid black;">
								<thead>
									<tr>
										<th style="width: 20%"></th>
										<th style="width: 30%">Tên sản phẩm</th>
										<th style="width: 15%">Gía </th>
										<th style="width: 15%">Số lượng</th>
										<th style="width: 20%">Thành tiền</th>
									</tr>
								</thead>
								<%
									ArrayList<BillDetail> listBillDetail = billDetailDAO.getBillDetailByBillID(b.getBillID());
											for (BillDetail bd : listBillDetail) {
								%>
								<tbody>
									<tr>
										<td data-th="Product"><img
											src="imageProduct/<%=productDAO.getProduct(bd.getProductID()).getProductImage1()%>"
											alt="san pham 1" class="img-responsive"
											style="width: 80px; height: 80px;"></td>
										<td><p><%=productDAO.getProduct(bd.getProductID()).getProductName()%></p></td>
										<td><%=formatter.format(bd.getPrice())%> VND</td>
										<td><%=bd.getQuantity()%></td>
										<td><%=formatter.format(bd.getPrice() * bd.getQuantity())%>
											VND</td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
							<div class="row">
								<div class="col-md-2 col-sm-2 col-xs-12">
									<span style="display: inline-block;">
										<form action="ManagerBillServlet_user" method="post">
											<input type="hidden" value="FINISH" name="status">
											<button type="submit" class="btn btn-success" name="bill_id"
												value="<%=b.getBillID()%>">Xác nhận đã nhận hàng</button>
										</form>
									</span>
								</div>


								<h4 style="float: right;">
									<span><b>Tổng hóa đơn : </b></span><span><%=formatter.format(b.getTotal())%>
										VND</span>
								</h4>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>
				</div>
				
				<div class="tab-pane fade" id="4">
					<%
						for (Bill b : listBill) {
					%>
					<%
						if (b.getStatus().equals("CANCEL")) {
					%>
					<div class="shopping-history tab-content">
						<div class="x_content ">
							<div class="">
								<center>
									<h4>Xác nhận đơn hàng sau khi đã nhận</h4>
								</center>
							</div>

							<div class="">
								<h4 style="float: left;">
									<span>Mã đơn hàng : </span><span><%=b.getBillID()%></span>
								</h4>
								<h4 style="float: right;">
									<span>Ngày mua : </span><span><%=b.getOrderDate()%></span>
								</h4>
							</div>

							<table id="cart" class="table table-hover table-condensed" style="margin-bottom: 0px; border: 1px solid black;">
								<thead>
									<tr>
										<th style="width: 20%"></th>
										<th style="width: 30%">Tên sản phẩm</th>
										<th style="width: 15%">Gía </th>
										<th style="width: 15%">Số lượng</th>
										<th style="width: 20%">Thành tiền</th>
									</tr>
								</thead>
								<%
									ArrayList<BillDetail> listBillDetail = billDetailDAO.getBillDetailByBillID(b.getBillID());
											for (BillDetail bd : listBillDetail) {
								%>
								<tbody>
									<tr>
										<td data-th="Product"><img
											src="imageProduct/<%=productDAO.getProduct(bd.getProductID()).getProductImage1()%>"
											alt="san pham 1" class="img-responsive"
											style="width: 80px; height: 80px;"></td>
										<td><p><%=productDAO.getProduct(bd.getProductID()).getProductName()%></p></td>
										<td><%=formatter.format(bd.getPrice())%> VND</td>
										<td><%=bd.getQuantity()%></td>
										<td><%=formatter.format(bd.getPrice() * bd.getQuantity())%>
											VND</td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
							<div class="row">
								<h4 style="float: right;">
									<span><b>Tổng hóa đơn : </b></span><span><%=formatter.format(b.getTotal())%>
										VND</span>
								</h4>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>