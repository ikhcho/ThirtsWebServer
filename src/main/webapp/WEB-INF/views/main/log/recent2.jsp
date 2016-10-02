<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.speed.SpeedVo" %> 
<%@ page import="com.thirts.speed.SpeedService" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thirts</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/mobile/jquery.mobile-1.4.5.min.css"
	rel="stylesheet" />
<link href="resources/mobile/jquery-ui.min.css" rel="stylesheet" />

<script src="resources/mobile/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	$(document).bind("mobileinit", function() {
		$.mobile.ajaxLinksEnabled = false;
		$.mobile.ajaxFormsEnabled = false;
		$.mobile.ajaxEnabled = false;
	});
</script>
<script src="resources/mobile/jquery.mobile-1.4.5.min.js"></script>
<script src="resources/mobile/jquery-ui.min.js"></script>
<style>
.ui-grid-a>.ui-block-a, .ui-grid-a>.ui-block-b, .ui-grid-a>.ui-block-c,
	.ui-grid-solo>.ui-block-a {
	background-color: #89e4d7;
	border: 1px solid black;
	height: 120px;
	text-align: center;
}
</style>
<!-- 위치 정보 참조 : http://doit2day.tistory.com/33-->
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js"></script>
<script>
	window.onload = function get() {
		if (navigator.geolocation) {
			navigator.geolocation.watchPosition(showPosition4);
		} else {
			var x4 = document.getElementById("geo");
			x4.innerHTML = "이 브라우저는 위치추적이 지원되지 않습니다.";
		}
	}

	function showPosition4(position) {
		var forAddress = document.getElementById("geo");
		var geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(position.coords.latitude,
				position.coords.longitude);

		geocoder.geocode({
			'latLng' : latlng
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[1]) {
					forAddress.innerHTML = results[3].formatted_address;
				}
			} else {
				alert("Geocoder failed due to: " + status);
			}
		});
	}
</script>
<!--
<script>
	function ajax() {
		$.ajax({
			type : "post",
			url : "receivedata",
			cache : false,
			async : true,
			success : function(html) {
				/* document.getElementById("time").innerHTML = html; */
				var split = html.split(',');
				document.getElementById("max").innerHTML = split[0];
				document.getElementById("average").innerHTML = split[1];
				document.getElementById("distance").innerHTML = split[2];
				document.getElementById("time").innerHTML = split[3];
			}
		});
	}
	//setInterval(ajax, 5000); 반복동작
</script>
!-->

<style type="text/css">
	#tracking_bt{
	float:right;
	width:100px;
	height:100px;
	background-image: url("resources/img/tracking.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	}
</style>
</head>
<body>
	<div data-role="page" data-theme="a">
		<div data-role="header">
			<div data-role="navbar">
				<div class="horizon">
					<div style="float: left; width: 70%;">날씨 아이콘</div>
					<div style="float: right; width: 30%">스키장이름/슬로프이름</div>
				</div>
				<a id="geo"></a>
			</div>
		</div>

		<div data-role="content">
			<div class="ui-grid-a">

				<div class="ui-block-a">시간<br/><br/>
					<h1><a >${sv.getTime()}</a></h1>
				</div>

				<div class="ui-block-b">이동 거리<br/><br/>
					<h1><a>${sv.getDistance()}</a></h1>
				</div>
				<div class="ui-block-a">평균 속도<br/><br/>
					<h1><a>${sv.getAverage_v()}</a></h1>
				</div>
				<div class="ui-block-b">최고 속도<br/><br/>
					<h1><a>${sv.getMax_v()}</a></h1>
				</div>
			</div>

			<div class="ui-grid-solo">
				<div class="ui-block-a">평점</div>
			</div>
			<div>
		<a href="<%=request.getContextPath()%>/tracking"><button id=tracking_bt></button></a>
		</div>
		</div>

		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="<%=request.getContextPath()%>/home">메인 화면</a></li>
					<li><a class="ui-btn-active"
						href="<%=request.getContextPath()%>/recent">최근 기록</a></li>
					<li><a href="<%=request.getContextPath()%>/all">전체 기록</a></li>
					<li><a href="<%=request.getContextPath()%>/community">부대
							시설</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
