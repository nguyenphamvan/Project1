<%@page import="dao.UsersDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thong tin ca nhan</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
		Users u = (Users) session.getAttribute("user");
		UsersDAO userDAO = new UsersDAO();
		Users user = userDAO.getUserByEmail(u.getUserEmail());
	%>
	<div class="container">
		<div class="row profile">
			<div class="col-md-3 col-sm-3 col-lg-3 ol-xs-12">
				<div class="profile-sidebar"
					style="min-height: 460px; background: #F1F3FA;">
					<div class="profile-userpic">
						<img src="imageAdvertisement/user.png" class="img-responsive"
							alt="Thông tin cá nhân">
					</div>
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							Chao mung<br>
							<%=user.getUserName()%>
							<%=user.getUserID()%></div>
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
									class="glyphicon glyphicon-info-sign"></i>Cập nhật thông tin cá
									nhân</a></li>
							<li><a href="changePassword.jsp" style="color: black;"><i
									class="glyphicon glyphicon-edit"></i> Đổi mật khẩu </a></li>
							<li><a href="shopping_history.jsp" style="color: black;"><i
									class="glyphicon glyphicon-shopping-cart"></i>Lịch sử mua hàng</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-9 col-sm-9 col-xs-12">
				<div class="profile-content">
					<div class="x_title">
						<h3 style="text-align: center;">Thay doi mat khau</h3>
					</div>
					<div class="x_content">
						<br />
						<form id="demo-form2" data-parsley-validate
							class="form-horizontal form-label-left" action="UsersServlet"
							method="post">

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

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>