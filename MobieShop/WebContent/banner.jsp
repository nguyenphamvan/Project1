<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>banner</title>
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
	<!-- Banner -->
<div class="container">
      <div class="row">
      <div id="myCarousel" class="carousel slide container" data-ride="carousel" style="padding: 0;">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="image/iphonexs1.jpg" alt="Image" style="width: 100%; height: 370px;">
              <div class="carousel-caption">
                <h3>Sell $</h3>
                <p>Money Money.</p>
              </div>      
            </div>

           <div class="item">
              <img src="image/iphonexs.jpg" alt="Image" style="width: 100%; height: 370px;">
              <div class="carousel-caption">
                <h3>More Sell $</h3>
                <p>Lorem ipsum...</p>
              </div>      
            </div>

           <div class="item">
              <img src="image/note_9_banner.jpg" alt="Image" style="width: 100%; height: 370px;">
              <div class="carousel-caption">
                <h3>IPhone X $</h3>
                <p>Lorem ipsum...</p>
              </div>      
            </div>
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
      </div>
      </div>
    </div>
</body>
</html>