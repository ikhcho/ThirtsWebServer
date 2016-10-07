<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https:
        //oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
		var form = document.newac;
		form.action = "register";
		form.submit();
	}
</script>

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="text-center">회원가입</h3>
                        <div class="text-right"><a href="login"><i class="fa fa-arrow-left fa-fw"></i></a></div>
                    </div>
                    <div class="panel-body">
                        <form name="newac" method="post">
                            <fieldset>
                                <div class="form-group">
									<input name="id" type="text" placeholder="아이디" required autofocus>
								</div>
								<div class="form-group">
									<input type="password" name="password"  placeholder="패스워드" required>
								</div>
								<div class="form-group">
									<input type="password" name="password_check" placeholder="패스워드 재입력" required>
								</div>
								<div class="form-group">
									<input type="text" name="name" placeholder="이름" required>
								</div>
								<div class="form-group">
									<input type="text" name="email" placeholder="이메일" required>
								</div>
								<div class="form-group">
									<input type="text" name="phone" placeholder="전화번호" required>
                                </div>
                                <div class="form-group">
	                                <div id="submit">
										<input class="btn btn-lg btn-success btn-block" type="button" value="회원가입" onclick=submit()>
										<input class="btn btn-lg btn-success btn-block" type="reset" value="다시쓰기">
									</div>
                                </div>

                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="resources/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>

</body>

</html>
