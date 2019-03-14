<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Trang chủ Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/MobieShop/bootstrap-3.3.7-dist/css/bootstrap.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/MobieShop/bootstrap-3.3.7-dist/fonts/font-awesome.min.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/MobieShop/css/custom.min.css" rel="stylesheet">
</head>
<body class="nav-md">
	<%
		Users user = (Users) session.getAttribute("user");
	%>

	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;"></div>

			<div class="clearfix"></div>

			<div class="profile clearfix">
				<div class="profile_pic">
					<img src="images/img.jpg" alt="..." class="img-circle profile_img">
				</div>
				<div class="profile_info">
					<span>Welcome</span>
					<h2><%=user.getUserName()%></h2>
				</div>
			</div>
			<!-- /menu profile quick info -->

			<br />

			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div>
					<ul class="nav side-menu">
						<li><a><i class="fa fa-edit"></i> Quản lý <span
								class="caret"></span></a>
							<ul class="nav child_menu   ">
								<li><a href="/MobieShop/admin/manager_user.jsp">Quản lý
										người dùng</a></li>
								<li><a href="/MobieShop/admin/manager_category.jsp">Quản
										lý danh mục</a></li>
								<li><a href="/MobieShop/admin/manager_product.jsp">Quản
										lý sản phẩm </a></li>
								<li><a href="/MobieShop/admin/manager_bill.jsp">Quan lý
										đơn hàng</a></li>
								<li><a href="/MobieShop/admin/manager_news.jsp">Quan lý
										tin tức</a></li>
							</ul></li>

						<li><a><i class="fa fa-bar-chart-o"></i> Thống kê <span
								class="caret"></span></a>
							<ul class="nav child_menu">
								<li><a href="/MobieShop/admin/manager_chart_category.jsp">Thống
										kê mặt hàng</a></li>
							</ul></li>

						<li><a><i class="fa fa-user"></i> Tài khoản <span
								class="caret"></span></a>
							<ul class="nav child_menu">
								<li><a href="/MobieShop/admin/update_profile_admin.jsp">Thay đổi thông tin</a></li>
								<li><a href="/MobieShop/admin/changePassword_admin.jsp">Đổi mật khẩu</a></li>
								<li><a href="AdminServlet?command=destroysession">Thoát</a></li>
							</ul></li>

					</ul>
				</div>
			</div>
			<!-- /sidebar menu -->
		</div>
	</div>

	<!-- top navigation -->
	<div class="top_nav">
		<div class="nav_menu">
			<nav>
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>
			</nav>
		</div>
	</div>
	<!-- /top navigation -->



	<!-- jQuery -->
	<script src="/MobieShop/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
	<!--Bootstrap-->
	<script src="/MobieShop/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/MobieShop/bootstrap-3.3.7-dist/js/custom.min.js"></script>
</body>
</html>