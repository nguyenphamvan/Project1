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
										class="form-horizontal form-label-left" action="/MobieShop/AdminServlet"
										method="post">
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="email">Tài khoản </label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="email" id="email" required="required"
													value="<%=user.getUserEmail()%>"
													class="form-control col-md-7 col-xs-12" name="youremail">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="first-name">Họ tên </label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="text" id="first-name" required="required"
													value="<%=user.getUserName()%>"
													class="form-control col-md-7 col-xs-12" name="yourname">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="sdt">Điện thoại </label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="tel" id="sdt" required="required"
													value="<%=user.getUserPhone()%>"
													class="form-control col-md-7 col-xs-12" name="yourphone">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-4"
												for="address">Địa chỉ </label>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<input type="text" id="address" required="required"
													value="<%=user.getUserAddress()%>"
													class="form-control col-md-7 col-xs-12" name="youraddress">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-12"
												for="birthday">Ngày sinh </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="birthday" required="required" type="date"
													value="<%=user.getUserBirth()%>"
													class="date-picker form-control col-md-7 col-xs-12"
													name="yourbirth">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4 col-sm-4 col-xs-12">Giới
												tính</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div id="gender" class="btn-group" data-toggle="buttons">
													<label class="btn btn-default"
														data-toggle-class="btn-primary"
														data-toggle-passive-class="btn-default"> <input
														type="radio" name="sex" value="1"> &nbsp; Nam
														&nbsp;
													</label> <label class="btn btn-primary"
														data-toggle-class="btn-primary"
														data-toggle-passive-class="btn-default"> <input
														type="radio" name="sex" value="0"> Nữ
													</label>
												</div>
											</div>
										</div>

										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4">
												<button class="btn btn-primary" type="reset">Reset</button>
												<input type="hidden" name="user_id"
													value="<%=user.getUserID()%>">
												<button type="submit" class="btn btn-success" name="command"
													value="updateInfo">Cập nhật</button>
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