<%@page import="dao.CategoryDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cập nhật danh mục</title>
</head>
<body class="nav-md">
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		Category category = categoryDAO.getCategory(Long.parseLong(request.getParameter("category_id")));
	%>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col" role="main">
				<div class="">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<center>
										<h3>Cập nhật danh mục</h3>
										<div class="clearfix"></div>
									</center>
								</div>
								<div class="x_content" style="min-height: 500px;">
									<br />
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left"
										action="/MobieShop/ManagerCategoryServlet" method="post">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="suppler_brand"> Thương hiệu </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="suppler_brand" required="required"
													class="form-control col-md-7 col-xs-12" name="tenDanhMuc"
													value="<%=category.getCategoryName()%>">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="supplier_description">Mô tả </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="supplier_description" name="mota"
													required="required" class="form-control col-md-7 col-xs-12"
													value="<%=category.getDescription()%>">
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-primary" type="reset">Reset</button>
												<input type="hidden"
													name="category_id" value="<%=request.getParameter("category_id")%>">
												<button type="submit" class="btn btn-success" value="update"
													name="command">cập nhật</button>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>