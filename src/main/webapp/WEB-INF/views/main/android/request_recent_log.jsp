<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"%>

<%@ page import="com.thirts.speed.SpeedVo" %>

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
	jArray.add(0, jObject2);
	jArray.add(0, jObject3);
	jArray.add(0, jObject4);
	jArray.add(0, jObject5);

        // 최종적으로 배열을 하나로 묶음
	jsonMain.put("List", jArray);
	
        // 안드로이드에 보낼 데이터를 출력
	out.println(jsonMain.toJSONString());
	
%>
