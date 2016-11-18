<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


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
		
		<div id="page-wrapper">
		<div class="row">
			<div class="col-xs-4">
                <a href="m_recent?id=<%=session.getAttribute("Sid")%>">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-4">
										<i class="fa fa-bar-chart-o fa-4x"></i>
									</div>
								</div>
							</div>
								<div class="panel-footer">
									<span class="text-center">최근<br/>기록</span> 
									<div class="clearfix"></div>
								</div>
						</div>
				</a>
				</div>
				<div class="col-xs-4">
				<a href="m_all?id=<%=session.getAttribute("Sid")%>">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-4">
									<i class="fa fa-th-list fa-4x"></i>
								</div>
							</div>
						</div>
							<div class="panel-footer">
							
								<span class="text-center">전체<br/>기록</span>
								<div class="clearfix"></div>
							</div>			
					</div>
				</a>
				</div>
				<div class="col-xs-4">
					<a href="m_rank?id=<%=session.getAttribute("Sid")%>">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-4">
										<i class="fa fa-trophy fa-4x"></i>
									</div>
								</div>
							</div>
								<div class="panel-footer">
									<span class="text-center">랭킹<br/>보기</span> 
									<div class="clearfix"></div>
								</div>
							</div>
					</a>
				</div>
				</div>
				
			<div class="row">
				<div class="col-lg-9">
                    <div class="panel panel-success">
                        <div class="panel-heading"><a href="#description" data-toggle="tab">
                           	IoT 스노보드</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                            	<li class="active">
                                <li><a href="#free" data-toggle="tab">Free Mode</a>
                                </li>
                                <li><a href="#pendulum" data-toggle="tab">Pendulum Mode</a>
                                </li>
                                <li><a href="#turn" data-toggle="tab">Turn Mode</a>
                                </li>
                                <li><a href="#record" data-toggle="tab">Record Mode</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                            	<div class="tab-pane fade in active" id="description">
                                    <h4>THIRTS</h4>
                                    	<div class="panel-body">
                                    	<ul>
                                    		<li><p>사물 인터넷(Internet of Things, 약어로 IoT)은 각종 사물에 센서와 통신  기능을 내장하여 인터넷에 연결하는 기술을 의미합니다.</p></li>
                                    		<li><p>‘스노보드’라는 스포츠에 IT기술을 접목시킨 솔루션으로 보드 및 기타 장비에  센서와 게이트웨이를 부착하여 밸런스 및 속도를 측정하는 솔루션입니다.</p></li>
                                    		<li><p>센서를 통해 속도, 모션, 압력, 위치정보를 수집합니다.</p></li>
											<li><p>실시간으로 자세를 분석하여 실력 향상을 위한 음성 컨설팅 서비스를 제공합니다. </p></li>
											<li><p>웹 브라우저 및 안드로이드 어플리케이션을 통해 개인 기록을 확인할 수 있습니다.</p></li>
										 </ul>
										 </div>
                                </div>
                                <div class="tab-pane fade" id="free">
                                    <h4>Free Mode란?
                                    </h4>
                                	<ul>
                                    	<li><p>자유로운 슬로프 이용을 위한 기본 모드입니다.</p></li>
                                    	<li><p>슬로프를 이용하는 동안의 속도, 자세, 위치 정보를 수집합니다.</p></li>
									</ul>   
									
									<br/><h4>특징
                                    </h4>
                                	<ul>
                                    	<li><p>과속 방지를 위하여 속도가 10m/s 이상일 경우 감속하라는 알람 메시지가 실행됩니다.</p></li>
                                    	<li><p>사용자가 넘어질 경우 넘어지기 직전 3초간의 데이터를 분석하여 자세의 문제점을 지적해 줍니다.</p></li>
                                    	<li><p>속도, 자세, 넘어진 횟수를 통해 0.0~5.0 까지 평점이 책정됩니다.</p></li>
									</ul>  
									     
                                </div>
                                <div class="tab-pane fade" id="pendulum">
                                    <h4>Pendulum Mode란?
                                    </h4>
                                    <ul>
                                    	<li><p>보드의 기본 동작인 Pendulum 동작을 위한 교육용 모드입니다.</p></li>
                                    	<li><p>사용자의 Pendulum 동작을 분석하여 자세의 문제점을 컨설팅합니다.</p></li>
									</ul>   
									
									<br/><h4>특징
                                    </h4>
                                	<ul>
                                    	<li><p>Pendulum이라는 특정 동작을 수행해야 정확한 컨설팅이 가능합니다.</p></li>
                                    	<li><p>5초마다 동작을 분석하여 자세에 문제점이 있을 경우 문제점을 지적해줍니다.</p></li>
                                    	<li><p>슬로프의 동선과 함께 시간별(1초) 데이터를 확인할 수 있습니다.</p></li>
									</ul>     
                                </div>
                                <div class="tab-pane fade" id="turn">
                                    <h4>Turn Mode란?
                                    </h4>
                                    <ul>
                                    	<li><p>보드의 고급 동작인 Turn 동작을 위한 교육용 모드입니다.</p></li>
                                    	<li><p>사용자의 Turn 동작을 분석하여 자세의 문제점을 컨설팅합니다.</p></li>
									</ul>   
									
									<br/><h4>특징
                                    </h4>
                                	<ul>
                                    	<li><p>사용자는 시작 후 1분내에 1번의 Turn동작을 수행하고 사용을 종료해야 합니다.</p></li>
                                    	<li><p>매우 짧은 주기로 자세를 측정하며 1회의 Turn동작 수행 후, 종료와 함께 자세를 분석하여 문제점을 지적해줍니다.</p></li>
                                    	<li><p>슬로프의 동선과 함께 시간별(0.2초) 데이터를 확인할 수 있습니다.</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="record">
                                    <h4>Record Mode란?
                                    </h4>
                                    <ul>
                                    	<li><p>실시간 컨설팅 서비스 없이 기록 갱신을 위한 모드입니다.</p></li>
                                    	<li><p>슬로프를 이용하는 동안의 속도, 자세, 위치 정보를 수집하며 다른 유저와 기록을 비교하여 랭킹을 메깁니다.</p></li>
									</ul>   
									
									<br/><h4>특징
                                    </h4>
                                	<ul>
                                    	<li><p>타 사용자들과 비교하여 실력을 평가하고 순위가 메겨진다.</p></li>
                                    	<li><p>속도 알람 및 실시간 음성 컨설팅을 지원하지 않는다.</p></li>
                                    	<li><p>슬로프별로 최고속도, 평균속도, 평점 3가지 항목으로 순위가 메겨진다.</p></li>
									</ul>        
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
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

	<!-- Morris Charts JavaScript -->
	<script
		src="resources/bootstrap/bower_components/raphael/raphael-min.js"></script>
	<script
		src="resources/bootstrap/bower_components/morrisjs/morris.min.js"></script>
	<script src="resources/bootstrap/js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/bootstrap/dist/js/sb-admin-2.js"></script>
</body>

</html>
