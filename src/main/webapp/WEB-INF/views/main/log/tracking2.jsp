<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.pi.PiVo"%>
<%@ page import="com.thirts.pi.PiService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<% 
	List<PiVo> LPV = (List<PiVo>)request.getAttribute("lpv");
	int size = LPV.size();
	
	String[][] axis = new String[size][40];
	
	PiVo pv = new PiVo();
	pv = LPV.get(size-34);
	axis[0] = pv.getAxis().split(",");
	
	int size_axis = axis[0].length;
	
	String[] axis_x = new String[size_axis/2];
	String[] axis_y = new String[size_axis/2];
	
	for(int i=0; i < size_axis/2; i++)
	{
		axis_x[i] = axis[0][(2*i)];
		axis_y[i] = axis[0][1+(2*i)];
	}
	
	PiVo fingervo = new PiVo();
	String[][] cell_count = new String[25][25];
	for(int j=0; j <25; j++ )
	{
		fingervo = LPV.get(size-25+j);
		cell_count[j] = fingervo.getBeacon3().split(",");
		System.out.println(cell_count[j]);
	}
	
	
	
%>

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



<script src="//www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var xArr = new Array();
		<%for (int j = 1; j < size_axis/2; j++) {%>
		xArr[<%=j%>] = <%=axis_x[j]%>;
		<%}%>
		
		var yArr = new Array();
		<%for (int j = 1; j <size_axis/2; j++) {%>
		yArr[<%=j%>] = <%=axis_y[j]%>;
		<%}%>
		
		var data = new google.visualization.DataTable();
        data.addColumn('number', 'x축');
        data.addColumn('number', 'y축');
        
        for (var i = 1; i < <%=size_axis/2%>; i++) {
			data.addRows([[ xArr[i], yArr[i]] ]);
		}

		var options = {
		          hAxis: {title: 'x축', minValue: 0, maxValue: 500},
		          vAxis: {title: 'y축', minValue: 0, maxValue: 500},
		          colors: ['red'],
		          pointShape: 'star',
		          pointSize: 24,
		          legend: 'none',
		          backgroundColor : 'none',
		          annotations:{
		        	  boxStyle:{
		        		  stroke: '#444',
		        		  strokeWidth: 10,
		        		  gradient: {
		        			  color1: '#fbf6a7',
		        			  useObjectBoundingBoxUnits: false
		        		  }
		        		  
		        	  }
		        	  
		          }
		        };

		var chart = new google.visualization.ScatterChart(document.getElementById('animatedshapes_div'));


	      chart.draw(data, options);
		      }

	
</script>

<html>
	<body>
					<div class="col-lg-6"">
						<div id="animatedshapes_div" style="height: 700px;background-image: url('resources/img/slope_detail.jpg');  background-size: contain;background-repeat: no-repeat;"></div>
					</div>
					
					

	<!-- jQuery -->
	<script
		src="resources/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="resources/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="resources/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!--
	<script
		src="resources/bootstrap/bower_components/raphael/raphael-min.js"></script>
	<script
		src="resources/bootstrap/bower_components/morrisjs/morris.min.js"></script>
	<script src="resources/bootstrap/js/morris-data.js"></script>
	 Morris Charts JavaScript -->

	<!-- Flot Charts JavaScript -->
	<script src="resources/bootstrap/bower_components/flot/excanvas.min.js"></script>
	<script src="resources/bootstrap/bower_components/flot/jquery.flot.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot/jquery.flot.pie.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot/jquery.flot.resize.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot/jquery.flot.time.js"></script>
	<script
		src="resources/bootstrap/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	<script src="resources/bootstrap/js/flot-data.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>
</body>
</html>
		
					
					