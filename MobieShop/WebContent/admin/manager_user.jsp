<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quản lý người dùng</title>
</head>
<body class="nav-md">

	<%
		UsersDAO userDAO = new UsersDAO();
		ArrayList<Users> listUser = userDAO.getListUser();
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
								<h2>Quản lý người dùng</h2>
								<div class="clearfix"></div>
							</div>
							<br>
							<div class="x_content">
								<h4>
									<strong>Tìm kiếm người dùng</strong>
								</h4>
								<input class="form-control" id="myInput" type="text"
									placeholder="Search.."><br>
								<table id="datatable"
									class="table table-striped jambo_table bulk_action">
									<thead>
										<tr class="headings">
											<th width="30px">STT</th>
											<th>Mã User</th>
											<th>Tên User</th>
											<th>SDT</th>
											<th>Địa chỉ</th>
											<th>Ngày sinh</th>
											<th>Email</th>
											<th>Giới tính</th>
											<th>Admin</th>
											<th>Tùy chọn</th>
										</tr>
									</thead>


									<tbody id="myTable">
										<%
											int count = 0;
											for (Users u : listUser) {
												count++;
										%>
										<tr>
											<td><%=count%></td>
											<td><%=u.getUserID()%></td>
											<td><%=u.getUserName()%></td>
											<td><%=u.getUserPhone()%></td>
											<td><%=u.getUserAddress()%></td>
											<td><%=u.getUserBirth()%></td>
											<td><%=u.getUserEmail()%></td>
											<% if(u.getUserSex()=="1"){ %>
											<td>nữ</td>
											<% }else{ %>
											<td>nam</td>
											<%} %>
											<% if(u.isUserRole()==false){ %>
											<td>User</td>
											<% }else{ %>
											<td>Admin</td>
											<%} %>
											<td>
												<center>
												 <div class="dropdown">
												 <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Phân quyền
												 <span class="caret"></span></button>
													<form action="/MobieShop/UsersServlet" method="post"
														class="form-inline dropdown-menu">
														<div class="form-group">
															<select
																name="role" class="form-control">
																<option value="0" selected>User</option>
																<option value="1">Admin</option>
															</select>
														</div>
														<input type="hidden" value="<%=u.getUserID()%>" name="user_id">
		                    							<button type="submit" class="btn btn-success" name="command"
														value="updateRole">Cập nhật</button>
													</form>
													</div>
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
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>
</html>