<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"%>

<%@ page import="com.thirts.speed.SpeedVo" %>
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
<%

	SpeedVo sv = (SpeedVo) request.getAttribute("sv");

  // 데이터를 안드로이드에서 받음
    String recvMessage = request.getParameter("id");

  // 초기 선언
	JSONObject jsonMain = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jObject1 = new JSONObject();
	JSONObject jObject2 = new JSONObject();
	JSONObject jObject3 = new JSONObject();
	JSONObject jObject4 = new JSONObject();
	JSONObject jObject5 = new JSONObject();

        // 안드로이드로 보낼 메시지를 만듬
	jObject1.put("max_v", sv.getMax_v());
	jObject2.put("average_v",sv.getAverage_v());
	jObject3.put("distance",sv.getDistance());
	jObject4.put("time",sv.getTime());
	jObject5.put("msg5", recvMessage);
	
        // 위에서 만든 각각의 객체를 하나의 배열 형태로 만듬
	jArray.add(0, jObject1);

        // 최종적으로 배열을 하나로 묶음
	jsonMain.put("List", jArray);
	
        // 안드로이드에 보낼 데이터를 출력
	out.println(jsonMain.toJSONString());
	
%>
