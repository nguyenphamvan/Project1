<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update Tin tức</title>
</head>
<body class="nav-md">
	<%
		NewsDAO newsDAO = new NewsDAO();
		News news = newsDAO.getListNewsById(Long.parseLong(request.getParameter("news_id")));
	%>
	
	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col" role="main">

				<div>
                    <div class="right_col" role="main">
                        <div class="row"><h3>Cập nhật tin tức</h3></div>
                        <div class="row">
                            <div class="x_content">
                                <br />
                                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" 
                                action="/MobieShop/ManagerNewsServlet" method="post"
                                enctype="multipart/form-data">

                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="productName">Tiêu đề </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="productName" required="required" class="form-control col-md-7 col-xs-12" 
                                            name="title"
                                            value="<%=news.getNews_title()%>">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="productName">Nội dung 1</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea name="content1" rows="5" class="form-control col-md-7 col-xs-12"><%=news.getContent1()%></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="productName">Nội dung 2</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                           <textarea name="content2" rows="10" class="form-control col-md-7 col-xs-12"><%=news.getContent2()%></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="productName">Ảnh cũ </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <img alt="Image" src="../imageProduct/<%=news.getImageName()%>" style="width: 150px; height: 100px;" >
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="productName">Ảnh 
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="file" id="productName" required="required" class="form-control col-md-7 col-xs-12" 
                                            name="image" accept="image/*">
                                        </div>
                                    </div>
                                    
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button class="btn btn-primary" type="reset">Reset</button>
                                			<input type="hidden" name="news_id" value="<%=news.getNews_id()%>">
											<button type="submit" class="btn btn-success" name="command" value="update">Cap nhat</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                </div>

			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>