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
									<span class="pull-left">�ֱٱ��</span> 
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
							
								<span class="pull-left">��ü���</span>
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
									<span class="pull-left">��ŷ����</span> 
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
                           	IoT ���뺸��</a>
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
                                    	<ul class="nav">
                                    		<li><p>�繰 ���ͳ�(Internet of Things, ���� IoT)�� ���� �繰�� ������ ���  ����� �����Ͽ� ���ͳݿ� �����ϴ� ����� �ǹ��մϴ�.</p></li>
                                    		<li><p>�����뺸�塯��� �������� IT����� �����Ų �ַ������ ���� �� ��Ÿ ���  ������ ����Ʈ���̸� �����Ͽ� �뷱�� �� �ӵ��� �����ϴ� �ַ���Դϴ�.</p></li>
										 </ul>
										 </div>
                                </div>
                                <div class="tab-pane fade" id="free">
                                    <h4>Free Mode</h4>
                                	<ul>
                                    	<li><p>�⺻ ����, �ӵ� �˶�, �ڼ� ����, ��ġ ������ ����</p></li>
                                    	<li><p>�ӵ��� Max �̻��� �� ���� �˶�</p></li>
                                    	<li><p>�ڼ����� : 1�ʿ� 1���� Fall-down Ȯ��, Fall-down �߻��� Alarm</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="pendulum">
                                    <h4>Pendulum Mode</h4>
                                	<ul>
                                    	<li><p>���� ���� �� ���� �⺻�� �Ǵ� ��Pendulum�������� �����ϱ� ���� ���, �ʺ��ڿ� ����̴�.</p></li>
                                    	<li><p>�� ��忡�� �ӵ� �˶��� ������ �ʴ´�.</p></li>
                                    	<li><p>����ڰ� Riding �� 5�ʿ� 1���� �ڼ��� �Ǻ��Ѵ�.</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="turn">
                                    <h4>Turn Mode</h4>
                                	<ul>
                                    	<li><p>���� ���� �� �ϳ��� Turn ������ �м��ϱ� ���� ���, �߱��� �̻��� ����� ���</p></li>
                                    	<li><p>�� ����� ��� ���� �ð��� 30���̳���, 1���� Turn ������ �м��ϱ� ���� ���ȴ�. ����, ����ڴ� ���۰� �Բ� 1���� Turn ������ ���� �� ���� ��ư�� ���� �ﰢ������ �ڼ��� ������ �޴´�.</p></li>
                                    	<li><p>0.2�� �ֱ�� ����� �з°��� ����Ѵ�.</p></li>
                                    	<li><p>����ڰ� ���� ��ư�� ������ ��ϵ� �����͸� �м��Ͽ� Alarm�� �ش�.</p></li>
									</ul>    
                                </div>
                                <div class="tab-pane fade" id="record">
                                    <h4>Record Mode</h4>
                                	<ul>
                                    	<li><p>��ŷ �ý����� ���� ��� ���, Alarm ���� ���� �� �����͸� ���</p></li>
                                    	<li><p>��� ���� �� �ְ�ӵ�, ��ռӵ�, �ð�, �Ѿ��� Ƚ���� ����Ͽ� ������ �ű��.</p></li>
                                    	<li><p>�� ���� ����� ������ ���Ͽ� ����ڰ��� ��ŷ�� ������.</p></li>
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
