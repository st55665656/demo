<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
    String acc= (String)session.getAttribute("acc");
    String login_or_yet = "";
		if(acc == null) {
      response.setHeader("Refresh", "0;index.jsp" );
      login_or_yet = "沒登入想幹嘛啦!!!!!!!!!!";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="css_style.css"></head>
<title>新增商品</title>
</head>
<body>
  <div>
    <h1>新增商品</h1>
<form action="additem2.jsp" method="POST">
	運動:
	<SELECT name="sport_cat" size=1>
      <OPTION value ="workout" >健身</OPTION>
  		<OPTION value ="swimming" >游泳</OPTION>
  		<OPTION value ="running" >跑步</OPTION>
  		<OPTION value ="badminton" >球類</OPTION>
  		<OPTION value ="biking" >自行車</OPTION>
  		<OPTION value ="other" >其他</OPTION>
	</SELECT><br/><br/>
	種類:
	<SELECT name="cat" size=1>
    <OPTION value ="shirt" >上衣</OPTION>
		<OPTION value ="short" >短褲</OPTION>
		<OPTION value ="shoes" >鞋子</OPTION>
		<OPTION value ="accessory" >配件</OPTION>
	</SELECT><br/><br/>
	族群:
	<SELECT name="cust_cat" size=1>
		<OPTION value ="man" >男士</OPTION>
		<OPTION value ="woman" >女士</OPTION>
		<OPTION value ="child" >小孩</OPTION>
	</SELECT><br/><br/>
	價格:<input type="text" name="price" id="price" required/><br/><br/>
	數量:<input type="text" name="storage" id="storage" required/><br/><br/>
	商品名稱:<input type="text" name="name" id="name" required/><br/><br/>
	商品描述:<input type="text" name="illustration" id="illustration" required/><br/><br/>
	圖片位址:<input type="text" name="image" id="image" required/><br/><br/>


	<input type="submit" value="上傳">
  <input type="button" value="返回" class="btn btn-default" onclick="window.location='control.jsp';">
</form>
</div>
<%
  conn.close();
%>
</body>
</html>
