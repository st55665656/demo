<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<%
  session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Home</title>
	<!-- 最新編譯和最佳化的 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
	<!-- 選擇性佈景主題 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
	<!-- 最新編譯和最佳化的 JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css_style.css">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
		function Bye() {
			$("#index").hide();
			$("#register").fadeIn();
		}

		function Bye2() {
			$("#index").fadeIn();
			$("#register").hide();
		}
	</script>

</head>

<body>

	<div id="index"　class="container">
		<h1>迪　卡　稱</h1>
		<form id="person" method="post" action="login.jsp">
			帳號：<input type="text" name="ac" class="form-control" placeholder="請輸入帳號" required /><br>
			密碼：<input type="text" name="pa" class="form-control" placeholder="請輸入密碼" required /> <br>
			<input type="button" value="註冊" onclick="Bye()">
			<input type="submit" name="submitt" value="登入"><br>
		</form>
	</div>

	<div id="register" style="display:none">
		<h1>註　冊</h1>
		<form id="person2" method="post" action="register.jsp">
			帳號：<input type="text" name="reac" class="form-control" placeholder="請輸入帳號" required /><br>
			密碼：<input type="text" name="repa" class="form-control" placeholder="請輸入密碼" required /><br>
			姓名：<input type="text" name="rena" class="form-control" placeholder="請輸入姓名" required /><br>
			Birthday:<input type="date" name="rebir" required /><br/><br/>
			memo:<input type="textarea" class="form-control" name="rememo" required /><br/><br/>
			<input type="submit" value="確認註冊">
			<input type="button" value="返回主畫面" onclick="Bye2()"><br>
		</form>
	</div>

</body>

</html>
