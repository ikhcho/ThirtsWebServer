<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.thirts.account.LoginVo" %>
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
<!DOCTYPE html>
<html lang="en">
<%
	LoginVo vo = (LoginVo) request.getAttribute("vo");
	session.setAttribute("Sid",	vo.getId());
	session.setAttribute("Sname", vo.getName());
	session.setAttribute("Smac", vo.getMacaddress());
	//response.sendRedirect("m_home");
%>

<script type="text/javascript">
$(document).ready(function() {
	if(window.android){
		console.info("android");
		window.android.callSettingsActivity('<%=session.getAttribute("Sid")%>');
		
	}
	else
		{
		alert('1');
		}
});

</script>