<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Quản lý danh mục sản phẩm</title>
</head>
<body class="nav-md">

	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();
	%>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col">

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Quản lý danh mục sản phẩm</h2>
								<div class="clearfix"></div>
							</div>
							<br>
							<div class="col-md-6">
								<a href="/MobieShop/admin/insert_category.jsp"
									class="btn btn-primary">Thêm danh mục sản phẩm</a>
							</div>


							<br> <br> <br>
							<div class="x_content">
								<table id="datatable"
									class="table table-striped jambo_table bulk_action">
									<thead>
										<tr>
											<th width="10%">STT</th>
											<th width="10%">Mã danh mục</th>
											<th width="20%">Tên danh mục</th>
											<th width="45%">Mô tả</th>
											<th width="15%">Tùy chọn</th>
										</tr>
									</thead>


									<tbody id="myTable">
										<%
											int count = 0;
											for (Category category : listCategory) {
												count++;
										%>
										<tr>
											<td><%=count%></td>
											<td><%=category.getCategoryID()%></td>
											<td><%=category.getCategoryName()%></td>
											<td><%=category.getDescription()%></td>
											<td><a
												href="/MobieShop/admin/update_category.jsp?command=update&category_id=<%=category.getCategoryID()%>"
												class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>
													Edit </a> <a
												href="/MobieShop/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>"
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
</body>
</html>