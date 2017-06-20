<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
    String acc= (String)session.getAttribute("acc");

      String h_count[]= new String[100];
      for(int i=0; i<100 ;i++){
        h_count[i] = "hello";
      }
      for(int i=0; i<10 ;i++){
        h_count[i] = "ello";
      }


    session.setAttribute("obj_h",h_count);


		String login_or_yet = "";
		if(acc == null) {
      response.setHeader("Refresh", "0;index.jsp" );
      login_or_yet = "沒登入想幹嘛啦!!!!!!!!!!";
    }
%>
<!DOCTYPE html>
<html>
	<!-- 最新編譯和最佳化的 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
	<!-- 選擇性佈景主題 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
	<!-- 最新編譯和最佳化的 JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Control</title>
	<link rel="stylesheet" type="text/css" href="css_style.css">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
</head>
<body>
	<h1><%=login_or_yet%> </h1>
	<div id="choice">
		<h1>Hello!  </h1>
		<form id="control_panel" method="post" action="stock.jsp">
			<br>
			<input type="submit" name="submit_instock" value="查詢庫存" class="btn btn-success">　　
			<input type="button" name="submit_additem" value="新增商品" onclick="window.location='additem.jsp';" class="btn btn-danger"><br><br>
      <input type="button" name="submit_additem" value="查看訂單" onclick="window.location='ch_ord.jsp';" class="btn btn-info">　　
			<input type="button" name="submit_member" value="會員資料" onclick="window.location='member.jsp';" class="btn btn-warning"><br><br>
			<input type="button" value="登出" class="btn btn-default" onclick="window.location='index.jsp'"><br>
		</form>
	</div>

</body>

</html>
