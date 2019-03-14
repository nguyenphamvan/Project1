<%@page import="dao.UsersDAO"%>
<%@page import="model.Users"%>
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
<title>update admin</title>
</head>
<body class="nav-md">
	<%
		Users u = (Users) session.getAttribute("user");
		UsersDAO userDAO = new UsersDAO();
		Users user = userDAO.getUserByEmail(u.getUserEmail());
	%>

	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col" role="main">
				<div class="">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel" style="min-height: 500px;">
								<div class="x_title">
									<h3 style="text-align: center;">Thông tin cá nhân</h3>
									<div class="clearfix"></div>
								</div>

								<div class="x_content">
									<br />
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left"
										action="/MobieShop/AdminServlet" method="post">

										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="sdt">Nhap mat khau cu</label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="password" id="sdt" required="required" value=""
													class="form-control col-md-7 col-xs-12" name="old_pass">
											</div>
										</div>
										<%
											if (request.getAttribute("error") != null) {
										%>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-6 col-offset-md-4">
												<p style="color: red"><%=request.getAttribute("error")%></p>
											</div>
										</div>
										<%
											}
										%>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="address">Nhap mat khau moi</label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="password" id="address" required="required"
													value="" class="form-control col-md-7 col-xs-12"
													name="new_pass">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="address">Nhap lai mat khau moi</label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="password" id="address" required="required"
													value="" class="form-control col-md-7 col-xs-12"
													name="confirm_newpass">
											</div>
										</div>
										<%
											if (request.getAttribute("error2") != null) {
										%>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-6 col-offset-md-4">
												<p style="color: red"><%=request.getAttribute("error2")%></p>
											</div>
										</div>
										<%
											}
										%>

										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4">
												<button class="btn btn-primary" type="reset">Reset</button>
												<input type="hidden" name="user_id"
													value="<%=user.getUserID()%>">
												<button type="submit" class="btn btn-success" name="command"
													value="updatePassword">Thay doi</button>
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