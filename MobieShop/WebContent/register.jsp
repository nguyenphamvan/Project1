<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Dăng ký</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
  <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet">
  <link href="bootstrap-3.3.7-dist/fonts/font-awesome.min.css" rel="stylesheet"> 
  <script src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
   <link href="css/style.css" rel="stylesheet">
  <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet"> 
  
  <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#youremail").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('false');
                    $.post('CheckEmailServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
   </script>
 

</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
<div class="jumbotron">
  <div class="container text-center" >
    <h1>Mobie Shop</h1>      
    <p>Đẳng cấp và chất lượng</p>
  </div>
</div>




<div class="container" style="padding-top: 20px;">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm col-md-offset-4">
            <legend><a href=""><i class="glyphicon glyphicon-globe"></i></a> Đăng ký thành viên</legend>
            <form action="UsersServlet" method="post" class="form" role="form">
                <input class="form-control" name="yourname" placeholder="Ho ten" required="" autofocus="" type="text">
                <input class="form-control" name="yourphone" placeholder="So dien thoai" type="tel">
                <input class="form-control" name="youraddress" placeholder="Dia chi" type="text">
                <input class="form-control" name="youremail" placeholder="Email" type="email"><span id="user-result"></span>
                <input class="form-control" name="yourpass" placeholder="Mat khau" type="password">
                <input class="form-control" name="retypepassword" placeholder="Nhap lai mat khau" type="password">
                <label for="">Ngày sinh : </label><input class="form-control" name="yourbirth" placeholder="ngày sinh" type="date">
                <label>Giới tính </label><br>
                <label class="radio-inline"><input name="sex" id="inlineCheckbox1" value="1" type="radio">  Nam </label> 
                <label class="radio-inline"><input name="sex" id="inlineCheckbox2" value="0" type="radio"> Nữ </label>
                <br><br>
                <button class="btn btn-lg btn-primary btn-block" type="submit" name="command" value="Register"> Đăng kí</button>
            </form>
        </div>
    </div>
</div>



<footer class="container-fluid text-center" style="padding-top: 20px;">
  <p>Online Store Copyright</p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer>

</body>
</html>
