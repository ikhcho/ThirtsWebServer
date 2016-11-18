<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page import="com.thirts.rank.RankVo"%>
<%@ page import="com.thirts.rank.RankService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<%
	
	List<RankVo> LRVM = (List<RankVo>)request.getAttribute("lrvm");
	List<RankVo> LRVA = (List<RankVo>)request.getAttribute("lrva");
	List<RankVo> LRVS = (List<RankVo>)request.getAttribute("lrvs");
	int m_index=0;
	int a_index=0;
	int s_index=0;
	int size=0;
	if(LRVM != null)
	{
		size=LRVM.size();
	}
	int[][] max_rank = new int[size][2];
	int[][] avr_rank = new int[size][2];
	int[][] scr_rank = new int[size][2];
	for(int i=0; i <size; i++)
	{
		if(LRVM.get(i).getId().equals(session.getAttribute("Sid")))
		{
			max_rank[m_index][0]=LRVM.get(i).getNum();
			max_rank[m_index++][1]=i+1;
		}
		if(LRVA.get(i).getId().equals(session.getAttribute("Sid")))
		{
			avr_rank[a_index][0]=LRVM.get(i).getNum();
			avr_rank[a_index++][1]=i+1;
		}
		if(LRVS.get(i).getId().equals(session.getAttribute("Sid")))
		{
			scr_rank[s_index][0]=LRVM.get(i).getNum();
			scr_rank[s_index++][1]=i+1;
		}
	}
	//insert sort
	int min_index=0;
	int[][] temp = new int[m_index][2];
	if(request.getParameter("type") != null)
	{
		if(request.getParameter("type").equals("max"))
		{
			for(int j=0; j<m_index-1;j++)
			{
				min_index=j;
				for(int k=j+1; k<m_index; k++)
				{
					if(max_rank[min_index][0] > max_rank[k][0])
					{
						min_index=k;
					}
				}
				temp[j][0]=max_rank[min_index][0];
				temp[j][1]=max_rank[min_index][1];
				max_rank[min_index][0]=max_rank[j][0];
				max_rank[min_index][1]=max_rank[j][1];
				max_rank[j][0]=temp[j][0];
				max_rank[j][1]=temp[j][1];
			}
		}
		else if(request.getParameter("type").equals("average"))
		{
			for(int j=0; j<a_index-1;j++)
			{
				min_index=j;
				for(int k=j+1; k<a_index; k++)
				{
					if(avr_rank[min_index][0] > avr_rank[k][0])
					{
						min_index=k;
					}
				}
				temp[j][0]=avr_rank[min_index][0];
				temp[j][1]=avr_rank[min_index][1];
				avr_rank[min_index][0]=avr_rank[j][0];
				avr_rank[min_index][1]=avr_rank[j][1];
				avr_rank[j][0]=temp[j][0];
				avr_rank[j][1]=temp[j][1];
			}
		}
		else if(request.getParameter("type").equals("score"))
		{
			for(int j=0; j<s_index-1;j++)
			{
				min_index=j;
				for(int k=j+1; k<s_index; k++)
				{
					if(scr_rank[min_index][0] > scr_rank[k][0])
					{
						min_index=k;
					}
				}
				temp[j][0]=scr_rank[min_index][0];
				temp[j][1]=scr_rank[min_index][1];
				scr_rank[min_index][0]=scr_rank[j][0];
				scr_rank[min_index][1]=scr_rank[j][1];
				scr_rank[j][0]=temp[j][0];
				scr_rank[j][1]=temp[j][1];
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

	<% if(m_index != 0 && request.getParameter("type") != null){%>
		
	var rankArr = new Array();
	<%for (int j = 0; j < m_index; j++) {%>
	rankArr[<%=j%>] = <%if(request.getParameter("type").equals("max")){%><%=max_rank[j][1]%>;
	<%}else if(request.getParameter("type").equals("average")){%><%=avr_rank[j][1]%>;
	<%}else if(request.getParameter("type").equals("score")){%><%=scr_rank[j][1]%>;<%}%>

	<%}%>
	<%}%>

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', '등수');

		for (var i = 0; i < <%=m_index%>; i++) {
			data.addRows([ [ i+1, rankArr[i]] ]);
		}

		var chart = new google.charts.Line(document
				.getElementById('rank'));

		chart.draw(data);

	}
</script>

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
	function ski() {
		var form = document.f;
		form.action = "ski";
		form.submit();
	}
	function board() {
		var form = document.f;
		form.action = "board";
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
							<li><a class="btn" onclick="ski()"><i
									class="fa fa-pied-piper-alt fa-fw"></i> 스키장정보</a></li>
							<li><a class="btn" onclick="board()"><i
									class="fa fa-youtube-play fa-fw"></i> 보드교육</a></li>
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
						<%=session.getAttribute("Sname")%>님의 랭킹정보 입니다.
					</h1>
					<%
						}
					%>
					<!-- 이름 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-bar-chart-o fa-fw"></i>슬로프별 랭킹차트
								<div class="pull-right">
									<div class="btn-group">
										<button type="button"
											class="btn btn-default btn-xs dropdown-toggle"
											data-toggle="dropdown">
											<%if(request.getParameter("location") != null){ %><%=LRVM.get(0).getLocation()%><%}else{ %>슬로프 선택<%} %> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><a href="rank?location=thirts">THIRTS 리조트</a></li>
											
										</ul>
									</div>
								</div>
							</div>
						</div>
	<%if(request.getParameter("location") != null){ %>
			<div class="row">
				<div class="col-lg-4">
					<div class="panel panel-default">
	                        <div class="panel-heading">
	                            	최고속도별 랭킹
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th>등수</th>
	                                            <th>ID</th>
	                                            <th>최고속도</th>
	                                            <th>날짜</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr class="success">
	                                            <td>1</td>
	                                            <td><%=LRVM.get(0).getName() %></td>
	                                            <td><%=LRVM.get(0).getMax_v() %></td>
	                                            <td><%=LRVM.get(0).getDate() %></td>
	                                        </tr>
	                                        <tr class="info">
	                                            <td>2</td>
	                                            <td><%=LRVM.get(1).getName() %></td>
	                                            <td><%=LRVM.get(1).getMax_v() %></td>
	                                            <td><%=LRVM.get(1).getDate() %></td>
	                                        </tr>
	                                        <tr class="warning">
	                                            <td>3</td>
	                                            <td><%=LRVM.get(2).getName() %></td>
	                                            <td><%=LRVM.get(2).getMax_v() %></td>
	                                            <td><%=LRVM.get(2).getDate() %></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <!-- /.table-responsive -->
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                   
                </div>
				<div class="col-lg-4">
					<div class="panel panel-default">
	                        <div class="panel-heading">
	                            	평균속도별 랭킹
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th>등수</th>
	                                            <th>ID</th>
	                                            <th>평균속도</th>
	                                            <th>날짜</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr class="success">
	                                            <td>1</td>
	                                            <td><%=LRVA.get(0).getName() %></td>
	                                            <td><%=LRVA.get(0).getAverage_v() %></td>
	                                            <td><%=LRVA.get(0).getDate() %></td>
	                                        </tr>
	                                        <tr class="info">
	                                            <td>2</td>
	                                            <td><%=LRVA.get(1).getName() %></td>
	                                            <td><%=LRVA.get(1).getAverage_v() %></td>
	                                            <td><%=LRVA.get(1).getDate() %></td>
	                                        </tr>
	                                        <tr class="warning">
	                                            <td>3</td>
	                                            <td><%=LRVA.get(2).getName() %></td>
	                                            <td><%=LRVA.get(2).getAverage_v() %></td>
	                                            <td><%=LRVA.get(2).getDate() %></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <!-- /.table-responsive -->
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    </div>
				<div class="col-lg-4">
					<div class="panel panel-default">
	                        <div class="panel-heading">
	                            	평점별 랭킹
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th>등수</th>
	                                            <th>ID</th>
	                                            <th>평점</th>
	                                            <th>날짜</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr class="success">
	                                            <td>1</td>
	                                            <td><%=LRVS.get(0).getName() %></td>
	                                            <td><%=LRVS.get(0).getScore() %></td>
	                                            <td><%=LRVS.get(0).getDate() %></td>
	                                        </tr>
	                                        <tr class="info">
	                                            <td>2</td>
	                                            <td><%=LRVS.get(1).getName() %></td>
	                                            <td><%=LRVS.get(1).getScore() %></td>
	                                            <td><%=LRVS.get(1).getDate() %></td>
	                                        </tr>
	                                        <tr class="warning">
	                                            <td>3</td>
	                                            <td><%=LRVS.get(2).getName() %></td>
	                                            <td><%=LRVS.get(2).getScore() %></td>
	                                            <td><%=LRVS.get(2).getDate() %></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <!-- /.table-responsive -->
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    </div>
	                    
                </div>
                <div class="row">
                <div class="col-lg-12">
	                <div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-bar-chart-o fa-fw"></i>슬로프별 랭킹차트
									<div class="pull-right">
										<div class="btn-group">
											<button type="button"
												class="btn btn-default btn-xs dropdown-toggle"
												data-toggle="dropdown">
												<%if(request.getParameter("type") == null){%>선택<%}else{%><%=request.getParameter("type")%><%} %><span class="caret"></span>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><a href="rank?location=thirts&type=max">최고속도</a></li>
												<li><a href="rank?location=thirts&type=average">평균속도</a></li>
												<li><a href="rank?location=thirts&type=score">평점</a></li>
												
											</ul>
										</div>
									</div>
								</div>
							</div>
						<div id="rank" style="height: 400px;"></div>
					</div>
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
