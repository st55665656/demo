<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db_ini.jsp"%>
<%
	String Iid = request.getParameter("Iid");
	Statement stmt = null;
	ResultSet rs = null;
	stmt = con.createStatement();
	
	String query = "SELECT * FROM item where Iid = "+Iid;
	stmt.executeQuery(query);
	rs = stmt.getResultSet();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>建立帳號</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="dist/sweetalert.min.js"></script>
	<link href="dist/sweetalert.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
      $("#includedContent").load("top.jsp"); 
    });
	</script>
<style>
body{font-family:微軟正黑體;list-style-type:none;}
.dropbtn {
    color: black;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
		margin-left:0px;
	  font-weight: bold;
		padding: 15px 20px 15px 20px  ;
  background-color: #ededed;
}

.dropdown {
    position: relative;
    display: inline-block;
	
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #0082c3;
	color: white;
	font-weight: bold;
}
.mycontent-left {
  border-right: 1px dashed #333;
}
.card:hover{
	border: #00aeef 1px solid;
}
li > a{
	color: white;
}

.container{padding-left: 10px;}


.col-md-8{border: 1px solid #e2e2e2;font-size:16px; padding: 20px; margin-left:30px; margin-top: 30px;width: 650px}
hr{border-top: 1px solid #8c8b8b;text-align: center;}
input[type="range"]{
	display: inline;
  -webkit-appearance:none;
  width:200px;
  height:2px;
  background: #ccc;
  background-position:center;
  background-repeat:no-repeat;
  position: relative;
}

input[type="range"]::-webkit-slider-thumb{
  -webkit-appearance:none;
  width:20px;
  height:20px;
  border-radius: 100%;
  background: #0172b8;
  position:relative;
  border: 3px solid #ccc;
  cursor: pointer;
}

</style>
<script>
	$(document).ready(function() {
		$( "#addbtn" ).click(function() {
			var findstorage = $('#addid').val();
			var q = $('#q').val();
			var n = $('#n').html();
			swal("你將"+q+"件"+n+"放入購物車。");
			$.post("cart.jsp",
				{ find: findstorage, quan: q },
				function(response){
					var x = parseInt(response.trim(), 10);
				});
		});
	});
	function showValue(newValue)
	{
		document.getElementById("range").innerHTML=newValue;
	}
</script>
</head>
<body>
<div id="includedContent"></div>
<div class="container">
	<%
		if (rs != null){
		  while(rs.next()){
			String sport_cat = rs.getString("sport_cat");
			String cat = rs.getString("cat");
			String cust_cat = rs.getString("cust_cat");
			String price = rs.getString("price");
			String storage = rs.getString("storage");
			String name = rs.getString("name");
			String illustration = rs.getString("illustration");
			String image = rs.getString("image");
	%>
	<div class="col-md-8" style="border: 1px solid #e2e2e2;">
		<img src="<%=image%>" width="400px" style="padding:20px;"><br>商品說明<br>
		<hr></hr>
		<h4><%=illustration%></h4>
	</div>
	<div class="col-md-4" style="border: 1px solid #e2e2e2;">
		<div class="row" style="border: 1px solid #e2e2e2; padding-left:20px;margin-left:20px;margin-top: 30px;">
			<p style="float:right; padding:20px;">商品編號:<%=Iid%></p>
			<h3 style="font-weight:bold;" id="n"><%=name%></h3>
			<h2 style="color:#666;">售價: NT$<%=price%></h2>
			庫存狀態:<p>尚餘(<%=storage%>)</p>
			<input type="hidden" value=<%=Iid%> id="addid">
			<input type="range" min="0" max="<%=storage%>" value="0" step="1" onchange="showValue(this.value)" id="q"/>
			<br><br>選擇數量:<span id="range">0</span><br><br>
			<button class="btn btn-primary btn-lg" id="addbtn"  style="margin-bottom:20px">加入購物車</button>
		</div>
	</div>
	<%
		}}
		stmt.close();
		rs.close();
		con.close();
	%>
</div>
<br><br>
</body>
</html>
