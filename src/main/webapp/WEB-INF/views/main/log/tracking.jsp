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

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/mobile/jquery.mobile-1.4.5.min.css"
	rel="stylesheet" />
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

</script>

</head>
<body>
	<div>여기는 동선확인 페이지입니다.</div>
	<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a class="ui-btn-active"
						href="<%=request.getContextPath()%>/home">메인 화면</a></li>
					<li><a href="<%=request.getContextPath()%>/recent">최근 기록</a></li>
					<li><a href="<%=request.getContextPath()%>/all">전체 기록</a></li>
					<li><a href="<%=request.getContextPath()%>/community">부대
							시설</a></li>
				</ul>
			</div>
		</div>
		
</body>
</html>
