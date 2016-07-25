<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thirts</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/mobile/jquery.mobile-1.4.5.min.css"
	rel="stylesheet" />
<link href="resources/mobile/jquery-ui.min.css" rel="stylesheet" />

<script src="resources/mobile/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	$(document).bind("mobileinit", function(){
		$.mobile.ajaxLinksEnabled = false;
		$.mobile.ajaxFormsEnabled = false;
		$.mobile.ajaxEnabled = false;
	});
	</script>
<script src="resources/mobile/jquery.mobile-1.4.5.min.js"></script>
<script src="resources/mobile/jquery-ui.min.js"></script>


<script type="text/javascript">
	function loginCheck() {
		var form = document.f;
		form.action = "<%=request.getContextPath()%>/home";
		form.submit();
	}
	function RegisterCheck() {
		location.replace("<%=request.getContextPath()%>/register");
	}
</script>

<style>
#center {
	background-image: url("resources/img/login.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

#title {
	font-style: italic;
	font-size:300%;
	margin-top: 5%;
}

#submit {
	margin-top: 10%;
	margin-bottom:10%;
}
#table
{
	margin-top:5%;
	background-color:white;
	border-style: outset;
    border-width: 5px;
    width:20%;
}
</style>
</head>
<body>
	<div data-role="page" data-theme="a" id="center" height="wrapped">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-md-offset-4">
					<center>
						<h1 class="text-center login-title" id="title" >T H I R T S</h1>
						<div id="description">
						<img src="">

						</div>
						<div id="table">
						<img src="resources/img/login_icon.png">
							<form method="post" class="signin" name="f">	
								<div>
									<input id="id" name="id" type="text" class="form-control"
										placeholder="Username" autocomplete="on" required autofocus>
									<input id="password" name="password" type="password"
										class="form-control" placeholder="Password" required>
								</div>
								<div id="submit">
									<button class="btn btn-lg btn-primary btn-block"
										onclick="loginCheck()">Login</button>
									<button class="btn btn-lg btn-primary btn-block"
										onclick="RegisterCheck()">Register</button>
								</div>
							</form>
						</div>
					</center>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
