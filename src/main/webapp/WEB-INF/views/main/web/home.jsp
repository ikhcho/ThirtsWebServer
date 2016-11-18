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

<script type="text/javascript">
	function profile() {
		var form = document.f;
		form.action = "profile";
		form.submit();
	}
	function device() {
		window.open("device", "�����", "width=400, height=300");
	}
	function home() {
		var form = document.f;
		form.action = "home";
		form.submit();
	}
	function recent_f() {
		var form = document.f;
		form.action = "recent_free";
		form.submit();
	}
	function recent_p() {
		var form = document.f;
		form.action = "recent_pendulum";
		form.submit();
	}
	function recent_t() {
		var form = document.f;
		form.action = "recent_turn";
		form.submit();
	}
	function recent_r() {
		var form = document.f;
		form.action = "recent_record";
		form.submit();
	}
	function all_list() {
		var form = document.f;
		form.action = "all";
		form.submit();
	}
	function rank() {
		var form = document.f;
		form.action = "rank";
		form.submit();
	}
	function community() {
		var form = document.f;
		form.action = "community";
		form.submit();
	}
</script>
  
</head>

<body>
<form method="post" class="signin" name="f">
				<input type="hidden" name="id"
					value="<%=session.getAttribute("Sid")%>">
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">T H I R T S - IoT ���뺸��</a>
				
			</div>

			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">

				<!-- ���  -->
				<li class="dropdown" style="margin-right: 30px"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user" style="margin-right: 5px">
						<%
									if (session.getAttribute("Sid") != null) {
								%> 
						<li><a onclick="profile()"  style="cursor:pointer"><i class="fa fa-user fa-fw"></i> ������</a></li>
						<li><a onclick="device()"  style="cursor:pointer"><i class="fa fa-gear fa-fw"></i> �����</a></li>
						<li class="divider"></li>
						<li><a href="login"><i class="fa fa-user fa-fw"></i> �α׾ƿ�<%
									} else {
								%> 
						
						<li><a href="login"><i class="fa fa-user fa-fw"></i>�α���<%
									}
								%></a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->
			
				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">
							
							<li><a class="btn" onclick="home()"><i
									class="fa fa-dashboard fa-fw"></i> ����ȭ��</a></li>

							<li><a class="btn"><i
									class="fa fa-bar-chart-o fa-fw"></i> �ֱٱ��</a>
								<ul class="nav nav-second-level">
									<li><a class="col-xs-offset-3 text-left " onclick="recent_f()" style="cursor:pointer">Free Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_p()" style="cursor:pointer">Pendulum Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_t()" style="cursor:pointer">Turn Mode</a></li>
									<li><a class="col-xs-offset-3 text-left" onclick="recent_r()" style="cursor:pointer">Record Mode</a></li>
								</ul></li>

							<li><a class="btn" onclick="all_list()"><i
									class="fa fa-table fa-fw"></i> ��ü���</a></li>
							<li><a class="btn" onclick="rank()"><i
									class="fa fa-trophy fa-fw"></i> ��ü��ŷ</a></li>
							<li><a class="btn" onclick="community()"><i
									class="fa fa-group fa-fw"></i> Ŀ�´�Ƽ</a></li>
							<li><a class="btn" href="login"><i
									class="fa fa-user fa-fw"></i>
									<%
										if (session.getAttribute("Sid") == null) {
									%> �α���<%
										} else {
									%> �α׾ƿ�<%
										}
									%></a></li>
						</ul>
						
						
					</div>
					<!-- /.sidebar-collapse -->
				</div>
			<!-- /.navbar-static-side -->
		</nav>
		<!--  										end navigation 								-->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<%
							if (session.getAttribute("Sname") == null) {
						%>
						IoT ���뺸�� �湮�� ȯ���մϴ�.
						<%
							}
						%>
						<%
							if (session.getAttribute("Sname") != null) {
						%>
						<%=session.getAttribute("Sname")%>�� IoT ���뺸�� �湮�� ȯ���մϴ�.
					</h1>
					<%
						}
					%>
					<!-- �̸� -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                           	IoT ���뺸�� �˾ƺ���
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                            	<li class="active"><a href="#description" data-toggle="tab">IoT ���뺸��</a>
                                </li>
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
                                    <div class="col-lg-7">
                                    <iframe width="854" height="480" src="https://www.youtube.com/embed/d6VVg4GcATs" frameborder="0" allowfullscreen></iframe>
                                    </div>
                                    	<div class="panel-body">
                                    	<ul>
                                    		<li><p>�繰 ���ͳ�(Internet of Things, ���� IoT)�� ���� �繰�� ������ ���  ����� �����Ͽ� ���ͳݿ� �����ϴ� ����� �ǹ��մϴ�.</p></li>
                                    		<li><p>�����뺸�塯��� �������� IT����� �����Ų �ַ������ ���� �� ��Ÿ ���  ������ ����Ʈ���̸� �����Ͽ� �뷱�� �� �ӵ��� �����ϴ� �ַ���Դϴ�.</p></li>
                                    		<li><p>������ ���� �ӵ�, ���, �з�, ��ġ������ �����մϴ�.</p></li>
											<li><p>�ǽð����� �ڼ��� �м��Ͽ� �Ƿ� ����� ���� ���� ������ ���񽺸� �����մϴ�. </p></li>
											<li><p>�� ������ �� �ȵ���̵� ���ø����̼��� ���� ���� ����� Ȯ���� �� �ֽ��ϴ�.</p></li>
										 </ul>
										 </div>
                                </div>
                                <div class="tab-pane fade" id="free">
                                    <h4>Free Mode��?
                                    </h4>
                                	<ul>
                                    	<li><p>�����ο� ������ �̿��� ���� �⺻ ����Դϴ�.</p></li>
                                    	<li><p>�������� �̿��ϴ� ������ �ӵ�, �ڼ�, ��ġ ������ �����մϴ�.</p></li>
									</ul>   
									
									<br/><h4>Ư¡
                                    </h4>
                                	<ul>
                                    	<li><p>���� ������ ���Ͽ� �ӵ��� 10m/s �̻��� ��� �����϶�� �˶� �޽����� ����˴ϴ�.</p></li>
                                    	<li><p>����ڰ� �Ѿ��� ��� �Ѿ����� ���� 3�ʰ��� �����͸� �м��Ͽ� �ڼ��� �������� ������ �ݴϴ�.</p></li>
                                    	<li><p>�ӵ�, �ڼ�, �Ѿ��� Ƚ���� ���� 0.0~5.0 ���� ������ å���˴ϴ�.</p></li>
									</ul>  
									 
                                </div>
                                <div class="tab-pane fade" id="pendulum">
                                    <h4>Pendulum Mode��?
                                    </h4>
                                    <ul>
                                    	<li><p>������ �⺻ ������ Pendulum ������ ���� ������ ����Դϴ�.</p></li>
                                    	<li><p>������� Pendulum ������ �м��Ͽ� �ڼ��� �������� �������մϴ�.</p></li>
									</ul>   
									
									<br/><h4>Ư¡
                                    </h4>
                                	<ul>
                                    	<li><p>Pendulum�̶�� Ư�� ������ �����ؾ� ��Ȯ�� �������� �����մϴ�.</p></li>
                                    	<li><p>5�ʸ��� ������ �м��Ͽ� �ڼ��� �������� ���� ��� �������� �������ݴϴ�.</p></li>
                                    	<li><p>�������� ������ �Բ� �ð���(1��) �����͸� Ȯ���� �� �ֽ��ϴ�.</p></li>
									</ul>  
                                </div>
                                <div class="tab-pane fade" id="turn">
                                	<h4>Turn Mode��?
                                    </h4>
                                    <ul>
                                    	<li><p>������ ��� ������ Turn ������ ���� ������ ����Դϴ�.</p></li>
                                    	<li><p>������� Turn ������ �м��Ͽ� �ڼ��� �������� �������մϴ�.</p></li>
									</ul>   
									
									<br/><h4>Ư¡
                                    </h4>
                                	<ul>
                                    	<li><p>����ڴ� ���� �� 1�г��� 1���� Turn������ �����ϰ� ����� �����ؾ� �մϴ�.</p></li>
                                    	<li><p>�ſ� ª�� �ֱ�� �ڼ��� �����ϸ� 1ȸ�� Turn���� ���� ��, ����� �Բ� �ڼ��� �м��Ͽ� �������� �������ݴϴ�.</p></li>
                                    	<li><p>�������� ������ �Բ� �ð���(0.2��) �����͸� Ȯ���� �� �ֽ��ϴ�.</p></li>
									</ul>         
                                </div>
                                <div class="tab-pane fade" id="record">
                                	<h4>Record Mode��?
                                    </h4>
                                    <ul>
                                    	<li><p>�ǽð� ������ ���� ���� ��� ������ ���� ����Դϴ�.</p></li>
                                    	<li><p>�������� �̿��ϴ� ������ �ӵ�, �ڼ�, ��ġ ������ �����ϸ� �ٸ� ������ ����� ���Ͽ� ��ŷ�� �ޱ�ϴ�.</p></li>
									</ul>   
									
									<br/><h4>Ư¡
                                    </h4>
                                	<ul>
                                    	<li><p>Ÿ ����ڵ�� ���Ͽ� �Ƿ��� ���ϰ� ������ �ް�����.</p></li>
                                    	<li><p>�ӵ� �˶� �� �ǽð� ���� �������� �������� �ʴ´�.</p></li>
                                    	<li><p>���������� �ְ�ӵ�, ��ռӵ�, ���� 3���� �׸����� ������ �ް�����.</p></li>
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
	</form>
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
