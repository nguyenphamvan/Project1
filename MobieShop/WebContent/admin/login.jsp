
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

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
<% String error = (String)request.getAttribute("error"); %>
<body class="login">
	<div class="login_wrapper">
		<section>
			<form action="/MobieShop/AdminServlet" method="post">
				<%if(request.getAttribute("error")!=null){%>
				<div class="row">
					<p style="color: red"><%=request.getAttribute("error")%></p>
				</div>
				<%} %>
				<h3>Login</h3>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="email"
						type="text" class="form-control" name="email" placeholder="Email">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="password"
						type="password" class="form-control" name="pass"
						placeholder="Password">
				</div>
				<br>
				<div>
					<input type="hidden" value="adminlogin" name="command"> <input
						type="submit" value="Log in" class="btn btn-default submit">
				</div>
				<div class="clearfix"></div>
			</form>
		</section>
	</div>
</body>
</html>
