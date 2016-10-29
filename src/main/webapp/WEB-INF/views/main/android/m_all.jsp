<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.speed.SpeedVo"%>
<%@ page import="com.thirts.speed.SpeedService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<%
	// 도표
	List<SpeedVo> LSV = (List<SpeedVo>)request.getAttribute("lsv");
	int size = LSV.size();
	
	String[] date = new String[size];
	
	String[] score = new String[size];
	String[] count = new String[size];
	int index=0;
	String[] tmpDate={};
	
	SpeedVo sv = new SpeedVo();
	if(LSV.toString().equals("[null]"))
	{
		String state = "no data";
	}
	else
	{
		for(int v=0; v <size; v++)
		{
			sv = LSV.get(v);
			
			score[index] =sv.getScore();
			count[index++] =sv.getCount();
		}	
	}
	
	// 선택한 데이터
	String[] speed={};
	String[] gyro={};
	String[] falldown={};
	String[] FRF={};
	String[] FRB={};
	String[] yaw={};
	
	int time=60;
	SpeedVo select_sv = new SpeedVo();
	if(request.getParameter("num") != null)
	{
		if(request.getAttribute("osv") != null)
		{
			select_sv = (SpeedVo) request.getAttribute("osv");
			if(select_sv.getMode().equals("T"))
			{
				String[] tmp_fsr={};
				tmp_fsr = select_sv.getFalldown().split(",");
				yaw = select_sv.getSpeed().split(",");
				gyro = select_sv.getGyro().split(",");
				
				FRF = select_sv.getFalldown().split(",");
				FRB = select_sv.getFalldown().split(",");
				
				time = yaw.length;
				int j=1;
				FRF[0] = "S";
				FRB[0] = "S";
				
				for(int i=1; i<time; i+=2 )
				{
					FRF[j] = tmp_fsr[i];
					FRB[j] = tmp_fsr[i+1];
					j++;
				}
				
				for (int i = 1; i < time; i++) {
					if (gyro[i].equals("H")) {
						gyro[i] = "-10";
					}
					if (gyro[i].equals("E") || gyro[i].equals("B")) {
						gyro[i] = "-20";
					}
					if (gyro[i].equals("L")) {
						gyro[i] = "-30";
					}
				}
			}
			else
			{
				speed = select_sv.getSpeed().split(",");
				gyro = select_sv.getGyro().split(",");
				falldown = select_sv.getFalldown().split(",");
				time = speed.length;
				for (int i = 1; i < time; i++) {
					if (gyro[i].equals("H")) {
						gyro[i] = "-10";
					}
					if (gyro[i].equals("E") || gyro[i].equals("B")) {
						gyro[i] = "-20";
					}
					if (gyro[i].equals("L")) {
						gyro[i] = "-30";
					}
					if (falldown[i].equals("E")) {
						falldown[i] = "-50";
					}
					if (falldown[i].equals("F")) {
						falldown[i] = "-40";
					}
				}
			}
		}
	}	
	
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

</head>

<body>
	<div id="wrapper">
		<div id="page-wrapper" class="row">
			

			<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	전체기록 테이블
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                        	<th style="width:W0px">모드</th>
                                            <th style="width:30px">날짜</th>
                                            <th >기록</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                        <c:forEach var="val" items="${lsv}">
                                        <tr>
                                        	
	                                        	<td><a href="all?id=<%=session.getAttribute("Sid") %>num=${val.num}">${val.mode}</a></td>
	                                        	<td>${val.date}</td>
	                                        	<td>최고속도 : ${val.max_v}m/s<br/>
	                                        		평균속도 : ${val.average_v}m/s<br/>

	                                        		이동거리 : ${val.distance}M<br/>
	                                        		  시   간  : ${val.time}초<br/>
	                                        		  평   점  : ${val.score}점<br/>
	                                        	   	넘어진횟수 : ${val.count}번<br/>
	                                        		 슬 로 프 : ${val.location}<br/>
	                                        	</td>
	                                        	
                                        </tr>
                                       </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
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
 	
 	<!-- DataTables JavaScript -->
    <script src="resources/bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="resources/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>

</html>
