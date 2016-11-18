<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.thirts.account.LoginVo" %>

<!DOCTYPE html>
<html lang="en">
<%
	if(request.getParameter("macaddress") != null){
	LoginVo vo = (LoginVo) request.getAttribute("vo");
	session.setAttribute("Smac", vo.getMacaddress());
	}
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
	
	function saveDevice() {
		var form = document.f;
		form.action = "device";
		form.submit();
		alert("등록되었습니다");

	}
</script>
</head>

<body>
<form method="post" class="signin" name="f">
				<input type="hidden" name="id"
					value="<%=session.getAttribute("Sid")%>">

			<div class="col-lg-12">
				<div class="col-lg-3">
				<%if(session.getAttribute("Smac") == null){ %>
					<h3>현재 등록된 장비가 없습니다.</h3>
				<%}else{ %>
					<div>
						<h3>현재 <%=session.getAttribute("Smac")%> 장비가 등록되어 있습니다. </h3>
					</div>
				<%} %>
				</div>
					<div class="col-md-4">
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h3 class="panel-title">장비등록</h3>
		                    </div>
		                    <div class="panel-body">
		                    	<fieldset>
		                    		<div class="form-group">
		                    			<input id="macaddress" name="macaddress" type="text" class="form-control" placeholder="Serial No." autocomplete="on" required autofocus>
		                            </div>
	                                
	                                <!-- Change this to a button or input when using this as a form -->
	                                <a class="btn btn-lg btn-success btn-block" onclick="saveDevice()">장비등록</a>
	                            </fieldset>
	                    </div>
	                </div>
           		</div>
			</div>
	</form>
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
