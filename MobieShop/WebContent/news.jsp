<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tin tức</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		NewsDAO newsDAO = new NewsDAO();
	%>
	<div class="container">
			<div class="row" style="min-height: 460px;">
				<div class="col-md-3 col-sm-3 col-xs-12 col-lg-3 list"
				style="background: #D3D3D3">
				<ul class="nav nav-pills nav-stacked ">
					<li class="active"><a href="index.jsp">Danh mục</a></li>
					<%
						for (Category c : categoryDAO.getListCategory()) {
					%>
					<li><a style="background-color: #fff;"
						href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%=c.getCategoryName()%></a></li>
					<%
						}
					%>
				</ul>
			</div>
				<div class="col-md-9 col-sm-9 col-lg-9 col-xs-12">
					<div class="row">
						<h3
							style="line-height: 45px; margin: 0; font-size: 24px; background: #D3D3D3; border: 1px; text-align: left;">
							<b>Tin tức</b>
						</h3>
					</div>
					<% for(News news : newsDAO.getListNews()){ %>
					<div class="row">
						<div class="col-md-3">
							<img src="imageProduct/<%=news.getImageName()%>" style="width: 200px; height: 180px;">
						</div>
						<div class="col-md-9">
							<div class="row">
								<h4>
									<a href="news_detail.jsp?news_id=<%=news.getNews_id()%>"><b><%=news.getNews_title() %></b></a>
								</h4>
								<p><span>Thời gian :</span><span><%=news.getTime_update() %></span> </p>
							</div>
							<div class="row">
								<p><%=news.getContent1() %></p>
							</div>
						</div>
					</div>
					<% } %>

				</div>
			</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>