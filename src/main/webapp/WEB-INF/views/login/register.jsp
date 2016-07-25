<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script type="text/javascript">
	function loginCheck() {
		var form = document.newac;
		form.action = "<%=request.getContextPath()%>/register";
		form.submit();
	}
</script>

<style>
#center {
	background-image: url("resources/img/login.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>

<body>
	<div data-role="page" data-theme="a" id="center" height="wrapped">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-md-offset-4">
					<center>
						<h1 class="text-center login-title" id="title" >T H I R T S</h1>
						
						<div class="account-wall">
							<form action method="post" class="newaccount" name="newac">	
								<div id="input">
									<input id="id" name="id" type="text" class="form-control"
										placeholder="아이디" autocomplete="on" required autofocus>
									<input id="password" name="password" type="password"
										class="form-control" placeholder="비밀번호" required>
									<input id="password_check" name="password_check" type="password"
										class="form-control" placeholder="비밀번호 재확인" required>
									<input id="name" name="name" type="text"
										class="form-control" placeholder="이름" required>
								</div>
								<div id="submit">
									<button class="btn btn-lg btn-primary btn-block"
										onclick="RegisterCheck()">Register</button>
								</div>
							</form>
						</div>
					</center>
				</div>
			</div>
		</div>
	</div>
</body>
</html>