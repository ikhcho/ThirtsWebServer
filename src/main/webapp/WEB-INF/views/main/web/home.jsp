<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

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
	function profile() {
		var form = document.f;
		form.action = "profile";
		form.submit();
	}
	function device() {
		var form = document.f;
		form.action = "device";
		form.submit();
	}
	function home() {
		var form = document.f;
		form.action = "home";
		form.submit();
	}
	function recent() {
		var form = document.f;
		form.action = "recent";
		form.submit();
	}
	function all_list() {
		var form = document.f;
		form.action = "all";
		form.submit();
	}
	function rank() {
		var form = document.f;
		form.action = "rank";
		form.submit();
	}
	function community() {
		var form = document.f;
		form.action = "community";
		form.submit();
	}
</script>
</head>

<body>
<form method="post" class="signin" name="f">
				<input type="hidden" name="id"
					value="<%=session.getAttribute("Sid")%>">
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">T H I R T S - IoT 스노보드</a>
				
			</div>

			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">

				<!-- 사람  -->
				<li class="dropdown" style="margin-right: 30px"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user" style="margin-right: 5px">
						<%
									if (session.getAttribute("Sid") != null) {
								%> 
						<li><a onclick="profile()"  style="cursor:pointer"><i class="fa fa-user fa-fw"></i> 프로필</a></li>
						<li><a onclick="device()"  style="cursor:pointer"><i class="fa fa-gear fa-fw"></i> 장비등록</a></li>
						<li class="divider"></li>
						<li><a href="login"><i class="fa fa-user fa-fw"></i> 로그아웃<%
									} else {
								%> 
						
						<li><a href="login"><i class="fa fa-user fa-fw"></i>로그인<%
									}
								%></a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->
			
				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">

							<li><a class="btn" onclick="home()"><i
									class="fa fa-dashboard fa-fw"></i> 메인화면</a></li>

							<li><a class="btn" onclick="recent()"><i
									class="fa fa-bar-chart-o fa-fw"></i> 최근기록</a></li>

							<li><a class="btn" onclick="all_list()"><i
									class="fa fa-table fa-fw"></i> 전체기록</a></li>
							<li><a class="btn" onclick="rank()"><i
									class="fa fa-trophy fa-fw"></i> 전체랭킹</a></li>
							<li><a class="btn" onclick="community()"><i
									class="fa fa-group fa-fw"></i> 커뮤니티</a></li>
							<li><a class="btn" href="login"><i
									class="fa fa-user fa-fw"></i>
									<%
										if (session.getAttribute("Sid") == null) {
									%> 로그인<%
										} else {
									%> 로그아웃<%
										}
									%></a></li>
						</ul>
						<img class="nav" src="resources/img/logo.png">
					</div>
					<!-- /.sidebar-collapse -->
				</div>
			<!-- /.navbar-static-side -->
		</nav>
		<!--  										end navigation 								-->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<%
							if (session.getAttribute("Sname") == null) {
						%>
						IoT 스노보드 방문을 환영합니다.
						<%
							}
						%>
						<%
							if (session.getAttribute("Sname") != null) {
						%>
						<%=session.getAttribute("Sname")%>님 IoT 스노보드 방문을 환영합니다.
					</h1>
					<%
						}
					%>
					<!-- 이름 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<img class="col-lg-9" src="resources/img/login.jpg">
				<a onclick="recent()" style="cursor:pointer">
					<div class="col-lg-3">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-bar-chart-o fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<h1><c:choose>
										 <c:when test="${mainvo.getLocation() eq null}">
											0
										</c:when>
										<c:otherwise>
									        	${mainvo.getLocation()}
									    </c:otherwise>
										</c:choose></h1>
									</div>
								</div>
							</div>
								<div class="panel-footer">
									<span class="pull-left">최근기록</span> <span class="pull-right"><i
										class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
						</div>
					</div>
				</a>
				<!-- 전체기록 -->
				<a onclick="all_list()" style="cursor:pointer">
				<div class="col-lg-3">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-th-list fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h1>${mainvo.getCount()}</h1>
								</div>
							</div>
						</div>
							<div class="panel-footer">
							
								<span class="pull-left">전체기록</span><span class="pull-right">
								<i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>			
					</div>
				</div>
				</a>
				<a onclick="rank()" style="cursor:pointer">
				<div class="col-lg-3">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-trophy fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge"></div>
								</div>
							</div>
						</div>
							<div class="panel-footer">
								<span class="pull-left">랭킹보기</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</a>
				<a onclick="community()" style="cursor:pointer">
				<div class="col-lg-3">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-users fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h1>${mainvo.getMember()}</h1>
								</div>
							</div>
						</div>
							<div class="panel-footer">
								<span class="pull-left">커뮤니티</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
					</div>
				</div>
				</a>
				<%if (session.getAttribute("Smac") == null && session.getAttribute("Sname") != null) {%>
				<a onclick="device()" style="cursor:pointer">
				<div class="col-lg-3">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-gear fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h4>등록된 장비가 없습니다.</h4>
								</div>
							</div>
						</div>
							<div class="panel-footer">
								<span class="pull-left">장비등록</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
					</div>
				</div>
				</a>
				<%}%>
				
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
