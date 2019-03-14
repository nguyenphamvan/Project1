<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>login</title>
<meta charset="utf-8">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css"
	rel="stylesheet">
<link href="bootstrap-3.3.7-dist/fonts/font-awesome.min.css"
	rel="stylesheet">
<script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">

</head>
<body>

	<div id="login-overlay" class="modal-dialog">

		<div class="modal-header">
			<h3 class="modal-title" id="myModalLabel">Nhập thông tin tài khoản hoặc đăng ký</h3>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-6">
					
		                <div class="row" style="padding-top: 50px;">
		                    <form action="UsersServlet" method="POST" class="form-group">
		                        <%if(request.getAttribute("error")!=null){%>
		                        <div>
		                            <p style="color:red"><%=request.getAttribute("error")%></p>
		                        </div> 
		                        <%}%>
		                        <div>
		                            <span>Tài khoản </span>
		                            <input type="text" name="email" class="form-control" placeholder="VD: MobieShop@gmail.com" autofocus="" required=""/>
		                        </div> 	
		                         <div> 
		                            <span class="word">Mật khẩu </span>
		                            <input type="password" name="pass" class="form-control" placeholder="Nhap mat khau" required=""/>
		                        </div>	
		                        <%if(request.getAttribute("error")!=null){%>
								<div id="loginErrorMsg" class="alert alert-error hide"><%=request.getParameter("error")%></div>
								<%}%>
								<br>
		                        <input type="hidden" value="login" name="command">
		                        <input type="submit" value="Login" class="btn btn-success"> 
		                    </form>
		                </div>
					
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<p class="lead">
						Đăng kí tài khoản <span class="text-success">ONLINE</span>
					</p>
					<ul class="list-unstyled" style="line-height: 2">
						<li><span class="glyphicon glyphicon-ok"></span> <a href="">Cung cấp các sản phẩm mới nhất</a></li>
						<li><span class="glyphicon glyphicon-ok"></span> <a href="">Cung cấp linh kiện thay thế</a></li>
						<li><span class="glyphicon glyphicon-ok"></span> <a href="">Hỗ trợ mua trả góp</a></li>
						<li><span class="glyphicon glyphicon-ok"></span> <a href="">Đội ngũ nhân viên nhiệt tình</a></li>
						<li><span class="glyphicon glyphicon-ok"></span> <a href="">Nhiều khuyến mại </a> </li>
					</ul>
					<p>
						<a href="register.jsp" class="btn btn-info btn-block">Đăng kí ngay</a>
					</p>
				</div>
			</div>
		</div>

	</div>

</body>
</html>