<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js"></script>


<!-- 위치 정보 참조 : http://doit2day.tistory.com/33-->
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
		var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude); //lat : 위도, lng : 경도
		//document.getElementById("position").innerHTML = "현재 위치 (위도 : " + position.coords.latitude + ", 경도 : " + position.coords.longitude + ")"; 

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

<!-- 날씨 정보 -->
<script type="text/javascript">
	$(function() {
		var url = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&units=metric&APPID=5ef7ab11ac97761d1f0728b1be40395e";

		$.ajax({
			url : url,
			dataType : "jsonp",
			jsonp : "callback",
			success : function(data) {
				if (data != null) {
					switch (data.weather[0].icon) {
					case '01d':
					case '02d':
					case '02n':
					case '03d':
					case '04d':
					case '09d':
					case '10d':
						var icon = "resources/img/weather/"
								+ data.weather[0].icon + ".png ";
						break;
					default:
						var icon = "http://openweathermap.org/img/w/"
								+ data.weather[0].icon + ".png ";
						break;
					}

					var city = null;
					switch (data.name) {
					case 'Tenan':
						city = '천안';
						break;
					case 'Seoul':
						city = '서울';
						break;
					case 'Daejeon':
						city = '대전';
						break;
					default:
						city = data.name;
						break;
					}

					var d = new Date();
					var html = [];
					html.push('<div>');
					html.push('<div class="weather">');
					html.push('<div class="weather-list"><h5>', '기온 : ',
							(data.main.temp).toFixed(1) + ' (℃)<br/>');
					html.push('현재날씨 : ', data.weather[0].description, '<br/>');
					html.push('</h5></div>');
					$("#weatherView1").append(html.join(''));

					var html2 = [];
					html2.push('<div>');
					html2.push('<div class="weather-list"><h5>');
					html2.push('현재시간 : ', d.toLocaleString(data.dt), '<br/>');
					html2.push('도시 : ', city, '<br/>');
					html2.push('</h5></div>');
					$("#weatherView2").append(html2.join(''));
				}
			}
		});
	});
</script>

<style>
#resolt_image {
	margin:0 auto;
	text-align:center;
	height: 100%;
	width: 100%;
}
</style>
</head>
<body>

	<div data-role="page" data-theme="a">
		<div data-role="header">
			<div data-role="navbar">
				<a id="geo"></a>
			</div>
		</div>
	<!-- <div id="position"></div>  -->

		<div data-role="content" data-inset="true">
			<div class="container">
				
				</br>
				<div id="cupload" class="breadcrumbs">
					<ol class="breadcrumb">
						<ul>
							<li><div id='weatherView1'></div></li>
							<li><div id='weatherView2'></div></li>

						</ul>
					</ol>
				</div>
			</div>
			<div id="resolt_image">
				<img class="col-xs-12 col-sm-12 col-md-12" src="resources/img/ski_main.jpg" >
			</div>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a class="ui-btn-active"
						href="<%=request.getContextPath()%>/home">메인 화면</a></li>
					<li><a href="<%=request.getContextPath()%>/recent">최근 기록</a></li>
					<li><a href="<%=request.getContextPath()%>/all">전체 기록</a></li>
					<li><a href="<%=request.getContextPath()%>/community">부대시설</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
