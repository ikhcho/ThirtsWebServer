<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<%
	session.setAttribute("Sid",	null);
	session.setAttribute("Sname",	null);
	session.setAttribute("Smac", null);
%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Thirts</title>

<!-- Bootstrap Core CSS -->
<link
	href="resources/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="resources/bootstrap/dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/bootstrap/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="resources/bootstrap/bower_components/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="resources/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script type="text/javascript">
	function loginCheck() {
		
		var form = document.l;
		form.action = "<%=request.getContextPath()%>/m_login_check";
		form.submit();
	}
	function RegisterCheck() {
		location.replace("<%=request.getContextPath()%>/m_register");
	}
</script>
</head>

<body>

	<div id="wrapper">
		
	<div id="page-wrapper">

        <div class="row">

            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" class="signin" name="l">
                            <fieldset>
                                <div class="form-group">
                                    <input id="id" name="id" type="text" class="form-control" placeholder="Id" autocomplete="on" required autofocus>
									
                                </div>
                                <div class="form-group">
                                    <input id="password" name="password" type="password" class="form-control" placeholder="Password" required>
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <a class="btn btn-lg btn-success btn-block" onclick="loginCheck()">Login</a>
								<a class="btn btn-lg btn-primary btn-block" onclick="RegisterCheck()">Register</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<!-- jQuery -->
	<script
		src="resources/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="resources/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script
		src="resources/bootstrap/bower_components/raphael/raphael-min.js"></script>
	<script
		src="resources/bootstrap/bower_components/morrisjs/morris.min.js"></script>
	<script src="resources/bootstrap/js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>

</body>

</html>
