
<%@page import="dao.NewsDAO"%>
<%@page import="model.News"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Quản lý Tin  tức</title>
</head>
<body class="nav-md">
	<%
		NewsDAO newsDAO = new NewsDAO();
		ArrayList<News> listNews = newsDAO.getListNews();
		
	%>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col">

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel" style="min-height: 550px;">
							<div class="x_title">
								<h2>Quản lý Tin tức</h2>
								<div class="clearfix"></div>
							</div>
							<br>
							<div class="col-md-6">
								<a href="/MobieShop/admin/insert_news.jsp"
									class="btn btn-primary">Thêm Tin Tức</a>
							</div>


							<br> <br> <br>
							<div class="x_content">
							<h4><strong> Tìm kiếm thông tin về tin tức :</strong></h4>
								<input class="form-control" id="myInput" type="text" placeholder="Search.."><br>
								<table id="datatable"
									class="table table-striped jambo_table bulk_action">
									<thead>
										<tr>
											<th width="5%">STT</th>
											<th width="5%">Id</th>
											<th width="20%">Tiêu đề</th>
											<th width="10%">Ngày update</th>
											<th width="35%">Nội dung</th>
											<th width="10%">Ảnh</th>
											<th width="15%">Tùy chọn</th>
										</tr>
									</thead>


									<tbody id="myTable">
										<%
											int count = 0;
											for (News news : listNews) {
												count++;
										%>
										<tr>
											<td><%=count%></td>
											<td><%=news.getNews_id()%></td>
											<td><%=news.getNews_title()%></td>
											<td><%=news.getTime_update()%></td>
											<td><%=news.getContent1()%></td>
											<td><img alt="Image" src="../imageProduct/<%=news.getImageName()%>" style="width: 100px; height: 100px;"> </td>
											<td><a
												href="/MobieShop/admin/update_news.jsp?command=update&news_id=<%=news.getNews_id()%>"
												class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>
													Edit </a> <a
												href="/MobieShop/ManagerNewsServlet?command=delete&news_id=<%=news.getNews_id()%>"
												class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>
													Delete </a>
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
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
</body>
</html>