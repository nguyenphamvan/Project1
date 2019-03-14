<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Quản lý sản phẩm</title>
<style type="text/css">
@media ( max-width : 1440px) and (min-width: 700px) {
	label {
		width: 100%;
	}
}
</style>
</head>
<body class="nav-md">

	<%
		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> listPorduct = productDAO.getListProduct();
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();
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
								<h2>Quản lý sản phẩm</h2>
								<div class="clearfix"></div>
							</div>
							<br>
							<div class="">
								<a href="/MobieShop/admin/insert_product.jsp"
									class="btn btn-primary">Thêm sản phẩm mới</a>
							</div>

							<br>
							<div class="x_content">
							<h4><strong> Tìm kiếm sản phẩm :</strong></h4>
								<input class="form-control" id="myInput" type="text" placeholder="Search.."><br>
								<table id="datatable"
									class="table table-striped jambo_table bulk_action">
									<thead>
										<tr class="headings">
											<th width="5%">STT</th>
											<th width="30%">Tên sản phẩm</th>
											<th width="15%">Hãng sản xuất</th>
											<th width="10%">Ảnh</th>
											<th width="5%">Đơn giá</th>
											<th width="15%">Còn trong kho</th>
											<th width="20%">Tùy chọn</th>
										</tr>
									</thead>


									<tbody id="myTable">
										<%
											int count = 0;
											for (Product p : listPorduct) {
												count++;
										%>
										<tr>
											<td><%=count%></td>
											<td><%=p.getProductName()%></td>
											<td><%=categoryDAO.getCategory(p.getCategoryID()).getCategoryName()%></td>
											<td><img alt="Image" src="../imageProduct/<%=p.getProductImage1()%>"
												style="width: 80px; height: 100px;"></td>
											<td><%=p.getProductPrice()%></td>
											<td><center><%=p.getQuantity()%></center> </td>
											<td><a
												href="/MobieShop/admin/product_detail.jsp?product_id=<%=p.getProductID()%>"
												class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>
													View </a> <a
												href="/MobieShop/admin/update_product.jsp?command=update&product_id=<%=p.getProductID()%>"
												class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>
													Edit </a> <a
												href="/MobieShop/ManagerProductServlet?command=delete&product_id=<%=p.getProductID()%>"
												class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>
													Delete </a>
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