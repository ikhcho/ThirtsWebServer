<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.speed.SpeedVo"%>
<%@ page import="com.thirts.speed.SpeedService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<%
	List<SpeedVo> LSV = (List<SpeedVo>)request.getAttribute("lsv");
	int size = LSV.size();
	
	String[] date = new String[size];
	String[] yy = new String[size];
	String[] mm = new String[size];
	String[] dd = new String[size];
	String[] hour = new String[size];
	String[] min = new String[size];
	String[] sec = new String[size];
	
	String[] score = new String[size];
	String[] falldown = new String[size];
	int index=0;
	String[] tmpDate={};
	
	SpeedVo sv = new SpeedVo();
	for(int v=0; v <size; v++)
	{
		sv = LSV.get(v);
		
		if(sv.getDate() != null)
		{
			date[index] = sv.getDate();
			tmpDate = date[index].split(" ");
			yy[index] = tmpDate[0];
			mm[index] = tmpDate[1];
			dd[index] = tmpDate[2];
			hour[index] = tmpDate[3];
			min[index] = tmpDate[4];
			sec[index] = tmpDate[5];
			System.out.println(yy[index]);
			System.out.println(mm[index]);
			score[index] =sv.getScore();
			falldown[index++] =sv.getFalldown();
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

<script src="//www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		<% if(session.getAttribute("Sid") != null && sv.getScore() != null){%>

		var scoreArr = new Array();
		<%for (int j = 0; j < index; j++) {%>
		scoreArr[<%=j%>] = <%=score[j]%>;
		<%}%>
		
		<%}%>
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', '평점');
		
		for (var i = 0; i < <%=index%>; i++) {
			data.addRows([[ i, scoreArr[i]] ]);
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
		<% if(session.getAttribute("Sid") != null && sv.getFalldown() != null){%>

		
		var falldownArr = new Array();
		<%for (int k = 0; k < index; k++) {%>
		falldownArr[<%=k%>] = <%=falldown[k]%>;
		<%}%>
		
		<%}%>
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', '넘어진 횟수');
		
		for (var i = 0; i < <%=index%>; i++) {
			data.addRows([[ i,  falldownArr[i] ] ]);
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
		<% if(session.getAttribute("Sid") != null && sv.getDate() != null){%>

		
		var falldownArr = new Array();
		<%for (int k = 0; k < index; k++) {%>
		falldownArr[<%=k%>] = <%=falldown[k]%>;
		<%}%>
		
		<%}%>
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', '넘어진 횟수');
		
		for (var i = 0; i < <%=index%>; i++) {
			data.addRows([[ i,  falldownArr[i] ] ]);
		}

		var chart = new google.visualization.LineChart(document.getElementById('linechart_material3'));

		chart.draw(data);

	}
</script>
<!-- 날짜별 그래프
<script src="//www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		<% if(session.getAttribute("Sid") != null && sv.getDate() != null){%>
		
		var yyArr = new Array();
		<%for (int n = 0; n < index; n++) {%>
		yyArr[<%=n%>] = <%=yy[n]%>;
		<%}%>
		
		var mmArr = new Array();
		<%for (int n = 0; n < index; n++) {%>
		mmArr[<%=n%>] = <%=mm[n]%>;
		<%}%>
		
		var ddArr = new Array();
		<%for (int n = 0; n < index; n++) {%>
		ddArr[<%=n%>] = <%=dd[n]%>;
		<%}%>
		
		var scoreArr = new Array();
		<%for (int j = 0; j < index; j++) {%>
		scoreArr[<%=j%>] = <%=score[j]%>;
		<%}%>
		
		var falldownArr = new Array();
		<%for (int k = 0; k < index; k++) {%>
		falldownArr[<%=k%>] = <%=falldown[k]%>;
		<%}%>
		
		<%}%>
		

	var data = new google.visualization.DataTable();

		data.addColumn('datetime', '날짜');
		data.addColumn('number', '평점');
		data.addColumn('number', '넘어진 횟수');
		
		for (var i = 0; i < <%=index%>; i++) {
			data.addRows([[ new Date(yyArr[i],mmArr[i],ddArr[i]), scoreArr[i], falldownArr[i] ] ]);
		}

		var chart = new google.charts.Line(document
				.getElementById('linechart_material'));

		chart.draw(data);

	}
</script>

  -->
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
		</div>
</form>
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
                                        	<td>${val.date}</td>
                                        	<td>${val.max_v}</td>
                                        	<td>${val.average_v}</td>
                                        	<td>${val.time}</td>
                                        	<td>${val.distance}</td>
                                        	<td>${val.score}</td>
                                        	<td>${val.falldown}</td>
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
							<div class="pull-right">
								<div class="btn-group">
									<button type="button"
										class="btn btn-default btn-xs dropdown-toggle"
										data-toggle="dropdown">
										Actions <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li><a href="#">일</a></li>
										<li><a href="#">월</a></li>
										<li><a href="#">년</a></li>
										<li class="divider"></li>
										<li><a href="#">?</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<div id="curve_chart1" style="height: 250px;"></div>
					</div>
					<div class="panel-body">
						<div id="curve_chart2" style="height: 250px;"></div>
					</div>

					<!-- /.col-lg-6 -->

				</div>

                <!-- /.col-lg-12 -->
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
