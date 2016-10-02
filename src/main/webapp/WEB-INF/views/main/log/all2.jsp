<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="com.thirts.speed.SpeedVo" %> 
<%@ page import="com.thirts.speed.SpeedService" %> 
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thirts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    <link href="resources/css/font-awesome.css" rel="stylesheet">

	<link href="resources/mobile/jquery.mobile-1.4.5.min.css" rel="stylesheet" />
	<link href="resources/mobile/jquery-ui.min.css" rel="stylesheet" />
	
	<script src="resources/mobile/jquery-2.1.3.min.js"></script>
	<script type="text/javascript">
	$(document).bind("mobileinit", function(){
		$.mobile.ajaxLinksEnabled = false;
		$.mobile.ajaxFormsEnabled = false;
		$.mobile.ajaxEnabled = false;
	});
	</script>
	<script src="resources/mobile/jquery.mobile-1.4.5.min.js"></script>
	<script src="resources/mobile/jquery-ui.min.js"></script>
	
	<!-- 위치 정보 참조 : http://doit2day.tistory.com/33-->
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js"></script>
	<script>
	window.onload=function get() {
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
		var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		
		geocoder.geocode({'latLng' : latlng}, function(results, status){
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
	
</head>
<body>
 <div data-role="page" data-theme="a">
	<div data-role="header">
		<div data-role="navbar">
			<a id="geo"></a>
		</div>
	</div>

	<ul data-role="listview">
		<c:forEach var="val" items="${sv}">
		<div>시간 : ${val.time}, 이동 거리 : ${val.distance}, 평균 속도 : ${val.average_v}, 최고 속도 : ${val.max_v}</div>
		</c:forEach>

	</ul>
		
	<div data-role="footer" data-position="fixed">
		<div data-role="navbar">					
			<ul>
				<li><a href="<%=request.getContextPath()%>/index">메인 화면</a></li>
				<li><a href="<%=request.getContextPath()%>/recent">최근 기록</a></li>
				<li><a class="ui-btn-active" href="<%=request.getContextPath()%>/all">전체 기록</a></li>
				<li><a href="<%=request.getContextPath()%>/community">부대 시설</a></li>
			</ul>					
		</div>		
	</div>
</div> 
	
</body>
</html>
