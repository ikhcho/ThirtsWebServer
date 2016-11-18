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
			<nav class="navbar navbar-default navbar-static-top"
				role="navigation" style="margin-bottom: 0">
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
					<li class="dropdown" style="margin-right: 30px"><a
						class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
							class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
					</a>
						<ul class="dropdown-menu dropdown-user" style="margin-right: 5px">
							<%
								if (session.getAttribute("Sid") != null) {
							%>
							<li><a onclick="profile()" style="cursor: pointer"><i
									class="fa fa-user fa-fw"></i> 프로필</a></li>
							<li><a onclick="device()" style="cursor: pointer"><i
									class="fa fa-gear fa-fw"></i> 장비등록</a></li>
							<li class="divider"></li>
							<li><a href="login"><i class="fa fa-user fa-fw"></i>
									로그아웃<%
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

							<li><a class="btn"><i class="fa fa-bar-chart-o fa-fw"></i>
									최근기록</a>
								<ul class="nav nav-second-level">
									<li><a class="col-xs-offset-3 text-left "
										onclick="recent_f()" style="cursor: pointer">Free Mode</a></li>
									<li><a class="col-xs-offset-3 text-left"
										onclick="recent_p()" style="cursor: pointer">Pendulum Mode</a></li>
									<li><a class="col-xs-offset-3 text-left"
										onclick="recent_t()" style="cursor: pointer">Turn Mode</a></li>
									<li><a class="col-xs-offset-3 text-left"
										onclick="recent_r()" style="cursor: pointer">Record Mode</a></li>
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
									class="fa fa-user fa-fw"></i> <%
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
							국내 스키장 정보입니다.
						</h1>
						
						<!-- 이름 -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">

					<iframe frameborder="0" class="col-lg-6"
						src="http://map.naver.com/?query=%EC%8A%A4%ED%82%A4%EC%9E%A5"
						style="height: 700px"></iframe>
					<div class="col-lg-3">
						
								<ul class="lst_map">
								<li id="sp_local_1">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=13094600"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=4&i=13094600&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(3);"
													onmouseout="lcs_clear_label();" title="곤지암 리조트"
													target="_blank">곤지암 리조트</a>
											</dt>
											
											<dd>
												<span class="tell">02-1661-8787</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="경기 광주시 도척면 도척윗로 278">경기
															광주시 도척면 도척윗로 278</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_2">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11583173"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=4&i=13094600&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(3);"
													onmouseout="lcs_clear_label();" title="무주 덕유산 리조트"
													target="_blank">무주 덕유산 리조트</a>
											</dt>
											
											<dd>
												<span class="tell">063-322-9000</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="경기 광주시 도척면 도척윗로 278">전라북도 무주군 설천면 만선로 185 무주리조트</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_3">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11583167"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=4&i=13094600&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(3);"
													onmouseout="lcs_clear_label();" title="베어스타운"
													target="_blank">베어스타운</a>
											</dt>
											
											<dd>
												<span class="tell">031-540-5000</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="경기도 포천시 내촌면 금강로2536번길 27">경기도 포천시 내촌면 금강로2536번길 27</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_4">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11727758"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=4&i=13094600&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(3);"
													onmouseout="lcs_clear_label();" title="보광 휘닉스파크"
													target="_blank">보광 휘닉스파크</a>
											</dt>
											
											<dd>
												<span class="tell">1577-0069</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="강원도 평창군 봉평면 태기로 174 보광휘닉스파크">강원도 평창군 봉평면 태기로 174 보광휘닉스파크</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_5">
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=13139708"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=1&i=13139708&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(0);"
													onmouseout="lcs_clear_label();" title="비발디파크"
													target="_blank">비발디파크</a>
											</dt>
											
											<dd>
												<span class="tell">1588-4888</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="강원 홍천군 서면 한치골길 262 대명비발디파크">강원
															홍천군 서면 한치골길 262 대명비발디파크</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_6">
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=13491540"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=1&i=13139708&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(0);"
													onmouseout="lcs_clear_label();" title="수안보이글벨리스키리조트"
													target="_blank">수안보이글벨리스키리조트</a>
											</dt>
											
											<dd>
												<span class="tell">043-846-3000</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="충청북도 충주시 수안보면 주정산로 203">충청북도 충주시 수안보면 주정산로 203</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_7">
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11583171"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=1&i=13139708&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(0);"
													onmouseout="lcs_clear_label();" title="스타힐리조트"
													target="_blank">스타힐리조트</a>
											</dt>
											
											<dd>
												<span class="tell">02-2233-5311</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="경기도 남양주시 화도읍 먹갓로 96 스타힐리조트">경기도 남양주시 화도읍 먹갓로 96 스타힐리조트</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_8">
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=12398587"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=1&i=13139708&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(0);"
													onmouseout="lcs_clear_label();" title="알펜시아"
													target="_blank">알펜시아</a>
											</dt>
											
											<dd>
												<span class="tell">033-339-0000</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt" title="경기도 남양주시 화도읍 먹갓로 96 스타힐리조트">강원도 평창군 대관령면 솔봉로 325 알펜시아리조트</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
								</ul>
							</div>
							<div class="col-lg-3">
								<ul class="lst_map">
									<li id="sp_local_9">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11583170"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="양지파인리조트"
													target="_blank">양지파인리조트</a>
											</dt>
											
											<dd>
												<span class="tell">031-338-2001</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="경기 용인시 처인구 양지면 남평로 112 양지파인리조트">경기 용인시 처인구
															양지면 남평로 112 양지파인리조트</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_10">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=12062940"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="에덴밸리 리조트"
													target="_blank">에덴밸리 리조트</a>
											</dt>
											
											<dd>
												<span class="tell">055-379-8000</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="경상남도 양산시 어실로 1206">경상남도 양산시 어실로 1206</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_11">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11555876"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="엘리시안 강촌"
													target="_blank">엘리시안 강촌</a>
											</dt>
											
											<dd>
												<span class="tell">033-260-2000</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="강원도 춘천시 남산면 북한강변길 688">강원도 춘천시 남산면 북한강변길 688</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_12">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=12118790"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="용평리조트"
													target="_blank">용평리조트</a>
											</dt>
											
											<dd>
												<span class="tell">033-335-5757 </span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="강원도 평창군 대관령면 올림픽로 715 용평리조트">강원도 평창군 대관령면 올림픽로 715 용평리조트</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_13">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11583166"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="웰리힐리파크"
													target="_blank">웰리힐리파크</a>
											</dt>
											
											<dd>
												<span class="tell">1544-8833</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="강원도 횡성군 둔내면 고원로 451 성우콘도미니엄">강원도 횡성군 둔내면 고원로 451 성우콘도미니엄</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_14">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11583168"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="지산포레스트리조트"
													target="_blank">지산포레스트리조트</a>
											</dt>
											
											<dd>
												<span class="tell">031-644-1200</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="경기도 이천시 마장면 해월리 산28-1">경기도 이천시 마장면 해월리 산28-1</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_15">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=11853388"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="하이원리조트"
													target="_blank">하이원리조트</a>
											</dt>
											
											<dd>
												<span class="tell">1588-7789</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="강원도 정선군 고한읍 하이원길 424">강원도 정선군 고한읍 하이원길 424</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
									<li id="sp_local_16">
										
										<dl class="info_area">
											<dt>
												<a
													href="http://map.naver.com/local/siteview.nhn?code=13139709"
													class="tit _sp_each_url _sp_each_title"
													onclick="return goOtherCR(this, 'a=loc_alc.tit&r=2&i=11583170&g=mpi%3D11185761%3AqcC_%EC%8A%A4%ED%82%A4%EC%9E%A5&u='+urlencode(urlexpand(this.href)));"
													onmouseover="lcs_move_map_point(1);"
													onmouseout="lcs_clear_label();" title="한솔오크밸리"
													target="_blank">한솔오크밸리</a>
											</dt>
											
											<dd>
												<span class="tell">033-769-7777</span>
												<div class="ly_load">
													<div class="ly_address">
														<span class="ad_txt"
															title="강원도 원주시 지정면 오크밸리2길 58 오크밸리">강원도 원주시 지정면 오크밸리2길 58 오크밸리</span>
													</div>
												</div>
											</dd>
										</dl>
									</li>
								</ul>
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
