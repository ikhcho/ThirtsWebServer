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
	
	String[] axis = new String[0];
	
	PiVo pv = new PiVo();
	pv = LPV.get(size-1);
	axis = pv.getAxis().split(",");
	
	int size_axis = axis.length;
	
	
	
%>

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



<script src="//www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		
		var axisArr = new Array();
		<%for (int j = 2; j <size_axis; j++) {%>
		axisArr[<%=j-2%>] = <%=axis[j]%>;
		<%}%>
		
		var data = new google.visualization.DataTable();
        data.addColumn('number');
        data.addColumn('number');
        
        for (var i = 0; i < <%=size_axis%>; i++) {
			data.addRows([[-(i*i*i), axisArr[i]] ]);
		}

        var options = {
				  hAxis: {minValue: 0, maxValue: 500, gridlines:{color:'none'}, textStyle:{color:'none'}, baselineColor:'none'},
		          vAxis: {minValue: 0, maxValue: 40, gridlines:{color:'none'}, textStyle:{color:'none'}, baselineColor:'none'},
		          colors: ['red'],
		          pointSize: 4,
		          legend: 'none',
		          curveType: 'function',
		          backgroundColor : 'none',
		          orientation : 'vertical'
		        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart1'));


	      chart.draw(data, options);
		      }

	
</script>
</head>

<body>

	<div id="wrapper">

		<div class="row" id="page-wrapper">
			

			<div class="col-lg-12">
				<div class="row">
					
					<div class="col-lg-6" style="height: 500px;background-image: url('resources/img/m_slope.jpg');  background-size: cover;background-repeat: no-repeat;">
						<div id="curve_chart1" style="height: 600px;"></div>
					</div>
				
			
				
					</div>
				</div>
			</div>
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
