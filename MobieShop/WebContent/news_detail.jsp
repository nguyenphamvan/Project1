<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Chi tiết tin tức</title>
</head>
<body>
	<%
		NewsDAO newsDAO = new NewsDAO();
		long newsID = Long.parseLong(request.getParameter("news_id"));
		News news = newsDAO.getListNewsById(newsID);
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="background-color: #fff;">
			<div class="col-md-3 col-sm-3 col-xs-12 col-lg-3 "
				style="background: #D3D3D3">
				<div class="row">
					<img alt="Image" src="imageAdvertisement/bannerSamSung_news.jpg"
						style="width: 100%; height: 550px;">
				</div>
			</div>

		<div class="col-md-9 col-sm-9 col-xs-12 col-lg-9">
			<div class="row">
				<div class="col-md-12 col-xs-12 col-sm-12">
					<h3><%=news.getNews_title()%></h3>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-xs-12 col-sm-12">
					<p><%=news.getContent1()%></p>
				</div>
			</div>

			<div class="row">
				<dir class="col-md-3 col-sm-3 col-lg-3 col-xs-12"></dir>
				<dir class="col-md-6 col-sm-6 col-lg-6 col-xs-12">
					<img alt="Image" src="imageProduct/<%=news.getImageName()%>"
						style="width: 100%; height: 350	px;">
				</dir>
				<dir class="col-md-3 col-sm-3 col-lg-3 col-xs-12"></dir>
			</div>

			<div class="row">
				<p><%=news.getContent2() %></p>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>