<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.speed.SpeedVo"%>
<%@ page import="com.thirts.speed.SpeedService"%>
<!DOCTYPE html>
<html lang="en">

<%

	String[] speed={};
	String[] gyro={};
	String[] falldown={};
	int time=60;
	SpeedVo sv = new SpeedVo();
			

		if(request.getAttribute("sv") != null)
		{
			sv = (SpeedVo) request.getAttribute("sv");
			speed = sv.getSpeed().split(",");
			gyro = sv.getGyro().split(",");
			falldown = sv.getFalldown().split(",");
			time = speed.length;
			for (int i = 1; i < time; i++) {
				if (gyro[i].equals("H")) {
					gyro[i] = "-10";
				}
				if (gyro[i].equals("E") || gyro[i].equals("B")) {
					gyro[i] = "-20";
				}
				if (gyro[i].equals("L")) {
					gyro[i] = "-30";
				}
				if (falldown[i].equals("E")) {
					falldown[i] = "-50";
				}
				if (falldown[i].equals("F")) {
					falldown[i] = "-40";
				}
			}
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
	function profile() {
		var form = document.f;
		form.action = "profile";
		form.submit();
	}
	function device() {
		window.open("device", "�����", "width=400, height=300");
	}
	function home() {
		var form = document.f;
		form.action = "home";
		form.submit();
	}
	function recent_f() {
		var form = document.f;
		form.action = "recent_free";
		form.submit();
	}
	function recent_p() {
		var form = document.f;
		form.action = "recent_pendulum";
		form.submit();
	}
	function recent_t() {
		var form = document.f;
		form.action = "recent_turn";
		form.submit();
	}
	function recent_r() {
		var form = document.f;
		form.action = "recent_record";
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

<script src="//www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
	<% if(session.getAttribute("Sid") != null && sv.getSpeed() != null){%>
	
	var speedArr = new Array();
	<%for (int j = 1; j < time; j++) {%>
	speedArr[<%=j%>] = <%=speed[j]%>;
	<%}%>
	
	var balArr = new Array();
	<%for (int k = 1; k < time; k++) {%>
	balArr[<%=k%>] = <%=gyro[k]%>;
	<%}%>

	
	var fallArr = new Array();
	<%for (int k = 1; k < time; k++) {%>
	fallArr[<%=k%>] = <%=falldown[k]%>;
	<%}%>
	<%}%>
	
	var data = new google.visualization.DataTable();

		data.addColumn('number', 'Time(s)');
		data.addColumn('number', 'Speed');
		data.addColumn('number', 'Balance');
		data.addColumn('number', 'fall-down');

		for (var i = 1; i < <%=time%>; i++) {
			data.addRows([ [ i, speedArr[i], balArr[i], fallArr[i] ] ]);
		}

		var chart = new google.charts.Line(document
				.getElementById('linechart_material'));

		chart.draw(data);

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
				<a class="navbar-brand">T H I R T S - IoT ���뺸��</a>
				
			</div>

			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">

				<!-- ���  -->
				<li class="dropdown" style="margin-right: 30px"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user" style="margin-right: 5px">
						<%
									if (session.getAttribute("Sid") != null) {
								%> 
						<li><a onclick="profile()"  style="cursor:pointer"><i class="fa fa-user fa-fw"></i> ������</a></li>
						<li><a onclick="device()"  style="cursor:pointer"><i class="fa fa-gear fa-fw"></i> �����</a></li>
						<li class="divider"></li>
						<li><a href="login"><i class="fa fa-user fa-fw"></i> �α׾ƿ�<%
									} else {
								%> 
						
						<li><a href="login"><i class="fa fa-user fa-fw"></i>�α���<%
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
									class="fa fa-dashboard fa-fw"></i> ����ȭ��</a></li>

							<li><a class="btn"><i
									class="fa fa-bar-chart-o fa-fw"></i> �ֱٱ��</a>
								<ul class="nav nav-second-level">
									<li><a class="col-xs-offset-3 text-left " onclick="recent_f()" style="cursor:pointer">Free Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_p()" style="cursor:pointer">Pendulum Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_t()" style="cursor:pointer">Turn Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_r()" style="cursor:pointer">Record Mode</a></li>
								</ul></li>

							<li><a class="btn" onclick="all_list()"><i
									class="fa fa-table fa-fw"></i> ��ü���</a></li>
							<li><a class="btn" onclick="rank()"><i
									class="fa fa-trophy fa-fw"></i> ��ü��ŷ</a></li>
							<li><a class="btn" onclick="community()"><i
									class="fa fa-group fa-fw"></i> Ŀ�´�Ƽ</a></li>
							<li><a class="btn" href="login"><i
									class="fa fa-user fa-fw"></i>
									<%
										if (session.getAttribute("Sid") == null) {
									%> �α���<%
										} else {
									%> �α׾ƿ�<%
										}
									%></a></li>
						</ul>
						<img class="nav" src="resources/img/logo_side.png">
					</div>
					<!-- /.sidebar-collapse -->
				</div>
			<!-- /.navbar-static-side -->
		</nav>
	</div>
	</form>
		<!--  										end navigation 								-->
		
		<div class ="row" id="page-wrapper">
			<div class="row">

				<div class="col-lg-12">
					<h1 class="page-header">
						<%
							if (session.getAttribute("Sname") == null) {
						%>
						IoT ���뺸�� �湮�� ȯ���մϴ�.
						<%
							}
						%>
						<%
							if (session.getAttribute("Sname") != null) {
						%>
						<%=session.getAttribute("Sname")%>���� Pendulum Mode �ֱٱ�� �Դϴ�.
					</h1>
					<%
						}
					%>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-bar-chart-o fa-fw"></i> ${sv.getLocation()} 	 ${sv.getDate()}
								<div class="pull-right">
									<div class="btn-group">
										<button type="button"
											class="btn btn-default btn-xs dropdown-toggle"
											data-toggle="dropdown">
											Actions <span class="caret"></span>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><a href="#">��</a></li>
											<li><a href="#">��</a></li>
											<li><a href="#">��</a></li>
											<li class="divider"></li>
											<li><a href="#">?</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<img class="col-lg-11" src="resources/img/slope_detail.jpg">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-bar-chart-o fa-fw"></i> �ð��� �ӵ�-�ڼ� ������
									<div class="pull-right">
										<div class="btn-group">
											<button type="button"
												class="btn btn-default btn-xs dropdown-toggle"
												data-toggle="dropdown">
												Actions <span class="caret"></span>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><a href="#">��</a></li>
												<li><a href="#">��</a></li>
												<li><a href="#">��</a></li>
												<li class="divider"></li>
												<li><a href="#">?</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div id="linechart_material" style="height: 500px;"></div>
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

	<!--
	<script
		src="resources/bootstrap/bower_components/raphael/raphael-min.js"></script>
	<script
		src="resources/bootstrap/bower_components/morrisjs/morris.min.js"></script>
	<script src="resources/bootstrap/js/morris-data.js"></script>
	 Morris Charts JavaScript -->

	<!-- Flot Charts JavaScript -->
	<script src="resources/bootstrap/bower_components/flot/excanvas.min.js"></script>
	<script src="resources/bootstrap/bower_components/flot/jquery.flot.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot/jquery.flot.pie.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot/jquery.flot.resize.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot/jquery.flot.time.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	<script src="resources/bootstrap/js/flot-data.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>
</body>

</html>
