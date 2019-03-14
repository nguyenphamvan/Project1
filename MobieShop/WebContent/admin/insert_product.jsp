<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thêm sản phẩm</title>
 <script>
            var loadFile = function (event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('output');
                    output.src = reader.result;
                };
                reader.readAsDataURL(event.target.files[0]);
            };// code display image upload
        </script>
</head>
<body class="nav-md">
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();
	%>

	<%
		String error = "";
		if (request.getAttribute("error") != null) {
			error = (String) request.getAttribute("error");
		}
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
									<h3>Thêm sản phẩm mới</h3>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left"
										action="/MobieShop/ManagerProductServlet" method="post"
										enctype="multipart/form-data">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="productName">Tên sản phẩm </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="productName" required="required"
													class="form-control col-md-7 col-xs-12" name="tenSanPham">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="supplier">Nhà sản xuất </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<select name="idNSX" id="supplier"
													class="form-control col-md-7 col-xs-12">
													<%
														for (Category category : listCategory) {
													%>
													<option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="anh1"
												class="control-label col-md-3 col-sm-3 col-xs-12">Ảnh 1</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="anh1" class="form-control col-md-7 col-xs-12"
													type="file" name="anh1" accept="image/*" onchange="loadFile(event)">
											</div>
										</div>
										<div class="form-group">
											<label for="anh2"
												class="control-label col-md-3 col-sm-3 col-xs-12">Ảnh 2</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="anh2" class="form-control col-md-7 col-xs-12"
													type="file" name="anh2" accept="image/*" onchange="loadFile(event)">
											</div>
										</div>
										<div class="form-group">
											<label for="anh3"
												class="control-label col-md-3 col-sm-3 col-xs-12">Ảnh 3</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="anh3" class="form-control col-md-7 col-xs-12"
													type="file" name="anh3" accept="image/*" onchange="loadFile(event)">
											</div>
										</div>
										<div class="form-group">
											<label for="hdh"
												class="control-label col-md-3 col-sm-3 col-xs-12">Hệ
												điều hành</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="hdh" class="form-control col-md-7 col-xs-12"
													type="text" name="hdh">
											</div>
										</div>
										<div class="form-group">
											<label for="anh3"
												class="control-label col-md-3 col-sm-3 col-xs-12">Camara</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="camara" class="form-control col-md-7 col-xs-12"
													type="text" name="camara">
											</div>
										</div>
										<div class="form-group">
											<label for="cpu"
												class="control-label col-md-3 col-sm-3 col-xs-12">CPU</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="cpu" class="form-control col-md-7 col-xs-12"
													type="text" name="cpu">
											</div>
										</div>
										<div class="form-group">
											<label for="ram"
												class="control-label col-md-3 col-sm-3 col-xs-12">Ram
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="ram" class="form-control col-md-7 col-xs-12"
													type="text" name="ram">
											</div>
										</div>
										<div class="form-group">
											<label for="rom"
												class="control-label col-md-3 col-sm-3 col-xs-12">Rom
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="rom" class="form-control col-md-7 col-xs-12"
													type="text" name="rom">
											</div>
										</div>
										<div class="form-group">
											<label for="Price"
												class="control-label col-md-3 col-sm-3 col-xs-12">Đơn
												giá</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="Price" class="form-control col-md-7 col-xs-12"
													type="text" name="donGia">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">Nhập
												thêm </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="quantity" class="form-control col-md-7 col-xs-12"
													type="number" name="quantity" placeholder="">
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-primary" type="reset">Reset</button>
												<button type="submit" class="btn btn-success" name="command"
													value="insert">Thêm sản phẩm</button>
											</div>
										</div>

									</form>
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