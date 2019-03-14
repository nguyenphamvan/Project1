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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Quản lý đơn hàng</title>
<style type="text/css">
@media ( max-width : 1440px) and (min-width: 750px) {
	label {
		width: 100%;
	}
}
</style>
</head>
<body class="nav-md">

	<%
		BillDAO billDAO = new BillDAO();
		ArrayList<Bill> listBill = billDAO.getListBill();
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
								<h2>Quản lý đơn hàng</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
							<h4><strong> Tìm kiếm đơn hàng :</strong></h4>
								<input class="form-control" id="myInput" type="text" placeholder="Search.."><br>
								<table id="datatable"
									class="table table-striped jambo_table bulk_action">
									<thead>
										<tr>
											<th width="30px">Mã Bill</th>
											<th class="column-title">Khách hàng</th>
											<th class="column-title">Tổng hóa đơn</th>
											<th class="column-title">Thanh toán</th>
											<th class="column-title">Địa chỉ giao hàng</th>
											<th class="column-title">Ngày mua</th>
											<th class="column-title">Ngày giao</th>
											<th class="column-title">Trạng thái</th>
											<th class="column-title" width="90px;">Tùy chọn</th>
										</tr>
									</thead>


									<tbody id="myTable">
										<%
											for (Bill bill : listBill) {
										%>
										<tr>
											<td width="30px"><%=bill.getBillID()%></td>
											<td><%=usersDAO.getUserbyID(bill.getUserID()).getUserEmail()%></td>
											<td><%=bill.getTotal()%></td>
											<td><%=bill.getPayment()%></td>
											<td><%=bill.getAddress()%></td>
											<td><%=bill.getOrderDate()%></td>
											<td><%=bill.getShipDate()%></td>
											<td><%=bill.getStatus()%></td>
											<td>
												<center>
													<a
														href="bill_detail.jsp?bill_id=<%=bill.getBillID()%>&user_id=<%=bill.getUserID()%>"
														class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>
														View 
													</a>
												</center>
											</td>
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
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
</body>
</html>