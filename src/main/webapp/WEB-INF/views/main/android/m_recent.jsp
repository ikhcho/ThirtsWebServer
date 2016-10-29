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
		 var options = {
		          legend: { position: 'none' }
		        };
		var chart = new google.charts.Line(document
				.getElementById('linechart_material'));

		chart.draw(data,options);

	}
</script>

</head>

<body>
	<div id="wrapper">

		<div id="page-wrapper">
			

			<div class="col-xs-12">
				<div class="row">
				
					<div class="col-xs-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="glyphicon glyphicon-time fa-2x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div><h4>${sv.getTime()}초</h4></div>

									</div>
								</div>
							</div>
							<a>
								<div class="panel-footer">
									<span class="col-xs-12 text-center">시간</span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-xs-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-road fa-2x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div><h4>${sv.getDistance()}M</h4></div>
									</div>
								</div>
							</div>
							<a>
								<div class="panel-footer">
									<span class="col-xs-12 text-center">이동거리</span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- 랭킹 -->
					<div class="col-xs-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-dashboard fa-2x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div><h4>${sv.getAverage_v()}m/s</h4></div>
									</div>
								</div>
							</div>
							<a>
								<div class="panel-footer">
									<span class="col-xs-12 text-center">평균속도</span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<!-- 커뮤니티 -->
					<div class="col-xs-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-thumbs-up fa-2x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div><h4>${sv.getMax_v()}m/s</h4></div>

									</div>
								</div>
							</div>
							<a>
								<div class="panel-footer">
									<span class="col-xs-12 text-center">최고속도</span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="row">
				<div class="col-xs-12">
					<!-- Area Chart Example 	 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 기록
							<div class="pull-right">
								<div class="btn-group">
									<a href="m_tracking"><button>
										동선 
									</button></a>
									
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<div id="linechart_material" style="height: 300px;"></div>
					</div>

					<!-- /.col-lg-6 -->

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
