<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Thanh Toan</title>

</head>
<body>

	<%
		Users users = (Users) session.getAttribute("user");
		if (users == null) {
			response.sendRedirect("/MobieShop/login.jsp");
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container body">
		<div class="main_container">
			<div class="row">
				<div class="profile-content">
					<div class="x_title col-md-12">
						<h2 style="text-align: center;">Nhập thông tin thanh toán</h2>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"
						style="padding: 5%; box-shadow: 1px 5px 8px">

						<form action="CheckOutServlet" method="POST">
							<div class="form-group">
								<span>Địa chỉ </span> <input type="text" name="address"
									class="form-control">
							</div>
							<div class="form-group">
								<span>Hình thức thanh toán </span> <select name="payment"
									class="form-control">
									<option value="Bank transfer">Bank transfer</option>
									<option value="Live">Live</option>
								</select>
							</div>
							<input class="btn btn-success" type="submit" value="Checkout">
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>