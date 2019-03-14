<%@page import="dao.UsersDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Thông tin cá nhân</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
		Users u = (Users) session.getAttribute("user");
		UsersDAO userDAO = new UsersDAO();
		Users user = userDAO.getUserByEmail(u.getUserEmail());
	%>
	<div class="container body">
		<div class="row profile">
			<div class="col-md-3 col-sm-3 col-lg-3 ol-xs-12">
				<div class="profile-sidebar" style="min-height: 509px; background: #F1F3FA;">
					<div class="profile-userpic">
						<img src="imageAdvertisement/user.png" class="img-responsive"
							alt="Thông tin cá nhân">
					</div>
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							Chào mừng<br>
							<%=user.getUserName()%>
						</div>
					</div>
					<div class="profile-userbuttons">
						<a href="index.jsp" class="btn btn-success btn-sm">Trang chủ</a> 
						<a href="UsersServlet?command=destroysession" class="btn btn-danger btn-sm">Thoát</a>
					</div>
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="" style="color: black;"><i
									class="glyphicon glyphicon-info-sign"></i>Cập nhật thông tin cá nhân</a></li>
							<li><a href="changePassword.jsp"  style="color: black;"><i class="glyphicon glyphicon-edit"></i > Đổi mật khẩu </a></li>
							<li><a href="shopping_history.jsp" style="color: black;"><i
									class="glyphicon glyphicon-shopping-cart" ></i>Lịch sử mua hàng</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-9 col-sm-9 col-xs-12">
				<div class="right_col profile-content" role="main">

				<div class="row">
					<div class="x_title">
						<h3 style="text-align: center;">Thông tin cá nhân</h3>

						<div class="clearfix"></div>
					</div>
				</div>
				<div class="row">
					<div class="x_content">
						<br />
						<form id="demo-form2" data-parsley-validate
							class="form-horizontal form-label-left" action="UsersServlet"
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
										<label class="btn btn-default" data-toggle-class="btn-primary"
											data-toggle-passive-class="btn-default"> <input
											type="radio" name="sex" value="1"> &nbsp; Nam &nbsp;
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

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>