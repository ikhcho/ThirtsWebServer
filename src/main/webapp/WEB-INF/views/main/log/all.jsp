<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.speed.SpeedVo"%>
<%@ page import="com.thirts.speed.SpeedService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<%
	// 도표
	List<SpeedVo> LSV = (List<SpeedVo>)request.getAttribute("lsv");
	int size = LSV.size();
	
	String[] date = new String[size];
	
	String[] score = new String[size];
	String[] count = new String[size];
	int score_index=0;
	int count_index=0;
	String[] tmpDate={};
	
	SpeedVo sv = new SpeedVo();
	if(LSV.toString().equals("[null]"))
	{
		String state = "no data";
	}
	else
	{
		for(int v=0; v <size; v++)
		{
			sv = LSV.get(v);
			if(!sv.getScore().equals("X"))
			{
				score[score_index++] =sv.getScore();
			}
			count[count_index++] =sv.getCount();
		}	
	}
	
	// 선택한 데이터
	String[] speed={};
	String[] gyro={};
	String[] falldown={};
	String[] FRF={};
	String[] FRB={};
	String[] yaw={};
	
	int time=60;
	SpeedVo select_sv = new SpeedVo();
	if(request.getParameter("num") != null)
	{
		if(request.getAttribute("osv") != null)
		{
			select_sv = (SpeedVo) request.getAttribute("osv");
			if(select_sv.getMode().equals("T"))
			{
				String[] tmp_fsr={};
				tmp_fsr = select_sv.getFalldown().split(",");
				yaw = select_sv.getSpeed().split(",");
				gyro = select_sv.getGyro().split(",");
				
				FRF = select_sv.getFalldown().split(",");
				FRB = select_sv.getFalldown().split(",");
				
				time = yaw.length;
				int j=1;
				FRF[0] = "S";
				FRB[0] = "S";
				
				for(int i=1; i<time; i+=2 )
				{
					FRF[j] = tmp_fsr[i];
					FRB[j] = tmp_fsr[i+1];
					j++;
				}
				
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
				}
			}
			else
			{
				speed = select_sv.getSpeed().split(",");
				gyro = select_sv.getGyro().split(",");
				falldown = select_sv.getFalldown().split(",");
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
		window.open("device", "장비등록", "width=400, height=300");
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		<% if(session.getAttribute("Sid") != null && sv.getScore() != null){%>

		var scoreArr = new Array();
		<%for (int j = 0; j < score_index; j++) {%>
		scoreArr[<%=j%>] = <%=score[j]%>;
		<%}%>
		
		<%}%>
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', '평점');
		
		for (var i = 1; i <= <%=score_index%>; i++) {
			data.addRows([[ i, scoreArr[i-1]] ]);
		}

		 var options = {
		          curveType: 'function',
		          legend: { position: 'bottom' }
		        };

		        var chart = new google.visualization.LineChart(document.getElementById('curve_chart1'));

		        chart.draw(data, options);
		      }

	
</script>

<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		<% if(session.getAttribute("Sid") != null && sv.getCount() != null){%>

		
		var falldownArr = new Array();
		<%for (int k = 0; k < count_index; k++) {%>
		falldownArr[<%=k%>] = <%=count[k]%>;
		<%}%>
		
		<%}%>
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', '넘어진 횟수');
		
		for (var i = 1; i <= <%=count_index%>; i++) {
			data.addRows([[ i,  falldownArr[i-1] ] ]);
		}
		 var options = {
		          curveType: 'function',
		          legend: { position: 'bottom' }
		        };

		        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

		        chart.draw(data, options);
		      }
</script>


<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'line' ]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		<% if(session.getAttribute("Sid") != null && select_sv.getSpeed() != null && !select_sv.getMode().equals("T")){%>
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
		

		
		var data = new google.visualization.DataTable();

			data.addColumn('number', 'Time(s)');
			data.addColumn('number', 'Speed');
			data.addColumn('number', 'Balance');
			data.addColumn('number', 'fall-down');

			for (var i = 1; i < <%=time%>; i++) {
				data.addRows([ [ i, speedArr[i], balArr[i], fallArr[i] ] ]);
			}

		var chart = new google.visualization.LineChart(document.getElementById('linechart_material1'));

		chart.draw(data);
		<%}%>
	}
</script>
<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'line' ]});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		<% if(session.getAttribute("Sid") != null && select_sv.getMode() != null && select_sv.getMode().equals("T")){%>
		
		var frfArr = new Array();
		<%for (int k = 1; k < time; k++) {%>
		frfArr[<%=k%>] = <%=FRF[k]%>;
		<%}%>
		
		var frbArr = new Array();
		<%for (int k = 1; k < time; k++) {%>
		frbArr[<%=k%>] = <%=FRB[k]%>;
		<%}%>
		
		var yawArr = new Array();
		<%for (int k = 1; k < time; k++) {%>
		yawArr[<%=k%>] = <%=yaw[k]%>;
		<%}%>
		
		var balArr = new Array();
		<%for (int k = 1; k < time; k++) {%>
		balArr[<%=k%>] = <%=gyro[k]%>;
		<%}%>
		
		
		
		var data = new google.visualization.DataTable();
	
			data.addColumn('number', 'Time(s)');
			data.addColumn('number', 'FRF');
			data.addColumn('number', 'FRB');
			data.addColumn('number', 'YAW');
			data.addColumn('number', 'Balance');
	
			for (var i = 1; i < <%=time%>; i++) {
				data.addRows([ [( i*2/10), frfArr[i], frbArr[i], yawArr[i], balArr[i] ] ]);
			}


		var chart = new google.visualization.LineChart(document.getElementById('linechart_material2'));

	
	chart.draw(data);
	<%}%>
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

							<li><a class="btn"><i
									class="fa fa-bar-chart-o fa-fw"></i> 최근기록</a>
								<ul class="nav nav-second-level">
									<li><a class="col-xs-offset-3 text-left " onclick="recent_f()" style="cursor:pointer">Free Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_p()" style="cursor:pointer">Pendulum Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_t()" style="cursor:pointer">Turn Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_r()" style="cursor:pointer">Record Mode</a></li>
								</ul></li>

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
						
					</div>
					<!-- /.sidebar-collapse -->
				</div>
			<!-- /.navbar-static-side -->
		</nav>
	</div>
	</form>	
		<!--  										end navigation 								-->

		<div id="page-wrapper" class="row">
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
						<%=session.getAttribute("Sname")%>님의 전체기록 입니다.
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
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	전체기록 테이블
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                        	<th>모드</th>
                                            <th>날짜</th>
                                            <th>최고속도</th>
                                            <th>평균속도</th>
                                            <th>시간</th>
                                            <th>거리</th>
                                            <th>평점</th>
                                            <th>넘어진 횟수</th>
                                            <th>장소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                        <c:forEach var="val" items="${lsv}">
                                        <tr>
                                        	
	                                        	<td><a href="all?num=${val.num}">${val.mode}</a></td>
	                                        	<td>${val.date}</td>
	                                        	<td>${val.max_v}</td>
	                                        	<td>${val.average_v}</td>
	                                        	<td>${val.time}</td>
	                                        	<td>${val.distance}</td>
	                                        	<td>${val.score}</td>
	                                        	<td>${val.count}</td>
	                                        	<td>${val.location}</td>
                                        </tr>
                                       </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                
				<div class="col-lg-4">
					<!-- Area Chart Example 	 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 향상도
							
						</div>
					</div>
					<%if(size<5){%>
					<div class="panel-body">
						<div id="curve_chart1" style="height: 180px;"></div>
					</div>
					<div class="panel-body">
						<div id="curve_chart2" style="height: 180px;"></div>
					</div>
					<%} %>
					<%if(size>=5 && size <10){%>
					<div class="panel-body">
						<div id="curve_chart1" style="height: 200px;"></div>
					</div>
					<div class="panel-body">
						<div id="curve_chart2" style="height: 200px;"></div>
					</div>
					<%} %>
					<%if(size>=10){%>
					<div class="panel-body">
						<div id="curve_chart1" style="height: 250px;"></div>
					</div>
					<div class="panel-body">
						<div id="curve_chart2" style="height: 250px;"></div>
					</div>
					<%} %>
					<!-- /.col-lg-6 -->

				</div>
				
                <!-- /.col-lg-12 -->
            </div>
            	
            	 <% if(select_sv.getMode() != null && select_sv.getMode().equals("T")){ %>
					<!-- Area Chart Example 	 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 선택 데이터
							
						</div>
						
					</div>
					
					<div class="panel-body">
						<div id="linechart_material2" style="height:400px;"></div>
					</div>
					<%}else if(request.getParameter("num") != null){ %>
					<!-- Area Chart Example 	 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 선택 데이터
							
						</div>
						
					</div>
					<div class="panel-body">
						<div id="linechart_material1" style="height: 400px;"></div>
					</div>
					<%} %>

				
			
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
 	
 	<!-- DataTables JavaScript -->
    <script src="resources/bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="resources/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>

</html>
