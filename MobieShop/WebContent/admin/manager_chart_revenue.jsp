<%@page import="dao.ChartDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Value"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bieu do, thong ke</title>

        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
		<%
			ChartDAO chartDAO = new ChartDAO();
			ArrayList<Value> list = chartDAO.getAll();
		%>
         <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            //load the Google Visualization API and the chart
            google.load('visualization', '1', {'packages': ['columnchart']});
 
            //set callback
            google.setOnLoadCallback (createChart);
 
            //callback function
            function createChart() {
 
                //create data table object
                var dataTable = new google.visualization.DataTable();
 
                //define columns
                dataTable.addColumn('string','Quarters 2009');
                dataTable.addColumn('number', 'so san pham');
 
                //define rows of data
                dataTable.addRows([ 
	                <% for(Value v : list){ %>
	                ['<%=v.getName() %>', <%=v.getValue() %>],
	                <% } %>
                ]);
 
                //instantiate our chart object
                var chart = new google.visualization.ColumnChart (document.getElementById('chart'));
 
                //define options for visualization
                var options = {width: 1200, height: 300, is3D: true, title: 'Thong ke danh muc san pham'};
 
                //draw our chart
                chart.draw(dataTable, options);
 
            }
        </script>
</head>
<body class="nav-md">

	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();
	%>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="menu.jsp"></jsp:include>

			<div class="clearfix"></div>

			<div class="right_col">

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>thong ke danh muc san pham</h2>
								<div class="clearfix"></div>
							</div>
							<br>
							
							<div class="x_content">
								<div id="chart" style="width:100%; height:280px;"></div>
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


