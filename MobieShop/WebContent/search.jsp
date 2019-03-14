<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Sản phẩm</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		ProductDAO productDAO = new ProductDAO();		
		
		int pages = 0, firstResult = 0, maxResult = 0, total = 0;
		String keyWord = null;
		if(request.getAttribute("keyWord") != null){
			pages = 1;
			keyWord =  String.valueOf(request.getAttribute("keyWord"));
		}else{
			keyWord = String.valueOf(request.getParameter("keyWord1"));
			pages = (int) Integer.parseInt(request.getParameter("pages"));
		}

		total = productDAO.countProductByKeyword(keyWord);
		if (total <= 8) {
			firstResult = 0;
			maxResult = total;
		} else {
			firstResult = (pages - 1) * 8;
			maxResult = 8;
		}

		ArrayList<Product> listProduct = productDAO.getListProductByKeyWord(keyWord, firstResult, maxResult);
	%>
	<div class="container">
		<div class="row">

			<%
				for (Product p : listProduct) {
			%>
			<div class="col-md-3 col-sm-3 col-xs-12 col-lg-3" style="padding-top: 20px">
				<div class="panel panel-primary">
					<div class="panel-body">
						<img src="imageProduct/<%=p.getProductImage1()%>" class="img-responsive"
							style="width: 100%; height: 235px;" alt="Image">
					</div>
					<div class="panel-footer">
						<p>
						<h5>
							<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a>
						</h5>
						</p>
						<p>
							<span>Giá : </span><span style="color: red;"><%=formatter.format(p.getProductPrice())%>
								VND</span>
						</p>
						<p>
							<span>Tình trạng </span>
							<%
								if (p.getQuantity() > 0) {
							%>
							<span>Còn hàng</span>
							<%
								} else {
							%>
							<span>Hết hàng</span>
							<%
								}
							%>
						</p>
						<p>
							<span><a
								href="CartServlet?command=plus&productID=<%=p.getProductID()%>"
								class="btn btn-warning">MUA HÀNG</a></span> <span style="float: right;"><a
								href="single.jsp?productID=<%=p.getProductID()%>"
								class="btn btn-primary">XEM CHI TIẾT</a></span>
						<p>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<hr>

		<div class="row">
			<ul class="pagination">
				<%
							for (int i = 1; i <= (total / 8) + 1; i++) {
						%>
				<li><a href="search.jsp?keyWord1=<%=keyWord%>&pages=<%=i%>"><%=i%></a></li>
				<%
							}
						%>
			</ul>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>