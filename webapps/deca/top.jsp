<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String abc =(String)session.getAttribute("a");
%>
<script>

	if("<%=abc%>" == "null"){
		document.getElementById("register").innerHTML = "登入";
		$("#register").attr("href","login.jsp");
	}
	if("<%=abc%>" != null && "<%=abc%>" != "null"){
		document.getElementById("register").innerHTML = "<%=abc%>登出　";
		$("#register").attr("href","clear.jsp");
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<div class="container-fluid" style="background-color:#00b2f5;height:20px;">
<div class="container">
<div class="row" style="color:white;">
	<div class="col-md-9">
		<p>【宅配單筆滿$1500免運(大型商品除外)，7-11取貨滿$699免運，門市取貨全面免運】 建議使用Chrome瀏覽器登入註冊</p>
	</div>
	<div class="col-md-3">
		<ul class="list-unstyled">
			<li><a href="create.jsp" style="float: right;">註冊</a></li>
			<li><a href="login.jsp" id="register" style="float: right;">登入</a></li>
		</ul>
	</div>
</div>
</div>
</div>
<div class="container" style="background-color:black;height:60px;">
<div style="margin-top: 11px;margin-bottom:20px"><a href="index.jsp"><img src="logo.jpg"></a></div>
</div>
<div class="container" style="background-color:#ededed;">
	<div class="dropdown">
		<button class="dropbtn">運動</button>
		<div class="dropdown-content">
			<ul>
				<div class="row" style="width: 400px;">
					<ul class="list-unstyled col-md-4" >
						<li><a href="test.jsp?a=workout&b=0&c=0&d=1">健身</a></li>
						<li><a href="test.jsp?a=swimming&b=0&c=0&d=1">游泳</a></li>
						<li><a href="test.jsp?a=running&b=0&c=0&d=1">跑步</a></li>
						<li><a href="test.jsp?a=badminton&b=0&c=0&d=1">球類</a></li>
						<li><a href="test.jsp?a=biking&b=0&c=0&d=1">自行車</a></li>
						<li><a href="test.jsp?a=other&b=0&c=0&d=1">其他</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">男士</button>
		<div class="dropdown-content">
			<ul>
				<div class="row" style="width: 400px;">
					<ul class="list-unstyled col-md-4">
						<li><a href="test.jsp?a=0&b=shirt&c=man&d=2">上衣</a></li>
						<li><a href="test.jsp?a=0&b=short&c=man&d=2">褲子</a></li>
						<li><a href="test.jsp?a=0&b=shoes&c=man&d=2">鞋子</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">女士</button>
		<div class="dropdown-content">
			<ul>
				<div class="row" style="width: 400px;">
					<ul class="list-unstyled col-md-4">
						<li><a href="test.jsp?a=0&b=shirt&c=woman&d=2">上衣</a></li>
						<li><a href="test.jsp?a=0&b=short&c=woman&d=2">褲子</a></li>
						<li><a href="test.jsp?a=0&b=shoes&c=woman&d=2">鞋子</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">小孩</button>
		<div class="dropdown-content">
			<ul>
				<div class="row" style="width: 400px;">
					<ul class="list-unstyled col-md-4">
						<li><a href="test.jsp?a=0&b=shirt&c=child&d=2">上衣</a></li>
						<li><a href="test.jsp?a=0&b=short&c=child&d=2">褲子</a></li>
						<li><a href="test.jsp?a=0&b=shoes&c=child&d=2">鞋子</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	<div class="dropdown" style="float: right">
		<button class="dropbtn" id="cart">購物車</button>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#cart").click(function(){
		window.open("shoppingcart.jsp","_self");
	});
});
</script>
