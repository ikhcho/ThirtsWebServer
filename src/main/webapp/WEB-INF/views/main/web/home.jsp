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
						<img class="nav" src="resources/img/logo_side.png">
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
				<div class="col-lg-9">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                           	IoT 스노보드 알아보기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                            	<li class="active"><a href="#description" data-toggle="tab">IoT 스노보드</a>
                                </li>
                                <li><a href="#free" data-toggle="tab">Free Mode</a>
                                </li>
                                <li><a href="#pendulum" data-toggle="tab">Pendulum Mode</a>
                                </li>
                                <li><a href="#turn" data-toggle="tab">Turn Mode</a>
                                </li>
                                <li><a href="#record" data-toggle="tab">Record Mode</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                            	<div class="tab-pane fade in active" id="description">
                                    <h4>THIRTS</h4>
                                    <img class="col-lg-6" src="resources/img/main.jpg">
                                    	<div class="panel-body">
                                    	<ul class="nav">
                                    		<li><p>사물 인터넷(Internet of Things, 약어로 IoT)은 각종 사물에 센서와 통신  기능을 내장하여 인터넷에 연결하는 기술을 의미한다.</p></li>
                                    		<li><p>‘스노보드’라는 스포츠에 IT기술을 접목시킨 솔루션으로 보드 및 기타 장비에  센서와 게이트웨이를 부착하여 밸런스 및 속도를 측정하는 솔루션</p></li>
                                    		<li><p>MPXV7002DP(공기압센서), MPU-9250(9축 모션센서), FSR-406(압력센서)를 이용하여 사용자의 정보를 센싱한다.</p></li>
											<li><p>설계된 알고리즘에 따라 사용자에게 오디오 음성 및 LED 불빛을 이용해 자세를 컨설팅한다.</p></li>
											<li><p>수집된 센서 데이터는 회원별로 데이터베이스에 누적되며, 웹 및 안드로이드 어플리케이션을 통해 개인 로그 정보를 확인할 수 있다.</p></li>
										 </ul>
										 </div>
                                </div>
                                <div class="tab-pane fade" id="free">
                                    <h4>Free Mode</h4>
                                	<ul>
                                    	<li><p>기본 모드로, 속도 알람, 자세 측정, 위치 측정을 수행</p></li>
                                    	<li><p>속도가 Max 이상일 시 음성 알람</p></li>
                                    	<li><p>자세측정 : 1초에 1번씩 Fall-down 확인, Fall-down 발생시 Alarm</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="pendulum">
                                    <h4>Pendulum Mode</h4>
                                	<ul>
                                    	<li><p>보드 동작 중 가장 기본이 되는 “Pendulum“동작을 수행하기 위한 모드, 초보자용 모드이다.</p></li>
                                    	<li><p>현 모드에서 속도 알람은 사용되지 않는다.</p></li>
                                    	<li><p>사용자가 Riding 중 5초에 1번씩 자세를 판별한다.</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="turn">
                                    <h4>Turn Mode</h4>
                                	<ul>
                                    	<li><p>보드 동작 중 하나인 Turn 동작을 분석하기 위한 모드, 중급자 이상의 사용자 모드</p></li>
                                    	<li><p>본 모드의 사용 권장 시간은 30초이내로, 1번의 Turn 동작을 분석하기 위해 사용된다. 따라서, 사용자는 시작과 함께 1번의 Turn 동작을 수행 후 종료 버튼을 눌러 즉각적으로 자세를 컨설팅 받는다.</p></li>
                                    	<li><p>0.2초 주기로 기울기와 압력값을 기록한다.</p></li>
                                    	<li><p>사용자가 종료 버튼을 누르면 기록된 데이터를 분석하여 Alarm을 준다.</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="record">
                                    <h4>Record Mode</h4>
                                	<ul>
                                    	<li><p>랭킹 시스템을 위한 기록 모드, Alarm 없이 구간 내 데이터를 기록</p></li>
                                    	<li><p>사용 구간 내 최고속도, 평균속도, 시간, 넘어진 횟수를 고려하여 평점을 매긴다.</p></li>
                                    	<li><p>본 모드로 저장된 평점을 비교하여 사용자간의 랭킹을 나눈다.</p></li>
									</ul>        
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-3">
                <a onclick="recent()" style="cursor:pointer">
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
				</a>
				<!-- 전체기록 -->
				<a onclick="all_list()" style="cursor:pointer">
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
				</a>
				<a onclick="rank()" style="cursor:pointer">
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
				</a>
				<a onclick="community()" style="cursor:pointer">
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
				</a>
				<%if (session.getAttribute("Smac") == null && session.getAttribute("Sname") != null) {%>
				<a onclick="device()" style="cursor:pointer">
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
				</a>
				<%}%>
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
