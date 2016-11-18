<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page import="com.thirts.rank.RankVo"%>
<%@ page import="com.thirts.rank.RankService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<%
	int myrank=0;

	
	if(request.getAttribute("lrv") != null)
	{
			
		List<RankVo> LRV = (List<RankVo>)request.getAttribute("lrv");
		
		for(int i=0; i <LRV.size(); i++)
		{
			if(session.getAttribute("Sid").equals(LRV.get(i).getId()))
			{
				myrank=i+1;
					break;
				
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
						<%=session.getAttribute("Sname")%>님 프로필
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
				
				<div class="col-lg-3">
					<div class="panel panel-default">
                        <div class="panel-heading">
                           		프로필
                           		 </div>
                        <div class="panel-body">
                        	<div style="height: 400px;background-image: url('resources/img/profile_default.jpg'); background-size: cover;background-repeat: no-repeat;"></div>
                        </div>
                        <div class="panel-footer">
                        	프로필 수정
                        </div>
                    </div>
				</div>
				<div class="col-lg-1"></div>
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
										<span class="col-xs-12 text-center">최근이용 슬로프</span>
										<div class="clearfix"></div>
									</div>
							</div>
					<!-- 전체기록 -->
					
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
								
									<span class="col-xs-12 text-center">총 이용 횟수</span>
									<div class="clearfix"></div>
								</div>			
						</div>
					
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
									<span class="col-xs-12 text-center">가입자수</span> 
									<div class="clearfix"></div>
								</div>
						</div>
					</div>
					<div class="col-lg-3">
					
						<div class="panel panel-red">
						<a onclick="device()" style="cursor:pointer">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-gear fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<h1><%if (session.getAttribute("Smac") == null) {%>등록된 장비가 없습니다.<%}else{%><%=session.getAttribute("Smac") %><%} %></h1>
									</div>
								</div>
							</div>
							</a>
								<div class="panel-footer">
									<span class="col-xs-12 text-center"><%if (session.getAttribute("Smac") == null) {%>장비등록<%}else{%>장비변경<%} %></span>
									<div class="clearfix"></div>
								</div>
								
						</div>
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-trophy fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<h1><%if(myrank!=0){%><%=myrank %>위 <%} %></h1>
									</div>
								</div>
							</div>
							
								<div class="panel-footer">
									<span class="col-xs-12 text-center">최고기록</span>
									<div class="clearfix"></div>
								</div>	
							</div>
					
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

	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>
</body>

</html>
